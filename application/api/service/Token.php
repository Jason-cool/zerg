<?php
/**
 * Created by PhpStorm.
 * User: jason
 * Date: 2018/12/27
 * Time: 19:21
 */

namespace app\api\service;


use app\lib\enum\ScopeEnum;
use app\lib\exception\ForbiddenException;
use app\lib\exception\TokenException;
use think\Cache;
use think\Exception;
use think\Request;

class Token
{
    /**
     * @return string
     */
    public static function generateToken()
    {
        $length = 32;
        $randChars = getRandChar($length);
        $timestamp = $_SERVER['REQUEST_TIME_FLOAT'];
        $salt = config('secure.token_salt');
        return md5($randChars . $timestamp . $salt);
    }

    public static function getCurrentTokenVar($key)
    {
        $token = Request::instance()->header('token');
//        $value = cache($token);
        $value = Cache::get($token);

        if(!$value){
            throw new TokenException();
        } else{
            if(!is_array($value)){
                $value = json_decode($value,true);
            }
            if(array_key_exists($key,$value)){
                return $value[$key];
            } else{
                throw new Exception('尝试获取的token变量不存在');
            }
        }
    }

    /**
     * 获取用户Uid
     * @return mixed
     * @throws Exception
     * @throws TokenException
     */
    public static function getCurrentUid()
    {
        return self::getCurrentTokenVar('uid');
    }

    /**
     * @param $token
     * @return bool
     */
    public static function verifyToken($token){
        $exist = Cache::get($token);
        if($exist){
            return true;
        } else {
            return false;
        }
    }
    //检测uid是否对的上
    public static function isValidOperate($checkUID)
    {
        if(!$checkUID){
            throw new Exception('要求传入一个被检查的UID');
        }
        $currentOperateUid = self::getCurrentUid();
        if($currentOperateUid !=$checkUID) {
            return false;
        }
        return true;
    }
    //CMS用户与小程序用户可以访问
    public static function needPrimaryScope()
    {
        $scope = self::getCurrentTokenVar('scope');
        if(!$scope) {
            throw new TokenException();
        } else {
            if($scope < ScopeEnum::User) {
                throw new ForbiddenException();
            }
        }
    }

    //只有小程序用户可以访问
    public static function needExclusiveScope()
    {
        $scope = self::getCurrentTokenVar('scope');
        if(!$scope) {
            throw new TokenException();
        } else {
            if($scope != ScopeEnum::User) {
                throw new ForbiddenException();
            }
        }
    }
}