@extends('master')
@section('seo_title')
    @if(!$page->seo_title)
        {{title_case($page->title)}}
    @else
        {{title_case($page->seo_title)}}
    @endif
@endsection
@section('description')
    @if(!$page->meta_description)
        {{$page->excerpt}}
    @else
        {{$page->meta_description}}
    @endif
@endsection
@section('meta_keywords',$page->meta_keywords)

@section('page_title')
    <div class="flat-row page-title  parallax parallax1">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="page-title-heading">
                        <h1 class="title">{{title_case($page->title)}}</h1>
                    </div>
                    <div class="breadcrumbs">
                        <p>{{title_case(__('main.you_are_here'))}}:</p>
                        <ul>
                            <li><a href="/">{{title_case(__('main.home'))}}</a></li>
                            <li class="active">{{title_case($page->title)}}</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

@section('content')
    <div id="site-content">
        
        <section class="services-detail popup">
            <div class="container">
                {!! $page->body !!}
            </div>
        </section>

        <div class="flat-divider d50px"></div>
    </div>

@endsection