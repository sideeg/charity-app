<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\categorie;
use Illuminate\Support\Facades\Auth;
use App\Models\User;
use App\Models\providerNotificationSettings;
// use App\Models\Provider;
// use App\Models\providerNotification;
use Carbon\Carbon;
use Validator;
use App\Models\countrie;
use App\Models\matter;
use App\Models\matterAttachment;
use App\Models\follower;
use App\Models\Provider;
use App\Models\matterContributor;
use App\Models\bankDetails;
use App\Models\userNotificationSetting;
use Illuminate\Database\Eloquent\ModelNotFoundException as ModelNotFoundException;
use App\Http\Controllers\SendPushNotification;
use App\Models\userNotification;
use App\Models\userViews;
use Illuminate\Support\Arr;


use DB;

class userApicontroller extends Controller
{
    public function getCategories()
    {
    	$categorie = categorie::where('status',1)->get();
    	if(count($categorie) > 0)
    	{
                		return response()->json(['status'=>true,'message'=>"Categories Data",'data'=>$categorie], 200);

            foreach ($categorie as $key => $value) {
               $value->image = url('charity-app/storage/app/').'/'.$value->image;
            }
    		return response()->json(['status'=>true,'message'=>"Categories Data",'data'=>$categorie], 200);
    	}
    	else
    	{
    		return response()->json(['status'=>false,'message'=>"No Data Found",'data'=>''], 200);
    	}
    }
    public function getCountry()
    {
        $categorie = countrie::where('status',1)->get();
        if(count($categorie) > 0)
        {
            foreach ($categorie as $key => $value) {
               $value->image = url('storage/app/').'/'.$value->image;
            }
            return response()->json(['status'=>true,'message'=>"Categories Data",'data'=>$categorie], 200);
        }
        else
        {
            return response()->json(['status'=>false,'message'=>"No Data Found",'data'=>''], 200);
        }
    }
    Public function userSetting(Request $request)
    {
    	$validator = Validator::make($request->all(), [
            
            'notification' => 'required|in:0,1',
            'notification_sound' => 'required|in:0,1',       
        ]);
        if ($validator->fails()) {
            return response()->json(['status'=>false,'message'=>"Vallidation Error",'error'=>$validator->errors()->first()], 200);
        }

        $user = User::find(Auth::user()->id);
		$user->notification = $request->notification;
		$user->notification_sound = $request->notification_sound;  
		$user->save();
		 return response()->json(['status'=>true,'message'=>"Settings Saved Successfully",'data'=>$user], 200);    

    }

