<?php
/**
 * Created by PhpStorm.
 * User: jason
 * Date: 2019/1/25
 * Time: 17:36
 */

namespace app\api\validate;


class AppTokenGet extends BaseValidate
{
    protected $rule = [
        'ac'          =>  'require|isNotEmpty',
        'se'          =>  'require|isNotEmpty',
    ];
}