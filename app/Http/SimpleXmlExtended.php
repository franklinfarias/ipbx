<?php
/**
 * Created by PhpStorm.
 * User: franklin
 * Date: 4/21/18
 * Time: 2:57 AM
 */

namespace App\Http;


class SimpleXmlExtended extends \SimpleXMLElement
{
    public function attr($name)
    {
        foreach ($this->Attributes() as $key => $val) {
            if ($key == $name)
                return (string)$val;
        }
    }
}