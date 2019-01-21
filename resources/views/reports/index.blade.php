@extends('layouts.app')
@section('body-data-page','dashboard')
@section('title', 'Reports - Manager')
@section('content')

    <!-- BEGIN PAGE LEVEL STYLE/ -->
    <link type="text/css" href={{asset('assets/plugins/bootstrap-select/bootstrap-select.min.css')}} rel="stylesheet">
    <!-- END PAGE LEVEL STYLE -->

    <div id="main-content">
        <div class="row">
            <div class="col-md-12">
                <div class="panel">
                    <div class="panel-body">
                        {!! Form::model(null, ['url' => 'zabbix/reportAvailable', 'method' => 'GET', 'class' => 'form-horizontal']) !!}
                        <div class="row">
                            <div class="col-md-6">
                                <div class="row">
                                    <div class="col-md-6">
                                        <span class="label label-default">Start</span>
                                        {!! Form::date('startDate', \Carbon\Carbon::yesterday(), ['class' => 'form-control date-picker']) !!}
                                    </div>
                                    <div class="col-md-6">
                                        <span class="label label-default">End</span>
                                        {!! Form::date('endDate', \Carbon\Carbon::now(), ['class' => 'form-control']) !!}
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <span class="label label-default">Client</span>
                                {!! Form::select('id_client', $clients, null, ['class'=>'selectpicker', 'title' => 'Select a client...']) !!}
                            </div>
                            <div class="col-md-3">
                                <button type="submit" class="btn btn-success">Make</button>
                            </div>
                        </div>
                        {!! Form::close() !!}
                        <div class="row">
                            <div class="col-md-12">
                                <div id="resultSearch"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div id="tooltip"></div>
    <!-- BEGIN PAGE LEVEL SCRIPTS -->
    <script type="text/javascript">
        $(document).ready(function () {
            $('select[name="id_client1"]').on('changed.bs.select', function (e) {
                $("#LoadingImage").show();
                var idClient = $(this).val();
                if (idClient) {
                    $.ajax({
                        type: "GET",
                        url: '/zabbix/reportAvailable',
                        dataType: "html",
                        headers: {
                            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                        },
                        data: {idClient: idClient, startDate: $('input[name="startDate"]').val(), endDate: $('input[name="endDate"]').val()},
                        success: function (data) {
                            $("#LoadingImage").hide();
                            $('#resultSearch').html(data);
                        },
                        error: function (err, status, error) {
                            $("#LoadingImage").hide();
                            console.log("Status: " + status + " Error: " + error);
                        }
                    });
                } else {
                    $("#LoadingImage").hide();
                    console.log('error');
                }
            });



            $('select[name="groupid"]').on('changed.bs.select', function (e) {
                $("#LoadingImage").show();
                var groupID = $(this).val();
                if (groupID) {
                    $.ajax({
                        type: "GET",
                        url: '/zabbix/getTemplateTriggerByGroup/' + groupID,
                        dataType: "json",
                        headers: {
                            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                        },
                        success: function (data) {
                            $("#LoadingImage").hide();
                            $('select[name="triggerTemplateid"]').empty();
                            $('select[name="triggerTemplateid"]').prop('disabled', false);
                            $.each(data, function (key, value) {
                                $('select[name="triggerTemplateid"]').append('<option value="' + key + '">' + value + '</option>');
                            });
                            $('select[name="triggerTemplateid"]').selectpicker('refresh');

                        },
                        error: function (err, status, error) {
                            $("#LoadingImage").hide();
                            console.log("Status: " + status + " Error: " + error);
                        }
                    });
                } else {
                    console.log('error');
                }
            });

            $('select[name="triggerTemplateid"]').on('changed.bs.select', function (e) {
                $("#LoadingImage").show();
                var triggerTemplateID = $(this).val();
                if (triggerTemplateID) {
                    $.ajax({
                        type: "GET",
                        url: '/zabbix/getTriggerByTemplate/' + triggerTemplateID,
                        dataType: "json",
                        headers: {
                            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                        },
                        success: function (data) {
                            $("#LoadingImage").hide();
                            $('select[name="triggerid"]').empty();
                            $('select[name="triggerid"]').prop('disabled', false);
                            $.each(data, function (key, value) {
                                $('select[name="triggerid"]').append('<option value="' + key + '">' + value + '</option>');
                            });
                            $('select[name="triggerid"]').selectpicker('refresh');

                        },
                        error: function (err, status, error) {
                            $("#LoadingImage").hide();
                            console.log("Status: " + status + " Error: " + error);
                        }
                    });
                } else {
                    console.log('error');
                }
            });

            $('select[name="triggerid"]').on('changed.bs.select', function (e) {
                $("#LoadingImage").show();
                $.ajax({
                    type: "GET",
                    url: '/zabbix/reportAvailable',
                    dataType: "html",
                    headers: {
                        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                    },
                    data: {groupid: $('select[name="groupid"]').val(), triggerid: $(this).val(), startDate: $('input[name="startDate"]').val(), endDate: $('input[name="endDate"]').val()},
                    success: function (data) {
                        $("#LoadingImage").hide();
                        $('#resultSearch').html(data);
                    },
                    error: function (err, status, error) {
                        $("#LoadingImage").hide();
                        console.log("Status: " + status + " Error: " + error);
                    }
                });
            });
        });
    </script>
    <!-- END  PAGE LEVEL SCRIPTS -->
@endsection