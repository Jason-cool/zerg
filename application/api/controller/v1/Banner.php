<?php
/**
 * Created by PhpStorm.
 * User: jason
 * Date: 2018/12/17
 * Time: 14:19
 */

namespace app\api\controller\v1;
use app\api\validate\IDMustBePostiveInt;
use app\api\model\Banner as BannerModel;
use app\lib\exception\BannerMissException;
use think\Exception;

class Banner
{
	/**
	 * 获取指定id的banner信息
	 * @url /banner/:id
	 * @http Get
	 * @id banner的id号
	 */
    public function getBanner($id)
    {
        //开闭原则：扩展是开放的，对修改是封闭的
        /*
        //自动验证
       $data = [
            'name' => 'vord111111er',
            'email' => '123qq.com'
        ];
    	$validate = new Validate([
    	    'name' =>'require|max:10',
    	    'email' =>'email'
        ]);
        $validate = new TestValidate();

        $data = [
            'id' => $id
        ];
        $validate = new IDMustBePostiveInt();
    	$res = $validate->batch()->check($data);//batch()用于批量验证
    	// 获取错误
    	dump($validate->getError());
        */
       /* 
       //验证器
       (new IDMustBePostiveInt())->goCheck();
        try{
            $banner = BannerModel::getBannerByID($id);
        }catch (Exception $ex){
            $err = [
                'error_code' =>10001,
                'msg'        => $ex->getMessage()
            ];
            return json($err,400);
        }
        return $banner;*/
       //AOP 面向切面编程
        (new IDMustBePostiveInt())->goCheck();
        $banner = BannerModel::getBannerByID($id);
//        $banner = BannerModel::with(['items','items.img'])->find($id);//ORM 对象关系映射
//        $banner->hidden(['update_time','delete_time']);//隐藏指定字段
//        $banner->visible(['id']);//显示指定字段
        if(!$banner){
            throw new BannerMissException();
        }
//        $c = config('setting.img_prfix');
        return json($banner);
    }
}