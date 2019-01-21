<?php
/**
* edit.blade.php : PHP ipbx
* Website: http://fksapiens.com.br/
*
* Copyright (c) 1999 - 2017 Franklin Farias <franklin@fksapiens.com.br>
* All Rights Reserved.
*
* This software is released under the terms of the GNU Lesser General Public License v2.1
* A copy of which is available from http://www.gnu.org/copyleft/lesser.html
*
* Written for PHP 5.4, should work with older PHP 4.x versions.
*
* Please submit bug reports, patches, etc to http://wiki.fksapiens.com.br/
* Thanks. :)
*
*
* @package ${NAMESPACE}
* @version 1.0
*/
?>
@extends('layouts.app')
@section('body-data-page','form_validation')
@section('title', 'Edit User')
@section('content')

    <!-- BEGIN PAGE LEVEL STYLE/ -->
    <link type="text/css" href={{asset('assets/plugins/bootstrap-select/bootstrap-select.min.css')}} rel="stylesheet">
    <!-- END PAGE LEVEL STYLE -->

    <div id="main-content">
    <div class="page-title"> <i class="icon-custom-left"></i>
        <h2>User <small>edit the information</small></h2>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            @include('user._form')
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

@endsection