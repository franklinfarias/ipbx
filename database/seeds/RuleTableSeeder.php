<?php

use Illuminate\Database\Seeder;

class RuleTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //
        DB::table('rule')->insert(
            ['name_rule' => 'Home','key' => 'home', 'created_at' => '2014-10-12 00:00:00', 'updated_at' => '2014-10-12 00:00:00']
        );
        DB::table('rule')->insert(
            ['name_rule' => 'User->Profile','key' => 'user/profile', 'created_at' => '2014-10-12 00:00:00', 'updated_at' => '2014-10-12 00:00:00']
        );
        //
        DB::table('rule')->insert(
            ['name_rule' => 'User->Index','key' => 'user/index', 'created_at' => '2014-10-12 00:00:00', 'updated_at' => '2014-10-12 00:00:00']
        );
        DB::table('rule')->insert(
            ['name_rule' => 'User->Create','key' => 'user/create', 'created_at' => '2014-10-12 00:00:00', 'updated_at' => '2014-10-12 00:00:00']
        );
        DB::table('rule')->insert(
            ['name_rule' => 'User->Edit','key' => 'user/edit', 'created_at' => '2014-10-12 00:00:00', 'updated_at' => '2014-10-12 00:00:00']
        );
        DB::table('rule')->insert(
            ['name_rule' => 'User->Store','key' => 'user/store', 'created_at' => '2014-10-12 00:00:00', 'updated_at' => '2014-10-12 00:00:00']
        );
        // Client
        DB::table('rule')->insert(
            ['name_rule' => 'Client->List','key' => 'client/list', 'created_at' => '2014-10-12 00:00:00', 'updated_at' => '2014-10-12 00:00:00']
        );
        DB::table('rule')->insert(
            ['name_rule' => 'Client->Create','key' => 'client/create', 'created_at' => '2014-10-12 00:00:00', 'updated_at' => '2014-10-12 00:00:00']
        );
        DB::table('rule')->insert(
            ['name_rule' => 'Client->Edit','key' => 'client/edit', 'created_at' => '2014-10-12 00:00:00', 'updated_at' => '2014-10-12 00:00:00']
        );
        DB::table('rule')->insert(
            ['name_rule' => 'Client->Store','key' => 'client/store', 'created_at' => '2014-10-12 00:00:00', 'updated_at' => '2014-10-12 00:00:00']
        );
        DB::table('rule')->insert(
            ['name_rule' => 'Client->Delete','key' => 'client/delete', 'created_at' => '2014-10-12 00:00:00', 'updated_at' => '2014-10-12 00:00:00']
        );
        // Account Plan
        DB::table('rule')->insert(
            ['name_rule' => 'Account Plan->List','key' => 'client/list', 'created_at' => '2014-10-12 00:00:00', 'updated_at' => '2014-10-12 00:00:00']
        );
        DB::table('rule')->insert(
            ['name_rule' => 'Account Plan->Create','key' => 'client/create', 'created_at' => '2014-10-12 00:00:00', 'updated_at' => '2014-10-12 00:00:00']
        );
        DB::table('rule')->insert(
            ['name_rule' => 'Account Plan->Edit','key' => 'client/edit', 'created_at' => '2014-10-12 00:00:00', 'updated_at' => '2014-10-12 00:00:00']
        );
        DB::table('rule')->insert(
            ['name_rule' => 'Account Plan->Store','key' => 'client/store', 'created_at' => '2014-10-12 00:00:00', 'updated_at' => '2014-10-12 00:00:00']
        );
        DB::table('rule')->insert(
            ['name_rule' => 'Account Plan->Delete','key' => 'client/delete', 'created_at' => '2014-10-12 00:00:00', 'updated_at' => '2014-10-12 00:00:00']
        );
    }
}
