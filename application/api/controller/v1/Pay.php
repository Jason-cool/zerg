<?php
/**
 * Created by PhpStorm.
 * User: jason
 * Date: 2019/1/4
 * Time: 13:31
 */

namespace app\api\controller\v1;


use app\api\controller\BaseController;
use app\api\service\WxNotify;
use app\api\validate\IDMustBePostiveInt;
use app\api\service\Pay as PayService;
use think\Loader;
Loader::import('WxPay.WxPay', EXTEND_PATH, '.Api.php');
class Pay extends BaseController
{
    protected $beforeActionList = [
        'checkExclusiveScope' => ['only' => 'getPreOrder']
    ];
    public function getPreOrder($id='')
    {
        (new IDMustBePostiveInt())->goCheck();
        $pay = new PayService($id);
        return $pay->pay();
    }

    public function receiveNotify()
    {
        $config = new \WxPayConfig();
        $notify = new WxNotify();
        $notify->Handle($config);
    }
}