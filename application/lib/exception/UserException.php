<?php
/**
 * Created by PhpStorm.
 * User: jason
 * Date: 2018/12/28
 * Time: 17:28
 */

namespace app\lib\exception;




class UserException extends BaseException
{
    public $code = 404;
    public $msg = '用户不存在';
    public $errorCode = 60000;
}