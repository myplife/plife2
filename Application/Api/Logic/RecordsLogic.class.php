<?php
 /*
 * created by vim.
 * User: Jason Hu
 * Date: 2016-03-07
 * Time: 18:50
 * */

namespace Api\Logic;


class recordsLogic extends \Think\Model{

	private $recordsModel;

	public function __construct(){
		$this->recordsModel = M('records');
	}

	public function addRecords($condition=array()){
		if(!empty($condition)){
			$this->recordsModel->add($condition);
		}
	}
}

