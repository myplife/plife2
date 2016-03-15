<?php
/**
 * Created by PhpStorm.
 * User: IceLight
 * Date: 15/11/20
 * Time: 上午9:02
 */

namespace Api\Logic;


class CategoryLogic extends \Think\Model{
    public function __construct(){
        $this->Category = M('Category');
    }
    private $Category;

    public function getCategoryList($type){
        $data = $this->Category->where(array('type'=>$type))->order('id asc')->select();
        return $data;
    }

}
