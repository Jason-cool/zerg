<?php
/**
 * Created by PhpStorm.
 * User: jason
 * Date: 2018/12/20
 * Time: 11:35
 */

namespace app\lib\exception;


class ParamMeterException extends BaseException
{
    public $code = 400;
    public $errorCode = 10000;
    public $msg = '参数错误';
}