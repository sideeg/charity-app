<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Provider;
use App\Models\matterContributor;
use App\Models\matter;
use App\Models\countrie;
use App\Models\state;
use App\Models\city;
use DataTables;
use DB;
use Validator;
class ProviderController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $country = Provider::select('country')->distinct()->get();
        $city = Provider::select('city','country')->distinct('city')->get();
    
        return view('admin.providerList',compact('country','city'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function getProviders(Request $request)
    {

          if(isset($request->from) || isset($request->to) || isset($request->country)|| isset($request->city))
        {
          
            $start = date("Y-m-d",strtotime($request->input('from')));
            $end = date("Y-m-d",strtotime($request->input('to')."+1 day"));
            $users=Provider::orderBy('id', 'DESC')->whereBetween('created_at',[$start, $end]);
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
          
            ->editColumn('total_cases', function ($user) 
            {
                return matter::where('provider_id',$user->id)->count();
            })
            ->editColumn('total_cases_active', function ($user) 
            {
                return matter::where('provider_id',$user->id)->where('status','Approved')->count();
            })
            ->editColumn('total_cases_completed', function ($user) 
            {
                return matter::where('provider_id',$user->id)->where('status','Completed')->count();
            })
            ->editColumn('total_cases_contribution', function ($user) 
            {
                $case_ids = matter::where('provider_id',$user->id)->select('id')->get()->toArray();
                if(!empty($case_ids))
                {
                    return matterContributor::whereIn('matter_id',array_column($case_ids,'id'))->sum('amount');
                }
                else
                {
                    return "0";                 
                }
            })
            ->make(true);
        }
        else
        {
            $users=Provider::orderBy('id', 'DESC')->get();
            return Datatables::of($users)->editColumn('created_at', function ($user) 
            {
                return date('m-d-Y', strtotime($user->created_at) );
            })
            ->editColumn('total_cases', function ($user) 
            {
                return matter::where('provider_id',$user->id)->count();
            })
            ->editColumn('total_cases_active', function ($user) 
            {
                return matter::where('provider_id',$user->id)->where('status','Approved')->count();
            })
            ->editColumn('total_cases_completed', function ($user) 
            {
                return matter::where('provider_id',$user->id)->where('status','Completed')->count();
            })
            ->editColumn('total_cases_contribution', function ($user) 
            {
                $case_ids = matter::where('provider_id',$user->id)->select('id')->get()->toArray();
                if(!empty($case_ids))
                {
                    return matterContributor::whereIn('matter_id',array_column($case_ids,'id'))->sum('amount');
                }
                else
                {
                    return "0";                 
                }
            })->make(true);
        }    
    }
    public function create()
    {
        $countrie = countrie::where('status',1)->get();
        $state = state::where('status',1)->get();  
        $city = city::where('status',1)->get();
         return view('admin.providerCreate',compact('countrie','state','city'));           
    }
    public function delete($id)
    {
        $data = Provider::find($id);
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
      
      
        $validator = Validator::make($request->all(), [
            'name' => 'required_if:name_ar,=,null|string|between:2,100|nullable',
            'name_ar' => 'required_if:name,null|string|between:2,100|nullable',
            'registration_number' => 'required|max:255',
          
            'country_ar' => 'required_if:country,=,null|string|between:2,100|nullable',
      
            'city_ar' => 'required_if:city,=,null|string|between:2,100|nullable',        
            'location' => 'required_if:location_ar,=,null|string|between:2,100|nullable',
            'location_ar' => 'required_if:location,=,null|string|between:2,100|nullable',
            'contact_name' => 'required_if:contact_name_ar,=,null|string|between:2,100|nullable',
            'contact_name_ar' => 'required_if:contact_name,=,null|string|between:2,100|nullable',
            'contact_number' => 'required|max:255',
            'email' => 'required|regex:/(.+)@(.+)\.(.+)/i|unique:providers',
            'password' => 'required|string|confirmed|min:6',
            'country_code' => 'required|between:1,100',
            'phone_number' => 'required|between:2,100|unique:providers',
            'register_image' => 'required|mimes:jpeg,jpg,png,gif,pdf|max:5120',  
             'country' => 'required|integer',
            'city' => 'required|integer',
            'state' => 'required|integer',             
        ]);
        if ($validator->fails()) {
            return \Redirect::back()->withInput()->withErrors($validator);
        }
         $user = new Provider;
        $user->name = $request->name;
        $user->name_ar = $request->name_ar;
        $user->email = $request->email;
        $user->password = bcrypt($request->password);
        $user->country_code = "+".$request->country_code;
        $user->phone_number = $request->phone_number;

        $user->registration_number = $request->registration_number;
           $user->country = countrie::where('id',$request->country)->pluck('title')->first();
           $user->country_ar = countrie::where('id',$request->country)->pluck('title_ar')->first();

        $user->city = city::where('id',$request->city)->pluck('title')->first();
        $user->city_ar = city::where('id',$request->city)->pluck('title')->first();
        $user->state = state::where('id',$request->state)->pluck('title')->first();
        $user->location = $request->location;
        $user->location_ar = $request->location_ar;
        $user->contact_name = $request->contact_name;
        $user->contact_number = $request->contact_number;
        $user->contact_name_ar = $request->contact_name_ar;
        $user->device_type = 'android';
        $user->type = 'Individual';
        $user->business_name = $request->business_name;
        $user->device_token = '';
        // $user->contact_name = $request->contact_name;
        if ($request->hasFile('register_image'))
        {
            $user->register_image = $request->register_image->store('public/document');
        }

        $user->otp = 1234;
        $user->otp_verified = 1;
        $user->save();
        session()->flash('success', 'Data Inserted Successfully.');
        return redirect('/admin/initiator');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
          $user=Provider::find($id);

        return view('admin.providerView',compact('user'));  
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $user=Provider::find($id);
          $countrie = countrie::where('status',1)->get();
        $state = state::where('status',1)->get();  
        $city = city::where('status',1)->get();
        return view('admin.providerEdit',compact('user','countrie','state','city'));           
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
        // dd($request->all());
         $validator = Validator::make($request->all(), [
            
            'registration_number' => 'required|max:255',
             'name' => 'required_if:name_ar,=,null|string|between:2,100|nullable',
            'name_ar' => 'required_if:name,null|string|between:2,100|nullable',
              'country' => 'required|integer',
            'city' => 'required|integer',
            'state' => 'required|integer',  
           
       
            'location' => 'required_if:location_ar,=,null|string|between:2,100|nullable',
            'location_ar' => 'required_if:location,=,null|string|between:2,100|nullable',
            'contact_name' => 'required_if:contact_name_ar,=,null|string|between:2,100|nullable',
            'contact_name_ar' => 'required_if:contact_name,=,null|string|between:2,100|nullable', 
            'contact_number' => 'required|max:255',
            // 'email' => 'required|string|email|max:100|unique:providers',
            // 'password' => 'required|string|confirmed|min:6',
            // 'country_code' => 'required|between:2,100',
            // 'phone_number' => 'required|between:2,100|unique:providers',
            'image' => 'mimes:jpeg,jpg,png,gif,pdf|max:5120',            
        ]);       
         if ($validator->fails()) {
            return \Redirect::back()->withInput()->withErrors($validator);
        }
        $count = Provider::where('email',$request->email)->count();
        $user =  Provider::find($id);
        if($count > 0)
        {
            if($user->email != $request->email)
            {
                 session()->flash('error', 'This email is already taken.');
                 return \Redirect::back();
            }           
        }    
        
        // $user =  Provider::find($id);
        if ($request->has('name'))
        {
          $user->name = $request->name;
        }
        if ($request->has('registration_number'))
        {
          $user->registration_number = $request->registration_number;
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
        if ($request->has('location'))
        {
          $user->location = $request->location;
        }
        if ($request->has('contact_name'))
        {
          $user->contact_name = $request->contact_name;
        }
        if ($request->has('contact_number'))
        {
          $user->contact_number = $request->contact_number;
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
        return redirect('/admin/initiator');

    }
    public function changeStatus($id)
    {
        $data = Provider::find($id);
          if($data->document_verified == 0)
        {
             session()->flash('error', 'Please Approve Documents First .');
         return true;

        }

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
    public function changeStatusDocument($id)
    {
        $data = Provider::find($id);

        if($data->document_verified == 0)
        {
           $data->document_verified = 1;
           $data->save();   
        }
        else
        {
           $data->document_verified = 0;
           $data->save();
        }
          session()->flash('success', 'Status Changed Successfully.');
         return true;
    }
    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
