<?php
/**
 * Created by PhpStorm.
 * User: jason
 * Date: 2018/12/26
 * Time: 15:33
 */

namespace app\lib\exception;


class CategoryException extends BaseException
{
    public $code = 404;
    public $msg = '请求的类别不存在，请检查参数';
    public $errorCode = 50000;
}