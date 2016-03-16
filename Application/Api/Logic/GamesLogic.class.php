<?php

/* reated by vim.
 * User: Jason Hu
 * Date: 2016-03-07
 * Time: 18:50
 * */

namespace Api\Logic;


class GamesLogic extends \Think\Model{

	private $gamesModel;
	private $appOrder = array(1=>"creatime", 2=>"downtimes");   // 排序关键词，1:时间，2:热门

	public function __construct(){
		$this->gamesModel = M('app');
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
	public function getGames($condition=array(), $page=1, $sort=1, $limit=0){
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
		if (array_key_exists($sort, $this->appOrder)){
			$order = $this->appOrder[$sort];}
		else{
			$order = $this->appOrder[1];
		}
		$data = $this->gamesModel->where($mycond)->page($curpage)->order("$order desc")->select();
		return $data;
	}

	function changeDownloadCount($id){
		$this->gamesModel->where(array('id' => $id))->setInc('downtimes', 1);	
		return $this->gamesModel->where(array('id' => $id))->getField('downtimes');
	}
}

