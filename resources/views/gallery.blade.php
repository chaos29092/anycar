@extends('master')
@section('seo_title')
    @if(!$gallery->seo_title)
        {{title_case($gallery->name)}}
    @else
        {{title_case($gallery->seo_title)}}
    @endif
@endsection
@section('meta_keywords',$gallery->meta_description)
@section('meta_keywords',$gallery->meta_keywords)

@section('page_title')
    <div class="flat-row page-title parallax parallax1">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="page-title-heading">
                        <h1 class="title">{{title_case($gallery->name)}}</h1>
                    </div>
                    <div class="breadcrumbs">
                        <p>{{title_case(__('main.you_are_here'))}}:</p>
                        <ul>
                            <li><a href="/">{{title_case(__('main.home'))}}</a></li>
                            <li><a href="/galleries">{{title_case(__('main.cases'))}}</a></li>
                            <li class="active">{{title_case($gallery->name)}}</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

@section('content')
    <div id="site-content">
        <section class="gallery content-fullwidth">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="project-gallery-wrap entry">
                            <div class="project-media-item popup">
                                <a href="{{Voyager::image($gallery->image)}}" class="popup-gallery">
                                    <img src="{{Voyager::image($gallery->image)}}" alt="{{$gallery->name}}">
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="project-content">
                            <div class="project-content-wrap">
                                <h3 class="project-title">{{title_case($gallery->name)}}</h3>
                                {!! $gallery->body !!}
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </section>

        <section class="projects projects-related projects-grid">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="projects-related-wrap">
                            <h3 class="projects-related-title">{{title_case(__('main.related_cases'))}}</h3>
                            <div class="projects-items five-columns">
                                @foreach($related_galleries as $related_gallery)
                                <div class="project entry object" >
                                    <div class="project-wrap-related">
                                        <div class="project-thumbnail">
                                            <a href="/gallery/{{$related_gallery->slug}}">
                                                <img src="{{image_small(Voyager::image($related_gallery->image))}}" alt="{{$related_gallery->name}}" >
                                            </a>
                                        </div>

                                        <div class="project-info">
                                            <h3 class="project-title">
                                                <a href="/gallery/{{$related_gallery->slug}}"> {{title_case($related_gallery->name)}}</a>
                                            </h3>
                                            <ul class="project-categories">
                                                <li><a href="/gallery/{{$related_gallery->slug}}">{{title_case($related_gallery->galleryCategory->name)}}</a></li>
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