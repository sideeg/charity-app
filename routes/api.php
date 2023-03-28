<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\API\LoginController;
use App\Http\Controllers\API\userApicontroller;
use App\Http\Controllers\API\providerApicontroller;
/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/
 
// Route::middleware('auth:api')->get('/user', function (Request $request) {
//     return $request->user();
// });
Route::post('contributor/login',[LoginController::class, 'login'])->name('userLogin');
Route::post('contributor/register',[LoginController::class, 'register'])->name('userRegister');
Route::post('contributor/verify-otp',[LoginController::class, 'otpVerify']);
//Same for contributor and provider
Route::post('contributor/forgot-password',[LoginController::class, 'forgotPassUser']);
Route::post('contributor/forgot-pass-verify-otp',[LoginController::class, 'forgotOtpVerify']);
// Route::post('provider/verify-otp',[LoginController::class, 'otpVerifyProvider']);


//etho tak
Route::post('provider/forgot-password',[LoginController::class, 'forgotPassProvider']);
Route::post('provider/forgot-pass-verify-otp',[LoginController::class, 'forgotOtpVerifyProvider']);
 Route::get('get-twillio-chat-token',[LoginController::class, 'generateTwilioToken']);
 Route::get('create-twilio-conversation',[LoginController::class, 'createTwilioConversation']);
 Route::get('get-twillio-messages',[LoginController::class, 'fetchTwilioChat']);
 Route::post('messages-from-channel',[LoginController::class, 'messageOfChannel']);
Route::group( ['prefix' => 'contributor' ],function(){
     Route::get('all-categories',[userApicontroller::class, 'getCategories']);
       Route::post('my-cases',[userApicontroller::class, 'getCases']);
      
});



Route::group( ['prefix' => 'contributor','middleware' => ['auth:user-api','scopes:user'] ],function(){
      Route::post('follow-case',[userApicontroller::class, 'follow']);
      Route::post('unfollow-case',[userApicontroller::class, 'unFollow']);
      Route::post('update-profile',[LoginController::class, 'updateProfile']);
      Route::get('user-logout',[LoginController::class, 'userLogout']);
      Route::get('user-info',[LoginController::class, 'userInfo']);
      Route::post('change-pass',[LoginController::class, 'changePass']);
      Route::post('specific-case-detail',[userApicontroller::class, 'specificCaseDetails']);
      Route::post('get-follower',[userApicontroller::class, 'getFollower']);
      Route::get('bank-info',[userApicontroller::class, 'getBankDetails']);  
      Route::post('make-payment',[userApicontroller::class, 'caseContribute']);
      Route::get('my-contributions',[userApicontroller::class, 'getContributors']); 
      Route::post('notification-settings',[userApicontroller::class, 'userSettings']);
      Route::get('get-notification-settings',[userApicontroller::class, 'getUserSettings']);
      Route::post('update-lang',[userApicontroller::class, 'updateLanguage']);
      Route::get('get-notification',[userApicontroller::class, 'notifications']);


});

Route::post('initiative/register',[LoginController::class, 'registerProvider'])->name('providerRegister');
Route::post('resend-otp',[LoginController::class, 'resendOtp']);
Route::post('initiative/login',[LoginController::class, 'providerLogin'])->name('providerLogin');
Route::post('initiative/verify-otp',[LoginController::class, 'otpVerifyProvider']);

 //Route::get('all-countries',[LoginController::class, 'getCountry']);
 Route::get('all-countries',[LoginController::class, 'getCountry']);

 Route::post('all-states',[LoginController::class, 'allStates']);
 Route::post('all-cities',[LoginController::class, 'allCities']);
Route::group( ['prefix' => 'initiative' ],function(){
    Route::get('all-categories',[providerApicontroller::class, 'getCategories']);
    Route::get('contact-us-api',[providerApicontroller::class, 'contactUs']);
});


Route::group( ['prefix' => 'initiative','middleware' => ['auth:provider-api','scopes:provider'] ],function(){
   // authenticated staff routes here 
    Route::post('update-profile',[LoginController::class, 'updateProvider']);
    Route::get('user-info',[LoginController::class, 'userInfoProvider']);
    Route::post('add-case',[providerApicontroller::class, 'addCase']);
    Route::post('update-case',[providerApicontroller::class, 'updateCase']);
    Route::post('my-cases',[providerApicontroller::class, 'getCases']);
    Route::post('notification-settings',[providerApicontroller::class, 'userSettings']);
    Route::get('get-notification-settings',[providerApicontroller::class, 'getUserSettings']);
    Route::post('specific-case-detail',[providerApicontroller::class, 'specificCaseDetails']);
    Route::post('update-lang',[providerApicontroller::class, 'updateLanguage']);
    Route::post('change-pass',[LoginController::class, 'changePassProvider']);
     Route::post('get-follower',[providerApicontroller::class, 'getFollower']);
    Route::get('my-contributions',[providerApicontroller::class, 'getContributors']); 
    Route::post('update-case-goal',[providerApicontroller::class, 'updateCaseGoals']);





    Route::post('add-account-details',[providerApicontroller::class, 'addDetails']);
    // Route::get('provider-logout',[LoginController::class, 'providerLogout']);
    Route::get('shipment-list',[providerApicontroller::class, 'shipmentList']);
    Route::post('shipment-list-with-filter',[providerApicontroller::class, 'shipmentListWithFilter']);
     // Route::get('shipment-detail',[providerApicontroller::class, 'shipmentDetail']);
     // Route::post('add-bid',[providerApicontroller::class, 'addBid']);
     Route::post('user-settings',[providerApicontroller::class, 'userSetting']);
  
    Route::get('notifications',[providerApicontroller::class, 'notifications']);
    Route::get('logout',[LoginController::class, 'providerLogout']);  
    // Route::get('all-categories',[userApicontroller::class, 'getCategories']);
    // Route::post('user-settings',[userApicontroller::class, 'userSetting']);
    // Route::post('add-shipment',[userApicontroller::class, 'addShipment']);
    // Route::post('change-pass',[LoginController::class, 'changePass']);
});   


