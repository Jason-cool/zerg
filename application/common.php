<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 流年 <liu21st@gmail.com>
// +----------------------------------------------------------------------

// 应用公共文件

/**
 * @param $url
 * @param int $httpCode
 * @return mixed
 */
function curl_get($url, &$httpCode = 0)
{
    $curl = curl_init(); //初始化
    curl_setopt($curl, CURLOPT_URL, $url); //设置抓取的url
//    curl_setopt($curl, CURLOPT_HEADER, 0); //设置为0不返回请求头信息
    curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1); //设置获取的信息以文件流的形式返回，而不是直接输出。
    curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, FALSE); // 跳过https请求 不验证证书和hosts
//    curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, FALSE);

    curl_setopt($curl, CURLOPT_CONNECTTIMEOUT, 10);
    $httpCode = curl_getinfo($curl, CURLINFO_HTTP_CODE);

    $data = curl_exec($curl); //执行命令
    curl_close($curl); //关闭URL请求
    return $data; //返回获得的数据
}

function getRandChar($length)
{
    $str = null;
    $strPol = 'asdfashjfkdhfjkdfhkadfhnahklfnafnaslkf0123457896AJHDFBASJHFBDSFHASGDAHDKJAS';
    $max = strlen($strPol) - 1;
    for ($i = 0; $i < $length; $i++) {
        $str .= $strPol[rand(0, $max)];
    }
    return $str;
}

function https_curl_json($url,$data,$type){
    if($type=='json'){//json $_POST=json_decode(file_get_contents('php://input'), TRUE);
        $headers = array("Content-type: application/json;charset=UTF-8","Accept: application/json","Cache-Control: no-cache", "Pragma: no-cache");
        $data=json_encode($data);
    }
    $curl = curl_init();
    curl_setopt($curl, CURLOPT_URL, $url);
    curl_setopt($curl, CURLOPT_POST, 1); // 发送一个常规的Post请求
    curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, FALSE);
    curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, FALSE);
    if (!empty($data)){
        curl_setopt($curl, CURLOPT_POST, 1);
        curl_setopt($curl, CURLOPT_POSTFIELDS,$data);
    }
    curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
    curl_setopt($curl, CURLOPT_HTTPHEADER, $headers );
    $output = curl_exec($curl);
    if (curl_errno($curl)) {
        echo 'Errno'.curl_error($curl);//捕抓异常
    }
    curl_close($curl);
    return $output;
}