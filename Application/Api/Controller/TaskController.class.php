<?php
namespace Api\Controller;
use Think\Controller;

class TaskController extends Controller {

    private $TaskLogic;
    private $Usertask;

    public function __construct(){
        parent::__construct();
        $this->TaskLogic = D('Task','Logic');
        $this->Usertask = M('User_task');
    }

    public function GetTasks(){
        $userid = I('post.userid');
//        $userid = 1001;
        $data = $this->TaskLogic->getTaskList($userid);
        $this->ajaxReturn($data);
    }

    public function getTaskStatus(){
        $userid = I('post.userid');
        $taskid = I('post.taslid');
//        $userid = 1001;
//        $taskid = 1046;
        $data = $this->TaskLogic->getTaskRecord($userid,$taskid);
        if($data){
            $data['rst'] = 0;
            $data['msg'] = 'Get info successes';
        }else{
            $data['rst'] = -1;
            $data['msg'] = 'Get info failed';
        }
        $this->ajaxReturn($data);
    }

    public function CompleteTask(){
        $userid = I('post.userid');
        $taskid = I('post.taskid');
        //$status = I('post.status');
//        $userid = 1001;
//        $taskid = 1046;
        $nums = $this->Usertask->where('userid = '.$userid)->count();
        if($nums){
            $data = $this->TaskLogic->addRecord($userid,$taskid);
        }else{
            $data = $this->TaskLogic->getScoreByTask($userid,$taskid);
        }
        $this->ajaxReturn($data);
    }

    public function GetUserTaskRecord(){
        $userid = I('post.userid');
//        $userid = 1001;
        $data = $this->TaskLogic->getUserTaskRecord($userid);
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