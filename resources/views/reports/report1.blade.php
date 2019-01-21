<?php
/**
 * Created by PhpStorm.
 * User: franklin
 * Date: 4/19/18
 * Time: 6:28 AM
 */
$color = 'danger';
$perc = 0;

$startDate = date_create($startDate);
$endDate = date_create($endDate);

?>
@extends('reports.template')
@section('title', 'RCA')
@section('subtitle', 'Relatório Consolidado de Atendimento')
@section('document_name', 'Relatório Consolidado de Atendimento')
@section('client_name', $client->short_name)
@section('content')

    <style>
        .none li {
            list-style-type: none;
        }

        .decimal li {
            list-style-type: decimal;
        }

        .lower-alpha li {
            list-style-type: lower-alpha;
        }

        .lower-latin li {
            list-style-type: lower-latin;
        }

        .lower-roman li {
            list-style-type: lower-roman;
        }

        .lower-greek li {
            list-style-type: lower-greek;
        }

        .upper-alpha li {
            list-style-type: upper-alpha;
        }

        .upper-latin li {
            list-style-type: upper-latin;
        }

        .upper-roman li {
            list-style-type: upper-roman;
        }

        .upper-greek li {
            list-style-type: upper-greek;
        }

        .decimal-leading-zero li {
            list-style-type: decimal-leading-zero;
        }

        /* Bootstrap */
        .label {
            display: inline;
            padding: .2em .6em .3em;
            font-size: 75%;
            font-weight: 700;
            line-height: 1;
            color: #fff;
            text-align: center;
            white-space: nowrap;
            vertical-align: baseline;
            border-radius: .25em;
        }

        a.label:focus, a.label:hover {
            color: #fff;
            text-decoration: none;
            cursor: pointer
        }

        .label:empty {
            display: none
        }

        .btn .label {
            position: relative;
            top: -1px
        }

        .label-default {
            background-color: #777
        }

        .label-default[href]:focus, .label-default[href]:hover {
            background-color: #5e5e5e
        }

        .label-primary {
            background-color: #337ab7
        }

        .label-primary[href]:focus, .label-primary[href]:hover {
            background-color: #286090
        }

        .label-success {
            background-color: #5cb85c
        }

        .label-success[href]:focus, .label-success[href]:hover {
            background-color: #449d44
        }

        .label-info {
            background-color: #5bc0de
        }

        .label-info[href]:focus, .label-info[href]:hover {
            background-color: #31b0d5
        }

        .label-warning {
            background-color: #f0ad4e
        }

        .label-warning[href]:focus, .label-warning[href]:hover {
            background-color: #ec971f
        }

        .label-danger {
            background-color: #d9534f
        }

        .label-danger[href]:focus, .label-danger[href]:hover {
            background-color: #c9302c
        }


        table {
            margin-bottom: 2em;
            font-size: x-small;
        }

        thead {
            background-color: #eeeeee;
        }

        tbody {
            background-color: #ffffee;
        }

        th,td {
            padding: 3pt;
        }

        table.separate {
            border-collapse: separate;
            border-spacing: 5pt;
            border: 3pt solid #33d;
        }

        table.separate td {
            border: 2pt solid #33d;
        }

        table.collapse {
            border-collapse: collapse;
            border: 1pt solid black;
        }

        table.collapse td {
            border: 1pt solid black;
        }

    </style>

    <h2>Relatório de Disponibilidade do Monitoramento</h2>
    <h3>Zabbix</h3>
    <h4>Período: {{date_format($startDate,'d/m/Y H:i:s')}} a {{date_format($endDate,'d/m/Y H:i:s')}}</h4>
    <p>
    <ol class="decimal">
        @foreach($triggers as $trigger)
            <li>{{$trigger->hosts[0]->name}} : {{__('messages.'.$trigger->description)}}
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
                <ol class="upper-greek">
                    <li>
                        <span class="label label-{{$color}}">{{number_format($perc,2, ',', '.')}}
                            % Complete (success)</span>
                    </li>
                </ol>
            </li>
        @endforeach
    </ol>
    </p>

    <h2>Relatório de Chamados</h2>
    <h3>ServiceNow</h3>
    <h4>Período: {{date_format($startDate,'d/m/Y H:i:s')}} a {{date_format($endDate,'d/m/Y H:i:s')}}</h4>
    <p>
        <table>
            <thead>
                <tr>
                    <th>Tipo</th>
                    <th>Nº</th>
                    <th>Criação</th>
                    <th>Solicitante</th>
                    <th>Assunto</th>
                    <th>Fechado</th>
                    <th>Técnico</th>
                </tr>
            </thead>
        <tbody>
            @foreach($incidents as $incident)
                <tr>
                    <td>{{$incident->sys_class_name}}</td>
                    <td>{{$incident->number}}</td>
                    <td>{{$incident->sys_created_on}}</td>
                    <td>{{!empty($incident->opened_by)?$incident->opened_by->display_value:'-'}}</td>
                    <td>{{$incident->short_description}}</td>
                    <td>{{$incident->closed_at}}</td>
                    <td>{{!empty($incident->closed_by)?$incident->closed_by->display_value:'-'}}</td>
                </tr>
            @endforeach
            @if(!empty($incidents))
            <tr style="text-align: right">
                <td colspan="7">Total Incidentes: {{count($incidents)}}</td>
            </tr>
            @endif

            @foreach($rcfs as $rcf)
                <tr>
                    <td>{{$rcf->sys_class_name}}</td>
                    <td>{{$rcf->number}}</td>
                    <td>{{$rcf->sys_created_on}}</td>
                    <td>{{!empty($rcf->opened_by)?$rcf->opened_by->display_value:'-'}}</td>
                    <td>{{$rcf->short_description}}</td>
                    <td>{{$rcf->closed_at}}</td>
                    <td>{{!empty($rcf->closed_by)?$rcf->closed_by->display_value:'-'}}</td>
                </tr>
            @endforeach
            @if(!empty($rcfs))
            <tr style="text-align: right">
                <td colspan="7">Total Requisições: {{count($rcfs)}}</td>
            </tr>
            @endif

            @foreach($problems as $problem)
                <tr>
                    <td>{{$problem->sys_class_name}}</td>
                    <td>{{$problem->number}}</td>
                    <td>{{$problem->sys_created_on}}</td>
                    <td>{{!empty($problem->opened_by)?$problem->opened_by->display_value:'-'}}</td>
                    <td>{{$problem->short_description}}</td>
                    <td>{{$problem->closed_at}}</td>
                    <td>{{!empty($problem->closed_by)?$problem->closed_by->display_value:'-'}}</td>
                </tr>
            @endforeach
            @if(!empty($problems))
            <tr style="text-align: right">
                <td colspan="7">Total Problemas: {{count($problems)}}</td>
            </tr>
            @endif

            @foreach($changes as $change)
                <tr>
                    <td>{{$change->sys_class_name}}</td>
                    <td>{{$change->number}}</td>
                    <td>{{$change->sys_created_on}}</td>
                    <td>{{!empty($change->opened_by)?$change->opened_by->display_value:'-'}}</td>
                    <td>{{$change->short_description}}</td>
                    <td>{{$change->closed_at}}</td>
                    <td>{{!empty($change->closed_by)?$change->closed_by->display_value:'-'}}</td>
                </tr>
            @endforeach
            @if(!empty($changes))
                <tr style="text-align: right">
                    <td colspan="7">Total Mudanças: {{count($changes)}}</td>
                </tr>
            @endif
        </tbody>
        </table>
    </p>

    <p>
        <table style="">
            <tr style="">
                <td style="border-bottom: 0.1pt solid black;"></td>
            </tr>
            <tr style="">
                <td style="text-align: center; padding-top: 0em;">
                    Assinado digitalmente por {{$user->name}}
                    <br />
                    {{md5($user->login . date("Ymd His"))}}
                </td>
            </tr>
        </table>
    </p>

@endsection