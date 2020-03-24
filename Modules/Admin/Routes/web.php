<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

use Illuminate\Support\Facades\Route;

Route::prefix('admin')->group(function () {
    Route::get('/', 'AdminController@index')->name('admin.home');
    Route::group(['prefix' => 'category'], function () {
        Route::get('/', 'AdminCategoryController@index')->name('admin.category.get');
        Route::post('/', 'AdminCategoryController@create');
        Route::get('/{action}/{id}', 'AdminCategoryController@action')->name('admin.get.action.category');
        Route::post('/edit/{id}', 'AdminCategoryController@update');
    });
    Route::group(['prefix' => 'post'], function () {
        Route::get('/', 'AdminPostController@index')->name('admin.post.get');
        Route::get('/create', 'AdminPostController@create')->name('admin.post.create');
        Route::post('/create', 'AdminPostController@store');
        Route::get('/{action}/{id}', 'AdminPostController@action')->name('admin.get.action.post');
        Route::post('/edit/{id}', 'AdminPostController@update');
    });
});
