<?php
/**
 * Created by PhpStorm.
 * User: jason
 * Date: 2018/12/26
 * Time: 13:05
 */

namespace app\api\controller\v1;


use app\api\validate\Count;
use app\api\model\Product as ProductModel;
use app\api\validate\IDMustBePostiveInt;
use app\lib\exception\ProductException;

class Product
{
    /**
     * 获取最近新商品
     * @url z.cn/api/v1/product/recent/?count=4
     * @param $count
     * @return false|\PDOStatement|string|\think\Collection
     * @throws ProductException
     * @throws \app\lib\exception\ParamMeterException
     */
    public function getRecent($count = 15)
    {
        (new Count())->goCheck();
        $products = ProductModel::getMostRecent($count);
        if ($products->isEmpty()) {
            throw new ProductException();
        }

//        $collection = collection($products);//因为是使用的select()所以返回二位数组所以转为数据集对象调用tp5内置方法
//        $products = $collection->hidden(['summary']);//动态隐藏summary字段
        // 数据集返回类型 修改为collection 也行
        // 'resultset_type'  => 'array',
        $products = $products->hidden(['summary']);
        return $products;
    }

    /**
     * 获取单一分类下的所有商品
     * @url z.cn/api/v1/product/by_category/?id=3
     * @param $id
     * @return false|\PDOStatement|string|\think\Collection
     * @throws ProductException
     * @throws \app\lib\exception\ParamMeterException
     */
    public function getAllInCategory($id)
    {
        (new IDMustBePostiveInt())->goCheck();
        $products = ProductModel::getProductsByCategoryID($id);
        if ($products->isEmpty()) {
            throw new ProductException();
        }
        $products = $products->hidden(['summary']);
        return $products;
    }

    public function getOne($id)
    {
        (new IDMustBePostiveInt())->goCheck();
        $product = ProductModel::getProductDetail($id);
        if (!$product) {
            throw new ProductException();
        }
        return $product;
    }
}