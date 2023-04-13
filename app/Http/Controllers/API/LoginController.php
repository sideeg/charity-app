<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Validator;
use JWTFactory;
use JWTAuth;
use JWTAuthException;
use App\Models\User;
use App\Models\Provider;
use App\Models\countrie;
use App\Models\state;
use App\Models\city;
use App\Models\categorie;
use App\Models\providerNotificationSettings;
use App\Models\userNotificationSetting;
use App\Models\pushNotifications;
use App\Models\emailNotifications;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;
use App\Mail\forgotOtp;
use Mail;
use App\Mail\sendNotification;
use Twilio\Jwt\AccessToken;
use Twilio\Jwt\Grants\ChatGrant;
use App\Http\Controllers\SendPushNotification;
use Carbon\Carbon;
use Twilio\Rest\Client;
use App\Models\bulkMessage;
use App\Models\OauthAccessToken;
use App\Events\revokeToken;
use Laravel\Passport\Token;



class LoginController extends Controller
{
        public function __construct()
    {
        $this->user = new User;
    }
    public function getCountry()
    {

         // dd(Auth::user());
        $categorie = countrie::where('status',1)->select('id','title','title_ar')->get();
        if(count($categorie) > 0)
        {
            // foreach ($categorie as $key => $value) {
            //    $value->image = url('storage/app/').'/'.$value->image;
            // }
            return response()->json(['status'=>true,'message'=>"Countries Data",'data'=>$categorie], 200);
        }
        else
        {
            return response()->json(['status'=>false,'message'=>"No Data Found",'data'=>''], 200);
        }
    }
     public function allStates(Request $request)
    {
        $validator = Validator::make($request->all(), [
          'countrie_id' => 'required|exists:countries,id',   
        ]);
        if ($validator->fails()) {
            return response()->json($validator->errors()->first());
        }
             
        $categorie = state::where('status',1)->where('countrie_id',$request->countrie_id)->select('id','title','title_arabic')->get();
        if(count($categorie) > 0)
        {
            // foreach ($categorie as $key => $value) {
            //    $value->image = url('storage/app/').'/'.$value->image;
            // }
            return response()->json(['status'=>true,'message'=>"States Data",'data'=>$categorie], 200);
        }
        else
        {
            return response()->json(['status'=>false,'message'=>"No Data Found",'data'=>''], 200);
        }
    }

