<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Carbon\Carbon;
use App\Models\pushNotifications;
use App\Http\Controllers\SendPushNotification;
use App\Models\User;
use App\Models\Provider;

class pushCron extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'push:cron';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Command To Execute scheduled push notifications';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return int
     */
    public function handle()
    {
        // print_r(Carbon::now()->format('Y-m-d H:i:s'));
        $beforeschedule_time =  Carbon::now();
        $afterschedule_time =  Carbon::now()->addMinute(1);
        $CheckScheduling = pushNotifications::whereBetween('send_at',[$beforeschedule_time,$afterschedule_time])->where('status',0)->get()->first();
        // dd($CheckScheduling);
        if(!empty($CheckScheduling))
        {
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
}
