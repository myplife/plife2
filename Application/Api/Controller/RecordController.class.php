<?php
namespace Api\Controller;
use Think\Controller;
class RecordController extends Controller {
    public function __construct(){
        $this->Res = D('Resource','Logic');
        $this->Video=  M('Video');
        $this->App=  M('App');
        $this->Operation= M('Operation');
    }
    private $Res;
    private $App;
    private $Video;
    private $Operation;
    /**
     * 下载计数统计接口
     * 参数：
     * @param int id : （必填）应用id
     */
    public function download(){
        $id = I('post.id','','int');
        if($id) {
            $data = $this->Res->getAppById($id);
            $arr['downtimes'] = $data['downtimes']+1;
            $this->App->where('id='.$id)->save($arr);
        }
        echo  $arr['downtimes']?$arr['downtimes']:0;
    }

    /**
     * 播放计数统计接口
     * 参数：
     * @param int id : （必填）视频id
     */
    public function play(){
        $id = I('post.id','','int');
        if($id) {
            $data = $this->Res->getVideoById($id);
            $arr['viewtimes'] = $data['viewtimes']+1;
            $this->Video->where('id='.$id)->save($arr);
        }
        echo  $arr['viewtimes']?$arr['viewtimes']:0;
    }

    /**
     * 用户操作记录
     * 参数：
     * '应用类型：0.下载app 1.视频播放 2.搜索 3.阅读图书 4.打开广告 5.查询 6.打开游戏 7.打开应用'
     */
    public function OperationRecord(){
        $data['uid'] ='1001';
        $data['operation'] = 1;
        $data['creatime'] = date("Y-m-d H:i:s");
        if(isset($data)){
            $this->Operation->add($data);
            $data['rst'] = 0;
            $data['msg'] = 'Add info successes';
        }else{
            $data['rst'] = -1;
            $data['msg'] = 'Add info failed';
        }
        $this->ajaxReturn($data);
    }

}