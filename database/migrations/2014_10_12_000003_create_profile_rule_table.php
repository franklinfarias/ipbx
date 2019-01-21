<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateProfileRuleTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('profile_rule', function (Blueprint $table) {
            $table->integer('id_profile')->unsigned();
            $table->integer('id_rule')->unsigned();
            $table->foreign('id_profile')->references('id_profile')->on('profile');
            $table->foreign('id_rule')->references('id_rule')->on('rule');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('profile_rule');
    }
}
