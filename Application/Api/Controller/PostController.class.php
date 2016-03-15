<?php
namespace Api\Controller;
use Think\Controller;
class PostController extends Controller
{
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
     */
    public function GetPosts()
    {
        $searchstring = I('post.keywords')?I('post.keywords'):0;
//        $searchstring = '微信';
        $con['title'] = array('like','%'.$searchstring.'%');
        $data = $this->postLogic->getPostList($con);
        $this->ajaxReturn($data);
    }
}