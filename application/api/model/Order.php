<?php
/**
 * Created by PhpStorm.
 * User: jason
 * Date: 2019/1/3
 * Time: 13:20
 */

namespace app\api\model;


class Order extends BaseModel
{
    protected $hidden = ['user_id','update_time','delete_time'];
    protected $autoWriteTimestamp = true;
//    protected $createTime = '----';//指定自动写入的字段

    public function getSnapItemsAttr($value)
    {
        if(empty($value)){
            return null;
        }
        return json_decode($value);
    }
    public function getSnapAddressAttr($value)
    {
        if(empty($value)){
            return null;
        }
        return json_decode($value);
    }
    public static function getSummaryByUser($page,$size,$uid)
    {
       return self::where('user_id','=',$uid)
            ->order('create_time desc')
            ->paginate($size,true,['page' => $page]);
    }

    /**
     * cms使用的获取分页订单列表
     * @param $page
     * @param $size
     * @param $uid
     * @return \think\Paginator
     * @throws \think\exception\DbException
     */
    public static function getSummary($page,$size)
    {
       return self::order('create_time desc')
            ->paginate($size,true,['page' => $page]);
    }


}