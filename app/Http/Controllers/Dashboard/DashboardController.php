<?php

namespace App\Http\Controllers\Dashboard;

use App\Http\Controllers\Controller;
use App\Http\Controllers\User\UserController;
use App\Model\CallCenterDashboard;
use App\Model\Profile;
use Illuminate\Support\Facades\App;
use Illuminate\Support\Facades\Auth;

class DashboardController extends Controller
{

    /**
     * @return array
     */
    private function amiAgent()
    {
        if (config('app.env', 'development') != 'development') {
            /*
            // Get Agents SIP
            $output = shell_exec('./ami_agent.sh sip');
            $sip = preg_split("/[\s,]+/", str_replace(' sip ', 'sip', str_replace(' ms)', 'ms)', $output)));
            // Get Agents IAX2
            $output = shell_exec('./ami_agent.sh iax2');
            $iax2 = preg_split("/[\s,]+/", str_replace(' iax2 ', 'iax2', str_replace(' ms)', 'ms)', $output)));

            $start = false;
            $exten = [];
            $x = 0;
            $y = 0;

            foreach ($sip as $value) {
                if ((strpos($value, 'sip') > 0) || (strpos($value, 'iax2') > 0))
                    $start = false;
                if (($start) && ($y >= 0 || $y <= 3)) {
                    $exten[$x][$y] = $value;
                    $y++;
                    if ((strpos($value, 'ms)') > 0) || (strpos($value, 'NOWN') > 0)) {
                        $x++;
                        $y = 0;
                    }
                }
                if ($value == "Description")
                    $start = true;
            }

            foreach ($iax2 as $value) {
                if ((strpos($value, 'sip') > 0) || (strpos($value, 'iax2') > 0))
                    $start = false;
                if (($start) && ($y >= 0 || $y <= 3)) {
                    $exten[$x][$y] = $value;
                    $y++;
                    if ((strpos($value, 'ms)') > 0) || (strpos($value, 'NOWN') > 0)) {
                        $x++;
                        $y = 0;
                    }
                }
                if ($value == "Description")
                    $start = true;
            }
            */

            $exten = [];
            // SIP
            $output = shell_exec('./ami_agent_client.sh sip');
            $exten['sip']['online'] = $output;
            $output = shell_exec('./ami_agent_client.sh sip offline');
            $exten['sip']['offline'] = $output;
            // IAX
            $output = shell_exec('./ami_agent_client.sh iax');
            $exten['iax']['online'] = $output;
            $output = shell_exec('./ami_agent_client.sh iax offline');
            $exten['iax']['offline'] = $output;

            return $exten;
        } else return [];
    }

    /**
     *
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function index()
    {
        //if (Gate::denies('auth'))
        //    abort(403);

        // verifica o tipo de perfil do usuario
        $profile = Profile::find(Auth::user()->id_profile)->name_profile;

        // retorna os clientes cadastrados
        //$clients = CLient::lookupTable(Client::where('ind_st_client', 1)->get(),'id_client', 'short_name');

        if (($profile == 'Admin') || ($profile == 'Managers')) {
            $widget1 = CallCenterDashboard::widget1();
            $widget2 = CallCenterDashboard::widget2();
            $agents = $this->amiAgent();
            $widget3 = CallCenterDashboard::widget3();
            $widget4 = CallCenterDashboard::widget4();
            $widget51 = CallCenterDashboard::widget5_1();
            $widget52 = CallCenterDashboard::widget5_2();
            $widget6 = CallCenterDashboard::widget6();
            $widget7 = CallCenterDashboard::widget7();
            $widget8 = CallCenterDashboard::widget8();
            $data = '';
            foreach ($widget6 as $item){
                empty($data) ? $data = $item->qt : $data .= ','.$item->qt;
            }
            $widget6 = $data;
            $data = '';
            foreach ($widget7 as $item){
                empty($data) ? $data = $item->num_incoming_call : $data .= ','.$item->num_incoming_call;
            }
            $widget7 = $data;
            return view('dashboard.manager', compact('widget1', 'widget2', 'agents','widget3','widget4','widget51','widget52','widget6','widget7','widget8'));
        } elseif ($profile == 'Supervisors') {
            $widget1 = CallCenterDashboard::widget1();
            $widget2 = CallCenterDashboard::widget2();
            $agents = $this->amiAgent();
            $widget3 = CallCenterDashboard::widget3();
            $widget4 = CallCenterDashboard::widget4();
            return view('dashboard.supervisor', compact('widget1', 'widget2', 'agents','widget3','widget4'));
        } else {
            $user = new UserController();
            return $user->profile();
        }
    }
}