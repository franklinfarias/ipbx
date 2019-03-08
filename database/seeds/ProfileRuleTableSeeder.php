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
        DB::insert('insert into profile_rule(id_profile,id_rule) select 1, id_rule from rule');

    }
}
