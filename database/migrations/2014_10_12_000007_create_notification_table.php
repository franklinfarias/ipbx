<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateNotificationTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('notification', function (Blueprint $table) {
            $table->increments('id_notification');
            $table->string('ind_tp_notification', 10)->nullable();
            $table->timestamp('notification_time')->nullable();
            $table->integer('id_user_origin')->nullable();
            $table->integer('id_user_destiny')->nullable();
            $table->string('subject');
            $table->text('body')->nullable();
            $table->string('ind_st_notification', 10)->nullable();
            $table->timestamps(); // cria colunas created_at e updated_at
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('notification');
    }
}
