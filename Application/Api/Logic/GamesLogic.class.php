<?php

/* reated by vim.
 * User: Jason Hu
 * Date: 2016-03-07
 * Time: 18:50
 * */

namespace Api\Logic;


class GamesLogic extends \Think\Model{

	private $gamesModel;
	private $operationModel;
	private $appOrder = array(1=>"creatime", 2=>"downtimes");   // 排序关键词，1:时间，2:热门

	public function __construct(){
		$this->gamesModel = M('app');
		$this->operationModel = M('operation');
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

	/**
	 * 分页带获取推荐游戏列表
	 * 参数：
	 * @param array $condition : （可选）搜索条件
	 * @param int $page : （可选）分页，默认为1 （不需要额外定义列表的数量）
	 * @param int $limit : （可选）每次获取的记录条数，默认系统分配（也不可超过系统分配限制数）
	 * @param int $promotenumber (必含)推荐视频个数
	 * @return json : list
	 **/
	public function getRecomGames($condition=array(),$promotenumber,$page=1,$limit=0){
		$mycond = array();
		if(is_array($condition) && count($condition)>0){
			$mycond = $condition;
		}
		$mycond['status'] = '1';
		$mycond['DATEDIFF(now(),creatime)'] = array('elt',C('TIME_BUCKET')*30);

		if($limit>0 && $limit<C('MOB_REC_PER_PAGE')){
			$curpage = $page.','.$limit;
		}else{
			$limit = C('MOB_REC_PER_PAGE');
			$curpage = $page.','.C('MOB_REC_PER_PAGE');
		}

		if($promotenumber<=$limit){
			//返回数据小于每页数据数量
			return $this->gamesModel->where($mycond)->limit(0,$promotenumber)->order(C('RECOMMEND_DEFAULT_SORT')." desc")->select();
		}else if($promotenumber%$limit  == 0){
			return $this->gamesModel->where($mycond)->page($curpage)->order(C('RECOMMEND_DEFAULT_SORT')." desc")->select();
		}else{
			$nowpage = ceil($promotenumber/$limit);
			if($page == $nowpage){
				return $this->gamesModel->where($mycond)->limit(($page-1)*$limit,$promotenumber%$limit)->order(C('RECOMMEND_DEFAULT_SORT')." desc")->select();
			}else{
				return $this->gamesModel->where($mycond)->page($curpage)->order(C('RECOMMEND_DEFAULT_SORT')." desc")->select();
			}
		}

	}

	/**
	 * 最高人气查询
	 * 参数：
	 * @param page int 页数
	 * @param limit int 每页返回记录数
	 * @param number 返回记录数量
	 * @return mixed
	 */
	function getPopApps($page,$number,$limit=0){
		$mycond['status'] = '1';
		$mycond['apptype'] = '1';

		if($limit>0 && $limit<C('MOB_REC_PER_PAGE')){
			$curpage = $page.','.$limit;
		}else{
			$limit = C('MOB_REC_PER_PAGE');
			$curpage = $page.','.C('MOB_REC_PER_PAGE');
		}

		if($number<$limit){
			return $this->gamesModel->where($mycond)->limit(0,$number)->order('downtimes desc')->select();
		}else if($number%$limit ==  0){
			return $this->gamesModel->where($mycond)->page($curpage)->order('downtimes desc')->select();
		}else{
			$nowpage = ceil($number/$limit);
			if($page == $nowpage){
				return $this->gamesModel->where($mycond)->limit(($page-1)*$limit,$number%$limit)->order('downtimes desc')->select();
			}else{
				 return $this->gamesModel->where($mycond)->page($curpage)->order('downtimes desc')->select();
			}
		}
	}

	/**
	 * 上月精品游戏推荐
	 * 参数：
	 * @param number int (可选)返回记录数量
	 * @param pages int 分页数，默认为1
	 * @param rowcount int (可选) 每页返回记录数
	 */
	function getMonthPopApps($page,$number,$limit=0){
		if($limit>0 && $limit<C('MOB_REC_PER_PAGE')){
			$curpage = $page.','.$limit;
		}else{
			$limit = C('MOB_REC_PER_PAGE');
			$curpage = $page.','.C('MOB_REC_PER_PAGE');
		}

		$cond = array();
		$cond['opt.operation'] = 0;
		$cond['app.status'] = 1;
		$cond['_string'] = 'app.uuid = opt.objid';
		if($number<$limit){
			return $this->gamesModel->table('__OPERATION__ opt,__APP__ app')->field('app.*,count(opt.objid) as num')->where($cond)->group('opt.objid')->order('num desc')->limit(0,$number)->select();
		}else if($number%$limit == 0){
			return $this->gamesModel->table('__OPERATION__ opt,__APP__ app')->field('app.*,count(opt.objid) as num')->where($cond)->group('opt.objid')->order('num desc')->page($curpage)->select();
		}else{
			$nowpage = ceil($number/$limit);
			if($page == $nowpage){
				return $this->gamesModel->table('__OPERATION__ opt,__APP__ app')->field('app.*,count(opt.objid) as num')->where($cond)->group('opt.objid')->order('num desc')->limit(($page-1)*$limit,$number%$limit)->select();
			}else{
				return $this->gamesModel->table('__OPERATION__ opt,__APP__ app')->field('app.*,count(opt.objid) as num')->where($cond)->group('opt.objid')->order('num desc')->page($curpage)->select();

			}
		}
	}

	function changeDownloadCount($id){
		$this->gamesModel->where(array('id' => $id))->setInc('downtimes', 1);	
		return $this->gamesModel->where(array('id' => $id))->getField('downtimes');
	}
}

