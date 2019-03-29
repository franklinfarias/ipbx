<?php

$total = 0;
$dataUser = collect([]);
$dataWidget2 = collect([]);
$totalUser = 0;
$score = 0;
$efetEntrante = 0;
$efetSainte = 0;

?>
@extends('layouts.app')
@section('body-data-page','profil_edit')
@section('title', 'User Profile')
@section('content')

    <!-- BEGIN PAGE LEVEL STYLE/ -->
    <link type="text/css" href={{asset('assets/plugins/charts-circliful/css/jquery.circliful.css')}} rel="stylesheet">
    <!-- END PAGE LEVEL STYLE -->

    <div id="main-content" class="dashboard">
        <div class="row">
            <div class="col-md-12">
                <div class="panel">
                    <div class="panel-body">
                        <div class="row">
                            <!-- BEGIN PROFIL SIDEBAR -->
                            <div class="col-md-3 profil-sidebar">
                                <div class="panel panel-default">
                                    <div class="panel-body">
                                        <div class="text-center col-xs-12">
                                            <img src="{{url('user/image/' . $user->id_user)}}" class="img-responsive" alt="{{$user->name}}">
                                        </div>
                                        <div class="clearfix col-xs-8">
                                            <h2 class="c-dark w-600">{{$user->name}}</h2>
                                            <p class="c-gray f-16"><small>Ramal:{{$user->extension}}</small></p>
                                        </div>
                                    </div>

                                    @php
                                        if (!empty($widget1)){
                                            $total = $widget1->sum('num_incoming_call') + $widget1->sum('num_outgoing_call');
                                            $dataUser = $widget1->where('extension', $user->extension);
                                            $dataUser->all();
                                            if (!$dataUser->isEmpty()){
                                                $totalUser = $dataUser->first()->num_incoming_call + $dataUser->first()->num_outgoing_call;
                                                $efetEntrante = round($widget1->sum('num_incoming_call')>0 ? ($dataUser->first()->num_incoming_call / $widget1->sum('num_incoming_call'))*100 : 0);
                                                $efetSainte = round($widget1->sum('num_outgoing_call')>0 ? ($dataUser->first()->num_outgoing_call / $widget1->sum('num_outgoing_call'))*100 : 0);
                                            } else {
                                                $totalUser = 0;
                                                $efetEntrante = 0;
                                                $efetSainte = 0;
                                            }
                                            $score = ($total>0?round(($totalUser * 5) / $total):0);
                                        }
                                        // Filter ::
                                        $dataWidget2 = $widget2->where('extension', $user->extension);
                                        $dataWidget2->all();
                                        $dataWidget2->first();
                                    @endphp

                                    <div class="panel-footer p-t-0 p-b-0">
                                        <div class="row">
                                            <div class="col-xs-4 bg-blue p-20">
                                                <div class="text-center m-b-10">
                                                    <i class="f-24 fa fa-comments-o"></i>
                                                </div>
                                                <div class="text-center f-16">
                                                    {{!empty($widget1)?$widget1->sum('num_incoming_call'):0}}
                                                </div>
                                            </div>
                                            <div class="col-xs-4 bg-green p-20">
                                                <div class="text-center m-b-10">
                                                    <i class="f-24 fa fa-group"></i>
                                                </div>
                                                <div class="text-center f-16">
                                                    {{!empty($widget1)?$widget1->sum('num_outgoing_call'):0}}
                                                </div>
                                            </div>
                                            <div class="col-xs-4 bg-red p-20">
                                                <div class="text-center m-b-10">
                                                    <i class="f-24 fa fa-bullhorn"></i>
                                                </div>
                                                <div class="text-center f-16">
                                                    {{$totalUser}}
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- END PROFIL SIDEBAR -->

                            <!-- BEGIN PROFIL CONTENT -->
                            <div class="col-md-3 profil-content m-t-20">
                                <div class="profil-sidebar-element">
                                    <h4>Estatísticas Pessoais</h4>
                                    <p class="c-gray m-t-0"><i>Última conexão: </i>
                                    </p>
                                    <h5>Classificação Média</h5>
                                    <div id="stars" class="starrr pull-left">
                                        @for ($i = 1; $i <= 5; $i++)
                                            @if ($i <= $score)
                                                <span class="fa .fa-star fa-star"></span>
                                            @else
                                                <span class="fa .fa-star fa-star-o"></span>
                                            @endif
                                        @endfor
                                    </div>
                                    <div class="sidebar-number pull-right">{{$score}}/5</div>
                                    <div class="clearfix"></div>
                                    <h5>Minhas Chamadas</h5>
                                    <p class="m-t-0"><span class="c-blue"><strong>{{!$dataUser->isEmpty()?$dataUser->first()->num_incoming_call:0}}</strong></span> Entrantes</p>
                                    <p class="m-t-0"><span class="c-blue"><strong>{{!$dataUser->isEmpty()?$dataUser->first()->num_outgoing_call:0}}</strong></span> Saintes</p>
                                    <p class="m-t-0"><span class="c-blue"><strong>{{!$dataUser->isEmpty()?$dataUser->first()->time_duration_incoming_call:0}}</strong></span> Tempo Entrantes</p>
                                    <p class="m-t-0"><span class="c-blue"><strong>{{!$dataUser->isEmpty()?$dataUser->first()->time_duration_outgoing_call:0}}</strong></span> Tempo Saintes</p>
                                </div>
                                <div class="profil-sidebar-element">
                                    <h4>Rede Social</h4>
                                    <div class="social-btn-small"><a href="#" class="zocial icon facebook m-0">Sign in with Facebook</a>
                                    </div>
                                    <div class="social-btn-small"><a href="#" class="zocial icon twitter m-0">Sign in with Twitter</a>
                                    </div>
                                    <div class="social-btn-small"><a href="#" class="zocial icon googleplus m-0">Sign in with Google+</a>
                                    </div>
                                </div>

                            </div>
                            <!-- END PROFIL CONTENT -->

                            <!-- BEGIN PROFIL STATS -->
                            <div class="col-md-6 profil-content m-t-20">
                                <div class="row">
                                    <h4>Efetividade no atendimento</h4>
                                    <br>
                                    <div class="col-md-6 profil-content">
                                        <div class="col-md-3">
                                            <div id="pieChart01" data-dimension="200" data-text="{{$efetEntrante}}%" data-info="Entrantes" data-width="30" data-fontsize="28" data-percent="{{$efetEntrante}}" data-fgcolor="#0090D9" data-bgcolor="#eee" data-total="100" data-part="72" data-border="inline" data-icon="fa-comments-o" data-icon-size="10" data-icon-color="#ccc"></div>
                                        </div>
                                    </div>
                                    <div class="col-md-6 profil-content">
                                        <div class="col-md-3">
                                            <div id="pieChart02" data-dimension="200" data-text="{{$efetSainte}}%" data-info="Saintes" data-width="30" data-fontsize="28" data-percent="{{$efetSainte}}" data-fgcolor="#18a689" data-bgcolor="#eee" data-total="100" data-part="72" data-border="inline" data-icon="fa-group" data-icon-size="10" data-icon-color="#ccc"></div>
                                        </div>
                                    </div>
                                </div>
                                <!-- div class="row">

                                </div -->
                            </div>
                            <!-- END PROFIL STATS -->
                        </div>
                        <div class="row">
                            <div class="col-md-12 profil-content">
                                <div id="graph-wrapper">
                                    <div class="graph-info p-r-10">
                                        <button id="btnTitle" class="btn btn-transparent">Chamadas Entrantes x Saintes do Dia por Hora</button>
                                        <button id="bars" class="btn" disabled><span></span></button>
                                        <button id="lines" class="btn active" disabled><span></span></button>
                                    </div>
                                    <div class="h-300">
                                        <script type="text/javascript">

                                            // Line Chart

                                            var dataEntrantes = [
                                                [0,{{!$dataWidget2->isEmpty()?$dataWidget2->first()->qt_08_entrantes:0}}],
                                                [1,{{!$dataWidget2->isEmpty()?$dataWidget2->first()->qt_09_entrantes:0}}],
                                                [2,{{!$dataWidget2->isEmpty()?$dataWidget2->first()->qt_10_entrantes:0}}],
                                                [3,{{!$dataWidget2->isEmpty()?$dataWidget2->first()->qt_11_entrantes:0}}],
                                                [4,{{!$dataWidget2->isEmpty()?$dataWidget2->first()->qt_12_entrantes:0}}],
                                                [5,{{!$dataWidget2->isEmpty()?$dataWidget2->first()->qt_13_entrantes:0}}],
                                                [6,{{!$dataWidget2->isEmpty()?$dataWidget2->first()->qt_14_entrantes:0}}],
                                                [7,{{!$dataWidget2->isEmpty()?$dataWidget2->first()->qt_15_entrantes:0}}],
                                                [8,{{!$dataWidget2->isEmpty()?$dataWidget2->first()->qt_16_entrantes:0}}],
                                                [9,{{!$dataWidget2->isEmpty()?$dataWidget2->first()->qt_17_entrantes:0}}],
                                                [10, 0],
                                                [11, 0]
                                            ];
                                            var dataSaintes = [
                                                [0,{{!$dataWidget2->isEmpty()?$dataWidget2->first()->qt_08_saintes:0}}],
                                                [1,{{!$dataWidget2->isEmpty()?$dataWidget2->first()->qt_09_saintes:0}}],
                                                [2,{{!$dataWidget2->isEmpty()?$dataWidget2->first()->qt_10_saintes:0}}],
                                                [3,{{!$dataWidget2->isEmpty()?$dataWidget2->first()->qt_11_saintes:0}}],
                                                [4,{{!$dataWidget2->isEmpty()?$dataWidget2->first()->qt_12_saintes:0}}],
                                                [5,{{!$dataWidget2->isEmpty()?$dataWidget2->first()->qt_13_saintes:0}}],
                                                [6,{{!$dataWidget2->isEmpty()?$dataWidget2->first()->qt_14_saintes:0}}],
                                                [7,{{!$dataWidget2->isEmpty()?$dataWidget2->first()->qt_15_saintes:0}}],
                                                [8,{{!$dataWidget2->isEmpty()?$dataWidget2->first()->qt_16_saintes:0}}],
                                                [9,{{!$dataWidget2->isEmpty()?$dataWidget2->first()->qt_17_saintes:0}}],
                                                [10, 0],
                                                [11, 0]
                                            ];

                                            // Bar Chart

                                            var dataEntrantesMes = [
                                                @php
                                                    $count = 0;
                                                    foreach ($widget3 as $item){
                                                        echo "[$count," . $item->qt_entrantes . "],";
                                                        $count++;
                                                    }
                                                    if ($count == 0){
                                                        echo "[0,0]";
                                                    }
                                                @endphp
                                            ];

                                            var dataSaintesMes = [
                                                @php
                                                    $count = 0;
                                                    foreach ($widget3 as $item){
                                                        echo "[$count," . $item->qt_saintes . "],";
                                                        $count++;
                                                    }
                                                    if ($count == 0){
                                                        echo "[0,0]";
                                                    }
                                                @endphp
                                            ];
                                        </script>
                                        <div class="h-300" id="flotChart01" style="width: 100%; height: 200px;"></div>
                                        <div class="h-300" id="flotChart02" style="width: 100%; height: 200px;"></div>
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
    <!-- PAGE LEVEL SCRIPTS -->
    <script type="text/javascript" src="{{asset('assets/plugins/charts-flot/jquery.flot.js')}}"></script>
    <script type="text/javascript" src="{{asset('assets/plugins/charts-flot/jquery.flot.animator.min.js')}}"></script>
    <script type="text/javascript" src="{{asset('assets/plugins/charts-flot/jquery.flot.resize.js')}}"></script>
    <script type="text/javascript" src="{{asset('assets/plugins/charts-circliful/js/jquery.circliful.min.js')}}"></script>
    <script type="text/javascript" src="{{asset('assets/js/userProfile.js')}}"></script>
    <!-- END  PAGE LEVEL SCRIPTS -->
@endsection