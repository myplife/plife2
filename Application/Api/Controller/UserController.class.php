<?php
namespace Api\Controller;
use Think\Controller;

class UserController extends Controller {


  /*  public function __construct(){
        parent::__construct();
        $this->AdminuserLogic = D('User','Logic');
    }

    public function UpdateUserInfo(){
        $this->post = I('post.');
        $object = new \Curl\Curl\Curl();
        $object->get("http://user.pinet.co/api/get_user_data", array('token' =>$this->post['token']));
//        print_r($object);die;
        if($object->http_status_code == 200) {
            $response = json_decode($object->response);
        }
        $response=$this->AdminuserLogic->update_userinfo($this->post,$this->post['token']);
	    //$response=$this->AdminuserLogic->update_userinfo($this->post,$this->post['token'],$response);
        $this->ajaxReturn($response);
    }
  */

	private $User;
	private $YunPian;

	public function __construct(){
		$this->User =  D('User','Logic');
		$this->YunPian = new \Vendor\yunpian\YunPian();
	}

	/**
	 * 发送短信验证码
	 * @param string phone
	 * @param josn data
	 */
	public function sendSMS(){
		$phone =  trim(I('post.phone','',string));
		$reg =  '/^((13[0-9])|(147)|(15[0-35-9])|(17[7,8])|(18[0-35-9]))\d{8}$/';
		$data = array();
		$data['rst'] = '-1';
		$data['msg'] = 'failure';
		if(preg_match($reg,$phone)){//检测手机号是否正确
			//生成随机4位验证码
			$code = null;
			for($i=1;$i<=4;$i++){
				$code.=rand(0,9);
			}
			//发送验证码
			$result = $this->YunPian->sendSMS($code,$phone);
			if($result['code'] == 0){
				$this->User->addCode($code,$phone);//保存验证码
				$data['rst'] = '0';
				$data['msg'] = 'success';
			}
		}
		$this->ajaxReturn($data);
	}

	/**
	 * 用户手机号注册第一步
	 * @param stirng phone : 注册手机号
	 * @param string code : 验证码
	 * @return json data
	 */
	public function registerOne(){
		$phone = trim(I('post.phone'));
		$code = I('post.code',null,'int');
		$reg =  '/^((13[0-9])|(147)|(15[0-35-9])|(17[7,8])|(18[0-35-9]))\d{8}$/';//手机号正则
		$data = array();
		$data['rst'] = '-1';
		$data['msg'] = '手机号或验证码有误';

		if(preg_match($reg,$phone) && $code){
			if($this->User->findUser($phone)){//检查该手机号是否已经注册
				$data['msg'] = '此号码已经注册，请登入使用';
			}else{
				//该手机号可以注册
				if($code != $this->User->findCode($phone)){
					$data['msg'] = '验证码错误';
				}else{
					//验证码正确，保存用户注册信息
					$data['rst'] = '0';
					$data['msg'] = '验证码正确';
				}
			}
		}
		$this->ajaxReturn($data);
	}

	/**
	 * 用户手机注册第二步
	 * @param string phone :手机号码
	 * @param string 密码
	 * @return json data
	 */
	public function registerTwo(){
		$params = array();
		$params['phone'] = trim(I('post.phone'));
		$params['password'] = md5(I('post.password'));

		//刚注册用户默认名称：派生活新用户
		$params['nickname'] = '派生活新用户';
		$params['creatime'] = date('Y-m-d H:i:s');
		$data = array();
		$data['rst'] = '-1';
		$data['msg'] = '注册失败';
		//保存注册信息
		if($this->User->addUser($params)){
			$data['rst'] = '0';
			$data['msg'] = '注册成功';
		}

		$this->ajaxReturn($data);
	}

	/**
	 *用户登入
	 * @param string phone :用户手机
	 * @param string password: 密码
	 * @param json : data
	 */
	public function login(){
		$params = array();
		$phone = trim(I('post.phone'));
		if(!empty($phone)){
			$params['phone'] = $phone;
		}
		$password = I('post.password');
		if(!empty($password)){
			$params['password'] = md5($password);
		}
		$data = array();
		$data['rst'] = '-1';
		$data['msg'] = '用户名或密码错误';
		//检测用户名和密码是否匹配
		$result = $this->User->login($params);
		if($result){
			$data['rst'] = '0';
			$data['msg'] = '登入成功';
			$data['user'] = $result;
		}

		$this->ajaxReturn($data);
	}

	/**
	 * 账户信息修改(不含密码修改)
	 * @param int userid :用户ID
	 * @param string logo : 头像地址
	 * @param string username : 用户名
	 * @param string phone : 手机号
	 * @param string birthday :生日
	 * @return json: data
	 */
	public function updateUserInfo(){
		$params = array();

		$uid =  I('post.userid',null,'int');
		//头像地址
		$logo =  trim(I('post.logo'));
		if(!empty($logo)){
			$params['logo'] = $logo;
		}
		//用户昵称
		$nickname =  trim(I('post.username'));
		if(!empty($nickname)){
			$params['nickname'] =  $nickname;
		}
		//手机号
		$phone = trim(I('post.phone'));
		if(!empty($phone)){
			$params['phone'] = $phone;
		}
		//生日
		$birthday = trim(I('post.birthday'));
		if(!empty($birthday)){
			$params['birthday'] = $birthday;
		}


		$data = array();
		$data['rst'] = '-1';
		$data['msg'] = 'failure';

		$result = $this->User->updateUserInfo($uid,$params);
		if($result){
			$data['rst'] = '0';
			$data['msg'] = 'success';
		}
		$this->ajaxReturn($data);
	}

	/**
	 * 账户信息获取
	 * @param int userid ：用户ID
	 */
	public function getUserInfo(){
		$uid = I('post.userid',null,'int');
		if(isset($uid)){
			$data = $this->User->getUserInfo($uid);
		}
		$this->ajaxReturn($data);
	}

	/**
	 * 修改密码
	 * @param int userid :用户ID
	 * @param string oldpwd :旧密码
	 * @param string newpwd : 新密码
	 * @return json : data
	 */
	public function changePassword(){
		$uid = I('post.userid',null,'int');
		$newpwd =  trim(I('post.newpwd'));//新密码
		$oldpwd = trim(I('post.oldpwd'));//旧密码

		$data = array();
		$data['rst'] = '-1';
		$data['msg'] = 'failure';

		if($uid && !empty($newpwd) && !empty($oldpwd)){
			$result = $this->User->changePassword($uid,$oldpwd,$newpwd);
			if($result){
				$data['rst'] = '0';
				$data['msg'] = 'success';
			}
		}
		$this->ajaxReturn($data);
	}

}