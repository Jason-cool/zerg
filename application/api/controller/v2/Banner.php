<?php
/**
 * Created by PhpStorm.
 * User: jason
 * Date: 2018/12/17
 * Time: 14:19
 */

namespace app\api\controller\v2;

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
        return 'this is v2 version';
    }
}