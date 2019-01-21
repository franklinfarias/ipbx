<?php
/**
 * Notification.php : PHP s2n
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

class Notification extends S2NModel
{
    protected $table = 'notification';
    protected $primaryKey = 'id_notification';

    /**
     *
     * @return \Illuminate\Database\Eloquent\Relations\HasOne
     */
    public function userOrigin(){
        return $this->hasOne('App\Model\User','id_user','id_user_origin');
    }
    /**
     *
     * @return \Illuminate\Database\Eloquent\Relations\HasOne
     */
    public function userDestiny(){
        return $this->hasOne('App\Model\User','id_user','id_user_destiny');
    }

}
