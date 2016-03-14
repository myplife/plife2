<?php
namespace Admin\Controller;
use Think\Controller;
class TaskController extends Controller {

    private $TaskLogic;
    public function __construct(){
        parent::__construct();
        $this->TaskLogic = D('Task','Logic');
        $this->Task = M('Task');
    }

    public function index(){
        $p = getCurPage();
        $res = $this->TaskLogic->getTaskList(array(),$p);
        $this->data = $res;
        $this->total = $this->TaskLogic->getTaskTotal();
        $show = constructAdminPage($this->total);
        $this->assign('page',$show);
        $this->display();
    }

    public function addtask(){
        //$this->checkPriv('9_1_2');
        $this->assign('errcode', '0');
        $this->assign('act', 'add');
        $this->taskcategory = $this->TaskLogic->getTastCategory();
        if (I('post.act') == 'add') {
            $title = I('post.title');
            $cond = array('title' => $title);
            $taskinfo = $this->Task->where($cond)->select();
            if ($taskinfo) {
                $this->assign('errcode', '1');  // 用户角色已存在
                $this->data = I('post.');
                $this->display('Task/taskedit');
            } else {
                $newdata = array(
                    'title' => I('post.title'),
                    'content' => I('post.content'),
                    'score' => I('post.score'),
                    'categoryid' => I('post.category'),
                    'starttimes' => I('post.starttimes'),
                    'endtimes' => I('post.endtimes'),
                );
                $this->Task->add($newdata);
                $this->redirect('Task/index');
            }
        } else {
            $this->display("Task/taskedit");
        }
    }

    public function edittask(){
        //$this->checkPriv('9_1_3');
        $this->assign('act', 'edit');
        $this->assign('errcode', '0');
        $this->taskcategory = $this->TaskLogic->getTastCategory();
        if (I('post.act') == 'edit') {
            $title = I('post.title');
            $id=I('post.id','','int');
            $cond = array();
            $cond['title'] = $title;
            $ret = $this->Task->where($cond)->find();
            if ($ret) {
                $this->assign('errcode', '1');
                $this->data = I('post.');
                $this->display("Task/taskedit");
            } else {
                $newdata = array(
                    'title' => I('post.title'),
                    'content' => I('post.content'),
                    'score' => I('post.score'),
                    'categoryid' => I('post.category'),
                    'starttimes' => I('post.starttimes'),
                    'endtimes' => I('post.endtimes'),
                );
                $this->Task->where('id=' . $id)->save($newdata);
                $this->redirect('Task/index');
            }
        } else {
            $id=I('get.id','','int');
            if ($id) {
                $this->data = $this->Task->getById($id);
                $this->display("Task/taskedit");
            } else {
                $this->error('无效记录');
            }
        }
    }

    public function deltask(){
        //$this->checkPriv('9_1_4');
        $id=I('get.id','','int');
        if($id){
            $this->Task->where('id='.$id)->delete();
            $this->redirect('Task/index');
        }else{
            $this->error('没有该记录');
        }
    }

    public function usertaskmgr(){
        $p = getCurPage();
        $res = $this->TaskLogic->getUserTaskList(array(),$p);
        $this->data = $res;
        $this->total = $this->TaskLogic->getUserTaskTotal();
        $show = constructAdminPage($this->total);
        $this->assign('page',$show);
        $this->display();
    }

    public function usertaskrecord(){
        //$this->checkPriv('9_1_1');
        $uid = I('get.uid');
        $p = getCurPage();
        $res = $this->TaskLogic->getRecordByUid(array('userid'=>$uid),$p);
        $this->data = $res;

        $this->total = $this->TaskLogic->getRecordTotalByUid(array('userid'=>$uid));
        $show = constructAdminPage($this->total);
        $this->assign('page',$show);
        $this->display();
    }

}