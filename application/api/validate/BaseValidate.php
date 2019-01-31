<?php
/**
 * Created by PhpStorm.
 * User: jason
 * Date: 2018/12/17
 * Time: 18:14
 */

namespace app\api\validate;


use app\lib\exception\ParamMeterException;
use think\Request;
use think\Exception;
use think\Validate;

class BaseValidate extends Validate
{
    public function goCheck()
    {
        //获取http参数，对这些参数作检验
        $param = Request::instance()->param();
        $result = $this->batch()->check($param);
        if (!$result) {
//            $error = $this->error;
//            throw new Exception($error);
//            $e = new ParamMeterException();
//            $e->msg = $this->error;
            $e = new ParamMeterException([
                'msg' => $this->error //哪个实例化就是谁例如 IDM...
            ]);
            throw $e;
        } else {
            return true;
        }
    }

    protected function isPostiveInteger($value, $rule = '', $data = '', $field = '')
    {
        if (is_numeric($value) && is_int($value + 0) && ($value + 0) > 0) {
            return true;
        } else {
//            return $field.'参数必须是正整数！';
            return false;
        }
    }

    protected function isNotEmpty($value, $rule = '', $data = '', $field = '')
    {
        if (empty($value)) {
            return false;
        } else {
            return true;
        }
    }

    protected function isMobile($value)
    {
        $mobilePhoneRule = "^1(3|4|5|7|8)[0-9]\d{8}$^";
        $homePhoneRule = "/^(\d{3}-)(\d{8})$|^(\d{4}-)(\d{7})$|^(\d{4}-)(\d{8})$/";

        $mobileRes = preg_match($mobilePhoneRule, $value);
        $homeRes = preg_match($homePhoneRule, $value);
        if (!$mobileRes &&  !$homeRes) {
            return false;
        } else {
            return true;
        }
    }

    public function getDataByRule($arrays)
    {
        if (array_key_exists('uid', $arrays) || array_key_exists('user_id', $arrays)) {
            throw new ParamMeterException([
                'msg' => '存在uid或者User_id不合法参数'
            ]);
        }
        $newArray = [];
        foreach ($this->rule as $key => $value) {
            $newArray[$key] = $arrays[$key];
        }
        return $newArray;
    }
}