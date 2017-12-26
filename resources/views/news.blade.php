@extends('news_menu')
@section('seo_title',title_case(__('main.news')))
@section('meta_description',title_case(__('main.news')))
@section('meta_keywords',title_case(__('main.news')))

@section('page_title')
    <div class="flat-row page-title  parallax parallax1">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="page-title-heading">
                        <h1 class="title">{{title_case(__('main.news'))}}</h1>
                    </div>
                    <div class="breadcrumbs">
                        <p>{{__('main.you_are_here')}}:</p>
                        <ul>
                            <li><a href="/">{{__('main.home')}}</a></li>
                            <li class="active">{{__('main.news')}}</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

@section('news_content')
    <div class="col-md-9 ">
        <div class="post-wrap two-columns">

            @foreach($news as $new)
            <article class="entry ">
                <div class="feature-post object">
                    <a class="img-post" href="/article/{{$new->slug}}">
                        <img src="{{image_small(Voyager::image($new->image))}}" alt="{{$new->name}}">
                    </a>
                </div>
                <div class="main-post object">
                    <h3 class="entry-title"><a href="/article/{{$new->slug}}">{{title_case($new->name)}}</a></h3>
                    <div class="entry-meta">
                        <span class="entry-time">{{$new->published_at}}</span>
                    </div>
                    <div class="entry-content">
                        {{$new->excerpt}}
                    </div>
                    <a href="/article/{{$new->slug}}" class="button white">{{__('main.read_more')}}</a>
                </div>
            </article>
            @endforeach

            {{$news->links()}}

        </div>
    </div>
@endsection