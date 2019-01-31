<?php
/**
 * Created by PhpStorm.
 * User: jason
 * Date: 2018/12/18
 * Time: 15:51
 */

namespace app\api\model;


use think\Db;
use Think\Exception;
use think\Model;

class Banner extends BaseModel
{
//    protected $table = '';//指定表名

    protected $hidden = ['delete_time','update_time'];
    public function items()
    {
        return $this->hasMany('BannerItem', 'banner_id', 'id');
    }

    public static function getBannerByID($id)
    {
        /*  //TODO:根据Banner ID号 获取Banner信息
          try{
              1 / 0;
          }catch (Exception $ex){
              //TODO:可以记录日志
              throw $ex;
          }
          return 'this is banner info';*/
        //return null;
//       $res = Db::query('select * from banner_item where banner_id = ?',[$id]);//原生sql语句
//        $res = Db::query('select * from banner left join banner_item on banner.id = banner_item.banner_id where banner_id = ?',[$id]);//错误的写法
        /*
        $res = Db::table('banner_item')
            ->where('banner_id','=',$id)//where('字段名','表达式','条件') 有三种写法 闭包法，表达式法，数组法
            ->select();
        */

//        $res = Db::table('banner_item')
//            ->where(function ($query) use ($id) {
//                $query->where('banner_id', '=', $id);
//            })
//            ->select();
        $res = self::with(['items.img'])->find($id);//ORM 对象关系映射
        return $res;
    }
}