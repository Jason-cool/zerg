<?php
/**
 * Created by PhpStorm.
 * User: jason
 * Date: 2018/12/27
 * Time: 12:11
 */

namespace app\api\service;


use app\api\model\User as UserModel;
use app\lib\enum\ScopeEnum;
use app\lib\exception\WeChatException;
use app\lib\exception\TokenException;
use think\Exception;

class UserToken extends Token
{
    protected $wxAppID;
    protected $wxAppSecret;
    protected $wxLoginUrl;
    protected $code;

    function __construct($code)
    {
        $this->wxAppID = config('wx.app_id');
        $this->wxAppSecret = config('wx.app_secret');
        $this->code = $code;
        $this->wxLoginUrl = sprintf(config('wx.login_url'), $this->wxAppID, $this->wxAppSecret, $this->code);
    }

    public function get()
    {
        $res = curl_get($this->wxLoginUrl);
        $wxRes = json_decode($res, true);
//        dump($wxRes);
        if (empty($wxRes)) {
            throw new Exception('获取session_key和openid异常，微信内部发生错误');
        } else {
            if (array_key_exists('errcode', $wxRes)) {
                $this->processLoginError($wxRes);
            } else {
                return $this->grantToken($wxRes);
            }
        }
    }

    private function grantToken($wxRes)
    {
        $openid = $wxRes['openid'];
        $session_key = $wxRes['session_key'];
        $user = UserModel::getByOpenid($openid);
        if ($user) {
            $uid = $user->id;
        } else {
            $uid = $this->newUser($openid);
        }
        $cachedValue = $this->prepareCachedValue($wxRes, $uid);
        return $this->saveToCache($cachedValue);
    }

    private function saveToCache($cachedValue)
    {
        $key = self::generateToken();
        $value = json_encode($cachedValue);
        $expire_in = config('setting.token_expire_in');
        $request = cache($key,$value,$expire_in);
//        $res = Cache::set($key,$cachedValue,config('setting.time_out'));
        if(!$request){
            throw new TokenException([
                'msg'       =>    '服务器缓存异常',
                'errorCode' =>    '10005'
            ]);
        }
        return $key;
    }

    private function prepareCachedValue($wxRes, $uid)
    {
        $cachedValue = $wxRes;
        $cachedValue['uid'] = $uid;
        $cachedValue['scope'] = ScopeEnum::User;
//        $cachedValue['scope'] = 15;
        return $cachedValue;
    }

    private function newUser($openid)
    {
        $user = UserModel::create([
            'openid' => $openid,
        ]);
        return $uid = $user->id;
    }

    private function processLoginError($wxRes)
    {
        throw new WeChatException([
            'errorCode' => $wxRes['errcode'],
            'msg' => $wxRes['errmsg'],
        ]);
    }
}