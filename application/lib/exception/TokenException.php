<?php
/**
 * Created by PhpStorm.
 * User: jason
 * Date: 2018/12/27
 * Time: 19:45
 */

namespace app\lib\exception;


class TokenException extends BaseException
{
    public $code = 401;
    public $msg = 'token已过期或无效token';
    public $errorCode = 10001;
}