@extends('master')
@section('seo_title')
    @if(!$page->seo_title)
        {{title_case($page->name)}}
    @else
        {{title_case($page->seo_title)}}
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

@section('page_title')
    <div class="flat-row page-title parallax parallax1">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="page-title-heading">
                        <h1 class="title">{{title_case($page->title)}}</h1>
                    </div>
                    <div class="breadcrumbs">
                        <p>{{__('main.you_are_here')}}:</p>
                        <ul>
                            <li><a href="/">{{__('main.home')}}</a></li>
                            <li class="active">{{title_case($page->title)}}</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

@section('content')


    <div id="site-content">

        <section class="services popup">
            <div class="container">
                <div class="row">
                    <div class="col-md-8 col-md-offset-2">
                        <div class="flat-text-content object">
                            {!! $page->body !!}
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <div class="flat-divider d50px"></div>

        <section class="flat-row pad-top100px pad-bottom0px">
            <div class="container">
                <div class="row">
                    <div class="col-md-8 col-md-offset-2">
                        <form  class="flat-contact-form" method="post" action="/contact_submit">
                            @if (count($errors) > 0)
                                <div class="alert alert-danger">
                                    <ul>
                                        @foreach ($errors->all() as $error)
                                            <li>{{ $error }}</li>
                                        @endforeach
                                    </ul>
                                </div>
                            @endif
                            {{csrf_field()}}
                            <input type="hidden" name="url" value="{{url()->current()}}">
                            <div class="quick-appoinment">
                                <div class="row">
                                    <div class="col-md-6">
                                        <input type="text" id="name" name="name" class="input-text-name" placeholder="{{title_case(__('main.name'))}} ({{__('main.required')}})" required="required">
                                    </div>
                                    <div class="col-md-6">
                                        <input type="text" id="email" name="email" class="input-text-email" placeholder="{{title_case(__('main.email'))}} ({{__('main.required')}})" required="required">
                                    </div>
                                </div>

                                <div class="flat-divider d30px"></div>

                                <div class="row">
                                    <div class="col-md-6">
                                        <input type="text" id="phone" name="phone" class="input-text-phone" placeholder="{{title_case(__('main.phone'))}}">
                                    </div>
                                    <div class="col-md-6">
                                        <input type="text" id="subject" name="subject" class="input-text-subject" placeholder="{{title_case(__('main.subject'))}} ({{__('main.required')}})" required="required">
                                    </div>
                                </div>

                                <div class="flat-divider d30px"></div>

                                <div class="row">
                                    <div class="col-md-12">
                                        <textarea class="textarea-question" id="message" name="message" placeholder="{{title_case(__('main.message'))}}"></textarea>
                                    </div>
                                </div>

                                <div class="flat-divider d26px"></div>

                                <div class="row">
                                    <div class="col-md-12">
                                        <input type="submit" name="submit" value="{{title_case(__('main.submit'))}}" class="input-submit">
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>

        <div class="flat-divider d50px"></div>
    </div>
@endsection