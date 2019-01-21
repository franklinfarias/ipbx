<?php

use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $this->call(ProfileTableSeeder::class);
        $this->call(RuleTableSeeder::class);
        $this->call(ProfileRuleTableSeeder::class);
        $this->call(UserTableSeeder::class);
        $this->call(DomainTableSeeder::class);

        $this->call(ClientTableSeeder::class);
    }
}
