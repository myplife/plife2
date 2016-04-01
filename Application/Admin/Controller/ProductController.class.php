<?php
namespace Admin\Controller;
use Think\Controller;
class ProductController extends Controller {

    private $ProductLogic;
    private $Product;
    private $Category;

    public function __construct(){
        parent::__construct();
        $this->ProductLogic = D('Product','Logic');
        $this->categoryLogic=  D('Category','Logic');
        $this->Product = M('Product');
        $this->Category = M('Category');
    }

    public function index(){
        $p = getCurPage();
        $res = $this->ProductLogic->getProductList(array(),$p);
        $this->data = $res;
        $this->total = $this->ProductLogic->getProductTotal();
        $show = constructAdminPage($this->total);
        $this->assign('page',$show);
        $this->display();
    }

    public function addproduct(){
        //$this->checkPriv('9_1_2');
        $this->assign('errcode', '0');
        $this->assign('act', 'add');
        $cates = getSortedCategory($this->categoryLogic->getCategoryList());
        $this->assign('cate',$cates);
        if (I('post.act') == 'add') {
            $name = I('post.name');
            $cond = array('productname' => $name);
            $productinfo = $this->Product->where($cond)->select();
            if ($productinfo) {
                $this->assign('errcode', '1');  // 用户角色已存在
                $this->data = I('post.');
                $this->display('Product/productedit');
            } else {
                $uploadimg = $this->upimgfile();
                $logopath = $uploadimg['result']['logoimg']['fullpath'];
                $productpath = $uploadimg['result']['productimg']['fullpath'];

                if($logopath['error'] == false){
                    $newdata['logopath'] = $logopath['result']['coverimg']['fullpath'];
                }
                $newdata = array(
                    'productname' => I('post.name'),
                    'content' => I('post.content'),
                    'logopath' => $logopath,
                    'imagepath' => $productpath,
                    'score' => I('post.score'),
                    'categoryid' => I('post.category'),
                    'price' => I('post.price'),
                    'totalnums' => I('post.totalnums'),
                    'lastnums' => I('post.lastnums'),
                    'isonline' => I('post.isonline'),
                );
                $this->Product->add($newdata);
                $this->redirect('Product/index');
            }
        } else {
            $this->display("Product/productedit");
        }
    }

    public function editproduct(){
        //$this->checkPriv('9_1_3');
        $this->assign('act', 'edit');
        $this->assign('errcode', '0');
        $cates = getSortedCategory($this->categoryLogic->getCategoryList());
        $this->assign('cate',$cates);
        if (I('post.act') == 'edit') {
            $id=I('post.id','','int');

            $uploadimg = $this->upimgfile();
            $logopath = $uploadimg['result']['logoimg']['fullpath'];
            $productpath = $uploadimg['result']['productimg']['fullpath'];

            if($logopath['error'] == false){
                $newdata['logopath'] = $logopath['result']['coverimg']['fullpath'];
            }

            $newdata = array(
                'productname' => I('post.name'),
                'content' => I('post.content'),
                'logopath' => $logopath,
                'imagepath' => $productpath,
                'score' => I('post.score'),
                'categoryid' => I('post.cid'),
                'price' => I('post.price'),
                'totalnums' => I('post.totalnums'),
                'lastnums' => I('post.lastnums'),
                'isonline' => I('post.isonline'),
            );
            $this->Product->where('id=' . $id)->save($newdata);
            $this->redirect('Product/index');
        } else {
            $id=I('get.id','','int');
            if ($id) {
                $this->data = $this->Product->getById($id);
                $this->display("Product/productedit");
            } else {
                $this->error('无效记录');
            }
        }
    }


    public function delproduct(){
        //$this->checkPriv('9_1_4');
        $id=I('get.id','','int');
        if($id){
            $this->Product->where('id='.$id)->delete();
            $this->redirect('Product/index');
        }else{
            $this->error('没有该记录');
        }
    }

    public function userproductmgr(){
        $p = getCurPage();
        $res = $this->ProductLogic->getUserProductList(array(),$p);
        $this->data = $res;
        $this->total = $this->ProductLogic->getUserProductTotal(array());
        $show = constructAdminPage($this->total);
        $this->assign('page',$show);
        $this->display();
    }

    private function upimgfile(){
        $ret = array();
        $upload =  new \Think\Upload();
        $upload->maxSize       = C('ITEM_IMG_MAXSIZE');;
        $upload->exts          = array('jpg', 'jpeg', 'png', 'gif', 'bmp');
        $upload->rootPath      = C('ITEM_PRODUCT_PATH');
        $upload->subName       = array('date', 'Ym');
        $upfinfo = $upload->upload();
        if(!$upfinfo) {// 上传错误提示错误信息
            $ret['error'] = true;
            $ret['result'] = $upload->getError();
        }else{// 上传成功
            foreach($upfinfo as $k=>&$file){
                $file['fullpath'] = $upload->rootPath.$file['savepath'].$file['savename'];
            }
            $ret['error'] = false;
            $ret['result'] = $upfinfo;
        }
        return $ret;
    }
}