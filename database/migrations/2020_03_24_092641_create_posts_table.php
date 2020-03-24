<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePostsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('posts', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('p_name')->index();
            $table->string('p_slug')->index()->unique();
            $table->string('p_avatar')->nullable();
            $table->text('p_content')->nullable();
            $table->string('p_title_seo')->nullable();
            $table->tinyInteger('p_hot')->default(0);
            $table->tinyInteger('p_active')->default(0);
            $table->text('p_description_seo')->nullable();
            $table->integer('p_category_id')->nullable();
            $table->integer('p_view')->default(0);
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
        Schema::dropIfExists('posts');
    }
}
