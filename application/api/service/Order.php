<?php
/**
 * Created by PhpStorm.
 * User: jason
 * Date: 2019/1/2
 * Time: 13:48
 */

namespace app\api\service;


use app\api\model\OrderProduct;
use app\api\model\Product;
use app\api\model\FormOpenUserOrder as FormModel;
use app\api\model\UserAddress;
use app\lib\exception\OrderException;
use think\Db;
use think\Exception;

class Order
{
    protected $oProducts;
    protected $products;
    protected $uid;

    public function place($uid, $oProducts)
    {
        $this->uid = $uid;
        //客户端传过来的商品信息
        $this->oProducts = $oProducts;
        //获取数据库的商品信息（作比较用的）
        $this->products = $this->getProductsByOrder($oProducts);
        //商品库存检查
        $status = $this->getOrderStatus();
        if(!$status['pass']) {//ps
            $status['order_id'] = -1;
            return $status;
        }
        //开始下单
        $orderSnap = $this->snapOrder($status);//生成快照
        $order = $this->createOrder($orderSnap);//创建订单
        $order['pass'] = true;
        return $order;
    }

    private function createOrder($snap)
    {
        Db::startTrans();
        try{
            $orderNo = self::makeOrderNum();
            $order = new \app\api\model\Order();
            $order->order_no = $orderNo;
            $order->user_id = $this->uid;
            $order->total_price = $snap['orderPrice'];
            $order->snap_img = $snap['snapImg'];
            $order->snap_name = $snap['snapName'];
            $order->total_count = $snap['totalCount'];
            $order->snap_items = json_encode($snap['pStatus']);
            $order->snap_address = $snap['snapAddress'];
            $order->save();
            $orderID = $order->id;
            $create_time = $order->create_time;
            foreach ($this->oProducts as &$p){
                $p['order_id'] = $orderID;
            }
            $orderProduct = new OrderProduct();
            $orderProduct->saveAll($this->oProducts);
            Db::commit();
            return [
                'order_no' => $orderNo,
                'order_id' => $orderID,
                'create_time' => $create_time
            ];
        } catch (Exception $e){
            Db::rollback();
            throw $e;
        }
    }

    public static function makeOrderNum()
    {
        $yCode = array('A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J');
        $orderSn = $yCode[intval(date('Y') - 2018)] .
            strtoupper(dechex(date('m'))) . date('d') .
            substr(time(), -5) . substr(microtime(), 2, 5) .
            sprintf('%02d', rand(0, 99));
        return $orderSn;
    }

    //生成订单快照
    private function snapOrder($status)
    {
        $snap = [
            'orderPrice' => 0,
            'totalCount' => 0,
            'pStatus'=> [],
            'snapAddress' => null,
            'snapName' => '',
            'snapImg' => ''
        ];
        $snap['orderPrice'] = $status['orderPrice'];
        $snap['totalCount'] = $status['totalCount'];
        $snap['pStatus'] = $status['pStatusArray'];
        $snap['snapAddress'] = json_encode($this->getUserAddress());
        $snap['snapName'] = $this->products[0]['name'];
        $snap['snapImg'] = $this->products[0]['main_img_url'];
        if(count($this->products)>1){
            $snap['snapName'] .= '等';
        }
        return $snap;
    }

    private function getUserAddress()
    {
        $userAddress = UserAddress::where('user_id','=',$this->uid)->find()->toArray();
        if(!$userAddress){
            throw new OrderException([
                'msg' => '找不到收货地址，创建订单失败',
                'errorCode' => 60001
            ]);
        }
        return $userAddress;
    }

    //支付时的订单检测

    public function checkOrderStock($orderID)
    {
        $this->oProducts = OrderProduct::where('order_id','=',$orderID)->select()->toArray();//自行加了toArray()
        $this->products = $this->getProductsByOrder($this->oProducts);
        $status = $this->getOrderStatus();
        return $status;
    }

    private function  getOrderStatus()
    {
        $status = [
            'pass' => true,
            'orderPrice' => 0,
            'totalCount' => 0,
            'pStatusArray' => []
        ];
        foreach ($this->oProducts as $oProduct) {
            $pStatus = $this->getProductStatus($oProduct['product_id'], $oProduct['count'], $this->products);
            if (!$pStatus['haveStock']) {
                $status['pass'] = false;
            }
            $status['orderPrice'] += $pStatus['totalPrice'];
            $status['totalCount'] += $pStatus['counts'];
            array_push($status['pStatusArray'], $pStatus);
        }
        return $status;
    }

    private function getProductStatus($oPID, $oCount, $products)
    {
        $pIndex = -1;
        $pStatus = [
            'id' => null,
            'haveStock' => false,
            'counts' => 0,
            'main_img_url'=> '',
            'price'=> 0,
            'name' => '',
            'totalPrice' => 0
        ];
        for ($i = 0; $i < count($products);$i++) {
            if ($oPID == $products[$i]['id']) {
                $pIndex = $i;
            }
        }
        if ($pIndex == -1) {
            throw new OrderException([
                'msg' => 'ID为' . $oPID . '的商品不存在，创建订单失败'
            ]);
        } else {
            $pStatus['id'] = $products[$pIndex]['id'];
            $pStatus['name'] = $products[$pIndex]['name'];
            $pStatus['main_img_url'] = $products[$pIndex]['main_img_url'];
            $pStatus['price'] = $products[$pIndex]['price'];
            $pStatus['counts'] = $oCount;
            $pStatus['totalPrice'] = $products[$pIndex]['price'] * $oCount;//订单中一类商品的价格
            if ($products[$pIndex]['stock'] - $oCount >= 0) {
                $pStatus['haveStock'] = true;
            }
        }
        return $pStatus;
    }

    private function getProductsByOrder($oProducts)
    {
        $oPIDs = [];
        foreach ($oProducts as $item) {
            array_push($oPIDs, $item['product_id']);
        }
        return Product::all($oPIDs)->visible(['id', 'price', 'stock', 'main_img_url','name'])->toArray();
    }
}