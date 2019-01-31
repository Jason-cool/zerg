<?php
/**
 * Created by PhpStorm.
 * User: jason
 * Date: 2018/12/19
 * Time: 13:47
 */

namespace app\lib\exception;


use Exception;
//use think\Exception;
use think\exception\Handle;
use think\Log;
use think\Request;

class ExceptionHandler extends Handle
{
    private $code;
    private $msg;
    private $errorCode;
    public function render(Exception $e)
    {

        if($e instanceof BaseException){
            $this->code = $e->code;
            $this->msg = $e->msg;
            $this->errorCode = $e->errorCode;
        }
        else{
            if (config('app_debug')) {
                return parent::render($e);
            } else {
                $this->code = 500;
                $this->msg = '服务器内部错误，不想让你知道';
                $this->errorCode = 999;
                $this->recordErrorLog($e);
            }
        }
        $requset = Request::instance();
        $result = [
            'msg'              => $this->msg,
            'errorCode'        => $this->errorCode,
            'requset_url'      => $requset->url()
        ];
        return json($result,$this->code);
    }

    private function recordErrorLog(Exception $e)
    {
        Log::init([
            'type'  => 'File',
            // 日志保存目录
            'path'  => LOG_PATH,
            // 日志记录级别
            'level' => ['error'],
        ]);
        Log::record($e->getMessage(),'error');
    }
}