    public function allCities(Request $request)
    {
        $validator = Validator::make($request->all(), [
          'countrie_id' => 'required|exists:countries,id', 
            'state_id' => 'required|exists:states,id', 

        ]);
        if ($validator->fails()) {
            return response()->json($validator->errors()->first());
        }
             
        $categorie = city::where('status',1)->where('countrie_id',$request->countrie_id)->where('state_id',$request->state_id)->select('id','title','title_arabic')->get();
        if(count($categorie) > 0)
        {
            // foreach ($categorie as $key => $value) {
            //    $value->image = url('storage/app/').'/'.$value->image;
            // }
            return response()->json(['status'=>true,'message'=>"Cities Data",'data'=>$categorie], 200);
        }
        else
        {
            return response()->json(['status'=>false,'message'=>"No Data Found",'data'=>''], 200);
        }
    }
    public function login(Request $request)
    {
        $validator = Validator::make($request->all(), [
             'country_code' => 'between:2,100',
            'phone_number' => 'between:2,100',
            'email' => 'string|email|max:100',
            'password'=> 'required',
              'device_type'=> 'in:android,ios'
        ]);
        if ($validator->fails()) {
            return response()->json($validator->errors()->first());
        }
       
        if(auth()->guard('user')->attempt(['country_code' => request('country_code'), 'phone_number' => request('phone_number'),'password' => request('password') ])  || auth()->guard('user')->attempt(['email' => request('email'), 'password' => request('password') ]))
        {
 
            config(['auth.guards.api.provider' => 'user']);
            
            $user = User::select('users.*')->find(auth()->guard('user')->user()->id);
            if($user->otp_verified == 0)
            {
                return response()->json(['status'=>false,'message'=>"Please Verify Otp First.",'userData'=>$user], 200);    
            }
            if($user->status == 0)
            {
                return response()->json(['status'=>false,'message'=>"Sorry! You are not approved by admin. Please contact the admin",'userData'=>$user], 200);    
            }
            $success =  $user; 
            $success['token'] =  $user->createToken('Charity-app',['user'])->accessToken;
            $user->token =$success['token'];
             $user_to_update = User::find($user->id);
            $user_to_update->device_token =$request->device_token;
            $user_to_update->device_type =$request->device_type;
            $user_to_update->save();

            return response()->json(['status'=>true,'message'=>"Logged In  successfully.",'userData'=>$user], 200); 

            // return response()->json($success, 200);
        }else{ 
            // return response()->json(['error' => ['Email and Password are Wrong.']], 200);
            return response()->json(['status'=>false,'message'=>"Email and Password are Wrong.","userData"=>json_decode ("{}")], 200);
        }
       return response()->json(compact('token'));
    }
    public function demo(Request $request)
    {
        dd(Auth::user());
    }
    public function register(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required|string|between:2,100',
             'gender' => 'required|in:Male,Female,Other',
            'birth_date' => 'required',
            'device_token' => 'required',
            'country' => 'required|string|between:2,100',
            'city' => 'required|string|between:2,100',
            'state' => 'required|string|between:2,100',   
            //'location' => 'required|string|between:2,100', 

            'phone_number' => 'required|between:2,100|unique:users',             
            'country_code' => 'required|between:2,100',
            'email' => 'required|regex:/(.+)@(.+)\.(.+)/i|max:100|unique:users',
            'password' => 'required|string|min:6',
            'type' => 'required|in:Individual,Organization',
             'device_type'=> 'in:android,ios',           



        ]);
        if ($validator->fails()) {
            return response()->json(['status'=>false,'message'=>$validator->errors()->first(),'error'=>$validator->errors()->first()], 200);
        }

        $user = new User;
        $user->name = $request->name;
        $user->gender = $request->gender;
        $user->birth_date = $request->birth_date;
        $user->country = $request->country;
        $user->city = $request->city;
        $user->state = $request->state;
        $user->email = $request->email;
        //$user->location = $request->location;
        
        $user->password = bcrypt($request->password);
        $user->country_code = $request->country_code;
        $user->phone_number = $request->phone_number;
           $user->device_token =$request->device_token;
        $user->device_type =$request->device_type;

        $user->otp = 1234;
        $user->otp_verified = 0;
        $user->type = $request->type;
        $user->birth_date = $request->birth_date;
        $user->save();
        $categorie = categorie::where('status',1)->get();
        foreach($categorie as $key => $value)
        {
            $providerTripsCategorie = new userNotificationSetting;
            $providerTripsCategorie->user_id  = $user->id;
            $providerTripsCategorie->categorie_id = $value->id;
            $providerTripsCategorie->all_settings = 1;
            $providerTripsCategorie->urgent_settings = 0;
            $providerTripsCategorie->save();
        }


        return response()->json(['status'=>true,'message'=>"User successfully registered",'userData'=>$user], 200);
    }
    public function otpVerify(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'otp' => 'required|numeric|digits_between:2,6',
           'country_code' => 'required|between:2,100',
            'phone_number' => 'required|between:2,100',             
        ]);
        if ($validator->fails()) {
            return response()->json(['status'=>false,'message'=>"Vallidation Error",'error'=>$validator->errors()->first()], 200);
        }

        $user_id = User::where('country_code', request('country_code'))->where('phone_number', request('phone_number'))->pluck('id')->first();
       
        if($user_id == null)
        {
            return response()->json(['status'=>false,'message'=>"Please Provide a Vallid Phone Number","userData"=>json_decode ("{}")], 200);   
        }
         $user =  User::find($user_id);
        if($user->otp !=  $request->otp)
        {
             return response()->json(['status'=>false,'message'=>"Please Provide a Vallid Otp","userData"=>json_decode ("{}")], 200);      
        }
        else
        {
            $user->otp_verified = 1;
            $user->save();    
        }
        
        return response()->json(['status'=>true,'message'=>"Otp Verified successfully",'userData'=>$user], 200);
    }
    public function resendOtp(Request $request)
    {
        $validator = Validator::make($request->all(), [
            
           'country_code' => 'required|between:2,100',
            'phone_number' => 'required|between:2,100',
            'type' => 'required|in:Contributor,Initiator',             
        ]);
        if ($validator->fails()) {
            return response()->json(['status'=>false,'message'=>"Vallidation Error",'error'=>$validator->errors()->first()], 200);
        }
        if($request->type == "Contributor")
        {
             $user_id = User::where('country_code', request('country_code'))->where('phone_number', request('phone_number'))->pluck('id')->first();
       
            if($user_id == null)
            {
                return response()->json(['status'=>false,'message'=>"Please Provide a Vallid Phone Number","userData"=>json_decode ("{}")], 200);   
            }            
            else
            {
                // $user =  User::find($user_id);
                // $user->otp_verified = 1;
                // $user->save();    
            }
            
            return response()->json(['status'=>true,'message'=>"Otp Sent successfully"], 200);
        }
        if($request->type == "Initiator")
        {
            $user_id_provider = Provider::where('country_code', request('country_code'))->where('phone_number', request('phone_number'))->pluck('id')->first(); 
            if($user_id_provider == null)
            {
                return response()->json(['status'=>false,'message'=>"Please Provide a Vallid Phone Number","userData"=>json_decode ("{}")], 200);   
            }            
            else
            {
                // $user =  User::find($user_id);
                // $user->otp_verified = 1;
                // $user->save();    
            }
            
            return response()->json(['status'=>true,'message'=>"Otp Sent successfully"], 200);
        }

         
       
    }

    Public function userDetails(Request $request)
    {

    }

    Public function updateProfile(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'string|between:2,100',
             'gender' => 'in:Male,Female,Other',
            'birth_date' => 'date_format:Y-m-d',
            'country' => 'string|between:2,100',
            'city' => 'string|between:2,100',
            'state' => 'string|between:2,100',  
            'image' => 'mimes:jpeg,jpg,png,gif|max:10000',
            'location'=> 'string|between:2,100',  

        ]);
        if ($validator->fails()) {
              return response()->json(['status'=>false,'message'=>$validator->errors()->first()], 200);
        }
        $id = Auth::user()->id;
        $user =  User::find($id);
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
          $user->country = $request->country;
        }
         if ($request->has('city'))
        {
          $user->city = $request->city;
        }
         if ($request->has('state'))
        {
          $user->state = $request->state;
        }
        if ($request->has('location'))
        {
          $user->location = $request->location;
        }
        if ($request->hasFile('image'))
        {
            $user->image = $request->image->store('public/profile');
        }
        $user->save();

        if($user->image != null)
        {
           $user->image = url('storage/app/').'/'.$user->image;

        }

        return response()->json(['status'=>true,'data'=> $user,'message'=>"Profile Updated successfully"], 200);

    }
    Public function userInfo(Request $request)
    {
        $user =  Auth::user();        
        if($user->image != null)
        {
           $user->image = url('storage/app/').'/'.$user->image;

        }
        return response()->json(['status'=>true,'data'=> $user,'message'=>"User Data"], 200);

    }
    Public function userLogout(Request $request)
    {
        if (Auth::check()) {
      		 Auth::user()->AauthAcessToken()->delete();
    	}
        return response()->json(['status'=>true,'message'=>"User Logged out successfully"], 200);

    }
    Public function changePass(Request $request)
    {
        $validator = Validator::make($request->all(), [
           'password' => 'required|string|confirmed|min:6',
           'old_password' => 'required',
        ]);
        if ($validator->fails()) {
              return response()->json(['status'=>false,'message'=>$validator->errors()->first()], 200);
        }
        if(auth()->guard('user')->attempt(['country_code' => Auth::user()->country_code, 'phone_number' => Auth::user()->phone_number,'password' => request('old_password') ])  || auth()->guard('user')->attempt(['email' => Auth::user()->email, 'password' => request('old_password') ]) )
        {
            $user = User::find(Auth::user()->id);
            $user->password = bcrypt($request->password);  
            $user->save();
            return response()->json(['status'=>true,'message'=>"Password Saved Successfully",'data'=>$user], 200);  
        }
        else
        {
            return response()->json(['status'=>false,'message'=>"Old password is Wrong",'data'=>json_decode ("{}")], 200);          
        }
    }

    Public function changePassProvider(Request $request)
    {
        $validator = Validator::make($request->all(), [
           'password' => 'required|string|confirmed|min:6',
           'old_password' => 'required',
        ]);
        if ($validator->fails()) {
              return response()->json(['status'=>false,'message'=>$validator->errors()->first()], 200);
        }
        if(auth()->guard('provider')->attempt(['country_code' => Auth::user()->country_code, 'phone_number' => Auth::user()->phone_number,'password' => request('old_password')]) || auth()->guard('provider')->attempt(['email' => Auth::user()->email, 'password' => request('old_password') ]))
        {
            $user = Provider::find(Auth::user()->id);
            $user->password = bcrypt($request->password);  
            $user->save();
            return response()->json(['status'=>true,'message'=>"Password Saved Successfully",'data'=>$user], 200);  
        }
        else
        {
            return response()->json(['status'=>false,'message'=>"Old password is Wrong",'data'=>json_decode ("{}")], 200);          
        }
    }
    public function forgotPassUser(Request $request)
    {
        $validator = Validator::make($request->all(), [
            // 'otp' => 'required|numeric|digits_between:2,6',
           'country_code' => 'between:2,100',
            'phone_number' => 'between:2,100',
            'email' => 'string|email|max:100',             
        ]);
        if ($validator->fails()) {
            return response()->json(['status'=>false,'message'=>"Vallidation Error",'error'=>$validator->errors()->first()], 200);
        }

        if($request->has('email') && !empty($request->email))
        {
            $user_id = User::where('email', request('email'))->pluck('id')->first();
            $user_id_provider = Provider::where('email', request('email'))->pluck('id')->first();   
        }
        else
        {
            $user_id = User::where('country_code', request('country_code'))->where('phone_number', request('phone_number'))->pluck('id')->first();
            $user_id_provider = Provider::where('country_code', request('country_code'))->where('phone_number', request('phone_number'))->pluck('id')->first();
        }
        
       
        if($user_id == null  && $user_id_provider  == null)
        {
            return response()->json(['status'=>false,'message'=>"Please Provide a Vallid Phone Number or Email"], 200);   
        }
        if($user_id != null)
        {
            $user =  User::find($user_id);


            $user->forgot_otp = 1234;
            $user->save();
            if($request->has('email') && !empty($request->email))
            {
                $email = $request->email;
             
                $offer = [
                    'otp' => "Your Otp Is ".$user->forgot_otp,
                ];
                try {
                    Mail::to($email)->send(new forgotOtp($offer));
                    return response()->json(['status'=>true,'message'=>"Otp sent to your registered email Id"], 200);    
                    // return response()->json(['status'=>true,'message'=>"Otp sent to your registered mobile number"], 200);     
                } 
                catch (\Exception $e) {
                     return response()->json(['status'=>false,'message'=>"Invallid email Id unable to send otp"], 200);  
                }             
            }
            else
            {
                 return response()->json(['status'=>true,'message'=>"Otp sent to your registered mobile number"], 200);   
            }
        }
        if($user_id_provider != null)
        {
            $user =  Provider::find($user_id_provider);
            $user->forgot_otp = 1234;
            $user->save();    
            if($request->has('email') && !empty($request->email))
            {
                $email = $request->email;
              
                $offer = [
                    'otp' => "Your Otp Is ".$user->forgot_otp,
                ];
                try {
                    Mail::to($email)->send(new forgotOtp($offer));
                    return response()->json(['status'=>true,'message'=>"Otp sent to your registered email Id"], 200);  
                     // return response()->json(['status'=>true,'message'=>"Otp sent to your registered mobile number"], 200);        
                } 
                catch (\Exception $e) {
                     return response()->json(['status'=>false,'message'=>"Invallid email Id unable to send otp"], 200);  
                }             
            }
            else
            {
                 return response()->json(['status'=>true,'message'=>"Otp sent to your registered mobile number"], 200);   
            }
        }
        
    }

    public function forgotOtpVerify(Request $request)
    {

        $validator = Validator::make($request->all(), [
            'otp' => 'required|numeric|digits_between:2,6',
           'country_code' => 'between:1,100',
            'phone_number' => 'numeric:2,100',
             'email' => 'string|regex:/(.+)@(.+)\.(.+)/i|max:100',  
            'password' => 'string|confirmed|min:6',                       
        ]);
        if ($validator->fails()) {
            return response()->json(['status'=>false,'message'=>$validator->errors()->first(),'error'=>$validator->errors()->first()], 200);
        }
   
        if($request->has('email') && !empty($request->email))
        {
             $user_id = User::where('email', request('email'))->pluck('id')->first();   
             $user_id_provider = Provider::where('email', request('email'))->pluck('id')->first();
          
        }
        else
        {
            $user_id = User::where('country_code', request('country_code'))->where('phone_number', request('phone_number'))->pluck('id')->first();  
            $user_id_provider = Provider::where('country_code', request('country_code'))->where('phone_number', request('phone_number'))->pluck('id')->first();   
        }    
        if($user_id == null && $user_id_provider == null)
        {
            return response()->json(['status'=>false,'message'=>"Please Provide a Vallid Phone Number or Email Address"], 200);   
        }
        if($user_id != null)
        {
            $user =  User::find($user_id);

            if($user->forgot_otp !=  $request->otp)
            {
                 return response()->json(['status'=>false,'message'=>"Please Provide a Vallid Otpp"], 200);      
            }
            else
            {
                if($request->has('password') && !empty($request->password))
                {
                     $user->password = bcrypt($request->password);  
                }
               
                $user->save();    
            }
             if($request->has('password') && !empty($request->password))
                {
                    return response()->json(['status'=>true,'message'=>"Otp Verified and password changed successfully"], 200);  
                }
                else
                {
                     return response()->json(['status'=>true,'message'=>"Otp Verified successfully"], 200);  
                }    
              
        }        
        if($user_id_provider != null)
        {    
            $user =  Provider::find($user_id_provider);
            if($user->forgot_otp !=  $request->otp)
            {
             return response()->json(['status'=>false,'message'=>"Please Provide a Vallid Otp"], 200);      
            }
            else
            {
                if($request->has('password') && !empty($request->password))
                {
                     $user->password = bcrypt($request->password);  
                }
             
                $user->save();    
            }
           if($request->has('password') && !empty($request->password))
                {
                    return response()->json(['status'=>true,'message'=>"Otp Verified and password changed successfully"], 200);  
                }
                else
                {
                     return response()->json(['status'=>true,'message'=>"Otp Verified successfully"], 200);  
                }  
        }
                 
    }

    public function forgotPassProvider(Request $request)
    {
        $validator = Validator::make($request->all(), [
            // 'otp' => 'required|numeric|digits_between:2,6',
           'country_code' => 'required|between:2,100',
            'phone_number' => 'required|between:2,100',             
        ]);
        if ($validator->fails()) {
            return response()->json(['status'=>false,'message'=>"Vallidation Error",'error'=>$validator->errors()->first()], 200);
        }

        $user_id = Provider::where('country_code', request('country_code'))->where('phone_number', request('phone_number'))->pluck('id')->first();
       
        if($user_id == null)
        {
            return response()->json(['status'=>false,'message'=>"Please Provide a Vallid Phone Number"], 200);   
        }
        $user =  Provider::find($user_id);
        $user->forgot_otp = 1234;
        $user->save();    
        return response()->json(['status'=>true,'message'=>"Otp sent to your registered mobile number"], 200);
    }

    public function forgotOtpVerifyProvider(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'otp' => 'required|numeric|digits_between:2,6',
           'country_code' => 'required|between:2,100',
            'phone_number' => 'required|between:2,100',
            'password' => 'required|string|confirmed|min:6',             
        ]);
        if ($validator->fails()) {
            return response()->json(['status'=>false,'message'=>$validator->errors()->first(),'error'=>$validator->errors()->first()], 200);
        }

        $user_id = Provider::where('country_code', request('country_code'))->where('phone_number', request('phone_number'))->pluck('id')->first();
       
        if($user_id == null)
        {
            return response()->json(['status'=>false,'message'=>"Please Provide a Vallid Phone Number"], 200);   
        }
         $user =  Provider::find($user_id);
        if($user->forgot_otp !=  $request->otp)
        {
             return response()->json(['status'=>false,'message'=>"Please Provide a Vallid Otp"], 200);      
        }
        else
        {
            $user->password = bcrypt($request->password);  
            $user->save();    
        }
        
        return response()->json(['status'=>true,'message'=>"Otp Verified and password changed successfully"], 200);

    }
    public function registerProvider(Request $request)
    {
        return response()->json(['status'=>false,'message'=>$request->all(),'error'=>$request], 200);
        $validator = Validator::make($request->all(), [
            'name' => 'required_if:name_ar,=,null|string|between:2,100|nullable',
            'name_ar' => 'required_if:name,null|string|between:2,100|nullable',
            'registration_number' => 'required|max:255',
             'country' => 'required_if:country_ar,=,null|string|between:2,100|nullable',
            'country_ar' => 'required_if:country,=,null|string|between:2,100|nullable',
            'city' => 'required_if:city_ar,=,null|string|between:2,100|nullable',
            'city_ar' => 'required_if:city,=,null|string|between:2,100|nullable',
            'state' => 'required|string|between:2,100',     
            //  'location' => 'required_if:location_ar,=,null|string|between:2,100|nullable',
            // 'location_ar' => 'required_if:location,=,null|string|between:2,100|nullable',
            'contact_name' => 'required_if:contact_name_ar,=,null|string|between:2,100|nullable',
            'contact_name_ar' => 'required_if:contact_name,=,null|string|between:2,100|nullable',
            'email' => 'required|string|regex:/(.+)@(.+)\.(.+)/i|unique:providers',
            'password' => 'required|string|min:6',
            'business_name' => 'required|string',
            'device_token' => 'required|string',
            'contact_number' => 'required|string',

            'country_code' => 'required|between:2,100',
            'phone_number' => 'required|between:2,100|unique:providers',
            'register_image' => 'required|mimes:jpeg,jpg,png,gif,pdf|max:10000',
            'type' => 'required|in:Initiative,Broadcast,Sodality',
                 'device_type'=> 'in:android,ios',         

        ]);
        if ($validator->fails()) {
            return response()->json(['status'=>false,'message'=>$validator->errors()->first(),'error'=>$validator->errors()->first()], 200);
        }

        $user = new Provider;
        $user->name = $request->name;
        $user->name_ar = $request->name_ar;
        $user->email = $request->email;
        $user->password = bcrypt($request->password);
        $user->country_code = $request->country_code;
        $user->phone_number = $request->phone_number;
        $user->business_name = $request->business_name;

        $user->registration_number = $request->registration_number;
        $user->country = $request->country;
        $user->country_ar = $request->country_ar;
        $user->city = $request->city;
        $user->city_ar = $request->city_ar;
         $user->state = $request->state;

        $user->location = $request->location;
        $user->location_ar = $request->location_ar;
        $user->contact_name = $request->contact_name;
        $user->contact_number = $request->contact_number;
        $user->contact_name = $request->contact_name;
        $user->contact_name_ar = $request->contact_name_ar;
        if ($request->hasFile('register_image'))
        {
            $user->register_image = $request->register_image->store('public/document');
        }

        $user->otp = 1234;
        $user->otp_verified = 0;
        $user->Type = $request->type;
          $user->device_token =$request->device_token;
        $user->device_type =$request->device_type;
 
        $user->save();
        $categorie = categorie::where('status',1)->get();
        foreach($categorie as $key => $value)
        {
            $providerTripsCategorie = new providerNotificationSettings;
            $providerTripsCategorie->provider_id  = $user->id;
            $providerTripsCategorie->categorie_id = $value->id;
            $providerTripsCategorie->all_settings = 1;
            $providerTripsCategorie->following_settings = 0;
            $providerTripsCategorie->urgent_settings = 0;
            $providerTripsCategorie->save();
        }
        return response()->json(['status'=>true,'message'=>"User Successfully registered",'userData'=>$user], 200);
    }


    public function updateProvider(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'string|between:2,100',
            'registration_number' => 'max:255',
            'country' => 'string|between:2,100',
            'city' => 'string|between:2,100',
            'state' => 'string|between:2,100',
            'location' => 'string|between:2,100',
            'contact_name' => 'string|between:2,100',
            'contact_number' => 'between:2,100',
            // 'email' => 'string|email|max:100|unique:providers',
            'register_image' => 'mimes:jpeg,jpg,png,gif,pdf|max:10000',
            'image' => 'mimes:jpeg,jpg,png,gif,pdf|max:10000',
        ]);
        if ($validator->fails()) {
            return response()->json(['status'=>false,'message'=>$validator->errors()->first(),'error'=>$validator->errors()->first()], 200);
        }

        $user = Provider::find(Auth::user()->id);
        if($request->has('name'))
        {
            $user->name = $request->name;
        }
        // if($request->has('email'))
        // {
        //     $user->email = $request->email;
        // }
        if($request->has('registration_number'))
        {
            $user->registration_number = $request->registration_number;
        }
         if($request->has('country'))
        {
            $user->country = $request->country;
        }
         if($request->has('city'))
        {
            $user->city = $request->city;
        }
          if($request->has('state'))
        {
            $user->state = $request->state;
        }
        if($request->has('location'))
        {
            $user->location = $request->location;
        }
        if($request->has('contact_name'))
        {
            $user->contact_name = $request->contact_name;
        }
        if($request->has('contact_number'))
        {
            $user->contact_number = $request->contact_number;
        }
        if ($request->hasFile('register_image'))
        {
            $user->register_image = $request->register_image->store('public/document');
        }
        if ($request->hasFile('image'))
        {
                $user->image = $request->image->store('public/profile');
        }
        $user->save();
         if($user->image != null)
        {
           $user->image = url('storage/app/').'/'.$user->image;

        }
        return response()->json(['status'=>true,'message'=>"Details Updated Successfully",'userData'=>$user], 200);
    }

    
    public function providerLogin(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'country_code' => 'between:2,100',
            'phone_number' => 'between:2,100',
            'email' => 'string|regex:/(.+)@(.+)\.(.+)/i|max:100',
            'password'=> 'required',
            'type'=>'required|in:Contributor,Initiator',
            'lang'=>'in:AR,EN',
                'device_type'=> 'in:android,ios', 
                'revoke_all'=> 'in:0,1',   
        ]);
        if ($validator->fails()) {
           return response()->json(['status'=>false,'message'=>$validator->errors()->first(),'error'=>$validator->errors()->first()], 200);
        }
        
        if($request->type== "Contributor")
        {
           $validator = Validator::make($request->all(), [
             'country_code' => 'between:2,100',
            'phone_number' => 'between:2,100',
            'email' => 'string|regex:/(.+)@(.+)\.(.+)/i|max:100',
            'password'=> 'required',
            'lang'=>'in:AR,EN',
                'device_type'=> 'in:android,ios',
              'revoke_all'=> 'in:0,1',           
        ]);
        if ($validator->fails()) {
            return response()->json(['status'=>false,'message'=>$validator->errors()->first(),'error'=>$validator->errors()->first()], 200);
        }
       
        if(auth()->guard('user')->attempt(['country_code' => request('country_code'), 'phone_number' => request('phone_number'),'password' => request('password') ])  || auth()->guard('user')->attempt(['email' => request('email'), 'password' => request('password') ]))
        {

            config(['auth.guards.api.provider' => 'user']);
            
            $user = User::select('users.*')->find(auth()->guard('user')->user()->id);
            if($user->otp_verified == 0)
            {
                return response()->json(['status'=>true,'message'=>"Please Verify Otp First.",'userData'=>$user], 200);    
            }
            if($user->status == 0)
            {
                return response()->json(['status'=>false,'message'=>"Sorry! You are not approved by admin. Please contact the admin",'userData'=>$user], 200);    
            }
            $success =  $user;
            $Count_token = Token::where('user_id', $user->id)->where('scopes','["user"]')->where('revoked',0)->count();

            if($Count_token > 0 && $request->revoke_all == 0)
            {
                $user->already_logged_in =1;
                return response()->json(['status'=>true,'message'=>"Sorry! You are Already logged in in new device.Do You Still want to continue",'userData'=>$user], 200);   
            }
            $count =  Token::where('user_id', $user->id)->where('scopes','["user"]')->update(['revoked' => true]);
            $success['token'] =  $user->createToken('Charity-app',['user'])->accessToken;
              $user->already_logged_in =0;
            $user->token =$success['token'];
            if(!empty($request->lang))
            {
                $update_user = User::find($user->id);
                $update_user->lang = $request->lang;
                $update_user = $update_user->save();
            }
               $user_to_update = User::find($user->id);
            $user_to_update->device_token =$request->device_token;
            $user_to_update->device_type =$request->device_type;
            $user_to_update->save();

            return response()->json(['status'=>true,'message'=>"Logged In  successfully.",'userData'=>$user], 200); 

            // return response()->json($success, 200);
        }else{ 
            if(!empty($request->email))
                {
                      return response()->json(['status'=>false,'message'=>"Email and Password are Wrong.","userData"=>json_decode ("{}")], 200);
                }
                else
                {
                    return response()->json(['status'=>false,'message'=>"Mobile Number and Password are Wrong.","userData"=>json_decode ("{}")], 200);   
                }
          
            }
        }
        if( auth()->guard('provider')->attempt(['country_code' => request('country_code'), 'phone_number' => request('phone_number'),'password' => request('password')]) || auth()->guard('provider')->attempt(['email' => request('email'),'password' => request('password')])){

             config(['auth.guards.api.provider' => 'provider']);
            
            $user = Provider::select('providers.*')->find(auth()->guard('provider')->user()->id);
            $user->type = $user->Type;
            if($user->otp_verified == 0)
            {
                return response()->json(['status'=>true,'message'=>"Please Verify Otp First.",'userData'=>$user], 200);    
            }
            if($user->status == 0)
            {
                return response()->json(['status'=>false,'message'=>"Sorry! Please Wait for Admin Approval",'userData'=>$user], 200);    
            }
            if($user->status == 2)
            {
                return response()->json(['status'=>false,'message'=>"Email and Password are Wrong.","userData"=>json_decode ("{}")], 200);    
            }
            if($user->document_verified == 0)
            {
                return response()->json(['status'=>false,'message'=>"Your Documents are Not Approvved",'userData'=>$user], 200);    
            }
            $success =  $user;
              // event(new revokeToken($user->id));
            $Count_token = Token::where('user_id', $user->id)->where('scopes','["provider"]')->where('revoked',0)->count();

            if($Count_token > 0 && $request->revoke_all == 0)
            {
                $user->already_logged_in =1;
                return response()->json(['status'=>true,'message'=>"Sorry! You are Already logged in in new device.Do You Still want to continue",'userData'=>$user], 200);   
            }
            $count =  Token::where('user_id', $user->id)->where('scopes','["provider"]')->update(['revoked' => true]);
            $user->already_logged_in =0;
            $success['token'] =  $user->createToken('Charity-app',['provider'])->accessToken;
            // event(new revokeToken($user));
            $user->token =$success['token'];
             if(!empty($request->lang))
            {
                $update_user = Provider::find($user->id);
                $update_user->lang = $request->lang;
                $update_user = $update_user->save(); 
            }
              $user_to_update = Provider::find($user->id);
            $user_to_update->device_token =$request->device_token;
            $user_to_update->device_type =$request->device_type;
            $user_to_update->save();

            return response()->json(['status'=>true,'message'=>"Logged In  successfully.",'userData'=>$user], 200); 

            // return response()->json($success, 200);
        }else{ 
             if(!empty($request->email))
                {
                      return response()->json(['status'=>false,'message'=>"Email and Password are Wrong.","userData"=>json_decode ("{}")], 200);
                }
                else
                {
                    return response()->json(['status'=>false,'message'=>"Mobile Number and Password are Wrong.","userData"=>json_decode ("{}")], 200);   
                }
        }
       return response()->json(compact('token'));   
    }
    public function otpVerifyProvider(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'otp' => 'required|numeric|digits_between:2,6',
           'country_code' => 'required|between:2,100',
            'phone_number' => 'required|between:2,100',             
        ]);
        if ($validator->fails()) {
            return response()->json(['status'=>false,'message'=>"Vallidation Error",'error'=>$validator->errors()->first()], 200);
        }

        $user_id = Provider::where('country_code', request('country_code'))->where('phone_number', request('phone_number'))->pluck('id')->first();
       
        if($user_id == null)
        {
            return response()->json(['status'=>false,'message'=>"Please Provide a Vallid Phone Number","userData"=>json_decode ("{}")], 200);   
        }
         $user =  Provider::find($user_id);
        if($user->otp !=  $request->otp)
        {
             return response()->json(['status'=>false,'message'=>"Please Provide a Vallid Otp","userData"=>json_decode ("{}")], 200);      
        }
        else
        {
            $user->otp_verified = 1;
            $user->save();    
        }
        
        return response()->json(['status'=>true,'message'=>"Otp Verified successfully",'userData'=>$user], 200);
    }
    Public function updateProfileProvider(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'max:255',
            'business_name' => 'string|between:2,100',
            'email' => 'regex:/(.+)@(.+)\.(.+)/i|unique:users|max:255',
            'image' => 'mimes:jpeg,jpg,png,gif|max:10000',
            'search_radius' => 'required|numeric|digits_between:2,6',
        ]);
        if ($validator->fails()) {
              return response()->json(['status'=>false,'message'=>$validator->errors()->first()], 200);
        }
        $id = Auth::user()->id;
        $user =  Provider::find($id);
        if ($request->has('name'))
        {
          $user->name = $request->name;
        }

        if ($request->has('email'))
        {
          $user->email = $request->email;
        }
        if ($request->has('business_name'))
        {
          $user->business_name = $request->business_name;
        }
        if ($request->has('search_radius'))
        {
          $user->search_radius = $request->search_radius;
        }
        if ($request->hasFile('image'))
        {
                $user->image = $request->image->store('public/profile');
        }

        $user->save();

        if($user->image != null)
        {
           $user->image = url('storage/app/').'/'.$user->image;

        }

        return response()->json(['status'=>true,'data'=> $user,'message'=>"Profile Updated successfully"], 200);

    }
    Public function userInfoProvider(Request $request)
    {
        $user =  Auth::user();
        if(Auth::user()->lang == 'EN')
        {
            $user_rsponse = Provider::select('id','name','registration_number','country','city','location','contact_name','contact_number','phone_number','country_code','email','image','register_image','Type','state')->where('id',Auth::user()->id)->first();
        }
        else
        {
             $user_rsponse = Provider::select('id','name','registration_number','country','city','location','contact_name','contact_number','phone_number','country_code','email','image','register_image','Type','state')->where('id',Auth::user()->id)->first();
        }
        
        if($user_rsponse->image != null)
        {
           $user_rsponse->image = url('storage/app/').'/'.$user_rsponse->image;

        }
        if($user_rsponse->register_image != null)
        {
           $user_rsponse->register_image = url('storage/app/').'/'.$user_rsponse->register_image;

        }
        $user = Auth::user();
        
        return response()->json(['status'=>true,'data'=> $user_rsponse,'message'=>"Initiative Data"], 200);

    } 

    Public function providerLogout(Request $request)
    {
        if (Auth::check()) {
           $user = Auth::user()->token();
            $user->revoke();
        }
        return response()->json(['status'=>true,'message'=>" Logged out successfully"], 200);

    }  
    public function generateTwilioToken(Request $request){
    	 $token = new AccessToken(
                        env('TWILIO_AUTH_SID'),
                        env('TWILIO_API_SID'),
                        env('TWILIO_API_SECRET'),
                        3600,
                        // $request->email
                );

                $chatGrant = new ChatGrant();
                $chatGrant->setServiceSid(env('TWILIO_SERVICE_SID'));
                $token->addGrant($chatGrant);

                $response = $this->generateTwilioToken2($request,$token,$chatGrant);
                return response()->json($response);
                // return response()->json([
                //         'token' => $token->toJWT()
                // ]);
    }
    public function generateTwilioToken2(Request $request,AccessToken $accessToken, ChatGrant $chatGrant)
        {
            $appName = "Taawoon Mobile Chat";
            $identity = $request->input("identity");

            $TWILIO_CHAT_SERVICE_SID = env('TWILIO_SERVICE_SID');
            $accessToken->setIdentity($identity);
                  

		    $chatGrant->setServiceSid( $TWILIO_CHAT_SERVICE_SID);
        	$accessToken->addGrant($chatGrant);

       		 $response = array(
            	'identity' => $identity,
            	'token' => $accessToken->toJWT()
	        	);
       		 	// dd($response);
                //  return response()->json([
                //         'identity' =>  $identity,
                //         'token' => $accessToken->toJWT()
                // ]);
        return $response;
        }

        public function createTwilioConversation(Request $request){
            
              
            $sid = getenv("TWILIO_AUTH_SID");
            $token = getenv("TWILIO_AUTH_TOKEN");
            $twilio = new Client($sid, $token);
            $conversation = $twilio->conversations->v1->conversations
                ->create([
                            "messagingServiceSid" => 'IS4e25cb1fc338428985d887a5521b6221',
                            "friendlyName" => "Testing Conversation"
                           ]);
            dd($conversation);                       
        }    
        public function fetchTwilioChat(Request $request){
              
            $sid = getenv("TWILIO_AUTH_SID");
            $token = getenv("TWILIO_AUTH_TOKEN");
          
            $twilio = new Client(env('TWILIO_AUTH_SID'), env('TWILIO_AUTH_TOKEN'));
            $channels = $twilio->chat->v2->services(env('TWILIO_SERVICE_SID'))
                             ->channels
                             ->read([], 100);
                       $data = array();
                       // $url = array();         
            foreach ($channels as $record) {
               
                $data[] = array("friendly_name"=>$record->friendlyName,"url"=>$record->links['messages'],'c_id'=>$record->sid,'unique_Name'=>$record->uniqueName);
            }
     return response()->json([
                        'status'=>true,
                        'message'=>"Data Fetched Successfully",
                        'data' => $data,

                ],200);

        }   

        public function messageOfChannel(Request $request)
        {
            $validator = Validator::make($request->all(), [
            'chat_id' => 'string|between:2,150',
            ]);
            if ($validator->fails()) {
                  return response()->json(['status'=>false,'message'=>$validator->errors()->first()], 200);
            }
             $sid = getenv("TWILIO_AUTH_SID");
            $token = getenv("TWILIO_AUTH_TOKEN");
          
            $twilio = new Client(env('TWILIO_AUTH_SID'), env('TWILIO_AUTH_TOKEN'));
            $message = $twilio->chat->v2->services(env('TWILIO_SERVICE_SID'))
                        ->channels($request->chat_id)
                        ->messages
                        ->read([], 1000);
            $test = array();            
            foreach ($message as $mess) {

                $test[] = array("message"=>$mess->body,"from"=>$mess->from,'c_id'=>$request->chat_id,'date'=>Carbon::parse($mess->dateCreated)->setTimezone('Africa/Khartoum')->format('Y-m-d h:i'));  
            }
            return response()->json([
                        'status'=>true,
                        'message'=>"Data Fetched Successfully",
                        'data' => $test,

                ],200);
        }

        public function joinChannel(Request $request)
        {
            $validator = Validator::make($request->all(), [
            	'chat_id' => 'string|between:2,150',
             	// 'chat_id' => 'string|between:2,150',
            ]);
            if ($validator->fails()) {
                  return response()->json(['status'=>false,'message'=>$validator->errors()->first()], 200);
            }
            $sid = getenv("TWILIO_AUTH_SID");
			$token = getenv("TWILIO_AUTH_TOKEN");
			$twilio = new Client($sid, $token);

			$member = $twilio->chat->v2->services(env('TWILIO_SERVICE_SID'))
                           ->channels($request->chat_id)
                           ->members
                           ->create("identity");

            return response()->json([
                        'status'=>true,
                        'message'=>"Data Fetched Successfully",
                        'data' => $test,

                ],200);
        }

     public function handlePush()
    {
        // print_r(Carbon::now()->format('Y-m-d H:i:s'));
        $beforeschedule_time =  Carbon::now();
        $afterschedule_time =  Carbon::now()->addMinute(1);
        $CheckScheduling = pushNotifications::whereBetween('send_at',[$beforeschedule_time,$afterschedule_time])->where('status',0)->get()->first();
        // dd($CheckScheduling);
        if(!empty($CheckScheduling))
        {
             $data = array('title' => $CheckScheduling->title,
            'title_ar' => $CheckScheduling->title_ar,
            'description' => $CheckScheduling->description,
            'description_ar' => $CheckScheduling->description_ar,
            'matter_id' => $CheckScheduling->matter);
            if ($CheckScheduling->image != null)
            {
                    $data['image'] = url('storage/app/').'/'.$CheckScheduling->image;
                     $data['image1'] = $CheckScheduling->image;
            }
            $user = User::where('status',1)->select('id');
            if($CheckScheduling->platform == "ios")
            $user = $user->where('device_type','ios');
            if($CheckScheduling->platform == "android")
            $user = $user->where('device_type','android'); 
            if($CheckScheduling->country != "all")
            $user = $user->where('country',$request->country); 
            if($CheckScheduling->city    != "all")
            $user = $user->where('city',$request->city); 
            if($CheckScheduling->state != "all")
            $user = $user->where('device_type',$request->state);    
            $user = $user->get();
            $provider = Provider::where('status',1)->where('document_verified',1)->select('id');
            if($CheckScheduling->platform == "ios")
            $provider = $provider->where('device_type','ios');
            if($CheckScheduling->platform == "android")
            $provider = $provider->where('device_type','android'); 
            if($CheckScheduling->country != "all")
            $provider = $provider->where('country',$request->country); 
            if($CheckScheduling->city    != "all")
            $provider = $provider->where('city',$request->city); 
            if($CheckScheduling->state != "all")
            $provider = $provider->where('device_type',$request->state); 
             
            $provider = $provider->get();
            
            if($CheckScheduling->user == "initiator")
            {   
                foreach ($provider as $key => $value) {                  
                    try {
                    $message = "New Notification By admin";
                    (new SendPushNotification)->notificationToProvider($value->id,$message,$data);
                        
                    } catch (\Exception $e) {

                    }  
                }
                     
            }    
            elseif($CheckScheduling->user == "contributor")    
            {
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
            $CheckScheduling = pushNotifications::find($CheckScheduling->id);
            $CheckScheduling->status = 1;
            $CheckScheduling->save();
        }
                    // dd($CheckScheduling);
        \Log::info("Cron is working fine!");
        return ;
    }

    public function handleemail()
    {
        // print_r(Carbon::now()->format('Y-m-d H:i:s'));
        $beforeschedule_time =  Carbon::now();
        $afterschedule_time =  Carbon::now()->addMinute(1);
        $CheckScheduling = emailNotifications::whereBetween('send_at',[$beforeschedule_time,$afterschedule_time])->where('status',0)->get()->first();
        // dd($CheckScheduling);
        if(!empty($CheckScheduling))
        {
             $data = [
            'title' => $CheckScheduling->title,
            'title_ar' => $CheckScheduling->title_ar,
            'description' => $CheckScheduling->description,
            'description_ar' => $CheckScheduling->description_ar,
            ];
            if ($CheckScheduling->image != null)
            {
                    $data['image'] = url('storage/app/').'/'.$CheckScheduling->image;
            }
            if ($CheckScheduling->matter_id != null)
            {
                    $data['matter_id'] = $CheckScheduling->matter_id;
            }
        
            $user = User::where('status',1)->where('email','!=',null)->select('email','id');
            if($CheckScheduling->platform == "ios")
            $user = $user->where('device_type','ios');
            if($CheckScheduling->platform == "android")
            $user = $user->where('device_type','android'); 
            if($CheckScheduling->country != "all")
            $user = $user->where('country',$request->country); 
            if($CheckScheduling->city    != "all")
            $user = $user->where('city',$request->city); 
            if($CheckScheduling->state != "all")
            $user = $user->where('device_type',$request->state); 
             
            $user = $user->get();

            $provider = Provider::where('status',1)->where('document_verified',1)->where('email','!=',null)->select('email','id');
            if($CheckScheduling->platform == "ios")
            $provider = $provider->where('device_type','ios');
            if($CheckScheduling->platform == "android")
            $provider = $provider->where('device_type','android'); 
            if($CheckScheduling->country != "all")
            $provider = $provider->where('country',$request->country); 
            if($CheckScheduling->city    != "all")
            $provider = $provider->where('city',$request->city); 
            if($CheckScheduling->state != "all")
            $provider = $provider->where('device_type',$request->state); 
             
            $provider = $provider->get();

            if($CheckScheduling->user == "initiator")
            {   
                foreach ($provider as $key => $value) {

                    $email = $value->email;
                    try {
                    Mail::to($email)->send(new sendNotification($data));
                        
                    } catch (\Exception $e) {

                    }  
                }
                 
            }    
            elseif($CheckScheduling->user == "contributor")    
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
            $CheckScheduling = emailNotifications::find($CheckScheduling->id);
            $CheckScheduling->status = 1;
            $CheckScheduling->save();
        }
                    // dd($CheckScheduling);
        \Log::info("Cron is working fine!");
        return ;
    }
    public function handleBulkSms()
    {
        // print_r(Carbon::now()->format('Y-m-d H:i:s'));
        $beforeschedule_time =  Carbon::now();
        $afterschedule_time =  Carbon::now()->addMinute(1);
        $CheckScheduling = bulkMessage::whereBetween('send_at',[$beforeschedule_time,$afterschedule_time])->where('status',0)->get()->first();
        // dd($CheckScheduling);
        if(!empty($CheckScheduling))
        {
             
             if($CheckScheduling->title != '')
            {
                $message = "Title:- ".$CheckScheduling->title."\n";
            }
        if($CheckScheduling->title_ar != '')
            {
                $message.= "Title Arabic:- ".$CheckScheduling->title_ar."\n";
            }
            if($CheckScheduling->description != '')
            {
                $message.=  "Title Description:- ".$CheckScheduling->description."\n";
            }
        if($CheckScheduling->description_ar != '')
            {
                $message.= "Title Description Arabic:- ".$CheckScheduling->description_ar."\n";
            }
       
        if ($CheckScheduling->matter != '')
            {
                $message.= "Case Url:- ".route('deep.link',$request->matter);
            } 
            if ($CheckScheduling->image != null)
            {
                    $data['image'] = url('storage/app/').'/'.$CheckScheduling->image;
            }
            
        
            $user = User::where('status',1)->where('country_code','!=',null)->where('phone_number','!=',null)->select('id','country_code','phone_number');
            if($CheckScheduling->platform == "ios")
            $user = $user->where('device_type','ios');
            if($CheckScheduling->platform == "android")
            $user = $user->where('device_type','android'); 
            if($CheckScheduling->country != "all")
            $user = $user->where('country',$request->country); 
            if($CheckScheduling->city    != "all")
            $user = $user->where('city',$request->city); 
            if($CheckScheduling->state != "all")
            $user = $user->where('device_type',$request->state); 
             
            $user = $user->get();

            $provider = Provider::where('status',1)->where('status',1)->where('document_verified',1)->where('country_code','!=',null)->where('phone_number','!=',null)->select('id','country_code','phone_number');
            if($CheckScheduling->platform == "ios")
            $provider = $provider->where('device_type','ios');
            if($CheckScheduling->platform == "android")
            $provider = $provider->where('device_type','android'); 
            if($CheckScheduling->country != "all")
            $provider = $provider->where('country',$request->country); 
            if($CheckScheduling->city    != "all")
            $provider = $provider->where('city',$request->city); 
            if($CheckScheduling->state != "all")
            $provider = $provider->where('device_type',$request->state); 
             
            $provider = $provider->get();

            if($CheckScheduling->user == "initiator")
            {   
                foreach ($provider as $key => $value) {
                    $receiverNumber = $value->country_code.$value->phone_number;
                    try {
                        $account_sid = getenv("TWILIO_AUTH_SID");
                        $auth_token = getenv("TWILIO_AUTH_TOKEN");
                        $twilio_number = getenv("TWILIO_FROM");
              
                        $client = new Client($account_sid, $auth_token);
                        $client->messages->create($receiverNumber, [
                            'from' => $twilio_number, 
                            'body' => $message]);
                    } 
                    catch (Exception $e) {
                    }
                }
                 
            }    
            elseif($CheckScheduling->user == "contributor")    
            {
               foreach ($user as $key => $value) {
                    $receiverNumber = $value->country_code.$value->phone_number;
                    try {
                        $account_sid = getenv("TWILIO_AUTH_SID");
                        $auth_token = getenv("TWILIO_AUTH_TOKEN");
                        $twilio_number = getenv("TWILIO_FROM");
              
                        $client = new Client($account_sid, $auth_token);
                        $client->messages->create($receiverNumber, [
                            'from' => $twilio_number, 
                            'body' => $message]);
                    } 
                    catch (Exception $e) {
                    }
                }
            }    
            else
            {
                foreach ($provider as $key => $value) {
                  
                    $receiverNumber = $value->country_code.$value->phone_number;
                    try {
                        $account_sid = getenv("TWILIO_AUTH_SID");
                        $auth_token = getenv("TWILIO_AUTH_TOKEN");
                        $twilio_number = getenv("TWILIO_FROM");
              
                        $client = new Client($account_sid, $auth_token);
                        $client->messages->create($receiverNumber, [
                            'from' => $twilio_number, 
                            'body' => $message]);
                    } 
                    catch (Exception $e) {
                    }
                }
                foreach ($user as $key => $value) {
                    $receiverNumber = $value->country_code.$value->phone_number;
                    try {
                        $account_sid = getenv("TWILIO_AUTH_SID");
                        $auth_token = getenv("TWILIO_AUTH_TOKEN");
                        $twilio_number = getenv("TWILIO_FROM");
              
                        $client = new Client($account_sid, $auth_token);
                        $client->messages->create($receiverNumber, [
                            'from' => $twilio_number, 
                            'body' => $message]);
                    } 
                    catch (Exception $e) {
                    }
                }
            }  
            $CheckScheduling = bulkMessage::find($CheckScheduling->id);
            $CheckScheduling->status = 1;
            $CheckScheduling->save();
        }
                    // dd($CheckScheduling);
        \Log::info("Cron is working fine!");
        return ;
    }

}
