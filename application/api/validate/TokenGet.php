<?php
/**
 * Created by PhpStorm.
 * User: jason
 * Date: 2018/12/27
 * Time: 12:03
 */

namespace app\api\validate;


class TokenGet extends BaseValidate
{
    protected $rule = [
        'code' =>'require|isNotEmpty'
    ];
    protected $message = [
        'code' => 'code为空获取不了Token'
    ];
}