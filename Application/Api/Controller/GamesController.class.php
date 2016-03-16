<?php
namespace Api\Controller;
use CommLib\Hmplay as HmplayClass;
use Think\Controller;

class GamesController extends Controller {

	private $gamesLogic;
	private $categoryLogic;
	private $bannerLogic;

	public function __construct(){
		$this->gamesLogic = D('app','Logic');
		$this->categoryLogic = D('Category','Logic');
		$this->bannerLogic = D('Banner','Logic');
	}


	/**
	 * 分页获取全部游戏列表（含搜索）
	 * 参数：
	 * @param int page :（可选）分页，默认为1
	 * @param string search: 搜索关键词，如无，则给所有列表（按分页），暂时只可以用一个关键词，后期增加多关键词搜索
	 * @param int type :（可选）类型：1:游戏（默认）  2:应用
	 * @param int sort :（可选）类型：1:最新（默认）  2:最热
	 * @param string category : (可选) 分类：‘益智休闲’，‘动作冒险’..，默认：全部
	 *
	 * @return json : list
	 * */
	public function games(){
		$params = array();
		if(I('post.type','int') == 1 || I('post.type','','int') == 2){$type = I('post.type','','int');}else{ $type=1; }
		$params['type'] = $type;

		//游戏搜索
		$search = trim(I('post.search'));
		if(!empty($search)){
			$params['name'] =array('like', array("%$search%"),'OR');
		}

		//是否是推荐
		$recommend = trim(I('post.recommend'));
		if(!empty($recommend)){
			$params['isrecommend'] = 1;
		}
		

		//游戏最新或者最热查询
		$sort= trim(I('post.sort'));
		if(!in_array($sort, array('1', '2'))){
			$sort = '1';
		}

		//按照分类筛选
		$category = trim(I('post.category'));
		if(!empty($category)){ 
			$params['category'] = $category; 
		}

		//按照id查询
		$id = trim(I('post.id'));
		if(!empty($uuid)){
			$params['id'] =  $id;
		}

		$page = I('post.page','','int') ? I('post.page','','int') : 1;
		$games = $this->gamesLogic->getGames($params, $page, $sort);
		$this->ajaxReturn($games);
	}

	function category(){
		$data = $this->categoryLogic->getCategoryList('');
		$this->ajaxReturn($data);
	}

	function banner(){
		$num = I('post.num','','int') ? I('post.num','','int') : 5;
		$banner = $this->bannerLogic->getBanners('games', $num);
		$this->ajaxReturn($banner);
	}

	function download(){
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
			$params['type'] = 'download'; 
			$params['create_date'] = date('Y-m-d H:i:s'); 
			$this->recordsLogic->addRecords($params);
			$download_count = $this->gamesLogic->changeDownloadCount($id);
			$message = array('status' => '1', 'message' => $download_count);
		}
		$this->ajaxReturn($message);
	}

	function igames(){
		$hm_config = C('HM_PLAY');	
		$hmplay = new HmplayClass($hm_config['url'], $hm_config['caller'], $hm_config['signKey']);

		$date_from = '20150310092546'; //date('YmdHis');
		$date_to = '20160310092546'; //date('YmdHis');

		$params['sequence'] = 1457539200;
		$params['client'] = array('caller' => $hm_config['caller'], 'ex' => null);
		$params['data'] = array('sync_type' => 1, 'sync_entity' => 'game', 'date_from' => $date_from, 
					'date_to' => $date_to, 'page_size' => 5, 'page_num' => 1);
		$params['sign'] = $hmplay->sign($params['data']);
		$params['encrypt'] = $hm_config['encrypt'];
		$json = json_decode($hmplay->http_request(json_encode($params)));
		if(isset($json->state->code) && $json->state->code == '200'){
			$data = json_decode(base64_decode($json->data));
			$games = $data->list;
			foreach($games as $key => $value){
				$this->syncGames($value);
			}
		}
	}
	
	function syncGames($games = array()){
		if(empty($games)){ exit('No games to sysnc!');}	
		$gamesModel = M('games');
		$imagesModel = M('game_image');
		$fileModel = M('game_file');
		try{
			$gamesModel->startTrans();

			$game['game_id'] = $games->game_id;
			$game['cp_name'] = $games->cp_name;
			$game['game_name'] = $games->game_name;
			$game['game_tag'] = $games->game_tag;
			$game['game_class'] = $games->game_class;
			$game['create_time'] = $games->create_time;
			$game['modify_time'] = $games->modify_time;
			$game['online_status'] = $games->online_status;
			$game['channel_id'] = $games->channel_id;
			$game['introduction'] = $games->introduction;

			if($games->game_images){
				$this->syncGameImages($imagesModel, $games->game_images);
			}
			if($games->game_file){
				$this->syncGameFile($fileModel, $games->game_file);
			}

			$game_rs = $gamesModel->add($game);
			if(!$game_rs){
				throw new \Exception('save game failed!');
			}
			$gamesModel->commit();
		}catch(\Exception $e){
			$gamesModel->rollback();
			exit($e->getMessage());	
		
		}
	}

	function syncGameImages($imagesModel, $images = array()){
		$data = array();
		foreach($images as $key => $image){
			$data[$key]['image_id'] = $image->image_id;
			$data[$key]['game_id'] = $image->game_id;
			$data[$key]['image_type'] = $image->image_type;
			$data[$key]['image_index'] = $image->image_index;
			$data[$key]['image_size'] = $image->image_size;
			$data[$key]['image_height'] = $image->image_height;
			$data[$key]['image_width'] = $image->image_width;
			$data[$key]['image_url'] = $image->image_url;
		}
		$image_rs = $imagesModel->addAll($data);
		if(!$image_rs){
			throw new \Exception('save images failed!');
		}
	}

	function syncGameFile($fileModel, $file = array()){
		$data['file_id'] = $file->file_id;
		$data['file_url'] = $file->file_url;
		$data['game_id'] = $file->game_id;
		$data['file_size'] = $file->file_size;
		$data['channel_id'] = $file->channel_id;
		$data['package_name'] = $file->package_name;
		$data['version_name'] = $file->version_name;
		$data['version_code'] = $file->version_code;
		$data['update_time'] = $file->update_time;
		$file_rs = $fileModel->add($data);
		if(!$file_rs){
			throw new \Exception('save file failed!');
		}
	}



}
