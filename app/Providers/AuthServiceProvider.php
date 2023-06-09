<?php

namespace App\Providers;

use Illuminate\Foundation\Support\Providers\AuthServiceProvider as ServiceProvider;
use Illuminate\Support\Facades\Gate;
use Laravel\Passport\Passport;

class AuthServiceProvider extends ServiceProvider
{
    /**
     * The policy mappings for the application.
     *
     * @var array
     */
    protected $policies = [
        // 'App\Models\Model' => 'App\Policies\ModelPolicy',
    ];

    /**
     * Register any authentication / authorization services.
     *
     * @return void
     */
    public function boot()
    {
        $this->registerPolicies();

       
        // Passport::routes();
        Passport::routes(null, array('prefix' => 'api/oauth', 'middleware'  =>  array('auth:api', 'web', 'auth')));
        Passport::ignoreCsrfToken(true);

        Passport::tokensCan([
            'user' => 'User Type',
            'admin' => 'Admin User Type',
            'provider' => 'Provider User Type',
        ]);
    }
}
