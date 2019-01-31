<?php
/**
 * Created by PhpStorm.
 * User: jason
 * Date: 2018/12/26
 * Time: 15:27
 */

namespace app\api\controller\v1;

use app\api\model\Category as CategoryModel;
use app\lib\exception\CategoryException;

class Category
{

    /**
     * 获取所有分类
     * @url z.cn/api/v1/category/all
     * @return CategoryModel[]|false
     * @throws CategoryException
     * @throws \think\exception\DbException
     */
    public function getAllCategories()
    {
        $categories = CategoryModel::all([],'img');
        if($categories->isEmpty()){
            throw new CategoryException();
        }
        return $categories;
    }
}