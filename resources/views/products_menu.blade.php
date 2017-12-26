@extends('master')

@section('content')
    <div id="site-content">
        <div class="flat-row flat-products popup pad-top0px">
            <div class="container">
                <div class="row">
                    <div class="products-sidebars">
                        <div class="products-sidebars-wrap">
                            <div class="sidebar">
                                <div class="widget widget_category">
                                    <h3 class="widget-title">{{title_case(__('main.product_categories'))}}</h3>
                                    <ul>
                                        @foreach($product_categories as $product_category)
                                        <li>
                                            <a href="/product_category/{{$product_category->slug}}">{{title_case($product_category->name)}}</a>
                                        </li>
                                        @endforeach
                                    </ul>
                                </div>
                            </div>
                            <div class="sidebar">
                                <div class="widget widget_products">
                                    <h3 class="widget-title">{{title_case(__('main.hot_products'))}}</h3>
                                    <ul class="product_list_widget">
                                        @foreach($featured_products as $featured_product)
                                        <li>
                                            <a href="/product/{{$featured_product->slug}}">
                                                <img src="{{image_small(Voyager::image($featured_product->image))}}" alt="{{$featured_product->name}}">
                                                <span class="product-title">{{title_case($featured_product->name)}}</span>
                                            </a>
                                        </li>
                                        @endforeach
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                   @yield('products_content')
                </div>
            </div>
        </div>
    </div>
@endsection