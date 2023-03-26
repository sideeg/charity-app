<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Validator;
use App\Models\Shipment;
use Illuminate\Support\Facades\Auth;
use App\Models\categorie;
use App\Models\User;
use App\Models\matter;
use App\Models\matterUpdate;
use App\Models\matterAttachment;
use App\Models\matterUpdateAttachment;
use App\Models\providerNotificationSettings;
use App\Models\setting;
use App\Models\follower;
use App\Models\userViews;

use App\Models\matterContributor;
use App\Models\providerNotification;
use DB;
use Carbon\Carbon;
use Illuminate\Database\Eloquent\ModelNotFoundException as ModelNotFoundException;
use App\Models\Provider;
use App\Http\Controllers\SendPushNotification;
use Illuminate\Support\Arr;

class providerApicontroller extends Controller
{
    
    public function getCategories()
    {
        $categorie = categorie::where('status',1)->get();
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

    public function getContributors()
    {
        $categorie = matter::where('provider_id',Auth::user()->id)->select('id')->get()->toArray();
        if(count($categorie) > 0)
        {
            $categorie = matterContributor::whereIn('matter_id',array_column($categorie, 'id'))->select('id','transaction_id','mode','status','amount','created_at')->get();
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

	public function addCase(Request $request)
    {

        //  $message = "New Case Added By Initiator";
        //  $matter = matter::find(11);
        // (new SendPushNotification)->caseAddedByProvider($matter,$message);
        $validator = Validator::make($request->all(), [
            'title' => 'required_if:title_ar,=,null|string|between:2,100|nullable',
            'title_ar' => 'required_if:title,null|string|between:2,100|nullable',
            'national_number' => 'required|max:255',
             'country' => 'required_if:country_ar,=,null|string|between:2,100|nullable',
            'country_ar' => 'required_if:country,=,null|string|between:2,100|nullable',
            'city' => 'required_if:city_ar,=,null|string|between:2,100|nullable',
            'city_ar' => 'required_if:city,=,null|string|between:2,100|nullable',      
            'description' => 'required_if:description_ar,=,null|string|between:2,5000|nullable',
            'description_ar' => 'required_if:description,=,null|string|between:2,5000|nullable',
            'national_certificate' => 'required|mimes:jpeg,jpg,png,gif,pdf|max:10000',
            'goal' => 'required|between:0,999999999999999.99999999',
               'categorie_id' => 'required|exists:categories,id', 
           // 'attachment' => 'required|array|max:5', // <----
           //  'attachment.*' => 'mimes:jpeg,jpg,png,gif,pdf',
            'location' => 'required|string|between:2,100',
               'endDate' => 'required|date_format:Y-m-d',

        ]);
        if ($validator->fails()) {
            return response()->json(['status'=>false,'message'=>$validator->errors()->first(),'error'=>$validator->errors()->first()], 200);
        }

        
        $matter = new matter;
        $matter->title = $request->title;
        $matter->title_ar = $request->title_ar;
        $matter->national_number = $request->national_number;
        $matter->country = $request->country;
        $matter->country_ar = $request->country_ar;
        $matter->city = $request->city;
        $matter->city_ar = $request->city_ar;
        $matter->description = $request->description;
        $matter->description_ar = $request->description_ar;
        $matter->goal = $request->goal;
         $matter->location = $request->location;
        $matter->provider_id  = Auth::user()->id;
        $matter->categorie_id  = $request->categorie_id;
        $serial_no = categorie::find($request->categorie_id)->pluck('serial_no')->first();
        $matter->serial_no = $serial_no.rand(1000,9999);
        $matter->end_date =  $request->endDate ;
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
        // $message = "New Case Added By Initiator";
        // (new SendPushNotification)->caseAddedByProvider($matter,$message);
        if(Auth::user()->lang == 'EN')
        {
            return response()->json(['status'=>true,'message'=>"The case has been sent, it will be verified before publishing"], 200);
        }
        else
        {
            return response()->json(['status'=>true,'message'=>"تمت إضافة البيانات بنجاح"], 200);
        }    

    }

    public function updateCase(Request $request)
    {

        $validator = Validator::make($request->all(), [
            'description' => 'required_without:description_ar|string|between:2,5000',
            'description_ar' => 'required_without:description|string|between:2,5000',
            'matter_id' => 'required|exists:matters,id,provider_id,'.Auth::user()->id, 
          
            //  'attachment' => 'required|array|max:5', // <----
            // 'attachment.*' => 'mimes:jpeg,jpg,png,gif,pdf',

        ]);
        if ($validator->fails()) {
            return response()->json(['status'=>false,'message'=>$validator->errors()->first(),'error'=>$validator->errors()->first()], 200);
        }
        $matter =  matter::find($request->matter_id);
        $matterUpdate = new matterUpdate;
        $matterUpdate->provider_id = Auth::user()->id; 
        $matterUpdate->categorie_id  = $matter->categorie_id;
        $matterUpdate->matter_id  = $request->matter_id;
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
            (new SendPushNotification)->caseUpdatedByProvider($value,$message,$matter->categorie_id,$matter );
        }
        if(Auth::user()->lang == 'EN')
        {
        return response()->json(['status'=>true,'message'=>"Data Updated Successfully"], 200);
        }
        else
        {
            return response()->json(['status'=>true,'message'=>"تمت إضافة البيانات بنجاح"], 200);
        }    

    }
     

    public function updateCaseGoals(Request $request)
    {
        $validator = Validator::make($request->all(), [
             'goal' => 'required|integer|between:0,999999999999999.99999999',  
             'matter_id' => 'required|exists:matters,id,provider_id,'.Auth::user()->id,       
        ]);
        if ($validator->fails()) {
            return response()->json(['status'=>false,'message'=>$validator->errors()->first(),'error'=>$validator->errors()->first()], 200);
        }
        $matter =  matter::find($request->matter_id);
        $contributed_amount= $matter->contributed + $request->goal;
        if($matter->goal < $contributed_amount)
        { 

            return response()->json(['status'=>false,'message'=>"Sorry! You Can Not Proceed Further. Because the goal unit is greater then initial goals unit"], 200);
        }
        $categorie = categorie::find($matter->categorie_id);
        if($categorie->type != "Unit")
        {
            return response()->json(['status'=>false,'message'=>"Sorry! You Can Not Proceed Further. Because the goal unit is diffrent"], 200);
        }
        $matter->contributed = $contributed_amount;
        $matter->save();
        return response()->json(['status'=>true,'message'=>"Data Updated Successfully"], 200);

    }
    public function getCases(Request $request)
    {
        // dd(Auth::user()->token());
           $validator = Validator::make($request->all(), [
       
               'from' => 'date_format:Y-m-d',
                'to' => 'date_format:Y-m-d',
                 'title' => 'max:235|string',
            ]);
        if ($validator->fails()) {
            return response()->json(['status'=>false,'message'=>$validator->errors()->first(),'error'=>$validator->errors()->first()], 200);
        }
       
         if(isset($request->from) || isset($request->to) || isset($request->title))
     
        {
          

            $start = date("Y-m-d",strtotime($request->input('from')));
            $end = date("Y-m-d",strtotime($request->input('to')."+1 day"));
            $categorie=matter::where('status','!=','Deleted')->select('id','title','title_ar','description','description_ar','city','country','goal','national_number','national_certificate','status','created_at','categorie_id','contributed','serial_no')->where('provider_id',Auth::user()->id)->orderBy('id', 'DESC')->whereBetween('created_at',[$start, $end]);
            if(!empty($request->title))
            {
                $categorie->where('title','LIKE', "%{$request->title}%");
            }
            $categorie =$categorie->get();

        }
        else{
            $categorie = matter::where('status','!=','Deleted')->select('id','title','title_ar','description','description_ar','city','country','goal','national_number','national_certificate','status','created_at','categorie_id','contributed','serial_no')->where('provider_id',Auth::user()->id)->orderBy('id', 'DESC')->get();
        }    
       
       
        if(count($categorie) > 0)
        {
            foreach ($categorie as $key => $value) {
               $categorie_find = categorie::find($value->categorie_id);
               $value->national_certificate = url('storage/app/').'/'.$value->national_certificate;
               $value->type = $categorie_find->type;
                 $percentage =  $value->contributed;
                $totalvalue = (int) $value->goal;
                $count1 = $percentage / $totalvalue;
                $count2 = $count1 * 100;
                $count = number_format($count2, 0);
                   $value->percentage = $count;
                if($categorie_find->type == "Money")
                {
                    $unit = "SDG";
                    $value->contributed = $value->contributed.' '.env('CURRENCY');
                    $value->goal =$value->goal.' '.env('CURRENCY');
                }
                else
                {
                    $unit = "Unit";
                    $value->contributed = $value->contributed.' ' .$unit;
                    $value->goal =$value->goal.' '.$unit;
                } 
                
                $value->views = userViews::where('matter_id',$value->id)->count();
               
               if(empty($value->serial_no))
                {
                    $value->serial_no = "";
                }
                $value->date = $value->created_at->todatestring();
                $value->matterAttachment = matterAttachment::where("matter_id",$value->id)->get();
                if(!empty($value->matterAttachment))
                {
                     foreach ($value->matterAttachment as $key => $value) {
                            $value->attachment = url('storage/app/').'/'.$value->attachment;
                     }
                }
            }

            if(Auth::user()->lang == 'EN')
            {
               return response()->json(['status'=>true,'message'=>"Cases Data",'data'=>$categorie], 200);
            }
            else
            {
               return response()->json(['status'=>true,'message'=>" بيانات الحالات ",'data'=>$categorie], 200);
            }
            
        }
        else
        {
            return response()->json(['status'=>false,'message'=>"No Data Found",'data'=>''], 200);
        }
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
        // $is_foolow = follower::where('matter_id',$request->matter_id)->where('user_id',Auth::user()->id)->where('status',1)->count(); 
        // $case->is_follow = $is_foolow;
        $follower =   follower::where('matter_id',$request->matter_id)->where('status',1)->count();
        $case->follower = $follower;
        $matterAttachment = matterAttachment::where('matter_id',$request->matter_id)->select('id','matter_id','attachment')->get();
        if($category_case->type == "Money")
        {
            $case->contributed = $case->contributed. " SDG";
        }
        else
        {
            $case->contributed = $case->contributed." Unit";
        }
        if(!empty($matterAttachment))
        {
            foreach ($matterAttachment as $key => $value) {
                $value->attachment = url('storage/app/').'/'.$value->attachment;
            }
        }

        $case->attachments = $matterAttachment;
        unset($case->user);
         return response()->json(['status'=>true,'message'=>"Case Data",'data'=>$case], 200);   

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
            return response()->json(['status'=>false,'message'=>"Vallidation Error",'error'=>$validator->errors()->first()], 200);
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
        
        $find = providerNotificationSettings::where('provider_id',Auth::user()->id)->select('id')->get()->toArray();
        if(!empty($find))
        {
            $delete = providerNotificationSettings::whereIn('id',array_column($find,'id'))->delete();
        }
        
        if(!empty($request->categorie_id))
        {
            foreach($categories as $key => $value)
            {
                $providerTripsCategorie = new providerNotificationSettings;
                $providerTripsCategorie->provider_id  = Auth::user()->id;
                $providerTripsCategorie->categorie_id = $value;
                $providerTripsCategorie->all_settings = $request->all_settings;
                $providerTripsCategorie->following_settings = $request->following_settings;
                $providerTripsCategorie->urgent_settings = $request->urgent_settings;
                $providerTripsCategorie->save();
            }
        }
        else
        {
             $providerTripsCategorie = new providerNotificationSettings;
                $providerTripsCategorie->provider_id  = Auth::user()->id;
                // $providerTripsCategorie->categorie_id = "";
                $providerTripsCategorie->all_settings = $request->all_settings;
                $providerTripsCategorie->following_settings = $request->following_settings;
                $providerTripsCategorie->urgent_settings = $request->urgent_settings;
                $providerTripsCategorie->save();
        
        }
        return response()->json(['status'=>true,'message'=>"Settings Saved Successfully"], 200);
        
    }
    public function getUserSettings(Request $request)
    {

        $categorie = providerNotificationSettings::where('provider_id',Auth::user()->id)->select('categorie_id','id')->get()->toArray();
        
       
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
            
            $data['all_settings'] = providerNotificationSettings::where('provider_id',Auth::user()->id)->pluck('all_settings')->first();
            $data['following_settings'] = providerNotificationSettings::where('provider_id',Auth::user()->id)->pluck('following_settings')->first();
            $data['urgent_settings'] = providerNotificationSettings::where('provider_id',Auth::user()->id)->pluck('urgent_settings')->first();
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
            $data['following_settings'] = 0;
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
            return response()->json(['status'=>false,'message'=>"Vallidation Error",'error'=>$validator->errors()->first()], 200);
        }

       $user = Provider::find(Auth::user()->id);
       $user->lang = $request->lang;
       $user->save();
        return response()->json(['status'=>true,'message'=>"Settings Saved Successfully"], 200);
    }
     public function getFollower(Request $request)
    {

        $validator = Validator::make($request->all(), [ 
            // 'matter_id' => 'required|exists:matters,id', 
             
        ]);
        if ($validator->fails()) {
            return response()->json(['status'=>false,'message'=>$validator->errors()->first(),'error'=>$validator->errors()->first()], 200);
        }
        $categorie = follower::where('provider_id',Auth::user()->id)->where('status',1)->select('matter_id','user_id','status')->get();
        
        if(count($categorie) > 0)
        {
            
            foreach ($categorie as $key => $value) {
                $user = User::find($value->user_id);
                if($user->image != null)
                {
                    $value->userImage = url('storage/app/').'/'.$user->image;
                }
                else
                {
                    $value->userImage = "";
                }    
               
                $value->userName = $user->name;
            }

            // if(Auth::user()->lang == 'EN')
            // {
               return response()->json(['status'=>true,'message'=>"Cases Data",'data'=>$categorie], 200);
            // }
            // else
            // {
            //    return response()->json(['status'=>true,'message'=>" بيانات الحالات ",'data'=>$categorie], 200);
            // }
            
        }
        else
        {
            return response()->json(['status'=>false,'message'=>"No Data Found",'data'=>""], 200);
        }

     }
      public function contactUs(Request $request)
    {
       
        $categorie =array();
        $categorie['contact_phone'] = setting::where('key','contact_phone')->pluck('value')->first();
        $categorie['contact_phone1'] = setting::where('key','contact_phone1')->pluck('value')->first();
        $categorie['mail'] = setting::where('key','mail')->pluck('value')->first();
        $categorie['address'] = setting::where('key','address')->pluck('value')->first();
        $categorie['website'] = setting::where('key','website')->pluck('value')->first(); 
        $categorie['facebook'] = setting::where('key','facebook')->pluck('value')->first(); 
        $categorie['instagram'] = setting::where('key','instagram')->pluck('value')->first(); 
        $categorie['twitter'] = setting::where('key','twitter')->pluck('value')->first();    
            // if(Auth::user()->lang == 'EN')
            // {
               return response()->json(['status'=>true,'message'=>"General Data",'data'=>$categorie], 200);
            // }
            // else
            // {
            //    return response()->json(['status'=>true,'message'=>" بيانات الحالات ",'data'=>$categorie], 200);
            // }        
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
        $categorie = providerNotification::where('provider_id',auth::user()->id)->select('notification_text','provider_id','matter_id','created_at','type','title','title_ar','description','description_ar','image','id',DB::raw('DATE(created_at) as date1'))->whereDate('created_at', '>=', Carbon::now()->subDays(19))->orderBy('date1','DESC')->get();
        
        if(count($categorie) > 0)
        {
            foreach ($categorie as $key => $value) {
               
                if($value->matter_id != null)
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
                if($value->image != null)
                $value->image = url('storage/app/').'/'.$value->image;
                else
                $value->image = ''; 
                $value->date =  $value->created_at->format('g:i A');
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
