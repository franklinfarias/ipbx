<?php
/**
 * header.blade.php : PHP S2N
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

$notifys = \App\Http\Controllers\Controller::getAllNotificationUser();
$messages = \App\Http\Controllers\Controller::getAllMessagesUser();

?>


<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
<div class="container-fluid">
<div class="navbar-header">
    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#sidebar">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
    </button>
    <a id="menu-medium" class="sidebar-toggle tooltips">
        <i class="fa fa-outdent"></i>
    </a>
    <a class="navbar-brand" href="/"></a>
</div>
<div class="navbar-center">@yield('title')</div>
<div class="navbar-collapse collapse">
<!-- BEGIN TOP NAVIGATION MENU -->
<ul class="nav navbar-nav pull-right header-menu">
@if (!Auth::guest())
    <!-- BEGIN NOTIFICATION DROPDOWN -->
    <li class="dropdown" id="notifications-header">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
            <i class="glyph-icon flaticon-notifications"></i>
            @if ($notifys->count() > 0)
                <span class="badge badge-danger badge-header">{{$notifys->count()}}</span>
            @endif
        </a>
        <ul class="dropdown-menu">
            <li class="dropdown-header clearfix">
                <p class="pull-left">Notificações</p>
            </li>
            <li>
                <ul class="dropdown-menu-list withScroll" data-height="220">
                    @foreach ($notifys as $notify)
                        <li>
                            <a href="#">
                                <i class="fa fa-comments-o p-r-10 f-18 c-orange"></i>
                                {{  $notify->subject }}
                                <span class="dropdown-time">{{ time_elapsed_string($notify->notification_time) }}</span>
                            </a>
                        </li>
                    @endforeach
                </ul>
            </li>
            <li class="dropdown-footer clearfix">
                <a href="{{route('user.notification')}}" class="pull-left">Veja mais</a>
                <a href="#" class="pull-right">
                    <i class="fa fa-cog"></i>
                </a>
            </li>
        </ul>
    </li>
    <!-- END NOTIFICATION DROPDOWN -->
    <!-- BEGIN MESSAGES DROPDOWN -->
    <li class="dropdown" id="messages-header">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
            <i class="glyph-icon flaticon-email"></i>
            @if ($messages->count() > 0)
                <span class="badge badge-primary badge-header">{{$messages->count()}}</span>
            @endif
        </a>
        <ul class="dropdown-menu">
            <li class="dropdown-header clearfix">
                <p class="pull-left">
                    Mensagens
                </p>
            </li>
            <li class="dropdown-body">
                <ul class="dropdown-menu-list withScroll" data-height="220">
                    @foreach ($messages as $message)
                        <li class="clearfix">
                            <span class="pull-left p-r-5">
                                <img src="{{url('user/image/' . $message->id_user_origin)}}" alt="avatar 3">
                            </span>
                            <div class="clearfix">
                                <div>
                                    <strong>{{$message->userOrigin->name}}</strong>
                                    <small class="pull-right text-muted">
                                        <span class="glyphicon glyphicon-time p-r-5"></span> {{ time_elapsed_string($notify->notification_time) }}
                                    </small>
                                </div>
                                <p>{{$message->subject}}</p>
                            </div>
                        </li>
                    @endforeach
                </ul>
            </li>
            <li class="dropdown-footer clearfix">
                <a href="{{route('user.notification')}}" class="pull-left">Veja mais</a>
                <a href="#" class="pull-right">
                    <i class="fa fa-cog"></i>
                </a>
            </li>
        </ul>
    </li>
    <!-- END MESSAGES DROPDOWN -->
    <!-- BEGIN USER DROPDOWN -->
    <li class="dropdown" id="user-header">
        <a href="#" class="dropdown-toggle c-white" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
            <img src="{{url('user/image/' . Auth::user()->id_user)}}" alt="user avatar" width="30" class="p-r-5">
            <span class="username">{{ Auth::user()->name }}</span>
            <i class="fa fa-angle-down p-r-10"></i>
        </a>
        <ul class="dropdown-menu">
            <li>
                <a href="{{route('user.profile')}}">
                    <i class="glyph-icon flaticon-account"></i> Meu perfil
                </a>
            </li>
            <li class="dropdown-footer clearfix">
                <a href="javascript:;" class="toggle_fullscreen" title="Fullscreen">
                    <i class="glyph-icon flaticon-fullscreen3"></i>
                </a>
                <a href="#" title="Lock Screen">
                    <i class="glyph-icon flaticon-padlock23"></i>
                </a>
                <a href="{{route('logout')}}" title="Logout">
                    <i class="fa fa-power-off"></i>
                </a>
            </li>
        </ul>
    </li>
    <!-- END USER DROPDOWN -->
    <!-- BEGIN CHAT HEADER -->
    <!-- END CHAT HEADER -->
@endif
</ul>
<!-- END TOP NAVIGATION MENU -->
</div>
</div>
</nav>

