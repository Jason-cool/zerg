<?php
/**
 * Created by PhpStorm.
 * User: jason
 * Date: 2019/1/8
 * Time: 16:27
 */

namespace app\api\validate;


class PagingParameter extends BaseValidate
{
    protected $rule = [
        'size' => 'isPostiveInteger',
        'page' => 'isPostiveInteger',
    ];

    protected $message = [
        'size' => 'size参数必须是正参数',
        'page' => 'page参数必须是正参数'
    ];
}