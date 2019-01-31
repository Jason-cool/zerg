<?php
/**
 * Created by PhpStorm.
 * User: jason
 * Date: 2018/12/30
 * Time: 15:38
 */

namespace app\api\controller\v1;

use app\api\controller\BaseController;
use app\api\model\FormOpenUserOrder;
use app\api\service\Order as OrderService;
use app\api\model\Order as OrderModel;
use app\api\service\SendMessage;
use app\api\service\Token as TokenService;
use app\api\validate\AppTokenGet;
use app\api\validate\FormIdGet;
use app\api\validate\IDMustBePostiveInt;
use app\api\validate\OrderPlace;
use app\api\validate\PagingParameter;
use app\lib\exception\OrderException;
use app\lib\exception\SuccessMessage;
use think\Controller;

class Order extends BaseController
{
    //用户在选择商品后，向API提交包含它选择商品的相关信息
    //Api接收到信息后，需要检查订单相关的商品库存量
    //有库存，订单数据存入数据库中=下单成功，返回客户端信息，告诉客户端可以支付了
    //调用我们的支付接口进行支付。
    //还需要在进行库存量检测
    //服务器这边就可以调用微信支付的接口进行支付
    //服务器会返回我们一个支付的结果（异步）
    //成功：也需要进行库存量的检测
    //成功：进行库存量的扣减

    protected $beforeActionList = [
        'checkExclusiveScope' => ['only' => 'placeOrder'],
        'checkPrimaryScope' => ['only' => 'getSummaryByUser ,getDetail'],
    ];

    /**
     * 下单
     * @return array
     * @throws \app\lib\exception\ParamMeterException
     * @throws \app\lib\exception\TokenException
     * @throws \think\Exception
     */
    public function placeOrder()
    {
        (new OrderPlace())->goCheck();
        $uid = TokenService::getCurrentUid();
        $products = input('post.products/a');
        $order = new OrderService();
        $status = $order->place($uid,$products);
        return $status;
    }

    /**
     * 获取订单详情
     * @param $id
     * @return OrderModel
     * @throws OrderException
     * @throws \app\lib\exception\ParamMeterException
     * @throws \think\exception\DbException
     */
    public function getDetail($id){
        (new IDMustBePostiveInt())->goCheck();
        $detail = OrderModel::get($id);
//        dump($detail);
        if(!$detail){
            throw new OrderException();
        }
        return $detail->hidden(['prepay_id']);
    }

    /**
     * 分页获取订单列表
     * @param int $page
     * @param int $size
     * @return array
     * @throws \app\lib\exception\ParamMeterException
     * @throws \app\lib\exception\TokenException
     * @throws \think\Exception
     */
    public function getSummaryByUser($page = 1,$size = 15)
    {
        (new PagingParameter())->goCheck();
        $uid = TokenService::getCurrentUid();
        $pagingOrders = OrderModel::getSummaryByUser($page,$size,$uid);
        $data = $pagingOrders->hidden(['snap_items','snap_address','prepay_id'])->toArray();
        if($pagingOrders->isEmpty()){
            return [
                'data' => [],
                'page' => $pagingOrders->currentPage()
            ];
        } else {
            return [
                'data' => $data,
                'page' => $pagingOrders->currentPage()
            ];
        }

    }

    /**
     * cms获取订单列表
     * @param int $page
     * @param int $size
     * @return array
     * @throws \app\lib\exception\ParamMeterException
     */
    public function getSummary($page = 1,$size = 20)
    {
        (new PagingParameter())->goCheck();
        $pagingOrders = OrderModel::getSummary($page,$size);
        $data = $pagingOrders->hidden(['snap_items','snap_address','prepay_id'])->toArray();
        if($pagingOrders->isEmpty()){
            return [
                'data' => [],
                'page' => $pagingOrders->currentPage()
            ];
        } else {
            return [
                'data' => $data,
                'page' => $pagingOrders->currentPage()
            ];
        }

    }
    public function saveFormId()
    {
        (new FormIdGet())->goCheck();
        $uid = TokenService::getCurrentUid();
        $openid = TokenService::getCurrentTokenVar('openid');
        $formData = input('post.');
        $formData['user_id'] = $uid;
        $formData['openid'] = $openid;
        $res = FormOpenUserOrder::saveFormId($formData);
        return [
            'msg'=>'成功',
            'formId' => $res['form_id']
        ];
    }

    /**
     * @return SuccessMessage
     */
    public function sendMessage()
    {
        (new IDMustBePostiveInt())->goCheck();
        $message = new SendMessage();
        $res = $message->send();
        if($res){
            return new SuccessMessage();
        }
    }
}