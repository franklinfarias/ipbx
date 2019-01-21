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

Route::group(['middleware' => 'auth'], function(){
    Route::get('/', ['as' => 'home', 'uses' => 'Dashboard\DashboardController@index', 'rule' => 'home']);
    Route::get('/home', ['as' => 'home', 'uses' => 'Dashboard\DashboardController@index', 'rule' => 'home']);
    // User Routes
    Route::get('user/list', ['as' => 'user.list', 'uses' => 'User\UserController@index', 'rule' => 'user/index']);
    Route::get('user/create', ['as' => 'user.create', 'uses' => 'User\UserController@create', 'rule' => 'user/create']);
    Route::get('user/edit/{id}', ['as' => 'user.edit', 'uses' => 'User\UserController@edit', 'rule' => 'user/edit']);
    Route::get('user/image/{id}', ['as' => 'user.image', 'uses' => 'User\UserController@getImage', 'rule' => 'user/edit']);
    Route::get('user/profile', ['as' => 'user.profile', 'uses' => 'User\UserController@profile', 'rule' => 'user/profile']);
    Route::get('user/notification', ['as' => 'user.notification', 'uses' => 'User\UserController@notification', 'rule' => 'user/notification']);
    Route::get('user/readnotification', ['as' => 'user.readnotification', 'uses' => 'User\UserController@readNotification', 'rule' => 'user/readnotification']);
    Route::post('user/store', ['as' => 'user/store', 'uses' => 'User\UserController@store', 'rule' => 'user/store']);
    // Profile Routes
    Route::get('profile/list', ['as' => 'profile.list', 'uses' => 'SiafProfileController@index', 'rule' => 'profile/index']);
    Route::get('profile/create', ['as' => 'profile.create', 'uses' => 'SiafProfileController@create', 'rule' => 'profile/create']);
    Route::get('profile/edit/{id}', ['as' => 'profile.edit', 'uses' => 'SiafProfileController@edit', 'rule' => 'profile/edit']);
    Route::post('profile/store', ['as' => 'profile.store', 'uses' => 'SiafProfileController@store', 'rule' => 'profile/store']);
    Route::delete('profile/delete/{id}', ['as' => 'profile.delete', 'uses' => 'SiafProfileController@delete', 'rule' => 'profile/delete']);
    // Rule Routes
    Route::get('rule/list', ['as' => 'rule.list', 'uses' => 'SiafRuleController@index', 'rule' => 'rule/index']);
    Route::get('rule/create', ['as' => 'rule.create', 'uses' => 'SiafRuleController@create', 'rule' => 'rule/create']);
    Route::get('rule/edit/{id}', ['as' => 'rule.edit', 'uses' => 'SiafRuleController@edit', 'rule' => 'rule/edit']);
    Route::post('rule/store', ['as' => 'rule.store', 'uses' => 'SiafRuleController@store', 'rule' => 'rule/store']);
    Route::delete('rule/delete/{id}', ['as' => 'rule.delete', 'uses' => 'SiafRuleController@delete', 'rule' => 'rule/delete']);
    // Profile/Rule Routes
    Route::get('profileRule/list', ['as' => 'profileRule.list', 'uses' => 'SiafProfileRuleController@index', 'rule' => 'profileRule/index']);
    Route::get('profileRule/create', ['as' => 'profileRule.create', 'uses' => 'SiafProfileRuleController@create', 'rule' => 'profileRule/create']);
    Route::post('profileRule/store', ['as' => 'profileRule.store', 'uses' => 'SiafProfileRuleController@store', 'rule' => 'profileRule/store']);
    Route::delete('profileRule/delete/{idProfile}/{idRule}', ['as' => 'profileRule.delete', 'uses' => 'SiafProfileRuleController@delete', 'rule' => 'profileRule/delete']);
    // Company Routes
    Route::get('company/list', ['as' => 'company.list', 'uses' => 'SiafCompanyController@index', 'rule' => 'company/index']);
    Route::get('company/create', ['as' => 'company.create', 'uses' => 'SiafCompanyController@create', 'rule' => 'company/create']);
    Route::get('company/edit/{id}', ['as' => 'company.edit', 'uses' => 'SiafCompanyController@edit', 'rule' => 'company/edit']);
    Route::post('company/store', ['as' => 'company.store', 'uses' => 'SiafCompanyController@store', 'rule' => 'company/store']);
    Route::delete('company/delete/{id}', ['as' => 'company.delete', 'uses' => 'SiafCompanyController@delete', 'rule' => 'company/delete']);
    // Suppliers Routes
    Route::get('supplier/list', ['as' => 'supplier.list', 'uses' => 'SiafSupplierController@index', 'rule' => 'supplier/index']);
    Route::get('supplier/create', ['as' => 'supplier.create', 'uses' => 'SiafSupplierController@create', 'rule' => 'supplier/create']);
    Route::get('supplier/edit/{id}', ['as' => 'supplier.edit', 'uses' => 'SiafSupplierController@edit', 'rule' => 'supplier/edit']);
    Route::post('supplier/store', ['as' => 'supplier.store', 'uses' => 'SiafSupplierController@store', 'rule' => 'supplier/store']);
    Route::delete('supplier/delete/{id}', ['as' => 'supplier.delete', 'uses' => 'SiafSupplierController@delete', 'rule' => 'supplier/delete']);
    // Department Routes
    Route::get('department/list', ['as' => 'department.list', 'uses' => 'SiafDepartmentController@index', 'rule' => 'department/index']);
    Route::get('department/create', ['as' => 'department.create', 'uses' => 'SiafDepartmentController@create', 'rule' => 'department/create']);
    Route::get('department/edit/{id}', ['as' => 'department.edit', 'uses' => 'SiafDepartmentController@edit', 'rule' => 'department/edit']);
    Route::post('department/store', ['as' => 'department.store', 'uses' => 'SiafDepartmentController@store', 'rule' => 'department/store']);
    Route::delete('department/delete/{id}', ['as' => 'department.delete', 'uses' => 'SiafDepartmentController@delete', 'rule' => 'department/delete']);
    // Office Routes
    Route::get('office/list', ['as' => 'office.list', 'uses' => 'SiafOfficeController@index', 'rule' => 'office/index']);
    Route::get('office/create', ['as' => 'office.create', 'uses' => 'SiafOfficeController@create', 'rule' => 'office/create']);
    Route::get('office/edit/{id}', ['as' => 'office.edit', 'uses' => 'SiafOfficeController@edit', 'rule' => 'office/edit']);
    Route::post('office/store', ['as' => 'office.store', 'uses' => 'SiafOfficeController@store', 'rule' => 'office/store']);
    Route::delete('office/delete/{id}', ['as' => 'office.delete', 'uses' => 'SiafOfficeController@delete', 'rule' => 'office/delete']);
    // Account Plan Routes
    Route::get('accountPlan/list', ['as' => 'accountPlan.list', 'uses' => 'SiafAccountPlanController@index', 'rule' => 'accountPlan/index']);
    Route::get('accountPlan/create', ['as' => 'accountPlan.create', 'uses' => 'SiafAccountPlanController@create', 'rule' => 'accountPlan/create']);
    Route::get('accountPlan/edit/{id}', ['as' => 'accountPlan.edit', 'uses' => 'SiafAccountPlanController@edit', 'rule' => 'accountPlan/edit']);
    Route::post('accountPlan/store', ['as' => 'accountPlan.store', 'uses' => 'SiafAccountPlanController@store', 'rule' => 'accountPlan/store']);
    Route::delete('accountPlan/delete/{id}', ['as' => 'accountPlan.delete', 'uses' => 'SiafAccountPlanController@delete', 'rule' => 'accountPlan/delete']);
    // Budget Routes
    Route::get('budget/list', ['as' => 'budget.list', 'uses' => 'SiafBudgetController@index', 'rule' => 'budget/index']);
    Route::get('budget/create', ['as' => 'budget.create', 'uses' => 'SiafBudgetController@create', 'rule' => 'budget/create']);
    Route::get('budget/edit/{id}', ['as' => 'budget.edit', 'uses' => 'SiafBudgetController@edit', 'rule' => 'budget/edit']);
    Route::post('budget/store', ['as' => 'budget.store', 'uses' => 'SiafBudgetController@store', 'rule' => 'budget/store']);
    Route::delete('budget/delete/{id}', ['as' => 'budget.delete', 'uses' => 'SiafBudgetController@delete', 'rule' => 'budget/delete']);
    // Customer Routes
    Route::get('customer/list', ['as' => 'customer.list', 'uses' => 'SiafCustomerController@index', 'rule' => 'customer/index']);
    Route::get('customer/create', ['as' => 'customer.create', 'uses' => 'SiafCustomerController@create', 'rule' => 'customer/create']);
    Route::get('customer/edit/{id}', ['as' => 'customer.edit', 'uses' => 'SiafCustomerController@edit', 'rule' => 'customer/edit']);
    Route::post('customer/store', ['as' => 'customer.store', 'uses' => 'SiafCustomerController@store', 'rule' => 'customer/store']);
    Route::delete('customer/delete/{id}', ['as' => 'customer.delete', 'uses' => 'SiafCustomerController@delete', 'rule' => 'customer/delete']);
    // Client Routes
    Route::get('client/list', ['as' => 'client.list', 'uses' => 'Client\ClientController@index', 'rule' => 'client/index']);
    Route::get('client/create', ['as' => 'client.create', 'uses' => 'Client\ClientController@create', 'rule' => 'client/create']);
    Route::get('client/edit/{id}', ['as' => 'client.edit', 'uses' => 'Client\ClientController@edit', 'rule' => 'client/edit']);
    Route::post('client/store', ['as' => 'client/store', 'uses' => 'Client\ClientController@store', 'rule' => 'client/store']);
    Route::post('client/delete', ['as' => 'client/delete', 'uses' => 'Client\ClientController@delete', 'rule' => 'client/delete']);
    // Zabbix Routes
    Route::get('zabbix/reportAvailable', ['as' => 'zabbix.reportavailable', 'uses' => 'ZabbixController@reportAvailable', 'rule' => 'zabbix/reportavailable']);
    Route::get('zabbix/getTemplateTriggerByGroup/{groupID}', ['as' => 'zabbix.gettemplatetriggerbygroup', 'uses' => 'ZabbixController@getTemplateTriggerByGroup', 'rule' => 'zabbix/gettemplatetriggerbygroup']);
    Route::get('zabbix/getTriggerByTemplate/{templateID}', ['as' => 'zabbix.gettriggerbytemplate', 'uses' => 'ZabbixController@getTriggerByTemplate', 'rule' => 'zabbix/gettriggerbytemplate']);
    // Reports
    Route::get('report/index', ['as' => 'report.index', 'uses' => 'ReportController@index', 'rule' => 'report/index']);
});

