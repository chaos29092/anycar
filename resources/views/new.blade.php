@extends('news_menu')
@section('seo_title')
    @if(!$new->seo_title)
        {{title_case($new->name)}}
    @else
        {{title_case($new->seo_title)}}
    @endif
@endsection
@section('description')
    @if(!$new->meta_description)
        {{$new->excerpt}}
    @else
        {{$new->meta_description}}
    @endif
@endsection
@section('meta_keywords',$new->meta_keywords)

@section('page_title')
    <div class="flat-row page-title  parallax parallax1" >
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="page-title-heading">
                        <h1 class="title">{{title_case($new->name)}}</h1>
                    </div>
                    <div class="breadcrumbs">
                        <p>{{__('main.you_are_here')}}:</p>
                        <ul>
                            <li><a href="/">{{__('main.home')}}</a></li>
                            <li><a href="/news">{{__('main.news')}}</a></li>
                            <li class="active">{{title_case($new->name)}}</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

@section('news_content')
    <div class="col-md-9">
        <div class="post-wrap">
            <article class="entry">
                <div class="feature-post popup">
                    <img src="{{Voyager::image($new->image)}}" alt="{{$new->name}}">
                </div>
                <div class="main-post">
                    <h3 class="entry-title">{{title_case($new->name)}}</h3>
                    <div class="entry-meta">
                        <span class="entry-time">{{$new->published_at}}</span>
                    </div>
                    <div class="entry-content">
                        {!! $new->body !!}

                    </div>
                </div>
            </article>

            <section class="box related-posts-box three-columns">
                <div class="box-wrapper">
                    <h3 class="box-title">{{title_case(__('main.newest_article'))}}</h3>
                    <div class="box-content">
                        <div class="blog-shortcode blog blog-grid ">

                            <div class="blog-entries">
                                <div class="entries-wrapper">
                                    @foreach($latest_news  as $latest_new)
                                    <article class="entry object">
                                        <div class="entry-wrapper">
                                            <div class="entry-cover">
                                                <a href="/article/{{$latest_new->slug}}">
                                                    <img src="{{image_small(Voyager::image($latest_new->image))}}" alt="{{$latest_new->name}}">
                                                </a>
                                            </div>
                                            <div class="entry-header">
                                                <h2 class="entry-title">
                                                    <a href="/article/{{$latest_new->slug}}">{{title_case($latest_new->name)}}</a>
                                                </h2>

                                                <div class="post-meta">
                                                                        <span class="entry-time">
                                                                            {{$latest_new->published_at}}
                                                                        </span>
                                                </div>
                                            </div>
                                            <div class="entry-content">
                                                {{$latest_new->excerpt}}
                                            </div>
                                        </div>
                                    </article>
                                    @endforeach
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>


        </div>
    </div>
@endsection