<?php
/**
 * Profile.php : PHP s2n
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
 * @package App\Model
 * @version 1.0
 */


namespace App\Model;

class Profile extends S2NModel
{
    protected $table = 'profile';
    protected $primaryKey = 'id_profile';

    /**
     * Regras de validacao dos dados do formulario
     */
    public function rules(){
        return [
            'name_profile' => 'required|min:3|max:100|unique:profile,name' .
                ($this->id_profile?','.$this->id_profile.',id_profile':''),
            'ind_tp_profile' => 'required',
        ];
    }

    public function users(){
        return $this->hasMany('App\Model\User','id_profile','id_profile');
    }

    /**
     * Retorna todas as REGRAS associadas ao usuario
     * @return \Illuminate\Database\Eloquent\Relations\BelongsToMany
     */
    public function rules_(){
        return $this->belongsToMany('App\Model\Rule',  'profile_rule', 'id_profile', 'id_rule');
    }
}
