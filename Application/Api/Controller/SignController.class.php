<?php
namespace Api\Controller;
use Think\Controller;
header("Content-Type: text/html; charset=utf-8");

class SignController extends Controller {

    private $SignLogic;
    private $UserSign;
    private $Admin;

    public function __construct(){
        parent::__construct();
        $this->SignLogic = D('Sign','Logic');
        $this->UserSign = M('User_sign');
        $this->Admin = M('Admin');
    }

    public function SignIn(){
        $userid = I('post.userid');
//        $userid = 1001;
        $re = $this->SignLogic->getSignRecordByUid(array('userid'=>$userid));
        $date1 = date('Y-m-d',time());
        $date2 = date('Y-m-d',strtotime($re[0]['signtimes']));
        $stiffdays = floor((strtotime($date1)-strtotime($date2))/3600/24);

        $data = array();
        if($stiffdays < 1){
	        $rst = '-1';
            $msg = '今天已签到，请明天再来。';
        }else{
            $sign_data = array(
                'userid'=>$userid,
                'signtimes'=>date('Y-m-d H-i-s',time())
            );
            if($re == null || $stiffdays > 1){
                $days = 1;
                $score = C('sign_score_one');
                $msg = '连续签到1天。';
            }elseif($stiffdays == 1){
                $days = $re[0]['days']+1;
                if($days > 0 and $days <= 5){
                    $score = C('sign_score_one');
                }elseif($days > 5 and $days <= 10){
                    $score = C('sign_score_five');
                }elseif($days > 10){
                    $score = C('sign_score_ten');
                }
                $msg = '恭喜您，连续签到'.$days.'天。';
            }
	        $rst = '0';
            $sign_data['score'] = $score;
            $sign_data['days'] = $days;
            $signid = $this->UserSign->add($sign_data);

            if($signid > 0){
                $ad = $this->Admin->where('uid='.$userid)->find();
                $this->Admin->where('uid='.$userid)->save(array('totalscore'=>$ad['totalscore']+$score));
                $data['id'] = $signid;
            }else{
                $msg = 'error';
            }
            $data['score'] = $score;
            $data['totalscore'] = $ad['totalscore']+$score;
        }
	    $data['rst'] = $rst;
        $data['msg'] = $msg;
        $this->ajaxReturn($data);
    }

    public function getSignRecord(){
        $userid = I('post.userid');
//        $userid = 1001;
        $data = $this->SignLogic->getSignRecord($userid);
        if($data){
            $data['rst'] = 0;
            $data['msg'] = 'Get info successes';
        }else{
            $data['rst'] = -1;
            $data['msg'] = 'Get info failed';
        }
        $this->ajaxReturn($data);
    }

}