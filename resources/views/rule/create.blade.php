@extends('layouts.app')
@section('body-data-page','form_validation')
@section('title', 'Create Rule')
@section('content')

    <!-- BEGIN PAGE LEVEL STYLE/ -->
    <link type="text/css" href={{asset('assets/plugins/bootstrap-select/bootstrap-select.min.css')}} rel="stylesheet">
    <!-- END PAGE LEVEL STYLE -->

    <div id="main-content">
        <div class="page-title"> <i class="icon-custom-left"></i>
            <h2>Rule <small>create a new</small></h2>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-md-12 col-sm-12 col-xs-12">
                                @include('rule._form')
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

@endsection