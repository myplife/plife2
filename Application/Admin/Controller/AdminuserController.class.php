<?php
namespace Admin\Controller;
use Think\Controller;
class AdminuserController extends Controller {
    public function chgpasswd(){
        if(IS_POST){
            if(I('post.passwordnew') != I('post.passwordnew2')){
                $this->error('两次输入的密码不一样，请重新输入！');
            }else{
                $uid = session('adminid');
                $Admin = M('user');
                $admininfo = $Admin->getByUserid($uid);

                if( $admininfo['password'] ==  TransPassUseSalt(I('post.password'), $admininfo['salt'])){
                    $data = array(
                        'password'=>TransPassUseSalt(I('post.passwordnew'), $admininfo['salt'])
                    );
                    $Admin->where(array('uid'=>$uid))->save($data);
                    $this->error('恭喜您，修改密码成功！');
                }else{
                    $this->error('原始密码有误，请重新输入！');
                }
            }
        }else{
            $this->display();
        }

    }
    public function login(){
        if(IS_POST){
            $Admin = M('user');
            $admininfo = $Admin->getByUsername(I('post.user'));
            if($admininfo != null){
                if((int)$admininfo['status'] == 1){
                    $this->errmsg  = '账户被冻结无法登陆！';
                }else{
                    $tpass = TransPassUseSalt(I('post.pass'), $admininfo['salt']);
                    if($tpass == $admininfo['password']){
                        session('expire',300);
                        session('name', $admininfo['nickname']);
                        session('username', $admininfo['username']);
                        session('adminid', $admininfo['uid']);
                        session('issuper', (int)$admininfo['issuper']);
                        if($admininfo['privgid']){
                            $Admingroup = M('Admingroup');
                            $privinfo = $Admingroup->getById($admininfo['privgid']);
                            $spriv = explode(',',$privinfo['priv']);
                            $this->initmenu($spriv);
                            session('privs', $spriv);
                        }else if(session('issuper')){
                            $this->initmenu(array());
                        }
                        $this->redirect('Index/index',0);
                    }else{
                        $this->errmsg  = '账户名或密码错误！';
                    }
                }
            }else{
                $this->errmsg  = '你不是管理员吧？';
            }
        }
        $this->display();
    }

    private function initmenu($privarr){
        $allmenu = array('1_1_0','1_2_0','1_3_0','1_4_0','1_5_0','2_0','2_1_0','2_2_0','3_0','4_1_0','4_2_0','5_0','6_0','9_1_0','9_2_0','9_3_0','7_0');
        $truemenu = array();
        if(session('issuper')){
            $truemenu = $allmenu;
        }else{
            foreach($allmenu as $m){
                if (in_array($m, $privarr)) {
                    $truemenu[] = $m;
                }
            }
        }
        session('menupriv',$truemenu);
        return true;
    }

    public function logout(){
        session('[destroy]');
        $this->redirect('Adminuser/login',0);
    }
}