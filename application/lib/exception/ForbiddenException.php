<?php
/**
 * Created by PhpStorm.
 * User: jason
 * Date: 2018/12/29
 * Time: 15:14
 */

namespace app\lib\exception;


class ForbiddenException extends BaseException
{
    public $code = 403;
    public $msg = '权限不足';
    public $errorCode = 10001;
}