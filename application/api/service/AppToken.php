<?php
/**
 * Created by PhpStorm.
 * User: jason
 * Date: 2019/1/25
 * Time: 17:39
 */

namespace app\api\service;



use app\api\model\ThirdApp;
use app\lib\exception\TokenException;
use think\Cache;

class AppToken extends Token
{
    public function get($ac,$se)
    {
        $res = ThirdApp::check($ac,$se);
        if(!$res){
            throw new TokenException([
                'msg' => '授权失败',
               'errorCode' => 10004
            ]);
        }
        $key = $this->saveToCache($res);
        return $key;

    }

    public function saveToCache($value)
    {
        $uid = $value->app_id;
        $scope= $value->scope;
        $arr = [$uid,$scope];
        $key = UserToken::generateToken();
        $value = json_encode($arr);
        $expire_in = config('setting.token_expire_in');
        $res = Cache::set($key,$value,$expire_in);
        if(!$res){
            throw new TokenException([
                'msg'       =>    '服务器缓存异常',
                'errorCode' =>    '10005'
            ]);
        }
        return $key;
    }
}