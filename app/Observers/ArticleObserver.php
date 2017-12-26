<?php

namespace App\Observers;

use App\Models\Article;
use Cache;
use Carbon\Carbon;

class ArticleObserver
{
    public function updated()
    {
        Cache::tags('article')->flush();
    }

    public function saved(Article $article)
    {
//        article cache refresh
        $cacheKey = 'article_'.$article->slug;
        Cache::tags('article')->forever($cacheKey,$article);

//        latest_news cache refresh
        $cacheKey = 'latest_news';
        $newCacheData = Article::where('published_at','<',Carbon::now())->orderBy('published_at', 'desc')->select('name','slug','image','excerpt','featured','published_at')->take(3)->get();
        Cache::forever($cacheKey,$newCacheData);

//        featured_news cache refresh
        $cacheKey = 'featured_news';
        $newCacheData = Article::where('featured',1)->where('published_at','<',Carbon::now())->orderBy('published_at', 'desc')->select('name','slug','image','excerpt','featured','published_at')->take(4)->get();
        Cache::forever($cacheKey,$newCacheData);

    }

    public function deleted(Article $article)
    {
        //        article cache deleted
        $cacheKey = 'article_'.$article->slug;
        $cacheData = Cache::tags('article')->get($cacheKey);
        if($cacheData){
            Cache::tags('article')->forget($cacheKey);
        }

//        latest_news cache refresh
        $cacheKey = 'latest_news';
        $newCacheData = Article::where('published_at','<',Carbon::now())->orderBy('published_at', 'desc')->select('name','slug','image','excerpt','featured','published_at')->take(3)->get();
        Cache::forever($cacheKey,$newCacheData);

//        featured_news cache refresh
        $cacheKey = 'featured_news';
        $newCacheData = Article::where('featured',1)->where('published_at','<',Carbon::now())->orderBy('published_at', 'desc')->select('name','slug','image','excerpt','featured','published_at')->take(4)->get();
        Cache::forever($cacheKey,$newCacheData);
    }
}