<?php
/**
 * Created by PhpStorm.
 * User: IceLight
 * Date: 15/11/20
 * Time: 上午9:02
 */

namespace Api\Logic;


class TaskLogic extends \Think\Model{

    private $Admin;
    private $Task;
    private $Usertask;

    public function __construct(){
        $this->Admin = M('Admin');
        $this->Task = M('Task');
        $this->Usertask = M('User_task');
    }

    public function getTaskListByCategoryId($userid,$categoryid){
        $data = $this->Task->where(array('categoryid'=>$categoryid))->field('id,title,score,categoryid')->select();
        foreach($data as $key => $row){
            $taskid = $row['id'];
            if($this->Usertask->where(array('userid'=>$userid,'taskid'=>$taskid))->count() > 0){
                $data[$key]['status'] = 1;
            }else{
                $data[$key]['status'] = 0;
            }
        }
        return $data;
    }

    public function getTaskList($userid){
        $result[0] = $this->getTaskListByCategoryId($userid,46);
        $result[1] = $this->getTaskListByCategoryId($userid,47);
        $result[2] = $this->getTaskListByCategoryId($userid,48);
        return $result;
    }

    public function getTaskRecord($userid,$taskid){
        $data = $this->Usertask->where(array('userid'=>$userid,'taskid'=>$taskid))->find();
        return $data;
    }

    public function getUserTaskRecord($userid){
        $data = $this->Usertask->where(array('userid'=>$userid))->select();
        return $data;
    }

    public function addRecord($userid,$taskid){
        $adddata = array(
            'userid' => $userid,
            'taskid' => $taskid,
            'finishtimes' => date('Y-m-d H:m:s',time())
        );
        $inserid = $this->Usertask->add($adddata);
        if($inserid){
            $result['msg'] = '001';
            $result['status'] = 1;
            $result['usertaskid'] = $inserid;
        }else{
            $result['msg'] = '002';
        }
        return $result;
    }

    public function getScoreByTask($userid,$taskid){
        $adddata = array(
            'userid' => $userid,
            'taskid' => $taskid,
            'finishtimes' => date('Y-m-d H:m:s',time())
        );
        $inserid = $this->Usertask->add($adddata);
        $result = array();
        if($inserid){
            $totalscore = $this->Admin->where('uid='.$userid)->getField('totalscore');
            $taskscore = $this->Task->where('id='.$taskid)->getField('score');
            $updateid = $this->Admin->where('uid='.$userid)->save(array('totalscore'=>$totalscore+$taskscore));
            if($updateid){
                $result['msg'] = '001';
                $result['status'] = 0;
                $result['usertaskid'] = $inserid;
                $result['totalscore'] = $totalscore+$taskscore;
            }else{
                $result['msg'] = '002';
            }
        }
        return $result;
    }

}