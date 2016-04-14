<?php
namespace Api\Controller;
use Think\Controller;
class AdsController extends Controller {
    public function __construct()
    {

        $this->appLogic = D('App', 'Logic');
        $this->videoLogic = D('Video', 'Logic');
        $this->bannerLogic = D('Banner', 'Logic');
    }

    private $appLogic;
    private $videoLogic;
    private $bannerLogic;
    /**
     * 获取splash广告
     * @return json : data
     */
    public function splash() {
        $ret = array(
            "img" => "http://api.pinet.co/application/static/img/splash.png",
            "title" => "美菱冰箱"
        );
        $this->ajaxReturn($ret);
    }
    /**
     * 获取banner广告
     * @return json : data
     */
    public function banner() {
        $p = getCurPage();
        $where['end_time']=array('gt',date('Y-m-d H:i:s'));
        $res = $this->bannerLogic->getBannerList($where,$p);
        $this->ajaxReturn($res);
    }

    /**
     * 游戏幻灯片信息获取接口
     * @param int type : （可选）类型：0:视频 1:游戏（默认）  2:应用
     * @return json : data
     */
    public function getappimgs()
    {
	    $type = I('post.type',null,'int');
	    if(!in_array($type,array('0','1','2'))){
		    $mycond['apptype'] = '1';
	    }else{
		    $mycond['apptype'] = $type;
	    }
	    $mycond['slide'] = '1';
	    $mycond['status'] = '1';
	    $mycond['_string'] = 'isdel is null';
        $data = $this->appLogic->getAppList($mycond);
        $this->ajaxReturn($data);
    }

    /**
     * 视频图片信息获取接口
     * @param int id : 必填
     * @return json : data
     */
    public function getimg(){
        $uuid = I('post.id');
        $data = $this->videoLogic->getimgById($uuid);
        foreach($data as $v){
            $cover['img'] =  C('MMS_SERVER').'/'.$uuid.'/'.$v['cover'];
        }
        $this->ajaxReturn($cover);
    }


}