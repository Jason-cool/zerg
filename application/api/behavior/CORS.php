<?php
/**
 * Created by PhpStorm.
 * User: jason
 * Date: 2019/1/29
 * Time: 0:44
 */

namespace app\api\behavior;
class CORS
{
    //只有一个行为使用run即可多个就要分别定义
    public function run(&$params)
    {
        header('Access-Control-Allow-Origin: *');
        header("Access-Control-Allow-Headers: token,Origin, X-Requested-With, Content-Type, Accept");
        header('Access-Control-Allow-Methods: GET,POST.PUT');
        if(Request()->isOptions()){
            exit();
//            return;
        }
    }
}