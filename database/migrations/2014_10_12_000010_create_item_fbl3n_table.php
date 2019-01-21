<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateItemFbl3nTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('item_fbl3n', function (Blueprint $table) {
            $table->increments('id_item_fbl3n');
            // Atributos da importação da planilha
            $table->integer('code_reason_account')->nullable();
            $table->string('desc_group',255)->nullable();
            $table->string('num_document',20)->nullable();
            $table->string('type_document',5)->nullable();
            $table->string('txt_document',255)->nullable();
            $table->date('dt_document')->nullable();
            $table->date('dt_registry_document')->nullable();
            $table->string('code_reference',50)->nullable();
            $table->string('attribution',20)->nullable();
            $table->string('year_month_reference',10)->nullable();
            $table->string('reversal_indicator',10)->nullable();
            $table->decimal('value_amount',10,2)->nullable();
            $table->string('currency_internal',5)->nullable();
            $table->string('description',255)->nullable();
            $table->string('cost_center',50)->nullable();
            $table->string('order_internal',20)->nullable();
            $table->string('amends_document',20)->nullable();
            $table->string('material',20)->nullable();
            $table->string('username',20)->nullable();
            $table->date('dt_input')->nullable();
            // Atributos de controle
            $table->string('ind_st_item_fbl3n', 10)->nullable();
            $table->integer('id_user_created')->unsigned();
            $table->timestamps(); // cria colunas created_at e updated_at
        });

        Schema::table('item_fbl3n', function ($table) {
            $table->foreign('id_user_created')->references('id_user')->on('user');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('item_fbl3n');
    }
}
