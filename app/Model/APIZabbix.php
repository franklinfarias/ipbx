<?php
/**
 * APIZabbix.php : PHP S2N
 * Website: http://fksapiens.com.br/
 *
 * Copyright (c) 1999 - 2017 Franklin Farias <franklin@fksapiens.com.br>
 * All Rights Reserved.
 *
 * This software is released under the terms of the GNU Lesser General Public License v2.1
 * A copy of which is available from http://www.gnu.org/copyleft/lesser.html
 *
 * Written for PHP 5.4, should work with older PHP 4.x versions.
 *
 * Please submit bug reports, patches, etc to http://wiki.fksapiens.com.br/
 * Thanks. :)
 *
 *
 * @version 1.0
 */

namespace App\Model;


use Illuminate\Support\Facades\DB;


define('EVENT_SOURCE_TRIGGERS', 0);
define('EVENT_OBJECT_TRIGGER', 0);


class APIZabbix
{

    /**
     * Host nam ou ip
     * @var string
     */
    public $host;

    /**
     * Username to connect Zabbix
     * @var string
     */
    public $user;

    /**
     * Password of user
     * @var string
     */
    public $password;

    /**
     * APIZabbix constructor.
     * @param string $host
     * @param string $user
     * @param string $password
     */
    public function __construct($host='10.61.231.133',$user='zabbix',$password='zabbix'){
        $this->host = $host;
        $this->user = $user;
        $this->password = $password;
    }

    /**
     *
     * @param string $query
     * @param string $method
     * @param string $auth
     * @return mixed
     */
    private function execJSON($query, $method, $auth, $id)
    {
        try {
            // URL do Zabbix - Esse campo precisa ser alterado
            $url = "http://".$this->host."/zabbix/api_jsonrpc.php";


            /* Monta o post para a API do Zabbix
            Para utilizar o JSON com PHP, substituímos {} por array associativo.
            Este array será posteriormente convertido para o formato JSON por uma
            função interna do PHP (a partir da versão 5.2). Desta forma não corremos
            o risco de passar caracteres incorretos durante a utilização do JSON.  */

            $post = array('jsonrpc' => '2.0',
                'method' => $method,
                'params' => $query,
                'auth' => (empty($auth) ? null : $auth),
                'id' => $id
            );

            // Utiliza a função json_encode() para converter o post para o padrão JSON.
            $data = json_encode($post);

            // Pega o caminho do CURL
            //$curl = exec("curl");

            /*    Monta a string para execução do CURL, onde:
            $curl = caminho do curl;
            -X POST = define o método de requisição a ser passado para o servidor.
            Neste caso, o POST
            -H 'Content-Type: application/json' = Define o cabeçalho (header) da requisição.
                              Neste caso, estamos informando que o tipo
                              de informação é do tipo JSON.
            -d '$data' = define quais dados serão enviados para a API.
            $url = Endereço da API do Zabbix.     */

            $curlStr = "curl -X POST -H 'Content-Type: application/json' '$url' -d '$data'";

            // Executa o CURL
            $execCurl = exec($curlStr);

            /*   Pega a saída da execução do CURL e decodifica de JSON para o padrÃ£do PHP, ex.:
            JSON: {"jsonrpc":"2.0","result":"5b97745abb3274383719ea854f176b77","id":1}
            PHP: stdClass Object ( [jsonrpc] => 2.0 [result] => 5b97745abb3274383719ea854f176b77 [id] => 1) */

            $curlOutput = json_decode($execCurl);

            // Retorna o resultado do CURL, apresentando apenas o campo 'result'.
            return $curlOutput->result;
        } catch (Exception $e) {
            echo "Exceção: ", $e->getMessage(), "\n";
        }
    }

    /**
     *
     * @param $triggerId
     * @param $startTime unixtimestamp
     * @param $endTime unixtimestamp
     * @return mixed
     */
    public function calculateAvailability($triggerId, $startTime, $endTime) {
        $startValue = 0;

        if ($startTime > 0 && $startTime <= time()) {
            $row = $this->getStartTime($triggerId,$startTime);
            if ($row) {
                $startValue = $row[0]->value;
                $min = $startTime;
            }
        }

        $dbEvents = $this->getEvents($triggerId,$startTime,$endTime);
        if ($dbEvents[0]->cnt > 0) {
            if (!isset($min)) {
                $min = $dbEvents[0]->min_clock;
            }
            $max = $dbEvents[0]->max_clock;
        }
        else {
            if ($startTime == 0 && $endTime == 0) {
                $max = time();
                $min = $max - 86400;
            }
            else {
                $ret['true_time'] = 0;
                $ret['false_time'] = 0;
                $ret['true'] = (1 == $startValue) ? 100 : 0;
                $ret['false'] = (0 == $startValue) ? 100 : 0;
                return $ret;
            }
        }

        $ret = [];
        $state = $startValue;
        $true_time = 0;
        $false_time = 0;
        $time = $min;
        if ($startTime == 0 && $endTime == 0) {
            $max = time();
        }
        if ($endTime == 0) {
            $endTime = $max;
        }

        $rows = 0;
        $dbEvents = $this->getEventsByPeriod($triggerId,$min,$max);
        foreach($dbEvents as $row) {
            $clock = $row->clock;
            $value = $row->value;

            $diff = $clock - $time;
            $time = $clock;

            if ($state == 0) {
                $false_time += $diff;
                $state = $value;
            }
            elseif ($state == 1) {
                $true_time += $diff;
                $state = $value;
            }
            $rows++;
        }

        if ($rows == 0) {
            $trigger = $this->getTriggerByTriggerId($triggerId);
            $state = $trigger[0]->value;
        }

        if ($state == 0) {
            $false_time = $false_time + $endTime - $time;
        }
        elseif ($state == 1) {
            $true_time = $true_time + $endTime - $time;
        }
        $total_time = $true_time + $false_time;

        if ($total_time == 0) {
            $ret['true_time'] = 0;
            $ret['false_time'] = 0;
            $ret['true'] = 0;
            $ret['false'] = 0;
        }
        else {
            $ret['true_time'] = $true_time;
            $ret['false_time'] = $false_time;
            $ret['true'] = (100 * $true_time) / $total_time;
            $ret['false'] = (100 * $false_time) / $total_time;
        }

        return $ret;
    }

