<?php

namespace app\api\controller\v1;

use app\api\model\Theme as ThemeModel;
use app\api\validate\IDMustBePostiveInt;
use app\api\validate\IDsCollection;
use app\lib\exception\ThemeException;
use think\Controller;

class Theme extends Controller
{

    /**
     * 主题列表
     * @url api/v1/theme/?ids=1,2,3
     * 添加注释快捷键 是 /** + 回车
     */

    public function getSimpleList($ids = '')
    {
        (new IDsCollection())->goCheck();
        $ids = explode(',', $ids);
        $results = ThemeModel::with(['topicImg', 'headImg'])->select($ids);
        if ($results->isEmpty()) {
            throw new ThemeException();
        }
        return $results;
    }

    /**
     *获取属于同一主题的所有商品
     * @url api/v1/theme/:id
     */
    public function getComplexOne($id)
    {
        (new IDMustBePostiveInt())->goCheck();
//        return 'success';
        $theme = ThemeModel::getThemeWIthProducts($id);
//        $theme = (new ThemeModel())->getThemeWIthProducts($id);
        if (!$theme) {
            throw new ThemeException();
        }
        return $theme;
    }
}
