<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Log;
use App\Models\User;
use App\Models\Provider;
use App\Models\userNotificationSetting;
use App\Models\providerNotificationSettings;
use Exception;
use Auth;
use App\Models\userNotification;
use Carbon\Carbon;
use App\Models\providerNotification;



class SendPushNotification extends Controller
{
    /**
     * New Ride Accepted by a Driver.
     *
     * @return void
     */

    public function date()
    {
        return $date = Carbon::now();
    }
    public function caseAddedByProvider($matter,$message)
    {
        $id = userNotificationSetting::where("categorie_id",$matter->categorie_id)->select('user_id')->get()->toArray();
        $this->sendPushToProvider($matter->provider_id,"Your Case Is now approved by Admin","case_approved"); 
        if(!empty($id))
        {
                    $date = Carbon::now();
            foreach ($id as $key => $value) {
                    $test[] = $this->sendPushToUser($value['user_id'],$message,'case_added');
                        $userNotification = new userNotification;
                        $userNotification->user_id = $value['user_id'];
                        $userNotification->matter_id = $matter->id;
                        $userNotification->notification_text = " New Case Added At ". Carbon::now()->format('d-F-Y')." and case title is ".$matter->title;
                        $userNotification->type= "case_added";
                        $userNotification->save();
    
            }

        }
       
        return;
    }
    public function caseUpdatedByProvider($matter,$message,$categorie_id,$matter_case)
    { 
        $id = userNotificationSetting::where("categorie_id",$categorie_id)->where('user_id',$matter->user_id)->pluck('id')->first();
        if(!empty($id))
        {
            $date = Carbon::now();
            $userNotification = new userNotification;
            $userNotification->user_id = $matter->user_id;
            $userNotification->matter_id = $matter_case->id;
            $userNotification->notification_text =$matter_case->title ." was Updated by Initiator At ". Carbon::now()->format('d-F-Y');
            $userNotification->type= "case_updated";
            $userNotification->save();
            return $this->sendPushToUser($matter->user_id,$message,'case_updated');            
    
        }
        
           
    }
    public function caseUpdatedByProviderFollower($matter,$message,$categorie_id,$matter_case)
    { 
        $id = userNotificationSetting::where("categorie_id",$categorie_id)->where('user_id',$matter->user_id)->where("following_settings",1)->pluck('id')->first();
        if(!empty($id))
        {
            $date = Carbon::now();
            $userNotification = new userNotification;
            $userNotification->user_id = $matter->user_id;
            $userNotification->matter_id = $matter_case->id;
            $userNotification->notification_text =$matter_case->title ." was Updated by Initiator At ". Carbon::now()->format('d-F-Y');
            $userNotification->type= "case_updated";
            $userNotification->save();
            return $this->sendPushToUser($matter->user_id,$message,'case_updated');            
    
        }
        
           
    }
     public function caseGoalAchived($matter,$message,$categorie_id,$matter_case)
    { 
        $id = userNotificationSetting::where("categorie_id",$categorie_id)->where('user_id',$matter->user_id)->pluck('id')->first();
        if(!empty($id))
        {
            $date = Carbon::now();
            $userNotification = new userNotification;
            $userNotification->user_id = $matter->user_id;
            $userNotification->matter_id = $matter_case->id;
            $userNotification->notification_text =$matter_case->title ." Goal Was Achived ". Carbon::now()->format('d-F-Y');
            $userNotification->type= "goal_achived";
            $userNotification->save();
            return $this->sendPushToUser($matter->user_id,$message,'goal_achived');            
    
        }
        
           
    }

