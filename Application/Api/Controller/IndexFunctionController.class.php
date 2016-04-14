<?php
namespace Api\Controller;
use Think\Controller;
class IndexFunctionController extends Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->IndexFunction = D('IndexFunction', 'Logic');
        $this->Function = M('Function');
    }

    private $IndexFunction;
    private $Function;

    public function index(){}
    /**
     * 首页功能文字描述查询接口
     * @return json : data
     */
    public function GetModelDesc()
    {
        $data = $this->IndexFunction->getFunctionList();
        $this->ajaxReturn($data);
    }


	/**
	 * DNS接口服务
	 * @return json : data
	 */
	public function getDNSAddress(){
		$data['mss'] = 'http://wx.pinet.cc/plife2/';
		$this->ajaxReturn($data);
	}

	/**
	 * 版本检查接口
	 * 参数：
	 * @param appversion sting : 客户派生活app版本号
	 *
	 * @return json : data
	 */
	public function checkVersion(){
		$data = array();
		$appversion = trim(I('post.appversion','','string'));
		if($appversion != C('APP_VERSION')){
			if(C('APP_UPDATE') == 0){
				$data['rst'] = '-1';
				$data['msg'] = 'There is a new version';
			}else{
				$data['rst'] = '-2';
				$data['msg'] = 'Version is too low, must be updated ';
			}
			$data['url'] = C('APP_URL');

		}else{
			$data['rst'] = '0';
			$data['msg'] = 'Can enter the application';
		}
		$this->ajaxReturn($data);
	}

	/**
	 * 系统消息获取
	 * 参数：
	 * @param int userid : 用户ID
	 *
	 * @retrun json : data
	 */
	public function getNotices(){
		$params = array();
		$uid = I('post.userid','','int');
		if(!empty($uid)){
			$params['uid'] = $uid;
		}
		$data = $this->IndexFunction->getNotices($params);
		$this->ajaxReturn($data);
	}

	/**
	 * 系统消息检查
	 * @param int userid ： 用户ID
	 *
	 * @return json : data
	 */
	public function checkNotices(){
		$params = array();
		$uid = I('post.userid','','int');
		if(!empty($uid)){
			$params['uid'] = $uid;
		}
		$num = $this->IndexFunction->getNotices($params,2);//2代表系统消息检查
		$data = array();
		if($num > 0){
			$data['rst'] = '0';
			$data['msg'] = 'success';
			$data['num'] = $num;
		}else{
			$data['rst'] = '-1';
			$data['msg'] = 'No new messages ';
		}
		$this->ajaxReturn($num);
	}

	/**
	 * 意见收集接口
	 * @param string contactinfo : 联系方式
	 * @param string content : 内容
	 *
	 * @return json : data
	 */
	public function collectComments(){
		$params = array();
		$contact = trim(I('post.contactinfo','','string'));
		if(!empty($contact)){
			$params['contact'] =  $contact;
 		}

		$content = trim(I('post.content','','string'));
		if(!empty($content)){
			$params['content'] = $content;
		}

		$data = array();
		$data['rst'] = '-1';
		$data['msg'] = 'failure';
		if(isset($params['contact']) && isset($params['content'])){
			$params['creatime'] = date('Y-m-d H:i:s');
			$rs =  $this->IndexFunction->collectComments($params);
			if($rs){
				$data['rst'] = '0';
				$data['msg'] = 'success';
			}
		}

		$this->ajaxReturn($data);
	}

	/**
	 * 免责申明接口
	 * @param type : 0 免责申明 1 服务协议
	 * @return json:data
	 */
	public function getStatement(){
		$type = I('post.type',null,'int');
		$data = array();
		if(isset($type)){
			switch($type){
				case 0: $params['type'] = '3';break;
				case 1: $params['type'] = '4';break;
				default: $this->ajaxReturn(array('msg','查询错误'));
			}
			$data = $this->IndexFunction->getStatement($params);
		}
		$this->ajaxReturn($data);
	}




}