<?php
/**
 * Created by PhpStorm.
 * User: jason
 * Date: 2019/1/7
 * Time: 18:00
 */

namespace app\api\service;

use app\api\model\Product as ProductModel;
use app\lib\enum\OrderStatusEnum;
use think\Db;
use think\Exception;
use think\Loader;
use app\api\model\Order as OrderModel;
use app\api\service\Order as OrderService;
use think\Log;

Loader::import('WxPay.WxPay', EXTEND_PATH, '.Api.php');

class WxNotify extends \WxPayNotify
{
    /*<xml>
    <return_code><![CDATA[SUCCESS]]></return_code>
    <return_msg><![CDATA[OK]]></return_msg>
    <appid><![CDATA[wx2421b1c4370ec43b]]></appid>
    <mch_id><![CDATA[10000100]]></mch_id>
    <device_info><![CDATA[1000]]></device_info>
    <nonce_str><![CDATA[TN55wO9Pba5yENl8]]></nonce_str>
    <sign><![CDATA[BDF0099C15FF7BC6B1585FBB110AB635]]></sign>
    <result_code><![CDATA[SUCCESS]]></result_code>
    <openid><![CDATA[oUpF8uN95-Ptaags6E_roPHg7AG0]]></openid>
    <is_subscribe><![CDATA[Y]]></is_subscribe>
    <trade_type><![CDATA[MICROPAY]]></trade_type>
    <bank_type><![CDATA[CCB_DEBIT]]></bank_type>
    <total_fee>1</total_fee>
    <fee_type><![CDATA[CNY]]></fee_type>
    <transaction_id><![CDATA[1008450740201411110005820873]]></transaction_id>
    <out_trade_no><![CDATA[1415757673]]></out_trade_no>
    <attach><![CDATA[订单额外描述]]></attach>
    <time_end><![CDATA[20141111170043]]></time_end>
    <trade_state><![CDATA[SUCCESS]]></trade_state>
    </xml>*/
    public function NotifyProcess($objData, $config, &$msg)
    {
        Db::startTrans();
        if ($objData['result_code'] == 'SUCCESS') {
            try {
                $order = OrderModel::where('id', '=', $objData['out_trade_no'])
                    ->lock(true)
                    ->find();
                $orderID = $order->id;
                if ($order->stock == OrderStatusEnum::UPAID) {
                    $orderService = new OrderService();
                    $stockStatus = $orderService->checkOrderStock($orderID);
                    if ($stockStatus['pass']) {
                        $this->updateOrderStatus($orderID, $stockStatus['pass']);
                        $this->reduceStock($stockStatus);
                    } else {
                        $this->updateOrderStatus($orderID, $stockStatus['pass']);
                    }
                }
                Db::commit();
                return true;
            } catch (Exception $e) {
                Db::rollback();
                Log::error($e);
                return false;
            }
        } else{
            return true;
        }
    }

    private function reduceStock($stockStatus)
    {
        foreach ($stockStatus['pStatusArray'] as $status) {
            ProductModel::where('id', '=', $status['id'])->dec('stock', $status['count']);
        }
    }

    private function updateOrderStatus($orderID, $success)
    {
        $status = $success ? OrderStatusEnum::PAID : OrderStatusEnum::PAID_BUT_OUT_OF;
        OrderModel::where('id', '=', $orderID)->update(['status' => $status]);
    }
}