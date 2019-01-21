<?php

use Illuminate\Database\Seeder;

class UserTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //
        DB::table('user')->insert([
            'id_profile' => 1,
            'name' => 'Franklin Farias',
            'login' => 'franklin.farias',
            'email' => 'franklin.farias@vert.com.br',
            'extension' => '1000',
            'password' => bcrypt('123456'),
            'ind_st_user' => '1',
            'created_at' => '2014-10-12 00:00:00',
            'updated_at' => '2014-10-12 00:00:00'
        ]);
        //
        DB::table('user')->insert([
            'id_profile' => 1,
            'name' => 'Tarcísio Belo',
            'login' => 'tarcisio.belo',
            'email' => 'tarcisio.belo@vert.com.br',
            'extension' => '1001',
            'password' => bcrypt('123456'),
            'ind_st_user' => '1',
            'created_at' => '2014-10-12 00:00:00',
            'updated_at' => '2014-10-12 00:00:00'
        ]);
    }
}

