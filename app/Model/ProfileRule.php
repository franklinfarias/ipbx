<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class ProfileRule extends S2NModel
{
    protected $table = 'profile_rule';
    protected $primaryKey = array('id_profile', 'id_rule');

    public function roles(){
        return $this->belongsTo('Rule','id_rule','id_rule');
    }
}
