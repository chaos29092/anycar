<?php

use TCG\Voyager\Models\Page;
use App\Models\Article;
use App\Models\Gallery;
use App\Models\Product;
use App\Models\ProductCategory;
use Carbon\Carbon;

if (!function_exists('image_small')) {
    function image_small($image)
    {
        $image_small_path = null;
        if($image){
            $image_path = pathinfo($image);
            $image_small_path =  $image_path['dirname']."/".$image_path['filename']."-small.".$image_path['extension'];
        }
        return $image_small_path;
    }
}


//Page Cache
if (!function_exists('page_cache')) {
    function page_cache($page_id)
    {
        $cache_key = 'page_'.$page_id;
        $cache_data = Cache::get($cache_key);
        if (!$cache_data){
            $cache_data = Page::find($page_id);
            Cache::forever($cache_key,$cache_data);
        }
        return $cache_data;
    }
}

//Article Cache
if (!function_exists('article_cache')) {
    function article_cache($article_slug)
    {
        $cache_key = 'article_'.$article_slug;
        $cache_data = Cache::tags('article')->get($cache_key);
        if (!$cache_data){
            $cache_data = Article::whereSlug($article_slug)->firstOrFail();
            Cache::tags('article')->forever($cache_key,$cache_data);
        }
        return $cache_data;
    }
}

if (!function_exists('latest_news_cache')) {
    function latest_news_cache()
    {
        $cache_key = 'latest_news';
        $cache_data = Cache::get($cache_key);
        if(!$cache_data){
            $cache_data = Article::where('published_at','<',Carbon::now())->orderBy('published_at', 'desc')->select('name','slug','image','excerpt','featured','published_at')->take(3)->get();
            Cache::forever($cache_key,$cache_data);
        }

        return $cache_data;
    }
}

if (!function_exists('featured_news_cache')) {
    function featured_news_cache()
    {
        $cache_key = 'featured_news';
        $cache_data = Cache::get($cache_key);
        if(!$cache_data){
            $cache_data = Article::where('featured',1)->where('published_at','<',Carbon::now())->orderBy('published_at', 'desc')->select('name','slug','image','excerpt','featured','published_at')->take(4)->get();
            Cache::forever($cache_key,$cache_data);
        }

        return $cache_data;
    }
}

//Product Cache
if (!function_exists('product_cache')) {
    function product_cache($product_slug)
    {
        $cache_key = 'product_'.$product_slug;
        $cache_data = Cache::tags('product')->get($cache_key);
        if (!$cache_data){
            $cache_data = Product::whereSlug($product_slug)->firstOrFail();
            Cache::tags('product')->forever($cache_key,$cache_data);
        }

        return $cache_data;
    }
}

if (!function_exists('products_cache')) {
    function products_cache()
    {
        $cache_key = 'products';
        $cache_data = Cache::get($cache_key);
        if (!$cache_data){
            $cache_data = Product::with('productCategory')->orderBy('order', 'asc')->select('name','price','product_category_id','slug','image','order')->get();
            Cache::forever($cache_key,$cache_data);
        }

        return $cache_data;
    }
}

if (!function_exists('featured_products_cache')) {
    function featured_products_cache()
    {
        $cache_key = 'featured_products';
        $cache_data = Cache::get($cache_key);
        if(!$cache_data){
            $cache_data = Product::whereFeatured(1)->orderBy('order', 'asc')->select('name','price','slug','image','order','featured')->take(4)->get();
            Cache::forever($cache_key,$cache_data);
        }

        return $cache_data;
    }
}

if (!function_exists('category_products_cache')) {
    function category_products_cache($product_category_id)
    {
        $cache_key = 'category_products_' . $product_category_id;
        $cache_data = Cache::get($cache_key);
        if (!$cache_data) {
            $cache_data = Product::where('product_category_id', $product_category_id)->orderBy('featured', 'desc')->orderBy('order', 'desc')->select('name','price','slug', 'image', 'order', 'featured')->get();
            Cache::forever($cache_key, $cache_data);
        }

        return $cache_data;
    }
}

//gallery cache
if (!function_exists('gallery_cache')) {
    function gallery_cache($gallery_slug)
    {
        $cache_key = 'gallery_' . $gallery_slug;
        $cache_data = Cache::tags('gallery')->get($cache_key);
        if (!$cache_data) {
            $cache_data = Gallery::whereSlug($gallery_slug)->firstOrFail();
            Cache::tags('gallery')->forever($cache_key, $cache_data);
        }

        return $cache_data;
    }
}

if (!function_exists('galleries_cache')) {
    function galleries_cache()
    {
        $cache_key = 'galleries';
        $cache_data = Cache::get($cache_key);
        if (!$cache_data) {
            $cache_data = Gallery::with('galleryCategory')->get();
            Cache::forever($cache_key, $cache_data);
        }

        return $cache_data;
    }
}
