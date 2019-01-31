<?php
/**
 * Created by PhpStorm.
 * User: jason
 * Date: 2018/12/31
 * Time: 21:21
 */

namespace app\api\validate;


use app\lib\exception\ParamMeterException;

class OrderPlace extends BaseValidate
{
    protected $rule = [
        'products' => 'checkProducts'
    ];
    protected $singleRule = [
        'product_id'  =>'require|isPostiveInteger',
        'count'  =>'require|isPostiveInteger',
    ];

    protected function checkProducts($value)
    {
        if(!is_array($value)){
            throw new ParamMeterException([
                'msg' => '商品参数不正确'
            ]);
        }
        if(empty($value)) {
            throw new ParamMeterException([
                'msg' => '商品列表不能为空'
            ]);
        }

        foreach ($value as $v){
            $this->checkProduct($v);
        }
        return true;
    }

    protected function checkProduct($value)
    {
        $validate = new BaseValidate($this->singleRule);
//        $res = $validate->batch()->check($value);//与课程不一样
        $res = $validate->check($value);//与课程不一样
        if(!$res)
        {
            throw new ParamMeterException([
                'msg' => '商品列表参数错误'
            ]);
        }
    }
}




