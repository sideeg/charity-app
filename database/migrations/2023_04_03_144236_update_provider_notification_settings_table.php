<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class UpdateProviderNotificationSettingsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('provider_notification_settings', function (Blueprint $table) {
          $table->integer('all_settings')->default(1);
          $table->integer('following_settings')->default(1);
          $table->integer('urgent_settings')->default(1);


        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('provider_notification_settings', function (Blueprint $table) {
            $table->dropColumn('all_settings');
            $table->dropColumn('following_settings');
            $table->dropColumn('urgent_settings');

        });
    }
}
