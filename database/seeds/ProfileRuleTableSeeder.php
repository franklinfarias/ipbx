<?php

use Illuminate\Database\Seeder;

class ProfileRuleTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        // Admin
        DB::table('profile_rule')->insert(
            ['id_profile' => 1, 'id_rule' => 1]
        );
        DB::table('profile_rule')->insert(
            ['id_profile' => 1, 'id_rule' => 2]
        );
        DB::table('profile_rule')->insert(
            ['id_profile' => 1, 'id_rule' => 3]
        );
        DB::table('profile_rule')->insert(
            ['id_profile' => 1, 'id_rule' => 4]
        );
        DB::table('profile_rule')->insert(
            ['id_profile' => 1, 'id_rule' => 5]
        );
        DB::table('profile_rule')->insert(
            ['id_profile' => 1, 'id_rule' => 6]
        );
        // Managers
        DB::table('profile_rule')->insert(
            ['id_profile' => 2, 'id_rule' => 1]
        );
        DB::table('profile_rule')->insert(
            ['id_profile' => 2, 'id_rule' => 2]
        );
        // Supervisors
        DB::table('profile_rule')->insert(
            ['id_profile' => 3, 'id_rule' => 1]
        );
        DB::table('profile_rule')->insert(
            ['id_profile' => 3, 'id_rule' => 2]
        );
        // Users
        DB::table('profile_rule')->insert(
            ['id_profile' => 4, 'id_rule' => 1]
        );
        DB::table('profile_rule')->insert(
            ['id_profile' => 4, 'id_rule' => 2]
        );
    }
}
