<?php

namespace App\Model;

use Illuminate\Support\Facades\DB;

class CallCenterDashboard extends S2NModel {


    public static function widget1(){
        $widgets = DB::connection('astk')->table('asteriskcdrdb.vw_dashboard_widget1')
            ->select('*')
            ->get();
        return $widgets;
    }

    public static function widget2(){
        $widgets = DB::connection('astk')->table('asteriskcdrdb.vw_dashboard_widget2')
            ->select('*')
            ->get();
        return $widgets;
    }

    public static function widget3(){
        $widgets = DB::connection('astk')->table('asteriskcdrdb.vw_dashboard_widget3')
            ->select('*')
            ->get();
        return $widgets;
    }

    public static function widget4(){
        $widgets = DB::connection('astk')->table('asteriskcdrdb.vw_dashboard_widget4')
            ->select('*')
            ->get();
        return $widgets;
    }

    public static function widget5_1(){
        $widgets = DB::connection('astk')->table('asteriskcdrdb.vw_dashboard_widget5_1')
            ->select('*')
            ->get();
        return $widgets;
    }

    public static function widget5_2(){
        $widgets = DB::connection('astk')->table('asteriskcdrdb.vw_dashboard_widget5_2')
            ->select('*')
            ->get();
        return $widgets;
    }

    public static function widget6(){
        $widgets = DB::connection('astk')->table('asteriskcdrdb.vw_dashboard_widget6')
            ->select('*')
            ->get();
        return $widgets;
    }

    public static function widget7(){
        $widgets = DB::connection('astk')->table('asteriskcdrdb.vw_dashboard_widget7')
            ->select('*')
            ->get();
        return $widgets;
    }

    public static function widget8(){
        $widgets = DB::connection('astk')->table('asteriskcdrdb.vw_dashboard_widget8')
            ->select('*')
            ->get();
        return $widgets;
    }
}