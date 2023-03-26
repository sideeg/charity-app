<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMattersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('matters', function (Blueprint $table) {
            $table->id();
            $table->bigInteger('provider_id')->unsigned();
            $table->foreign('provider_id')->references('id')->on('providers')
            ->onDelete('cascade');
            $table->bigInteger('categorie_id')->unsigned();
            $table->foreign('categorie_id')->references('id')->on('categories')
            ->onDelete('cascade');
            $table->string('title')->nullable();
            $table->string('title_ar')->nullable();
            $table->mediumText('description')->nullable();
            $table->mediumText('description_ar')->nullable();
            $table->string('city')->nullable();
            $table->string('city_ar')->nullable();
            $table->string('country')->nullable();
            $table->string('country_ar')->nullable();
            $table->double('goal', 16, 2);
            $table->string('national_number');
            $table->string('national_certificate');
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
        Schema::dropIfExists('matters');
    }
}
