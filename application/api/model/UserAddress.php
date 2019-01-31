<?php
/**
 * Created by PhpStorm.
 * User: jason
 * Date: 2018/12/28
 * Time: 17:20
 */

namespace app\api\model;


class UserAddress extends BaseModel
{
    protected $hidden = ['id','user_id','delete_time'];
}