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

?>
<!-- BEGIN PAGE LEVEL STYLE/ -->
<link type="text/css" href={{asset('assets/plugins/bootstrap-select/bootstrap-select.min.css')}} rel="stylesheet">
<!-- END PAGE LEVEL STYLE -->

<div class="col-md-12 ">
    <h3><strong>KPI</strong> available</h3>
    @foreach($triggers as $trigger)
        <span class="label label-default">{{$trigger->hosts[0]->name}} : {{$trigger->description}}</span>
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
