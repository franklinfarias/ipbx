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
        // Users
        DB::table('rule')->insert(
            ['name_rule' => 'Home','key' => 'home', 'created_at' => '2014-10-12 00:00:00', 'updated_at' => '2014-10-12 00:00:00']
        );
        DB::table('rule')->insert(
            ['name_rule' => 'User->Profile','key' => 'user/profile', 'created_at' => '2014-10-12 00:00:00', 'updated_at' => '2014-10-12 00:00:00']
        );
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
        DB::table('rule')->insert(
            ['name_rule' => 'User->Delete','key' => 'user/delete', 'created_at' => '2014-10-12 00:00:00', 'updated_at' => '2014-10-12 00:00:00']
        );
        DB::table('rule')->insert(
            ['name_rule' => 'User->Notification','key' => 'user/notification', 'created_at' => '2014-10-12 00:00:00', 'updated_at' => '2014-10-12 00:00:00']
        );
        DB::table('rule')->insert(
            ['name_rule' => 'User->ReadNotification','key' => 'user/readnotification', 'created_at' => '2014-10-12 00:00:00', 'updated_at' => '2014-10-12 00:00:00']
        );
        DB::table('rule')->insert(
            ['name_rule' => 'User->Image','key' => 'user/image', 'created_at' => '2014-10-12 00:00:00', 'updated_at' => '2014-10-12 00:00:00']
        );
        // Profile
        DB::table('rule')->insert(
            ['name_rule' => 'Profile->Index','key' => 'profile/index', 'created_at' => '2014-10-12 00:00:00', 'updated_at' => '2014-10-12 00:00:00']
        );
        DB::table('rule')->insert(
            ['name_rule' => 'Profile->Create','key' => 'profile/create', 'created_at' => '2014-10-12 00:00:00', 'updated_at' => '2014-10-12 00:00:00']
        );
        DB::table('rule')->insert(
            ['name_rule' => 'Profile->Edit','key' => 'profile/edit', 'created_at' => '2014-10-12 00:00:00', 'updated_at' => '2014-10-12 00:00:00']
        );
        DB::table('rule')->insert(
            ['name_rule' => 'Profile->Store','key' => 'profile/store', 'created_at' => '2014-10-12 00:00:00', 'updated_at' => '2014-10-12 00:00:00']
        );
        DB::table('rule')->insert(
            ['name_rule' => 'Profile->Delete','key' => 'profile/delete', 'created_at' => '2014-10-12 00:00:00', 'updated_at' => '2014-10-12 00:00:00']
        );
        // Rule
        DB::table('rule')->insert(
            ['name_rule' => 'Rule->Index','key' => 'rule/index', 'created_at' => '2014-10-12 00:00:00', 'updated_at' => '2014-10-12 00:00:00']
        );
        DB::table('rule')->insert(
            ['name_rule' => 'Rule->Create','key' => 'rule/create', 'created_at' => '2014-10-12 00:00:00', 'updated_at' => '2014-10-12 00:00:00']
        );
        DB::table('rule')->insert(
            ['name_rule' => 'Rule->Edit','key' => 'rule/edit', 'created_at' => '2014-10-12 00:00:00', 'updated_at' => '2014-10-12 00:00:00']
        );
        DB::table('rule')->insert(
            ['name_rule' => 'Rule->Store','key' => 'rule/store', 'created_at' => '2014-10-12 00:00:00', 'updated_at' => '2014-10-12 00:00:00']
        );
        DB::table('rule')->insert(
            ['name_rule' => 'Rule->Delete','key' => 'rule/delete', 'created_at' => '2014-10-12 00:00:00', 'updated_at' => '2014-10-12 00:00:00']
        );
        // Profile-Rule
        DB::table('rule')->insert(
            ['name_rule' => 'Profile-Rule->Index','key' => 'profileRule/index', 'created_at' => '2014-10-12 00:00:00', 'updated_at' => '2014-10-12 00:00:00']
        );
        DB::table('rule')->insert(
            ['name_rule' => 'Profile-Rule->Create','key' => 'profileRule/create', 'created_at' => '2014-10-12 00:00:00', 'updated_at' => '2014-10-12 00:00:00']
        );
        DB::table('rule')->insert(
            ['name_rule' => 'Profile-Rule->Store','key' => 'profileRule/store', 'created_at' => '2014-10-12 00:00:00', 'updated_at' => '2014-10-12 00:00:00']
        );
        DB::table('rule')->insert(
            ['name_rule' => 'Profile-Rule->Delete','key' => 'profileRule/delete', 'created_at' => '2014-10-12 00:00:00', 'updated_at' => '2014-10-12 00:00:00']
        );

    }
}
