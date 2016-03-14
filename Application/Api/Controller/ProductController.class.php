<?php
namespace Api\Controller;
use Think\Controller;

class ProductController extends Controller {

    private $ProductLogic;
    private $Admin;
    private $Userproduct;

    public function __construct(){
        parent::__construct();
        $this->ProductLogic = D('Product','Logic');
        $this->Admin = M('Admin');
        $this->Userproduct = M('User_product');
    }

    public function GetUserPoint(){
        $userid = I('post.userid');
//        $userid = 1001;
        $data = $this->Admin->where('uid='.$userid)->field('uid,totalscore')->find();
        $this->ajaxReturn($data);
    }

    public function productList(){
        $userid = I('post.userid');
//        $userid = 1001;
        $data = $this->ProductLogic->getProductList($userid);
        $this->ajaxReturn($data);
    }

    public function GetProductDetail(){
        $productid = I('post.productid');
//        $productid = 1011;
        $data = $this->ProductLogic->getProductDetail($productid);
        $this->ajaxReturn($data);
    }

    public function ExchangePoint(){
        $userid = I('post.userid');
        $productid = I('post.productid');
//        $userid = 1001;
//        $productid = 1013;
        $nums = $this->Userproduct->where(array('userid'=>$userid,'productid'=>$productid))->count();
        if($nums){
            $data['rst'] = 0;
            $data['msg'] = 'This Product has exchanged';
        }else{
            $data = $this->ProductLogic->exchangeProductByScore($userid,$productid);
            $data['rst'] = 0;
            $data['msg'] = 'Exchange good is success';
        }
        $this->ajaxReturn($data);
    }

    public function GetPointProducts(){
        $userid = I('post.userid');
        $searchstring = I('post.keywords');
//        $userid = 1001;
//        $searchstring = '苹果';
        $data = $this->ProductLogic->searchProductByString($userid,$searchstring);
        $this->ajaxReturn($data);
    }

}