<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCitiesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('cities', function (Blueprint $table) {
            $table->id();
            $table->bigInteger('countrie_id')->unsigned();
            $table->foreign('countrie_id')->references('id')->on('countries')
            ->onDelete('cascade');
             $table->bigInteger('state_id')->unsigned();
            $table->foreign('state_id')->references('id')->on('states')
            ->onDelete('cascade');
            $table->string('title');
            $table->string('title_arabic');
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
        Schema::dropIfExists('cities');
    }
}
