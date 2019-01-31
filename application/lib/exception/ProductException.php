<?php
/**
 * Created by PhpStorm.
 * User: jason
 * Date: 2018/12/26
 * Time: 13:52
 */

namespace app\lib\exception;


class ProductException extends BaseException
{
    public $code = 404;
    public $msg = '请求的商品不存在 请检查参数是否错误';
    public $errorCode = 20000;
}