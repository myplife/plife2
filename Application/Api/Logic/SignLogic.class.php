<?php
/**
 * Created by PhpStorm.
 * User: IceLight
 * Date: 15/11/20
 * Time: 上午9:02
 */

namespace Api\Logic;


class SignLogic extends \Think\Model{

       private $User_sign;

    public function __construct(){
        $this->User_sign = M('User_sign');
    }

    public function getSignRecordByUid($cond=array()){
        $mycond = array();
        if(is_array($cond) && count($cond)>0){
            $mycond = $cond;
        }
        $data = $this->User_sign->where($mycond)->order('signtimes desc')->select();
        return $data;
    }

    public function getSignRecord($userid){
        $data = $this->User_sign->where(array('userid'=>$userid))->select();
        return $data;
    }
}
