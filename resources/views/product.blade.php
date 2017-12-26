@extends('products_menu')
@section('seo_title')
    @if(!$product->seo_title)
        {{title_case($product->name)}}
    @else
        {{title_case($product->seo_title)}}
    @endif
@endsection
@section('description')
    @if(!$product->meta_description)
        {{$product->excerpt}}
    @else
        {{$product->meta_description}}
    @endif
@endsection
@section('meta_keywords',$product->meta_keywords)

@section('page_title')
    <div class="flat-row page-title parallax parallax1">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="page-title-heading">
                        <h1 class="title">{{title_case($product->name)}}</h1>
                    </div>
                    <div class="breadcrumbs">
                        <p>{{__('main.you_are_here')}}:</p>
                        <ul>
                            <li><a href="/">{{__('main.home')}}</a></li>
                            <li><a href="/product_category/{{$product->productCategory->slug}}">{{title_case($product->productCategory->name)}}</a></li>
                            <li class="active">{{title_case($product->name)}}</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

@section('products_content')
    <div class="products-content">
        <div class="products-content-wrap">
            <div class="products-content-inner">
                <div class="single-products">
                    <div class="single-img">
                        <a class="popup-gallery" href="{{Voyager::image($product->image)}}">
                            <img src="{{Voyager::image($product->image)}}" alt="{{$product->name}}">
                        </a>
                    </div>

                    <div class="summary">
                        <h1 class="product_title">{{title_case($product->name)}}</h1>
                        <div class="descriptions">
                            {{$product->excerpt}}
                        </div>
                        <form class="cart">
                            <a href="/contact_us"><button class="single_add_to_cart_button button alt">{{title_case(__('main.contact_us'))}}</button></a>
                        </form>
                        <div class="product_meta">
                                                <span class="posted_in">
                                                    {{title_case(__('main.functions'))}}: <br>
                                                    @if($product->hair_removal)
                                                    <a href="/functions">{{title_case(__('main.hair_removal'))}}</a>@endif
                                                    @if($product->skin_rejuvenation)
                                                        | <a href="/functions">{{title_case(__('main.skin_rejuvenation'))}}</a>@endif
                                                    @if($product->dermatology_gynecology)
                                                        | <a href="/functions">{{title_case(__('main.dermatology_gynecology'))}}</a>@endif
                                                    @if($product->body_slimming)
                                                        | <a href="/functions">{{title_case(__('main.body_slimming'))}}</a>@endif
                                                    @if($product->tattoo_removal)
                                                        | <a href="/functions">{{title_case(__('main.tattoo_removal'))}}</a>@endif
                                                    @if($product->multifunction)
                                                        | <a href="/functions">{{title_case(__('main.multifunction'))}}</a>@endif
                                                </span>
                        </div>
                    </div>

                    <div class="flat-tabs woocommerce-tabs">
                        <ul class="menu-tabs clearfix">
                            <li class="active"><a href="#">{{title_case(__('main.description'))}}</a></li>
                            <li><a href="#">{{title_case(__('main.parameter'))}}</a></li>
                        </ul>
                        <div class="content-tab">
                            <div class="content-inner">
                                {!! $product->body !!}
                            </div>

                            <div class="content-inner">
                                {!! $product->parameter !!}
                            </div>
                        </div>
                    </div>

                    <div class="related-products">
                        <h4>{{title_case(__('main.related_products'))}}</h4>
                        <ul class="products">
                            @foreach($related_products as $related_product)
                            <li class="product-item">
                                <a href="/product/{{$related_product->slug}}">
                                    <img src="{{image_small(Voyager::image($related_product->image))}}" alt="{{$related_product->name}}">
                                    <h4>{{title_case($related_product->name)}}</h4>
                                </a>
                            </li>
                            @endforeach
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection