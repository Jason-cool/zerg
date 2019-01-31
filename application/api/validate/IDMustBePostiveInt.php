<?php
/**
 * Created by PhpStorm.
 * User: jason
 * Date: 2018/12/17
 * Time: 16:50
 */

namespace app\api\validate;
use think\Validate;

class IDMustBePostiveInt extends BaseValidate
{
    protected $rule = [
        'id'  =>'require|isPostiveInteger',
//        'num' =>'in:1,2,3'
    ];
    protected $message =[
        'id' => 'id参数必须是正整数'
    ];


}