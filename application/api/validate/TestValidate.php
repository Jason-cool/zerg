<?php
/**
 * Created by PhpStorm.
 * User: jason
 * Date: 2018/12/17
 * Time: 15:57
 */

namespace app\api\validate;
use think\Validate;

class TestValidate extends Validate
{
    protected $rule= [
        'name' =>'require|max:10',
        'email' =>'email'
    ];
}