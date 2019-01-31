<?php
/**
 * Created by PhpStorm.
 * User: jason
 * Date: 2019/1/28
 * Time: 15:41
 */

namespace app\api\service;


use think\Cache;

class AccessToken
{
    public function getAccessToken()
    {
         return $resCache = $this->getAccessFromCache();
    }

    public function getAccessFromCache()
    {
        $cache = Cache::get('accessToken');
        if(!$cache){
            return $this->getAccessFromServer();
        } else {
            return json_decode($cache,true);
        }
    }

    public function getAccessFromServer()
    {
        $url = 'https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=%s&secret=%s';
        $url = sprintf($url,config('wx.app_id'),config('wx.app_secret'));
        $res = curl_get($url);
        $resArr = json_decode($res,true);
//        dump($resJson);
        if(!empty($resArr)){
            $flag = Cache::set('accessToken',$res,7000);
            if($flag){
                return $resArr;
            }
        }
    }
}