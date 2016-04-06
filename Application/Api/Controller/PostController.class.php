<?php
namespace Api\Controller;
use Think\Controller;
class PostController extends Controller
{
	private $Post;
	public function __construct(){
		$this->Post = D('Post','Logic');
	}
	/*
    public function __construct()
    {

        $this->postLogic = D('Post', 'Logic');

        $this->Post = M('Post');
    }

    private $postLogic;
    private $Post;

    /**
     * 文章查询接口
     * param: keywords:文章关键字
     * @return json : data


    public function GetPosts()
    {
        $searchstring = I('post.keywords')?I('post.keywords'):0;
//        $searchstring = '微信';
        $con['title'] = array('like','%'.$searchstring.'%');
        $data = $this->postLogic->getPostList($con);
        $this->ajaxReturn($data);
    }
	*/


	/**
	 * 文章列表接口
	 * @param int acticletype : 类型：0：厂区培训 1：厂区通知 2:普通文章 没有则代表所有类型
	 * @return json:data
	 */
	public function getArticleList(){
		$params = array();
		$type = I('post.acticletype',null,'int');
		if(isset($type)){
			switch($type){
				case 0:$params['cid'] = '53';break;
				case 1:$params['cid'] = '54';break;
				case 2:$params['cid'] = '55';break;
			}
		}
		$data = $this->Post->getArticleList($params);
		$this->ajaxReturn($data);
	}
}