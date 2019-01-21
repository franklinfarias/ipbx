<?php
/**
 * Client.php : PHP S2N
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

use App\Http\SimpleXmlExtended;

class Client extends S2NModel
{
    protected $table = 'client';
    protected $primaryKey = 'id_client';

    protected $fillable = [
        'short_name', 'name',
    ];

    protected $hidden = [

    ];

    /*
     * Regras de validacao dos dados do formulario
     */
    public $rules = [
        'short_name' => 'required|min:3|max:15',
        'name' => 'required|min:3|max:255',
    ];

    /*
     * Mensagens de validacao dos dados do formulario
     */
    public $messages = [
        'short_name.required' => 'O campo Sigla é preenchimento obrigatório.',
        'short_name.min' => 'O campo Sigla tem tamanho mínimo de 3 caracteres.',
        'short_name.max' => 'O campo Sigla tem tamanho máximo de 15 caracteres.',
        'name.required' => 'O campo Nome é preenchimento obrigatório.',
        'name.min' => 'O campo Nome tem tamanho mínimo de 3 caracteres.',
        'name.max' => 'O campo Nome tem tamanho máximo de 255 caracteres.',
        'email.required' => 'O campo Email é preenchimento obrigatório.',
        'email.email' => 'Informe um e-mail válido.',
    ];

    /**
     * @return \SimpleXMLElement[]
     */
    public function getConfigZabbix(){
        $xml = str_replace("\r\n",'',$this->config);
        return simplexml_load_string($xml, SimpleXmlExtended::class)->zabbix;
    }

    /**
     * @return \SimpleXMLElement[]
     */
    public function getConfigServicenow(){
        $xml = str_replace("\r\n",'',$this->config);
        return simplexml_load_string($xml, SimpleXmlExtended::class)->servicenow;
    }
}