    public function caseGoalAchivedFollower($matter,$message,$categorie_id,$matter_case)
    { 
        $id = userNotificationSetting::where("categorie_id",$categorie_id)->where('user_id',$matter->user_id)->where("following_settings",1)->pluck('id')->first();
        if(!empty($id))
        {
            $date = Carbon::now();
            $userNotification = new userNotification;
            $userNotification->user_id = $matter->user_id;
            $userNotification->matter_id = $matter_case->id;
            $userNotification->notification_text =$matter_case->title ." Goal Was Achived ". Carbon::now()->format('d-F-Y');
            $userNotification->type= "goal_achived";
            $userNotification->save();
            return $this->sendPushToUser($matter->user_id,$message,'goal_achived');            
    
        }
        
           
    }
     public function caseClosedAdmin($matter,$message,$categorie_id,$matter_case)
    { 
        $id = userNotificationSetting::where("categorie_id",$categorie_id)->where('user_id',$matter->user_id)->pluck('id')->first();
        if(!empty($id))
        {
            $date = Carbon::now();
            $userNotification = new userNotification;
            $userNotification->user_id = $matter->user_id;
            $userNotification->matter_id = $matter_case->id;
            $userNotification->notification_text =$message ." At ". Carbon::now()->format('d-F-Y');
            $userNotification->type= "case_closed_admin";
            $userNotification->save();
            return $this->sendPushToUser($matter->user_id,$message,'case_closed_admin');            
    
        }
        
           
    }

     public function caseClosedAdminFollower($matter,$message,$categorie_id,$matter_case)
    { 
        $id = userNotificationSetting::where("categorie_id",$categorie_id)->where('user_id',$matter->user_id)->where("following_settings",1)->pluck('id')->first();
        if(!empty($id))
        {
            $date = Carbon::now();
            $userNotification = new userNotification;
            $userNotification->user_id = $matter->user_id;
            $userNotification->matter_id = $matter_case->id;
            $userNotification->notification_text =$message ." At ". Carbon::now()->format('d-F-Y');
            $userNotification->type= "case_closed_admin";
            $userNotification->save();
            return $this->sendPushToUser($matter->user_id,$message,'case_closed_admin');            
    
        }
        
           
    }
    public function transactionApproved($matter,$message,$user_id)
    { 
        $id = userNotificationSetting::where("categorie_id",$matter->categorie_id)->where('user_id',$user_id)->pluck('id')->first();
        if(!empty($id))
        {
            $date = Carbon::now();
            $userNotification = new userNotification;
            $userNotification->user_id = $user_id;
            $userNotification->matter_id = $matter->id;
            $userNotification->notification_text ="Your Transaction For ".$matter->title ."is approved by admin ". Carbon::now()->format('d-F-Y');
            $userNotification->type= "transaction_Approved";
            $userNotification->save();
            return $this->sendPushToUser($user_id,$message,'transaction_Approved');            
    
        }
        
           
    }
    public function caseFollowed($matter,$message){
        // dd($matter->categorie_id);
        $providerNotificationSettings = providerNotificationSettings::where("categorie_id",$matter->categorie_id)->where('provider_id',$matter->provider_id)->pluck('id')->first();

          if(!empty($providerNotificationSettings))
        {
            $providerNotification = new providerNotification;
            $providerNotification->provider_id = $matter->provider_id;
            $providerNotification->matter_id = $matter->id;
             $providerNotification->type = "case_followed";
            $providerNotification->notification_text = $message ." At ". Carbon::now()->format('d-F-Y');
            $providerNotification->save();
             return $this->sendPushToProvider($matter->provider_id,$message,"case_followed"); 
        }

       
    }

