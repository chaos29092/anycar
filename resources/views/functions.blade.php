@extends('master')
@section('seo_title',title_case(__('main.by_functions')))
@section('meta_description',title_case(__('main.by_functions')))
@section('meta_keywords',title_case(__('main.by_functions')))

@section('page_title')
    <div class="flat-row page-title parallax parallax1">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="page-title-heading">
                        <h1 class="title">{{title_case(__('main.by_functions'))}}</h1>
                    </div>
                    <div class="breadcrumbs">
                        <p>{{title_case(__('main.you_are_here'))}}:</p>
                        <ul>
                            <li><a href="/">{{title_case(__('main.home'))}}</a></li>
                            <li class="active">{{title_case(__('main.by_functions'))}}</li>
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
                                    <li><a data-filter=".hair_removal" href="#">{{title_case(__('main.hair_removal'))}}</a></li>
                                    <li><a data-filter=".skin_rejuvenation" href="#">{{title_case(__('main.skin_rejuvenation'))}}</a></li>
                                    <li><a data-filter=".dermatology_gynecology" href="#">{{title_case(__('main.dermatology_gynecology'))}}</a></li>
                                    <li><a data-filter=".body_slimming" href="#">{{title_case(__('main.body_slimming'))}}</a></li>
                                    <li><a data-filter=".tattoo_removal" href="#">{{title_case(__('main.tattoo_removal'))}}</a></li>
                                    <li><a data-filter=".multifunction" href="#">{{title_case(__('main.multifunction'))}}</a></li>
                                </ul>
                            </div>

                            <div class="project-wrap four-columns">
                                @foreach($products as $product)
                                <div class="object project-item entry
                                @if($product->hair_removal)hair_removal @endif
                                @if($product->skin_rejuvenation)skin_rejuvenation @endif
                                @if($product->dermatology_gynecology)dermatology_gynecology @endif
                                @if($product->body_slimming)body_slimming @endif
                                @if($product->tattoo_removal)tattoo_removal @endif
                                @if($product->multifunction)multifunction @endif
                                        ">
                                    <div class="item-wrap ">
                                        <div class="project-thumb">
                                            <a href="/product/{{$product->slug}}" >
                                                <img src="{{image_small(Voyager::image($product->image))}}">
                                            </a>
                                        </div>
                                        <div class="project-info">
                                            <h3 class="project-title">
                                                <a href="/product/{{$product->slug}}">{{title_case($product->name)}}</a>
                                            </h3>
                                            <ul class="project-categories">
                                                <li><a href="/product/{{$product->slug}}">{{title_case($product->productCategory->name)}}</a></li>
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