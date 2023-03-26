<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;
use App\Models\Provider;
use App\Models\bankDetails;
use App\Models\userViews;
use App\Models\matterContributor;
use App\Models\countrie;
use App\Models\state;
use App\Models\city;
use App\Models\matter;
use App\Models\emailNotifications;
use DataTables;
use Validator;
use App\Mail\sendNotification;
use Mail;
use App\Models\pushNotifications;
use App\Http\Controllers\SendPushNotification;
use Carbon\Carbon;
use Exception;
use Twilio\Rest\Client;
use App\Models\bulkMessage;
use DB;

class UserController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $country = User::select('country')->distinct()->get();
         $city = User::select('city','country')->distinct('city')->get();

         
        return view('admin.userList',compact('country','city'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function getUsers(Request $request)
    {   
        if(isset($request->from) || isset($request->to) || isset($request->country)|| isset($request->city))
        {
            $start = date("Y-m-d",strtotime($request->input('from')));
            $end = date("Y-m-d",strtotime($request->input('to')."+1 day"));
            $users=User::orderBy('id', 'DESC')->whereBetween('created_at',[$start, $end]);
            if(!empty($request->country))
            {
                $users->where('country',$request->country);
            }
            if(!empty($request->city))
            {
                $users->where('city',$request->city);
            }
            $users= $users->get();
            return Datatables::of($users)->editColumn('created_at', function ($user) 
            {
                return date('m-d-Y', strtotime($user->created_at) );
            })
            ->editColumn('user_views', function ($user) 
            {
                     return userViews::where('user_id',$user->id)->count();
            })
             ->editColumn('total_contributions', function ($user) 
            {
                     return matterContributor::where('user_id',$user->id)->where('status',1)->sum('amount');
            })
            ->make(true);
        }
        else
        {
            $users=User::orderBy('id', 'DESC')->get();
            return Datatables::of($users)->editColumn('created_at', function ($user) 
            {
                return date('m-d-Y', strtotime($user->created_at) );
            })
            ->editColumn('user_views', function ($user) 
            {
                     return userViews::where('user_id',$user->id)->count();
            })
             ->editColumn('total_contributions', function ($user) 
            {
                     return matterContributor::where('user_id',$user->id)->where('status',1)->sum('amount');
            })
            ->make(true);
        }
        
     }

    public function create()
    {
            $countrie = countrie::where('status',1)->get();
        $state = state::where('status',1)->get();  
        $city = city::where('status',1)->get();
           return view('admin.userCreate',compact('countrie','state','city'));      
    }
    public function delete($id)
    {
        $data = User::find($id);
         // $data->delete();
         return true;
    }
    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {

      // dd($request->all());
       $validator = Validator::make($request->all(), [
            'name' => 'required|string|between:2,100',
             'gender' => 'required|in:Male,Female,Other',
            'birth_date' => 'required|date_format:Y-m-d',
            'country' => 'required|integer',
            'city' => 'required|integer',
            'state' => 'required|integer',   
            // 'location' => 'required|string|between:2,100', 

            'phone_number' => 'required|between:2,100|unique:users',             
            'country_code' => 'required|between:2,100',
            'email' => 'required|regex:/(.+)@(.+)\.(.+)/i|unique:users',
            'password' => 'required|string|confirmed|min:6',
            'type' => 'required|in:Individual,Organization',
            'image' => 'mimes:jpeg,jpg,png,gif|max:5120',
        ]);
     if ($validator->fails()) {

            return \Redirect::back()->withInput()->withErrors($validator);
        }
        $user = new User;
        $user->name = $request->name;
        $user->gender = $request->gender;
        $user->birth_date = $request->birth_date;
        $user->country = countrie::where('id',$request->country)->pluck('title')->first();
        $user->city = city::where('id',$request->city)->pluck('title')->first();
         $user->state = state::where('id',$request->state)->pluck('title')->first();
        // $user->state = $request->state;
        $user->email = $request->email;
        // $user->location = $request->location;
        
        $user->password = bcrypt($request->password);
        $user->country_code = "+".$request->country_code;
        $user->phone_number = $request->phone_number;
        $user->otp = 1234;
        $user->otp_verified = 0;
        $user->type = $request->type;
        $user->birth_date = $request->birth_date;
        $user->save();
           if ($request->hasFile('image'))
        {
                $user->image = $request->image->store('public/profile');
        }
          session()->flash('success', 'Data Inserted Successfully.');
        return redirect('/admin/contributor');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $user=User::find($id);
        return view('admin.userView',compact('user'));   
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $user=User::find($id);
        $countrie = countrie::where('status',1)->get();
        $state = state::where('status',1)->get();  
        $city = city::where('status',1)->get();

        return view('admin.userEdit',compact('user','countrie','state','city'));    
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
            'name' => 'string|between:2,100',
             'gender' => 'in:Male,Female,Other',
            'birth_date' => 'date_format:Y-m-d',
            'country' => 'required|integer',
            'city' => 'required|integer',
            'state' => 'required|integer',  
            'image' => 'mimes:jpeg,jpg,png,gif|max:5120',
            'location'=> 'string|between:2,100',  

        ]);
       if ($validator->fails()) {

            return \Redirect::back()->withInput()->withErrors($validator);
        }
        $count = User::where('email',$request->email)->count();
        $user =  User::find($id);
        // if($count > 0)
        // {
        //     if($user->email != $request->email)
        //     {
        //          session()->flash('error', 'This email is already taken.');
        //          return \Redirect::back();
        //     }           
        // }
        
        if ($request->has('name'))
        {
          $user->name = $request->name;
        }
        if ($request->has('gender'))
        {
          $user->gender = $request->gender;
        }
         if ($request->has('birth_date'))
        {
          $user->birth_date = $request->birth_date;
        }

         if ($request->has('country'))
        {
          $user->country = countrie::where('id',$request->country)->pluck('title')->first();
        }
         if ($request->has('city'))
        {
          $user->city = city::where('id',$request->city)->pluck('title')->first();
        }
         if ($request->has('state'))
        {
          $user->state = state::where('id',$request->state)->pluck('title')->first();
        }
         if ($request->has('email'))
        {
          $user->email = $request->email;
        }   
        if ($request->hasFile('image'))
        {
                $user->image = $request->image->store('public/profile');
        }
        $user->save();
        session()->flash('success', 'Data Updated Successfully.');
        return redirect('/admin/contributor');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function changeStatus($id)
    {
        $data = User::find($id);

        if($data->status == 0)
        {
           $data->status = 1;
           $data->save();   
        }
        else
        {
           $data->status = 0;
           $data->save();
        }
          session()->flash('success', 'Status Changed Successfully.');
         return true;
    }
    public function destroy($id)
    {
        //
    }
    public function editAccount()
    {
         $user=bankDetails::first();

        return view('admin.bankEdit',compact('user'));    
    }

    public function updateBankDetails(Request $request, $id)
    {
        $validator = Validator::make($request->all(), [
            // 'account_holder_name' => 'string|between:2,200',
            'bank_name' => 'string|between:2,10000',
            // 'account_no' => 'string|between:2,200',
            // 'iban_no' => 'string|between:2,200',


        ]);
       if ($validator->fails()) {

            return \Redirect::back()->withInput()->withErrors($validator);
        }
        $user =  bankDetails::first();
        // $user->account_holder_name =$request->account_holder_name;
        $user->bank_name =$request->bank_name;
        // $user->account_no =$request->account_no;
        // $user->iban_no =$request->iban_no;
        $user->save();
        session()->flash('success', 'Data Updated Successfully.');
        return redirect('admin/bank-details');
    }
    public function viewEmail()
    {
        $countrie = countrie::where('status',1)->get();
        $state = state::where('status',1)->get();  
        $city = city::where('status',1)->get();
         $matter = matter::where('status','!=','Pending')->where('status','!=','Deleted')->get();

        return view('admin.userMail',compact('countrie','state','city','matter'));   
    }
    public function viewEmailSend()
    {
        $countrie = countrie::where('status',1)->get();
        $state = state::where('status',1)->get();  
        $city = city::where('status',1)->get();
         $matter = matter::where('status','!=','Pending')->where('status','!=','Deleted')->get();

        return view('admin.userPush',compact('countrie','state','city','matter'));   
    }
    
    public function storeEmail(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'title' => 'required_if:title_ar,=,null|string|between:2,100|nullable',
            'title_ar' => 'required_if:title,,=,null|string|between:2,100|nullable',
            'description' => 'required_if:description_ar,=,null|string|between:2,1000|nullable',
            'description_ar' => 'required_if:description,=,null|string|between:2,1000|nullable',
                 'image' => 'mimes:jpeg,jpg,png,gif|max:5120',
        ]);
        if ($validator->fails()) {

            return \Redirect::back()->withInput()->withErrors($validator);
        }  
      
        $emailNotifications = new emailNotifications;
        if ($request->hasFile('image'))
        {
                $emailNotifications->image =  $request->image->store('public/profile');
        }

        $emailNotifications->title=$request->title;
        $emailNotifications->title_ar=$request->title_ar;
        $emailNotifications->description=$request->description;
        $emailNotifications->description_ar=$request->description_ar;
        $emailNotifications->platform=$request->platform;
        if($request->city    == "all")
        {
            $emailNotifications->city=$request->city;
        }    
        else
        {
             $city = city::where('id',$request->city)->pluck('title')->first();
             $emailNotifications->city = $city;
        }
        if($request->country == "all")
        {
             $emailNotifications->country=$request->country;
        }
        else
        {
              $country = countrie::where('id',$request->country)->pluck('title')->first();
              $emailNotifications->country=$country;
        }
        if($request->state == "all")
        {
              $emailNotifications->state=$request->state;
        }
        else
        {
             $state = state::where('id',$request->state)->pluck('title')->first();
               $emailNotifications->state=$state;
        }
       
         if($request->now == 1)
            $emailNotifications->status=0;
        $emailNotifications->send_at=$request->send_at;
        $emailNotifications->matter_id=$request->matter;
          $emailNotifications->users=$request->user;
           $emailNotifications->save();
        $data = [
            'title' => $request->title,
            'title_ar' => $request->title_ar,
            'description' => $request->description,
            'description_ar' => $request->description_ar,
        ];
        if ($request->hasFile('image'))
        {
                $data['image'] = url('storage/app/').'/'.$emailNotifications->image;
        }
         if (!empty($request->matter))
        {
               $data['matter_id'] = route('deep.link',$request->matter);
        }
        // $emailNotifications->image=$request->;
        $user = User::where('status',1)->where('email','!=',null)->select('email','id');
        if($request->platform == "ios")
        $user = $user->where('device_type','ios');
        if($request->platform == "android")
        $user = $user->where('device_type','android'); 
        if($request->country != "all")
        {
               $country = countrie::where('id',$request->country)->pluck('title')->first();
                $user = $user->where('country',$country); 
        }
     
        if($request->city    != "all")
        {
            $city = city::where('id',$request->city)->pluck('title')->first();
            $user = $user->where('city',$city); 
        }
        
        if($request->state != "all")
        {
             $state = state::where('id',$request->state)->pluck('title')->first();
             $user = $user->where('state',$state); 
        }
        $user = $user->get();

        $provider = Provider::where('status',1)->where('document_verified',1)->where('email','!=',null)->select('email','id');
        if($request->platform == "ios")
        $provider = $provider->where('device_type','ios');
        if($request->platform == "android")
        $provider = $provider->where('device_type','android'); 
        if($request->country != "all")
        {
            $country = countrie::where('id',$request->country)->pluck('title')->first();
            $provider = $provider->where('country',$country); 
        }    
        
        if($request->city    != "all")
        {
            $city = city::where('id',$request->city)->pluck('title')->first();    
            $provider = $provider->where('city',$city); 
        }
    
        if($request->state != "all")
        {
            $state = state::where('id',$request->state)->pluck('title')->first();    
            $provider = $provider->where('state', $state); 
        }
        
       
        $provider = $provider->get();
       

        if($request->user == "initiator")
        {   
              // dd($provider);
            foreach ($provider as $key => $value) {

                $email = $value->email;
                try {
                Mail::to($email)->send(new sendNotification($data));
                    
                } catch (\Exception $e) {

                }  
            }
             
        }    
        elseif($request->user == "contributor")    
        {
           foreach ($user as $key => $value) {
                $email = $value->email;
                try {
                Mail::to($email)->send(new sendNotification($data));
                    
                } catch (\Exception $e) {

                }  
            }
        }    
        else
        {
            foreach ($provider as $key => $value) {
              
                $email = $value->email;
                try {
                Mail::to($email)->send(new sendNotification($data));
                    
                } catch (\Exception $e) {

                }  
            }
            foreach ($user as $key => $value) {
                $email = $value->email;
                try {
                Mail::to($email)->send(new sendNotification($data));
                    
                } catch (\Exception $e) {

                }  
            }
        }  
        session()->flash('success', 'Mail Sent  Successfully.');
        return redirect('admin/bulk-emails');
    }
    public function getEmailSend()
    {
         return view('admin.emailList');      

    }
    Public function getEmailListing()
    {
         if(isset($request->from) || isset($request->to))
        {
            $start = date("Y-m-d",strtotime($request->input('from')));
            $end = date("Y-m-d",strtotime($request->input('to')."+1 day"));
            $users=emailNotifications::orderBy('id', 'DESC')->whereBetween('created_at',[$start, $end]);
           
            $users= $users->get();
            return Datatables::of($users)->editColumn('created_at', function ($user) 
            {
                return date('m-d-Y', strtotime($user->created_at) );
            })
           
            ->make(true);
        }
        else
        {
            $users=emailNotifications::orderBy('id', 'DESC')->get();
            return Datatables::of($users)->editColumn('created_at', function ($user) 
            {
                return date('m-d-Y', strtotime($user->created_at) );
            })
            ->make(true);
        }
    }
    public function getPushSend()
    {
        return view('admin.userPushList');      
       

    }
     Public function getPushListing()
    {
         if(isset($request->from) || isset($request->to))
        {
            $start = date("Y-m-d",strtotime($request->input('from')));
            $end = date("Y-m-d",strtotime($request->input('to')."+1 day"));
            $users=pushNotifications::orderBy('id', 'DESC')->whereBetween('created_at',[$start, $end]);
           
            $users= $users->get();
            return Datatables::of($users)->editColumn('created_at', function ($user) 
            {
                return date('m-d-Y', strtotime($user->created_at) );
            })
           
            ->make(true);
        }
        else
        {
            $users=pushNotifications::orderBy('id', 'DESC')->get();
            return Datatables::of($users)->editColumn('created_at', function ($user) 
            {
                return date('m-d-Y', strtotime($user->created_at) );
            })
            ->make(true);
        }
    }
    
    
    public function getBulkSms()
    {
        return view('admin.userSmsList');      
       

    }
    Public function getSmsListing()
    {
         if(isset($request->from) || isset($request->to))
        {
            $start = date("Y-m-d",strtotime($request->input('from')));
            $end = date("Y-m-d",strtotime($request->input('to')."+1 day"));
            $users=bulkMessage::orderBy('id', 'DESC')->whereBetween('created_at',[$start, $end]);
           
            $users= $users->get();
            return Datatables::of($users)->editColumn('created_at', function ($user) 
            {
                return date('m-d-Y', strtotime($user->created_at) );
            })
           
            ->make(true);
        }
        else
        {
            $users=bulkMessage::orderBy('id', 'DESC')->get();
            return Datatables::of($users)->editColumn('created_at', function ($user) 
            {
                return date('m-d-Y', strtotime($user->created_at) );
            })
            ->make(true);
        }
    }
     public function storePush(Request $request)
    {
    
        $validator = Validator::make($request->all(), [
            'title' => 'required_if:title_ar,=,null|string|between:2,100|nullable',
            'title_ar' => 'required_if:title,,=,null|string|between:2,100|nullable',
            'description' => 'required_if:description_ar,=,null|string|between:2,1000|nullable',
            'description_ar' => 'required_if:description,=,null|string|between:2,1000|nullable',
                 'image' => 'mimes:jpeg,jpg,png,gif|max:5120',
        ]);
        if ($validator->fails()) {

            return \Redirect::back()->withInput()->withErrors($validator);
        }  
        // dd($request->all());
        $emailNotifications = new pushNotifications;
        if ($request->hasFile('image'))
        {
                $emailNotifications->image =  $request->image->store('public/profile');
        }
        
        $emailNotifications->title=$request->title;
        $emailNotifications->title_ar=$request->title_ar;
        $emailNotifications->description=$request->description;
        $emailNotifications->description_ar=$request->description_ar;
        $emailNotifications->platform=$request->platform;
        $emailNotifications->users=$request->users;
        if($request->city    == "all")
        {
            $emailNotifications->city=$request->city;
        }    
        else
        {
             $city = city::where('id',$request->city)->pluck('title')->first();
             $emailNotifications->city = $city;
        }
        if($request->country == "all")
        {
             $emailNotifications->country=$request->country;
        }
        else
        {
              $country = countrie::where('id',$request->country)->pluck('title')->first();
              $emailNotifications->country=$country;
        }
        if($request->state == "all")
        {
              $emailNotifications->state=$request->state;
        }
        else
        {
             $state = state::where('id',$request->state)->pluck('title')->first();
               $emailNotifications->state=$state;
        }
         if($request->now == 1)
            $emailNotifications->status=0;
        $emailNotifications->send_at=$request->send_at;
        $emailNotifications->matter_id=$request->matter;
          $emailNotifications->users=$request->user;
           $emailNotifications->save();
        $data = array('title' => $request->title,
            'title_ar' => $request->title_ar,
            'description' => $request->description,
            'description_ar' => $request->description_ar,
            'matter_id' => $request->matter);
        if ($request->hasFile('image'))
        {
                $data['image'] = url('storage/app/').'/'.$emailNotifications->image;
                 $data['image1'] = $emailNotifications->image;
        }
        // $emailNotifications->image=$request->;
        $user = User::where('status',1)->select('id','country','city','state');
        if($request->platform == "ios")
        $user = $user->where('device_type','ios');
        if($request->platform == "android")
        $user = $user->where('device_type','android'); 
       
         if($request->country != "all")
        {
               $country = countrie::where('id',$request->country)->pluck('title')->first();
                $user = $user->where('country',$country); 
        }
     
        if($request->city    != "all")
        {
            $city = city::where('id',$request->city)->pluck('title')->first();
            $user = $user->where('city',$city); 
        }
        
        if($request->state != "all")
        {
             $state = state::where('id',$request->state)->pluck('title')->first();
             $user = $user->where('state',$state); 
        }   


        $user = $user->get();
         // dd($user->toArray());  
        $provider = Provider::where('status',1)->where('document_verified',1)->select('id');
        if($request->platform == "ios")
        $provider = $provider->where('device_type','ios');
        if($request->platform == "android")
        $provider = $provider->where('device_type','android'); 
       
        if($request->country != "all")
        {
            $country = countrie::where('id',$request->country)->pluck('title')->first();
            $provider = $provider->where('country',$country); 
        }    
        
        if($request->city    != "all")
        {
            $city = city::where('id',$request->city)->pluck('title')->first();    
            $provider = $provider->where('city',$city); 
        }
    
        if($request->state != "all")
        {
            $state = state::where('id',$request->state)->pluck('title')->first();    
            $provider = $provider->where('state', $state); 
        }
         
        $provider = $provider->get();
        if($request->now == 0)
        {
            if($request->user == "initiator")
            {   
                foreach ($provider as $key => $value) {                  
                    try {
                    $message = "New Notification By admin";
                    (new SendPushNotification)->notificationToProvider($value->id,$message,$data);
                        
                    } catch (\Exception $e) {

                    }  
                }
                 
            }    
            elseif($request->user == "contributor")    
            {
                // dd($user);
               foreach ($user as $key => $value) {
                    try {
                    $message = "New Notification By admin";
                    (new SendPushNotification)->notificationToUser($value->id,$message,$data);
                        
                    } catch (\Exception $e) {

                    }  
                }
            }    
            else
            {
                foreach ($provider as $key => $value) {
                    try {
                    $message = "New Notification By admin";
                    (new SendPushNotification)->notificationToProvider($value->id,$message,$data);
                        
                    } catch (\Exception $e) {

                    }  
                }
                foreach ($user as $key => $value) {
                    try {
                        $message = "New Notification By admin";
                    (new SendPushNotification)->notificationToUser($value->id,$message,$data);
                        
                    } catch (\Exception $e) {

                    }  
                }
            }
        }
            
        session()->flash('success', 'Notification Sent  Successfully.');
        return redirect('admin/dashboard');
    } 
      public function viewBulkSms()
    {
        $countrie = countrie::where('status',1)->get();
        $state = state::where('status',1)->get();  
        $city = city::where('status',1)->get();
        $matter = matter::where('status','!=','Pending')->where('status','!=','Deleted')->get();

        return view('admin.userSms',compact('countrie','state','city','matter'));   

    }
    
     public function storeSms(Request $request)
    {
      
        $validator = Validator::make($request->all(), [
            'title' => 'required_if:title_ar,=,null|string|between:2,100|nullable',
            'title_ar' => 'required_if:title,,=,null|string|between:2,100|nullable',
            'description' => 'required_if:description_ar,=,null|string|between:2,1000|nullable',
            'description_ar' => 'required_if:description,=,null|string|between:2,1000|nullable',
                 'image' => 'mimes:jpeg,jpg,png,gif|max:5120',
        ]);
        if ($validator->fails()) {

            return \Redirect::back()->withInput()->withErrors($validator);
        }  
        // dd($request->all());
        $emailNotifications = new bulkMessage;
        if ($request->hasFile('image'))
        {
                $emailNotifications->image =  $request->image->store('public/profile');
        }
        
        $emailNotifications->title=$request->title;
        $emailNotifications->title_ar=$request->title_ar;
        $emailNotifications->description=$request->description;
        $emailNotifications->description_ar=$request->description_ar;
        $emailNotifications->platform=$request->platform;
        $emailNotifications->users=$request->users;


        if($request->city    == "all")
        {
            $emailNotifications->city=$request->city;
        }    
        else
        {
             $city = city::where('id',$request->city)->pluck('title')->first();
             $emailNotifications->city = $city;
        }
        if($request->country == "all")
        {
             $emailNotifications->country=$request->country;
        }
        else
        {
              $country = countrie::where('id',$request->country)->pluck('title')->first();
              $emailNotifications->country=$country;
        }
        if($request->state == "all")
        {
              $emailNotifications->state=$request->state;
        }
        else
        {
             $state = state::where('id',$request->state)->pluck('title')->first();
               $emailNotifications->state=$state;
        }    

         if($request->now == 1)
        $emailNotifications->status=0;
        $emailNotifications->send_at=$request->send_at;
        $emailNotifications->matter_id=$request->matter;
          $emailNotifications->users=$request->user;
           $emailNotifications->save();
        $data = array();
        if ($request->hasFile('image'))
        {
                $data['image'] = url('storage/app/').'/'.$emailNotifications->image;
                 $data['image1'] = $emailNotifications->image;
        }
        // $emailNotifications->image=$request->;
        $user = User::where('status',1)->where('country_code','!=',null)->where('phone_number','!=',null)->select('id','country_code','phone_number');
        if($request->platform == "ios")
        $user = $user->where('device_type','ios');
        if($request->platform == "android")
        $user = $user->where('device_type','android'); 
      
         if($request->country != "all")
        {
               $country = countrie::where('id',$request->country)->pluck('title')->first();
                $user = $user->where('country',$country); 
        }
     
        if($request->city    != "all")
        {
            $city = city::where('id',$request->city)->pluck('title')->first();
            $user = $user->where('city',$city); 
        }
        
        if($request->state != "all")
        {
             $state = state::where('id',$request->state)->pluck('title')->first();
             $user = $user->where('device_type',$state); 
        }


         
        $user = $user->get();

        $provider = Provider::where('status',1)->where('document_verified',1)->where('country_code','!=',null)->where('phone_number','!=',null)->select('id','country_code','phone_number');
        if($request->platform == "ios")
        $provider = $provider->where('device_type','ios');
        if($request->platform == "android")
        $provider = $provider->where('device_type','android'); 
       

         
        $provider = $provider->get();
        if($request->title != '')
            {
                $message = "Title:- ".$request->title."\n";
            }
        if($request->title_ar != '')
            {
                $message.= "Title Arabic:- ".$request->title_ar."\n";
            }
            if($request->description != '')
            {
                $message.=  "Title Description:- ".$request->description."\n";
            }
        if($request->description_ar != '')
            {
                $message.= "Title Description Arabic:- ".$request->description_ar."\n";
            }
        if ($request->hasFile('image'))
            {
                $message.= "Image Url:- ".$data['image']."\n";
            } 
        if ($request->matter != '')
            {
                $message.= "Case Url:- ".route('deep.link',$request->matter);
            } 
        if($request->now == 0)
        {
            if($request->user == "initiator")
            {   
                    // dd($message);       
                foreach ($provider as $key => $value) {                  
                    $receiverNumber = $value->country_code.$value->phone_number;
                    try {
                        // dd();
                        $account_sid = getenv("TWILIO_AUTH_SID");
                        $auth_token = getenv("TWILIO_AUTH_TOKEN");
                        $twilio_number = getenv("TWILIO_FROM");
              
                        $client = new Client($account_sid, $auth_token);
                        $client->messages->create($receiverNumber, [
                            'from' => $twilio_number, 
                            'body' => $message]);
              
                        // dd('SMS Sent Successfully.');
              
                    } catch (Exception $e) {
                        // dd("Error: ". $e->getMessage());
                    }
                }
                 
            }    
            elseif($request->user == "contributor")    
            {
               foreach ($user as $key => $value) {
                    $receiverNumber = $value->country_code.$value->phone_number;
                    try {
                        // dd();
                        $account_sid = getenv("TWILIO_AUTH_SID");
                        $auth_token = getenv("TWILIO_AUTH_TOKEN");
                        $twilio_number = getenv("TWILIO_FROM");
              
                        $client = new Client($account_sid, $auth_token);
                        $client->messages->create($receiverNumber, [
                            'from' => $twilio_number, 
                            'body' => $message]);
              
                        // dd('SMS Sent Successfully.');
              
                    } catch (Exception $e) {
                        // dd("Error: ". $e->getMessage());
                    }
                }
            }    
            else
            {
                foreach ($provider as $key => $value) {
                    $receiverNumber = $value->country_code.$value->phone_number;
                    try {
                        // dd();
                        $account_sid = getenv("TWILIO_AUTH_SID");
                        $auth_token = getenv("TWILIO_AUTH_TOKEN");
                        $twilio_number = getenv("TWILIO_FROM");
              
                        $client = new Client($account_sid, $auth_token);
                        $client->messages->create($receiverNumber, [
                            'from' => $twilio_number, 
                            'body' => $message]);
              
                        // dd('SMS Sent Successfully.');
              
                    } catch (Exception $e) {
                        // dd("Error: ". $e->getMessage());
                    }
                }
                foreach ($user as $key => $value) {
                   $receiverNumber = $value->country_code.$value->phone_number;
                    try {
                        // dd();
                        $account_sid = getenv("TWILIO_AUTH_SID");
                        $auth_token = getenv("TWILIO_AUTH_TOKEN");
                        $twilio_number = getenv("TWILIO_FROM");
              
                        $client = new Client($account_sid, $auth_token);
                        $client->messages->create($receiverNumber, [
                            'from' => $twilio_number, 
                            'body' => $message]);
              
                        // dd('SMS Sent Successfully.');
              
                    } catch (Exception $e) {
                        // dd("Error: ". $e->getMessage());
                    }
                }
            }
        }
            
        session()->flash('success', 'Notification Sent  Successfully.');
        return redirect('admin/dashboard');
    }     

}
