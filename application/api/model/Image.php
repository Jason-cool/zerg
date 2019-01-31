<?php

namespace app\api\model;

use think\Model;

class Image extends BaseModel
{
    protected $hidden = ['id','delete_time','update_time','from'];
    //获取器
    public function getUrlAttr($value,$data)
    {
       return $this->prefixImgUrl($value,$data);
    }
}
