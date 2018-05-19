<?php

namespace App\Providers;

use App\Models\Article;
use App\Models\Gallery;
use App\Models\Product;
use App\Observers\PageObserver;
use App\Observers\ArticleObserver;
use App\Observers\ProductObserver;
use App\Observers\GalleryObserver;
use Illuminate\Support\ServiceProvider;
use App\Models\ProductCategory;
use TCG\Voyager\Models\Page;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        view()->share('product_categories',ProductCategory::orderBy('order', 'asc')->get());
        view()->share('avg_price',Product::avg('price'));

        Page::observe(PageObserver::class);
        Article::observe(ArticleObserver::class);
        Product::observe(ProductObserver::class);
        Gallery::observe(GalleryObserver::class);
    }

    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }
}
