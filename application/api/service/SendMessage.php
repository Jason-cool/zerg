<?php
/**
 * Created by PhpStorm.
 * User: jason
 * Date: 2019/1/28
 * Time: 15:31
 */

namespace app\api\service;


use app\api\model\FormOpenUserOrder;
use app\api\model\Order as OrderModel;
use app\lib\enum\OrderStatusEnum;
use think\Log;

class SendMessage
{
    public function send(){
        $order_id = input('put.id');
        if (!$order_id) {
            throw new OrderException();
        }
        $token = new AccessToken();
        $accessToken = $token->getAccessToken()['access_token'];
        $ids = $this->getId($order_id);
        $openid = $ids->openid;
        $form_id = $ids->form_id;
        $time = date('Y年m月d日',time());
        $orderDetail = OrderModel::get($order_id);
            $postData = array(
                "touser"        =>$openid,      //用户openid
                "template_id"   =>'4iil8IIzBj7O5L7-i4aZSn1ORpI0xOt-6nrAD13Aun0',  //模板消息ID
                "page"          =>'pages/order/order?from=order&id='.$order_id,
                "form_id"       =>$form_id ,      //表单提交场景下，事件带上的 formId；支付场景下，为本次支付的 prepay_id
                "data"          =>array(
                    'keyword1'  => array('value'=>'顺丰快递','color'=>'#000000'),
                    'keyword2'  => array('value'=>$time,'color'=>'#000000'),
                    'keyword3'  => array('value'=>$orderDetail->snap_name,'color'=>'#000000'),
                    'keyword4'  => array('value'=>'零食商贩','color'=>'#000000'),
                    'keyword5'  => array('value'=>$orderDetail->order_no,'color'=>'#000000')
                ),
                'emphasis_keyword'=>''
            );
            $url = "https://api.weixin.qq.com/cgi-bin/message/wxopen/template/send?access_token={$accessToken}";
            $rtn = https_curl_json($url,$postData,'json');
            Log::write($rtn,'notice');
//             echo $rtn;
//             var_dump(json_decode($rtn,true)['errcode']);
//             return;
            if((json_decode($rtn,true))['errcode']==0){
               orderModel::update(['id' => $order_id, 'status' => OrderStatusEnum::DELIVERED]);
            }
           return $rtn;
        }
       private function getId($order_id)
       {
           return FormOpenUserOrder::where('order_id','=',$order_id)->find();
       }
}
