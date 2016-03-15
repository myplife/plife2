<?php
namespace Api\Controller;
use Think\Controller;
class BookController extends Controller
{
    public function __construct(){
        parent::__construct();
        $this->bookLogic =  D('Book','Logic');
        $this->readrecordLogic =  D('Readrecord','Logic');
        $this->categoryLogic =  D('Category','Logic');
        $this->Book=  M('Book');
        $this->Readrecord=  M('Readrecord');
        $this->Bookparam=  M('Bookparam');
    }

    private $bookLogic ;
    private $readrecordLogic ;
    private $Book ;
    private $Readrecord ;
    private $Bookparam;

    /**
     * 图书获取接口
     * param: 父类id: pid:0
     * @return json : data
     */
    public function GetBookList()
    {
        $where['pid'] =I('post.pid')?I('post.pid'):0;
        $data = $this->bookLogic->getBookList($where);
        $this->ajaxReturn($data);
    }

    /**
     * 用户浏览图书记录接口
     * @return json : data
     */
    public function GetReadRecordList()
    {
        $userid = I('post.userid');
//        $userid = '1001';
        $where['pl_readrecord.uid'] = $userid;
        $data = $this->bookLogic->getReadRecordList($where);
        print_r($data);die;
        $this->ajaxReturn($data);
    }
}