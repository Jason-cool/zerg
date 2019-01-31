<?php
/**
 * Created by PhpStorm.
 * User: jason
 * Date: 2018/12/25
 * Time: 12:04
 */

namespace app\api\model;


class Theme extends BaseModel
{
    protected $hidden = ['topic_img_id','delete_time','head_img_id','update_time'];
    public function topicImg()
    {
        return $this->belongsTo('Image','topic_img_id','id');
    }
    public function headImg()
    {
        return $this->belongsTo('Image','head_img_id','id');
    }
    public function products()
    {
        return $this->belongsToMany('Product','theme_product','product_id','theme_id');
    }
    public static function getThemeWithProducts($id)
    {
        return self::with('topicImg,headImg,products')->find($id);
    }
}