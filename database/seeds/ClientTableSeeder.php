<?php

use Illuminate\Database\Seeder;

class ClientTableSeeder extends Seeder
{

    public $XML = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>
<document>
   <servicenow>
      <host>vert.service-now.com</host>
      <user>franklin.farias</user>
      <password>Fks@2390</password>
      <sys_domain>ba0746730f7a32004fe186ea42050e00</sys_domain>
      <tables>
         <incident sysparm_query=\"stateIN=6,7,8^ORDERBYclosed_at\">incident</incident>
         <request sysparm_query=\"stateIN=5,7,11^ORDERBYclosed_at\">sc_req_item</request>
         <problem sysparm_query=\"state=4^ORDERBYclosed_at\">problem</problem>
         <change sysparm_query=\"ORDERBYclosed_at\">change_request</change>
      </tables>
   </servicenow>
   <zabbix>
      <host>10.61.231.133</host>
      <user>franklin.farias</user>
      <password>Fks@2390</password>
      <groupid>0</groupid>
      <triggerid>14251</triggerid>
   </zabbix>
   <asterisk>
      <webservice />
      <code />
   </asterisk>
</document>";

    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //
        DB::table('client')->insert([
            'id_client' => 1,
            'short_name' => 'COSTA&SILVA',
            'name' => 'Advogados Costa & Silva',
            'email' => 'franklin.farias@vert.com.br',
            'config' => $this->XML,
            'ind_st_client' => '1',
            'created_at' => '2014-10-12 00:00:00',
            'updated_at' => '2014-10-12 00:00:00'
        ]);
        //
        DB::table('client')->insert([
            'id_client' => 2,
            'short_name' => 'CAUBR',
            'name' => 'Conselho de Arquitetura e Urbanismo do Brasil',
            'email' => 'franklin.farias@vert.com.br',
            'config' => $this->XML,
            'ind_st_client' => '1',
            'created_at' => '2014-10-12 00:00:00',
            'updated_at' => '2014-10-12 00:00:00'
        ]);
        //
        DB::table('client')->insert([
            'id_client' => 3,
            'short_name' => 'FIPECQ',
            'name' => 'Fundação de Previdência Complementar dos Empregados da FINEP',
            'email' => 'franklin.farias@vert.com.br',
            'config' => $this->XML,
            'ind_st_client' => '1',
            'created_at' => '2014-10-12 00:00:00',
            'updated_at' => '2014-10-12 00:00:00'
        ]);
        //
        DB::table('client')->insert([
            'id_client' => 4,
            'short_name' => 'PROGEN',
            'name' => 'Projetos, Gerenciamento e Engenharia',
            'email' => 'franklin.farias@vert.com.br',
            'config' => $this->XML,
            'ind_st_client' => '1',
            'created_at' => '2014-10-12 00:00:00',
            'updated_at' => '2014-10-12 00:00:00'
        ]);
    }
}

