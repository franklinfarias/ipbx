<?php

namespace App\Providers;

use App\Model\User;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Gate;
use Illuminate\Foundation\Support\Providers\AuthServiceProvider as ServiceProvider;

class AuthServiceProvider extends ServiceProvider
{
    /**
     * The policy mappings for the application.
     *
     * @var array
     */
    protected $policies = [
        'App\Model' => 'App\Policies\ModelPolicy',
    ];

    /**
     * Register any authentication / authorization services.
     *
     * @return void
     */
    public function boot()
    {
        $this->registerPolicies();

        Gate::define('auth', function($user, $rule = null){
            if ($rule === null){
                $actions = Route::current()->getAction();
                if (!isset($actions['rule']))
                    return false;
                $rule = $actions['rule'];
            }
            $rules = User::find($user->id_user)->profile->rules_;
            foreach ($rules as $item){
                if ($item->key == $rule)
                    return true;
            }
            return false;
        });
    }
}
