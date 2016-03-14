<?php
namespace Api\Controller;
use Think\Controller;
class ConfigController extends Controller
{
    public function __construct()
    {
        parent::__construct();
    }


    /**
     * 后台增加系统配置参数和参数查询接口
     * @return json : data
     */
    public function GetSysSetting()
    {
        $data = C('GetSysSetting');
        $this->ajaxReturn($data);
    }
}