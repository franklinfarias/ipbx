@extends('layouts.app')
@section('body-data-page','dashboard')
@section('title', 'Dashboard - Manager')
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
                                            @if (($widget1->sum('num_incoming_call') + $widget1->sum('num_outgoing_call')) >0)
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
                                        {{$agents['sip']['online'] + $agents['pjsip']['online'] + $agents['iax']['online']}}
                                    @else
                                        0
                                    @endif
                                </h3>
                            </div>
                            <div class="col-xs-6">
                                <small class="stat-title">Offline</small>
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
                                    <span class="animate-number" data-value="{{$widget4->first()->today}}" data-animation-duration="1400">{{$widget4->first()->today}}</span>
                                </h1>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-6">
                                <small class="stat-title">Últ. semana</small>
                                <h3 class="m-0 w-500">
                                    <span class="animate-number" data-value="{{$widget4->first()->lastweek}}" data-animation-duration="1400">{{$widget4->first()->lastweek}}</span>
                                </h3>
                            </div>
                            <div class="col-xs-6">
                                <small class="stat-title">Último mês</small>
                                <h3 class="m-0 w-500">
                                    <span class="animate-number" data-value="{{$widget4->first()->lastmonth}}" data-animation-duration="1400">{{$widget4->first()->lastmonth}}</span>
                                </h3>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="panel">
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-md-8">
                                <div id="graph-wrapper">
                                    <div class="graph-info p-r-10">
                                        <button id="btnTitle" class="btn btn-transparent">Chamadas Entrantes x Saintes x Aband. por Hora</button>
                                        <!-- a href="javascript:void(0)" class="btn bg-green">Tempo Médio</a -->
                                        <!-- a href="javascript:void(0)" class="btn bg-blue">Mês anterior</a -->
                                        <button id="bars" class="btn" disabled><span></span></button>
                                        <button id="lines" class="btn active" disabled><span></span></button>
                                    </div>
                                    <div class="h-300">
                                        <script>
                                            // Entrantes
                                            var dataLine1 = [
                                                [0, {{!$widget51->isEmpty()?$widget51->first()->qt_08_entrantes:0}}],
                                                [1, {{!$widget51->isEmpty()?$widget51->first()->qt_09_entrantes:0}}],
                                                [2, {{!$widget51->isEmpty()?$widget51->first()->qt_10_entrantes:0}}],
                                                [3, {{!$widget51->isEmpty()?$widget51->first()->qt_11_entrantes:0}}],
                                                [4, {{!$widget51->isEmpty()?$widget51->first()->qt_12_entrantes:0}}],
                                                [5, {{!$widget51->isEmpty()?$widget51->first()->qt_13_entrantes:0}}],
                                                [6, {{!$widget51->isEmpty()?$widget51->first()->qt_14_entrantes:0}}],
                                                [7, {{!$widget51->isEmpty()?$widget51->first()->qt_15_entrantes:0}}],
                                                [8, {{!$widget51->isEmpty()?$widget51->first()->qt_16_entrantes:0}}],
                                                [9, {{!$widget51->isEmpty()?$widget51->first()->qt_17_entrantes:0}}],
                                                [10, 0],
                                                [11, 0]
                                            ];
                                            // Saintes
                                            var dataLine2 = [
                                                [0, {{!$widget51->isEmpty()?$widget51->first()->qt_08_saintes:0}}],
                                                [1, {{!$widget51->isEmpty()?$widget51->first()->qt_09_saintes:0}}],
                                                [2, {{!$widget51->isEmpty()?$widget51->first()->qt_10_saintes:0}}],
                                                [3, {{!$widget51->isEmpty()?$widget51->first()->qt_11_saintes:0}}],
                                                [4, {{!$widget51->isEmpty()?$widget51->first()->qt_12_saintes:0}}],
                                                [5, {{!$widget51->isEmpty()?$widget51->first()->qt_13_saintes:0}}],
                                                [6, {{!$widget51->isEmpty()?$widget51->first()->qt_14_saintes:0}}],
                                                [7, {{!$widget51->isEmpty()?$widget51->first()->qt_15_saintes:0}}],
                                                [8, {{!$widget51->isEmpty()?$widget51->first()->qt_16_saintes:0}}],
                                                [9, {{!$widget51->isEmpty()?$widget51->first()->qt_17_saintes:0}}],
                                                [10, 0],
                                                [11, 0]
                                            ];
                                            // Abandonadas
                                            var dataLine3 = [
                                                [0, {{!$widget51->isEmpty()?$widget51->first()->qt_08_abandonadas:0}}],
                                                [1, {{!$widget51->isEmpty()?$widget51->first()->qt_09_abandonadas:0}}],
                                                [2, {{!$widget51->isEmpty()?$widget51->first()->qt_10_abandonadas:0}}],
                                                [3, {{!$widget51->isEmpty()?$widget51->first()->qt_11_abandonadas:0}}],
                                                [4, {{!$widget51->isEmpty()?$widget51->first()->qt_12_abandonadas:0}}],
                                                [5, {{!$widget51->isEmpty()?$widget51->first()->qt_13_abandonadas:0}}],
                                                [6, {{!$widget51->isEmpty()?$widget51->first()->qt_14_abandonadas:0}}],
                                                [7, {{!$widget51->isEmpty()?$widget51->first()->qt_15_abandonadas:0}}],
                                                [8, {{!$widget51->isEmpty()?$widget51->first()->qt_16_abandonadas:0}}],
                                                [9, {{!$widget51->isEmpty()?$widget51->first()->qt_17_abandonadas:0}}],
                                                [10, 0],
                                                [11, 0]
                                            ];
                                            // Entrantes
                                                <?php
                                                if (!$widget52->isEmpty()){
                                                $laravelBoqueta = $widget52->getIterator();
                                                $item = current($laravelBoqueta);
                                                ?>
                                            var dataBar1 = [
                                                    [0, <?php echo $item->qt_entrantes;?>],
                                                    [1, <?php $item = next($laravelBoqueta);echo $item->qt_entrantes;?>],
                                                    [2, <?php $item = next($laravelBoqueta);echo $item->qt_entrantes;?>],
                                                    [3, <?php $item = next($laravelBoqueta);echo $item->qt_entrantes;?>],
                                                    [4, <?php $item = next($laravelBoqueta);echo $item->qt_entrantes;?>],
                                                    [5, <?php $item = next($laravelBoqueta);echo $item->qt_entrantes;?>],
                                                    [6, <?php $item = next($laravelBoqueta);echo $item->qt_entrantes;?>],
                                                    [7, <?php $item = next($laravelBoqueta);echo $item->qt_entrantes;?>],
                                                    [8, <?php $item = next($laravelBoqueta);echo $item->qt_entrantes;?>],
                                                    [9, <?php $item = next($laravelBoqueta);echo $item->qt_entrantes;?>],
                                                    [10, <?php $item = next($laravelBoqueta);echo $item->qt_entrantes;?>],
                                                    [11, <?php $item = next($laravelBoqueta);echo $item->qt_entrantes;?>]
                                                ];
                                            // Saintes
                                                <?php
                                                $widget52->first();
                                                $laravelBoqueta = $widget52->getIterator();
                                                $item = current($laravelBoqueta);
                                                ?>
                                            var dataBar2 = [
                                                    [0, <?php echo $item->qt_saintes;?>],
                                                    [1, <?php $item = next($laravelBoqueta);echo $item->qt_saintes;?>],
                                                    [2, <?php $item = next($laravelBoqueta);echo $item->qt_saintes;?>],
                                                    [3, <?php $item = next($laravelBoqueta);echo $item->qt_saintes;?>],
                                                    [4, <?php $item = next($laravelBoqueta);echo $item->qt_saintes;?>],
                                                    [5, <?php $item = next($laravelBoqueta);echo $item->qt_saintes;?>],
                                                    [6, <?php $item = next($laravelBoqueta);echo $item->qt_saintes;?>],
                                                    [7, <?php $item = next($laravelBoqueta);echo $item->qt_saintes;?>],
                                                    [8, <?php $item = next($laravelBoqueta);echo $item->qt_saintes;?>],
                                                    [9, <?php $item = next($laravelBoqueta);echo $item->qt_saintes;?>],
                                                    [10, <?php $item = next($laravelBoqueta);echo $item->qt_saintes;?>],
                                                    [11, <?php $item = next($laravelBoqueta);echo $item->qt_saintes;?>]
                                                ];
                                            // Abandonadas
                                                <?php
                                                $widget52->first();
                                                $laravelBoqueta = $widget52->getIterator();
                                                $item = current($laravelBoqueta);
                                                ?>
                                            var dataBar3 = [
                                                    [0, <?php echo $item->qt_abandonadas;?>],
                                                    [1, <?php $item = next($laravelBoqueta);echo $item->qt_abandonadas;?>],
                                                    [2, <?php $item = next($laravelBoqueta);echo $item->qt_abandonadas;?>],
                                                    [3, <?php $item = next($laravelBoqueta);echo $item->qt_abandonadas;?>],
                                                    [4, <?php $item = next($laravelBoqueta);echo $item->qt_abandonadas;?>],
                                                    [5, <?php $item = next($laravelBoqueta);echo $item->qt_abandonadas;?>],
                                                    [6, <?php $item = next($laravelBoqueta);echo $item->qt_abandonadas;?>],
                                                    [7, <?php $item = next($laravelBoqueta);echo $item->qt_abandonadas;?>],
                                                    [8, <?php $item = next($laravelBoqueta);echo $item->qt_abandonadas;?>],
                                                    [9, <?php $item = next($laravelBoqueta);echo $item->qt_abandonadas;?>],
                                                    [10, <?php $item = next($laravelBoqueta);echo $item->qt_abandonadas;?>],
                                                    [11, <?php $item = next($laravelBoqueta);echo $item->qt_abandonadas;?>]
                                                ];
                                                <?php
                                                } else {
                                                ?>
                                            var dataBar1 = [
                                                    [0,0],
                                                    [1, 0],
                                                    [2, 0],
                                                    [3, 0],
                                                    [4, 0],
                                                    [5, 0],
                                                    [6, 0],
                                                    [7, 0],
                                                    [8, 0],
                                                    [9, 0],
                                                    [10, 0],
                                                    [11, 0]
                                                ];
                                            var dataBar2 = [
                                                [0,0],
                                                [1, 0],
                                                [2, 0],
                                                [3, 0],
                                                [4, 0],
                                                [5, 0],
                                                [6, 0],
                                                [7, 0],
                                                [8, 0],
                                                [9, 0],
                                                [10, 0],
                                                [11, 0]
                                            ];
                                            var dataBar3 = [
                                                [0,0],
                                                [1, 0],
                                                [2, 0],
                                                [3, 0],
                                                [4, 0],
                                                [5, 0],
                                                [6, 0],
                                                [7, 0],
                                                [8, 0],
                                                [9, 0],
                                                [10, 0],
                                                [11, 0]
                                            ];
                                            <?php
                                            }
                                            ?>

                                            // SpartCharts
                                            var dataQueue1 = [{{!empty($widget6)?$widget6:0}}];
                                            var dataGeneral1 = [{{!empty($widget7)?$widget7:0}}];

                                        </script>
                                        <div class="h-300" id="graph-lines" style="width:100%"></div>
                                        <div class="h-300" id="graph-bars" style="width:100%"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="row">
                                    <div class="col-lg-6 col-md-12">
                                        <h4 class="text-center c-gray">Fila</h4>
                                        <div class="spark-chart-1"></div>
                                    </div>
                                    <div class="col-lg-6 col-md-12 hidden-md hidden-sm hidden-xs">
                                        <h4 class="text-center c-gray">Geral</h4>
                                        <div class="spark-chart-2"></div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-6 col-lg-offset-3 col-md-12">
                                        <h4 class="m-b-m50 m-t-30 text-center c-gray">Atendimento</h4>
                                        <p></p>
                                        <br>
                                        <br>
                                        <div id="pie_chart1" data-dimension="200" data-text="{{$widget8->first()->perc}}%" data-info="Efetividade" data-width="30" data-fontsize="38" data-percent="{{$widget8->first()->perc}}" data-fgcolor="#7ea568" data-bgcolor="#eee" data-fill="#ddd"></div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="tooltip"></div>

    <!--  Script para autoRefresh -->
    <script>
        var time = new Date().getTime();
        $(document.body).bind("mousemove keypress", function (e) {
            time = new Date().getTime();
        });
        function refresh() {
            if (new Date().getTime() - time >= 60000)
                window.location.reload(true);
                //document.getElementById("execucao-form").submit();
            else
                setTimeout(refresh, 10000);
        }

        setTimeout(refresh, 10000);
    </script>

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
    <script type="text/javascript" src={{asset('assets/js/dashboard.js')}}></script>
    <!-- END  PAGE LEVEL SCRIPTS -->
@endsection