     public function caseUnFollowed($matter,$message){
        // dd($matter->categorie_id);
        $providerNotificationSettings = providerNotificationSettings::where("categorie_id",$matter->categorie_id)->where('provider_id',$matter->provider_id)->pluck('id')->first();

          if(!empty($providerNotificationSettings))
        {
            $providerNotification = new providerNotification;
            $providerNotification->provider_id = $matter->provider_id;
            $providerNotification->matter_id = $matter->id;
             $providerNotification->type = "case_unfollowed";
            $providerNotification->notification_text = $message." At ". Carbon::now()->format('d-F-Y');
            $providerNotification->save();
             return $this->sendPushToProvider($matter->provider_id,$message,"case_unfollowed"); 
        }

       
    }
     public function caseContributed($matter,$message){
        $providerNotificationSettings = providerNotificationSettings::where("categorie_id",$matter->categorie_id)->where('provider_id',$matter->provider_id)->pluck('id')->first();
          if(!empty($providerNotificationSettings))
        {
            $providerNotification = new providerNotification;
            $providerNotification->provider_id = $matter->provider_id;
            $providerNotification->matter_id = $matter->id;
            $providerNotification->notification_text = $matter->title." Case was contributed by a new contributor At ". Carbon::now()->format('d-F-Y');
              $providerNotification->type = "case_contributed";
            $providerNotification->save();    
            return $this->sendPushToProvider($matter->provider_id,$message,"case_contributed"); 
        }

       
    }

    public function caseContributedGoal($matter,$message){
        $providerNotificationSettings = providerNotificationSettings::where("categorie_id",$matter->categorie_id)->where('provider_id',$matter->provider_id)->pluck('id')->first();
          if(!empty($providerNotificationSettings))
        {
            $providerNotification = new providerNotification;
            $providerNotification->provider_id = $matter->provider_id;
            $providerNotification->matter_id = $matter->id;
            $providerNotification->notification_text = $matter->title." Case was contributed by a new contributor and Goal Achived At ". Carbon::now()->format('d-F-Y');
              $providerNotification->type = "case_contributed";
            $providerNotification->save();    
            return $this->sendPushToProvider($matter->provider_id,$message,"case_contributed"); 
        }

       
    }


    public function notificationToUser($id,$message,$data){

         $userNotification = new userNotification;
            $userNotification->user_id = $id;
            if(!empty($data['matter_id']))
            $userNotification->matter_id = $data['matter_id'];
            $userNotification->notification_text =" New Notification from Admin At ". Carbon::now()->format('d-F-Y');
            $userNotification->type = "admin";
            $userNotification->title = $data['title'];
            $userNotification->title_ar = $data['title_ar'];
            $userNotification->description = $data['description'];
            $userNotification->description_ar = $data['description_ar'];
            if(!empty($data['image1']))
            $userNotification->image = $data['image1'];
            else
              $userNotification->image = '';   
            $userNotification->save();
        return $this->sendPushToUser($id,$message,'Notification_admin',$data);  

    }    
     public function notificationToProvider($id,$message,$data){

             $providerNotification = new providerNotification;
            $providerNotification->provider_id = $id;
            if(!empty($data['matter_id']))
            $providerNotification->matter_id = $data['matter_id'];
            $providerNotification->notification_text = " New Notification from Admin At ". Carbon::now()->format('d-F-Y');
            $providerNotification->type = "admin";
            $providerNotification->title = $data['title'];
            $providerNotification->title_ar = $data['title_ar'];
            $providerNotification->description = $data['description'];
            $providerNotification->description_ar = $data['description_ar'];
            if(!empty($data['image1']))
         $providerNotification->image = $data['image1'];  
            else
            $providerNotification->image = "";    
            $providerNotification->save();     
        return $this->sendPushToProvider($id,$message,'Notification_admin',$data); 

    }    
    // public function UserChatMessage($request){

    //     return $this->sendPushToProvider($request->receiver_id,$request->message,"chat");
    // }

    public function userAcceptedBid($user_id,$message){

        return $this->sendPushToProvider($user_id,$message,"userBidAccepted");
    }

