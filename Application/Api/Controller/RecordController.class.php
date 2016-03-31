<?php
namespace Api\Controller;
use Think\Controller;
class RecordController extends Controller {
    public function __construct(){
        $this->Res = D('Resource','Logic');
        $this->Video=  M('Video');
        $this->App=  M('App');
        $this->Operation= M('Operation');
		$this->Records = D('Records','Logic');
    }
    private $Res;
    private $App;
    private $Video;
    private $Operation;
	private $Records;
    /**
     * 下载计数统计接口
     * 参数：
     * @param int id : （必填）应用id
     */
    public function download(){
        $id = I('post.id','','int');
        if($id) {
            $data = $this->Res->getAppById($id);
            $arr['downtimes'] = $data['downtimes']+1;
            $this->App->where('id='.$id)->save($arr);
        }
        echo  $arr['downtimes']?$arr['downtimes']:0;
    }

    /**
     * 播放计数统计接口
     * 参数：
     * @param int id : （必填）视频id
     */
    public function play(){
        $id = I('post.id','','int');
        if($id) {
            $data = $this->Res->getVideoById($id);
            $arr['viewtimes'] = $data['viewtimes']+1;
            $this->Video->where('id='.$id)->save($arr);
        }
        echo  $arr['viewtimes']?$arr['viewtimes']:0;
    }

    /**
     * 保存用户操作记录
     * 参数：
     * @param string uid : 用户ID
     * @param string operation : 用户操作
     * @param string objid : （可选）操作对象ID
     * @param stirng subobjid : （可选）剧集，章节
     * @param Time videotime : (可选) 视频播放时间
     * '应用类型：0.下载app 1.视频播放 2.搜索 3.阅读图书 4.打开广告 5.查询 6.打开游戏 7.打开应用'
     */
    public function OperationRecord(){
		$params = array();

	    //获取用户ID
	    $uid = trim(I('post.userid'));
	    if(!empty($uid)){
			$params['uid'] = $uid;
	    }

	    //操作类型
	    $operation  = trim(I('post.operation'));
	    if(!empty($operation)){
		    $params['operation'] = $operation;
	    }

		//操作对象
	    $objid = trim(I('post.objid'));
	    if(!empty($objid)){
		    $params['objid'] = $objid;
	    }

	    //剧集，章节
	    $subobjid = trim(I('post.subobjid'));
	    if(!empty($subobjid)){
		    $params['subobjid'] = $subobjid;
	    }

	    //视频以播放时间
	    $videotime = trim(I('post.videotime'));
	    if(!empty($videotime)){
		    $params['public'] = $videotime;
	    }

        $params['creatime'] = date("Y-m-d H:i:s");

	    $result =  $this->Operation->add($params);

        if($result){
            $data['rst'] = 0;
            $data['msg'] = 'Add info successes';
        }else{
            $data['rst'] = -1;
            $data['msg'] = 'Add info failed';
        }
        $this->ajaxReturn($data);
    }

	/**
	 * 查询用户操作记录
	 * @param string userid : 用户id
	 * @param stirng operation : （可选）用户操作类型：0.下载app 1.视频播放 2.搜索 3.阅读图书 4.打开广告 5.查询 6.打开游戏 7.打开应用 8.注册登入 9.上网 10.系统消息阅读
	 * @param string objid : 操作对象id
	 * @param dateform,dateto  后台设置默认时间区域
	 */
	public function searchOperation(){
		$params = array();

		//规定查询某个时间段的数据
		$params['creatime'] = array('between',array(C('DATE_FORM'),C('DATE_TO')));

		//获取用户ID
		$uid = trim(I('post.userid'));
		if(!empty($uid)){
			$params['uid'] = $uid;
		}

		//操作类型
		$a = I('post.operation');
		if(isset($a) && array_key_exists('operation',$_POST)){
			$params['operation'] = I('post.operation','','int');
		}

		//操作对象
		$objid = trim(I('post.objid'));
		if(!empty($objid)){
			$params['objid'] = $objid;
		}

		$data = $this->Records->searchOperation($params);
		$this->ajaxReturn($data);
	}

}