@extends('master')
@section('seo_title',title_case(__('main.cases')))
@section('meta_description',title_case(__('main.cases')))
@section('meta_keywords',title_case(__('main.cases')))

@section('page_title')
    <div class="flat-row page-title parallax parallax1">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="page-title-heading">
                        <h1 class="title">{{title_case(__('main.cases'))}}</h1>
                    </div>
                    <div class="breadcrumbs">
                        <p>{{title_case(__('main.you_are_here'))}}:</p>
                        <ul>
                            <li><a href="/">{{title_case(__('main.home'))}}</a></li>
                            <li class="active">{{title_case(__('main.cases'))}}</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

@section('content')

    <div id="site-content">
        
        <section class="gallery gallery-v3">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="flat-project flat-animation" data-animation="flipInY" data-animation-delay="0" data-animation-offset="75%">
                            <div class="controlnav-folio">
                                <ul class="project-filter">
                                    <li class="active"><a data-filter="*" href="#">{{title_case(__('main.all'))}}</a></li>
                                    @foreach($gallery_categories as $gallery_category)
                                    <li><a data-filter=".{{$gallery_category->id}}" href="#">{{title_case($gallery_category->name)}}</a></li>
                                    @endforeach
                                </ul>
                            </div>

                            <div class="project-wrap three-columns">
                                @foreach($galleries as $gallery)
                                <div class="object project-item entry {{$gallery->gallery_category_id}}">
                                    <div class="item-wrap ">
                                        <div class="project-thumb">
                                            <a href="/gallery/{{$gallery->slug}}" >
                                                <img src="{{image_small(Voyager::image($gallery->image))}}">
                                            </a>
                                        </div>
                                        <div class="project-info">
                                            <h3 class="project-title">
                                                <a href="/gallery/{{$gallery->slug}}">{{title_case($gallery->name)}}</a>
                                            </h3>
                                            <ul class="project-categories">
                                                <li><a href="/gallery/{{$gallery->slug}}">{{title_case($gallery->galleryCategory->name)}}</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                @endforeach
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </section>

        <div class="flat-divider d50px"></div>
    </div>

@endsection