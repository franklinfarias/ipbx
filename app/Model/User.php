<?php

namespace App\Model;

use Illuminate\Support\Facades\DB;
use Illuminate\Auth\Authenticatable;
use Illuminate\Auth\Passwords\CanResetPassword;
use Illuminate\Contracts\Auth\Authenticatable as AuthenticatableContract;
use Illuminate\Contracts\Auth\CanResetPassword as CanResetPasswordContract;

class User extends S2NModel implements AuthenticatableContract, CanResetPasswordContract
{
    use Authenticatable, CanResetPassword;

    protected $table = 'user';
    protected $primaryKey = 'id_user';

    protected $fillable = [
        'name', 'login', 'extension', 'email',
        //'password',
    ];

    protected $hidden = [
        'password', 'remember_token',
    ];

    /*
     * Regras de validacao dos dados do formulario
     */
    public $rules = [
        'name' => 'required|min:3|max:100',
        'login' => 'required|min:3|max:100',
        'email' => 'required|email',
        //'password' => 'filled|min:6|max:20',
    ];

    /*
     * Mensagens de validacao dos dados do formulario
     */
    public $messages = [
        'name.required' => 'O campo Nome é preenchimento obrigatório.',
        'name.min' => 'O campo Nome tem tamanho mínimo de 3 caracteres.',
        'name.max' => 'O campo Nome tem tamanho máximo de 100 caracteres.',
        'name.required' => 'O campo Login é preenchimento obrigatório.',
        'name.min' => 'O campo Login tem tamanho mínimo de 3 caracteres.',
        'name.max' => 'O campo Login tem tamanho máximo de 100 caracteres.',
        'email.required' => 'O campo Email é preenchimento obrigatório.',
        'email.email' => 'Informe um e-mail válido.',
        'password.required' => 'O campo Password é preenchimento obrigatório.',
        'password.min' => 'O campo Nome tem tamanho mínimo de 6 caracteres.',
        'password.max' => 'O campo Nome tem tamanho máximo de 20 caracteres.',
    ];

    /**
     * @return mixed
     */
    public static function widget1(){
        $widgets = DB::connection('astk')->table('asteriskcdrdb.vw_dashboard_user_widget1')
            ->select('*')
            ->get();
        return $widgets;
    }

    /**
     * @param $extension
     * @return mixed
     */
    public static function widget2($extension){
        $widgets = DB::connection('astk')->table('asteriskcdrdb.vw_dashboard_user_widget2')
            ->select('*')
            ->where('extension', $extension)
            ->get();
        return $widgets;
    }

    /**
     * @param $extension
     * @return mixed
     */
    public static function widget3($extension){
        $widgets = DB::connection('astk')->select(
            "select mesAno.*, coalesce(qt_entrantes,0) as qt_entrantes, coalesce(qt_saintes,0) as qt_saintes " .
            "from asteriskcdrdb.vw_mes_ano mesAno " .
            "left join asteriskcdrdb.vw_dashboard_user_widget3 t1 on mesAno.mes = t1.mes and mesAno.ano = t1.ano and t1.extension = $extension"
        );
        return $widgets;
    }

}
