<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMatterUpdateAttachmentsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('matter_update_attachments', function (Blueprint $table) {
            $table->id();
            $table->bigInteger('matter_update_id')->unsigned();
            $table->foreign('matter_update_id')->references('id')->on('matter_updates')
            ->onDelete('cascade');
            $table->string('attachment');
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
        Schema::dropIfExists('matter_update_attachments');
    }
}
