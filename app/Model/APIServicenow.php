<?php
/**
 * Created by PhpStorm.
 * User: franklin
 * Date: 4/21/18
 * Time: 2:31 AM
 */

namespace App\Model;


class APIServicenow
{
    public $host;
    public $user;
    public $password;
    private $table;
    private $sysparmQuery;

    public function __construct($host, $user, $password)
    {
        $this->host = $host;
        $this->user = $user;
        $this->password = $password;
    }

    private function execJSON()
    {
        try {
            $url = "https://" . $this->host . "/api/now/table/";

            $url .= $this->table . "?sysparm_display_value=true&sysparm_query=" . $this->sysparmQuery;

            $curlStr = "curl \"$url\" --request GET --header \"Accept:application/json\" --user '" . $this->user . "':'" . $this->password . "'";

            $execCurl = exec($curlStr);

            $curlOutput = json_decode($execCurl);

            return $curlOutput->result;

        } catch (Exception $e) {
            echo "Exceção: ", $e->getMessage(), "\n";
        }
    }

    public function getData($table, $sysparmQuery)
    {
        $this->table = $table;
        $this->sysparmQuery = $sysparmQuery;

        $outputGetHistory = $this->execJSON();

        return $outputGetHistory;
    }
}