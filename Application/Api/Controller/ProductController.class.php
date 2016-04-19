<?php
namespace Api\Controller;
use Think\Controller;

class ProductController extends Controller {

    private $ProductLogic;
    private $User;
    private $Userproduct;

    public function __construct(){
        parent::__construct();
        $this->ProductLogic = D('Product','Logic');
        $this->User = M('User');
        $this->Userproduct = M('User_product');
    }

    public function GetUserPoint(){
        $userid = I('post.userid');
//        $userid = 1001;
        $data = $this->User->where('uid='.$userid)->field('uid,totalscore point,pointtoexpire,expiredpoint')->find();
        $this->ajaxReturn($data);
    }

    public function productList(){
        $userid = I('post.userid');
//        $userid = 1001;
        $data = $this->ProductLogic->getProductList($userid);
        $this->ajaxReturn($data);
    }
	/**
   public function GetProductDetail(){
        $productid = I('post.productid');
//        $productid = 1011;
        $data = $this->ProductLogic->getProductDetail($productid);
        $this->ajaxReturn($data);
    }
	 * */

	/**
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
	 * */

   /** public function GetPointProducts(){
        $userid = I('post.userid');
        $searchstring = I('post.keywords');
//        $userid = 1001;
//        $searchstring = '苹果';
        $data = $this->ProductLogic->searchProductByString($userid,$searchstring);
        $this->ajaxReturn($data);
    }
    * */

	/**
	 * 积分兑换
	 * 参数：
	 * @param int userid : 用户ID
	 * @param int productid : 产品ID
	 */
	public function exchangePoint(){
		$params = array();

		//用户ID
		$params['userid'] = I('post.userid',null,'int');
		//产品ID
		$params['productid'] = I('post.productid',null,'int');

		$data = $this->User->field('totalscore')->where('uid='.$params['userid'])->select();
		$userscore = $data[0]['totalscore'];//用户拥有积分
		$data = $this->ProductLogic->getPointProducts(array('id'=>$params['productid']));
		$productscore = $data[0]['point'];//该商品所需要的积分
		$productnum = $data[0]['amount'];//该产品剩余数量

		$retu = array();//用于返回
		if($productnum<1 || $productscore>$userscore){
			$retu['rst'] = '-1';
			$retu['msg'] = 'Integral or goods is not enough';
		}else{
			$this->ProductLogic->exchangePoint($params,$userscore,$productnum,$productscore);
			$retu['rst'] = '0';
			$retu['msg'] = 'Exchange good is success';
		}
		$this->ajaxReturn($retu);

	}



	/**
	 * 获取商城商品（含搜索）
	 * 参数：
	 * @param int producttypeid : （可选）产品类型：虚拟，实物
	 * @param string keywords   : (可选)搜索关键字匹配产品名，描述
	 * @oaran int id : (可选)产品ID （用于获取产品详情）
	 */
	public function getPointProducts(){
		$params = array();

		//产品类型
		$categoryid = I('post.producttypeid',null,int);
		if(isset($categoryid)){
			$params['categoryid'] = $categoryid;
		}

		//搜索关键字
		$keywords = trim(I('post.keywords'));
		if(!empty($keywords)){
			$param['productname'] =  array('like','%'.$keywords.'%');
			$param['content'] =  array('like','%'.$keywords.'%');
			$param['_logic'] = 'or';
			$params['_complex'] = $param;
		}

		//产品id
		$id = I('post.productid',null,'int');
		if(isset($id)){
			$params['id'] = $id;
		}

		$data =  $this->ProductLogic->getPointProducts($params);
		$this->ajaxReturn($data);
	}

	/**
	 *积分兑换记录
	 * @param int userid:用户ID
	 * @param int pages:（可选）分页 默认为1
	 * @parms int rowcount:（可选）每页返回记录数
	 * @return json data
	 */
	public function exchangeRecord(){
		$userid = I('post.userid',null,'int');
		$pages = I('post.pages','','int')?I('post.pages','','int'):1;
		$rowcount = I('post.rowcount','','int')?I('post.rowcount','','int'):C('MOB_REC_PER_PAGE');

		if(isset($userid)){
			$params['userid'] =  $userid;
			$data =  $this->ProductLogic->exchangeRecord($params,$pages,$rowcount);
		}else{
			$data['rst'] = -1;
			$data['msg'] = '无效的USERID';
		}

		$this->ajaxReturn($data);
	}

	/**
	 * 热门积分兑换商品
	 * @param int pages :(可选)分页 默认为1
	 * @param int rowcount :(可选)每页返回记录数，默认系统设置值
	 * @param json data
	 */
	public function getHotProducts(){
		$pages = I('post.pages','','int')?I('post.pages','','int'):1;
		$rowcount = I('post.rowcount','','int')?I('post.rowcount','','int'):C('MOB_REC_PER_PAGE');
		$data = $this->ProductLogic->getHotProducts($pages,$rowcount);

		$this->ajaxReturn($data);
	}

}