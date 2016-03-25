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

    /**
     * 视频和app分类接口
     * @param string type : 电视剧电影 video 游戏 games 应用apps 视频分类 video_category
     * @return json : data
     **/
    function getCategoryList( $type= ''){
        if(empty($type)){
            return '';
        }
        $prefix = C('DB_PREFIX');
        $data = $this->Category->field('category.id, category.name')
            ->join(C('DB_PREFIX').'category as category ON category.pid = '.C('DB_PREFIX').'category.id')
            ->where(array($prefix.'category.category'=>$type, 'category.isdel' => array('neq', '1')))->select();
        return $data;
    }

}
