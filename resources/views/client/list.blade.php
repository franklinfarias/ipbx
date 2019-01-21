<?php
/**
 * list.blade.php : PHP S2N
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
 * @version 1.0
 */
?>
@extends('layouts.app')
@section('body-data-page','tables')
@section('title', 'Client List')
@section('content')

    <div id="main-content">
        <div class="page-title"> <i class="icon-custom-left"></i>
            <h3><strong>List</strong> of the clients</h3>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <a href="{{url('client/create')}}" class="btn btn-primary m-t-10"><i class="fa fa-plus p-r-10"></i> Add a Client</a>
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-md-12 col-sm-12 col-xs-12 table-responsive">
                                <table class="table table-striped table-hover">
                                    <thead class="no-bd">
                                    <tr>
                                        <th><strong>ShortName</strong>
                                        </th>
                                        <th><strong>Name</strong>
                                        </th>
                                        <th>
                                        </th>
                                        <th>
                                        </th>
                                    </tr>
                                    </thead>
                                    <tbody class="no-bd-y">
                                    @foreach($clients as $client)
                                        <tr>
                                            <td>{{$client->short_name}}</td>
                                            <td>{{$client->name}}</td>
                                            <td><a href="{{url('client/edit/'.$client->id_client)}}" class="edit btn btn-sm btn-default"><i class="fa fa-pencil"></i> Edit</a></td>
                                            <td><a href="#" class="delete btn btn-sm btn-default" data-toggle="modal" data-target="#deleteModal" data-id="{{ $client->id_client }}" ><i class="fa fa-trash-o"></i> Remove</a></td>
                                        </tr>
                                    @endforeach
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <!-- Delete Modal -->
                        <div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                        <h4 class="modal-title text-center" id="myModalLabel">Delete Client</h4>
                                    </div>
                                    <div class="modal-body">
                                        <h4 class="text-center">Are you sure you want to delete Client?</h4>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default" data-dismiss="modal"><i class="fa fa-times"></i> Cancel</button>
                                        <button type="button" id="deleteItem" class="btn btn-danger"><i class="fa fa-trash"></i> Delete</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- BEGIN PAGE LEVEL SCRIPTS -->
    <script>
        $(document).on('click', '.delete', function(){
            var id = $(this).data('id');
            $('#deleteItem').val(id);
        });
        $('#deleteItem').click(function(){
            var id = $(this).val();
            $.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                }
            });
            $.post("{{ URL::to('client/delete') }}", {id: id}, function (data) {
                $('#deleteModal').modal('hide');
                window.location.href = "{{ URL::to('client/list') }}";
            })
                .fail(function () {
                    alert("error id:" + id);
                });
        });
    </script>
    <!-- END  PAGE LEVEL SCRIPTS -->
@endsection