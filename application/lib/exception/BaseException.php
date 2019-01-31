<?php
/**
 * Created by PhpStorm.
 * User: jason
 * Date: 2018/12/19
 * Time: 13:48
 */

namespace app\lib\exception;


use think\Exception;

class BaseException extends Exception
{
    //http状态码
    public $code = 400;
    //自定义错误描述
    public $msg = '参数错误';
    //错误码
    public $errorCode = 10000;

    public function __construct($params = [])
    {
        if(!is_array($params)){
            return;
//            throw Exception('参数必须为数组');
        }
        if(array_key_exists('code',$params)){
            $this->code = $params['code'];
        }
        if(array_key_exists('msg',$params)){
            $this->msg = $params['msg'];
        }
        if(array_key_exists('errorCode',$params)){
            $this->errorCode = $params['errorCode'];
        }
    }
}