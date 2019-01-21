@extends('layouts.app')
@section('body-data-page','dashboard')
@section('title', 'Dashboard - Admin')
@section('content')

<!-- BEGIN PAGE LEVEL STYLE/ -->
<link type="text/css" href={{asset('assets/plugins/fullcalendar/fullcalendar.css')}} rel="stylesheet">
<link type="text/css" href={{asset('assets/plugins/metrojs/metrojs.css')}} rel="stylesheet">
<link type="text/css" href={{asset('assets/plugins/charts-circliful/css/jquery.circliful.css')}} rel="stylesheet">
<!-- END PAGE LEVEL STYLE -->

<div id="main-content" class="dashboard">
    Your content
</div>
<div id="tooltip"></div>
<!-- BEGIN PAGE LEVEL SCRIPTS -->

<!-- END  PAGE LEVEL SCRIPTS -->

@endsection