<?php
/**
 * Created by PhpStorm.
 * User: jason
 * Date: 2019/1/4
 * Time: 13:38
 */

namespace app\api\service;

use app\api\service\Order as OrderService;
use app\api\model\Order as OrderModel;
use app\api\service\Token as TokenService;
use app\lib\enum\OrderStatusEnum;
use app\lib\exception\OrderException;
use app\lib\exception\TokenException;
use think\Exception;
use think\Loader;
use think\Log;

// 引入 extend/WxPay/WxPay.Api.php
Loader::import('WxPay.WxPay', EXTEND_PATH, '.Api.php');
//Loader::import('WxPay.WxPay', EXTEND_PATH, '.Config.php');
class Pay
{
    private $orderID;//订单号
    private $orderMO;//订单编号
    function __construct($orderID)
    {
        if(empty($orderID)){
            throw new Exception('id不能为空');
        }
        $this->orderID = $orderID;
    }
    public function pay()
    {
        //订单号是否存在
        //当前单订单还号是否为当前用户的
        //是否支付过
        //检测库存
        $this->checkOrderValid();
        $orderService = new OrderService();
        $status = $orderService->checkOrderStock($this->orderID);
        if(!$status['pass']){
            return $status;
        }
        $this->makePreOrder($status['orderPrice']);

    }

    /**
     * 统一下单
     * @param $totalPrice
     * @throws Exception
     * @throws TokenException
     */
    private function makePreOrder($totalPrice)
    {
        //获取缓存中的openid
        $openid = TokenService::getCurrentTokenVar('openid');
        if(!$openid) {
            throw new TokenException();
        }
        $input = new \WxPayUnifiedOrder();
        $input->SetBody("零食商贩");
        $input->SetOut_trade_no($this->orderMO);
        $input->SetTotal_fee($totalPrice*100);
        $input->SetGoods_tag("test");
        $input->SetNotify_url(config('secure.pay_back_url'));
        $input->SetTrade_type("JSAPI");
        $input->SetOpenid($openid);
        return $this->getPaySignature($input);
    }
    /**
     * 签名,获取jsapi支付的参数
     * @param $input
     * @return \json数据，可直接填入js函数作为参数
     * @throws \WxPayException
     */
    private function getPaySignature($input)
    {
        //统一下单的预支付支付信息
        $config = new \WxPayConfig();
        $appid = $config->GetAppId();
        $order = \WxPayApi::unifiedOrder($config, $input);
        if($order['return_code'] != 'SUCCESS' || $order['result_code'] !='SUCCESS'){
            Log::record($order,'error');  //修改成自己的异常处理
            Log::record('获取预支付订单失败','error');
        }
        $jsApiParameters = $this->GetJsApiParameters($order);
        return $jsApiParameters;
    }

    /**
     *
     * 获取jsapi支付的参数
     * @param array $UnifiedOrderResult 统一支付接口返回的数据
     * @throws \WxPayException
     *
     * @return json数据，可直接填入js函数作为参数
     */
    public function GetJsApiParameters($UnifiedOrderResult)
    {
        if(!array_key_exists("appid", $UnifiedOrderResult)
            || !array_key_exists("prepay_id", $UnifiedOrderResult)
            || $UnifiedOrderResult['prepay_id'] == "")
        {
            throw new \WxPayException("参数错误");
        }

        $jsapi = new \WxPayJsApiPay();
        $jsapi->SetAppid($UnifiedOrderResult["appid"]);
        $timeStamp = time();
        $jsapi->SetTimeStamp("$timeStamp");//(string)time()
        $jsapi->SetNonceStr(\WxPayApi::getNonceStr());
        $jsapi->SetPackage("prepay_id=" . $UnifiedOrderResult['prepay_id']);

        $config = new \WxPayConfig();
        $jsapi->SetPaySign($jsapi->MakeSign($config));//使用HMAC-SHA256加密
//        $parameters = json_encode($jsapi->GetValues());
        $parameters = $jsapi->GetValues();
        return $parameters;
    }

    //检查订单号是否合法

    /**
     * @return bool
     * @throws Exception
     * @throws OrderException
     * @throws TokenException
     */
    private function checkOrderValid()
    {
        $order = OrderModel::where('id','=',$this->orderID)->find();
        if(!$order){
            throw new OrderException();
        }
        $res = TokenService::isValidOperate($order->user_id);
        if(!$res) {
            throw new TokenException([
                'msg' =>'订单与用户不匹配',
                'errorCode' =>10003
            ]);
        }
        if($order->status != OrderStatusEnum::UPAID){
            throw new OrderException([
                'msg' =>'订单已经支付',
                'crrorCode' =>80003,
                'code' =>400,
            ]);
        }
        $this->orderMO = $order->order_no;
        return true;
    }
}