<?php
/**
 * Created by PhpStorm.
 * User: IceLight
 * Date: 15/11/20
 * Time: 上午9:02
 */

namespace Api\Logic;


class ProductLogic extends \Think\Model{

    private $Product;
    private $Userproduct;
    private $Admin;

    public function __construct(){
        $this->Product = M('Product');
        $this->Userproduct = M('User_product');
        $this->Admin = M('Admin');
    }

    public function getProductListByCategoryId($cond=array(),$userid){
        $mycond = array();
        if(is_array($cond) && count($cond)>0){
            $mycond = $cond;
        }
        $result = $this->Product->join('left join pl_category on pl_category.id = pl_product.categoryid')->field('pl_category.name as categoryname,pl_product.*')->where($mycond)->select();
        foreach($result as $key => $row){
            if($this->Userproduct->where(array('userid'=>$userid,'productid'=>$row['id']))->count() > 0){
                $result[$key]['status'] = 1;
            }else{
                $result[$key]['status'] = 0;
            }
        }
        return $result;
    }

    public function getProductList($userid){
        $result[0] = $this->getProductListByCategoryId(array('categoryid'=>50),$userid);
        $result[1] = $this->getProductListByCategoryId(array('categoryid'=>51),$userid);
        return $result;
    }

	/**
    public function getProductDetail($productid){
        $data = $this->Product->where(array('id'=>$productid))->find();
        return $data;
    }
	 * */

	/*
    public function exchangeProductByScore($userid,$productid){
        $adddata = array(
            'userid' => $userid,
            'productid' => $productid,
            'exchangetimes' => date('Y-m-d H:m:s',time())
        );
        $insertid = $this->Userproduct->add($adddata);
        $result = array();
        if($insertid){
            $totalscore = $this->Admin->where('uid = '.$userid)->getField('totalscore');
            $productscore = $this->Product->where('id = '.$productid)->getField('score');
            $savedata = array('totalscore'=>$totalscore-$productscore);
            $updateid = $this->Admin->where('uid = '.$userid)->save($savedata);
            if($updateid){
                $result['msg'] = '001';
                $result['totalscore'] = $totalscore-$productscore;
                $result['userproductid'] = $insertid;
            }else{
                $result['msg'] = '002';
            }
        }
        return $result;
    }
	*/

   //public function searchProductByString($userid,$searchstring){
    //    $con['productname'] = array('like','%'.$searchstring.'%');
     //   $result = $this->getProductListByCategoryId($con,$userid);
     //   return $result;
   // }

	/**
	 *获取商城商品（含搜索）
	 * 参数：
	 * @param parama array
	 */
	public function getPointProducts($params=array()){
		$params['isonline'] = '0';
		if(isset($params['id'])){
			$data = $this->Product->where($params)
					->field('id productid,productname,score point,imagepath imgurl,content productshortdesc,price,lastnums amount,contentdesc productlongdesc')->select();
		}else{
			$data = $this->Product->where($params)
					->field('id productid,productname,score point,imagepath imgurl,content productshortdesc')->select();
		}
		return $data;
	}

	/**
	 * 积分兑换
	 * 参数：
	 * @param params array
	 */
	public function exchangePoint($params=array(),$userscore=0,$productnum=0,$productscore=0){
		//更改用户积分
		$this->Admin->where('uid='.$params['userid'])->save(array('totalscore'=>$userscore-$productscore));
		//更改产品数量
		$this->Product->where('id='.$params['productid'])->save(array('lastnums'=>$productnum-1));
		//保存兑换记录
		$params['exchangetimes'] = date('Y-m-d H:i:s');
		$this->Userproduct->add($params);
	}

}