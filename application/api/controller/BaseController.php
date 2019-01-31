<?php
/**
 * Created by PhpStorm.
 * User: jason
 * Date: 2018/12/31
 * Time: 13:15
 */

namespace app\api\controller;


use think\Controller;
use app\api\service\Token as TokenService;

class BaseController extends Controller
{
    protected function checkPrimaryScope()
    {
        TokenService::needPrimaryScope();
    }

    protected function checkExclusiveScope()
    {
        TokenService::needExclusiveScope();
    }
}