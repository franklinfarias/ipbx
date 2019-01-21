<?php
/**
 * ZabbixController.php : PHP S2N
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

namespace App\Http\Controllers;

use App\Model\APIServicenow;
use App\Model\APIZabbix;
use App\Model\Client;
use App\Model\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;


class ZabbixController  extends Controller
{

    /**
     * Get the TemplateTriggers by GroupID
     * @param $groupID
     * @return \Illuminate\Http\JsonResponse|string
     */
    public function getTemplateTriggerByGroup($groupID){
        if (!empty($groupID)) {
            $api = new APIZabbix();
            $data = $api->getData('template.get', array('output'=>'extend', 'filter' => array('groupid'=>[$groupID]), 'sortfield'=>'name'));
            $templateTriggers = $api->toDataSelect($data,'templateid','name');

            return json_encode($templateTriggers);
        }

        return response()->json(['response' => 'Ok.']);
    }

    /**
     * Get the Triggers by Template
     * @param $groupID
     * @return \Illuminate\Http\JsonResponse|string
     */
    public function getTriggerByTemplate($templateID){
        if (!empty($templateID)) {
            $api = new APIZabbix();
            $data = $api->getData('trigger.get', array('output'=>'extend', 'filter' => array('hostid'=>[$templateID]), 'sortfield'=>'description'));
            $triggers = $api->toDataSelect($data,'triggerid','description');

            return json_encode($triggers);
        }

        return response()->json(['response' => 'Ok.']);
    }

    /**
     *
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function reportAvailable(Request $request){
        $user = User::find(Auth::user()->id_user);
        $client = Client::find($request->id_client);

        // Retorna o parametros de conexão e a instancia da API do Zabbix
        $api = new APIZabbix(
            (string)$client->getConfigZabbix()->host,
            (string)$client->getConfigZabbix()->user,
            (string)$client->getConfigZabbix()->password
        );

        $groupid = (string)$client->getConfigZabbix()->groupid;
        $triggerid = (string)$client->getConfigZabbix()->triggerid;
        $startDate = $request->startDate . " 00:00:00";
        $endDate = $request->endDate . " 00:00:00";

        $triggerOptions = array(
            'output' => array(
                'triggerid',
                'description',
                'expression',
                'value'
            ),
            'expandDescription' => 1,
            'monitored' => 1,
            'groupids' => array(
                $groupid
            ),
            'selectHosts' => array(
                'name'
            ),
            'filter' => array(
                'templateid' => $triggerid,
            ),
        );

        $triggers = $api->getData('trigger.get',$triggerOptions);
        $availabilitys = [];
        foreach ($triggers as $trigger) {
            $availability = $api->calculateAvailability($trigger->triggerid, strtotime($startDate), strtotime($endDate));
            $availabilitys[$trigger->triggerid] = $availability;
        }

        // ServiceNow
        $iniDate = str_replace(' ', '%20', str_replace(':', '%3A', $startDate));
        $fimDate = str_replace(' ', '%20', str_replace(':', '%3A', $endDate));
        $apiServiceNow = new APIServicenow(
            (string)$client->getConfigServicenow()->host,
            (string)$client->getConfigServicenow()->user,
            (string)$client->getConfigServicenow()->password
        );
        //get Incidents
        $param = "sys_domain=".(string)$client->getConfigServicenow()->sys_domain .
            "^closed_atBETWEENjavascript%3Ags.dateGenerate('" . $iniDate . "')%40javascript%3Ags.dateGenerate('" . $fimDate . "')" .
            "^".(string)$client->getConfigServicenow()->tables->incident->attr('sysparm_query');
        $incidents = $apiServiceNow->getData(
            (string)$client->getConfigServicenow()->tables->incident,
            $param
        );
        //get RcF
        $param = "sys_domain=".(string)$client->getConfigServicenow()->sys_domain .
            "^closed_atBETWEENjavascript%3Ags.dateGenerate('" . $iniDate . "')%40javascript%3Ags.dateGenerate('" . $fimDate . "')" .
            "^".(string)$client->getConfigServicenow()->tables->request->attr('sysparm_query');
        $rcfs = $apiServiceNow->getData(
            (string)$client->getConfigServicenow()->tables->request,
            $param
        );
        //get Problem
        $param = "sys_domain=".(string)$client->getConfigServicenow()->sys_domain .
            "^closed_atBETWEENjavascript%3Ags.dateGenerate('" . $iniDate . "')%40javascript%3Ags.dateGenerate('" . $fimDate . "')" .
            "^".(string)$client->getConfigServicenow()->tables->problem->attr('sysparm_query');
        $problems = $apiServiceNow->getData(
            (string)$client->getConfigServicenow()->tables->problem,
            $param
        );
        //get Change
        $param = "sys_domain=".(string)$client->getConfigServicenow()->sys_domain .
            "^closed_atBETWEENjavascript%3Ags.dateGenerate('" . $iniDate . "')%40javascript%3Ags.dateGenerate('" . $fimDate . "')" .
            "^".(string)$client->getConfigServicenow()->tables->change->attr('sysparm_query');
        $changes = $apiServiceNow->getData(
            (string)$client->getConfigServicenow()->tables->change,
            $param
        );

        //return view('dashboard.report-available', compact('triggers', 'availabilitys'));
        //return view('dashboard.report', compact('triggers', 'availabilitys'));
        //return \PDF::loadView('dashboard.report', compact('triggers', 'availabilitys'))->stream();

        return \PDF::loadView('reports.report1', compact('startDate', 'endDate', 'user', 'client', 'triggers', 'availabilitys',
            'rcfs', 'incidents', 'problems', 'changes'))->download('rca.pdf');
        //return view('reports.report1', compact('client', 'triggers', 'availabilitys'));
    }
}