    /**
     *
     */
    public function getData($method, $output)
    {
        /* Monta o post com o usuário e senha para autenticação no Zabbix
           Esses campo precisam ser alterados */
        $queryAuth = array('user' => $this->user,
            'password' => $this->password
        );

        /* Executa a Query para efetuar o login no Zabbix o retorno é uma string de 32 caracteres.
           Padrão para token de autenticação do Zabbix. */
        $auth = $this->execJSON($queryAuth, 'user.login', '', 1);

        // Verifica se a autenticação retornou uma string de 32 caracteres.
        if (strlen($auth) === 32) {
            /* Hora local menos 10 minutos no formato EPOCH
            A utilização de um período de tempo definido melhora o desempenho da busca no banco de dados. */
            $horaInicial = time() - 600;

            /* Item a ser pesquisado normalmente utilizo get: $_GET["item"]
               Esse campo precisa ser alterado */
            $item = 123456;

            // Monta o post para a busca de host.
            /*$queryGetHistory = array('output' => 'extend',
                'itemids' => $item,
                'history' => 0,
                'sortfield' => 'clock',
                'sortorder' => 'DESC',
                'time_from' => $horaInicial,
                'limit' => 1
            );*/


            // Executa a query de busca de host
            $outputGetHistory = $this->execJSON($output, $method, $auth, 2);

            /* Executa uma sequência de comandos para cada item encontrado. No caso, exibe o valor coletado.
               Tratamos como array porque o resultado de uma consulta dessas é um array com cada item retornado.*/
            //foreach ($outputGetHistory as $history) {
            //    echo "<br>Valor: $history->value";
            //}
            return $outputGetHistory;
        }
    }

    /**
     * Transform the Data array to Data Select (Dropdownlist)
     * @param $data array
     * @param $key string
     * @param $value string
     * @return array
     */
    public function toDataSelect($data, $key, $value)
    {
        $result[] = __('messages.select-empty');
        foreach ($data as $item){
            $result[$item->$key] = $item->$value;
        }
        return $result;
    }


    /**
     * @param integer $triggerId
     * @param unixtimestamp $startTime
     * @return mixed
     */
    private function getStartTime($triggerId,$startTime){
        $sql = 'SELECT e.eventid,e.value'.
            ' FROM events e'.
            " WHERE e.objectid=$triggerId".
            ' AND e.source=0'.
            ' AND e.object=0'.
            " AND e.clock<$startTime".
            ' ORDER BY e.eventid DESC';
        return DB::connection('zbx')->select($sql);
    }

    /**
     * @param integer $triggerId
     * @param unixtimestamp $startTime
     * @param unixtimestamp $endTime
     * @return mixed
     */
    private function getEvents($triggerId,$startTime,$endTime){
        $sql = 'SELECT COUNT(e.eventid) AS cnt,MIN(e.clock) AS min_clock,MAX(e.clock) AS max_clock'.
            ' FROM events e'.
            " WHERE e.objectid=$triggerId".
            ' AND e.source=0'.
            ' AND e.object=0';
        if ($startTime) {
            $sql .= " AND e.clock>=$startTime";
        }
        if ($endTime) {
            $sql .= " AND e.clock<=$endTime";
        }

        return DB::connection('zbx')->select($sql);
    }

    /**
     *
     * @param integer $triggerId
     * @param integer $min
     * @param integer $max
     * @return mixed
     */
    private function getEventsByPeriod($triggerId,$min,$max){
        $sql = 'SELECT e.eventid,e.clock,e.value'.
            ' FROM events e'.
            ' WHERE e.objectid='.$triggerId.
            ' AND e.source=0'.
            ' AND e.object=0'.
            ' AND e.clock BETWEEN '.$min.' AND '.$max.
            ' ORDER BY e.eventid';

        return DB::connection('zbx')->select($sql);
    }

    /**
     *
     * @param integer $triggerId
     * @return bool
     */
    private function getTriggerByTriggerId($triggerId){
        $db_trigger = DB::connection('zbx')->select("SELECT t.* FROM triggers t WHERE t.triggerid=".$triggerId);
        if (!empty($db_trigger)) {
            return $db_trigger;
        }
        //error(_s('No trigger with triggerid "%1$s".', $triggerid));

        return false;
    }

}