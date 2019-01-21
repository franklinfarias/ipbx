<?php

namespace App\Http\Controllers;

use App\Model\Notification;
use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Routing\Controller as BaseController;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Support\Facades\Auth;

class Controller extends BaseController
{
    use AuthorizesRequests, DispatchesJobs, ValidatesRequests;

    /**
     * Retorna todas as notificações NAO LIDAS do usuário logado
     */
    public static function getAllNotificationUser(){
        return Notification::where('ind_tp_notification','1')
            ->where('ind_st_notification','0')
            ->where('id_user_destiny',Auth::user()->id_user)
            ->orderBy('notification_time', 'desc')
            ->get();
    }

    /**
     * Retorna todas as mensagens NAO LIDAS do usuário logado
     */
    public static function getAllMessagesUser(){
        return Notification::where('ind_tp_notification','2')
            ->where('ind_st_notification','0')
            ->where('id_user_destiny',Auth::user()->id_user)
            ->orderBy('notification_time', 'desc')
            ->get();
    }

}
