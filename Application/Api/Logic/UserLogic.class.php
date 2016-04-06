<?php
/**
 * Created by PhpStorm.
 * User: IceLight
 * Date: 15/11/20
 * Time: 上午9:02
 */

namespace Api\Logic;


class UserLogic extends \Think\Model{
	private $Verify;
	private $User;

	public function __construct(){
		$this->Verify =  M('Verify');
		$this->User = M('User');
	}
   /* private $Admin;
    public function __construct(){
        $this->Admin = M('Admin');
    }
    public function update_userinfo($post,$token){
        $object = new \Curl\Curl\Curl();
        $user = $this->Admin->where(array('uid'=>$post['userid']))->find();

        if(!$user){
            echo 'user is not found';return false;
        }
        $object->post("http://user.pinet.co/api/update_basic_info", array(
            'token' =>$token,
            'email' =>$post['email'],
            'mobile' =>$post['mobile']
//				'password' =>md5($post['password']),
//				'first_name' => $post['first_name'],
//				'last_name' => $post['last_name'],
//              'sex' => $post['radio'],
//              'birthday'=>$post['year'].'-'.$post['month'].'-'.$post['day'],
//				'mobile' => $post['mobile'],
//				'email' => $post['email']
        ));
        if($object->http_status_code == 200) {
            $response = json_decode($object->response);
        }
        $object->get("http://user.pinet.co/api/get_user_data", array('token' =>$token));
        if($object->http_status_code == 200) {
            $response = json_decode($object->response);
        }
        return $response;
    }
   */

	/**
	 * 保存验证码
	 * @parma array params
	 * @return int result
	 */
	public function addCode($code,$phone){
		$params['creatime'] = date('Y-m-d H:i:s');
		$params['code'] = $code;
		if($this->Verify->where('phone='.$phone)->count() > 0){
			//此手机号曾经获取过验证码
			$result = $this->Verify->where('phone='.$phone)->data($params)->save();
		}else{
			//此手机号第一次获取验证码
			$params['phone'] = $phone;
			$result = $this->Verify->data($params)->add();
		}
		return $result;
	}

	/**
	 * 查找用户是否存在
	 * @param string phone ：手机号码
	 * @return int result
	 */
	public function findUser(){
		$phone =  trim(I('post.phone'));
		$result = $this->User->where('phone='.$phone)->count();
		return $result;
	}

	/*
	 * 查找验证码
	 * @param stirng phone : 手机号码
	 * @return string data
	 */
	public function findCode($phone){
		$data = $this->Verify->where('phone='.$phone)->getField('code');
		return $data;
	}

	/**
	 * 修改用户信息
	 * @param int id :用户ID
	 * @param array params
	 * @return int result
	 */
	public function saveUser($id,$params){
		$result = $this->User->where('id='.$id)->data($params)->save();
		return $result;
	}

	/**
	 * 添加新用户
	 * @param array params
	 * @return int result
	 */
	public function addUser($params){
		$result = $this->User->data($params)->add();
		return $result;
	}

	/**
	 * 用户登入
	 * @param array params
	 * @return array data
	 */
	public function login($params){
		$result = $this->User->field('uid,nickname')->where($params)->select();
		if($result){
			//用户名密码正确，更新用户最后登入时间
			$date = date('Y-m-d H:i:s');
			$this->User->where($params)->data('lastlogindate='.$date)->save();
		}
		return $result;
	}


}