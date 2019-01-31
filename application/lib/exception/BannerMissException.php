<?php
/**
 * Created by PhpStorm.
 * User: jason
 * Date: 2018/12/19
 * Time: 13:53
 */

namespace app\lib\exception;


class BannerMissException extends BaseException
{
    public $code = 404;
    public $msg = '请求的Banner不存在';
    public $errorCode = 10000;

}