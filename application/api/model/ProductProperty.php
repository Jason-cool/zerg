<?php
/**
 * Created by PhpStorm.
 * User: jason
 * Date: 2018/12/28
 * Time: 11:58
 */

namespace app\api\model;


class ProductProperty extends BaseModel
{
    protected $hidden = ['id','delete_time','product_id'];
}