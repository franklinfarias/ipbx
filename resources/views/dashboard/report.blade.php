<?php
/**
 * manager-result.php : PHP S2N
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

$color = 'danger';
$perc = 0;

// http://s2n.dev/zabbix/reportAvailable?csrf-token=pM9AGQIn2H3tFXscPAfLR8BFM54spS1B9JcnPK2t&idClient=1&startDate=2018-04-18&endDate=2018-04-19

?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>{{ config('app.name', 'Laravel') }}</title>
    <meta content="" name="description"/>
    <meta content="themes-lab" name="author"/>
    <link rel="shortcut icon" href="{{url('assets/img/favicon.png')}}">
<!-- link type="text/css" href="{{asset('assets/css/icons/icons.min.css')}}" rel="stylesheet" -->
    <link type="text/css" href="{{asset('assets/css/bootstrap.min.css')}}" rel="stylesheet">
    <link type="text/css" href="{{asset('assets/css/plugins.css')}}" rel="stylesheet">
    <!-- link type="text/css" href="{{asset('assets/css/style.min.css')}}" rel="stylesheet" -->
    <!-- link type="text/css" href="#" path="{{asset('assets/css/')}}" rel="stylesheet" id="theme-color" -->

    <!-- script type="text/javascript" src="{{asset('assets/plugins/modernizr/modernizr-2.6.2-respond-1.1.0.min.js')}}"></script -->
</head>
<body data-page="dashboard">

        <script type="text/javascript" src={{asset('assets/plugins/jquery-1.11.1.min.js')}}></script>
        <!-- script type="text/javascript" src={{asset('assets/plugins/jquery-migrate-1.2.1.min.js')}}></script -->
        <!-- script type="text/javascript" src={{asset('assets/plugins/jquery-ui/jquery-ui-1.11.2.min.js')}}></script -->
        <!-- script type="text/javascript" src={{asset('assets/plugins/jquery-mobile/jquery.mobile-1.4.2.js')}}></script -->
        <script type="text/javascript" src={{asset('assets/plugins/bootstrap/bootstrap.min.js')}}></script>
        <!-- script type="text/javascript" src={{asset('assets/plugins/bootstrap-dropdown/bootstrap-hover-dropdown.min.js')}}></script -->
        <!-- script type="text/javascript" src={{asset('assets/plugins/bootstrap-select/bootstrap-select.js')}}></script>
        <!-- script type="text/javascript" src={{asset('assets/plugins/mcustom-scrollbar/jquery.mCustomScrollbar.concat.min.js')}}></script -->
        <!-- script type="text/javascript" src={{asset('assets/plugins/mmenu/js/jquery.mmenu.min.all.js')}}></script -->
        <!-- script type="text/javascript" src={{asset('assets/plugins/nprogress/nprogress.js')}}></script -->
        <!-- script type="text/javascript" src={{asset('assets/plugins/charts-sparkline/sparkline.min.js')}}></script -->
        <!-- script type="text/javascript" src={{asset('assets/plugins/breakpoints/breakpoints.js')}}></script -->
        <!-- script type="text/javascript" src={{asset('assets/plugins/numerator/jquery-numerator.js')}}></script -->
        <!-- script type="text/javascript" src={{asset('assets/plugins/jquery.cookie.min.js')}}></script -->

        <div id="main-content">
            <div class="row">
                <!-- BEGIN PAGE LEVEL STYLE/ -->
                <!-- link type="text/css" href={{asset('assets/plugins/bootstrap-select/bootstrap-select.min.css')}} rel="stylesheet" -->
                <!-- END PAGE LEVEL STYLE -->
                <!-- div class="panel"><div class="panel-body"><div class="row" -->
                <div class="col-md-12 ">
                    <h3><strong>KPI</strong> available</h3>
                    @foreach($triggers as $trigger)
                        <div><span class="label label-default">{{$trigger->hosts[0]->name}} : {{$trigger->description}}</span></div>
                        <div class="progress">
                            @php
                                $perc = 0;
                                if (!empty($availabilitys) && !empty($availabilitys[$trigger->triggerid])){
                                    $perc = $availabilitys[$trigger->triggerid]['false'] - $availabilitys[$trigger->triggerid]['true'];
                                    if (($availabilitys[$trigger->triggerid]['false'] - $availabilitys[$trigger->triggerid]['true']) <= 25)
                                        $color = 'danger';
                                    elseif ((($availabilitys[$trigger->triggerid]['false'] - $availabilitys[$trigger->triggerid]['true']) >= 26) && (($availabilitys[$trigger->triggerid]['false'] - $availabilitys[$trigger->triggerid]['true']) <= 50))
                                        $color = 'warning';
                                    elseif ((($availabilitys[$trigger->triggerid]['false'] - $availabilitys[$trigger->triggerid]['true']) >= 51) && (($availabilitys[$trigger->triggerid]['false'] - $availabilitys[$trigger->triggerid]['true']) <= 75))
                                        $color = 'info';
                                    else
                                        $color = 'success';
                                }
                            @endphp
                            <div class="progress-bar progress-bar-{{$color}}" role="progressbar" aria-valuenow="{{$perc}}"
                                 aria-valuemin="0" aria-valuemax="100" style="width: {{$perc}}%">
                                <span class="sr-only">{{$perc}}% Complete (success)</span>
                                {{$perc}}%
                            </div>
                        </div>
                    @endforeach
                </div>
                <!-- /div></div></div -->
            </div>
        </div>

<!-- script type="text/javascript" src="{{asset('assets/js/application.js')}}"></script -->
</body>
</html>