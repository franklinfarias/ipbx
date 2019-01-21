<?php
/**
 * _form.blade.php : PHP S2N
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
@if ($errors->any())
    <div class="alert alert-warning fade in">
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
        <p><strong><i class="fa fa-exclamation-triangle"></i> Validação!</strong></p>
        @foreach ($errors->all() as $error)
            <p>{{ $error }}</p>
        @endforeach
    </div>
@endif

{!! Form::model($client, ['url' => 'client/store', 'enctype' => 'multipart/form-data', 'class' => 'form-horizontal', 'data-parsley-validate']) !!}
@if ($client->id_client > 0)
    <input name="id_client" value="{{$client->id_client}}" type="hidden">
@endif
<div class="form-group">
    {!! Form::label('short_name', 'Short Name', ['class' => 'col-sm-3 control-label']) !!}
    <div class="col-sm-9">
        {!! Form::text('short_name', null, ['class' => 'form-control', 'placeholder' => 'Short name']) !!}
    </div>
</div>
<div class="form-group">
    {!! Form::label('name', 'Name', ['class' => 'col-sm-3 control-label']) !!}
    <div class="col-sm-9">
        {!! Form::text('name', null, ['class' => 'form-control', 'placeholder' => 'Your name']) !!}
    </div>
</div>
<div class="form-group">
    {!! Form::label('email', 'Email', ['class' => 'col-sm-3 control-label']) !!}
    <div class="col-sm-9">
        {!! Form::email('email', null, ['class' => 'form-control', 'placeholder' => 'Your mail']) !!}
    </div>
</div>
<div class="form-group">
    {!! Form::label('config', 'Config', ['class' => 'col-sm-3 control-label']) !!}
    <div class="col-sm-9">
        {!! Form::textarea('config', null, ['class' => 'form-control']) !!}
    </div>
</div>
<div class="form-group">
    {!! Form::label('ind_st_client', 'Status', ['class' => 'col-sm-3 control-label']) !!}
    <div class="col-sm-9">
        {!! Form::select('ind_st_client', $indStClient, null, ['class' => 'form-control', 'data-live-search' => 'true', 'title' => 'Select a status...']) !!}
        <div class="btn-group bootstrap-select form-control">

        </div>
    </div>
</div>
<div class="col-sm-9 col-sm-offset-3">
    <div class="pull-right">
        {!! Form::submit('Submit', ['class' => 'btn btn-primary m-b-10']) !!}
        <button type="reset" class="btn btn-default m-b-10" onclick="javascript:history.back();">Cancel</button>
    </div>
</div>
{!! Form::close() !!}