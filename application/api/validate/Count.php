<?php
/**
 * Created by PhpStorm.
 * User: jason
 * Date: 2018/12/26
 * Time: 13:07
 */

namespace app\api\validate;


class Count extends BaseValidate
{
    protected $rule = [
        'count' =>'isPostiveInteger|between:1,15'
    ];
    protected $message = [
        'count' => 'count为小于15的正整数'
    ];
}