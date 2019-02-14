<?php
/**
 * Created by PhpStorm.
 * User: jason
 * Date: 2019/2/13
 * Time: 13:44
 */
use think\Env;
return [
    'app_status'  => Env::get("status"),
    'default_return_type'    => 'json', //by hcj  default html，
];