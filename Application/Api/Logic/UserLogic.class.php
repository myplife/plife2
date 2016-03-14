<?php
/**
 * Created by PhpStorm.
 * User: IceLight
 * Date: 15/11/20
 * Time: 上午9:02
 */

namespace Api\Logic;


class UserLogic extends \Think\Model{

    private $Admin;

    public function __construct(){
        $this->Admin = M('Admin');
    }
    public function update_userinfo($post,$token){
        $object = new \Curl\Curl\Curl();
        $user = $this->Admin->where(array('uid'=>$post['uid']))->find();

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

}