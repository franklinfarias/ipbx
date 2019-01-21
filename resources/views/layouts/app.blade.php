<!DOCTYPE html>
<!--[if lt IE 7]>
<html class="no-js sidebar-large lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>
<html class="no-js sidebar-large lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>
<html class="no-js sidebar-large lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js sidebar-large"> <!--<![endif]-->

<head>
    <!-- BEGIN META SECTION -->
    <meta charset="utf-8">
    <title>{{ config('app.name', 'Laravel') }}</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <meta content="" name="description"/>
    <meta content="themes-lab" name="author"/>
    <link rel="shortcut icon" href={{asset('assets/img/favicon.png')}}>
    <!-- END META SECTION -->
    <!-- BEGIN MANDATORY STYLE -->
    <link type="text/css" href={{asset('assets/css/icons/icons.min.css')}} rel="stylesheet">
    <link type="text/css" href={{asset('assets/css/bootstrap.min.css')}} rel="stylesheet">
    <link type="text/css" href={{asset('assets/css/plugins.css')}} rel="stylesheet">
    <link type="text/css" href={{asset('assets/css/style.min.css')}} rel="stylesheet">
    <link type="text/css" href="#" path="{{asset('assets/css/')}}" rel="stylesheet" id="theme-color">
    <!-- END  MANDATORY STYLE -->
    <script type="text/javascript" src={{asset('assets/plugins/modernizr/modernizr-2.6.2-respond-1.1.0.min.js')}}></script>

</head>

<body data-page="@yield('body-data-page')">
<!-- BEGIN TOP MENU -->
{{--@yield('header') --}}
@include('layouts.header')
<!-- END TOP MENU -->
<!-- BEGIN WRAPPER -->
<div id="wrapper">
    <!-- BEGIN MAIN SIDEBAR -->
    {{-- @yield('menu') --}}
    @include('layouts.menu')
    <!-- END MAIN SIDEBAR -->
    <!-- BEGIN MAIN CONTENT -->
        <!-- BEGIN MANDATORY SCRIPTS -->
        <script type="text/javascript" src={{asset('assets/plugins/jquery-1.11.1.min.js')}}></script>
        <script type="text/javascript" src={{asset('assets/plugins/jquery-migrate-1.2.1.min.js')}}></script>
        <script type="text/javascript" src={{asset('assets/plugins/jquery-ui/jquery-ui-1.11.2.min.js')}}></script>
        <script type="text/javascript" src={{asset('assets/plugins/jquery-mobile/jquery.mobile-1.4.2.js')}}></script>
        <script type="text/javascript" src={{asset('assets/plugins/bootstrap/bootstrap.min.js')}}></script>
        <script type="text/javascript" src={{asset('assets/plugins/bootstrap-dropdown/bootstrap-hover-dropdown.min.js')}}></script>
        <script type="text/javascript" src={{asset('assets/plugins/bootstrap-select/bootstrap-select.js')}}></script>
        <script type="text/javascript" src={{asset('assets/plugins/mcustom-scrollbar/jquery.mCustomScrollbar.concat.min.js')}}></script>
        <script type="text/javascript" src={{asset('assets/plugins/mmenu/js/jquery.mmenu.min.all.js')}}></script>
        <script type="text/javascript" src={{asset('assets/plugins/nprogress/nprogress.js')}}></script>
        <script type="text/javascript" src={{asset('assets/plugins/charts-sparkline/sparkline.min.js')}}></script>
        <script type="text/javascript" src={{asset('assets/plugins/breakpoints/breakpoints.js')}}></script>
        <script type="text/javascript" src={{asset('assets/plugins/numerator/jquery-numerator.js')}}></script>
        <script type="text/javascript" src={{asset('assets/plugins/jquery.cookie.min.js')}}></script>
        <!-- END MANDATORY SCRIPTS -->

    <!-- BEGIN LOADER FOR CALL AJAX -->
    <div id="LoadingImage" style="display: none">
        <img src="{{asset('assets/img/loading2.gif')}}" />
    </div>
    <!-- END LOADER AJAX -->
        
        @yield('content')
    <!-- END MAIN CONTENT -->
</div>
<!-- END WRAPPER -->
<!-- BEGIN CHAT MENU -->
<!-- END CHAT MENU -->
<script type="text/javascript" src={{asset('assets/js/application.js')}}></script>
</body>

</html>