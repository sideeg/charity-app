<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class UpdateUserTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
         Schema::table('users', function($table) {
        $table->String('device_type');//'in:android,ios'
        $table->String('country_code');
        $table->String('phone_number');
        $table->String('state');
        $table->String('city');
        $table->String('country');
        $table->String('birth_date');
        $table->String('device_token');
        $table->String('otp');
        $table->String('otp_verified');
        $table->String('gender');//in:Male,Female,Other'
        $table->String('type');//in:Individual,Organization
        

    });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('users', function($table) {
        $table->dropColumn('device_type');//'in:android,ios'
        $table->dropColumn('country_code');
        $table->dropColumn('phone_number');
        $table->dropColumn('state');
        $table->dropColumn('city');
        $table->dropColumn('type');
        $table->dropColumn('country');
        $table->dropColumn('birth_date');
        $table->dropColumn('device_token');
        $table->dropColumn('gender');//in:Male,Female,Other'
        $table->dropColumn('otp');
        $table->dropColumn('otp_verified');
    });
    }
}
