<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePushNotificationsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('push_notifications', function (Blueprint $table) {
            $table->id();
              $table->string('title')->nullable();
            $table->string('title_ar')->nullable();
            $table->mediumText('description')->nullable();
            $table->mediumText('description_ar')->nullable();
            $table->string('city');
            $table->string('country');
            $table->string('state');
            $table->string('platform');
            $table->string('users');
             $table->integer('matter_id')->nullable();
            $table->dateTime('send_at')->useCurrent();
            $table->integer('status')->default(1);
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
        Schema::dropIfExists('push_notifications');
    }
}
