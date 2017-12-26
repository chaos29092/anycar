@extends('master')

@section('content')
    <div id="site-content">
        <!-- Blog lager -->
        <section class="blog blog-grid blog-medium sidebar-left">
            <div class="container">
                <div class="row">

                    @yield('news_content')

                    <div class="col-md-3">
                        <div class="sidebar">
                            <div class="widget widget-recentpost">
                                <h4 class="widget-title">{{title_case(__('main.hot_news'))}}</h4>
                                <ul class="recentpost">
                                    @foreach($featured_news as $featured_new)
                                    <li>
                                        <div class="thumb entry">
                                            {{--<a href="/post/{{$featured_new->id}}">--}}
                                                {{--<img src="/images/blog/1.1.jpg" alt="{{$featured_new->title}}">--}}
                                            {{--</a>--}}
                                        </div>
                                        <div class="text">
                                            <h6>
                                                <a href="/article/{{$featured_new->slug}}">{{title_case($featured_new->name)}}</a>
                                            </h6>
                                            <span class="entry-time">{{$featured_new->published_at}}</span>
                                        </div>
                                    </li>
                                    @endforeach
                                </ul>
                            </div>

                            {{--分类菜单--}}
                            {{--<div class="widget widget_category">--}}
                                {{--<h3 class="widget-title">Categories</h3>--}}
                                {{--<ul>--}}
                                    {{--<li>--}}
                                        {{--<a href="#">Car Tuning</a>--}}
                                    {{--</li>--}}
                                    {{--<li>--}}
                                        {{--<a href="#">Care Tips</a>--}}
                                    {{--</li>--}}
                                {{--</ul>--}}
                            {{--</div>--}}
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
@endsection