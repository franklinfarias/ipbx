<?php
/**
 * Domain.php : PHP s2n
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

use Illuminate\Support\Facades\DB;

class Domain extends S2NModel
{
    protected $table = 'domain';
    protected $primaryKey = '';

    public static function lookup($nameColumn){
        $domains = DB::table('domain')
            ->select('*')
            ->where('name_column',$nameColumn)
            ->get();

        $lookup[''] = __('messages.select-empty');
        foreach ($domains as $item){
            $lookup[$item->desc_code] = $item->desc_status;
        }
        return $lookup;
    }
}
