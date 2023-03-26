<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateShipmentsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('shipments', function (Blueprint $table) {
            $table->id();
            $table->string('title',255);
            $table->string('from',255);
            $table->string('to',255);
            $table->string('height',255);
            $table->string('width',255);
            $table->string('lenght',255);
            $table->string('weight',255);
            $table->date('date');
            $table->integer('fragile')->default(0);
            $table->mediumText('description');
            $table->string('image',255);
            $table->enum('status', array('Active', 'Booked','Dispatched','Collected','Delivered'));
            $table->bigInteger('user_id')->unsigned();
            $table->foreign('user_id')->references('id')->on('users')
            ->onDelete('cascade');
            $table->bigInteger('categorie_id')->unsigned();
            $table->foreign('categorie_id')->references('id')->on('categories')
            ->onDelete('cascade');
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
        Schema::dropIfExists('shipments');
    }
}
