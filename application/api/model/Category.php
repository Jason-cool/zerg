<?php
/**
 * Created by PhpStorm.
 * User: jason
 * Date: 2018/12/26
 * Time: 15:29
 */

namespace app\api\model;


class Category extends BaseModel
{
    protected $hidden = [ "delete_time", "description", "update_time"];
    public function img()
    {
        return $this->belongsTo('Image','topic_img_id','id');
    }
}