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
	 * @param int forlogin : 默认为 1.直接返回验证码 0.生存注册用户验证码
	 * @param string phone
	 * @param josn data
	 */
	public function sendVerifyCode(){
		$phone =  trim(I('post.phone','',string));
		$type = I('post.forlogin',null,'int');
		$reg =  '/^((13[0-9])|(147)|(15[0-35-9])|(17[7,8])|(18[0-35-9]))\d{8}$/';
		$data = array();
		$data['rst'] = '-1';
		$data['msg'] = 'failure';
		if(preg_match($reg,$phone)){//检测手机号是否正确
			if($type === 0){
				//此为注册时才进行判断
				if($this->User->findUser($phone) != null){//检查该手机号是否已经注册
					$data['msg'] = '此号码已经注册，请直接登入使用';
					$this->ajaxReturn($data);
				}
			}
			//生成随机4位验证码
			$code = '';
			for($i=1;$i<=4;$i++){
				$code.=mt_rand(0,9);
			}
			//发送验证码
			$result = $this->YunPian->sendSMS($code,$phone);
			if($result['code'] == 0){
				$this->User->addCode($code,$phone);//保存验证码
				$data['rst'] = '0';
				$data['msg'] = 'success';
			}
			$this->ajaxReturn($data);
		}else{
			$data['msg'] = '手机号非法';
			$this->ajaxReturn($data);
		}
	}

	/**
	 * 验证码验证接口
	 * @param stirng phone : 手机号
	 * @param string code : 验证码
	 * @return json data
	 */
	public function verifyCode(){
		$phone = trim(I('post.phone'));
		$code = I('post.code',null,'int');
		$reg =  '/^((13[0-9])|(147)|(15[0-35-9])|(17[7,8])|(18[0-35-9]))\d{8}$/';//手机号正则
		$data = array();
		$data['rst'] = '-1';
		$data['msg'] = '手机号或验证码有误';

		if(preg_match($reg,$phone) && $code){
				if($code != $this->User->findCode($phone)){
					$data['msg'] = '验证码错误';
				}else{
					//验证码正确，保存用户注册信息
					$data['rst'] = '0';
					$data['msg'] = '验证码正确';
				}
		}
		$this->ajaxReturn($data);
	}

	/**
	 * 用户手机注册
	 * @param string phone :手机号码
	 * @param string 密码
	 * @return json data
	 */
	public function register(){
		$params = array();
		$params['phone'] = trim(I('post.phone'));
		$params['password'] = trim(I('post.password'));

		$data = array();
		$data['rst'] = '-1';
		if(passStrengthDetect($params['password'])){
			$params['salt'] = getsalt();//生成密码干扰码
			$params['password'] = TransPassUseSalt($params['password'],$params['salt']);//组成新密码

			//刚注册用户默认名称：派生活新用户
			$params['nickname'] = '派生活新用户';
			$params['creatime'] = date('Y-m-d H:i:s');

			//保存注册信息
			if($this->User->addUser($params)){
				$data['rst'] = '0';
				$data['msg'] = '注册成功';
			}

		}else{
			$data['msg'] = '密码需为数字和字母的组合，且长度为8~18位';
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
		$phone = trim(I('post.phone'));
		$data = array();
		$data['rst'] = '-1';
		$data['msg'] = '用户名或密码错误';
		$user = $this->User->findUser($phone);//通过手机号，直接查找用户
		if($user != null){
			$password = TransPassUseSalt(trim(I('post.password')),$user[0]['salt']);//组合密码
			if($password == $user[0]['password']){
				if($user[0]['status'] == 1){
					$data['msg'] = '该账户已被冻结,无法正常登入';
				}else{
					$data['rst'] = '0';
					$data['msg'] = '登入成功';
					$this->User->login(array('phone'=>$phone));
					$use['userid'] = $user[0]['uid'];
					$use['phone'] = $user[0]['phone'];
					$use['username'] = $user[0]['nickname'];
					$data['user'] = $use;
				}
			}
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