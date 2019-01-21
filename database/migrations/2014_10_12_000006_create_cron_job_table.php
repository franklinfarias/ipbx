<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateCronJobTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('cron_job', function (Blueprint $table) {
            $table->increments('id_cron_job');
            $table->timestamp('execute_after')->nullable();
            $table->timestamp('executed_at')->nullable();
            $table->integer('succeeded')->nullable();
            $table->string('action')->nullable();
            $table->text('execution_result')->nullable();
            $table->string('ind_tp_cron_job', 10)->nullable();
            $table->string('ind_st_cron_job', 10)->nullable();
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
        Schema::dropIfExists('cron_job');
    }
}
