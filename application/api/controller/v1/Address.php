<?php
/**
 * Created by PhpStorm.
 * User: jason
 * Date: 2018/12/28
 * Time: 15:12
 */

namespace app\api\controller\v1;

use app\api\controller\BaseController;
use app\api\model\User as UserModel;
use app\api\model\UserAddress;
use app\api\service\Token as TokenService;
use app\api\validate\AddressNew;
use app\lib\enum\ScopeEnum;
use app\lib\exception\ForbiddenException;
use app\lib\exception\SuccessMessage;
use app\lib\exception\TokenException;
use app\lib\exception\UserException;
use think\Controller;

class Address extends BaseController
{
    protected $beforeActionList = [
        'checkPrimaryScope' => ['only' => 'createOrUpdateAddress,getUserAddress'],
    ];

    /**
     * 与讲课视频的源代码有差异
     * @throws ForbiddenException
     * @throws TokenException
     * @throws \think\Exception
     */
//    protected function checkPrimaryScope()
//    {
//        $scope = TokenService::getCurrentTokenVar('scope');
//        if(!$scope) {
//            throw new TokenException();
//        } else {
//            if($scope < ScopeEnum::User) {
//                throw new ForbiddenException();
//            }
//        }
//    }
    //进一步封装  再下一步封装就是放进基类 =>继承 BaseController
//    protected function checkPrimaryScope()
//    {
//        TokenService::needPrimaryScope();
//    }

    /**
     * 添加或者修改收货地址 课程10-5可以看原码
     * url：z.cn/api/v1/address
     * @return \think\response\Json
     * @throws UserException
     * @throws \app\lib\exception\ParamMeterException
     * @throws \think\exception\DbException
     */
    public function createOrUpdateAddress()
    {
        $validate = new AddressNew();
        $validate->goCheck();
        $uid = TokenService::getCurrentUid(); //根据token获取uid
        $user = UserModel::get($uid);//根据uid查询user表判断是否存在该记录借此判断uid是否合法
        if (!$user) {
            throw new UserException();
        } else {
            $arraydata = $validate->getDataByRule(input('post.'));
            $userAddress = $user->address;//根据user模型关联查找user_address表是否存在对应的记录 一边插入新数据或者跟新旧数据
            if (!$userAddress) {
                $user->address()->save($arraydata);
            } else {
                $user->address->save($arraydata);
            }
        }
        return json(new SuccessMessage(), 201);
    }

    public function getUserAddress(){
        $uid = TokenService::getCurrentUid();
        $addressInfo = UserAddress::where('user_id','=',$uid)->find();
        if(!$addressInfo){
            throw new UserException([
                'msg' =>'找不到对应uid的地址',
                'errorCode' =>60001
            ]);
        }
        return $addressInfo;
    }
}