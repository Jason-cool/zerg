<?php
/**
 * Created by PhpStorm.
 * User: jason
 * Date: 2018/12/28
 * Time: 11:57
 */

namespace app\api\model;


class ProductImage extends BaseModel
{
    protected $hidden = ['img_id','delete_time','product_id'];
    public function imgUrl()//imgUrl方法名会根据序列化情况变为json对象的属性名
    {
        return $this->belongsTo('Image','img_id','id');
    }
}