    public function getCases(Request $request)
    {

      
        $validator = Validator::make($request->all(), [
               'categorie_id' => 'required|exists:categories,id', 
               'from' => 'date_format:Y-m-d',
                'to' => 'date_format:Y-m-d',
                 'title' => 'max:235|string',
            ]);
        if ($validator->fails()) {
            return response()->json(['status'=>false,'message'=>$validator->errors()->first(),'error'=>$validator->errors()->first()], 200);
        }

        if(isset($request->from) || isset($request->to) || isset($request->title))
        {
            DB::enableQueryLog();

            $start = date("Y-m-d",strtotime($request->input('from')));
            $end = date("Y-m-d",strtotime($request->input('to')."+1 day"));
            $categorie=matter::select('id','title','title_ar','description','city','country','goal','national_number','national_certificate','status','created_at','contributed','location','serial_no','end_date')->where('categorie_id',$request->categorie_id)->whereNotIn('status',array('Pending','Completed','Closed'))->orderBy('id', 'DESC')->whereBetween('created_at',[$start, $end])->where('end_date', '>=', Carbon::now()->format('Y-m-d') );
            if(!empty($request->title))
            {
                $categorie->where('title','LIKE', "%{$request->title}%");
            }
            $categorie =$categorie->get();

        }
        else{
             $categorie = matter::select('id','title','title_ar','description','city','country','goal','national_number','national_certificate','status','created_at','contributed','location','serial_no','end_date')->where('categorie_id',$request->categorie_id)->whereNotIn('status',array('Pending','Completed','Closed'))->where('end_date', '>=', Carbon::now()->format('Y-m-d') )->orderBy('id', 'DESC')->get();
        }    
        if(count($categorie) > 0)
        {
            $categorie_name = categorie::find($request->categorie_id);

            foreach ($categorie as $key => $value) {
               $value->national_certificate = url('storage/app/').'/'.$value->national_certificate;
                 $value->views = userViews::where('matter_id',$value->id)->count();
                $percentage =  $value->contributed;
                $totalvalue = (int) $value->goal;
                $count1 = $percentage / $totalvalue;
                $count2 = $count1 * 100;
                $count = number_format($count2, 0);
                   $value->percentage = $count;
                if($categorie_name->type == "Money")
                {
                    $unit = "SDG";
                     $value->contributed = $value->contributed.' '.env('CURRENCY');
                }
                else
                {
                    $unit = "Unit";
                       $value->contributed = $value->contributed.' ' .$unit;
                }   
                $value->goal = $value->goal .' '.$unit;
                  // $category_case = categorie::find($case->categorie_id);
                $value->catType = $categorie_name->type;

                if(empty($value->serial_no))
                {
                    $value->serial_no = "";
                }

                $value->date = $value->created_at->todatestring();
            }

            // if(Auth::user()->lang == 'EN')
            // {
               return response()->json(['status'=>true,'message'=>"Cases Data",'data'=>$categorie,'categorie_name'=>$categorie_name->title], 200);
            // }
            // else
            // {
            //    return response()->json(['status'=>true,'message'=>" بيانات الحالات ",'data'=>$categorie], 200);
            // }
            
        }
        else
        {
            return response()->json(['status'=>false,'message'=>"No Data Found",'data'=>''], 200);
        }
    }