     public function adminMessageProvider($user_id){
          // dd($user_id);
        return $this->sendPushToProvider($user_id, "New Message By Admin",'admin_chat');
    }
    /**
     * Sending Push to a user Device.
     *
     * @return void
     */
    public function sendPushToUser($user_id, $push_message,$type_mess="",$data = ""){

    	try{

	    	$user = User::findOrFail($user_id);
            
            if($user->device_token != ""){

                if($user->device_type == 'ios'){
                    
                    return $this->iosNotificationUser($user->device_token,$push_message,$type_mess,$data);

                }
                if($user->device_type == 'android'){
                    return $this->androidNotificationToUser($user->device_token,$push_message,$type_mess,$data);
    	    	
                }

    	} 
    }
    	catch(Exception $e){
    		return $e;
    	}

    }

    /**
     * Sending Push to a user Device.
     *
     * @return void
     */
    public function sendPushToProvider($provider_id, $push_message,$type_mess="",$data=""){

    	try{

	    	$provider = Provider::where('id',$provider_id)->first();
            
            // dd($provider);
               // dd($provider, $push_message);
            // $obj = new \PushNotification();
            // print_r($obj);
            // die();

            if($provider->device_token != ""){

            	if($provider->device_type == 'ios'){
            		
                        return $this->iosNotification($provider->device_token,$push_message,$type_mess,$data);
                   
                  
                    

            	}elseif($provider->device_type == 'android'){
                     
                        return $this->androidNotification($provider->device_token,$push_message,$type_mess,$data); 
                      
            	}
            }

    	} catch(Exception $e){
    		return $e;
    	}

    }


