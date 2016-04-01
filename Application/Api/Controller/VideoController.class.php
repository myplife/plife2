<?php
namespace Api\Controller;
use Think\Controller;

class VideoController extends Controller {

	private $videoLogic;
	private $categoryLogic;
	private $bannerLogic;

	public function __construct(){
		$this->videoLogic = D('Video','Logic');
		$this->categoryLogic = D('Category','Logic');
		$this->bannerLogic = D('Banner','Logic');
	}


	/**
	 * 分页获取全部视频列表（含搜索）
	 * 参数：
	 * @param int pages :（可选）分页，默认为1
	 * @param string keywords: 搜索关键词，如无，则给所有列表（按分页），暂时只可以用一个关键词，后期增加多关键词搜索
	 * @param int videotype :（可选）类型：1:电影（默认）  2:电视剧 0:所有
	 * @param int filtertype :（可选）类型：1:最新（默认）  2:最热
	 * @param string videocategory : (可选) 口味：‘剧情’，‘动作’，...，默认：全部
	 * @param string area : (可选) 国家：‘中国’，‘美国’，...，默认：全部
	 * @param int year : （可选）年份：‘2016’，‘2015’，...，默认：全部
	 * @param int rowcount （可选）每页返回记录数
	 * @param int promotenumber 为推荐时必含参数，推荐视频个数
	 *
	 * @return json : list
	 * */
	public function videos(){
		$params = array();
		if(I('post.videotype','','int') == 1 || I('post.videotype','','int') == 2 ||I('post.videotype','','int') == 0){$type = I('post.videotype','','int');}else{ $type=1; }
		$params['type'] = $type;
		if($params['type'] == 0){
			unset($params['type']);
		}

		//视频搜索
		$search = trim(I('post.keywords'));
		if(!empty($search)){
			$params['name'] =array('like', array("%$search%"),'OR');
			$params['director'] =array('like', array("%$search%"),'OR');
			$params['actors'] =array('like', array("%$search%"),'OR');
		}

		//是否是推荐
		$recommend = trim(I('post.promotenumber'));
		if(!empty($recommend)){
			$params['isrecommend'] = 1;
		}

		//视频最新或者最热查询
		$sort= trim(I('post.filtertype'));
		if(!in_array($sort, array('1', '2'))){
			$sort = '1';
		}

		
		//按照分类筛选
		$category = trim(I('post.videocategory'));
		if(!empty($category)){ 
			$params['category'] = $category; 
		}

		//按照区域筛选
		$area = trim(I('post.area'));
		if(!empty($area)){
			$params['country'] =  $area; 
		}

		//按照年筛选
		$min_five_year = date("Y")-5;
		$year = trim(I('post.year'));
		if(!empty($year)){
			$params['years'] = $year;
		}
		if(!empty($year) && $year <= $min_five_year) {
			$params['years'] = array('elt',$year);
		}

		//按照uuid查询
		$uuid = trim(I('post.id'));
		if(!empty($uuid)){
			$params['uuid'] =  $uuid;
		}

		$page = I('post.pages','','int') ? I('post.pages','','int') : 1;

		$vlist = null;
		$promotenumber = I('post.promotenumber','','int') ? I('post.promotenumber','','int') : 0;
		$rowcount = I('post.rowcount','','int') ? I('post.rowcount','','int') : 0;
		//是否为推荐查询
		if($promotenumber){
			//参数是否包含每页返回记录
			if($rowcount){
				$vlist = $this->videoLogic->getRecomVideos($params,$promotenumber,$page,$rowcount);
			}else{
				$vlist = $this->videoLogic->getRecomVideos($params,$promotenumber,$page);
			}
		}else{
			//规定查询某个时间段的数据
			$params['creatime'] = array('between',array(C('DATE_FORM'),C('DATE_TO')));

			//参数是否包含每页返回记录数
			if($rowcount){
				$vlist = $this->videoLogic->getVideos($params, $page, $sort,$rowcount);
			}else{
				$vlist = $this->videoLogic->getVideos($params, $page, $sort);
			}
		}

		$this->ajaxReturn($vlist);
	}

	function columns(){
		$category = array(
			array('type' => '1', 'name' => '电影', 'icon' => ''),
			array('type' => '2', 'name' => '电视剧', 'icon' => ''),
		);
		$this->ajaxReturn($category);
	}

	function category(){
		$data = $this->categoryLogic->getCategoryList('video');
		$this->ajaxReturn($data);
	}

	function areas(){
		$data = $this->categoryLogic->getCategoryList('area');
		$this->ajaxReturn($data);
	}

	function years(){
		$cur_year = date('Y');
		$years = array();
		for($i=0; $i<5; $i++){
			$years[$cur_year - $i] = $cur_year - $i;
			if($i == 4) $years[$cur_year - $i] = '更早';
		}	
		$this->ajaxReturn($years);
	}

	function movieBanner(){
		$num = I('post.num','','int') ? I('post.num','','int') : 5;
		$banner = $this->bannerLogic->getBanners(array('category' => 'movie'), $num);
		$this->ajaxReturn($banner);
	}

	function dramaBanner(){
		$num = I('post.num','','int') ? I('post.num','','int') : 5;
		$banner = $this->bannerLogic->getBanners(array('category' => 'drama'), $num);
		$this->ajaxReturn($banner);
	}

	function play(){
		$id = I('post.id');	
		$message = array();
		if(empty($id)){
			$message = array('status' => '0', 'message' => 'no parameter id');
		}else{
			$params['mac'] = I('post.mac') ? I('post.mac') : ''; 
			$params['ip'] = I('post.ip') ? I('post.ip') : ''; 
			$params['os'] = I('post.os') ? I('post.os') : ''; 
			$params['os_version'] = I('post.os_version') ? I('post.os_version') : ''; 
			$params['third_id'] = $id; 
			$params['type'] = 'play'; 
			$params['create_date'] = date('Y-m-d H:i:s'); 
			$this->recordsLogic->addRecords($params);
			$play_count = $this->videoLogic->changePlayCount($id);
			$message = array('status' => '1', 'message' => $play_count);
		}
		$this->ajaxReturn($message);
	}


}