    public function follow(Request $request)
    {
        $validator = Validator::make($request->all(), [ 
            'matter_id' => 'required|exists:matters,id', 
             
        ]);
        if ($validator->fails()) {
            return response()->json(['status'=>false,'message'=>"Vallidation Error",'error'=>$validator->errors()->first()], 200);
        }
        $matter =  matter::find($request->matter_id);
  
        $count =  follower::where('provider_id',$matter->provider_id)->where('user_id',Auth::user()->id)->count();
       
        if($count > 0 )
        {
                 $user_id =  follower::where('provider_id',$matter->provider_id)->where('user_id',Auth::user()->id)->pluck('id')->first();
                 $user = follower::find($user_id);
                 $user->status =1;
     
        }
        else
        {
                $user = new follower;
        } 
    
        $user->matter_id = $request->matter_id;
        $user->user_id  = Auth::user()->id;
        $user->provider_id = $matter->provider_id;
        $user->save(); 
        $count_user =  follower::where('provider_id',$matter->provider_id)->where('status',1)->count();
         $message = Auth::user()->name." Started following you";
        (new SendPushNotification)->caseFollowed($matter,$message);       
        return response()->json(['status'=>true,'message'=>"Initiator Followed",'data'=>$user,'count_user'=>$count_user], 200);

    }   
    public function unFollow(Request $request)
    {
        $validator = Validator::make($request->all(), [ 
            // 'matter_id' => 'exists:matters,id', 
             'provider_id' => 'exists:providers,id', 
             
        ]);
        if ($validator->fails()) {
            return response()->json(['status'=>false,'message'=>$validator->errors()->first(),'error'=>$validator->errors()->first()], 200);
        }
        if(empty($request->provider_id) && empty($request->provider_id))
        {
            return response()->json(['status'=>false,'message'=>"Please provide Initiator or Case Id"], 200);
        } 
        if($request->has('provider_id') && !empty($request->provider_id))
        {
            $matter_id = matter::where('provider_id',$request->provider_id)->pluck('id')->first();
            $matter =  matter::find($matter_id);
        }  
        else
        {
            $matter =  matter::find($request->matter_id);
        }
        
        $user_id =  follower::where('provider_id',$matter->provider_id)->where('user_id',Auth::user()->id)->pluck('id')->first();
        $user =  follower::find($user_id);
        $user->status = 0;
        $user->save();
        $message = Auth::user()->name." Un followed you";
        (new SendPushNotification)->caseUnFollowed($matter,$message);   
          $count_user =  follower::where('provider_id',$matter->provider_id)->where('status',1)->count();
        return response()->json(['status'=>true,'message'=>"Initiator Un Followed",'count_user'=>$count_user], 200);                
    }
    public function specificCaseDetails(Request $request)
    {

        $validator = Validator::make($request->all(), [ 
            'matter_id' => 'required|exists:matters,id', 
             
        ]);
        if ($validator->fails()) {
            return response()->json(['status'=>false,'message'=>"Vallidation Error",'error'=>$validator->errors()->first()], 200);
        }
        $case = matter::where('id',$request->matter_id)->with('user')->get()->first();
        $case->initiator_nmae = $case->user->name;
        $case->national_certificate = url('storage/app/').'/'.$case->national_certificate;
     
        $case->views = userViews::where('matter_id',$case->id)->count();
        $category_case = categorie::find($case->categorie_id);
        $case->catType = $category_case->type;
        if($category_case->type == "Money")
        {
            $unit = "SDG";
        }
        else
        {
            $unit = "Unit";
        }
       
        $percentage =  $case->contributed;
        $totalvalue = (int) $case->goal;

        $count1 = $percentage / $totalvalue;
        $count2 = $count1 * 100;
        $count = number_format($count2, 0);

        // $case_percentage =  ($percentage / 100) * $totalvalue;
        $case->percentage = $count;
        // $case->serial_no = 4523;
        if(empty($case->serial_no))
        {
            $case->serial_no = '';
        }
        $case->goal = $case->goal." ".$unit;
        $case->date = $case->created_at->todatestring(); 
        $is_foolow = follower::where('matter_id',$request->matter_id)->where('user_id',Auth::user()->id)->where('status',1)->count(); 
        $case->is_follow = $is_foolow;
        $follower =   follower::where('matter_id',$request->matter_id)->where('status',1)->count();
        $case->follower = $follower;
        $matterAttachment = matterAttachment::where('matter_id',$request->matter_id)->select('id','matter_id','attachment')->get();
        if(!empty($matterAttachment))
        {
            foreach ($matterAttachment as $key => $value) {
                $value->attachment = url('storage/app/').'/'.$value->attachment;
            }
        }

        $case->attachments = $matterAttachment;
        unset($case->user);

       
        $userViews_id =  userViews::where('matter_id',$case->id)->where('user_id',Auth::user()->id)->pluck('id')->first();
        if(empty($userViews_id))
        {
             $userViews = new userViews;
             $userViews->matter_id = $case->id;
              $userViews->user_id = Auth::user()->id;
             $userViews->save(); 
        }
         if($category_case->type == "Money")
        {
            $case->contributed = $case->contributed. " SDG";
        }
        else
        {
            $case->contributed = $case->contributed." Unit";
        }
         return response()->json(['status'=>true,'message'=>"Case Data",'data'=>$case], 200);   

    }   
    public function getFollower(Request $request)
    {

        $matter_id = follower::where('user_id',Auth::user()->id)->where('status',1)->select('matter_id','user_id','status','provider_id')->distinct('provider_id')->get()->toArray();
        $categorie = matter::whereIn('id',array_column($matter_id, 'matter_id'))->select('provider_id')->get();
        if(count($categorie) > 0)
        {
            
            foreach ($categorie as $key => $value) {
                $user = Provider::find($value->provider_id);
                if($user->image != null)
                {
                    $value->userImage = url('storage/app/').'/'.$user->image;
                }
                else
                {
                    $value->userImage = "";
                }    
               
                $value->userName = $user->name;
                // $value->provider_id = $user->name;
            }

            // if(Auth::user()->lang == 'EN')
            // {
               return response()->json(['status'=>true,'message'=>"Followers Data",'data'=>$categorie], 200);
            // }
            // else
            // {
            //    return response()->json(['status'=>true,'message'=>" بيانات الحالات ",'data'=>$categorie], 200);
            // }
            
        }
        else
        {
            return response()->json(['status'=>false,'message'=>"No Data Found",'data'=>''], 200);
        }

     }    

