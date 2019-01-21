<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateAccountPlanTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('account_plan', function (Blueprint $table) {
            $table->increments('id_account_plan');
            $table->integer('id_up_account_plan')->unsigned();
            $table->string('code_account_plan', 10);
            $table->string('name_account_plan');
            $table->string('ind_tp_account_plan', 10)->nullable();
            $table->integer('id_user_created')->unsigned();
            $table->integer('id_user_updated')->unsigned();
            $table->timestamps(); // cria colunas created_at e updated_at
        });

        Schema::table('account_plan', function($table) {
            $table->foreign('id_up_account_plan')->references('id_account_plan')->on('account_plan');
            $table->foreign('id_user_created')->references('id_user')->on('user');
            $table->foreign('id_user_updated')->references('id_user')->on('user');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('account_plan');
    }
}
