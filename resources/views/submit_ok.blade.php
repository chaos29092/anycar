@extends('master')

@section('page_title')
    <div class="flat-row page-title  parallax parallax1">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="page-title-heading">
                        <h1 class="title">{{title_case(__('main.submit_success'))}}</h1>
                        <p class="subtitle">{{__('main.thank_you_for_your_message')}}</p>
                    </div>
                    <div class="breadcrumbs">
                        <p>{{__('main.you_are_here')}}:</p>
                        <ul>
                            <li><a href="/">{{__('main.home')}}</a></li>
                            <li class="active">{{title_case(__('main.submit_success'))}}</li>
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
                <h3>{{title_case(__('main.submit_success'))}}.</h3>
                <p>{{__('main.we_will_contact')}}</p>
            </div>
        </section>

        <div class="flat-divider d50px"></div>
    </div>

@endsection