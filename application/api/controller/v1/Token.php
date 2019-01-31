<?php
/**
 * Created by PhpStorm.
 * User: jason
 * Date: 2018/12/27
 * Time: 12:02
 */

namespace app\api\controller\v1;


use app\api\service\AppToken;
use app\api\service\UserToken;
use app\api\validate\AppTokenGet;
use app\api\validate\TokenGet;
use app\lib\exception\ParamMeterException;
use app\api\service\Token as TokenService;

class Token
{
    /**
     * 获取令牌
     * @url z.cn/api/v1/token/user
     * @param string $code
     * @return array {"token": "b6d0ba22f83336b8bf551a778ab4c85f"}
     * @throws \app\lib\exception\ParamMeterException
     * @throws \think\Exception
     */
    public function getToken($code = '')
    {
        (new TokenGet())->goCheck();
        $ut = new UserToken($code);
        $token = $ut->get();
        return [
            'token' => $token
        ];
    }

   public function verifyToken($token = '')
   {
       if(!$token){
           throw new ParamMeterException([
               'msg' =>  'token不能为空！'
           ]);
       }
       $valid = TokenService::verifyToken($token);
           return [
               'isValid'=>$valid
           ];
   }

    public function getAppToken($ac='' , $se='')
    {
        (new AppTokenGet())->goCheck();
        $app = new AppToken();
        $token = $app->get($ac,$se);
        return [
            'token'=> $token
        ];
    }

//    public function getAppToken($ac='', $se='')
//    {
////        header('Access-Control-Allow-Origin: *');
////        header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept");
////        header('Access-Control-Allow-Methods: GET');
//        (new AppTokenGet())->goCheck();
//        $app = new AppToken();
//        $token = $app->get($ac, $se);
//        return [
//            'token' => $token
//        ];
//    }
}