    public function androidNotification($token,$type,$type_mess="",$data) {  
           
        $fields = array
            (
                'registration_ids' => [$token], //  for  multiple users
                'data'  => ["data"=>$data,"type"=>$type_mess,"message"=>$type,"title"=>$type,"body"=>$type,"type_mess"=>$type_mess]
            );  

        $headers = array
        (
        'Authorization: key='.env('FCM_KEY'),
    'Content-Type: application/json'
        ); 
        $ch = curl_init();
        //curl_setopt( $ch,CURLOPT_URL, 'https://android.googleapis.com/gcm/send' );
        curl_setopt($ch,CURLOPT_URL, 'https://fcm.googleapis.com/fcm/send' );
        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($fields));
        $result = curl_exec($ch);
        Log::info('FCM response: '. $result);
        // print_r($result); die();
        if ($result === FALSE) {
            die('FCM Send Error: ' . curl_error($ch));
        }
        // print_r($result);
        // die();
        curl_close($ch);
        
    }

     public function androidNotificationToUser($token,$type,$type_mess="",$data="") {  
                    
            $fields = array
                (
                'registration_ids' => [$token], //  for  multiple users
            'data'  => ["data"=>$data,"type"=>$type_mess,"message"=>$type,"title"=>$type,"body"=>$type,"type_mess"=>$type_mess]
                );
    
        
         

    //     $fields = array
    //     (
    //     'registration_ids' => [$token], //  for  multiple users
    // 'data'  => ["data"=>['123'],"type"=>$type,"message"=>$type,"type_mess"=>$type_mess]
    //     );

        $headers = array
        (
        'Authorization: key='.env('FCM_KEY'),
    'Content-Type: application/json'
        ); 
        $ch = curl_init();
        //curl_setopt( $ch,CURLOPT_URL, 'https://android.googleapis.com/gcm/send' );
        curl_setopt($ch,CURLOPT_URL, 'https://fcm.googleapis.com/fcm/send' );
        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($fields));
        $result = curl_exec($ch);
        // dd($result);
              if ($result === FALSE) {
            die('FCM Send Error: ' . curl_error($ch));
        }
              
        curl_close($ch);
      
        return $result;
      
    }
    public function iosNotification( $device_tokens,$message,$type_mess="",$data="") {
        
        // if(empty($data))
        //     $data=array();

        $url = "https://fcm.googleapis.com/fcm/send";
        $registrationIds=$device_tokens;
         $message= $message;
         
         // $registrationIds = "cPnjNtXyR0_Th3_vclbYJM:APA91bHkT_MEX2ZuAOP52Ku2qPMkSnJOcIdjD9XOw1yiYik8pELit4tGMLQNQYMHZ9qDEz_clojwrikkP2hOQyNve8tdKJBcIvzBksbz5wyd9LsuWRqa6syYXTZAYBWQjTR6I42h9PYr";

         // $serverKey='AAAAGzXYpf0:APA91bEEn8Qjb3yIzCOC1WjJz4E95Qn6YLTV3N4ZgNZiKto5gnMu7oofpSVgETbeaaQkDxLHe7COs659x8jYazCpXnC9Jbg0DFzKuwiVvB1EVUSa9pxAvIaWINzBEu80TLmrCTGSjs8U';
         $serverKey =env('FCM_KEY');
         // $title = $message;
         
            $title = $message;
     

         $body = $message;
         $notification = array('title' =>$title , 'body' => $body, 'sound' => 'default','type'=>$type_mess,'data'=>$data);
         $arrayToSend = array('to' => $registrationIds, 'notification'=>$notification,'priority'=>'high','type'=>$type_mess);
          
         $json = json_encode($arrayToSend);
           // dd($json);
         $headers = array();
         $headers[] = 'Content-Type: application/json';
         $headers[] = 'Authorization: key='. $serverKey;
         
                                            
         $ch = curl_init();
          // dd($ch);
         curl_setopt($ch, CURLOPT_URL, $url);
         curl_setopt($ch, CURLOPT_CUSTOMREQUEST,"POST");
         curl_setopt($ch, CURLOPT_POSTFIELDS, $json);
         curl_setopt($ch, CURLOPT_HTTPHEADER,$headers);
         curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        $result = curl_exec($ch);
        // dd($result);
         if ($result === true) 
         {
            die('FCM Send Error: ' . curl_error($ch));
         }
            return $result;

    }
    public function iosNotificationUser( $device_tokens,$message,$notification_type="",$data ="") {
        

         $url = "https://fcm.googleapis.com/fcm/send";
         $registrationIds=$device_tokens;
         $message= $message;
         $serverKey = env('FCM_KEY');
         
       
            $title = $message;
   

         $body = $message;
         $notification = array('title' =>$title , 'body' => $body, 'sound' => 'default',"type"=>$notification_type,'data'=>$data);
         $arrayToSend = array('to' => $registrationIds, 'notification'=>$notification,'priority'=>'high',"type"=>$notification_type );
           
         $json = json_encode($arrayToSend);
             
         $headers = array();
         $headers[] = 'Content-Type: application/json';
         $headers[] = 'Authorization: key='. $serverKey;
         
                                            
         $ch = curl_init();
          // dd($ch);
         curl_setopt($ch, CURLOPT_URL, $url);
         curl_setopt($ch, CURLOPT_CUSTOMREQUEST,"POST");
         curl_setopt($ch, CURLOPT_POSTFIELDS, $json);
         curl_setopt($ch, CURLOPT_HTTPHEADER,$headers);
         curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        $result = curl_exec($ch);
         
        // dd($result);
         if ($result === true) 
         {
            die('FCM Send Error: ' . curl_error($ch));
         }
            return $result;

    }
    public function testNotification($token,$type) {  
             
        $fields = array
        (
        'registration_ids' => [$token], //  for  multiple users
    'data'  => ["type"=>1,"body"=>"body","Title"=>"Title"]
        );

        $headers = array
        (
        'Authorization: key=',
    'Content-Type: application/json'
        ); 

        $ch = curl_init();
        //curl_setopt( $ch,CURLOPT_URL, 'https://android.googleapis.com/gcm/send' );
        curl_setopt($ch,CURLOPT_URL, 'https://fcm.googleapis.com/fcm/send' );
        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($fields));
        $result = curl_exec($ch);
        Log::info('FCM response: '. $result);
        // print_r($result); die();
        if ($result === FALSE) {
            die('FCM Send Error: ' . curl_error($ch));
        }
       
        curl_close($ch);
        
    }


}