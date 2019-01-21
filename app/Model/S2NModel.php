<?php
/**
* S2NModel.php : PHP s2n
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
* @package App\Model
* @version 1.0
*/


namespace App\Model;


use Illuminate\Database\Eloquent\Model;

class S2NModel extends Model {

    /**
     * Retorna o lookup de uma tabela
     * @param $collection
     * @param $idField
     * @param $valueField
     * @return array
     */
    public static function lookupTable($collection,$idField,$valueField){
        $lookup = [];
        $lookup[''] = __('messages.select-empty');
        foreach ($collection as $item){
            $lookup[$item->$idField] = $item->$valueField;
        }
        return $lookup;
    }

    /**
     * Retorna o lookup da tabela domínio
     * @param $nameColumn
     * @return mixed
     */
    public static function lookupDomain($nameColumn){
        return Domain::lookup($nameColumn);
    }

} 