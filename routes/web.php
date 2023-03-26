<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Auth\LoginController;
use App\Http\Controllers\Admin\HomeController;
use App\Http\Controllers\Admin\UserController;
use App\Http\Controllers\Admin\ProviderController;
use App\Http\Controllers\Admin\shipmentController;
use App\Http\Controllers\Admin\ContentPageController;
use App\Http\Controllers\Admin\CategoryController;
use App\Http\Controllers\Admin\CountryController;
use App\Http\Controllers\Admin\StateController;
use App\Http\Controllers\Admin\CityController;
use App\Http\Controllers\Admin\CaseController;

use App\Http\Controllers\HomeController as Home;
/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});
Route::get('/deep-link/{id}', [Home::class, 'deepLink'])->name('deep.link');
Route::get('/dashboard', function () {
    return view('dashboard');
})->middleware(['auth'])->name('dashboard');

Route::get('/admin/login', [LoginController::class, 'showAdminLoginForm'])
                // ->middleware('admin.guest')
                ->name('adminLogin');
Route::post('/admin/login', [LoginController::class, 'adminLogin'])
    ->middleware('guest')
    ->name('adminSubmitLogin');
Route::get('/cms/{id}',[Home::class, 'getCms']);
Route::group([ 'prefix' => 'admin','middleware' => ['auth:admin']], function() {
Route::get('/dashboard', [HomeController::class, 'dashboard'])
                ->name('adminDashboard');   
Route::post('/logout', [HomeController::class, 'logout'])
                ->name('logoutAdmin'); 
                Route::get('routes', function () {
    $routeCollection = Route::getRoutes();

    echo "<table style='width:100%'>";
    echo "<tr>";
    echo "<td width='10%'><h4>HTTP Method</h4></td>";
    echo "<td width='10%'><h4>Route</h4></td>";
    echo "<td width='10%'><h4>Name</h4></td>";
    echo "<td width='70%'><h4>Corresponding Action</h4></td>";
    echo "</tr>";
    foreach ($routeCollection as $value) {
        echo "<tr>";
        echo "<td>" . $value->methods()[0] . "</td>";
        echo "<td>" . $value->uri() . "</td>";
        echo "<td>" . $value->getName() . "</td>";
        echo "<td>" . $value->getActionName() . "</td>";
        echo "</tr>";
    }
    echo "</table>";
});

Route::resource('customer', UserController::class); 
Route::resource('contributor', UserController::class); 
Route::resource('initiator', ProviderController::class);
Route::resource('sector', CategoryController::class); 
Route::resource('country', CountryController::class);
Route::resource('state', StateController::class); 
Route::resource('city' ,CityController::class); 
Route::resource('case' ,CaseController::class); 
Route::GET('/get-states', [StateController::class, 'getStates'])->name('admin.states.filter');
Route::GET('/get-cities', [CityController::class, 'getStates'])->name('admin.cities.filter');
Route::GET('/get-cases', [CaseController::class, 'getCases'])->name('admin.cases.filter');
Route::GET('/publish-case/{id}', [CaseController::class, 'casePublish'])->name('admin.cases.publish');
Route::PATCH('/bank-details/{id}', [UserController::class, 'updateBankDetails'] )->name('admin.bank.update');
Route::GET('/bank-details', [UserController::class, 'editAccount']);
Route::PATCH('/case-update1/{id}', [CaseController::class, 'updateCaseDetails'] )->name('admin.case.update1');
Route::GET('/case-contributor/{id}', [CaseController::class, 'caseTransactionSpecific'])->name('admin.case.contributor');



Route::GET('/change-status-sector/{id}', [CategoryController::class, 'changeStatus'] );
Route::GET('/change-status-country/{id}', [CountryController::class, 'changeStatus'] );
Route::GET('/change-status-state/{id}', [StateController::class, 'changeStatus'] );
Route::GET('/change-status-city/{id}', [CityController::class, 'changeStatus'] );
Route::resource('shipments', shipmentController::class);
Route::resource('/cms', ContentPageController::class); 
Route::GET('/get-customers', [UserController::class, 'getUsers'])->name('admin.user.filter');
Route::GET('/get-initiator', [ProviderController::class, 'getProviders'])->name('admin.initiator.filter');
Route::GET('/get-sectors', [CategoryController::class, 'getCategories'])->name('admin.sectors.filter');
Route::GET('/get-country', [CountryController::class, 'getCountries'])->name('admin.country.filter');
Route::GET('/get-shipments', [shipmentController::class, 'getShipments']);
Route::GET('/delete-customer/{id}', [UserController::class, 'delete'] );
Route::GET('/delete-provider/{id}', [ProviderController::class, 'delete'] );
Route::GET('/change-status-customer/{id}', [UserController::class, 'changeStatus'] );
Route::GET('/change-status-provider/{id}', [ProviderController::class, 'changeStatus'] );
Route::GET('/change-status-provider-document/{id}', [ProviderController::class, 'changeStatusDocument'] );
Route::GET('/get-transaction-details', [CaseController::class,'getTransactionDetails'])->name('admin.transaction.filter');
Route::GET('/get-transaction', [CaseController::class,'getTransaction'])->name('admin.transaction');
Route::GET('/change-status-transaction/{id}', [CaseController::class, 'changeStatusTransaction'] );
Route::GET('/dissaprove-transaction/{id}', [CaseController::class, 'dissaproveTransaction'] );

Route::GET('/transaction/{id}', [CaseController::class,'viewTransaction']);
Route::GET('/email-notifications', [UserController::class, 'viewEmail']);
Route::post('/email-notifications', [UserController::class, 'storeEmail'])->name('mail.store');
Route::GET('/bulk-emails', [UserController::class, 'getEmailSend']);
Route::GET('/bulk-emails-lising', [UserController::class, 'getEmailListing']);
Route::GET('/push-notifications', [UserController::class, 'viewEmailSend']);
Route::POST('/push-notifications', [UserController::class, 'storePush'])->name('push.store');
Route::GET('/bulk-push-notifications', [UserController::class, 'getPushSend']);
Route::GET('/bulk-push-notifications-listing', [UserController::class, 'getPushListing']);
Route::GET('/bulk-sms', [UserController::class, 'viewBulkSms']);
Route::POST('/bulk-sms', [UserController::class, 'storeSms'])->name('sms.store');
Route::GET('/bulk-sms-list', [UserController::class, 'getBulkSms']);
Route::GET('/bulk-sms-listing', [UserController::class, 'getSmsListing']);
});                 

require __DIR__.'/auth.php';
