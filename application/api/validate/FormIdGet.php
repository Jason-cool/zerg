<?php
/**
 * Created by PhpStorm.
 * User: jason
 * Date: 2019/1/28
 * Time: 14:07
 */

namespace app\api\validate;


class FormIdGet extends BaseValidate
{
    protected $rule = [
        'form_id'          =>  'require|isNotEmpty',
        'order_id'          =>  'require|isNotEmpty',
    ];
}