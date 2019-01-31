<?php
/**
 * Created by PhpStorm.
 * User: jason
 * Date: 2018/12/25
 * Time: 14:29
 */

namespace app\api\validate;


class IDsCollection extends BaseValidate
{
    protected $rule = [
        'ids' =>'require|CheckIDs'
    ];
    protected $message =[
        'ids' => '参数必须是以逗号分隔的正整数'
    ];
    public function CheckIDs($value)
    {
        $values = explode(',',$value);
        if(empty($values)){
//      if(!explode(',',$value)){//我的写法
            return false;
        } else {
            foreach ($values as $id){
                if(!$this->isPostiveInteger($id)){
                    return false;
                }
            }
            return true;
        }
    }
}