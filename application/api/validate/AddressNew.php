<?php
/**
 * Created by PhpStorm.
 * User: jason
 * Date: 2018/12/28
 * Time: 15:14
 */

namespace app\api\validate;


class AddressNew extends BaseValidate
{
    protected $rule = [
        'name'          =>  'require|isNotEmpty',
        'mobile'        =>  'require|isMobile',
        'province'      =>  'require|isNotEmpty',
        'city'          =>  'require|isNotEmpty',
        'country'       =>  'require|isNotEmpty',
        'detail'        =>  'require|isNotEmpty',
    ];
}