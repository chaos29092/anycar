<?php

Route::get('/', 'HomeController@index');
Route::get('about_us', 'HomeController@about_us');
Route::get('contact_us', 'HomeController@contact_us');
Route::get('service', 'HomeController@service');

Route::get('news', 'HomeController@news');
Route::get('article/{slug}', 'HomeController@article');

Route::get('product/{slug}', 'HomeController@product');
Route::get('products', 'HomeController@products');
Route::get('product_category/{slug}', 'HomeController@product_category');
//Route::get('functions', 'HomeController@functions');

Route::get('galleries', 'HomeController@galleries');
Route::get('gallery/{slug}', 'HomeController@gallery');

Route::get('sitemap.xml', 'HomeController@sitemap');

Route::post('contact_submit', 'MailController@submit');
Route::get('submit_ok', 'MailController@submit_ok');

//Route::post('search', 'HomeController@search');
//Route::get('search_result', 'HomeController@search_result');

Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();
});
