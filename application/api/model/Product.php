<?php
/**
 * Created by PhpStorm.
 * User: jason
 * Date: 2018/12/25
 * Time: 12:04
 */

namespace app\api\model;


class Product extends BaseModel
{
    protected $hidden = ['delete_time', 'create_time', 'update_time', 'pivot', 'from', 'category_id'];

    //字段下划线去掉了
    public function getMainImgUrlAttr($value, $data)
    {
        return $this->prefixImgUrl($value, $data);
    }

    public function properties()
    {
        return $this->hasMany('ProductProperty', 'product_id', 'id');
    }

    public function imgs()
    {
        return $this->hasMany('ProductImage', 'product_id', 'id');
    }

    public static function getMostRecent($count)
    {
        return self::order('create_time desc')->limit($count)->select();
    }

    public static function getProductsByCategoryID($id)
    {
        return self::where('category_id', '=', $id)->select();
    }

    public static function getProductDetail($id)
    {
//        return self::with(['properties', 'imgs.imgUrl'])->find($id);
        return self::with([
            'imgs' => function ($query) {
                $query->with(['imgUrl'])
                    ->order('order', 'asc');
            }
        ])
            ->with(['properties'])
            ->find($id);
    }
}


