<?php
namespace Admin\Controller;
use Think\Controller;
class MessageController extends Controller {

    private $MessageLogic;
    private $Message;
    public function __construct(){
        parent::__construct();
        $this->MessageLogic = D('Message','Logic');
        $this->Message = M('sysmsg');
    }

    public function index(){
        $p = getCurPage();
        $res = $this->MessageLogic->getMessageList(array(),$p);
        $this->data = $res;
        $this->total = $this->MessageLogic->getMessageTotal();
        $show = constructAdminPage($this->total);
        $this->assign('page',$show);
        $this->display();
    }

    public function addmessage(){
        //$this->checkPriv('9_1_2');
        $this->assign('errcode', '0');
        $this->assign('act', 'add');
        if (I('post.act') == 'add') {
            $newdata = array(
                'title' => I('post.title'),
                'content' => I('post.content'),
                'creatime' => I('post.creatime'),
                'status' => I('post.status')
            );
            $this->Message->add($newdata);
            $this->redirect('Message/index');
        } else {
            $this->title = '添加系统消息';
            $this->display("Message/messageedit");
        }
    }

    public function editmessage(){
        //$this->checkPriv('9_1_3');
        $this->assign('act', 'edit');
        $this->assign('errcode', '0');
        if (I('post.act') == 'edit') {
            $id=I('post.id','','int');
            $newdata = array(
                'title' => I('post.title'),
                'content' => I('post.content'),
                'creatime' => I('post.creatime'),
                'status' => I('post.status')
            );
            $this->Message->where('id=' . $id)->save($newdata);
            $this->redirect('Message/index');
        } else {
            $id=I('get.id','','int');
            if ($id) {
                $this->data = $this->Message->getById($id);
                $this->title = '编辑系统消息';
                $this->display("Message/messageedit");
            } else {
                $this->error('无效记录');
            }
        }
    }

    public function delmessage(){
        //$this->checkPriv('9_1_4');
        $id=I('get.id','','int');
        if($id){
            $this->Message->where('id='.$id)->delete();
            $this->redirect('Message/index');
        }else{
            $this->error('没有该记录');
        }
    }



}