    public function getBankDetails()
    {
        $bankDetails = bankDetails::first();
         return response()->json(['status'=>true,'message'=>"Bank Data","data"=>$bankDetails], 200);     

    } 
    public function caseContribute(Request $request)
    {
        $validator = Validator::make($request->all(), [ 
            'matter_id' => 'required|exists:matters,id', 
            'mode'=>'required|in:Cash,Online',
            'transaction_image' => 'required_if:mode,Cash|mimes:jpeg,jpg,png,gif|max:10000',
            'amount'=>'required|between:0,9999999.99',
            'transaction_id' => 'required|max:235|string', 
        ]);
        if ($validator->fails()) {
            return response()->json(['status'=>false,'message'=>$validator->errors()->first(),'error'=>$validator->errors()->first()], 200);
        }

        $matter =  matter::find($request->matter_id);
        $contributed_amount= $matter->contributed + $request->amount;
        if($contributed_amount > $matter->goal)
        { 
            $diffrence = $matter->goal - $matter->contributed;
            return response()->json(['status'=>false,'message'=>"Sorry! You Can Not Proceed Further. Because the goal is already achived and we can accept maximum payment for:- ". $diffrence ], 200);
        }

        $matterContributor = new matterContributor;
        $matterContributor->matter_id = $request->matter_id;
        $matterContributor->mode = $request->mode;
        // $matterContributor->transaction_image = $request->mode;
        if ($request->hasFile('transaction_image'))
        {
                $matterContributor->transaction_image = $request->transaction_image->store('public/transaction');
        }
        $matterContributor->amount = $request->amount;
        $matterContributor->transaction_id = $request->transaction_id;
        $matterContributor->user_id = Auth::user()->id;
        if($request->mode == "Cash")
        {
             $matterContributor->status = 0;
        }
        $matterContributor->save();
          
        return response()->json(['status'=>true,'message'=>"Data Saved Successfully."], 200);                
    }

    public function getContributors()
    {
        // dd(Auth::user()->id);
        $categorie = matterContributor::where('user_id',Auth::user()->id)->select('id','transaction_id','mode','status','amount','created_at')->orderBy('id','DESC')->get();
        if(count($categorie) > 0)
        {
       
            if(!empty($categorie))
            {
                foreach ($categorie as $key => $value) {
                    if($value->status == 0)
                    {
                        $value->status  = "Pending";
                    }
                     elseif($value->status == 1)
                    {
                        $value->status  = "Paid";
                    }
                      elseif($value->status == 2)
                    {
                        $value->status  = "Rejected";
                    }
                    // $value->created_at = Carbon::parse($value->created_at)->format('d/m/Y');
                    $value->date = Carbon::parse($value->created_at)->format('d/m/Y');
                    // dd($value->created_at);
                }
            }
            return response()->json(['status'=>true,'message'=>"Contributors Data",'data'=>$categorie], 200);
        }
        else
        {
            return response()->json(['status'=>false,'message'=>"No Data Found",'data'=>''], 200);
        }
    }

