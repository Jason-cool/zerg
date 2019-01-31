<?php
/**
 * Created by PhpStorm.
 * User: jason
 * Date: 2018/12/27
 * Time: 12:13
 */

namespace app\api\model;


class User extends BaseModel
{
    public function address()
    {
        return $this->hasOne('UserAddress','user_id','id');
    }
    public static function getByOpenid($openid)
    {
        return self::where('openid', '=', $openid)->find();
    }
}