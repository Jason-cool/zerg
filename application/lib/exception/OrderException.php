<?php
/**
 * Created by PhpStorm.
 * User: jason
 * Date: 2019/1/2
 * Time: 15:55
 */

namespace app\lib\exception;


class OrderException extends BaseException
{
    public $code = 404;
    public $msg = '商品不存在，请检查ID';
    public $errorCode = 80000;
}