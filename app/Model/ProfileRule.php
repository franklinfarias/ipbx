<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class ProfileRule extends S2NModel
{
    protected $table = 'profile_rule';
    //protected $primaryKey = array('id_profile', 'id_rule');

    /**
     * Regras de validacao dos dados do formulario
     */
    public $rules = [
        'id_profile' => 'required',
        'id_rule' => 'required',
    ];

    public function rule(){
        return $this->belongsTo('App\Model\Rule','id_rule','id_rule');
    }

    public function profile(){
        return $this->belongsTo('App\Model\Profile','id_profile','id_profile');
    }
}
