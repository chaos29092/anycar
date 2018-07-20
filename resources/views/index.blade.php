@extends('master')
@section('seo_title')
    @if(!$page->seo_title)
        {{$page->name}}
    @else
        {{$page->seo_title}}
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


@section('content')

<div class="tp-banner-container">
    <div class="tp-banner" >
        <ul>
            <li data-transition="random-static" data-slotamount="7" data-masterspeed="1000" data-saveperformance="on">
                <img src="{{Voyager::image(setting('index.slide_1'))}}" alt="slider-image" />
            </li>
            <li data-transition="random-static" data-slotamount="7" data-masterspeed="1000" data-saveperformance="on">
                <img src="{{Voyager::image(setting('index.slide_2'))}}" alt="slider-image" />
            </li>
        </ul>
    </div>
</div>


<div id="site-content">
    {{--产品分类--}}
    <section class="flat-row gallery gallery-v3 parallax parallax3 pad-top70px pad-bottom70px">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="flat-project flat-animation" data-animation="flipInY" data-animation-delay="0" data-animation-offset="75%">
                        <div class="project-wrap four-columns ">
                            @foreach($product_categories as $product_category)
                            <div class="object project-item entry carwash">
                                <div class="item-wrap ">
                                    <div class="project-thumb">
                                        <a href="/product_category/{{$product_category->slug}}">
                                            <img src="{{Voyager::image($product_category->image)}}" alt="{{$product_category->name}}">
                                        </a>
                                    </div>
                                    <div class="project-info">
                                        <h3 class="project-title">
                                            <a href="/product_category/{{$product_category->slug}}">{{$product_category->name}}</a>
                                        </h3>
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

    
    <section class="flat-row services pad-bottom0px">
        <div class="container">
            <div class="row">
                <div class="three-columns">
                    <div class="images-single object">
                        <div class="thumb">
                            <a class="img-post" href="/about_us">
                                <img src="{{Voyager::image(setting('index.about_us'))}}" alt="{{__('main.about_us')}}">
                            </a>
                        </div>
                        <div class="desc-img">
                            <h4 class="title">{{title_case(__('main.about_us'))}}</h4>
                            <div class="content">{{setting('index.about_us_excerpt')}}</div>
                            <a class="button white" href="/about_us">{{__('main.read_more')}}</a>
                        </div>
                    </div>

                    <div class="images-single object">
                        <div class="thumb">
                            <a class="img-post" href="/service">
                                <img src="{{Voyager::image(setting('index.tech'))}}" alt="{{title_case(__('main.technology_and_service'))}}">
                            </a>
                        </div>
                        <div class="desc-img">
                            <h4 class="title">{{title_case(__('main.technology_and_service'))}}</h4>
                            <div class="content">{{setting('index.tech_excerpt')}}</div>
                            <a class="button white" href="/service">{{__('main.read_more')}}</a>
                        </div>
                    </div>

                    <div class="object">
                        <form class="flat-contact-form style1" method="post" action="/contact_submit">
                            {{csrf_field()}}
                            <input type="hidden" name="url" value="{{url()->current()}}">
                            <div class="quick-appoinment">
                                <div class="row">
                                    <div class="col-md-12">
                                        <input type="text" id="name" name="name" class="input-text-name" placeholder="{{title_case(__('main.name'))}}" required="required">
                                        <input type="text" id="email" name="email" class="input-text-phone" placeholder="{{title_case(__('main.email'))}}" required="required">
                                        <input type="text" id="subject" name="subject" class="input-text-subject" placeholder="{{title_case(__('main.subject'))}}" required="required">
                                        <textarea class="textarea-question" id="message" name="message" placeholder="{{title_case(__('main.message'))}}" required="required"></textarea>
                                    </div>
                                </div>

                                <div class="flat-divider d26px"></div>

                                <div class="row">
                                    <div class="col-md-12">
                                        <input type="submit" value="{{title_case(__('main.submit'))}}" class="input-submit">
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>


                </div> 
            </div>
        </div>
    </section>

    <section class="flat-row blog blog-grid pad-top70px pad-bottom0px">
        <div class="container">
            <div class="row">
                <div class="col-md-6 col-md-offset-3">
                    <div class="title-section">
                        <h2 class="title">{{title_case(__('main.latest_news'))}}</h2>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-12">
                    <div class="post-wrap three-columns">
                        @foreach($latest_news as $latest_new)
                        <article class="entry object">
                            <div class="feature-post ">
                                <a class="img-post" href="/article/{{$latest_new->slug}}">
                                    <img src="{{Voyager::image(image_small($latest_new->image))}}" alt="{{$latest_new->name}}">
                                </a>
                            </div>
                            <div class="main-post">
                                <h3 class="entry-title"><a href="/article/{{$latest_new->slug}}">{{$latest_new->name}}</a></h3>
                                <div class="entry-meta">
                                    <p class="entry-time">{{$latest_new->published_at}}</p>
                                </div>
                                <div class="entry-content">{{$latest_new->excerpt}}</div>
                            </div>
                        </article>
                        @endforeach
                    </div>
                </div>
            </div>
        </div>

    </section>
</div>
@endsection