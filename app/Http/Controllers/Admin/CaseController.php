<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\matterContributor;
use App\Models\matter;
use App\Models\categorie;
use App\Models\countrie;
use App\Models\state;
use App\Models\city;
use App\Models\matterUpdate;
use App\Models\matterUpdateAttachment;
use App\Models\matterAttachment;
use  App\Models\userViews;
use App\Http\Controllers\SendPushNotification;
use App\Models\Provider;
use App\Models\follower;
use DataTables;
use Validator;



class CaseController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $categorie = categorie::get();
        $country = matter::select('country')->distinct()->get();
         $city = matter::select('city','country')->distinct('city')->get();
        $status = matter::select('status')->where('status','!=','Deleted')->distinct()->get(); 
   
        return view('admin.caseList',compact('categorie','country','city','status'));   
    }
     public function getCases(Request $request)
    {

        if(isset($request->from) || isset($request->to) || isset($request->category) || isset($request->country) || isset($request->city) || isset($request->status))
        {
          
            $start = date("Y-m-d",strtotime($request->input('from')));
            $end = date("Y-m-d",strtotime($request->input('to')."+1 day"));
            $users=matter::orderBy('id', 'DESC')->whereBetween('created_at',[$start, $end])->with('initiator','category','views');
            
            if(isset($request->category))
            {
                $users->where("categorie_id",$request->category);
            }
            if(isset($request->country))
            {
                $users->where("country",$request->country);
            }
            if(isset($request->city))
            {
                $users->where("city",$request->city);
            }
         
            if(isset($request->status))
            {
                $users->where("status",$request->status);
            }
            $users = $users->get();


            return Datatables::of($users)->editColumn('created_at', function ($user) 
            {
                return date('m-d-Y', strtotime($user->created_at) );
            })
            ->editColumn('total_views', function ($user) 
            {
                return userViews::where('matter_id',$user->id)->count();
            })
            ->make(true);
        }
        else
        {
            $users=matter::orderBy('id', 'DESC')->with('initiator','category')->get();
            return Datatables::of($users)->editColumn('created_at', function ($user) 
            {
                return date('m-d-Y', strtotime($user->created_at) );
            })
            ->editColumn('total_views', function ($user) 
            {
                return userViews::where('matter_id',$user->id)->count();
            })
            ->make(true);
        }
    }
    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $categorie = categorie::where('status',1)->get();
        $countrie = countrie::where('status',1)->get();
        $state = state::where('status',1)->get();  
        $city = city::where('status',1)->get();
        $user = Provider::where('status',1)->where('otp_verified',1)->where('document_verified',1)->get();
        return view('admin.caseCreate',compact('countrie','state','categorie','user','city'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
         $validator = Validator::make($request->all(), [
            'title' => 'required_if:title_ar,=,null|string|between:2,100|nullable',
            'title_ar' => 'required_if:title,,=,null|string|between:2,100|nullable',
            'national_number' => 'required|max:255',
             'country' => 'required_if:country_ar,=,null|integer',
            'city' => 'required_if:city_ar,=,null|integer',    
            'state' => 'required|integer',   
            'description' => 'required_if:description_ar,=,null|string|between:2,5000|nullable',
            'description_ar' => 'required_if:description,=,null|string|between:2,5000|nullable',
            'national_certificate' => 'required|mimes:jpeg,jpg,png,gif,pdf|max:5120',
            'goal' => 'required|between:0,999999999999999.99999999',
               'categorie_id' => 'required|exists:categories,id', 
           'attachment' => 'required|array|max:5', // <----
            'attachment.*' => 'mimes:jpeg,jpg,png,gif,pdf|max:5120',
                'end_date' => 'required|date_format:Y-m-d',
        ]);
        if ($validator->fails()) {

            return \Redirect::back()->withInput()->withErrors($validator);
        }

         $matter = new matter;
        $matter->title = $request->title;
        $matter->title_ar = $request->title_ar;
        $matter->national_number = $request->national_number;
   
        $countrie = countrie::where('id',$request->country)->pluck('title')->first();
        $state = state::where('id',$request->state)->pluck('title')->first();  
        $city = city::where('id',$request->city)->pluck('title')->first();


        $matter->country = $countrie;

        $matter->city =$city;
     
        $matter->description = $request->description;
        $matter->description_ar = $request->description_ar;
        $matter->goal = $request->goal;

        $matter->provider_id  =  $request->provider_id;
        $matter->categorie_id  = $request->categorie_id ;
            $matter->end_date  = $request->end_date ;
              $matter->state  = $state ;
        $serial_no = categorie::find($request->categorie_id)->pluck('serial_no')->first();      
        $matter->serial_no = $serial_no.rand(1000,9999);      
        if ($request->hasFile('national_certificate'))
        {
            $matter->national_certificate = $request->national_certificate->store('public/case-document');
        }

        $matter->save();
        if ($request->hasFile('attachment'))
        {
            $images = $request->file('attachment');
            foreach($images as $image) {
                
                $matterAttachment = new matterAttachment;
                $matterAttachment->matter_id =$matter->id;
                $matterAttachment->attachment =$image->store('public/case-document');
                $matterAttachment->save();
            }
        }
        $message = "New Case Added By Admin";
        (new SendPushNotification)->caseAddedByProvider($matter,$message);
           session()->flash('success', 'Data Saved Successfully.');
        return redirect('/admin/case');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
         $user = matter::find($id); 
         $categorie = categorie::where('status',1)->get();
        $countrie = countrie::where('status',1)->get();
        $state = state::where('status',1)->get();  
        $city = city::where('status',1)->get();
        $initiator = Provider::where('status',1)->where('otp_verified',1)->where('document_verified',1)->get();
        return view('admin.caseView',compact('user','categorie','countrie','state','city','initiator'));  
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
          $user = matter::find($id); 
          return view('admin.caseEdit',compact('user')); 
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
       $validator = Validator::make($request->all(), [
            'description' => 'required_without:description_ar|string|between:2,5000',
            'description_ar' => 'required_without:description|string|between:2,5000',
            // 'matter_id' => 'required|exists:matters,id', 
             'attachment' => 'required|array|max:5', // <----
            'attachment.*' => 'mimes:jpeg,jpg,png,gif,pdf|max:5120',

        ]);
       if ($validator->fails()) {

            return \Redirect::back()->withInput()->withErrors($validator);
        }
        $matter =  matter::find($id);
        $matterUpdate = new matterUpdate;
        $matterUpdate->provider_id = $matter->provider_id; 
        $matterUpdate->categorie_id  = $matter->categorie_id;
        $matterUpdate->matter_id  = $id;
        $matterUpdate->description  = $request->description;
        $matterUpdate->description_ar  = $request->description_ar;
        $matterUpdate->save();
        if ($request->hasFile('attachment'))
        {
            $images = $request->file('attachment');
            foreach($images as $image) {
                
                $matterAttachment = new matterUpdateAttachment;
                $matterAttachment->matter_update_id =$matterUpdate->id;
                $matterAttachment->attachment =$image->store('public/case-document');
                $matterAttachment->save();
            }
        }
        $matterContributor = matterContributor::where('matter_id',$request->matter_id)->get();
        foreach ($matterContributor as $key => $value) {
             $message = "Case Updated By Initiator";
            (new SendPushNotification)->caseUpdatedByProvider($value,$message,$matter->categorie_id,$matter);
        }

        $follower = follower::where("provider_id",$matter->provider_id)->get();
         foreach ($follower as $key => $value) {
             $message = "Case Updated By Initiator";
            (new SendPushNotification)->caseUpdatedByProviderFollower($value,$message,$matter->categorie_id,$matter);
        }
        session()->flash('success', 'Data Saved Successfully.');
        return redirect('/admin/case');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function updateCaseDetails(Request $request, $id)
    {
        
       $validator = Validator::make($request->all(), [
            'title' => 'required_if:title_ar,=,null|string|between:2,100|nullable',
            'title_ar' => 'required_if:title,,=,null|string|between:2,100|nullable',
            'national_number' => 'required|max:255',
             'country' => 'required_if:country_ar,=,null|integer',
            'city' => 'required_if:city_ar,=,null|integer',    
            'state' => 'required|integer',   
            'description' => 'required_if:description_ar,=,null|string|between:2,5000|nullable',
            'description_ar' => 'required_if:description,=,null|string|between:2,5000|nullable',
            'national_certificate' => 'mimes:jpeg,jpg,png,gif,pdf|max:5120',
            'goal' => 'required|between:0,999999999999999.99999999',
               'categorie_id' => 'required|exists:categories,id', 
           'attachment' => 'array|max:5', // <----
            'attachment.*' => 'mimes:jpeg,jpg,png,gif,pdf|max:5120',
                'end_date' => 'required|date_format:Y-m-d',
        ]);
        if ($validator->fails()) {

            return \Redirect::back()->withInput()->withErrors($validator);
        }

         $matter =  matter::find($id);
         
        $matter->title = $request->title;
        $matter->title_ar = $request->title_ar;
        $matter->national_number = $request->national_number;
   
        $countrie = countrie::where('id',$request->country)->pluck('title')->first();
        $state = state::where('id',$request->state)->pluck('title')->first();  
        $city = city::where('id',$request->city)->pluck('title')->first();


        $matter->country = $countrie;

        $matter->city =$city;
     
        $matter->description = $request->description;
        $matter->description_ar = $request->description_ar;
        $matter->goal = $request->goal;

        $matter->provider_id  =  $request->provider_id;
        $matter->categorie_id  = $request->categorie_id ;
            $matter->end_date  = $request->end_date ;
              $matter->state  = $state ;
        if($request->has('close_case') && $request->close_case == "1")
        {
            $matter->status  = "Closed" ;

            $matterContributor = matterContributor::where('matter_id',$matter->id)->get();
                foreach ($matterContributor as $key => $value) {
                    $message = $matter->title." Case was Closed By admin";
                    (new SendPushNotification)->caseClosedAdmin($value,$message,$matter->categorie_id,$matter);
                }
            $follower = follower::where("provider_id",$matter->provider_id)->get();
                foreach ($follower as $key => $value) {
                 $message = $matter->title." Case was Closed By admin";
                    (new SendPushNotification)->caseClosedAdminFollower($value,$message,$matter->categorie_id,$matter);
            }    


        }      
        if ($request->hasFile('national_certificate'))
        {
            $matter->national_certificate = $request->national_certificate->store('public/case-document');
        }

        $matter->save();

        if ($request->hasFile('attachment'))
        {
            if(!empty($request->attachment[4]))
            {
                 $image = $request->attachment[4];
               
                if(!empty($matter->attachments[4]->attachment))
                {
                   
                    $matterAttachment =  matterAttachment::find($matter->attachments[4]->id);
                    $matterAttachment->attachment =$image->store('public/case-document');
                    $matterAttachment->save();
                }
                else
                {
                    $matterAttachment =  new matterAttachment;
                    $matterAttachment->matter_id =$matter->id;
                    $matterAttachment->attachment =$image->store('public/case-document');
                    $matterAttachment->save(); 

                }
            }
            if(!empty($request->attachment[3]))
            {
                 $image = $request->attachment[3];
               
                if(!empty($matter->attachments[3]->attachment))
                {
                   
                    $matterAttachment =  matterAttachment::find($matter->attachments[3]->id);
                    $matterAttachment->attachment =$image->store('public/case-document');
                    $matterAttachment->save();
                }
                else
                {
                    $matterAttachment =  new matterAttachment;
                    $matterAttachment->matter_id =$matter->id;
                    $matterAttachment->attachment =$image->store('public/case-document');
                    $matterAttachment->save(); 

                }
            }
            if(!empty($request->attachment[2]))
            {
                 $image = $request->attachment[2];
               
                if(!empty($matter->attachments[2]->attachment))
                {
                   
                    $matterAttachment =  matterAttachment::find($matter->attachments[2]->id);
                    $matterAttachment->attachment =$image->store('public/case-document');
                    $matterAttachment->save();
                }
                else
                {
                    $matterAttachment =  new matterAttachment;
                    $matterAttachment->matter_id =$matter->id;
                    $matterAttachment->attachment =$image->store('public/case-document');
                    $matterAttachment->save(); 

                }
            }
            if(!empty($request->attachment[1]))
            {
                 $image = $request->attachment[1];
               
                if(!empty($matter->attachments[1]->attachment))
                {
                   
                    $matterAttachment =  matterAttachment::find($matter->attachments[1]->id);
                    $matterAttachment->attachment =$image->store('public/case-document');
                    $matterAttachment->save();
                }
                else
                {
                    $matterAttachment =  new matterAttachment;
                    $matterAttachment->matter_id =$matter->id;
                    $matterAttachment->attachment =$image->store('public/case-document');
                    $matterAttachment->save(); 

                }
            }
            if(!empty($request->attachment[0]))
            {
                 $image = $request->attachment[0];
               
                if(!empty($matter->attachments[0]->attachment))
                {
                   
                    $matterAttachment =  matterAttachment::find($matter->attachments[0]->id);
                    $matterAttachment->attachment =$image->store('public/case-document');
                    $matterAttachment->save();
                }
                else
                {
                    $matterAttachment =  new matterAttachment;
                    $matterAttachment->matter_id =$matter->id;
                    $matterAttachment->attachment =$image->store('public/case-document');
                    $matterAttachment->save(); 

                }
            }
            
        }
        // $message = "New Case Added By Initiator";
        // (new SendPushNotification)->caseAddedByProvider($matter,$message);
           session()->flash('success', 'Data Saved Successfully.');
        return redirect('/admin/case');  
    }
    public function destroy($id)
    {
        //
    }
    public function getTransaction()
    {
        return view('admin.transactionList');   
    }
    public function getTransactionDetails(Request $request)
    {

        if(isset($request->from) || isset($request->to) || isset($request->case_id))
        {
          
            $start = date("Y-m-d",strtotime($request->input('from')));
            $end = date("Y-m-d",strtotime($request->input('to')."+1 day"));
            $users=matterContributor::orderBy('id', 'DESC')->whereBetween('created_at',[$start, $end])->with('user','case','initiator');
            if(isset($request->case_id))
            {
                $users->where('matter_id',$request->case_id);
            }
            $users = $users->get();
            return Datatables::of($users)->editColumn('created_at', function ($user) 
            {
                return date('m-d-Y', strtotime($user->created_at) );
            })->editColumn('transaction_time', function ($user) 
            {
                return date('h:i:s A', strtotime($user->created_at) );
            })->make(true);
        }
        else
        {
            $users=matterContributor::orderBy('id', 'DESC')->with('user','case','initiator')->get();
            return Datatables::of($users)->editColumn('created_at', function ($user) 
            {
                return date('m-d-Y', strtotime($user->created_at) );
            })
            ->editColumn('transaction_time', function ($user) 
            {
                return date('h:i:s A', strtotime($user->created_at) );
            })->make(true);
        }
    }
    public function casePublish($id)
    {
        $data = matter::find($id);
        $data->status = "Approved";
        $data->save();
        $matter = matter::find($id);
        $message = "New Case Added By Initiator";
        (new SendPushNotification)->caseAddedByProvider($matter,$message);  
        session()->flash('success', 'Status Changed Successfully.');
        return true;
    }
    public function changeStatusTransaction($id)
    {
        $data = matterContributor::find($id);
        if($data->status == 0)
        {
           $data->status = 1;
           $data->save();
           $user = matter::find($data->matter_id);

           $total = $user->contributed + $data->amount;
           if($total >= $user->goal)
           {
                 $user->status = "Completed";
           }
           $user->contributed += $data->amount;
           $user->save();
           $matter =  matter::find($data->matter_id); 
           if($user->status == "Completed")
           {
                $message = "New user contributed to case and Goal Achived";
                (new SendPushNotification)->caseContributedGoal($matter,$message);
                 $matterContributor = matterContributor::where('matter_id',$matter->id)->get();
                foreach ($matterContributor as $key => $value) {
                     $message = "Goal Achived For Case ".$matter->title;
                    (new SendPushNotification)->caseGoalAchived($value,$message,$matter->categorie_id,$matter);
                }

                $follower = follower::where("provider_id",$matter->provider_id)->get();
                foreach ($follower as $key => $value) {
                $message = "Goal Achived For Case ".$matter->title;
                    (new SendPushNotification)->caseGoalAchivedFollower($value,$message,$matter->categorie_id,$matter);
                }
           }
           else
           {

                $message = "New user contributed to case";
                (new SendPushNotification)->caseContributed($matter,$message);

                (new SendPushNotification)->transactionApproved($matter,"Transaction Approved",$data->user_id);
           } 
          
             

        }
        else
        {
           $data->status = 0;
           $data->save();
        }
         session()->flash('success', 'Status Changed Successfully.');
         return true;
    }

    public function dissaproveTransaction($id)
    {
        $data = matterContributor::find($id);
        if($data->status == 0)
        {
           $data->status = 2;
           $data->save();
           
        }
        
        session()->flash('success', 'Status Changed Successfully.');
         return true;
    }


    public function viewTransaction($id)
    {
        $user = matterContributor::find($id); 
        return view('admin.transactionView',compact('user'));   

    }
     public function caseTransactionSpecific($id)
    {
        $id= $id;
        return view('admin.transactionListSpecific',compact('id'));   

    }

}
