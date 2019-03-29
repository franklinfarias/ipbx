<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Auth::routes();

Route::get('/logout', 'Auth\LoginController@logout');

Route::get('exten', function () {
    event(new App\Events\ExtensionStatus('test'));
    return "Event has been sent!";
});

Route::group(['middleware' => 'auth'], function(){
    Route::get('/', ['as' => 'home', 'uses' => 'Dashboard\DashboardController@index', 'rule' => 'home']);
    Route::get('/home', ['as' => 'home', 'uses' => 'Dashboard\DashboardController@index', 'rule' => 'home']);
    // User Routes
    Route::get('user/list', ['as' => 'user.list', 'uses' => 'User\UserController@index', 'rule' => 'user/index']);
    Route::get('user/create', ['as' => 'user.create', 'uses' => 'User\UserController@create', 'rule' => 'user/create']);
    Route::get('user/edit/{id}', ['as' => 'user.edit', 'uses' => 'User\UserController@edit', 'rule' => 'user/edit']);
    Route::get('user/image/{id}', ['as' => 'user.image', 'uses' => 'User\UserController@getImage', 'rule' => 'user/image']);
    Route::get('user/profile', ['as' => 'user.profile', 'uses' => 'User\UserController@profile', 'rule' => 'user/profile']);
    Route::get('user/notification', ['as' => 'user.notification', 'uses' => 'User\UserController@notification', 'rule' => 'user/notification']);
    Route::get('user/readnotification', ['as' => 'user.readnotification', 'uses' => 'User\UserController@readNotification', 'rule' => 'user/readnotification']);
    Route::post('user/store', ['as' => 'user/store', 'uses' => 'User\UserController@store', 'rule' => 'user/store']);
    // Profile Routes
    Route::get('profile/list', ['as' => 'profile.list', 'uses' => 'ProfileController@index', 'rule' => 'profile/index']);
    Route::get('profile/create', ['as' => 'profile.create', 'uses' => 'ProfileController@create', 'rule' => 'profile/create']);
    Route::get('profile/edit/{id}', ['as' => 'profile.edit', 'uses' => 'ProfileController@edit', 'rule' => 'profile/edit']);
    Route::post('profile/store', ['as' => 'profile.store', 'uses' => 'ProfileController@store', 'rule' => 'profile/store']);
    Route::delete('profile/delete/{id}', ['as' => 'profile.delete', 'uses' => 'ProfileController@delete', 'rule' => 'profile/delete']);
    // Rule Routes
    Route::get('rule/list', ['as' => 'rule.list', 'uses' => 'RuleController@index', 'rule' => 'rule/index']);
    Route::get('rule/create', ['as' => 'rule.create', 'uses' => 'RuleController@create', 'rule' => 'rule/create']);
    Route::get('rule/edit/{id}', ['as' => 'rule.edit', 'uses' => 'RuleController@edit', 'rule' => 'rule/edit']);
    Route::post('rule/store', ['as' => 'rule.store', 'uses' => 'RuleController@store', 'rule' => 'rule/store']);
    Route::delete('rule/delete/{id}', ['as' => 'rule.delete', 'uses' => 'RuleController@delete', 'rule' => 'rule/delete']);
    // Profile/Rule Routes
    Route::get('profileRule/list', ['as' => 'profileRule.list', 'uses' => 'ProfileRuleController@index', 'rule' => 'profileRule/index']);
    Route::get('profileRule/create', ['as' => 'profileRule.create', 'uses' => 'ProfileRuleController@create', 'rule' => 'profileRule/create']);
    Route::post('profileRule/store', ['as' => 'profileRule.store', 'uses' => 'ProfileRuleController@store', 'rule' => 'profileRule/store']);
    Route::delete('profileRule/delete/{idProfile}/{idRule}', ['as' => 'profileRule.delete', 'uses' => 'ProfileRuleController@delete', 'rule' => 'profileRule/delete']);

    // Zabbix Routes
    Route::get('zabbix/reportAvailable', ['as' => 'zabbix.reportavailable', 'uses' => 'ZabbixController@reportAvailable', 'rule' => 'zabbix/reportavailable']);
    Route::get('zabbix/getTemplateTriggerByGroup/{groupID}', ['as' => 'zabbix.gettemplatetriggerbygroup', 'uses' => 'ZabbixController@getTemplateTriggerByGroup', 'rule' => 'zabbix/gettemplatetriggerbygroup']);
    Route::get('zabbix/getTriggerByTemplate/{templateID}', ['as' => 'zabbix.gettriggerbytemplate', 'uses' => 'ZabbixController@getTriggerByTemplate', 'rule' => 'zabbix/gettriggerbytemplate']);
    // Reports
    Route::get('report/index', ['as' => 'report.index', 'uses' => 'ReportController@index', 'rule' => 'report/index']);
});

