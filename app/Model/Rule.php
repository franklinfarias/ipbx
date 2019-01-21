<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class Rule extends S2NModel
{
    protected $table = 'rule';
    protected $primaryKey = 'id_rule';

    public function profiles(){
        return $this->belongsToMany('Profile', 'profile_rule', 'id_rule', 'id_rule');
    }

    public function admin()
    {
        //return $this->belongsToMany(Admin::class);
        return $this->belongsToMany(User::class);
    }

    public function permissoes()
    {
        // return $this->belongsToMany(Permissao::class);
    }

    public function adicionaPermissao($permissao)
    {
        /*
        if (is_string($permissao)) {
            $permissao = Permissao::where('nome','=',$permissao)->firstOrFail();
        }

        if($this->existePermissao($permissao)){
            return;
        }

        return $this->permissoes()->attach($permissao);
        */
    }

    public function existePermissao($permissao)
    {
        /*
        if (is_string($permissao)) {
            $permissao = Permissao::where('nome','=',$permissao)->firstOrFail();
        }

        return (boolean) $this->permissoes()->find($permissao->id);
        */

    }
    public function removePermissao($permissao)
    {
        /*
        if (is_string($permissao)) {
            $permissao = Permissao::where('nome','=',$permissao)->firstOrFail();
        }

        return $this->permissoes()->detach($permissao);
        */
    }
}
