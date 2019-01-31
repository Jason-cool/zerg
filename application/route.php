<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006~2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------

/*
return [
    '__pattern__' => [
        'name' => '\w+',
    ],
    '[hello]'     => [
        ':id'   => ['index/hello', ['method' => 'get'], ['id' => '\d+']],
        ':name' => ['index/hello', ['method' => 'post']],
    ],

];
*/
//Route::rule('路由表达式','路由地址','请求类型','路由参数（数组）','变量规则（数组）');
use think\Route;
// Route::rule('hello','sample/Test/hello','GET',['https'=>false]);
//Route::rule('hello','sample/Test/hello','GET|POST',['https'=>false]);//同时指定两种类型
// Route::post('hello/:id','sample/Test/hello');//id这个参数不用使用?id=''的格式
// 
//Route::get('api/v1/banner/:id','api/v1.Banner/getBanner');
//banner
Route::get('api/:version/banner/:id','api/:version.Banner/getBanner');//控制api版本

//theme
Route::get('api/:version/theme','api/:version.Theme/getSimpleList');
Route::get('api/:version/theme/:id','api/:version.Theme/getComplexOne');

//product
Route::group('api/:version/product',function (){
    Route::get('/by_category','api/:version.Product/getAllInCategory');
    Route::get('/:id','api/:version.Product/getOne',[],['id'=>'\d+']);//设置规则id必须匹配正整数
    Route::get('/recent','api/:version.Product/getRecent');
});
//Route::get('api/:version/product/by_category','api/:version.Product/getAllInCategory');
//Route::get('api/:version/product/:id','api/:version.Product/getOne',[],['id'=>'\d+']);
//Route::get('api/:version/product/recent','api/:version.Product/getRecent');

//category
Route::get('api/:version/category/all','api/:version.Category/getAllCategories');

//token
Route::post('api/:version/token/user','api/:version.Token/getToken');
Route::post('api/:version/token/verify','api/:version.Token/verifyToken');
Route::post('api/:version/token/app','api/:version.Token/getAppToken');

//address
Route::post('api/:version/address','api/:version.Address/createOrUpdateAddress');
Route::get('api/:version/address','api/:version.Address/getUserAddress');

//order
Route::post('api/:version/order','api/:version.Order/placeOrder');
Route::post('api/:version/order/save_form_id','api/:version.Order/saveFormId');
Route::get('api/:version/order/by_user','api/:version.Order/getSummaryByUser');
Route::get('api/:version/order/paginate','api/:version.Order/getSummary');//cms
Route::get('api/:version/order/:id','api/:version.Order/getDetail',[],['id'=>'\d+']);
Route::put('api/:version/order/delivery','api/:version.Order/sendMessage');


Route::post('api/:version/pay/pre_order','api/:version.Pay/getPreOrder');
Route::post('api/:version/pay/notify','api/:version.Pay/receiveNotify');
Route::post('api/:version/pay/re_notify','api/:version.Pay/redirectNotify');



