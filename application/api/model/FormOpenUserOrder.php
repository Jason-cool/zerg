<?php
/**
 * Created by PhpStorm.
 * User: jason
 * Date: 2019/1/26
 * Time: 12:42
 */

namespace app\api\model;


class FormOpenUserOrder extends BaseModel
{
    public static function saveFormId($data = [])
    {
         $res =  self::create($data);
         return $res;
    }
}