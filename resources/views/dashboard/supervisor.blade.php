@extends('layouts.app')
@section('body-data-page','dashboard')
@section('title', 'Dashboard - Supervisor')
@section('content')

    <!-- BEGIN PAGE LEVEL STYLE/ -->
    <link type="text/css" href={{asset('assets/plugins/fullcalendar/fullcalendar.css')}} rel="stylesheet">
    <link type="text/css" href={{asset('assets/plugins/metrojs/metrojs.css')}} rel="stylesheet">
    <link type="text/css" href={{asset('assets/plugins/charts-circliful/css/jquery.circliful.css')}} rel="stylesheet">
    <!-- END PAGE LEVEL STYLE -->

    <div id="main-content" class="dashboard">
        <div class="row m-t-20">
            <div class="col-md-3 col-sm-12">
                <div class="panel no-bd bd-3 panel-stat">
                    <div class="panel-body bg-blue p-15">
                        <div class="row m-b-10">
                            <div class="col-xs-3">
                                <i class="glyph-icon flaticon-orders"></i>
                            </div>
                            <div class="col-xs-9">
                                <div class="live-tile" data-mode="carousel" data-direction="vertical" data-delay="3500" data-height="56">
                                    <div>
                                        <small class="stat-title">Chamadas Hoje</small>
                                        <h1 class="m-0 w-300">{{$widget1->first()->num_incoming_call+$widget1->first()->num_outgoing_call}}</h1>
                                    </div>
                                    <div>
                                        <small class="stat-title">Chamadas Hoje</small>
                                        <h1 class="m-0 w-300">{{$widget1->first()->num_incoming_call+$widget1->first()->num_outgoing_call}}</h1>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-6">
                                <small class="stat-title">Recebidas</small>
                                <div class="live-tile" data-mode="carousel" data-direction="vertical" data-delay="3500" data-height="30">
                                    <div>
                                        <h3 class="m-0 w-300">{{$widget1->first()->num_incoming_call}}</h3>
                                    </div>
                                    <div>
                                        <h3 class="m-0 w-300">
                                            @if (($widget1->sum('num_incoming_call') + $widget1->sum('num_outgoing_call'))>0)
                                                {{round(($widget1->sum('num_incoming_call')/($widget1->sum('num_incoming_call') + $widget1->sum('num_outgoing_call'))*100))}}
                                            @else 0 @endif
                                            %</h3>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-6">
                                <small class="stat-title">Realizadas</small>
                                <div class="live-tile" data-mode="carousel" data-direction="vertical" data-delay="3500" data-height="30">
                                    <div>
                                        <h3 class="m-0 w-500">{{$widget1->first()->num_outgoing_call}}</h3>
                                    </div>
                                    <div>
                                        <h3 class="m-0 w-500">
                                            @if (($widget1->sum('num_incoming_call') + $widget1->sum('num_outgoing_call')) > 0)
                                                {{round(($widget1->sum('num_outgoing_call')/($widget1->sum('num_incoming_call') + $widget1->sum('num_outgoing_call'))*100))}}
                                            @else 0 @endif
                                            %</h3>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-3 col-sm-12">
                <div class="panel no-bd bd-3 panel-stat">
                    <div class="panel-body bg-green p-15">
                        <div class="row m-b-6">
                            <div class="col-xs-3">
                                <i class="glyph-icon flaticon-visitors"></i>
                            </div>
                            <div class="col-xs-9">
                                <small class="stat-title">Canais</small>
                                <h1 class="m-0 w-500">{{$widget2->count()}}</h1>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-6">
                                <small class="stat-title">Online</small>
                                <h3 class="m-0 w-500">
                                    @if (!empty($agents))
                                        {{$agents['sip']['offline'] + $agents['pjsip']['offline'] + $agents['iax']['offline']}}
                                    @else
                                        0
                                    @endif
                                </h3>
                            </div>
                            <div class="col-xs-6">
                                <small class="stat-title">Ocupados</small>
                                <h3 class="m-0 w-500">
                                    @if (!empty($agents))
                                        {{$agents['sip']['offline'] + $agents['pjsip']['offline'] + $agents['iax']['offline']}}
                                    @else
                                        0
                                    @endif
                                </h3>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-3 col-sm-12">
                <div class="panel no-bd bd-3 panel-stat">
                    <div class="panel-body bg-orange p-15">
                        <div class="row m-b-0">
                            <div class="col-xs-3">
                                <i class="glyph-icon flaticon-orders"></i>
                            </div>
                            <div class="col-xs-9">
                                <small class="stat-title">Tempos</small>
                                <div class="live-tile" data-delay="4000" data-animation-easing="fade" data-height="47">
                                    <div>
                                        <h1 class="m-0 w-500 bg-orange">{{$widget3->first()->time_duration}}</h1>
                                    </div>
                                    <div>
                                        <h1 class="m-0 w-500 bg-orange">{{$widget3->first()->perc_duration}}%</h1>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-6">
                                <div class="live-tile" data-delay="4000" data-animation-easing="fade" data-height="48">
                                    <div class="bg-orange">
                                        <small class="stat-title">TMA</small>
                                        <h3 class="m-0 w-500">{{$widget3->first()->time_tma}}</h3>
                                    </div>
                                    <div class="bg-orange">
                                        <small class="stat-title">MnE</small>
                                        <h3 class="m-0 w-500">{{$widget3->first()->min_hold_time}}</h3>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-6">
                                <div class="live-tile" data-delay="4000" data-animation-easing="fade" data-height="48">
                                    <div class="bg-orange">
                                        <small class="stat-title">TME</small>
                                        <h3 class="m-0 w-500">{{$widget3->first()->time_tme}}</h3>
                                    </div>
                                    <div class="bg-orange">
                                        <small class="stat-title">MxE</small>
                                        <h3 class="m-0 w-500">{{$widget3->first()->max_hold_time}}</h3>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-3 col-sm-12">
                <div class="panel no-bd bd-3 panel-stat">
                    <div class="panel-body bg-red p-15">
                        <div class="row m-b-6">
                            <div class="col-xs-3">
                                <i class="glyph-icon flaticon-incomes"></i>
                            </div>
                            <div class="col-xs-9">
                                <small class="stat-title">PERDIDAS</small>
                                <h1 class="m-0 w-500">
                                    <span class="animate-number" data-value="3" data-animation-duration="1400">{{$widget4->first()->today}}</span>
                                </h1>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-6">
                                <small class="stat-title">Última semana</small>
                                <h3 class="m-0 w-500">
                                    <span class="animate-number" data-value="12" data-animation-duration="1400">{{$widget4->first()->lastweek}}</span>
                                </h3>
                            </div>
                            <div class="col-xs-6">
                                <small class="stat-title">Último mês</small>
                                <h3 class="m-0 w-500">
                                    <span class="animate-number" data-value="1" data-animation-duration="1400">{{$widget4->first()->lastmonth}}</span>
                                </h3>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <!-- iframe name="frmFreePBXReport" src="http://172.12.0.4/fop2/?exten={{Auth::user()->extension}}&pass={{Auth::user()->extension}}" frameborder="0" style="overflow: hidden; position: absolute;" height="550px" width="1057px" ></iframe -->
                <!-- iframe name="frmFreePBXReport" src="http://172.12.0.4/fop2/?exten=1002&pass=1002" frameborder="0" style="overflow: hidden; position: absolute;" height="550px" width="1057px" ></iframe -->
                <iframe name="frmFreePBXReport" src="{{env('FOP2_URL','http://localhost')}}/fop2/?exten={{Auth::user()->extension}}&pass={{Auth::user()->extension}}" frameborder="0" style="overflow: hidden; position: absolute;" height="550px" width="1057px" ></iframe>

            </div>
        </div>
    </div>
    <!-- BEGIN PAGE LEVEL SCRIPTS -->
    <script type="text/javascript" src={{asset('assets/plugins/metrojs/metrojs.min.js')}}></script>
    <script type="text/javascript" src={{asset('assets/plugins/fullcalendar/moment.min.js')}}></script>
    <script type="text/javascript" src={{asset('assets/plugins/fullcalendar/fullcalendar.min.js')}}></script>
    <script type="text/javascript" src={{asset('assets/plugins/google-maps/markerclusterer.js')}}></script>
    <!-- script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=true"></script -->
    <!-- script type="text/javascript" src={{asset('assets/plugins/google-maps/gmaps.js')}}></script -->
    <script type="text/javascript" src={{asset('assets/plugins/charts-flot/jquery.flot.js')}}></script>
    <script type="text/javascript" src={{asset('assets/plugins/charts-flot/jquery.flot.animator.min.js')}}></script>
    <script type="text/javascript" src={{asset('assets/plugins/charts-flot/jquery.flot.resize.js')}}></script>
    <script type="text/javascript" src={{asset('assets/plugins/charts-flot/jquery.flot.time.min.js')}}></script>
    <!-- script type="text/javascript" src={{asset('assets/plugins/charts-morris/raphael.min.js')}}></script -->
    <!-- script type="text/javascript" src={{asset('assets/plugins/charts-morris/morris.min.js')}}></script -->
    <script type="text/javascript" src={{asset('assets/plugins/charts-circliful/js/jquery.circliful.min.js')}}></script>
    <script type="text/javascript" src={{asset('assets/plugins/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js')}}></script>
    <script type="text/javascript" src={{asset('assets/js/calendar.js')}}></script>
    <script type="text/javascript" src={{asset('assets/js/dashboardSupervisor.js')}}></script>
    <!-- END  PAGE LEVEL SCRIPTS -->
@endsection