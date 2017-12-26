<!DOCTYPE html>
<!--[if IE 8 ]><html class="ie" xmlns="http://www.w3.org/1999/xhtml" xml:lang="en-US" lang="en-US"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--><html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en-US" lang="en-US"><!--<![endif]-->
<head>
    
    <meta charset="utf-8">
    <!--[if IE]><meta http-equiv='X-UA-Compatible' content='IE=edge,chrome=1'><![endif]-->
    <title>@yield('seo_title') - {{setting('index.company_name')}}</title>
    <meta name="description" content="@yield('meta_description')">
    <meta name="keywords" content="@yield('meta_keywords')">

    <meta name="author" content="chaos">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="/stylesheets/style_responsive.min.css">

    <link href="/icon/apple-touch-icon-48-precomposed.png" rel="apple-touch-icon-precomposed" sizes="48x48">
    <link href="/icon/apple-touch-icon-32-precomposed.png" rel="apple-touch-icon-precomposed">
    <link href="/icon/favicon.png" rel="shortcut icon">

    <!--[if lt IE 9]>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body class="header-sticky">
<section class="loading-overlay">
    <div class="Loading-Page">
        <h2 class="loader">Loading...</h2>
    </div>
</section>
<div id="site-wrapper">
    <div id="site-header">
        <div id="headerbar">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="custom-info">
                            <i class="fa fa-clock-o">
                            </i>{{setting('index.welcome')}}
                        </div>

                        <nav id="site-navigator" class="top-navigator">
                            <ul id="menu-top-menu" class="menu">
                                <li><a href="/contact_us">{{title_case(__('main.customer_service'))}}</a></li>
                                <li><a href="/contact_us">{{title_case(__('main.contact_us'))}}</a></li>
                                <li class="menu-item-has-children"><a href="#">English</a>
                                    <ul class="sub-menu">
                                        <li ><a href="/">English</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>

        <header id="header" class="header clearfix">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="header-wrap clearfix">
                            <div id="logo" class="logo">
                                <a href="/" rel="home">
                                    <img src="/storage/{{setting('index.logo')}}" alt="logo">
                                </a>
                            </div>
                            <div class="nav-wrap">
                                <div class="btn-menu"></div>
                                <nav id="mainnav" class="mainnav">
                                    <ul class="menu">
                                        <li><a href="/">{{title_case(__('main.home'))}}</a></li>
                                        <li><a href="/about_us">{{title_case(__('main.about_us'))}}</a></li>
                                        <li><a href="/products">{{title_case(__('main.products'))}}</a>
                                            <ul class="submenu">
                                                @foreach($product_categories as $product_category)
                                                    <li><a href="/product_category/{{$product_category->slug}}">{{title_case($product_category->name)}}</a></li>
                                                @endforeach
                                            </ul>
                                        </li>
                                        <li><a href="/news">{{title_case(__('main.news'))}}</a></li>
                                        <li><a href="/service">{{title_case(__('main.service'))}}</a></li>
                                        <li><a href="/contact_us">{{title_case(__('main.contact_us'))}}</a></li>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        @yield('page_title')
    </div>

 @yield('content')

    <div class="site-footer">
        <div class="footer-widgets">
            <div class="container">
                <div class="row">
                    <div id="text01" class="widget widget_text ">
                        <div class="textwidget">
                            <div class="footer-info">
                                <p>
                                    <img  alt="AnyCar" src="/storage/{{setting('index.logo')}}">
                                </p>
                                {!! setting('index.foot') !!}
                            </div>
                        </div>
                    </div>
                    <div class="widget widget_nav_menu">
                        <h3 class="widget-title">{{title_case(__('main.quick_links'))}}</h3>
                        <div class="menu-sample-pages-container">
                            <ul  class="menu">
                                <li ><a href="/about_us">{{title_case(__('main.about_us'))}}</a></li>
                                <li ><a href="/products">{{title_case(__('main.products'))}}</a></li>
                                <li ><a href="/service">{{title_case(__('main.service'))}}</a></li>
                                <li ><a href="/contact_us">{{title_case(__('main.contact_us'))}}</a></li>
                            </ul>
                        </div>
                    </div>

                    <div class="widget widget_nav_menu">
                        <h3 class="widget-title">{{title_case(__('main.product_categories'))}}</h3>
                        <div class="menu-sample-pages-container">
                            <ul  class="menu">
                                @foreach($product_categories as $product_category)
                                    <li><a href="/product_category/{{$product_category->slug}}">{{title_case($product_category->name)}}</a></li>
                                @endforeach
                            </ul>
                        </div>
                    </div>

                    <div class="widget widget_nav_menu">
                        <h3 class="widget-title">{{title_case(__('main.service_and_support'))}}</h3>
                        <div class="menu-sample-pages-container">
                            <ul  class="menu">
                                <li ><a href="/contact_us">{{title_case(__('main.pre_sale_service'))}}</a></li>
                                <li ><a href="/contact_us">{{title_case(__('main.service_and_support'))}}</a></li>
                                <li ><a href="/news">{{title_case(__('main.news'))}}</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="footer-content">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="copyright">
                            <div class="copyright-content">
                                {{setting('index.copyright')}}
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <a class="go-top">
        </a>
    </div>

</div>  


<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.4/js/bootstrap.min.js"></script>
{{--<script type="text/javascript" src="/javascript/jquery.min.js"></script>--}}
{{--<script type="text/javascript" src="/javascript/bootstrap.min.js"></script>--}}
<script type="text/javascript" src="/javascript/mix.min.js"></script>
{{--<script type="text/javascript" src="/javascript/owl.carousel.js"></script>--}}
{{--<script type="text/javascript" src="/javascript/jquery.flexslider-min.js"></script>--}}
{{--<script type="text/javascript" src="/javascript/jquery.magnific-popup.min.js"></script>--}}
{{--<script type="text/javascript" src="/javascript/jquery.sticky.js"></script>--}}
{{--<script type="text/javascript" src="/javascript/jquery.easing.js"></script>--}}
{{--<script type="text/javascript" src="/javascript/jquery-validate.js"></script>--}}
{{--<script type="text/javascript" src="/javascript/parallax.js"></script>--}}
{{--<script type="text/javascript" src="/javascript/imagesloaded.min.js"></script>--}}
{{--<script type="text/javascript" src="/javascript/jquery.isotope.min.js"></script>--}}
{{--<script type="text/javascript" src="/javascript/jquery-waypoints.js"></script>--}}
{{--<script type="text/javascript" src="/javascript/jquery.cookie.js"></script>--}}
<script type="text/javascript" src="/javascript/main.js"></script>

<script type="text/javascript" src="/javascript/themepunch_slider.min.js"></script>
{{--<script type="text/javascript" src="/javascript/jquery.themepunch.tools.min.js"></script>--}}
{{--<script type="text/javascript" src="/javascript/jquery.themepunch.revolution.min.js"></script>--}}
{{--<script type="text/javascript" src="/javascript/slider.js"></script>--}}

</body>
</html>