    public function userSettings(Request $request)
    {

          $validator = Validator::make($request->all(), [
            // 'categorie_id' => 'required',
            'all_settings'=>'required:in0,1',
            'following_settings'=>'required:in0,1',
            'urgent_settings'=>'required:in0,1',
        ]);
        
        if ($validator->fails()) {
            return response()->json(['status'=>false,'message'=>$validator->errors()->first(),'error'=>$validator->errors()->first()], 200);
        }

        if(!empty($request->categorie_id))
        {
            $categories = $request->categorie_id;
            $categories = explode (",", $categories);

            foreach( $categories as $key => $value)
            {

                 try {

                    $user = categorie::findOrFail($value);

                    }catch (ModelNotFoundException $exception) {

                   return response()->json(['status'=>false,'message'=>"Selected Sector is not Vallid"], 200);
                }
            }    
        }
        
        $find = userNotificationSetting::where('user_id',Auth::user()->id)->select('id')->get()->toArray();
        if(!empty($find))
        {
            $delete = userNotificationSetting::whereIn('id',array_column($find,'id'))->delete();
        }
        
        if(!empty($request->categorie_id))
        {
            foreach($categories as $key => $value)
            {
                $providerTripsCategorie = new userNotificationSetting;
                $providerTripsCategorie->user_id  = Auth::user()->id;
                $providerTripsCategorie->categorie_id = $value;
                $providerTripsCategorie->all_settings = $request->all_settings;
                $providerTripsCategorie->urgent_settings = $request->urgent_settings;
                $providerTripsCategorie->following_settings = $request->following_settings;

                $providerTripsCategorie->save();
            }
        }
        else
        {
            $providerTripsCategorie = new userNotificationSetting;
            $providerTripsCategorie->user_id  = Auth::user()->id;
                // $providerTripsCategorie->categorie_id = "";
            $providerTripsCategorie->all_settings = $request->all_settings;
            $providerTripsCategorie->urgent_settings = $request->urgent_settings;
            $providerTripsCategorie->following_settings = $request->following_settings;
            $providerTripsCategorie->save();
        
        }
        return response()->json(['status'=>true,'message'=>"Settings Saved Successfully"], 200);
        
    }
    public function getUserSettings(Request $request)
    {

        $categorie = userNotificationSetting::where('user_id',Auth::user()->id)->select('categorie_id','id')->get()->toArray();
        
       
        if(count($categorie) > 0)
        {

            $data = array();
            if(!empty(array_column($categorie,'categorie_id')))
            {
                $data['categorie_id'] = implode (",", array_column($categorie,'categorie_id'));
            }
            else
            {
                $data['categorie_id'] = "";   
            }
            
            $data['all_settings'] = userNotificationSetting::where('user_id',Auth::user()->id)->pluck('all_settings')->first();
            $data['urgent_settings'] = userNotificationSetting::where('user_id',Auth::user()->id)->pluck('urgent_settings')->first();
            $data['following_settings'] = userNotificationSetting::where('user_id',Auth::user()->id)->pluck('following_settings')->first();
            $data['lang'] = Auth::user()->lang;
            $categorie = categorie::where('status',1)->get();
            if(count($categorie) > 0)
            {
                foreach ($categorie as $key => $value) {
                    $value->image = url('storage/app/').'/'.$value->image;
                }
            }
            $data['categorie'] = $categorie;
            return response()->json(['status'=>true,'message'=>"Settings data","data"=>$data], 200);    
        }
        else
        {
            $data = array();
            $data['categorie_id'] = "";
            $data['all_settings'] = 0;
            $data['urgent_settings'] = 0;
            $data['lang'] = Auth::user()->lang;
            $categorie = categorie::where('status',1)->get();
            if(count($categorie) > 0)
            {
                foreach ($categorie as $key => $value) {
                    $value->image = url('storage/app/').'/'.$value->image;
                }
            }
            $data['categorie'] = $categorie;
            return response()->json(['status'=>true,'message'=>"No Data Found","data"=>$data], 200);   
        }        
    }
    public function updateLanguage(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'lang' => 'required:in:EN,AR',
        ]);
        
        if ($validator->fails()) {
            return response()->json(['status'=>false,'message'=>$validator->errors()->first(),'error'=>$validator->errors()->first()], 200);
        }

       $user = User::find(Auth::user()->id);
       $user->lang = $request->lang;
       $user->save();
        return response()->json(['status'=>true,'message'=>"Settings Saved Successfully"], 200);
    }
    function date_compare($a, $b)
    {
        $t1 = strtotime($a['testing_date']);
        $t2 = strtotime($b['testing_date']);
        return $t1 - $t2;
    }
    public function arraySort($array)
        {
            $sorted = array_values(Arr::sort($array, function ($value) {
                return $value['id'];
            }));
            return $sorted;
        }



     public function notifications()
    {
        $categorie = userNotification::where('user_id',auth::user()->id)->select('id','notification_text','user_id','matter_id','type','title','title_ar','description','description_ar','image','created_at',DB::raw('DATE(created_at) as date1'))->whereDate('created_at', '>', Carbon::now()->subDays(19))->orderBy('date1','DESC')->get();
        // dd($categorie);
        if(count($categorie) > 0)
        {
             
            foreach ($categorie as $key => $value) {
                if(!empty($value->matter_id))
                {
                    $matter =  matter::find($value->matter_id);  
                    $categorie_detail = categorie::find($matter->categorie_id); 
                    $value->cat_image = url('storage/app/').'/'.$categorie_detail->image;
                    $value->cat_name = $categorie_detail->title;
                    $value->cat_id =  "$categorie_detail->id";
                    $value->titleArabic =$categorie_detail->title_arabic;
                }
                else
                {
                    $value->cat_image = "";
                    $value->cat_name = "";
                    $value->cat_id =  "";
                    $value->titleArabic ="";
                }
               
                if(!empty($value->image))
                $value->image = url('storage/app/').'/'.$value->image;
                else
                $value->image = '';    
                

                $value->date =  $value->created_at->format('g:i A');
                 // $value->testing_date = $value->created_at->format('Y-m-d');
                
            }
            $array_to0 =  array();  
              $array_to1 =  array();
              $array_to2 =  array();
              $array_to3 =  array();
              $array_to4 =  array();
              $array_to5 =  array();
              $array_to6 =  array();
              $array_to7 =  array();
              $array_to8 =  array();
              $array_to9 =  array();
              $array_to10 =  array();
              $array_to11 =  array();
              $array_to12 =  array();
              $array_to13 =  array();
              $array_to14 =  array();
              $array_to15 =  array();
              $array_to16 =  array();
              $array_to17 =  array();
              $array_to18 =  array();
              $array_to19 =  array();
              $array_to20 =  array();
              foreach ($categorie as $key => $value) {
                
               if($value->date1 == Carbon::now()->subDays(0)->todatestring())
               {
                    $array_to0[] = $value;    
               }   
               if($value->date1 == Carbon::now()->subDays(1)->todatestring())
               {
                    $array_to1[] = $value;    
               }
               if($value->date1 == Carbon::now()->subDays(2)->todatestring())
               {
                    $array_to2[] = $value;
               }
               if($value->date1 == Carbon::now()->subDays(3)->todatestring())
               {
                    $array_to3[] = $value;  
               }
               if($value->date1 == Carbon::now()->subDays(4)->todatestring())
               {
                    $array_to4[] = $value;   
               }
               if($value->date1 == Carbon::now()->subDays(5)->todatestring())
               {
                    $array_to5[] = $value;   
               }
               if($value->date1 == Carbon::now()->subDays(6)->todatestring())
               {
                    $array_to6[] = $value;   
               }
               if($value->date1 == Carbon::now()->subDays(7)->todatestring())
               {
                    $array_to7[] = $value;   
               }
               if($value->date1 == Carbon::now()->subDays(8)->todatestring())
               {
                    $array_to8[] = $value;   
               }
               if($value->date1 == Carbon::now()->subDays(9)->todatestring())
               {
                    $array_to9[] = $value;    
               }
               if($value->date1 == Carbon::now()->subDays(10)->todatestring())
               {
                    $array_to10[] = $value;   
               }
               if($value->date1 == Carbon::now()->subDays(11)->todatestring())
               {
                    $array_to11 =  array();
                    $array_to11[] = $value;   
               }
                if($value->date1 == Carbon::now()->subDays(12)->todatestring())
               {
                    $array_to12 =  array();
                    $array_to12[] = $value;   
               }
                if($value->date1 == Carbon::now()->subDays(13)->todatestring())
               {
                    $array_to13 =  array();
                    $array_to13[] = $value;   
               }
                if($value->date1 == Carbon::now()->subDays(14)->todatestring())
               {
                    $array_to14 =  array();
                    $array_to14[] = $value;   
               }
                if($value->date1 == Carbon::now()->subDays(15)->todatestring())
               {
                    $array_to15 =  array();
                    $array_to15[] = $value;   
               }
                if($value->date1 == Carbon::now()->subDays(16)->todatestring())
               {
                    $array_to16 =  array();
                    $array_to16[] = $value;   
               }
                if($value->date1 == Carbon::now()->subDays(17)->todatestring())
               {
                    $array_to17 =  array();
                    $array_to17[] = $value;   
               }
                if($value->date1 == Carbon::now()->subDays(18)->todatestring())
               {
                    $array_to18 =  array();
                    $array_to18[] = $value;   
               }
                if($value->date1 == Carbon::now()->subDays(19)->todatestring())
               {
                    $array_to19 =  array();
                    $array_to19[] = $value;   
               }
                if($value->date1 == Carbon::now()->subDays(20)->todatestring())
               {
                    $array_to20 =  array();
                    $array_to20[] = $value;   
               }
             
              
            }
           
            
            if(!empty($array_to0))
            $categorie1[] = array("header"=>Carbon::now()->subDays(0)->todatestring(),'data'=>$this->arraySort($array_to0));
            if(!empty($array_to1))
            $categorie1[] = array("header"=>Carbon::now()->subDays(1)->todatestring(),'data'=>$this->arraySort($array_to1));
            if(!empty($array_to2))
            $categorie1[] = array("header"=>Carbon::now()->subDays(2)->todatestring(),'data'=>$this->arraySort($array_to2));
            if(!empty($array_to3))
            $categorie1[] = array("header"=>Carbon::now()->subDays(3)->todatestring(),'data'=>$this->arraySort($array_to3));
            if(!empty($array_to4))
            $categorie1[] = array("header"=>Carbon::now()->subDays(4)->todatestring(),'data'=>$this->arraySort($array_to4));
            if(!empty($array_to5))
            $categorie1[] = array("header"=>Carbon::now()->subDays(5)->todatestring(),'data'=>$this->arraySort($array_to5));
            if(!empty($array_to6))
            $categorie1[] = array("header"=>Carbon::now()->subDays(6)->todatestring(),'data'=>$this->arraySort($array_to6));
            if(!empty($array_to7))
            $categorie1[] = array("header"=>Carbon::now()->subDays(7)->todatestring(),'data'=>$this->arraySort($array_to7));
            if(!empty($array_to8))
            $categorie1[] = array("header"=>Carbon::now()->subDays(8)->todatestring(),'data'=>$this->arraySort($array_to8));
            if(!empty($array_to9))
            $categorie1[] = array("header"=>Carbon::now()->subDays(9)->todatestring(),'data'=>$this->arraySort($array_to9));
            if(!empty($array_to10))
            $categorie1[] = array("header"=>Carbon::now()->subDays(10)->todatestring(),'data'=>$this->arraySort($array_to10));
           if(!empty($array_to11))
            $categorie1[] = array("header"=>Carbon::now()->subDays(11)->todatestring(),'data'=>$this->arraySort($array_to11));
            if(!empty($array_to12))
            $categorie1[] = array("header"=>Carbon::now()->subDays(12)->todatestring(),'data'=>$this->arraySort($array_to12));
            if(!empty($array_to13))
            $categorie1[] = array("header"=>Carbon::now()->subDays(13)->todatestring(),'data'=>$this->arraySort($array_to13));
            if(!empty($array_to14))
            $categorie1[] = array("header"=>Carbon::now()->subDays(14)->todatestring(),'data'=>$this->arraySort($array_to14));
            if(!empty($array_to15))
            $categorie1[] = array("header"=>Carbon::now()->subDays(15)->todatestring(),'data'=>$this->arraySort($array_to15));
            if(!empty($array_to16))
            $categorie1[] = array("header"=>Carbon::now()->subDays(16)->todatestring(),'data'=>$this->arraySort($array_to16));
            if(!empty($array_to17))
            $categorie1[] = array("header"=>Carbon::now()->subDays(17)->todatestring(),'data'=>$this->arraySort($array_to17));
            if(!empty($array_to18))
            $categorie1[] = array("header"=>Carbon::now()->subDays(18)->todatestring(),'data'=>$this->arraySort($array_to18));
            if(!empty($array_to19))
            $categorie1[] = array("header"=>Carbon::now()->subDays(19)->todatestring(),'data'=>$this->arraySort($array_to19));
            if(!empty($array_to20))
            $categorie1[] = array("header"=>Carbon::now()->subDays(20)->todatestring(),'data'=>$this->arraySort($array_to20));
      
         return response()->json(['status'=>true,'message'=>"Notifications Data",'data'=>$categorie1], 200);
        }
        else
        {
            return response()->json(['status'=>false,'message'=>"No Data Found",'data'=>$categorie], 200);
        }
    }


}
