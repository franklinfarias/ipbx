<?php
/**
 * list.blade.php : PHP ipbx
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
@section('body-data-page','tables')
@section('title', 'Profile List')
@section('content')

    <div id="main-content">
        <div class="page-title"> <i class="icon-custom-left"></i>
            <h3><strong>List</strong> of the profiles</h3>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <a href="{{url('profile/create')}}" class="btn btn-primary m-t-10"><i class="fa fa-plus p-r-10"></i> Add a Profile</a>
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-md-12 col-sm-12 col-xs-12 table-responsive">
                                <table class="table table-striped table-hover">
                                    <thead class="no-bd">
                                    <tr>
                                        <th><strong>Name</strong>
                                        </th>
                                        <th>
                                        </th>
                                        <th>
                                        </th>
                                    </tr>
                                    </thead>
                                    <tbody class="no-bd-y">
                                    @foreach($profiles as $obj)
                                        <tr>
                                            <td>{{$obj->name_profile}}</td>
                                            <td><a href="{{url('profile/edit/'.$obj->id_profile)}}" class="edit btn btn-sm btn-default"><i class="fa fa-pencil"></i> Edit</a></td>
                                            <td><a href="#" class="delete btn btn-sm btn-default"><i class="fa fa-times-circle"></i> Remove</a></td>
                                        </tr>
                                    @endforeach
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- BEGIN PAGE LEVEL SCRIPTS -->

    <!-- END  PAGE LEVEL SCRIPTS -->
@endsection