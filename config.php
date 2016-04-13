<?php
return array(
	//'配置项'=>'配置值'
	'DB_TYPE'   => 'mysql', 
    'DB_HOST'   => 'localhost',
    'DB_NAME'   => 'plife',
    'DB_USER'   => 'root',
    'DB_PWD'    => 'mysql',
    'DB_PORT'   => 3306, 
    'DB_PREFIX' => 'pl_',
    'URL_CASE_INSENSITIVE' =>true, 
    'SITE_NAME'	=>'Pinet',
    'ITEM_IMG_MAXSIZE' => 4194304,
    'ITEM_FILE_SIZE' => 52428800,
    'ITEM_IMG_PATH' => 'Upload/Img/',
    'ITEM_FILE_PATH' => 'Upload/File/',
    'ADMIN_REC_PER_PAGE'=>10,
    'AUTOLOAD_NAMESPACE' => array(
        'CommLib' => COMMON_PATH.'CommLib',
    ),
    'LOAD_EXT_CONFIG'		=> 'route'
    //'TMPL_EXCEPTION_FILE'   =>  './Application/Admin/View/Public/404.html',
    //'ERROR_PAGE'=>'./Application/Admin/View/Public/404.html',
);
