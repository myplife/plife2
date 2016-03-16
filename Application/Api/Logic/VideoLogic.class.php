<?php
/**
 * Created by PhpStorm.
 * User: IceLight
 * Date: 15/11/20
 * Time: 上午9:02
 */

namespace Api\Logic;


class VideoLogic extends \Think\Model{
    public function __construct(){
        $this->Video = M('Video');
        $this->App = M('App');
        $this->videoModel = M('Video');
    }
    private $Video;
    private $App;
	private $videoOrder = array('creatime', 'viewtimes');

    public function getimgById($id){
        if($id){
            $cond['uuid'] = $id;
            $data = $this->Video->field('cover')->where($cond)->select();
            return $data;
        }else{
            return false;
        }
    }
    /**
     * 分页带获取视频列表
     * 参数：
     * @param array $condition : （可选）搜索条件
     * @param int $page : （可选）分页，默认为1 （不需要额外定义列表的数量）
     * @param int $sort: （可选）排序依据，默认为 1:最新，2: 最热
     * @param int $limit : （可选）每次获取的记录条数，默认系统分配（也不可超过系统分配限制数）
     * @return json : list
     **/
    public function getVideos($condition=array(), $page=1, $sort=1, $limit=0){
        $mycond = array();
        if(is_array($condition) && count($condition)>0){
            $mycond = $condition;
        }
        $mycond['status'] = '1';

        if($limit>0 && $limit<C('MOB_REC_PER_PAGE')){
            $curpage = $page.','.$limit;
        }else{
            $curpage = $page.','.C('MOB_REC_PER_PAGE');
        }
        if (array_key_exists($sort, $this->videoOrder)){
            $order = $this->videoOrder[$sort];}
        else{
            $order = $this->videoOrder[1];
        }
        return $this->videoModel->where($mycond)->page($curpage)->order("$order desc")->select();
    }

    function changePlayCount($id = ''){
        $this->videoModel->where(array('id' => $id))->setInc('viewtimes', 1);
        return $this->videoModel->where(array('id' => $id))->getField('viewtimes');
    }
}
