<?php
/**
 * Created by PhpStorm.
 * User: IceLight
 * Date: 15/11/20
 * Time: 上午9:02
 */

namespace Api\Logic;


class PostLogic extends \Think\Model{
    public function __construct(){
        $this->Post = M('Post');
    }
    private $Post;

    public function getPostTotal($cond = array()){
        $mycond = array();
        if(is_array($cond) && count($cond)>0){
            $mycond = $cond;
        }
        $num = $this->Post->where($mycond)->where('isdel is null')->count();
        return $num;
    }

    public function getPostList($cond=array(), $p){
        $mycond = array();
        if(is_array($cond) && count($cond)>0){
            $mycond = $cond;
        }
        $pstr = $p.','.C('ADMIN_REC_PER_PAGE');
        $data = $this->Post->where($mycond)->where('isdel is null')->page($pstr)->order('create_date asc')->select();
        return $data;
    }

    public function getPostById($id){
        if($id){
            $data = $this->Post->getById($id);
            return $data;
        }else{
            return false;
        }
    }

	/**
	 * 文章列表
	 * @param array params
	 * @return array data
	 */
	public function getArticleList($params){
		$data = $this->Post->where($params)->field('id,title,img imgurl,content,creatime date ')->select();
		return $data;
	}
}
