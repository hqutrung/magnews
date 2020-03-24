<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCategoriesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('categories', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('c_name')->unique();
            $table->string('c_slug')->index();
            $table->string('c_avatar')->nullable();
            $table->string('c_description')->nullable();
            $table->integer('c_total')->default(0);
            $table->integer('c_active')->default(0);
            $table->integer('c_hot')->default(0);
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
        Schema::dropIfExists('categories');

    }
}
