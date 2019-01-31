<?php
/**
 * Created by PhpStorm.
 * User: jason
 * Date: 2019/1/25
 * Time: 17:45
 */

namespace app\api\model;


use app\lib\exception\TokenException;

class ThirdApp extends BaseModel
{
    public static function check($ac,$se)
    {
        $res  = self::where('app_id','=',$ac)->where('app_secret','=',$se)->find();
        return $res;
    }
}