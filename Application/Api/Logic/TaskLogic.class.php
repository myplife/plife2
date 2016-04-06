<?php
/**
 * Created by PhpStorm.
 * User: IceLight
 * Date: 15/11/20
 * Time: 上午9:02
 */

namespace Api\Logic;


class TaskLogic extends \Think\Model{

    private $User;
    private $Task;
    private $Usertask;
	private $UserSing;

    public function __construct(){
        $this->User = M('User');
        $this->Task = M('Task');
        $this->Usertask = M('User_task');
	    $this->UserSign = M('UserSign');
    }

    public function getTaskListByCategoryId($userid,$categoryid){
        $data = $this->Task->where(array('categoryid'=>$categoryid))->field('id taskid,title,score,categoryid')->select();

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

	/**
	 * 获取任务列表
	 * @param $userid
	 * @return array data
	 */
    public function getTaskList($userid){
       // $result[0] = $this->getTaskListByCategoryId($userid,46);
       // $result[1] = $this->getTaskListByCategoryId($userid,47);
        //$result[2] = $this->getTaskListByCategoryId($userid,48);
	    $data = $this->Task->table('__TASK__ task,__CATEGORY__ category')->field('task.id taskid,task.categoryid,task.title,task.score,category.title categoryname')
			    ->where('task.categoryid = category.id')->select();
	    foreach($data as $key=> $row){
			$taskid = $row['taskid'];
		    if($taskid == 1047){
			    $starttime = date('Y-m-d H:i:s',strtotime(date('Y-m-d')));
			    $endtime = date('Y-m-d H:i:s',strtotime(date('Y-m-d',strtotime('+1 days'))));
			    $params['userid'] = $userid;
			    $params['signtimes'] = array('between',array($starttime,$endtime));
			    if($this->UserSign->where($params)->count() > 0){
					$data[$key]['status'] = 1;
			    }else{
				    $data[$key]['status'] = 0;
			    }
		    }else{
				if($this->Usertask->where(array('userid'=>$userid,'taskid'=>$taskid))->count() > 0){
					$data[$key]['status'] = 1;
				}else{
					$data[$key]['status'] = 0;
				}
		    }
	    }
        return $data;
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
            $totalscore = $this->User->where('uid='.$userid)->getField('totalscore');
            $taskscore = $this->Task->where('id='.$taskid)->getField('score');
            $updateid = $this->User->where('uid='.$userid)->save(array('totalscore'=>$totalscore+$taskscore));
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