<?php

namespace App\Observers;

use App\Models\Product;
use Cache;

class ProductObserver
{
    public function updated()
    {
        Cache::tags('product')->flush();
    }

    public function saved(Product $product)
    {
//        product_cache refresh
        $cacheKey = 'product_'.$product->slug;
        Cache::tags('product')->forever($cacheKey,$product);

//        featured_products_cache refresh
        $cacheKey = 'featured_products';
        $newCacheData = Product::whereFeatured(1)->orderBy('order', 'asc')->select('name','slug','image','order','featured')->take(4)->get();
        Cache::forever($cacheKey,$newCacheData);

//        category_products_cache refresh
        $cacheKey = 'category_products_'.$product->product_category_id;
        $newCacheData = Product::where('product_category_id',$product->product_category_id)->orderBy('featured', 'desc')->orderBy('order', 'desc')->select('name','slug','image','order','featured')->get();
        Cache::forever($cacheKey,$newCacheData);

//        products_cache refresh
        $cacheKey = 'products';
        $newCacheData = Product::with('productCategory')->orderBy('order', 'asc')->select('name','product_category_id','slug','image','order','hair_removal','skin_rejuvenation','dermatology_gynecology','body_slimming','tattoo_removal','multifunction')->get();
        Cache::forever($cacheKey,$newCacheData);
    }

    public function deleted(Product $product)
    {
        //        article cache deleted
        $cacheKey = 'product_'.$product->slug;
        $cacheData = Cache::tags('product')->get($cacheKey);
        if($cacheData){
            Cache::tags('product')->forget($cacheKey);
        }

//        featured_products_cache refresh
        $cacheKey = 'featured_products';
        $newCacheData = Product::whereFeatured(1)->orderBy('order', 'asc')->select('name','slug','image','order','featured')->take(4)->get();
        Cache::forever($cacheKey,$newCacheData);

//        category_products_cache refresh
        $cacheKey = 'category_products_'.$product->product_category_id;
        $newCacheData = Product::where('product_category_id',$product->product_category_id)->orderBy('featured', 'desc')->orderBy('order', 'desc')->select('name','slug','image','order','featured')->get();
        Cache::forever($cacheKey,$newCacheData);

//        products_cache refresh
        $cacheKey = 'products';
        $newCacheData = Product::with('productCategory')->orderBy('order', 'asc')->select('name','product_category_id','slug','image','order','hair_removal','skin_rejuvenation','dermatology_gynecology','body_slimming','tattoo_removal','multifunction')->get();
        Cache::forever($cacheKey,$newCacheData);
    }
}