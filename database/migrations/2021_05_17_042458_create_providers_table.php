<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProvidersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('providers', function (Blueprint $table) {
            $table->id();
            $table->string('name',255);
            $table->string('name_ar',255);
            $table->string('registration_number',255);
            $table->string('register_image',255);
            $table->string('country',255);
            $table->string('country_ar',255);
            $table->string('city',255);
            $table->string('city_ar',255);
            $table->string('state',255);
            $table->string('device_type',255);//in:android,ios
            $table->string('type',255);//in:Initiative,Broadcast,Sodality

            $table->string('business_name',255);
            $table->string('phone_number',255);
            $table->string('country_code',255);
            $table->string('email')->unique();
            $table->timestamp('email_verified_at')->nullable();
            $table->string('password');
            $table->integer('search_radius')->default(20);
            $table->string('otp',255);
            $table->string('otp_verified',255);
            $table->string('device_token',255);
            $table->string('location',255);
            $table->string('location_ar',255);
            $table->string('contact_number',255);
            $table->string('contact_name',255);
            $table->string('contact_name_ar',255);
            $table->rememberToken();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('providers');
    }
}
