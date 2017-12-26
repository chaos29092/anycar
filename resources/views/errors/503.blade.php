@extends('master')
@section('seo_title')
    404 - PAGE NOT FOUND
@endsection
@section('description')
    404 - PAGE NOT FOUND
@endsection
@section('meta_keywords','404 - PAGE NOT FOUND')

@section('page_title')
    <div class="flat-row page-title  parallax parallax1">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="page-title-heading">
                        <h1 class="title">404 - PAGE NOT FOUND</h1>
                    </div>
                    <div class="breadcrumbs">
                        <p>{{title_case(__('main.you_are_here'))}}:</p>
                        <ul>
                            <li><a href="/">{{title_case(__('main.home'))}}</a></li>
                            <li class="active">404 - PAGE NOT FOUND</li>
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
                <div class="row">
                    <div class="col-md-12">
                        <div class="flat-404">
                            <div class="content-404">
                                <h2>Looks Like Something Went Wrong!</h2>
                                <p>The page you were looking for is not here.</p>
                            </div><!-- /.content-404 -->
                        </div><!-- /.flat-404 -->
                    </div><!-- /.col-md-12 -->
                </div><!-- /.row -->
            </div>
        </section>

        <div class="flat-divider d50px"></div>
    </div>

@endsection