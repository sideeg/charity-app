<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class UpdateMattersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('matters', function (Blueprint $table) {
                        $table->string('contributed',255)->nullable();
                        $table->string('location',255)->nullable();
                        $table->string('serial_no',255)->nullable();
                        $table->string('end_date',255)->nullable();




        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('matters', function (Blueprint $table) {
            $table->dropColumn('contributed');
            $table->dropColumn('location');
            $table->dropColumn('serial_no');
            $table->dropColumn('end_date');


        });
    }
}
