<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateAccountRelationItemTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('account_relation_item', function (Blueprint $table) {
            $table->increments('id_account_relation_item');
            $table->string('name_account_plan',255);
            $table->string('name_item_fbl3n',255);
            $table->string('ind_st_account_relation_item', 10)->nullable();
            $table->integer('id_user_created')->unsigned();
            $table->integer('id_user_updated')->unsigned();
            $table->timestamps(); // cria colunas created_at e updated_at
        });

        Schema::table('account_relation_item', function (Blueprint $table) {
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
        Schema::dropIfExists('account_relation_item');
    }
}
