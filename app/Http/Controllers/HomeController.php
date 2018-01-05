<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Product;
use App\Models\ProductCategory;
use App\Models\Article;
use TCG\Voyager\Models\Category;
use App\Models\Gallery;
use App\Models\GalleryCategory;
use TCG\Voyager\Models\Page;
use Carbon\Carbon;
use Cache;
use App;
use URL;

class HomeController extends Controller
{
    public function index()
    {
        $page = page_cache(1);
        $latest_news = latest_news_cache();

        return view('index',compact('page','latest_news'));
    }

    public function about_us()
    {
        $page = page_cache(2);
        return view('about_us',compact('page'));
    }

    public function contact_us()
    {
        $page = page_cache(3);
        return view('contact_us',compact('page'));
    }

    public function service()
    {
        $page = page_cache(4);
        return view('service',compact('page'));
    }

    public function news()
    {
        $news = Article::where('published_at','<',Carbon::now())->orderBy('published_at', 'desc')->select('name','slug','image','excerpt','featured','published_at')->paginate(12);
        $featured_news = featured_news_cache();

        return view('news',compact('news','featured_news'));
    }

    public function article($slug)
    {
        $new = article_cache($slug);
        $featured_news = featured_news_cache();
        $latest_news = latest_news_cache();

        return view('new',compact('new','featured_news','latest_news'));
    }

    public function product($slug)
    {
        $product = product_cache($slug);
        $related_products = Product::where('product_category_id',$product->product_category_id)->where('id', '<>', $product->id)->orderBy('featured', 'desc')->orderBy('order', 'asc')->select('name','slug','image','order','featured')->take(8)->get();
        $featured_products = featured_products_cache();

        return view('product',compact('product','related_products','featured_products'));
    }

    public function products()
    {
        $products = Product::orderBy('featured', 'desc')->orderBy('order', 'asc')->select('name','slug','image','order','featured')->paginate(12);
        $featured_products = featured_products_cache();

        return view('products',compact('products','featured_products'));
    }

    public function product_category($slug)
    {
        $product_category = ProductCategory::whereSlug($slug)->firstOrFail();
        $category_products = category_products_cache($product_category->id);
        $featured_products = featured_products_cache();

        return view('product_category',compact('product_category','category_products','featured_products'));
    }

    public function functions()
    {
        $products = products_cache();

        return view('functions',compact('products'));
    }

    public function galleries()
    {
        $galleries = galleries_cache();
        $gallery_categories = GalleryCategory::all();

        return view('galleries',compact('galleries','gallery_categories'));
    }

    public function gallery($slug)
    {
        $gallery = gallery_cache($slug);
        $related_galleries = Gallery::where('gallery_category_id',$gallery->gallery_category_id)->where('id', '<>', $gallery->id)->orderBy('order', 'desc')->take(10)->get();

        return view('gallery',compact('gallery','related_galleries'));
    }

    public function sitemap()
    {
        $sitemap = App::make('sitemap');
        $sitemap->setCache('laravel.sitemap', 1440);

        if (!$sitemap->isCached()) {
            $last_article = Article::orderBy('updated_at', 'desc')->firstOrFail();
            $last_product = Product::orderBy('updated_at', 'desc')->firstOrFail();
            // add item to the sitemap (url, date, priority, freq)
            $sitemap->add(URL::to('/'), $last_article->updated_at, '1.0', 'daily');
            $sitemap->add(URL::to('about_us'), page_cache(2)->updated_at, '0.9', 'monthly');
            $sitemap->add(URL::to('contact_us'), page_cache(3)->updated_at, '0.9', 'monthly');
            $sitemap->add(URL::to('service'), page_cache(4)->updated_at, '0.9', 'monthly');
            $sitemap->add(URL::to('news'), $last_article->updated_at, '0.9', 'daily');

            $articles = Article::where('published_at','<',Carbon::now())->orderBy('published_at', 'desc')->select('name','slug','published_at','updated_at')->get();
            foreach ($articles as $article){
                $sitemap->add(URL::to('article/'.$article->slug),$article->updated_at,'0.8','monthly');
            }

            $sitemap->add(URL::to('products'), $last_product->updated_at, '0.9', 'weekly');
            $sitemap->add(URL::to('functions'), $last_product->updated_at, '0.9', 'weekly');

            $products = Product::orderBy('updated_at','desc')->select('name','slug','updated_at')->get();
            foreach ($products as $product){
                $sitemap->add(URL::to('product/'.$product->slug),$product->updated_at,'0.9','weekly');
            }

            $product_categories = ProductCategory::orderBy('updated_at','desc')->select('name','slug','updated_at')->get();
            foreach ($product_categories as $product_category){
                $sitemap->add(URL::to('product_category/'.$product_category->slug),$last_product->updated_at,'0.9','weekly');
            }

        }

        // show your sitemap (options: 'xml' (default), 'html', 'txt', 'ror-rss', 'ror-rdf')
        return $sitemap->render('xml');
    }

//    public function search(Request $request)
//    {
//        $search_words = $request->input('search_words');
//
//        return redirect('/search_result')->with('search_words', $search_words);
//    }
//
//    public function search_result()
//    {
//        $search_words = session('search_words');
//        $products = Product::search($search_words,null,true)->select('name','slug','image','product_code')->paginate(20);
//        $featured_products = Product::whereFeatured(1)->orderBy('updated_at', 'desc')->select('name','slug','image','product_code','featured')->take(9)->get();
//
//        return view('search_products',compact('products','search_words','featured_products'));
//    }

}
