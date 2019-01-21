<?php

use Illuminate\Database\Seeder;

class DomainTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        // IND_ST_ATIVO_INATIVO
        DB::table('domain')->insert([
            'name_column' => 'ind_st_ativo_inativo',
            'desc_code' => '0',
            'desc_status' => 'Inativo',
            'ind_st_domain' => '1',
        ]);
        DB::table('domain')->insert([
            'name_column' => 'ind_st_ativo_inativo',
            'desc_code' => '1',
            'desc_status' => 'Ativo',
            'ind_st_domain' => '1',
        ]);
        // IND_TP_PROFILE
        DB::table('domain')->insert([
            'name_column' => 'ind_tp_profile',
            'desc_code' => '1',
            'desc_status' => 'Administrators',
            'ind_st_domain' => '1',
        ]);
        DB::table('domain')->insert([
            'name_column' => 'ind_tp_profile',
            'desc_code' => '2',
            'desc_status' => 'Managers',
            'ind_st_domain' => '1',
        ]);
        DB::table('domain')->insert([
            'name_column' => 'ind_tp_profile',
            'desc_code' => '3',
            'desc_status' => 'Supervisors',
            'ind_st_domain' => '1',
        ]);
        DB::table('domain')->insert([
            'name_column' => 'ind_tp_profile',
            'desc_code' => '4',
            'desc_status' => 'Users',
            'ind_st_domain' => '1',
        ]);
        // IND_TP_NOTIFICATION
        DB::table('domain')->insert([
            'name_column' => 'ind_tp_notification',
            'desc_code' => '0',
            'desc_status' => 'Tarefa',
            'ind_st_domain' => '1',
        ]);
        DB::table('domain')->insert([
            'name_column' => 'ind_tp_notification',
            'desc_code' => '1',
            'desc_status' => 'Notificação',
            'ind_st_domain' => '1',
        ]);
        DB::table('domain')->insert([
            'name_column' => 'ind_tp_notification',
            'desc_code' => '2',
            'desc_status' => 'Mensagem',
            'ind_st_domain' => '1',
        ]);
        // IND_ST_NOTIFICATION
        DB::table('domain')->insert([
            'name_column' => 'ind_st_notification',
            'desc_code' => '0',
            'desc_status' => 'Não lido',
            'ind_st_domain' => '1',
        ]);
        DB::table('domain')->insert([
            'name_column' => 'ind_st_notification',
            'desc_code' => '1',
            'desc_status' => 'Lido',
            'ind_st_domain' => '1',
        ]);
        DB::table('domain')->insert([
            'name_column' => 'ind_st_notification',
            'desc_code' => '2',
            'desc_status' => 'Excluído',
            'ind_st_domain' => '1',
        ]);
        // IND_TP_CRON_JOB
        DB::table('domain')->insert([
            'name_column' => 'ind_tp_cron_job',
            'desc_code' => '01',
            'desc_status' => 'Uma vez',
            'ind_st_domain' => '1',
        ]);
        DB::table('domain')->insert([
            'name_column' => 'ind_tp_cron_job',
            'desc_code' => '02',
            'desc_status' => 'A cada 5 min',
            'ind_st_domain' => '1',
        ]);
        DB::table('domain')->insert([
            'name_column' => 'ind_tp_cron_job',
            'desc_code' => '03',
            'desc_status' => 'A cada 10 min',
            'ind_st_domain' => '1',
        ]);
        DB::table('domain')->insert([
            'name_column' => 'ind_tp_cron_job',
            'desc_code' => '04',
            'desc_status' => 'A cada 30 min',
            'ind_st_domain' => '1',
        ]);
        DB::table('domain')->insert([
            'name_column' => 'ind_tp_cron_job',
            'desc_code' => '05',
            'desc_status' => 'A cada 1h',
            'ind_st_domain' => '1',
        ]);
        DB::table('domain')->insert([
            'name_column' => 'ind_tp_cron_job',
            'desc_code' => '06',
            'desc_status' => 'A cada 2h',
            'ind_st_domain' => '1',
        ]);
        DB::table('domain')->insert([
            'name_column' => 'ind_tp_cron_job',
            'desc_code' => '07',
            'desc_status' => 'A cada 12h',
            'ind_st_domain' => '1',
        ]);
        DB::table('domain')->insert([
            'name_column' => 'ind_tp_cron_job',
            'desc_code' => '96',
            'desc_status' => 'Diário',
            'ind_st_domain' => '1',
        ]);
        DB::table('domain')->insert([
            'name_column' => 'ind_tp_cron_job',
            'desc_code' => '97',
            'desc_status' => 'Mensal',
            'ind_st_domain' => '1',
        ]);
        DB::table('domain')->insert([
            'name_column' => 'ind_tp_cron_job',
            'desc_code' => '98',
            'desc_status' => 'Semanal',
            'ind_st_domain' => '1',
        ]);
        DB::table('domain')->insert([
            'name_column' => 'ind_tp_cron_job',
            'desc_code' => '99',
            'desc_status' => 'Anual',
            'ind_st_domain' => '1',
        ]);
    }
}

