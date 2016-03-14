<?php
namespace Api\Controller;
use Think\Controller;

class UserController extends Controller {


    public function __construct(){
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
        $response=$this->AdminuserLogic->update_userinfo($this->post,$this->post['token'],$response);
        $this->ajaxReturn($response);
    }
}