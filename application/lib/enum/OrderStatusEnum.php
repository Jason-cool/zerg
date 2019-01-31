<?php
/**
 * Created by PhpStorm.
 * User: jason
 * Date: 2019/1/4
 * Time: 16:03
 */

namespace app\lib\enum;


class OrderStatusEnum
{
    const UPAID = 1;//待支付
    const PAID = 2;//已支付
    const DELIVERED = 3;//待发货
    const PAID_BUT_OUT_OF = 4;//已支付但库存不足
}