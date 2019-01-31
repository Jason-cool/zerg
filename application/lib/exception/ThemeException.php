<?php
/**
 * Created by PhpStorm.
 * User: jason
 * Date: 2018/12/25
 * Time: 15:52
 */

namespace app\lib\exception;


class ThemeException extends BaseException
{
    public $code = 404;
    public $msg = '请求的主题不存在 请检查ID是否错误';
    public $errorCode = 30000;
}