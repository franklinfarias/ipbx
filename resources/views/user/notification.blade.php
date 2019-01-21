<?php
/**
 * notification.blade.php : PHP S2N
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
@section('body-data-page','dashboard')
@section('title', 'Notifications')
@section('content')

<!-- BEGIN PAGE LEVEL STYLE/ -->
<link type="text/css" href={{asset('assets/plugins/modal/css/component.css')}} rel="stylesheet">
<!-- END PAGE LEVEL STYLE -->
<div id="main-content" class="dashboard">
    <div class="row">
        <div class="col-lg-12 m-b-20">
            <div class="panel panel-default">
                <div class="panel-heading clearfix pos-rel">
                    <div class="pos-abs top-12 l-15 f-18 c-gray"><i class="fa fa-comments-o"></i> <i class="fa fa-envelope-o"></i>
                    </div>
                    <h2 class="panel-title width-100p c-blue text-center w-500 f-20 carrois">Notifications and Messages</h2>
                    <div class="pos-abs t-10 r-5 f-18 c-blue cursor-pointer">
                        <!-- div class="glyph-icon flaticon-plus16 f-32"></div -->
                    </div>
                </div>
                <div class="panel-body messages">
                    <div class="row">
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="withScroll mCustomScrollbar _mCS_4" data-height="100%" style="height: 480px;">
                                <div class="mCustomScrollBox mCS-dark-2" id="mCSB_4"
                                     style="position:relative; height:100%; overflow:hidden; max-width:100%;">
                                    <div class="mCSB_container" style="position:relative; top:0;">
                                        @foreach ($notifications as $notification)
                                            <a href="#" class="message-item media" data-toggle="modal" data-target="#modal-large{{$notification->id_notification}}">
                                                <div class="media">
                                                    <img src="{{ url('user/image/' . $notification->id_user_origin) }}" alt="avatar"
                                                         class="pull-left" width="50">
                                                    <div class="media-body">
                                                        <small class="pull-right">{{ time_elapsed_string($notification->notification_time) }}</small>
                                                        <h5 class="c-dark">
                                                            @if (!empty($notification->id_user_origin))
                                                                @if ($notification->ind_st_notification == '0')
                                                                    <strong>{{ $notification->userOrigin->name }}</strong>
                                                                @else
                                                                    {{ $notification->userOrigin->name }}
                                                                @endif
                                                            @else
                                                                System
                                                            @endif
                                                        </h5>
                                                        <h4 class="c-dark">{{  $notification->subject }}</h4>
                                                    </div>
                                                </div>
                                                <p class="f-14 c-gray">{{ $notification->body }}</p>
                                            </a>
                                        @endforeach
                                    </div>
                                </div>
                                <div class="mCSB_scrollTools"
                                     style="position: absolute; display: block; opacity: 0;">
                                    <div class="mCSB_draggerContainer">
                                        <div class="mCSB_dragger"
                                             style="position: absolute; height: 342px; top: 0px;"
                                             oncontextmenu="return false;">
                                            <div class="mCSB_dragger_bar"
                                                 style="position: relative; line-height: 342px;">

                                            </div>
                                        </div>
                                        <div class="mCSB_draggerRail">

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Begin Modals -->
                        @foreach ($notifications as $notification)
                            <div class="modal fade" id="modal-large{{$notification->id_notification}}" tabindex="-1" role="dialog" aria-hidden="true">
                                <div class="modal-dialog modal-lg">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                            <h4 class="modal-title"><strong>Subject:</strong> {{$notification->subject}}</h4>
                                        </div>
                                        <div class="modal-body">
                                            {{$notification->body}}
                                        </div>
                                        <div class="modal-footer">
                                            <button id="read-message" data-idnotification="{{$notification->id_notification}}" type="button" class="btn btn-success" data-dismiss="modal">Read</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        @endforeach
                        <!-- end Modals -->
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>

<!-- PAGE LEVEL SCRIPTS -->
<!-- script type="text/javascript" src={{asset('assets/plugins/modal/js/classie.js')}}></script>
<script type="text/javascript" src={{asset('assets/plugins/modal/js/modalEffects.js')}}></script -->
<script>
    $(function () {
        $("button").click(function () {
            var id = this.getAttribute('data-idnotification');
            $.ajax({
                type: "GET",
                url: "/user/readnotification",
                dataType: "json",
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                },
                data: {id: id},
                success: function(data){
                    console.log(data);
                },
                error: function(err,status,error){
                    console.log("Status: "+status+" Error: " + error);
                }
            });
        });
    });
</script>
<!-- END  PAGE LEVEL SCRIPTS -->
@endsection