@extends('products_menu')
@section('seo_title')
    @if(!$product_category->seo_title)
        {{title_case($product_category->name)}}
    @else
        {{title_case($product_category->seo_title)}}
    @endif
@endsection
@section('meta_description',$product_category->meta_description)
@section('meta_keywords',$product_category->meta_keywords)

@section('page_title')
    <div class="flat-row page-title parallax parallax1">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="page-title-heading">
                        <h1 class="title">{{title_case($product_category->name)}}</h1>
                    </div>
                    <div class="breadcrumbs">
                        <p>{{__('main.you_are_here')}}:</p>
                        <ul>
                            <li><a href="/">{{__('main.home')}}</a></li>
                            <li class="active">{{title_case($product_category->name)}}</li>
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

                <ul class="products">
                    @foreach($category_products as $product)
                    <li class="product-item">
                        <a href="/product/{{$product->slug}}">
                            <img src="{{image_small(Voyager::image($product->image))}}" alt="{{$product->name}}">
                            <h4>{{title_case($product->name)}}</h4>
                        </a>
                    </li>
                        @if($loop->iteration == 3)
                            <div style="clear:both"></div>
                        @endif
                    @endforeach
                </ul>
            </div>
        </div>
    </div>
    <div style="clear:both"></div>
    {{--{{$category_products->links()}}--}}
@endsection