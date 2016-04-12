<?php
 /*
 * created by vim.
 * User: Jason Hu
 * Date: 2016-03-07
 * Time: 18:50
 * */

namespace Api\Logic;


class recordsLogic extends \Think\Model{

	private $recordsModel;
	private $Operation;


	public function __construct(){
		$this->recordsModel = M('records');
		$this->Operation = M('operation');
	}

	public function addRecords($condition=array()){
		if(!empty($condition)){
			$this->recordsModel->add($condition);
		}
	}

	/**
	 * 查询用户操作
	 * 参数：
	 * $params 查询条件
	 * 用户操作类型：0.下载app 1.视频播放 2.搜索 3.阅读图书 4.打开广告 5.查询 6.打开游戏 7.打开应用 8.注册登入 9.上网 10.系统消息阅读 99.all null.不限类型
	 */
	public function searchOperation($params = array()){
		$cond = array();
		if(is_array($params) && count($params)>0){
			$cond = $params;
		}

		$data = null;
		if(!isset($cond['operation']) || $cond['operation'] ==  8 || $cond['operation'] == 9 || $cond['operation'] == 2 || $cond['operation'] == 5 || $cond['operation'] == 99 || $cond['operation'] == 10){
			//操作为：所有，默认，搜索，查询，注册登入，上网,阅读系统消息
			//操作表对象：operation
			$data = $this->Operation->field('uid userid,creatime,operation')->where($cond)->order('creatime desc')->select();
			return $data;
		}else{
			if(isset($cond['objid'])){
				$param['opt.objid'] = $cond['objid'];
			}
			$param['opt.uid'] = $cond['uid'];
			$param['opt.operation'] = $cond['operation'];
			$param['opt.creatime'] = array('between',array(C('DATE_FORM'),C('DATE_TO')));

			if($cond['operation'] == 0 || $cond['operation'] == 6 || $cond['operation'] == 7){
				//操作为：下载APP,打开游戏，打开应用
				$param['_string'] = 'app.id = opt.objid';
				//操作表对象：operation,app
				$data = $this->Operation->table('__APP__ app,__OPERATION__ opt')->field('opt.uid userid,opt.operation,opt.creatime,opt.public publiccolumn,app.name objname,app.filepath objurl,app.icon objqurl')
						->where($param)->order('opt.creatime desc')->select();
				return $data;
			}else if($cond['operation'] == 1){
				//操作为：视频播放
				$param['_string'] = 'video.id = opt.objid';
				//操作表对象：operation,video
				$data = $this->Operation->table('__VIDEO__ video,__OPERATION__ opt')->field('opt.uid userid,opt.operation,opt.creatime,opt.public publiccolumn,video.name objname,video.cover objmqurl,video.filepath objurl')
						->where($param)->order('opt.creatime desc')->select();
				return $data;
			}else if($cond['operation'] == 3){
				//操作为：阅读图书
				$param['_string'] = 'book.id = opt.objid';
				//操作表对象：operation,bookparam
				$data = $this->Operation->table('__BOOKPARAM__ book,__OPERATION__ opt')->field('opt.uid userid,opt.operation,opt.creatime,opt.public publiccolumn,book.name objname,book.img objmqurl,book.chapteraddress objurl')
						->where($param)->order('opt.creatime desc')->select();
				return $data;
			}else if($cond['operation'] == 4){
				//操作为：打开广告
				$param['_string'] = 'banner.id = opt.objid';
				//操作表对象：operation,banner
				$data = $this->Operation->table('__BANNER__ banner,__OPERATION__ opt')->field('opt.uid userid,opt.operation,opt.creatime,opt.public publiccolumn,banner.name as objname,banner.img as objmqurl,banner.url as objurl')
						->where($param)->order('opt.creatime desc')->select();
				return $data;
			}
		}
	}


	/**
	 * 关键字查询
	 * @param params array
	 * @return data array
	 */
	public function getKeywords($params){
		$data = null;
		if($params['operation'] == '21' || $params['operation'] == '22'){
			$data = $this->Operation->where('operation='.$params['operation'])->field('public keyword,count(public) num')
					->group('public')->order('num desc')->limit(0,14)->select();
		}else{
			$data = $this->Operation->where('operation=21')->field('public keyword,count(public) num')
					->group('public')->order('num desc')->limit(0,7)->select();
			$data1 = $this->Operation->where('operation=22')->field('public keyword,count(public) num')
					->group('public')->order('num desc')->limit(0,7)->select();
			$data = array_merge($data,$data1);
		}
		return $data;
	}
}

