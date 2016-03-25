<?php
/**
 * 网站路由配置
 * @package YiCms
 * @author YiCms
 **/
return array(
	/*路由设置*/
	'URL_ROUTER_ON'   => true,                // 开启路由
	'URL_ROUTE_RULES' => array(               // 定义路由规则
		'Api/PromotedVideos' => 'Api/Video/videos',      // 视频信息 推荐
		'Api/GetVideoInfo'   => 'Api/Video/videos',      // 视频收缩
		'Api/PromotedApps'   => 'Api/Games/games',       // 游戏推荐
		'Api/GetApps'        => 'Api/Games/games',       // 游戏APP搜索
		'Api/GetPopApps'     => 'Api/Games/getPopApps',  // 游戏人气最高
		'Api/GetLastMonthHotApps'   => 'Api/Games/getMonthPopApps',     //上月精品游戏推荐




		'video/columns'      => 'Api/Video/columns',     // 视频列表
		'video/category'     => 'Api/Video/category',    // 视频分类
		'video/areas'        => 'Api/Video/areas',       // 视频区域
		'video/years'        => 'Api/Video/years',       // 视频所在年份
		'video/movieBanner'  => 'Api/Video/movieBanner', // 电影banner
		'video/dramaBanner'  => 'Api/Video/dramaBanner', // 电视剧banner
		'video/play'         => 'Api/Video/play',        // 视频播放记录
	//	'api/games'          => 'Api/Games/games',       // 获取游戏信息
		'games/category'     => 'Api/Games/category',    // 游戏分类
		'games/banner'       => 'Api/Games/banner',      // 游戏banner
		'games/download'     => 'Api/Games/download',    // 游戏下载统计
		'games/hm'           => 'Api/Games/igames'       // 爱游戏资料同步
	)
);
