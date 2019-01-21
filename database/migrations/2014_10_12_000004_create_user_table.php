<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateUserTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('user', function (Blueprint $table) {
            $table->increments('id_user');
            $table->integer('id_profile')->unsigned();
            $table->foreign('id_profile')->references('id_profile')->on('profile');
            $table->string('name');
            $table->string('login')->unique();
            $table->string('extension', 10)->unique()->nullable();
            $table->string('email')->unique();
            $table->string('password');
            $table->binary('photo')->nullable();
            $table->rememberToken();
            $table->string('ind_st_user')->nullable();
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
        Schema::dropIfExists('user');
    }
}
