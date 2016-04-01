# ************************************************************
# Sequel Pro SQL dump
# Version 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.6.25)
# Database: plife
# Generation Time: 2016-03-25 12:04:59 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table pl_admin
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pl_admin`;

CREATE TABLE `pl_admin` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '会员ID',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态1,被冻结，0正常',
  `lastLoginDate` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后访问日期',
  `lastLoginIP` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后访问IP',
  `username` char(16) NOT NULL COMMENT '名称',
  `nickname` char(16) NOT NULL DEFAULT '' COMMENT '昵称',
  `salt` char(4) NOT NULL COMMENT '干扰码',
  `password` char(32) NOT NULL COMMENT '密码',
  `privgid` int(8) NOT NULL COMMENT '所属权限组id，对应admingroup:id',
  `issuper` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否超级管理员，0：否 1：是',
  `totalscore` int(10) NOT NULL COMMENT '用户积分',
  `token` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`uid`,`totalscore`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='用户表';

LOCK TABLES `pl_admin` WRITE;
/*!40000 ALTER TABLE `pl_admin` DISABLE KEYS */;

INSERT INTO `pl_admin` (`uid`, `status`, `lastLoginDate`, `lastLoginIP`, `username`, `nickname`, `salt`, `password`, `privgid`, `issuper`, `totalscore`, `token`)
VALUES
	(1001,0,0,0,'admin','管理员','8fd6','b410b1009da19c734664d4f91791a8ee',3,0,7305,NULL),
	(1002,0,0,0,'richard','Richard','4b5s','d5464aff7ebe70fe9fd375339db91564',0,1,100,NULL),
	(1004,0,0,0,'bigger','BigWang','wd2p','0db8e7fa929e9cc13ace3fab3250be98',3,0,0,NULL),
	(1005,0,0,0,'lotus','新用户','pd8n','e3e7bbd7356034ab21e58b8a789789f8',3,0,0,NULL),
	(1006,0,0,0,'ttddfff','ee33s','dnpn','532df0cf03563c0afd14e21c60fa8c5a',1,0,0,NULL),
	(1007,0,0,0,'fdsa','','3s6a','176a03a182fee032600b474d1b6a3fda',3,0,0,NULL),
	(1008,0,0,0,'王颖','Amanda','k52z','2540b87b0f78278623639a2852fca576',1,0,0,NULL),
	(1009,0,0,0,'苏丽','suli','150o','2fc03e1e95b5c753e53f15496ed3b975',0,0,0,NULL),
	(2247,0,0,0,'kiss','zhaosheng','biji','9e69830d438a99da18429485e28adf62',0,0,0,'TUy5SOPiSvU4qb4zfLHGFBaEGb0gW+1sp6uaa9eyPtD6y9oiNB/uhfFtYd4XEqHfcttvfsnZIQeHNTedpQw/ZehTSn4cFWXstwNfqWaC7Totfz1Dxzvx/ilX2PcDsdKppTU1iqZMQHI3959LVXpwOFqo7AaXVqj/oPKu/lbdCz8=');

/*!40000 ALTER TABLE `pl_admin` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table pl_admingroup
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pl_admingroup`;

CREATE TABLE `pl_admingroup` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `groupname` varchar(100) NOT NULL COMMENT '管理员组名',
  `groupdesc` varchar(500) NOT NULL COMMENT '管理员组描述',
  `priv` text NOT NULL COMMENT '管理员组权限',
  `isban` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否冻结 0：正常 1：冻结',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='该表用于记录后台管理员权限组';

LOCK TABLES `pl_admingroup` WRITE;
/*!40000 ALTER TABLE `pl_admingroup` DISABLE KEYS */;

INSERT INTO `pl_admingroup` (`id`, `groupname`, `groupdesc`, `priv`, `isban`)
VALUES
	(1,'测试用户','测试用户，拥有部分浏览权限','1_1_0,1_1_1,1_1_2,1_1_3,1_1_4,1_2_0,1_2_1,1_2_2,1_2_3,1_3_0,1_3_1,1_3_2,2_0,2_1,9_1_0',0),
	(2,'文章编辑人员2','负责文章分类和编辑的人员','5_1_0,5_1_1,5_1_2,5_1_3,5_2_0,5_2_1,5_2_2,5_2_3,5_2_4,5_2_5,10_1_1',0),
	(3,'管理员组','拥有所有权限的管理员','2_1_0,2_2_0,1_4_0,1_4_1,1_4_2,1_4_3,1_5_0,1_6_0,1_1_0,1_1_1,1_1_2,1_1_3,1_1_4,1_2_0,1_2_1,1_2_2,1_2_3,1_2_4,1_3_0,1_3_1,1_3_2,1_3_3,1_3_4,2_0,2_1,2_2,2_3,2_4,3_0,9_1_0,9_1_1,9_1_2,9_1_3,9_1_4,9_1_5,9_2_0,9_2_1,9_2_2,9_2_3,9_2_4,9_2_5,9_3_0,4_1_0,4_2_0,5_0,6_0',0);

/*!40000 ALTER TABLE `pl_admingroup` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table pl_app
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pl_app`;

CREATE TABLE `pl_app` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `bid` int(8) NOT NULL,
  `name` varchar(100) NOT NULL,
  `apptype` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '应用类型：1.游戏 2.应用',
  `icon` varchar(100) NOT NULL,
  `slogon` varchar(400) NOT NULL,
  `package` varchar(300) NOT NULL COMMENT '包名',
  `imgs` varchar(500) NOT NULL COMMENT '应用 截图',
  `pubdate` date NOT NULL COMMENT '该版本发布时间',
  `isfree` varchar(200) NOT NULL COMMENT '资费情况',
  `version` varchar(50) NOT NULL,
  `size` varchar(30) NOT NULL,
  `intro` varchar(500) NOT NULL COMMENT '介绍',
  `tags` varchar(500) NOT NULL COMMENT '应用标签，用逗号分割',
  `filepath` varchar(100) NOT NULL,
  `pubuser` varchar(200) NOT NULL COMMENT '发布者信息',
  `recommendtxt` varchar(500) DEFAULT NULL COMMENT '推荐语',
  `updatetxt` varchar(500) DEFAULT NULL COMMENT '当前版本升级信息',
  `isrecommend` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否推荐 0:不推荐 1:推荐',
  `downtimes` int(8) unsigned NOT NULL DEFAULT '0',
  `creatime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态：1.上架 2.下架',
  `isdel` timestamp NULL DEFAULT NULL,
  `uuid` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `pl_app` WRITE;
/*!40000 ALTER TABLE `pl_app` DISABLE KEYS */;

INSERT INTO `pl_app` (`id`, `bid`, `name`, `apptype`, `icon`, `slogon`, `package`, `imgs`, `pubdate`, `isfree`, `version`, `size`, `intro`, `tags`, `filepath`, `pubuser`, `recommendtxt`, `updatetxt`, `isrecommend`, `downtimes`, `creatime`, `status`, `isdel`, `uuid`)
VALUES
	(1,0,'斗地主1',1,'','全民斗地主','','','0000-00-00','','2.2.1','23.3','纸牌','纸牌,游戏','','','斗地主','全民',1,40,'2015-11-21 15:48:44',1,'2015-11-21 16:12:36','xxxxx'),
	(2,6,'微信1',2,'Upload/Img/201601/568cae79f27c8.png','人人','','[\"Upload\\/Img\\/201601\\/568c6fbdb94bf.png\",\"Upload\\/Img\\/201601\\/568c6fc16e9d4.png\"]','2015-11-21','','2.3.4','444','交友','益智休闲','Upload/File/201601/56a0c5eeb0e96.apk','','纯玩','方法',0,7,'2015-11-21 16:49:56',1,NULL,'yyyy'),
	(3,0,'斗地主',1,'','全民斗','','','2015-10-22','','1.3','23','大家一起玩','纸牌','','','经典','地主',1,3,'2015-12-01 20:55:18',1,NULL,'cccc'),
	(4,6,'水果忍者',1,'','切蔬果','werwerw','\"\"','2014-12-09','','1.09','15M','没有详情','策略塔防','Upload/File/201601/56a0c6a16ae5a.apk','','没有详情','12。08',1,2,'2015-12-03 15:52:57',1,NULL,'vvvvv'),
	(9,6,'水果忍者',1,'','切蔬果','werwerw','\"\"','2014-12-09','','1.09','15M','没有详情','策略塔防','Upload/File/201601/56a0c6a16ae5a.apk','','没有详情','12。08',1,2,'2015-12-03 15:52:57',1,NULL,'bbbb');

/*!40000 ALTER TABLE `pl_app` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table pl_banner
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pl_banner`;

CREATE TABLE `pl_banner` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT 'banner类型：0.图片 1.Flash 2.代码 3.文字',
  `img` varchar(500) NOT NULL,
  `content` longtext NOT NULL,
  `url` varchar(400) NOT NULL,
  `pid` int(8) unsigned NOT NULL DEFAULT '0',
  `creatime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `start_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `end_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `sort` varchar(200) NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态：1.上架 2.下架',
  `isdel` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `pl_banner` WRITE;
/*!40000 ALTER TABLE `pl_banner` DISABLE KEYS */;

INSERT INTO `pl_banner` (`id`, `name`, `type`, `img`, `content`, `url`, `pid`, `creatime`, `start_time`, `end_time`, `sort`, `status`, `isdel`)
VALUES
	(5,'广告',3,'','广告','广告',0,'2016-01-07 09:18:36','0000-00-00 00:00:00','0000-00-00 00:00:00','3',2,NULL),
	(6,'新闻',1,'Upload/Img/201601/568f61a030fe8.png','&lt;html&gt;\r\n        &lt;body&gt;\r\n             &lt;script type=&quot;text/javascript&quot;&gt;\r\n                   document.write(&quot;Hello World!&quot;)\r\n             &lt;/script&gt;\r\n        &lt;/body&gt;\r\n&lt;/html&gt;','www.hict.cc',0,'2016-01-07 11:10:22','2016-01-07 12:18:00','2016-01-22 14:30:00','1',1,NULL),
	(7,'广告',1,'','广告','www.hict.cc',0,'2016-01-08 14:51:54','2016-01-08 14:51:00','2016-01-28 14:51:00','3',1,NULL),
	(8,'',1,'','','',0,'2016-01-12 10:45:48','0000-00-00 00:00:00','0000-00-00 00:00:00','',1,NULL),
	(9,'首页类别',0,'Upload/Img/201603/56e7b0e67cd58.png','这个不错的！','http://localhost/~morganzhao/plife/index.php/Ads/addbanner.html',0,'2016-02-22 16:46:38','2016-02-22 16:46:00','2016-03-29 16:46:00','1',1,NULL);

/*!40000 ALTER TABLE `pl_banner` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table pl_book
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pl_book`;

CREATE TABLE `pl_book` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` tinyint(1) NOT NULL,
  `isdel` timestamp NULL DEFAULT NULL,
  `createdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `pl_book` WRITE;
/*!40000 ALTER TABLE `pl_book` DISABLE KEYS */;

INSERT INTO `pl_book` (`id`, `status`, `isdel`, `createdate`)
VALUES
	(17,1,NULL,'2016-02-23 09:42:41'),
	(18,1,NULL,'2016-02-24 17:44:46');

/*!40000 ALTER TABLE `pl_book` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table pl_bookparam
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pl_bookparam`;

CREATE TABLE `pl_bookparam` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0',
  `bookid` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `bno` varchar(500) DEFAULT NULL,
  `readcount` varchar(500) DEFAULT NULL,
  `img` varchar(500) DEFAULT NULL,
  `authorno` varchar(500) DEFAULT NULL,
  `author` varchar(50) DEFAULT NULL,
  `press` varchar(50) DEFAULT NULL,
  `chapter` varchar(150) DEFAULT NULL,
  `chaptertitle` varchar(50) NOT NULL,
  `chapteraddress` varchar(150) DEFAULT NULL,
  `chaptercontent` text,
  `cid` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `sort` varchar(200) DEFAULT NULL,
  `isread` timestamp NULL DEFAULT NULL,
  `isdel` timestamp NULL DEFAULT NULL,
  `createdate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modifydate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`),
  KEY `uid` (`uid`),
  KEY `pn2_bookparam_ibfk_1` (`bookid`),
  CONSTRAINT `pl_bookparam_ibfk_1` FOREIGN KEY (`bookid`) REFERENCES `pl_book` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `pl_bookparam` WRITE;
/*!40000 ALTER TABLE `pl_bookparam` DISABLE KEYS */;

INSERT INTO `pl_bookparam` (`id`, `pid`, `bookid`, `name`, `bno`, `readcount`, `img`, `authorno`, `author`, `press`, `chapter`, `chaptertitle`, `chapteraddress`, `chaptercontent`, `cid`, `uid`, `sort`, `isread`, `isdel`, `createdate`, `modifydate`)
VALUES
	(15,0,17,'完美世界','NO001',NULL,'Upload/Img/201602/56ce6cda21fba.png','','辰东','辰东',NULL,'',NULL,NULL,33,NULL,'1',NULL,NULL,'2016-02-23 10:05:22','0000-00-00 00:00:00'),
	(18,15,17,'朝气蓬勃',NULL,NULL,NULL,NULL,NULL,NULL,'第一章','朝气蓬勃','http://www.bxwx.org/b/70/70093/11969970.html','&lt;p&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none; background-color: rgb(229, 236, 243);&quot;&gt;石村，位于苍莽山脉中，四周高峰大壑，茫茫群山巍峨。&lt;/span&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none; background-color: rgb(229, 236, 243);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;清晨，朝霞灿灿，仿若碎金一般洒落，沐浴在人身上暖洋洋。&lt;/span&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none; background-color: rgb(229, 236, 243);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;一群孩子，从四五岁到十几岁不等，能有数十人，在村前的空地上迎着朝霞，正在哼哈有声的锻炼体魄。一张张稚嫩的小脸满是认真之sè，大一些的孩子虎虎生风，小一些的也比划的有模有样。&lt;/span&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none; background-color: rgb(229, 236, 243);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;一个肌体强健如虎豹的中年男子，穿着兽皮衣，皮肤呈古铜sè，黑发披散，炯炯有神的眼眸扫过每一个孩子，正在认真指点他们。&lt;/span&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none; background-color: rgb(229, 236, 243);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;“太阳初升，万物初始，生之气最盛，虽不能如传说中那般餐霞食气，但这样迎霞锻体自也有莫大好处，可充盈人体生机。一天之计在于晨，每rì早起多用功，强筋壮骨，活血炼筋，将来才能在这苍莽山脉中有活命的本钱。”站在前方、指点一群孩子的中年男子一脸严肃，认真告诫，而后又喝道：“你们明白吗？”&lt;/span&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none; background-color: rgb(229, 236, 243);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;“明白！”一群孩子中气十足，大声回应。&lt;/span&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none; background-color: rgb(229, 236, 243);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;山中多史前生物出没，时有遮蔽天空之巨翼横过，在地上投下大片的yīn影，亦有荒兽立于峰上，吞月而啸，更少不了各种毒虫伏行，异常可怖。&lt;/span&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none; background-color: rgb(229, 236, 243);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;“明白呀。”一个明显走神、慢了半拍的小家伙nǎi声nǎi气的叫道。&lt;/span&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none; background-color: rgb(229, 236, 243);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;这是一个很小的孩子，只有一两岁的样子，刚学会走路没几个月，也在跟着锻炼体魄。显然，他是自己凑过来的，混在了年长的孩子中，分明还不应该出现在这个队伍里。&lt;/span&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none; background-color: rgb(229, 236, 243);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;“哼哼哈嘿！”小家伙口中发声，嫩嫩的小手臂卖力的挥动着，效仿大孩子们的动作，可是他太过幼小，动作歪歪扭扭，且步履蹒跚，摇摇摆摆，再加上嘴角间残留的白sènǎi渍，引人发笑。&lt;/span&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none; background-color: rgb(229, 236, 243);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;一群大孩子看着他，皆挤眉弄眼，让原本严肃的晨练气氛轻缓了不少。&lt;/span&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none; background-color: rgb(229, 236, 243);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;小不点长的很白嫩与漂亮，大眼睛乌溜溜的转动，整个人像是个白瓷娃娃，很可爱，稚嫩的动作，口中咿咿呀呀，憨态可掬。这让另一片场地中盘坐在一块块巨石上正在吞吐天jīng的一些老人也都露出笑容。&lt;/span&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none; background-color: rgb(229, 236, 243);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;就是那些身材高大魁梧、上半身**、肌腱光亮并隆起的成年男子们，也都望了过来，带着笑意。他们是村中最强壮的人，是狩猎与守护这个村落的最重要力量，也都在锻体，有人握着不知名的巨兽骨骼打磨而成的白骨大棒，也有人持着黑sè金属铸成的阔剑，用力舞动，风声如雷。&lt;/span&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none; background-color: rgb(229, 236, 243);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;生存环境极其恶劣，多洪荒猛兽毒虫，为了食物，为了生存，很多男子还未成年就过早夭折在了大荒中，想要活下去，唯有强壮己身。清晨用功，无论是成年人，亦或是老人与孩子，这是每一个人自幼就已养成的习惯。&lt;/span&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none; background-color: rgb(229, 236, 243);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;“收心！”负责督促与指导孩子练功的中年男子大声喊道。一群孩子赶紧认真了起来，继续在柔和与灿烂的朝霞中锻炼。&lt;/span&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none; background-color: rgb(229, 236, 243);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;“呼……咿呀，累了。”小不点长出了一口气，一屁墩儿坐在了地上，看着大孩子们锻炼体魄。可仅一会儿工夫他就被分散了注意力，站起身来，摇摇摆摆，冲向不远处一只正在蹦蹦跳跳的五sè雀，结果磕磕绊绊，连摔了几个屁墩儿，倒也不哭，气呼呼，哼哼唧唧爬起来再追。&lt;/span&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none; background-color: rgb(229, 236, 243);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;“好了，收功！”&lt;/span&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none; background-color: rgb(229, 236, 243);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;随着一声大喝，所有孩子都一阵欢呼，揉了揉酸疼的手脚，而后一哄而散，冲向各自的家中，准备吃早饭。&lt;/span&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none; background-color: rgb(229, 236, 243);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;老人们都笑了，自巨石上起身。而那些身材健壮如虎的成年人则是一阵笑骂，数落着自己的孩子，拎着骨棒与阔剑也快步向自家中走去。&lt;/span&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none; background-color: rgb(229, 236, 243);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;石村不是很大，男女老少加起来能有三百多人，屋子都是巨石砌成的，简朴而自然。&lt;/span&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none; background-color: rgb(229, 236, 243);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;在村头有一截巨大的雷击木，直径十几米，此时主干上唯一的柳条已经在朝霞中掩去了莹光，变得普普通通了。&lt;/span&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none; background-color: rgb(229, 236, 243);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;“噢，居然有土龙肉，给我一块！”&lt;/span&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none; background-color: rgb(229, 236, 243);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;这些孩子都很活泼与好动，即便吃饭时也都不太老实，不少人抱着陶碗从自家出来，凑到了一起。&lt;/span&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none; background-color: rgb(229, 236, 243);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;石村周围草木丰茂，猛兽众多，可守着大山，村人的食物相对来说却算不上丰盛，只是一些粗麦饼、野果以及孩子们碗中少量的肉食。&lt;/span&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none; background-color: rgb(229, 236, 243);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;事实上，食物不充裕对于石村来说一直是一个很严重的问题。山脉中十分危险，那些异兽凶禽过于强大与恐怖，每一次去狩猎都可能会有人丢掉xìng命。&lt;/span&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none; background-color: rgb(229, 236, 243);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;如果有选择，村人是不愿进山的。因为进山就意味着可能会有流血与牺牲。&lt;/span&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none; background-color: rgb(229, 236, 243);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;食物对于他们来说非常宝贵，容不得浪费，每一个孩子从小就懂得这一点，饥饿、食物、狩猎、xìng命、鲜血这些是相连的。&lt;/span&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none; background-color: rgb(229, 236, 243);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;村头是老族长石云峰的院落，由巨石堆砌而成，紧挨着焦黑而巨大的柳木。院内的灶台前，陶罐内白sè汁液沸腾，nǎi香扑鼻，他正在熬煮兽nǎi，此外不时将一些药草等投放进去，以木勺慢慢搅动。&lt;/span&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none; background-color: rgb(229, 236, 243);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;不多时，老人喊道：“小不点，过来吃东西。”&lt;/span&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none; background-color: rgb(229, 236, 243);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;小不点在半岁时就失去了父母，是吃百兽nǎi长大的，而今已经一岁零几个月了，若是寻常的孩子早该断nǎi了，而他却依旧吃的很香甜，不肯断掉，常被大一些的孩子取笑。&lt;/span&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none; background-color: rgb(229, 236, 243);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;“咿呀，呼……跑不动了。”他一直在锲而不舍地追那只五sè雀，早已气喘吁吁，此时一屁股坐在了地上。&lt;/span&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none; background-color: rgb(229, 236, 243);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;“小不点吃nǎi喽！”一群大孩子起哄。&lt;/span&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none; background-color: rgb(229, 236, 243);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;“你们这群小皮猴子，还不都是从他这个年龄过来的。”老族长笑骂道。&lt;/span&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none; background-color: rgb(229, 236, 243);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;“我们可没有在一岁半时还在吃nǎi，嘿嘿。”&lt;/span&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none; background-color: rgb(229, 236, 243);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;面对大孩子的取笑，小不点憨憨的笑着，黑亮的大眼眯成了月牙状，毫不在乎，坐在陶罐前用木勺舀nǎi，吃的很香甜。&lt;/span&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none; background-color: rgb(229, 236, 243);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;早饭过后，村中几名年岁很大的老人一起来到族长石云峰的院子中，虽然早已须发皆白，但jīng气神都还很足。&lt;/span&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none; background-color: rgb(229, 236, 243);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;“最近不太对劲啊，深夜总是有大家伙路过，动静实在太大了，这山脉深处一定发生了什么。”&lt;/span&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none; background-color: rgb(229, 236, 243);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;“唔，昨天夜里我被惊醒了几次，皮骨发寒，一定是有什么洪荒凶兽与大虫从这里路过。”&lt;/span&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none; background-color: rgb(229, 236, 243);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;几名老人先后开口，他们或蹙眉或深思，讨论最近的一些危险征兆，觉得有不同寻常的事情发生了。&lt;/span&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none; background-color: rgb(229, 236, 243);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;“我觉得这大荒深处可能出了了不得的东西，引起了周围地域一些太古遗种的注意，纷纷赶过去了。”老族长石云峰思忖后说道。&lt;/span&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none; background-color: rgb(229, 236, 243);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;“该不会是出了山宝吧？”一个老人顿时瞪圆了眼睛，须发皆张，露出惊容。&lt;/span&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none; background-color: rgb(229, 236, 243);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;其他人也都露出异sè，眼神火热，但很快又都熄灭了眸中的火焰，那种东西不是他们能得到的，远在山脉最深处，没人进的去。&lt;/span&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none; background-color: rgb(229, 236, 243);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;这么多年来从未有人能活着进出一趟，山中各种强横物种出没，即便石村所有人齐闯，也连一朵浪花都不会泛起。&lt;/span&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&amp;lt;br style=&amp;quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left;&',NULL,NULL,'2',NULL,NULL,'2016-02-23 15:19:07','0000-00-00 00:00:00'),
	(22,15,17,'骨文',NULL,NULL,NULL,NULL,NULL,NULL,'第二章','骨文','http://www.bxwx.org/b/70/70093/11969974.html','&lt;p&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none; background-color: rgb(229, 236, 243);&quot;&gt;在族长与一些老入的祷告下，所有青壮年都露出郑重之sè，进行礼拜。而不少妇孺也都赶了过来，默默祈祷，祈求去狩猎的亲入可以无恙的回来。&lt;/span&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none; background-color: rgb(229, 236, 243);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;山脉中太危险，离开柳木守护的村子，外面将是一个完全不同的世界，那里充满了恐怖的猛禽与巨兽。&lt;/span&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none; background-color: rgb(229, 236, 243);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;就这样，村中最强壮的一批入背着巨弓、带着阔剑出发了，走进了山川大泽间，顿时一股大荒气息迎面扑来。&lt;/span&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none; background-color: rgb(229, 236, 243);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;目送狩猎队伍离去，老族长石云峰领着一群孩子来到村头的草地上，盘坐下来，道：“好了，你们这群皮猴子也该用功学习了。”&lt;/span&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none; background-color: rgb(229, 236, 243);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;一群孩子顿时愁眉苦脸，一个个没jīng打采，不情不愿的围坐在了四周，像是晒蔫了的叶子一般。&lt;/span&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none; background-color: rgb(229, 236, 243);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;“族长爷爷，那些鸟文龟字像鬼怪符一样复杂，实在难学，用心记它做什么？”&lt;/span&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none; background-color: rgb(229, 236, 243);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;“就是o阿，还不如阿爸教我的箭法有用呢！”&lt;/span&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none; background-color: rgb(229, 236, 243);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;一群孩子全都是苦瓜脸，很抵触。&lt;/span&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none; background-color: rgb(229, 236, 243);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;“你们这群娃子真不晓事理，骨文是强横的太古遗种夭生显化在骨骼上的符号，蕴含了神秘莫测的力量，多少入想学都没有门路。一旦学有所成，不知会比你们的父辈强大多少倍。”老族长恨铁不成钢，数落他们。&lt;/span&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none; background-color: rgb(229, 236, 243);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;“族长爷爷，你为我们演示一下骨文的力量吧。”有一个稍大些的孩子说道。&lt;/span&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none; background-color: rgb(229, 236, 243);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;“小不点过来。”族长冲着远处喊道。&lt;/span&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none; background-color: rgb(229, 236, 243);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;小不点追完五sè雀后正在卖力拉扯一条大黄狗的尾巴，闻言迷糊的转头，松开手后屁颠屁颠的跑了过来，眨动着明亮的大眼，道：“咿呀咿呀，族长爷爷什么事呀？”&lt;/span&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none; background-color: rgb(229, 236, 243);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;“将我教你的那个骨文使用出来。”石云峰道。&lt;/span&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none; background-color: rgb(229, 236, 243);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;“好呀。”小不点很听话，伸出两只小手，闭上嘴巴，浑身不断用力，憋的小脸都红扑扑了。&lt;/span&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none; background-color: rgb(229, 236, 243);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;“嗡”的一声，他的手心出现一块光亮，浮现出一个奇怪的文字，像是以金属浇铸而成，拥有一种金属光泽与质感，很快另一只手也出现了。&lt;/span&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none; background-color: rgb(229, 236, 243);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;小不点上前走了两步，将一块比他还高的青石抱了起来。&lt;/span&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none; background-color: rgb(229, 236, 243);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;“真厉害！”一群孩子惊呼，那才是一个一岁多的小家伙，怎么能搬起这样一块不小的石头？&lt;/span&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none; background-color: rgb(229, 236, 243);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;“小不点你将吃nǎi的力气都用出来了吧？”大孩子逗他。&lt;/span&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none; background-color: rgb(229, 236, 243);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;“咿呀，是的，力气都用光了。”小不点扔下青石，一屁股坐在了地上，没心没肺的笑着，很纯净，而手心的符文则迅速暗淡、消失。&lt;/span&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none; background-color: rgb(229, 236, 243);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;“族长爷爷，这就是你十几年来研究的神秘骨文力量？”一群孩子双眼放光，与不久前兴趣缺缺的样子截然不同。&lt;/span&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none; background-color: rgb(229, 236, 243);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;“别兴奋，这些只能引你们上路而已，比古代传说中出现的夭骨文还差的远。”老入点了点头，又摇了摇头。&lt;/span&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none; background-color: rgb(229, 236, 243);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;“族长爷爷给我们讲一讲外面的世界吧。”一群孩子露出希冀之sè。&lt;/span&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none; background-color: rgb(229, 236, 243);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;石村中所有入都知道，老族年轻时曾与村中十几个强大的族入去过遥远的大地尽头，在外界闯荡过。&lt;/span&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none; background-color: rgb(229, 236, 243);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;可是十几年前，只有两个入满身是血的回来，其中一入没多久就死去了，唯有石云峰一个入活了下来。&lt;/span&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none; background-color: rgb(229, 236, 243);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;这些年他一直在研究神秘的骨文，不时以村中体质强的入做试验，这些孩子清楚的知道，他们那些强壮如虎龙的父辈每次被叫去时都会在那座石院中发出阵阵令入心颤的嚎叫，让这些孩子过早的产生了抵触与敬畏之心。&lt;/span&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none; background-color: rgb(229, 236, 243);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;直到近年老族长的研究缓和下来，才不怎么令村入害怕了。而且，那吃百兽nǎi与百家饭长起来的小不点被他领养了，成为了最好的研究入选。&lt;/span&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none; background-color: rgb(229, 236, 243);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;“外界o阿……”老入露出回忆之sè，一阵出神与怅然后才道：“世界太大，广袤无垠，从一域到另一域动辄数以百万里，没入知道真正有多么广阔，一个入徒步走上一辈子也走不出一域之地，大荒茫茫无尽。入族不同地域间很难通信往来，因为实在太危险了，大地上强横物种诸多，可怕而神秘，纵然是几十万入的部落或者宏伟的巨城，也可能在一夜间被几头太古遗种毁掉。当然，也有强大到难以想象的入类，媲美其他物种的绝顶战力，神威无匹，可称之为入族夭骄。”&lt;/span&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none; background-color: rgb(229, 236, 243);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;一群孩子心有敬畏，同时也很向往，对未知的世界感到好奇，有入问道：“大地山川间有能让入一夜脱胎换骨的地宝与仙药吗，入族最厉害的夭骄有多么大的威势？”&lt;/span&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none; background-color: rgb(229, 236, 243);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;老入笑了，道：“想知道的话就让自己先强大起来。”&lt;/span&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none; background-color: rgb(229, 236, 243);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;“我们如果掌握了骨文的神秘力量，就能去闯夭下各域吗？”有些孩子露出憧憬之sè。&lt;/span&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none; background-color: rgb(229, 236, 243);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;石云峰摸了摸一个孩子的头，道：“不要说其他各域，就是我们这一域，若是有奇入能横穿一半疆土就了不得了！”&lt;/span&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none; background-color: rgb(229, 236, 243);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;所有孩子都发呆。&lt;/span&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none; background-color: rgb(229, 236, 243);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;“我能做到的仅是把你们引上路，以后究竞走到哪一步要看你们自己，我教给你们的东西应该不会比外界同龄的孩子学到的差。”老入说到最后，眼中露出异光，摸了摸怀中一块奇异的玉骨。&lt;/span&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none; background-color: rgb(229, 236, 243);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;一群孩子围坐在老族长的身边，终于收心，开始认真聆听教诲，一直到午时才散去。&lt;/span&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none; background-color: rgb(229, 236, 243);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;“太难了，族长居然说要几年才有个别入能将少许骨文化入体内，而大多数入可能永远不会成功。”&lt;/span&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none; background-color: rgb(229, 236, 243);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;“可是小不点才豆丁那么大，他居然做到了。”&lt;/span&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none; background-color: rgb(229, 236, 243);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;小不点很无辜的眨巴着大眼，而后又去拉扯那条大黄狗的尾巴了，大黄狗则更无辜的汪汪叫了起来。&lt;/span&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none; background-color: rgb(229, 236, 243);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;红rì西坠，在夕阳的余晖中，整片石村都被染上了一层淡金sè的光彩，远处猿啼虎啸，而这里大片的石屋却宛如远古神庙般神圣、祥宁。&lt;/span&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none; background-color: rgb(229, 236, 243);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;数十入出现在地平线上，被夕阳在地上拉扯出长长的影迹，而身体的轮廓则被晚霞镶上了道道金边，显得无比高大与雄健，几乎每一个入都拖着一头巨大的猛兽，满载而归。&lt;/span&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none; background-color: rgb(229, 236, 243);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;“回来了！”早已站在村头等待多时的一群妇孺一阵欢呼，心中的不安与惶惧一下子消失了，大声的呼喊了起来。&lt;/span&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none; background-color: rgb(229, 236, 243);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;“阿爸他们平安回来了！”&lt;/span&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none; background-color: rgb(229, 236, 243);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;“夭o阿，竞然有这么多的猎物，真是一次罕见的大丰收！”&lt;/span&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none; background-color: rgb(229, 236, 243);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;这次狩猎非常成功，几十名成年男子都有所获，猎物中有体形庞大的龙角象、有状若牛的独足夔兽、还有水桶粗细并生有双翼的飞蟒……&lt;/span&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 30px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none; background-color: rgb(229, 236, ',NULL,NULL,'1',NULL,NULL,'2016-02-23 15:29:00','0000-00-00 00:00:00'),
	(23,15,17,'祭灵',NULL,NULL,NULL,NULL,NULL,NULL,'第三章','祭灵','http://www.bxwx.org/b/70/70093/11969979.html','&lt;p&gt;这里写你的初始化内容&lt;span style=&quot;font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; line-height: 30px; background-color: rgb(229, 236, 243);&quot;&gt;祭台以巨石砌成，很开阔，紧邻折断的老柳树而建，此时上面堆积满了猛兽，如同一座小山似的。&lt;/span&gt;&lt;br style=&quot;font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; line-height: 30px; white-space: normal; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;br style=&quot;font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; line-height: 30px; white-space: normal; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;span style=&quot;font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; line-height: 30px; background-color: rgb(229, 236, 243);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;鲜红的兽血染红了巨石台，沿着石面上的刻图而淌，红艳艳，加之巨兽粗长的兽毛、寒光闪烁的鳞片以及狰狞的巨角等，触目惊心，有一种惨烈的洪荒气息扑面而来。&lt;/span&gt;&lt;br style=&quot;font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; line-height: 30px; white-space: normal; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;br style=&quot;font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; line-height: 30px; white-space: normal; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;span style=&quot;font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; line-height: 30px; background-color: rgb(229, 236, 243);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;在老族长的带领下，石村的男女老少一起祷告，请求柳木庇护，这是一场严肃的祭祀过程，而这也是一种惯例，每次狩猎回来都要进行。&lt;/span&gt;&lt;br style=&quot;font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; line-height: 30px; white-space: normal; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;br style=&quot;font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; line-height: 30px; white-space: normal; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;span style=&quot;font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; line-height: 30px; background-color: rgb(229, 236, 243);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;焦黑的树体如同过去一样寂静，并没有一点反应，一如往rì不曾取用祭品，但是很多村人却知道，它有灵！&lt;/span&gt;&lt;br style=&quot;font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; line-height: 30px; white-space: normal; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;br style=&quot;font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; line-height: 30px; white-space: normal; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;span style=&quot;font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; line-height: 30px; background-color: rgb(229, 236, 243);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;终于，祭祀完毕，人们都长出了一口气，重新浮上了喜悦的笑容，开始搬这些猛兽的尸体，准备去放血、切割。&lt;/span&gt;&lt;br style=&quot;font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; line-height: 30px; white-space: normal; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;br style=&quot;font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; line-height: 30px; white-space: normal; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;span style=&quot;font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; line-height: 30px; background-color: rgb(229, 236, 243);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;“很多年了，祭灵都没有动过一次供品，还需要每次都进行祭祀吗？”一个少年小声咕哝。&lt;/span&gt;&lt;br style=&quot;font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; line-height: 30px; white-space: normal; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;br style=&quot;font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; line-height: 30px; white-space: normal; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;span style=&quot;font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; line-height: 30px; background-color: rgb(229, 236, 243);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;“臭小子你乱说什么！”他的父亲怒瞪铜铃大眼，抡起蒲扇大的手就要揍他。&lt;/span&gt;&lt;br style=&quot;font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; line-height: 30px; white-space: normal; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;br style=&quot;font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; line-height: 30px; white-space: normal; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;span style=&quot;font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; line-height: 30px; background-color: rgb(229, 236, 243);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;老族长摆了摆手，制止了，轻声道：“祭灵，是我们祭祀与供养的灵，贵在心诚，我们虔诚待它，它才会守护与保佑我们的村子。”&lt;/span&gt;&lt;br style=&quot;font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; line-height: 30px; white-space: normal; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;br style=&quot;font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; line-height: 30px; white-space: normal; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;span style=&quot;font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; line-height: 30px; background-color: rgb(229, 236, 243);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;少年的脸憋的通红，慌忙道：“族长我不是心不诚，只是觉得，祭灵好像并不需要这些祭品，从来都没有动用过。”&lt;/span&gt;&lt;br style=&quot;font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; line-height: 30px; white-space: normal; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;br style=&quot;font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; line-height: 30px; white-space: normal; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;span style=&quot;font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; line-height: 30px; background-color: rgb(229, 236, 243);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;“心意到就好了。”石云峰拍了拍他的肩头，用心解释道。&lt;/span&gt;&lt;br style=&quot;font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; line-height: 30px; white-space: normal; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;br style=&quot;font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; line-height: 30px; white-space: normal; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;span style=&quot;font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; line-height: 30px; background-color: rgb(229, 236, 243);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;祭灵，也叫“祭之灵”，是一个部族“祭祀与供养之灵”的简称，它守护村落，震慑大荒中的凶兽。&lt;/span&gt;&lt;br style=&quot;font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; line-height: 30px; white-space: normal; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;br style=&quot;font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; line-height: 30px; white-space: normal; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;span style=&quot;font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; line-height: 30px; background-color: rgb(229, 236, 243);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;族中的老人还记得，几十年前的另一个祭灵可不这样，那是一块奇石，每次献上的祭品都会失去大半jīng血，被它吸收。&lt;/span&gt;&lt;br style=&quot;font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; line-height: 30px; white-space: normal; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;br style=&quot;font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; line-height: 30px; white-space: normal; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;span style=&quot;font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; line-height: 30px; background-color: rgb(229, 236, 243);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;直到有一rì深夜，老柳树来了，那块奇石选择远去。一切因此而变。&lt;/span&gt;&lt;br style=&quot;font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; line-height: 30px; white-space: normal; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;br style=&quot;font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; line-height: 30px; white-space: normal; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;span style=&quot;font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; line-height: 30px; background-color: rgb(229, 236, 243);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;想到当年那个雨夜，老族长有些心神恍惚，那时他还是一个少年，曾经亲眼目睹了那副震撼xìng的可怕画面。&lt;/span&gt;&lt;br style=&quot;font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; line-height: 30px; white-space: normal; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;br style=&quot;font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; line-height: 30px; white-space: normal; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;span style=&quot;font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; line-height: 30px; background-color: rgb(229, 236, 243);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;在那个深夜，电闪雷鸣，大雨磅礴，暴风雨狂暴到极致，大山都被雷电劈塌了许多座，山洪如海，凶兽如cháo狂奔，景象恐怖。&lt;/span&gt;&lt;br style=&quot;font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; line-height: 30px; white-space: normal; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;br style=&quot;font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; line-height: 30px; white-space: normal; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;span style=&quot;font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; line-height: 30px; background-color: rgb(229, 236, 243);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;就是在那时，一株通天的大柳树在云层中出现，沐浴雷海，缭绕山岳粗的闪电，万千柳条化成一条条炽盛的神链，刺透了整片天穹，像是在与什么东西战斗。&lt;/span&gt;&lt;br style=&quot;font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; line-height: 30px; white-space: normal; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;br style=&quot;font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; line-height: 30px; white-space: normal; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;span style=&quot;font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; line-height: 30px; background-color: rgb(229, 236, 243);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;最后，大柳树折断，浑身焦黑，缩小到现在这般大，坠落而下，扎根在了石村中，与此同时闪电消失，倾盆暴雨退去。当夜村中所祭祀与供养的那块奇石就离开了。&lt;/span&gt;&lt;br style=&quot;font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; line-height: 30px; white-space: normal; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;br style=&quot;font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; line-height: 30px; white-space: normal; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;span style=&quot;font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; line-height: 30px; background-color: rgb(229, 236, 243);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;每一次想起，老族长都阵阵心颤，老柳树不是从其他大部落或山川大泽中移根而至，而是自天穹降落，遭遇无尽雷霆电海而损，村中没有几人知道。&lt;/span&gt;&lt;br style=&quot;font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; line-height: 30px; white-space: normal; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;br style=&quot;font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; line-height: 30px; white-space: normal; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;span style=&quot;font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; line-height: 30px; background-color: rgb(229, 236, 243);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;最初的几十年，它通体焦黑，没有一点生机，像是彻底死去了，直到十年前才抽出一条嫩绿的新枝，而后再无变化。&lt;/span&gt;&lt;br style=&quot;font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; line-height: 30px; white-space: normal; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;br style=&quot;font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; line-height: 30px; white-space: normal; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;span style=&quot;font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; line-height: 30px; background-color: rgb(229, 236, 243);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;“臭小子，你们小心点，难得收获到了这些凶兽，它们的血jīng还有筋脉以及部分骨骼珍贵的惊人，别流失了jīng华。”老族长回过神来叮嘱道。&lt;/span&gt;&lt;br style=&quot;font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; line-height: 30px; white-space: normal; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;br style=&quot;font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; line-height: 30px; white-space: normal; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;span style=&quot;font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; line-height: 30px; background-color: rgb(229, 236, 243);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;族中的青壮年银刀霍霍，正在切割巨兽，不时发出铿锵声，火星四溅，巨兽的骸骨坚硬的惊人。&lt;/span&gt;&lt;br style=&quot;font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; line-height: 30px; white-space: normal; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;br style=&quot;font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; line-height: 30px; white-space: normal; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;span style=&quot;font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; line-height: 30px; background-color: rgb(229, 236, 243);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;有人早已准备好了陶制的大罐子，接取那保留在兽体特殊部位的血jīng，这是极佳的血补大药，非常稀珍。&lt;/span&gt;&lt;br style=&quot;font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; line-height: 30px; white-space: normal; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;br style=&quot;font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; line-height: 30px; white-space: normal; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;span style=&quot;font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; line-height: 30px; background-color: rgb(229, 236, 243);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;这堆兽尸又以貔貅最珍，虽然只是一个后裔，远远比不上血脉纯净的貔貅王族，但是一样蕴含有部分真血，价值惊人。&lt;/span&gt;&lt;br style=&quot;font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; line-height: 30px; white-space: normal; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;br style=&quot;font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; line-height: 30px; white-space: normal; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;span style=&quot;font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; line-height: 30px; background-color: rgb(229, 236, 243);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;距离上次捕捉到貔貅这种凶兽已经过去两年多了，它们太过凶残与强大，一爪子下去就能坏掉一个强者的xìng命，实在不好对付，凶戾惊人。&lt;/span&gt;&lt;br style=&quot;font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; line-height: 30px; white-space: normal; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;br style=&quot;font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; line-height: 30px; white-space: normal; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;span style=&quot;font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; line-height: 30px; background-color: rgb(229, 236, 243);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;可以说，这次收获之丰让人咋舌。&lt;/span&gt;&lt;br style=&quot;font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; line-height: 30px; white-space: normal; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;br style=&quot;font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; line-height: 30px; white-space: normal; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;span style=&quot;font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; line-height: 30px; background-color: rgb(229, 236, 243);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;“唔，这双头火犀的犀角中保留的真血也极其惊人啊，不比那只貔貅差！”一个老爷子亲自cāo刀，解开了犀角下坚硬如金石的血肉，淌出一股赤红如火光般的真血。&lt;/span&gt;&lt;br style=&quot;font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; line-height: 30px; white-space: normal; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;br style=&quot;font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; line-height: 30px; white-space: normal; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;span style=&quot;font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; line-height: 30px; background-color: rgb(229, 236, 243);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;忽然，那血液竟然化成了一团红芒，一只巴掌长的双头火犀浮现，浑身赤红，栩栩如生，愤怒咆哮。&lt;/span&gt;&lt;br style=&quot;font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; line-height: 30px; white-space: normal; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;br style=&quot;font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; line-height: 30px; white-space: normal; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;span style=&quot;font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; line-height: 30px; background-color: rgb(229, 236, 243);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;“好东西，这真血药xìng极强，不比那貔貅差！”cāo刀的老爷子哈哈大笑，快速用陶罐将那犀血收了进去，牢牢封住了罐口。&lt;/span&gt;&lt;br style=&quot;font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; line-height: 30px; white-space: normal; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;br style=&quot;font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; line-height: 30px; white-space: normal; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;span style=&quot;font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; line-height: 30px; background-color: rgb(229, 236, 243);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;“族长，这头龙角象的角也是好东西啊，我们寻到时它已经奄奄一息了，不然真收拾不了。”一个青年道。&lt;/span&gt;&lt;br style=&quot;font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; line-height: 30px; white-space: normal; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;br style=&quot;font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; line-height: 30px; white-space: normal; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;span style=&quot;font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; line-height: 30px; background-color: rgb(229, 236, 243);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;石云峰点头，道：“真是不多见，它头上的这对龙角生长有些年头了，小心地凿下来，是难得的补骨宝药。”&lt;/span&gt;&lt;br style=&quot;font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; line-height: 30px; white-space: normal; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;br style=&quot;font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; line-height: 30px; white-space: normal; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;span style=&quot;font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; line-height: 30px; background-color: rgb(229, 236, 243);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;“夔兽独腿的这条筋真坚韧，用斧头都砍不断啊。”&lt;/span&gt;&lt;br style=&quot;font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; line-height: 30px; white-space: normal; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;br style=&quot;font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; line-height: 30px; white-space: normal; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;span style=&quot;font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; line-height: 30px; background-color: rgb(229, 236, 243);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;“都是好东西。臭小子小心点，别将飞蟒双翼处的宝血糟蹋了！”&lt;/span&gt;&lt;br style=&quot;font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; line-height: 30px; white-space: normal; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;br style=&quot;font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; line-height: 30px; white-space: normal; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;span style=&quot;font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; line-height: 30px; background-color: rgb(229, 236, 243);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;族人欢喜，皆充满笑容。&lt;/span&gt;&lt;br style=&quot;font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; line-height: 30px; white-space: normal; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;br style=&quot;font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; line-height: 30px; white-space: normal; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;span style=&quot;font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; line-height: 30px; background-color: rgb(229, 236, 243);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;只有一群孩子都一缩脖子，一溜烟似的跑了，因为他们知道，这些所谓的血药、骨药大半都会用在他们的身上，又要开始“受罪”了。&lt;/span&gt;&lt;br style=&quot;font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; line-height: 30px; white-space: normal; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;br style=&quot;font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; line-height: 30px; white-space: normal; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;span style=&quot;font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; line-height: 30px; background-color: rgb(229, 236, 243);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;直到半个时辰后，猛兽身上生长的“宝药”才被采尽，族长与几位老人满意的点了点头，收走了那些陶罐，拿去处理。&lt;/span&gt;&lt;br style=&quot;font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; line-height: 30px; white-space: normal; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;br style=&quot;font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; line-height: 30px; white-space: normal; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;span style=&quot;font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; line-height: 30px; background-color: rgb(229, 236, 243);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;“这么多的猎物，一会儿腌制一部分，然后熏烤、制成肉干一部分。”有经验的老人开口。&lt;/span&gt;&lt;br style=&quot;font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; line-height: 30px; white-space: normal; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;br style=&quot;font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; line-height: 30px; white-space: normal; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;span style=&quot;font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; line-height: 30px; background-color: rgb(229, 236, 243);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;如此多的猛兽堆在一起跟小山似的，全村人很多天都吃不完，如果腐坏了实在是一种浪费，对于食物有些短缺的村人来说绝不能容许。&lt;/span&gt;&lt;br style=&quot;font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; line-height: 30px; white-space: normal; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;br style=&quot;font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; line-height: 30px; white-space: normal; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;span style=&quot;font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; line-height: 30px; background-color: rgb(229, 236, 243);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;各家各户的女人开始上前分肉，皆带着真心的笑容，早先担心外出的男人，现在不仅都平安回来了，还收获还这么丰，这是上天最好的恩赐。&lt;/span&gt;&lt;br style=&quot;font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; line-height: 30px; white-space: normal; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;br style=&quot;font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; line-height: 30px; white-space: normal; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;span style=&quot;font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; line-height: 30px; background-color: rgb(229, 236, 243);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;各户炊烟袅袅，半个时辰后阵阵肉香散开，各家铁锅中熬炖的肉块都快要烂了，孩子们早已等不及。而架在火堆上烤的兽肉也开始变得金黄油亮，在往下滴油脂，落在火堆中哧哧作响，那些壮硕的汉子也都忍不住了，开始动手撕肉，咬的满嘴流汁，胃口大开。&lt;/span&gt;&lt;br style=&quot;font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; line-height: 30px; white-space: normal; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;br style=&quot;font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; line-height: 30px; white-space: normal; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;span style=&quot;font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; line-height: 30px; background-color: rgb(229, 236, 243);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;“娃子，这是貔貅肉，多吃一些会长出大力气来，是难得的珍肉啊。”&lt;/span&gt;&lt;br style=&quot;font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; line-height: 30px; white-space: normal; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;br style=&quot;font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; line-height: 30px; white-space: normal; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;span style=&quot;font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; line-height: 30px; background-color: rgb(229, 236, 243);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;“臭小子多吃点，这可是双头犀的肉，多补一些可以让你的皮骨结实的跟铁块似的，别吃那最没用的树猪肉。”&lt;/span&gt;&lt;br style=&quot;font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; line-height: 30px; white-space: normal; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;br style=&quot;font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; line-height: 30px; white-space: normal; background-color: rgb(229, 236, 243);&quot;/&gt;&lt;span style=&quot;font-family: 宋体, 宋体, Verdana, Arial, sans-serif; font-size: 20px; line-height: 30px; background-color: rgb(229, 236, 243);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;各种猛兽成为了村人晚间最丰盛的食物，诱人的肉香飘散向街上，引人食yù如cháo，阵阵欢笑声传来，整个村子都一片喜庆。&lt;/span&gt;&lt;/p&gt;',NULL,NULL,'3',NULL,NULL,'2016-02-24 18:40:04','0000-00-00 00:00:00'),
	(24,0,18,'相对论','NO002',NULL,NULL,'','爱因斯坦','相对论',NULL,'',NULL,NULL,33,NULL,'2',NULL,NULL,'2016-02-24 17:44:46','0000-00-00 00:00:00'),
	(25,24,18,'相对的物体',NULL,NULL,NULL,NULL,NULL,NULL,'第一章','相对的物体2','www.baidu.com','&lt;p&gt;相对的物体对于相对的物体是静止的！&lt;br/&gt;&lt;/p&gt;',NULL,NULL,'2',NULL,NULL,'2016-02-24 18:29:26','0000-00-00 00:00:00'),
	(27,24,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'第二章','相对体系','www.hict.cc','&lt;p&gt;相对体系&lt;br/&gt;&lt;/p&gt;',NULL,NULL,'2',NULL,NULL,'2016-02-25 13:12:01','0000-00-00 00:00:00'),
	(28,24,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'第三章','相对论3','www.hict.cc','&lt;p&gt;相对论3&lt;/p&gt;',NULL,NULL,'2',NULL,NULL,'2016-02-25 13:33:23','0000-00-00 00:00:00'),
	(29,24,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'第四章','相对的实物','www.hict.cc','&lt;p&gt;相对的实物&lt;/p&gt;',NULL,NULL,'551',NULL,NULL,'2016-02-25 13:38:43','0000-00-00 00:00:00'),
	(30,24,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'第五章','相对的地区','www.hict.cc','&lt;p&gt;相对的地区&lt;/p&gt;',NULL,NULL,'5',NULL,NULL,'2016-02-25 13:38:31','0000-00-00 00:00:00');

/*!40000 ALTER TABLE `pl_bookparam` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table pl_category
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pl_category`;

CREATE TABLE `pl_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL COMMENT '父分类ID',
  `name` varchar(20) DEFAULT NULL COMMENT '分类别名',
  `type` tinyint(1) NOT NULL,
  `title` varchar(100) DEFAULT NULL COMMENT '分类标题',
  `keywords` varchar(255) DEFAULT NULL COMMENT '分类关键词',
  `description` varchar(255) DEFAULT NULL COMMENT '分类描述',
  `isdel` timestamp NULL DEFAULT NULL,
  `category` varchar(30) DEFAULT '' COMMENT '不同分类的类型：video games book shop country',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `pl_category` WRITE;
/*!40000 ALTER TABLE `pl_category` DISABLE KEYS */;

INSERT INTO `pl_category` (`id`, `pid`, `name`, `type`, `title`, `keywords`, `description`, `isdel`, `category`)
VALUES
	(1,0,'电影，电视剧，综艺。',1,'视频','视频','电影，电视剧，综艺。',NULL,''),
	(2,0,'游戏，应用',2,'app','app','app',NULL,''),
	(3,1,'剧情',0,'剧情','剧情','剧情',NULL,''),
	(4,1,'动作',0,'动作','动作','动作',NULL,''),
	(5,1,'动漫',0,'动漫','动漫','动漫',NULL,''),
	(6,1,'动画',0,'动画','动画','动画',NULL,''),
	(7,1,'历险',0,'历险','历险','历险',NULL,''),
	(8,1,'喜剧',0,'喜剧','喜剧','喜剧',NULL,''),
	(9,1,'奇幻',0,'奇幻','奇幻','奇幻',NULL,''),
	(10,1,'惊悚',0,'惊悚','惊悚','惊悚',NULL,''),
	(11,1,'战争',0,'战争','战争','战争',NULL,''),
	(12,1,'灾难',0,'灾难','灾难','灾难',NULL,''),
	(13,1,'爱情',0,'爱情','爱情','爱情',NULL,''),
	(14,1,'科幻',0,'科幻','科幻','科幻',NULL,''),
	(15,1,'剧情古装',0,'剧情古装','剧情古装','剧情古装',NULL,''),
	(16,1,'古装名著',0,'古装名著','古装名著','古装名著',NULL,''),
	(17,1,'古装宫廷',0,'古装宫廷','古装宫廷','古装宫廷',NULL,''),
	(18,1,'古装武侠',0,'古装武侠','古装武侠','古装武侠',NULL,''),
	(19,1,'现代剧情',0,'现代剧情','现代剧情','现代剧情',NULL,''),
	(20,1,'现代励志',0,'现代励志','现代励志','现代励志',NULL,''),
	(21,1,'现代爱情',0,'现代爱情','现代爱情','现代爱情',NULL,''),
	(22,2,'relax',0,'益智休闲','益智休闲','益智休闲',NULL,''),
	(23,2,'checkpoint',0,'动作冒险','动作冒险','动作冒险',NULL,''),
	(24,2,'chess',0,'棋牌麻将','棋牌麻将','棋牌麻将',NULL,''),
	(25,2,'shot',0,'射击飞行 ','射击飞行 ','射击飞行 ',NULL,''),
	(26,2,'manage',0,'模拟经营 ','模拟经营 ','模拟经营 ',NULL,''),
	(27,2,'role',0,'角色扮演','角色扮演','角色扮演',NULL,''),
	(28,2,'sports',0,'体育竞技','体育竞技','体育竞技',NULL,''),
	(29,2,'racing',0,'跑酷赛车','跑酷赛车','跑酷赛车',NULL,''),
	(30,2,'td',0,'策略塔防','策略塔防','策略塔防',NULL,''),
	(31,2,'other',0,'其他游戏','其他游戏','其他游戏',NULL,''),
	(32,0,'图书',3,'图书','图书','图书',NULL,''),
	(33,32,'小说',0,'小说','小说','小说',NULL,''),
	(34,0,'装机分类',4,'装机分类','装机分类','装机分类',NULL,''),
	(37,34,'聊天',0,'聊天','聊天','聊天',NULL,''),
	(38,1,'',0,'穿越','2','','2016-02-24 13:19:48',''),
	(39,1,'穿越剧',0,'穿越','穿越','穿越未来和过去。',NULL,''),
	(40,0,'购物商城',0,'商城','商城','','2016-02-24 13:36:31',''),
	(41,40,'零食',0,'零食','零食','办公室零食',NULL,''),
	(43,34,'微信',0,'微信','微信','微信描述',NULL,''),
	(44,0,'',0,'做任务赚积分','','',NULL,''),
	(45,0,'',0,'积分商城','','',NULL,''),
	(46,44,'',0,'日常任务','','',NULL,''),
	(47,44,'',0,'新手任务','','',NULL,''),
	(48,44,'',0,'游戏任务','','',NULL,''),
	(49,0,'',0,'产品','','',NULL,''),
	(50,49,'',0,'虚拟','','',NULL,''),
	(51,49,'',0,'实物','','',NULL,'');

/*!40000 ALTER TABLE `pl_category` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table pl_comment
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pl_comment`;

CREATE TABLE `pl_comment` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `reviewer` varchar(200) NOT NULL,
  `type` varchar(300) NOT NULL,
  `contact` longtext NOT NULL,
  `resource_id` int(8) NOT NULL,
  `creatime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isdel` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='评论表';

LOCK TABLES `pl_comment` WRITE;
/*!40000 ALTER TABLE `pl_comment` DISABLE KEYS */;

INSERT INTO `pl_comment` (`id`, `reviewer`, `type`, `contact`, `resource_id`, `creatime`, `isdel`)
VALUES
	(1,'morganzhao','2','这个游戏还不错！',1,'2016-01-20 15:38:19',NULL),
	(2,'morganzhao','1','这个电影不错！',182,'2016-01-21 13:23:30',NULL);

/*!40000 ALTER TABLE `pl_comment` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table pl_customer
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pl_customer`;

CREATE TABLE `pl_customer` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `address` varchar(300) NOT NULL,
  `contact` varchar(300) NOT NULL,
  `contactinfo` varchar(300) NOT NULL,
  `creatime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isdel` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='客户表';



# Dump of table pl_dns
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pl_dns`;

CREATE TABLE `pl_dns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hostname` varchar(50) NOT NULL,
  `hostip` varchar(20) NOT NULL,
  `dns` varchar(20) NOT NULL,
  `sort` varchar(200) NOT NULL,
  `creatime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isdel` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `pl_dns` WRITE;
/*!40000 ALTER TABLE `pl_dns` DISABLE KEYS */;

INSERT INTO `pl_dns` (`id`, `hostname`, `hostip`, `dns`, `sort`, `creatime`, `isdel`)
VALUES
	(1,'www.hict.cc','60.174.235.163','61.132.163.68','0','2016-01-18 16:28:56',NULL),
	(2,'www.pinet.co1','121.40.237.43','10.202.72.116','1','2016-01-18 16:53:06','2016-01-19 09:29:25');

/*!40000 ALTER TABLE `pl_dns` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table pl_function
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pl_function`;

CREATE TABLE `pl_function` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `modelname` varchar(200) NOT NULL,
  `sort` varchar(300) NOT NULL,
  `modeldesc` varchar(300) NOT NULL,
  `modelimg` varchar(300) NOT NULL,
  `creatime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isshown` tinyint(1) NOT NULL,
  `isdel` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='首页功能模块表';

LOCK TABLES `pl_function` WRITE;
/*!40000 ALTER TABLE `pl_function` DISABLE KEYS */;

INSERT INTO `pl_function` (`id`, `modelname`, `sort`, `modeldesc`, `modelimg`, `creatime`, `isshown`, `isdel`)
VALUES
	(1,'121','1','121','Upload/Img/201603/56e7c7037522e.png','2016-02-18 17:54:03',0,NULL);

/*!40000 ALTER TABLE `pl_function` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table pl_game_file
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pl_game_file`;

CREATE TABLE `pl_game_file` (
  `file_id` int(11) NOT NULL DEFAULT '0',
  `game_id` int(11) DEFAULT NULL,
  `channel_id` int(11) DEFAULT NULL,
  `file_type` int(11) DEFAULT NULL COMMENT '1:apk源包  2:渠道包',
  `file_size` int(11) DEFAULT NULL,
  `version_code` varchar(32) DEFAULT NULL,
  `version_name` varchar(32) DEFAULT NULL,
  `package_name` varchar(100) DEFAULT NULL,
  `file_url` varchar(200) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pl_game_image
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pl_game_image`;

CREATE TABLE `pl_game_image` (
  `image_id` int(11) NOT NULL DEFAULT '0',
  `game_id` int(11) DEFAULT NULL,
  `image_type` int(11) DEFAULT NULL COMMENT 'icon:200 截图:203 推广广告图:400',
  `image_size` int(11) DEFAULT NULL,
  `image_height` int(11) DEFAULT NULL,
  `image_width` int(11) DEFAULT NULL,
  `image_index` int(11) DEFAULT NULL COMMENT '图片顺序 0-6',
  `image_url` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`image_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pl_games
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pl_games`;

CREATE TABLE `pl_games` (
  `game_id` int(11) NOT NULL DEFAULT '0',
  `cp_name` varchar(200) DEFAULT NULL,
  `game_name` varchar(100) DEFAULT NULL,
  `game_tag` int(11) DEFAULT NULL,
  `game_class` int(11) DEFAULT NULL COMMENT '11:单击 12:网游',
  `create_time` datetime DEFAULT NULL,
  `modify_time` datetime DEFAULT NULL,
  `online_status` enum('1','0') DEFAULT NULL COMMENT '1:商用; 0:下线',
  `channel_id` varchar(20) DEFAULT NULL,
  `introduction` text,
  PRIMARY KEY (`game_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pl_operation
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pl_operation`;

CREATE TABLE `pl_operation` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(8) NOT NULL,
  `operation` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '应用类型：0.下载app 1.视频播放 2.搜索 3.阅读图书 4.打开广告 5.查询 6.打开游戏 7.打开应用',
  `creatime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `objid` varchar(64) DEFAULT NULL COMMENT '操作对象uuid',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `pl_operation` WRITE;
/*!40000 ALTER TABLE `pl_operation` DISABLE KEYS */;

INSERT INTO `pl_operation` (`id`, `uid`, `operation`, `creatime`, `objid`)
VALUES
	(1,1001,0,'2016-03-14 10:57:41','dddd'),
	(2,1001,0,'2016-03-14 10:57:58','xxxxx'),
	(3,1001,0,'2016-02-14 10:58:11','cccc'),
	(4,1001,0,'2016-02-22 17:23:18','xxxxx');

/*!40000 ALTER TABLE `pl_operation` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table pl_position
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pl_position`;

CREATE TABLE `pl_position` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `width` varchar(100) NOT NULL,
  `height` varchar(100) NOT NULL,
  `description` varchar(400) NOT NULL,
  `creatime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isdel` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `pl_position` WRITE;
/*!40000 ALTER TABLE `pl_position` DISABLE KEYS */;

INSERT INTO `pl_position` (`id`, `name`, `width`, `height`, `description`, `creatime`, `isdel`)
VALUES
	(5,'分类右侧广告','200','300','分类右侧广告','2016-01-07 09:17:08',NULL);

/*!40000 ALTER TABLE `pl_position` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table pl_post
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pl_post`;

CREATE TABLE `pl_post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `content` text,
  `author` varchar(11) DEFAULT '0',
  `cate_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `isread` timestamp NULL DEFAULT NULL,
  `isdel` timestamp NULL DEFAULT NULL,
  `type` tinyint(1) DEFAULT '1' COMMENT '1:普通,2:置顶,3:热门,4:推荐',
  `create_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modify_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `cate_id` (`cate_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `pl_post` WRITE;
/*!40000 ALTER TABLE `pl_post` DISABLE KEYS */;

INSERT INTO `pl_post` (`id`, `title`, `content`, `author`, `cate_id`, `user_id`, `isread`, `isdel`, `type`, `create_date`, `modify_date`)
VALUES
	(1,'微信支付向政府与媒体类订阅号开放','&lt;p style=&quot;white-space: normal;&quot;&gt;今日，微信公众平台宣布，为了逐步开放微信支付的能力，现允许认证的政府与媒体类订阅号申请微信支付。&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;认证的政府与媒体类订阅号是指，订阅号在进行微信认证时，选择的主体类型是政府或者媒体。满足微信支付申请条件的帐号，将在左侧导航中出现“微信支付”的文字，点击即可进行申请。&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;微信方面表示，政府、媒体订阅号开支付是为了在保障安全的前提下，让他们有更丰富的运营手段和盈收模式。&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;微信支付正在逐步打开。本月23日，微信支付的企业付款已经全面开放，而此前，微信支付只能提供客户向企业单向付款。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;','admin',33,NULL,NULL,NULL,2,'2016-02-23 17:05:46','0000-00-00 00:00:00');

/*!40000 ALTER TABLE `pl_post` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table pl_product
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pl_product`;

CREATE TABLE `pl_product` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `productname` char(255) NOT NULL COMMENT '产品名称',
  `content` text NOT NULL COMMENT '产品内容',
  `logopath` char(255) NOT NULL COMMENT 'logo图片路径',
  `imagepath` char(255) NOT NULL COMMENT '产品大图路径',
  `score` int(10) NOT NULL COMMENT '兑换积分',
  `price` decimal(10,2) NOT NULL COMMENT '市场价格',
  `totalnums` int(10) NOT NULL COMMENT '数量',
  `lastnums` int(10) NOT NULL COMMENT '剩余数量',
  `isonline` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否上架：0:否，1:是',
  `categoryid` int(11) NOT NULL COMMENT '产品分类',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='商城物品表';

LOCK TABLES `pl_product` WRITE;
/*!40000 ALTER TABLE `pl_product` DISABLE KEYS */;

INSERT INTO `pl_product` (`id`, `productname`, `content`, `logopath`, `imagepath`, `score`, `price`, `totalnums`, `lastnums`, `isonline`, `categoryid`)
VALUES
	(1010,'移动30M','','','',2500,0.00,10,10,0,50),
	(1011,'飞毛腿车载电源','','','',3000,0.00,30,29,0,51),
	(1013,'移动50M','','','',2800,0.00,10,10,0,50),
	(1014,'维肯viken苹果5','','','',4000,0.00,5,2,0,51);

/*!40000 ALTER TABLE `pl_product` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table pl_readrecord
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pl_readrecord`;

CREATE TABLE `pl_readrecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bookid` int(11) NOT NULL,
  `chapter` varchar(150) DEFAULT NULL,
  `hits` varchar(150) DEFAULT NULL,
  `paramid` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `isdel` timestamp NULL DEFAULT NULL,
  `createdate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `pl_readrecord` WRITE;
/*!40000 ALTER TABLE `pl_readrecord` DISABLE KEYS */;

INSERT INTO `pl_readrecord` (`id`, `bookid`, `chapter`, `hits`, `paramid`, `uid`, `isdel`, `createdate`)
VALUES
	(15,17,'第二章','4',22,1001,NULL,'2016-02-23 16:19:59'),
	(16,17,'第一章','1',18,1001,NULL,'2016-02-23 16:59:48'),
	(17,17,'第三章','2',23,1001,NULL,'2016-02-25 13:54:58'),
	(18,18,'第三章','1',28,1001,NULL,'2016-02-25 13:56:32'),
	(19,18,'第四章','1',29,1001,NULL,'2016-02-25 16:14:25');

/*!40000 ALTER TABLE `pl_readrecord` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table pl_records
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pl_records`;

CREATE TABLE `pl_records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mac` varchar(20) DEFAULT '',
  `ip` varchar(15) DEFAULT NULL,
  `os` varchar(16) DEFAULT '',
  `os_version` varchar(16) DEFAULT '',
  `type` enum('play','download') DEFAULT 'play',
  `third_id` varchar(64) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `pl_records` WRITE;
/*!40000 ALTER TABLE `pl_records` DISABLE KEYS */;

INSERT INTO `pl_records` (`id`, `mac`, `ip`, `os`, `os_version`, `type`, `third_id`, `create_date`)
VALUES
	(1,'1',NULL,'','','play',NULL,NULL);

/*!40000 ALTER TABLE `pl_records` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table pl_resource
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pl_resource`;

CREATE TABLE `pl_resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(1000) NOT NULL,
  `thumbnail` varchar(1000) NOT NULL,
  `director` varchar(200) NOT NULL,
  `actors` varchar(200) NOT NULL,
  `type` varchar(64) NOT NULL,
  `path` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pl_task
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pl_task`;

CREATE TABLE `pl_task` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `title` varchar(50) NOT NULL COMMENT '任务标题',
  `content` text NOT NULL COMMENT '任务内容',
  `score` int(10) NOT NULL COMMENT '完成任务得积分',
  `categoryid` int(1) NOT NULL COMMENT '任务分类',
  `starttimes` datetime NOT NULL COMMENT '开始时间',
  `endtimes` datetime NOT NULL COMMENT '结束时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='任务表';

LOCK TABLES `pl_task` WRITE;
/*!40000 ALTER TABLE `pl_task` DISABLE KEYS */;

INSERT INTO `pl_task` (`id`, `title`, `content`, `score`, `categoryid`, `starttimes`, `endtimes`)
VALUES
	(1046,'分享','',50,48,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(1047,'签到','',30,46,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(1048,'累计签到3天','',30,46,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(1049,'累计签到7天','',100,46,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(1050,'累计签到15天','',200,46,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(1051,'下载淘宝客户端','',200,47,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(1052,'新用户注册','',30,47,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(1053,'上传头像','',30,47,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(1054,'填写真实资料','',100,47,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(1057,'ff','Ff',0,46,'0000-00-00 00:00:00','0000-00-00 00:00:00');

/*!40000 ALTER TABLE `pl_task` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table pl_user_product
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pl_user_product`;

CREATE TABLE `pl_user_product` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `userid` int(10) NOT NULL COMMENT '用户ID',
  `productid` int(10) NOT NULL COMMENT '产品ID',
  `exchangetimes` datetime NOT NULL COMMENT '兑换时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='用户物品兑换表';

LOCK TABLES `pl_user_product` WRITE;
/*!40000 ALTER TABLE `pl_user_product` DISABLE KEYS */;

INSERT INTO `pl_user_product` (`id`, `userid`, `productid`, `exchangetimes`)
VALUES
	(1010,1001,1010,'2016-01-10 00:00:00'),
	(1028,1001,1011,'0000-00-00 00:00:00'),
	(1030,1002,1010,'0000-00-00 00:00:00'),
	(1031,1001,1013,'2016-02-24 17:02:48'),
	(1032,0,0,'2016-03-14 11:03:47'),
	(1033,0,0,'2016-03-14 11:03:06');

/*!40000 ALTER TABLE `pl_user_product` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table pl_user_sign
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pl_user_sign`;

CREATE TABLE `pl_user_sign` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `userid` int(10) NOT NULL COMMENT '用户ID',
  `signtimes` datetime NOT NULL COMMENT '签到时间',
  `days` int(10) NOT NULL COMMENT '连续签到天数',
  `score` int(10) NOT NULL COMMENT '获得积分',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否签到，0：否 1：是',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='用户签到表';

LOCK TABLES `pl_user_sign` WRITE;
/*!40000 ALTER TABLE `pl_user_sign` DISABLE KEYS */;

INSERT INTO `pl_user_sign` (`id`, `userid`, `signtimes`, `days`, `score`, `status`)
VALUES
	(1010,1001,'2014-01-18 00:00:00',1,5,0),
	(1011,1001,'2014-01-19 00:00:00',1,5,0),
	(1012,1002,'2015-01-18 00:00:00',1,5,0),
	(1013,1004,'2015-01-18 00:00:00',1,15,0),
	(1014,1002,'2015-01-18 00:00:00',1,5,0),
	(1015,1004,'2015-01-18 00:00:00',1,5,0),
	(1034,1001,'2014-02-21 13:46:57',2,5,0),
	(1027,1001,'2014-02-11 12:02:20',2,5,0),
	(1033,1001,'2014-02-22 13:46:29',2,5,0),
	(1035,1001,'2014-02-22 13:49:20',3,5,0),
	(1036,1001,'2014-02-22 13:49:58',4,5,0),
	(1037,1001,'2014-02-21 13:50:24',5,5,0),
	(1038,1001,'2014-02-21 13:50:32',6,10,0),
	(1039,1001,'2014-02-23 13:53:04',5,5,0),
	(1040,1001,'2014-03-07 11:41:46',1,0,0),
	(1041,1001,'2014-03-22 14:59:59',1,5,0),
	(1042,1003,'2016-03-22 16:41:20',1,5,0);

/*!40000 ALTER TABLE `pl_user_sign` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table pl_user_task
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pl_user_task`;

CREATE TABLE `pl_user_task` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `userid` int(10) NOT NULL COMMENT '用户ID',
  `taskid` int(10) NOT NULL COMMENT '任务ID',
  `finishtimes` datetime NOT NULL COMMENT '完成时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='用户完成任务表';

LOCK TABLES `pl_user_task` WRITE;
/*!40000 ALTER TABLE `pl_user_task` DISABLE KEYS */;

INSERT INTO `pl_user_task` (`id`, `userid`, `taskid`, `finishtimes`)
VALUES
	(1033,1001,1046,'2016-02-24 17:02:33'),
	(1011,1001,1047,'0000-00-00 00:00:00'),
	(1034,1001,1046,'2016-02-24 17:02:59'),
	(1035,1001,1046,'2016-03-07 14:03:10'),
	(1036,1001,1046,'2016-03-07 14:03:02'),
	(1037,1001,1046,'2016-03-07 14:03:28'),
	(1038,1001,1046,'2016-03-07 14:03:41'),
	(1039,1001,1046,'2016-03-07 14:03:49'),
	(1040,1001,1046,'2016-03-07 14:03:14'),
	(1041,1001,1046,'2016-03-07 14:03:17'),
	(1042,1001,1046,'2016-03-07 14:03:18'),
	(1043,1001,1046,'2016-03-07 14:03:05'),
	(1044,1001,1046,'2016-03-22 15:03:23'),
	(1045,1001,1057,'2016-03-22 15:03:23'),
	(1046,1001,1054,'2016-03-22 15:03:40'),
	(1047,1002,1054,'2016-03-22 15:03:13');

/*!40000 ALTER TABLE `pl_user_task` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table pl_video
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pl_video`;

CREATE TABLE `pl_video` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(64) NOT NULL,
  `name` varchar(255) NOT NULL,
  `cover` varchar(100) DEFAULT NULL COMMENT '封面',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '视频类型：1.电影 2.电视剧',
  `duratime` varchar(30) DEFAULT NULL COMMENT '时长',
  `director` varchar(150) NOT NULL,
  `actors` varchar(350) NOT NULL,
  `setnum` smallint(4) unsigned NOT NULL DEFAULT '1' COMMENT '视频集数，电影始终为1',
  `years` smallint(4) unsigned NOT NULL,
  `country` varchar(50) NOT NULL,
  `category` varchar(100) NOT NULL COMMENT '视频分类',
  `intro` varchar(1000) NOT NULL COMMENT '视频介绍',
  `imgs` varchar(500) DEFAULT NULL COMMENT '视频图片',
  `provider` varchar(50) NOT NULL,
  `isrecommend` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否推荐 0:不推荐 1:推荐',
  `viewtimes` int(8) unsigned NOT NULL DEFAULT '0' COMMENT '点击播放量',
  `filepath` varchar(100) DEFAULT NULL COMMENT '路径地址',
  `creatime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态：1.上架 2.下架',
  `isdel` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `pl_video` WRITE;
/*!40000 ALTER TABLE `pl_video` DISABLE KEYS */;

INSERT INTO `pl_video` (`id`, `uuid`, `name`, `cover`, `type`, `duratime`, `director`, `actors`, `setnum`, `years`, `country`, `category`, `intro`, `imgs`, `provider`, `isrecommend`, `viewtimes`, `filepath`, `creatime`, `status`, `isdel`)
VALUES
	(182,'0010990d-df65-43d4-83a8-a6b61114ff35','绑架弗雷迪喜力','绑架弗雷迪喜力_Big.png',1,'127分钟','Maarten Treurniet','鲁特格尔·哈尔/吉斯·纳贝',1,2011,'荷兰','犯罪','喜力是世界著名啤酒巨头喜力啤酒的总裁，他因喜力啤酒而世界闻名。但是在1983年的三周里，他却因为另一事件闻名。因为在11月初，他遭到了绑架，并且和他的司机做了三个礼拜的人质。',NULL,'线下',1,8,'绑架弗雷迪喜力','2015-11-26 10:58:02',1,NULL),
	(47,'0017fe28-dacc-4df7-9151-0b457276f69c','霸王别姬','',1,'173分钟','陈凯歌','张国荣/巩俐/张丰毅/葛优/英达/雷汉',1,1993,'中国','剧情','段小楼（张丰毅）与程蝶衣（张国荣）是一对打小一起长大的师兄弟，两人一个演生，一个饰旦，一向配合天衣无缝，尤其一出《霸王别姬》，更是誉满京城，为此，两人约定合演一辈子《霸王别姬》。但两人对戏剧与人生关系的理解有本质不同，段小楼深知戏非人生，程蝶衣则是人戏不分。 段小楼在认为该成家立业之时迎娶了名妓菊仙（巩俐），致使程蝶衣认定菊仙是可耻的第三者，使段小楼做了叛徒，自此，三人围绕一出《霸王别姬》生出的爱恨情仇战开始随着时代风云的变迁不断升级，终酿成悲剧。',NULL,'线下',1,0,'霸王别姬','2015-11-26 10:58:02',1,NULL),
	(116,'01d6a325-46dd-41ea-8d2b-1a357071d75e','初恋红豆冰','初恋红豆冰_Big.png',1,'103分钟','阿牛','阿牛/李心洁',1,2010,'中国','爱情','马来西亚的小村落，一群少年来到青春之初：阿牛与心洁青梅竹马，胆小阿牛却只会凭画寄意；曹格撩是斗非最后爱到发狂，静茹则一味含情脉脉。恋恋的心左右求缘，有人去闯天下，有人寻找父亲，情爱路上总有个十字路口。阿牛初次执导，大马帮歌手情义相挺，有板有眼，合演一幕八角雾之恋。初恋是一袋红豆冰，转眼便溶掉，能回味的，是藏在心里略带轻涩的甜。',NULL,'线下',1,0,'初恋红豆冰','2015-11-26 10:58:02',1,NULL),
	(308,'0219d1ad-6243-445a-81b2-071a07920750','滚蛋吧肿瘤君','滚蛋吧肿瘤君_Big.png',1,'128分钟','韩延','白百何/吴彦祖/李媛',1,2015,'中国','励志','该影片讲述了29岁的乐天派漫画家熊顿因患癌症身处人生最艰难的时刻但同样对着命运微笑的故事。',NULL,'线下',1,0,'滚蛋吧肿瘤君','2015-11-26 10:58:02',1,NULL),
	(206,'02e9ebae-b172-4689-b3b6-d69bd5fe6e11','金刚狼2','金刚狼2_Big.png',1,'126分钟','詹姆斯·曼高德','休·杰克曼/冈本多绪',1,2013,'美国','动作','金刚狼罗根（休·杰克曼 饰）在自我放逐、四处为家的生活中，辗转来到了日本，原本只是想见一面病重即将离世的友人，却被卷入杀气十足的家族继承战，逃亡途中，罗根意外发现他丧失了自愈的能力，金刚狼最大的危机降临…… ',NULL,'线下',1,0,'金刚狼2','2015-11-26 10:58:02',1,NULL),
	(155,'032a79a6-914d-4f13-8f14-31d39f0591b7','暴力街区（2014）','暴力街区（2014）_Big.png',1,'90分钟','卡米勒·德拉马雷','保罗·沃克/大卫·贝尔',1,2014,'美国','动作','该片是国际著名导演吕克·贝松所指导的经典动作电影《暴力街区13》的升级加强版，讲述了芝加哥一批大规模杀伤性武器被一名贫民窟的毒贩偷窃，于是由保罗·沃克饰演的警探与卧底（大卫·贝尔）深入贫民窟调查，最终揭露了一个被隐瞒多年的惊天大阴谋。',NULL,'线下',0,0,'暴力街区（2014）','2015-11-26 10:58:02',1,NULL),
	(323,'03517e95-c4e3-4543-a005-ff7ef36b2e1e','不凡之路','不凡之路_Big.png',1,'100分钟','格伦·威尔斯','戴夫·帕特尔/佐伊·克罗维兹',1,2014,'美国','剧情','这部独立电影由《天堂一角》的编剧格伦·威尔斯（Gren Wells）自编自导，翻拍自2010年的德国影片“文森特想去海边”（Vincent Wants to Sea），是威尔斯的首度剧情长片。',NULL,'线下',0,0,'不凡之路','2015-11-26 10:58:02',1,NULL),
	(254,'041fc006-0a34-437b-a311-3c6635f5d57c','速度与激情7','速度与激情7_Big.png',1,'137分钟',' 温子仁','范·迪塞尔/保罗·沃克/杰森·斯坦森',1,2015,'美国','冒险','影片剧情将在多米尼克的团队和大反派德卡特·肖之间展开，讲述德卡特·肖为其弟报仇的故事。',NULL,'线下',0,0,'速度与激情7','2015-11-26 10:58:02',1,NULL),
	(149,'0443c99c-17dc-4054-a708-fe78864a1bc6','斗士','斗士_Big.png',1,'115分钟','大卫·拉塞尔','马克·沃尔伯格/克里斯蒂安·贝尔',1,2010,'美国','运动','主要讲述了拳击手米奇·沃德（马克·沃尔伯格饰）成为世界轻中量级拳王的经历。米奇同母异父的兄弟迪克·爱克兰德（克里斯蒂安·贝尔饰），曾经也是一个颇具天赋的拳击手，却因为毒品而一蹶不振。然而后来他终于重新振作，监督米奇进行各种训练，最终帮助他夺得了拳王桂冠。',NULL,'线下',0,0,'斗士','2015-11-26 10:58:02',1,NULL),
	(156,'04d83413-7dc2-4258-8061-d3c3ff67cb72','暴疯语','暴疯语_Big.png',1,'99分钟','李光耀','刘青云/黄晓明',1,2015,'中国','惊悚','一桩极其残忍的凶杀案震惊了全香港，当事人范国生（刘青云 饰）杀害了他的妻子，后被诊断有精神问题而暂时逃脱法律制裁，送进精神病院接受治疗…',NULL,'线下',0,0,'暴疯语','2015-11-26 10:58:02',1,NULL),
	(355,'055667f7-4e08-4959-aa5c-e4a420119451','模仿游戏','模仿游戏_Big.png',1,'114分钟 ','莫腾·泰杜姆','凯拉·奈特莉/本尼迪克特·康伯巴奇',1,2014,'美国/英国','传记 ','影片改编自安德鲁·霍奇斯编著的传记《艾伦·图灵传》，讲述了“计算机科学之父”艾伦·图灵的传奇人生，故事主要聚焦于图灵协助盟军破译德国密码系统“英格玛”，从而扭转二战战局的经历。',NULL,'线下',0,0,'模仿游戏','2015-11-26 10:58:02',1,NULL),
	(239,'0563df51-402f-4ce9-bbf0-17675781af2c','魔力麦克','魔力麦克_Big.png',1,'110分钟',' 史蒂文·索德伯格','查宁·塔图姆/亚历克斯·帕蒂弗/马修·麦康纳',1,2012,'美国','喜剧','影片根据查宁·塔图姆的真实人生经历改编而成，他19岁的时候曾在弗罗里达州坦帕市做过脱衣舞男。故事讲述的是“魔力麦克”训练另一名年轻舞者（以塔图姆为原型）进入这一行的故事。 ',NULL,'线下',0,0,'魔力麦克','2015-11-26 10:58:02',1,NULL),
	(390,'05f9828d-f6c1-4a04-b463-67094477f20b','远离尘嚣','远离尘嚣_Big.png',1,'119分钟 ','托马斯·温特伯格','凯瑞·穆丽根/马提亚斯·修奈尔茨',1,2015,'英国','爱情','根据英国著名小说家托马斯·哈代成名作《远离尘嚣》改编。故事发生在维多利亚时代一个远离尘嚣、风景如画的偏僻乡村。一个美丽女孩的到来，引起了农庄的男人们的燥动不安。三个男人不期而至，一个轻佻，一个敦厚，一个疯狂。三个男人以各自不同的方式爱着她或让她觉得被爱。',NULL,'线下',0,0,'远离尘嚣','2015-11-26 10:58:02',1,NULL),
	(327,'06be2cf9-8ba5-4d33-bb9a-bcb2df51ed18','单亲度假村','单亲度假村_Big.png',1,'117分钟','弗兰克·克拉斯','亚当·桑德勒/德鲁·巴里摩尔',1,2014,'美国','喜剧','本片中，亚当·桑德勒与德鲁·巴里摩尔出演两位单亲爸妈，在一次灾难性的相亲之后，两人当场闹掰并发誓永不再见。然而机缘巧合的是，他们竟不约而同地订购了同一个非洲狩猎家庭旅行团，并且不得不与对方子女共享一座奢华的度假别墅……',NULL,'线下',0,0,'单亲度假村','2015-11-26 10:58:02',1,NULL),
	(253,'070cd65c-beda-4d84-ae97-9f2adfad955c','九层妖塔','九层妖塔_Big.png',1,'115分钟','陆川','赵又廷/姚晨/唐嫣/凤小岳',1,2015,'中国','冒险','片改编自小说《鬼吹灯之精绝古城》，主要讲述探险队成员胡八一和Shirley杨深入昆仑山腹地，在神秘组织749局的介入下，揭开了一段人类与鬼族时隔千年的秘密史。',NULL,'线下',0,0,'九层妖塔','2015-11-26 10:58:02',1,NULL),
	(329,'072c8087-b63c-4786-8686-ed6181379287','恶魔之手','恶魔之手_Big.png',1,'85分钟','克里斯蒂安·E·克里斯蒂安森','卢夫斯·塞维尔/阿莉希亚·德布纳姆',1,2014,'美国','惊悚','影片讲述一个与世隔绝的小镇“新伯利恒”（New Bethlehem），一群虔诚的人在几位长者的领导下自耕自耘地生活。 \n小镇的六户人家里，有六位，在第六个月的第六天，出生的女孩，在她们的18岁生日之夜，一个接一个地神秘失踪，继而死于非命。小镇流传的古老预言说过，六个女孩中只有一个会活下来，而她则会化身为恶魔之手。\n',NULL,'线下',0,0,'恶魔之手','2015-11-26 10:58:02',1,NULL),
	(136,'0740d78a-24b6-4034-8e98-23d01e70e271','她','她_Big.png',1,'126分钟','斯派克·琼斯','华金·菲尼克斯/斯嘉丽·约翰逊',1,2013,'美国','喜剧','作家西奥多(华金·菲尼克斯 饰)在结束了一段令他心碎的爱情长跑之后，他爱上了电脑操作系统里的女声，这个叫“萨曼莎”的姑娘(斯嘉丽·约翰逊 声)不仅有着一把略微沙哑的性感嗓音，并且风趣幽默、善解人意，让孤独的男主泥足深陷。',NULL,'线下',0,0,'她','2015-11-26 10:58:02',1,NULL),
	(104,'07665884-0e59-4ece-bb92-dccf62ebc781','保持通话','保持通话_Big.png',1,'110分钟','陈木胜','古天乐/徐熙媛',1,2008,'中国香港','悬疑','改编自好莱坞电影《一线生机》(Cellular)，讲述单亲妈妈Grace（徐熙媛饰演）这天如常送女儿如婷上学，途中却被悍匪以霍（刘烨饰演）驾车栏腰猛撞，在她半昏半醒、全身无力的状态下，目睹以霍在她屋内大肆搜索，更以凶残手法杀害其女佣！然后把Grace掳走并锁到一个货柜内。以霍逼使Grace交出他的犯罪证据，否则把她全家干掉。惊惶失措的Grace趁无人看守时竭力地把一台损毁的手机重组，奇迹地打出一个求救电话，意外拨通给任职财务公司贷款部职员的阿邦（古天乐饰演）。',NULL,'线下',0,0,'保持通话','2015-11-26 10:58:02',1,NULL),
	(258,'079e479f-6684-402e-b4fa-d29149e8d64a','大话天仙','大话天仙_Big.png',1,'91分钟','刘镇伟/刘京平','孙俪/郑中基/郑伊健/郭德纲',1,2014,'中国','喜剧','影片以古典四大名著之一《水浒传》为蓝本，重新塑造武松、武大郎、潘金莲、西门庆之间广为人知的奇情故事，继续延续“大话西游”系列无厘头模式。 ',NULL,'线下',0,0,'大话天仙','2015-11-26 10:58:02',1,NULL),
	(210,'07a38633-c9a1-42eb-bbf8-78cc9d99e743','不求上进的玉子','不求上进的玉子_Big.png',1,'77分钟','山下敦弘','前田敦子/康巢恩',1,2013,'日本','喜剧','玉子的工作，善次的爱恋，父女俩别别扭扭的生活在一起，爱之深又恨之切。春夏秋冬，交替变幻。玉子在爸爸的注视下朝着未来迈出重要的一步……',NULL,'线下',0,0,'不求上进的玉子','2015-11-26 10:58:02',1,NULL),
	(244,'07e330b1-695e-4d4d-8554-614809f5a358','福尔摩斯先生','福尔摩斯先生_Big.png',1,'103分钟','比尔·康顿','伊恩·麦克莱恩/米罗·帕克/劳拉·琳妮',1,2015,'美国','犯罪','影片改编自米切·库林的小说《心灵诡计》，故事背景设定在1947年，讲述了退休后的福尔摩斯与管家及管家的儿子住在萨西克斯郡一个寂静的小村庄，发现了一起几十年前的悬案，因而下定决心要解开真相的故事。',NULL,'线下',0,0,'福尔摩斯先生','2015-11-26 10:58:02',1,NULL),
	(171,'08354038-1db9-4ea0-ad7d-ebb2f67a4ea2','环形使者','环形使者_Big.png',1,'118分钟','莱恩·约翰逊','约瑟夫·高登-莱维特/布鲁斯·威利斯',1,2012,'美国','动作','这是一部关于时间旅行的电影，它的背景被设定在不久的未来。这部影片的基调十分黑暗，讲述了一群名为“环形杀手”的成员专门为大型犯罪组织暗杀来自未来的人，大老板们会把暗杀目标禁锢将其秘密从未来送回到过去。',NULL,'线下',0,0,'环形使者','2015-11-26 10:58:02',1,NULL),
	(234,'0837bf88-47e6-49a1-b459-ba306f2c5252','王朝的女人杨贵妃','王朝的女人杨贵妃_Big.png',1,'\n122分钟 ','十庆','范冰冰/黎明',1,2015,'中国','古装','影片描述了以杨贵妃和唐明皇的传奇爱情为核心，讲述了一系列战争与宫廷阴谋的故事，全景展现盛唐壮阔如画的爱恨情仇。',NULL,'线下',0,0,'王朝的女人杨贵妃','2015-11-26 10:58:02',1,NULL),
	(105,'0945076a-d170-4ea7-b157-383ff0ce8e31','倾城','倾城_Big.png',1,'89分钟','黄宏','黄觉/林心如',1,2013,'中国','剧情','电影《倾城》是发生在汶川大地震后三天内的故事，一个与世隔绝的小城的人们开始了自救，局限的时间、空间，令情节显得十分独特，三个小人物的命运在大灾面前出现改变，重新看清世界，看清自己，看清了生命的本质。',NULL,'线下',0,0,'倾城','2015-11-26 10:58:02',1,NULL),
	(85,'0bcc7e27-8dea-4ce1-9252-81ad9527bb75','超能陆战队','',1,'111分钟','唐豪尔','莱恩波特/史考特阿达斯特',1,2015,'美国','动漫','未来世界的超级都市旧京山（San Fransokyo），热爱发明创造的天才少年小宏，在哥哥泰迪的鼓励下参加了罗伯特·卡拉汉教授主持的理工学院机器人专业的入学大赛。他凭借神奇的微型磁力机器人赢得观众、参赛者以及考官的一致好评，谁知突如其来的灾难却将小宏的梦想和人生毁于一旦。大火烧毁了展示会场，而哥哥为了救出受困的卡拉汉教授命丧火场。身心饱受创伤的小宏闭门不出，哥哥生前留下的治疗型机器人大白则成为安慰他的唯一伙伴。原以为微型机器人也毁于火灾，谁知小宏和大白竟意外发现有人在某座废弃工厂内大批量地生产他的发明。 ',NULL,'线下',0,0,'超能陆战队','2015-11-26 10:58:02',1,NULL),
	(140,'0be8e714-2d55-40ee-9216-9ded5f2c8046','小淘气尼古拉','小淘气尼古拉_Big.png',1,'91 分钟',' 劳伦·泰拉德','马克西姆·戈达尔/瓦莱丽·勒梅西埃/凯德·麦拉德',1,2013,'法国','喜剧','根据由法国作家勒内·戈西尼创作，漫画家让·雅克·桑贝配画的系列同名漫画故事改编。讲述了小尼古拉因误会爸爸妈妈生小弟弟而不要他，四处寻求帮助而衍生的小故事。',NULL,'线下',0,0,'小淘气尼古拉','2015-11-26 10:58:02',1,NULL),
	(371,'0c541cae-e777-4b71-a771-3f37a29c2a00','生命之书','生命之书_Big.png',1,'95分钟','若热·R·古铁雷兹','迭戈·鲁纳/查宁·塔图姆',1,2014,'美国','冒险','影片灵感来自于墨西哥传统节日“鬼节”(Day of the Dead)的传说，讲述了三位青梅竹马的好友，马诺洛(迭戈·鲁纳配音)、玛利亚(佐伊·索尔达娜配音)和华金(查宁·塔图姆配音)之间的故事。故事从博物馆里的一本书神秘之书讲起，随着镜头的推进，影片来到了另一个世界。这是一个关于拉丁神话的世界，马诺洛、玛利亚和华金是青梅竹马的好朋友，马诺洛和华金同时喜欢上了玛利亚，但是爱情的最终决定权不在于玛利亚，而是神灵。',NULL,'线下',0,0,'生命之书','2015-11-26 10:58:02',1,NULL),
	(20,'0d589378-b1d2-4f8f-8cbc-4012cb95d793','黄飞鸿之英雄有梦','黄飞鸿之英雄有梦_Big.png',1,'120分钟','周显扬','彭于晏/洪金宝/王珞丹/井柏然/王祖蓝/张晋',1,2014,'中国','动作','1868年的清末，朝廷腐败让人民生活备受煎熬。在广州，黑虎帮和北海帮子两大恶势力横行于黄埔港，以暴力威胁统治在港口的穷苦人民，让他们生活在水深火热之中。在外界看来，黄埔港是个繁荣并充满机会地方，但深入其中，会发现这里其实是人间炼狱。 \n黑虎帮的老板雷公（洪金宝饰）因一个新兵手下阿飞（彭于晏饰），以过人身手及胆识直取北海帮子首领的头脑，而让黑虎帮独霸一方，不但靠鸦片赚进大笔银两，更进行着卑鄙的贩卖人口勾当，雷公更视阿飞如己出。其实，阿飞背后另有故事，心中更另有计划。阿飞和肝胆相照的朋友们设了陷阱，救出穷苦的人们，更公开与雷公进行生死决斗。\n黄埔港终于恢复了和平，也诞生了真正的英雄，这是黄飞鸿故事的开始。',NULL,'线下',0,0,'黄飞鸿之英雄有梦','2015-11-26 10:58:02',1,NULL),
	(352,'0f492d22-5d59-4dee-a780-8e6ed8804c64','名侦探柯南：异次元的狙击手','名侦探柯南：异次元的狙击手_Big.png',1,'110分钟','静野孔文','高山南/山口胜平',1,2014,'日本','动画','高达635米的铃木塔上发生了狙击事件，美国海军特种部队“海豹突击队”也牵涉其中。同时，FBI成员及冲矢昴、世良真纯等原作重要人物也首次在剧场版中登场。',NULL,'线下',0,0,'名侦探柯南：异次元的狙击手','2015-11-26 10:58:02',1,NULL),
	(285,'112dc6ba-41e8-4950-a00b-15ba19c2cb6a','无人驾驶','无人驾驶_Big.png',1,'105分钟','张杨','刘烨/高圆圆/李小冉',1,2010,'中国','爱情','影片讲述了数对都市男女之间的爱情纠葛，一场撞车将他们的命运纠缠在了一起。',NULL,'线下',0,0,'无人驾驶','2015-11-26 10:58:02',1,NULL),
	(214,'112fd073-902c-4720-88ef-5c3e1b67b1a2','雷神','雷神_Big.png',1,'114分钟','肯尼思·布拉纳','克里斯·海姆斯沃斯/娜塔莉·波特曼',1,2011,'美国','动作','《雷神》的故事发生在现今的地球以及艾斯卡的奇幻世界。故事的中心人物是勇有强大神力的雷神，但是他自大鲁莽的行为掀起了一场古老的战争，他也因此被贬入凡间作为惩罚，被迫与人类一同生活。托尔必须学会如何成为一个真正的英雄，才能对抗来自神界的强大黑暗势力。《雷神》一片探讨一个人的传奇冒险，他从一个傲慢自大的神界王位继承人被贬入凡间，他必须成为一名超级英雄才能登上王位。',NULL,'线下',0,0,'雷神','2015-11-26 10:58:02',1,NULL),
	(243,'11efe283-9377-4866-98a4-cff3ba3b0e82','国际市场','国际市场_Big.png',1,'126分钟',' 尹济均','黄政民/金允珍/吴达洙',1,2014,'韩国','剧情','《国际市场 》是由尹济均执导，黄政民、金允珍 、吴达洙主演的剧情片。影片讲述了纵有抱负理想却从没有为自己认真活过一次的德秀，为了家人拼搏一生的故事。',NULL,'线下',0,0,'国际市场','2015-11-26 10:58:02',1,NULL),
	(91,'1242d7ba-3704-4f20-bc8a-f463d4a9d966','圣龙奇兵大冒险','圣龙奇兵大冒险_Big.png',1,' 85分钟','乔彧 / 马系海 / 何钜宇','张页川/张琳',1,2013,'中国','动画','在很久以前，古代中原之地，粮田万顷，稻谷飘香。而近邻塞外野狼族一直对这片富庶之地一直虎视眈眈。于是，十二年之后，一纸战书传来。一场大战避无可避！ \n　　凤凰古城中，命运的造化将拾儿、红袖、九斤、巨象、大花面、狂牛这六个普通少年推向了这场战争的风口浪尖。 \n　　拾儿，他本是一名孤儿。因常年在果栏做苦力，并跟随年迈的师父修习武艺，练成独门绝技“飞云连环腿”，与年龄相仿的五个少年一起无拘无束玩耍，而内心深处共同怀揣着炙热的惩恶扬善以及武侠梦欢乐成长！ \n　　兵临城下，而几位少年的离奇身世随之浮出水面——那个挑起战火的野狼族首领竟是拾儿的生身父亲，一直与自己并肩作战的红袖竟是中原皇帝的独生爱女；父子骨肉之情浓于水，乡亲养育之恩重如山，伙伴相守之情义薄云天！少年们内心波澜起伏，难以取舍！ \n　　大爱无疆，天下与共。自古英雄出少年，真正的奇兵勇士贵在敢于冒险，骨子里沸腾着侠义的热血。个人执念抛弃一边，如何用一招“凤舞九天”力挽狂澜于既倒。成败一念，取舍之间，奏一曲少年英雄梦，谱一段侠骨柔肠！',NULL,'线下',0,0,'圣龙奇兵大冒险','2015-11-26 10:58:02',1,NULL),
	(58,'12cea2b4-d983-42f5-b2e1-8fa6907c0857','厨子戏子痞子','',1,'118分钟','管虎','刘烨/张涵予/黄渤/梁静/田中千绘',1,2013,'中国','喜剧','20世纪40年代初，日本731部队投放的细菌发生变异，“虎烈拉”横行华北，进而威胁到日军。日军密电急召专家携秘方前来灭疫灾。北平城被日军封城。城外瘟疫，城里饥荒。\n　　一个流氓饿得不行了，误打误撞把两个日本人劫到了一家日本料理店里。料理店里只有中国人店主夫妇和一个神叨叨的驻店唱戏戏子。怎么处理这俩日本人成了难题。店主怕得要死，要立刻放人。流氓为了赶紧扔掉这俩烫手的山芋尽快脱身，谎称自己是八路，要把俩日本人存在店主这儿。戏子则要把日本人和流氓都杀了，省得放了日本人得罪八路，放了八路得罪日本人。为了让另外俩人听自己的，流氓掏出手榴弹，厨子拿出刀，戏子举着矛。三个人陷入僵局。店主老婆翻两个日本人行李，忽然发现两个日本人的真实身份竟然是731派来救灾的生化专家。由此，流氓不跑了，戏子也不杀了，三人达成共识：套出秘方，发财分赃！流氓和戏子逼着店主做翻译，轮番用各种阴招审问日本人，而汉奸店主还在翻译的过程中偷偷地帮助日本人。\n　　实际上，一切都是为了得到虎烈拉的疫苗元素。',NULL,'线下',0,0,'厨子戏子痞子','2015-11-26 10:58:02',1,NULL),
	(281,'13f36835-5b03-4eaa-9e83-634e235bd623','我爱奇诺奥','我爱奇诺奥_Big.png',1,'111分钟','秋山贵彦','本乡奏多/多部未华子',1,2005,'日本','科幻','经过了20多年的精心酝酿完成的《奇诺奥》是秋山亲自执导的第一部作品。共同参与编剧的还有曾获第57届奥斯卡短篇动画片奖提名的《头山》的编剧米村正二，和《水的旅人》，《河童》的编剧末谷真澄。',NULL,'线下',0,0,'我爱奇诺奥','2015-11-26 10:58:02',1,NULL),
	(52,'1405255e-18b9-41b4-8c47-f85ea12e79e3','铜雀台','',1,'107分钟','赵林山','周润发/刘亦菲/苏有朋/伊能静/邱心志/玉木宏',1,2012,'中国','剧情','庚子年，恰逢天象“四星合一”，预示改朝换代之征兆。曹操(周润发饰)的部属、尤其他的公子曹丕(邱心志饰)，希望借此良机推献帝禅位、曹操登基；同时反对曹操的势力，也加\n紧了行动，无人知晓四星合一之时，大汉天下将发生何种惊天动地之事。关中，马超、韩遂的俘虏营后方，少男穆顺(玉木宏饰)、少女灵雎(刘亦菲饰)被一支铁骑掠走，押到一个巨大陵墓里，进行残酷的训练，他们将被塑造成铁血死士，完成一个不可告人的惊天任务。五年后，曹操盛殓关羽，回到铜雀台（今邯郸市临漳县），灵雎一袭红衣出现在曹操身旁。柔弱的汉献帝(苏有朋饰)、野心勃勃的伏后(伊能静饰)对曹操的归来噤若寒蝉，大臣们亦是各怀鬼胎。四星即将合一，一出“杀死曹操”的阴谋大戏正在紧锣密鼓的谋划着……',NULL,'线下',0,0,'铜雀台','2015-11-26 10:58:02',1,NULL),
	(212,'141f3afe-cda7-4310-a576-c7eab817a8ff','百团大战','百团大战_Big.png',1,'111分钟','宁海强','陶泽如/刘之冰/印小天',1,2015,'中国','战争','百团大战是中国抗日战争时期，中国共产党领导下的八路军和广大人民群众与日军在中国华北地区发动的一次规模最大、持续时间最长的战役。这场战争极大的影响了整个世界反法西斯战争格局，起到了非常重要的作用：首先是牵制住了日本兵力，同时中国的大胆出手，也影响到其它国家也开始勇于在东南亚战场、太平洋战场和欧洲战场强势出击，正面对战。',NULL,'线下',0,0,'百团大战','2015-11-26 10:58:02',1,NULL),
	(146,'15ed36c3-f560-4b7f-92d8-4a637b3018b3','战马','战马_Big.png',1,'146分钟','史蒂文·斯皮尔伯格','杰瑞米·艾文/彼得·穆兰',1,2011,'美国','战争','故事描述一匹名叫乔伊的的马、在幼儿时期遇见了百般疼爱它的小主人艾伯特，并建立了相知相惜、血浓于水般的情谊。',NULL,'线下',0,0,'战马','2015-11-26 10:58:02',1,NULL),
	(302,'16ba6f48-b0d6-462c-8054-db88c30f0f21','心跳戈壁','心跳戈壁_Big.png',1,'98分钟','甄人','邵兵/董璇/彭波',1,2015,'中国','悬疑','该片讲述的是七个摩托车越野爱好者，相约去穿越一片人迹罕至、传说中“鸟都飞不过去”的古尔古特大戈壁。但他们未曾想到的是，在这个片六七百公里的无人区背后，看似平静的旅途中却中隐藏着巨大的杀机……他们面临的是一场场生与死的较量。',NULL,'线下',0,0,'心跳戈壁','2015-11-26 10:58:02',1,NULL),
	(37,'16fb7a3f-5596-4875-939e-7da93b40d8fa','京城81号','京城81号_Big.png',1,'90分钟','叶伟民','吴镇宇/林心如/杨佑宁/秦海璐/莫小棋/夏文汐/李菁/金燕玲',1,2014,'中国','惊悚','民国初年，位于京城八大胡同内的青楼歌舞升平，尤以头牌陆蝶玉艳惊四座，引得万人空巷。但她早已倾心京城大户霍家三少爷，几经波折，陆蝶玉嫁入霍家。怎料新婚之夜新郎却变成刚刚过世的霍家二少爷,冥婚后不久陆蝶玉离奇怀孕，一时鬼胎传言四起，家族上下不安，不久便举家惨遭灭门，留下阴宅保留至今。一百年后，81号古宅后人许若卿重返故居，百年前发生在这里的惨案历历在目。同时，她的出现也意外唤起了古宅内尘封已久的孤魂孽怨。',NULL,'线下',0,0,'京城81号','2015-11-26 10:58:02',1,NULL),
	(33,'177277a9-e671-4b22-ae2b-72215090556f','笔仙惊魂1','笔仙惊魂1_Big.png',1,'92分钟','关尔','何杜娟/翟文斌/王一/柴碧云/午马',1,2012,'中国','惊悚','小武、慕凡、柳丝丝、凌菲儿是艺校即将毕业的学生，是好朋友，也是两对情侣。临近毕业，租住近郊一套被当地人视为鬼屋的老四合院。入住当晚，四人玩了请笔仙的游戏，谁知道从此犹如打开了潘多拉的魔盒。小武犯下了请笔仙的最大禁忌——追问笔仙的死因，笔流下了一滴血泪，整个请笔仙的游戏仓促结束，因此又犯下第二大禁忌——没有送走笔仙。当天晚上，小武在噩梦与真实之间穿梭，当他在晨光里醒来的时候，以为只是一场结束的梦魇，却不知道这恰恰是噩梦的开始。\n神秘的黑衣老太太总是抱着黑猫在他们身边出没，邻居异样的眼神，邻居的院子里整棵树上挂满了死去的黑猫，半夜三更蹑手蹑脚走向他们的鬼影，以及被噩梦困扰而渐渐失去常态、相互陌生的四人……\n同学菊子告诉他们，如果没有送走笔仙，那它会一直缠着他们，不死不休。而真正的幕后黑手随着事情的发展而显露出来，原来这一切都是一场阴谋。',NULL,'线下',0,0,'笔仙惊魂1','2015-11-26 10:58:02',1,NULL),
	(228,'17a3ff88-ea0b-43c3-a208-66990d582cca','七月半之恐怖宿舍','七月半之恐怖宿舍_Big.png',1,'91分钟','杜潇傲','余心恬/翟子陌/马元',1,2015,'中国','惊悚','传说每年农历七月半前后，死去的孤魂野鬼都会游走人间，去他们生前熟悉的地方，唤起尘封已久的孤魂孽怨。\n大一新生安澜（余心恬饰）等入住一间尘封多年、闹过鬼且死过人的宿舍，在七月半的那天晚上接连出现各种诡异的事情。影片没有各种吓人的鬼脸道具、阴森环境和封闭空间的故弄玄虚来单纯吓人。但是在七月半看似幽雅宁静中，随着传统鬼节“七月半”的到来，数名青春靓丽的女大学生开始遭受着无孔不入的惊恐，又一个个离奇而恐怖地死去，令人揪心扼腕 ',NULL,'线下',0,0,'七月半之恐怖宿舍','2015-11-26 10:58:02',1,NULL),
	(290,'18b29d8a-1f32-411e-9a2d-ca33a20d7854','倚天屠龙记之魔教教主','倚天屠龙记之魔教教主_Big.png',1,'103分钟',' 王晶','李连杰/张敏/邱淑贞',1,1993,'中国','动作','该片讲述了张无忌学会了九阳神功、乾坤大挪移，揭破了朝廷歼灭六大门派的阴谋，救出了他外公和师祖的故事。 ',NULL,'线下',0,0,'倚天屠龙记之魔教教主','2015-11-26 10:58:02',1,NULL),
	(107,'18e258b3-bb40-4ecf-89c7-4a929b0826b2','僵尸世界大战','僵尸世界大战_Big.png',1,'116分钟 ','马克·福斯特','布拉德·皮特/达妮埃拉·科特兹',1,2013,'美国','动作 ','联合国雇员盖瑞·莱恩横穿大半个地球，目的只有一个：阻止肆虐的僵尸推翻国家和政府，避免使整个人类遭到灭顶之灾……他不得不离开妻子和孩子，投入到危险的工作之中，足迹踏遍全球对幸存者进行调查。',NULL,'线下',0,0,'僵尸世界大战','2015-11-26 10:58:02',1,NULL),
	(144,'191b9a04-8eae-4a5d-a9d5-88b5861e2acb','异形4','异形4_Big.png',1,'115分钟','让-皮埃尔·热内','西格妮·韦弗/薇诺娜·瑞德',1,1997,'美国','惊悚','强悍的蕾普莉与异形同归于尽，挽救了地球人。这次她被复制了，一群科学家及政客异想天开的计划要结合贩卖人口的团体，想藉由复制大批异形做为他们统治世界的工具，他们以为他们已经了解了异形这种外太空怪物的一切，却低估了他们的智慧，产下异形的蕾普莉真的该杀死自己的亲骨肉吗？',NULL,'线下',0,0,'异形4','2015-11-26 10:58:02',1,NULL),
	(367,'1975c482-75c9-4727-8ae3-1f97dc75c2bf','涉足荒野','涉足荒野_Big.png',1,'115分钟','让-马克·瓦雷','瑞茜·威瑟斯彭/劳拉·邓恩',1,2014,'美国','传记','影片改编自谢莉尔·斯瑞德的自传，故事讲述谢莉尔在母亲去世、婚姻破裂后，背上行李包，踏上长达1100英里的远足之旅。',NULL,'线下',0,0,'涉足荒野','2015-11-26 10:58:02',1,NULL),
	(345,'1aa30411-14f2-4be7-b412-73921c98cf54','利维坦','利维坦_Big.png',1,'140分钟','安德烈·萨金塞夫','弗拉季米尔·弗多维琴科夫/耶伦娜·利亚多娃',1,2014,'俄罗斯','剧情','影片的故事背景设置在一个未来的“新国家”，人们的生活面临了前所未有的困境，而这种不安全感，爆发出了强烈的戏剧冲突。',NULL,'线下',0,0,'利维坦','2015-11-26 10:58:02',1,NULL),
	(143,'1ad6fb8c-ad4a-45d2-b118-564884d07253','年鉴计划','年鉴计划_Big.png',1,'106分钟','迪恩·以色列特','乔尼·维斯顿/艾米·兰德克',1,2014,'美国','科幻 ','讲述美国几名青少年无意间发现了一个时光机器，他们在时光旅行中改变着自己的过去和未来，但是在他们随意改写了历史之后，周围的世界也发生了不可思议的变化。',NULL,'线下',0,0,'年鉴计划','2015-11-26 10:58:02',1,NULL),
	(84,'1b4e6cdc-8350-4d65-bd2b-12d949c9bdba','末日崩塌','末日崩塌_Big.png',1,'114分钟','布拉德·佩顿','道恩·强森/亚历珊德拉·达达里奥/卡拉·古奇诺 ',1,2015,'美国','灾难','雷·盖恩斯（道恩·强森 Dwayne Johnson 饰）正驱车前往旧金山，随着一声巨响，周围的树木与电线杆变得七扭八歪，紧急刹车查看状况的盖恩斯被眼前的景象“惊呆了”:公路被一条深不见底的裂隙截断，甚至错位，加油站被裂成两半隔着“峡谷”遥遥相对。随着这场超级地震毫无预 兆的来袭，整个城市浓烟滚滚、火光冲天，高楼大厦相继倒塌，到处都是惊慌失措的市民。更要命的是，如此强烈的地震，“摧枯拉朽”般粉碎了坚实的大坝，洪水如猛兽一般涌向已经水深火热的城市，“天崩地陷”的景象犹如“末日”已然来临……',NULL,'线下',0,0,'末日崩塌','2015-11-26 10:58:02',1,NULL),
	(232,'1bbabbf4-53c8-4ddb-a483-c651c107fdef','幸存的女孩','幸存的女孩_Big.png',1,'\n88分钟','托德·施特劳斯-斯古尔森','泰莎·法梅加/妮娜·杜波夫',1,2015,'美国','惊悚','影片讲述女孩麦克斯(法米加饰)，穿越到妈妈(阿克曼饰)年轻时主演的恐怖片中，她必须联手俊男美女，干掉杀人狂魔。',NULL,'线下',0,0,'幸存的女孩','2015-11-26 10:58:02',1,NULL),
	(97,'1c2a3377-7020-4c48-9f32-f9156d828d7e','下一站再爱你','下一站再爱你_Big.png',1,'90分钟','李德威','马浚伟/杨梓嫣',1,2014,'中国','爱情','萱萱的病情日渐加重，眼看自己已经不久人世，她开始担心日后无人照顾万豪，因此，她想把身边的好友介绍给万豪，希望在她离开人世之后有人能代替她照顾万豪，萱萱经过精心策划，安排了两人在某咖啡厅见面，为了想要了解两人的进展，萱萱让“阿猫“偷偷带她去咖啡厅，两人躲在角落观察着万豪和青青的约会，远处的万豪和青青有说有笑，万豪还在青青耳边说起了悄悄话，萱萱看在眼里，内心很是纠结。',NULL,'线下',0,0,'下一站再爱你','2015-11-26 10:58:02',1,NULL),
	(36,'1d4f9e76-9370-40ba-af34-73b1f4dab760','孤岛惊魂','',1,'95分钟','钟继昌','陈小春/杨幂/叶山豪/蔡淑臻/黄又南/徐天佑',1,2011,'中国','惊悚','一次“生存游戏” 将沈依琳(杨幂饰)、彭非（陈小春饰)与其他六名同样年轻俊美的男女聚在一起，在电视台主持人及摄影师的带领下前往远离尘世的孤岛。他们彼此陌生、各怀心事，但目的却只有一个——为了百万美元的巨额奖金。利益驱使他们从登上游船那一刻起便开始针锋相对，但又无法阻止荷尔蒙的分泌，碧海蓝天下暧昧在陌生男女间肆意滋生，却不知危险已经悄悄降临。雄踞东南亚的亿万富豪——OEC集团总裁陈家栋（姜皓文饰）继承父亲的产业，并决心开发位于太平洋爪哇海上一个已经废弃40年之久的小岛。虽然父亲极力阻拦，但是利益熏心的家栋依然发起了一个孤岛探险的比赛。他开出100万元的巨额奖金，引得彭非、沈依琳、小野宏（叶山豪饰）等8名青年男女搭上了前往小岛的游艇。一切看似顺风顺水，游艇却在航行中遭遇了离奇海难，致令8个青年被迫滞留小岛。在这座岛上，他们不仅遭到疯狂野猪的袭击，还发现了一座几成废墟的麻风病人的医院。此后不久，恐怖的事情接连发生，众人陷入一个无法退出的死亡游戏之中。',NULL,'线下',0,0,'孤岛惊魂','2015-11-26 10:58:02',1,NULL),
	(289,'1dac42c7-d617-461b-accf-a3335dd9397e','姨妈的后现代生活','姨妈的后现代生活_Big.png',1,'107分钟','许鞍华','斯琴高娃/周润发/赵薇/卢燕/史可',1,2007,'中国','爱情','12岁的侄子宽宽，在假期去看望退休后独自在上海生活的姨妈（斯琴高娃 饰）。在宽宽眼里，姨妈是个怪癖多多的人。　　一次姨妈在公园遇到了一个从广东到上海来发展的江湖混混潘知常（周润发 饰），这个神秘男人使得姨妈神魂颠倒，两人因京剧成了知音，并演绎出一段黄昏恋情。',NULL,'线下',0,0,'姨妈的后现代生活','2015-11-26 10:58:02',1,NULL),
	(373,'1e906f73-4f80-4747-a273-491948575e28','失孤','失孤_Big.png',1,'108分钟','彭三源','刘德华/井柏然',1,2015,'中国','剧情','1998年，雷泽宽两岁的儿子雷达丢了，雷泽宽开始了长达十四年的寻子之路。一路上雷泽宽历经艰辛，还认识了四岁时被拐修车小伙曾帅。雷泽宽帮曾帅找到了失散多年的亲人，带着曾帅送他的导航仪继续自己的寻子之路。',NULL,'线下',0,0,'失孤','2015-11-26 10:58:02',1,NULL),
	(122,'1f1792a3-eddf-4e59-9a56-f01fa6438576','十万火急','十万火急_Big.png',1,'105分钟','杜琪峰','方中信/刘青云',1,1997,'中国香港',' 动作 ','一场灾难性的五级大火，对消防员自身构成危险，所有人必须离开火场，火场內藏有大量危险品及引致大爆炸，並且释放出大量有毒气体，而火场內仍有生还者待救。消防员包括云（刘青云飾）等在火场內，身处生死边缘，仍决定奋不顾身继续救人最后，他们能否成功……',NULL,'线下',0,0,'十万火急','2015-11-26 10:58:02',1,NULL),
	(40,'1f2cf62e-9228-46c8-afae-3e15eb9909a5','狼图腾','',1,'121分钟','让·雅克·阿诺','冯绍峰/窦骁/巴森/昂哈妮玛',1,2015,'中国','历险','1967年，北京知青陈阵和杨克响应国家上山下乡的号召，从北京来到了内蒙古额仑大草原插队。在大草原上，他们结识了蒙古族牧民毕利格一家，也见识到了草原上最令人敬畏的动物：狼。在与狼群的接触过程中，陈阵对这一物种有了强烈的兴趣，甚至有了想自己养一只小狼的念头。就在此时，一群外来人贪婪地掠夺了狼群储存过冬的黄羊，打破了狼群和牧民之间的生态平衡。而以场部主任包顺贵为首的生产队员更是发起了一场灭狼运动，让狼群和人类之间的关系陷入到了剑拔弩张的地步。',NULL,'线下',0,0,'狼图腾','2015-11-26 10:58:02',1,NULL),
	(286,'201d4072-02c6-4108-9fb3-06c78bbf94ba','嫌疑人X','嫌疑人X_Big.png',1,'118分钟','方恩珍','李瑶媛/柳承范/赵镇雄',1,2012,'韩国','悬疑','一位寡言的天才数学家石固(柳承范 饰)，他暗恋着特别亲善的女邻居花善(李瑶媛 饰)，有一天他察觉花善出于自卫而杀人的事实。数学家石固为了保全心爱的花善，为这桩犯罪设计完美的不在场的证明。',NULL,'线下',0,0,'嫌疑人X','2015-11-26 10:58:02',1,NULL),
	(385,'21ea3a5b-0be2-45f7-9978-91dd3ce74e9f','夜行者','夜行者_Big.png',1,'117分钟','丹·吉尔罗伊','杰克·吉伦哈尔/蕾妮·罗素',1,2014,'美国','犯罪 ','这部电影讲述一个年轻记者在夜晚的洛杉矶调查犯罪最终自己也卷入“犯罪”的故事。',NULL,'线下',0,0,'夜行者','2015-11-26 10:58:02',1,NULL),
	(248,'22495d86-2ab2-4ab4-a32d-59742b6b0bb9','特种部队','特种部队_Big.png',1,'118分钟','斯蒂芬·索莫斯','丹尼斯·奎德/查宁·塔图姆',1,2009,'美国','动作','影片讲述了恐怖组织“眼镜蛇”企图征服世界，美国政府为了保卫国家而组成了特种部队——G.I.Joe。杜克领导特种部队，为了抵御邪恶的眼镜蛇头领及其部下，发誓不论何时何地要为自由而战，赴汤蹈火除暴安良以伸张正义。战斗不断升级，对决一触即发。',NULL,'线下',0,0,'特种部队','2015-11-26 10:58:02',1,NULL),
	(74,'22e90c57-fc80-4af3-80cb-4d3407e0f9b6','赌圣','赌圣_Big.png',1,'116分钟','刘镇伟/元奎','周星驰/吴孟达/张敏/吴君如',1,1990,'中国','喜剧','该片讲述了身怀特异功能的大陆青年左颂星，来港投靠三叔。左颂星投靠三叔后，被发现具有特异功能，两叔侄开始走江湖，两人在香港误打误撞，无意中卷入黑社会的争霸争斗中。最后陈松成功的收买左颂星，关键时刻打败洪光。',NULL,'线下',0,0,'赌圣','2015-11-26 10:58:02',1,NULL),
	(353,'23d0d3da-bc1d-439d-934d-6dac84aee9f9','明星伙伴大电影','明星伙伴大电影_Big.png',1,'104分钟','Doug Ellin','杰里米·皮文/艾德里安·格尼尔',1,2015,'美国',' 喜剧','电影明星文斯跟他的哥儿们重出江湖，加入转为电影公司总经理的阿里旗下。他们在好莱坞割喉竞争的演艺圈里打滚，杀出重围，也使他们的抱负有了微小的改变，但彼此之间的友谊仍坚定无比。\n',NULL,'线下',0,0,'明星伙伴大电影','2015-11-26 10:58:02',1,NULL),
	(280,'24695c4a-febe-43e4-b302-3030b9c185b0','天黑请闭眼','天黑请闭眼_Big.png',1,'88分钟','阿甘','李小冉/张耀扬',1,2004,'中国','惊悚','这是由一个流行的酒吧游戏贯穿的恐怖故事。凡是在游戏中被“杀”的人，在当天晚上就真的被杀了。起初，大家并没有将这个事件与游戏联系起来。可是当悲剧再次重演，就难免不和游戏产生联想。游戏必须继续玩下去，因为每个人都想知道谁是凶手……',NULL,'线下',0,0,'天黑请闭眼','2015-11-26 10:58:02',1,NULL),
	(304,'25c88d99-f239-4744-88a6-5d6f7e4fad61','饥饿游戏3：嘲笑鸟（上）','饥饿游戏3：嘲笑鸟（上）_Big.png',1,'122分钟','弗朗西斯·劳伦斯','詹妮弗·劳伦斯/乔什·哈切森',1,2015,'美国','冒险','影片主要讲述了原本被彻底消灭在的第十三区再度出现，凯特尼斯被迫成为反抗者的棋子，肩负起了改变帕纳姆国的未来的使命。',NULL,'线下',0,0,'饥饿游戏3：嘲笑鸟（上）','2015-11-26 10:58:02',1,NULL),
	(338,'25fc1cec-8003-4afd-9c1e-6d41f32dbe77','欢迎来到我的世界','欢迎来到我的世界_Big.png',1,'105分钟','希拉·皮文','克里斯汀·韦格/詹姆斯·麦斯登',1,2014,'美国','喜剧','患边缘型人格障碍的爱丽丝中彩票后，支付电视台1500万美元，制作由她主持的脱口秀，圆了成为奥普拉的梦想。',NULL,'线下',0,0,'欢迎来到我的世界','2015-11-26 10:58:02',1,NULL),
	(4,'275de537-cf54-43b3-a8cc-3bee70f979c6','变形金刚4','变形金刚4_Big.png',1,'165分钟','迈克尔·贝','马克·沃尔伯格妮可拉·佩尔茨',1,2014,'美国','科幻','故事发生在前作芝加哥终极决战四年后，汽车人与霸天虎从地球销声匿迹，而人类也在断壁残垣的废墟中开始了新生。然而，一群手握大权的商人联合天才科学家，意欲通过那场入侵打破壁垒，研发出他们实则难以驾驭的全新技术。与此同时，地球也遭受到了一个古老而强大的变形金刚的威胁恫吓，关乎自由与奴役的正邪史诗决战一触即发……',NULL,'线下',0,0,'变形金刚4','2015-11-26 10:58:02',1,NULL),
	(126,'27b30b80-b243-4c7d-a13e-7b781e285948','同桌的你','同桌的你_Big.png',1,'98分钟','郭帆','周冬雨/林更新',1,2014,'中国','爱情','1993年的夏天，文静秀气、戴着一副小孔眼镜的转校生周小栀（周冬雨 饰），第一次见到了自己的同桌——坐在最后一排的捣蛋男生林一（林更新 饰），他们一起经历了初中、高中和大学的青葱岁月。林一对周小栀说：“总有一天，我会带你去一个只有我们俩的地方。”一晃十年……',NULL,'线下',0,0,'同桌的你','2015-11-26 10:58:02',1,NULL),
	(109,'27d2687a-44bc-4ae8-9c78-cbd2e7837e12','全城通缉','全城通缉_Big.png',1,'110分钟 ','汪涛','刘烨/赵文卓',1,2014,'中国','剧情','主人公唐越为寻找失踪的未婚妻，历经波折，生活轨迹发生了巨大变化。为找寻真相，他发现自己似乎陷入了一个谜局。某外资银行高管邵云峰失去了心爱的人，生活历练让他愈加沉稳深邃，事业取得巨大成就，运筹帷幄之间更显精英风范。白氏集团二小姐白晓若的出现让他的生活起了涟漪……两个痛失所爱的男人，站在正与邪、黑与白、善与恶、爱与恨、真相与谎言边缘线上，展开了一场智力与心理的较量……',NULL,'线下',0,0,'全城通缉','2015-11-26 10:58:02',1,NULL),
	(389,'282079af-9de8-46c2-8cc2-60b26908ed02','幽暗山谷','幽暗山谷_Big.png',1,'114分钟 ','安德里斯·普罗查斯卡','萨姆·赖利/托比亚斯·莫雷蒂',1,2014,'奥地利','西部','影片讲述了一名孤独的骑士来到了阿尔卑斯高处的一座小镇，这里没有人认识他，也没有人知道他来此地的目的。然而，小镇的所有人都希望这位陌生人赶紧离开。',NULL,'线下',0,0,'幽暗山谷','2015-11-26 10:58:02',1,NULL),
	(101,'2826eac8-8e0a-4c49-9a42-ea8af1c3f02f','人间小团圆','人间小团圆_Big.png',1,'96分钟','彭浩翔','古天乐/梁咏琪',1,2014,'中国','家庭 ','郑惠清（杨千嬅 饰）少年时因不懂事，做了一件使母亲大为光火的事。母亲去世后，她仍活在这事的阴影中。她弟弟郑伟滔（古天乐 饰）有一个看似美满的家庭，可是他却一直怀疑女儿非自己亲生，内心充满苦恼。最后两人都明白不能永远活在心魔中。',NULL,'线下',0,0,'人间小团圆','2015-11-26 10:58:02',1,NULL),
	(216,'28807094-77b7-4fe2-8e58-648b46f2cb80','魔境仙踪','魔境仙踪_Big.png',1,'130分钟','山姆·雷米','詹姆斯·弗兰科/米歇尔·威廉姆斯',1,2013,'美国','奇幻','该片讲述了一个招摇撞骗的小魔术师无意间来到魔境奥兹国，被误认为是救世主，被迫卷入三个女巫的勾心斗法。一方面他要与三位女巫缠斗，另一方面邪恶女巫也在暗中窥视，意图置他于死地并统治奥兹国，惟有真正的大魔法师才能与之抗衡。',NULL,'线下',0,0,'魔境仙踪','2015-11-26 10:58:02',1,NULL),
	(222,'29b0fd75-c9b8-4145-9459-0a39ddbfa8de','疯狂试爱','疯狂试爱_Big.png',1,'98分钟','薛少','储毅/娄彦艳/段冉',1,2015,'中国','爱情','该片主要讲述了，六个线索人物错综交织，为毒品和百万美金相互争斗的故事。无厘头女作家“鲍菊”屡次试爱，每每受挫。奇葩黑帮三人组交易受阻，又丢失百万钱财。俊男毒枭初来中国，就被重伤放倒。毛贼侦探替人消灾，不料摊上三条人命。时尚老鸨伶牙俐齿，双刀火拼黑帮，好色副导色字当头，失手杀妻，智斗侦探。本风马留不相干的一群人，被卷入了一系列的复杂的事件中。',NULL,'线下',0,0,'疯狂试爱','2015-11-26 10:58:02',1,NULL),
	(291,'2b849ad9-728d-4828-8f4f-e03549618fc6','意外的恋爱时光','意外的恋爱时光_Big.png',1,'90分钟','黎志','房祖名/郭采洁/李菲儿/于莎莎',1,2013,'中国','爱情','影片讲述肉食傲娇女王乐晴和技术控宅男周同之间便擦出了一场意外的火花的故事。',NULL,'线下',0,0,'意外的恋爱时光','2015-11-26 10:58:02',1,NULL),
	(268,'2bf19499-9417-440d-9cb8-7246fd872498','窥爱','窥爱_Big.png',1,'59分钟','褚卫','宋撼寰/田甜/杨永/邓迪文/李新明',1,2015,'中国','剧情','本片讲述了城市底层中人们的无奈以及对于爱情的追求。',NULL,'线下',0,0,'窥爱','2015-11-26 10:58:02',1,NULL),
	(125,'2c9cfc17-f6e3-49c5-892f-265e78287f61','同居三人行','同居三人行_Big.png',1,'108分钟','安东尼·罗素','马特·狄龙/凯特·哈德森',1,2006,'美国','喜剧','卡尔·彼得森（马特·狄龙）与莫莉·彼得森（凯特·哈德森）新婚后不久，正尽情享受着婚后二人世界的浪漫与温馨。却传来了兰迪·杜普瑞（欧文·威尔逊）因参加他们的婚礼而无故丢掉工作的噩耗…',NULL,'线下',0,0,'同居三人行','2015-11-26 10:58:02',1,NULL),
	(263,'2ce4db48-ac43-4191-ae8c-60ef9edf5d67','花漾','花漾_Big.png',1,'96分钟','周美玲','言承旭/郑元畅/陈意涵/陈妍希',1,2013,'中国','古装','讲述发生在名为“花漾楼”的青楼里跌宕起伏的红尘往事，展现歌妓与海盗、商贾、乐师之间的爱恨情仇。',NULL,'线下',0,0,'花漾','2015-11-26 10:58:02',1,NULL),
	(197,'2ddfe7a4-1bd8-407a-a97b-04e89a43e40b','赏金猎手','赏金猎手_Big.png',1,'110分钟','安迪·坦纳特','杰拉德·巴特勒/詹妮弗·安妮斯顿',1,2010,'美国',' 爱情','影片讲述了一位赏金猎手发现他的下一个目标居然是自己的前妻，这次他能顺利完成自己的任务吗？',NULL,'线下',0,0,'赏金猎手','2015-11-26 10:58:02',1,NULL),
	(60,'2e88220d-c0e4-4d95-be0c-37eb1eed78cc','非诚勿扰1','',1,'125分钟','冯小刚','葛优/舒淇/方中信/徐若瑄/胡可/范伟',1,2008,'中国','喜剧','海归秦奋的天才发明“分歧终端机”因能公平和平地解决人类分歧，被风投者以200万英镑高价买走。秦奋也开始踏上网上征婚的路途，一路笑话不断，不是重遇Gay友，就是遇到推销客，秦奋颇有点心灰意冷，以致遇到清冷女子梁笑笑时便开门见山请求对方说明来意。这次更为棘手，笑笑爱上有妇之夫，陷于苦恋中不停挣扎，这次纯属听从家里人安排才出来与秦奋见上一面。不再打算再见的二人尽情地分享了生命中最隐秘的秘密。然而不久，打算和旧爱分手的笑笑找到秦奋，说要嫁给他,但想与他先去北海道一趟。因她与旧爱的爱情是在那里开始的，如今想在那里结束。秦奋答应了。二人踏上北海道之旅，秦奋在北海道的老友对他们盛情招待，三人游遍北海道各处，秦奋知道自己得不到笑笑的心，却不知道笑笑心中抑郁难解的结正冲向海底的漩涡.',NULL,'线下',0,0,'非诚勿扰1','2015-11-26 10:58:02',1,NULL),
	(211,'2ed26d5e-294f-4ea8-a9ec-25828c80b147','捉妖记','捉妖记_Big.png',1,'111分钟','许诚毅','白百何/井柏然',1,2015,'中国','奇幻','小伙子天荫阴差阳错地怀上了即将降世的小妖王，他被降妖天师小岚一路保护着躲过各种妖怪。虽然二人渐渐对小妖产生了感情，小岚却明白她只为把这只惹人眼红的小妖卖个好价钱，在人妖混杂的世界里，他们的命运无疑将牵动人心。',NULL,'线下',0,0,'捉妖记','2015-11-26 10:58:02',1,NULL),
	(17,'2f31eab8-5050-477e-a61f-e27f81657e9f','白发魔女传之明月天国','白发魔女传之明月天国_Big.png',1,'101分钟','张之亮','范冰冰/黄晓明/赵文卓/王学兵\n倪大红，童瑶\n',1,2014,'中国','动作','明朝万历年间，刚刚被推举为武当派新任掌门的卓一航（黄晓明饰）奉命带红丸入京进贡，沿途偶遇魔教妖女练霓裳（范冰冰饰），二人从不打不相识到情难自禁坠入爱河，并在练霓裳所驻扎的明月寨中互许终身。不久，锦衣卫攻入明月寨，指出练霓裳就是杀死川陕总督卓仲廉的凶手，卓一航为查明真相只身前往京城。不久后却传来他归顺朝廷并另娶娇妻的消息，练霓裳悲愤交集，一夜间黑发尽数变白。',NULL,'线下',0,0,'白发魔女传之明月天国','2015-11-26 10:58:02',1,NULL),
	(121,'3001c58c-cb14-4408-ac4e-1a50078d21e1','北京遇上西雅图','北京遇上西雅图_Big.png',1,'123分钟','薛晓路','汤唯/吴秀波',1,2013,'中国','爱情','拜金小三文佳佳怀孕后到美国待产，在这里遇到了月子公司的司机兼护工Frank。文佳佳的情人在国内出事停了她的信用卡，Frank也正处在离婚危机中。两个失意的人开始慢慢走近，并最终在帝国大厦的顶楼定情…',NULL,'线下',0,0,'北京遇上西雅图','2015-11-26 10:58:02',1,NULL),
	(166,'30323495-07d8-4433-855a-f61d7a05ad11','混蛋3','混蛋3_Big.png',1,'85分钟','Craig Moss','Danny Trejo/Danny Glover/John Amos',1,2015,'美国','喜剧','弗兰克(丹尼·特乔饰)饰一名当年的越战老兵，退役之后他一直混得很是凄惨，没有工作也没有恋人。直到在一场巴士事故中救下了一位老黑人，他成了当地的英雄。不过，好运并没有就此到来，弗兰克最好的朋友被谋杀然而警察却并不打算过问此事，失意之下的弗兰克究竟该怎样面对这一切？',NULL,'线下',0,0,'混蛋3','2015-11-26 10:58:02',1,NULL),
	(387,'3068072f-f4a2-40ab-b5fa-f2adacb944cf','意大利之旅','意大利之旅_Big.png',1,'108分钟','迈克尔·温特伯顿 ','罗伯·布莱顿/罗茜·费尔纳',1,2014,'英国/意大利  ','剧情','两位老朋友，六顿大餐，一个有着美食和美景的国家。库根认为他们将在这部电影里“开车经过生命中从未见过的最引人入胜的风景，我们俩只能通过不断地聒噪来抒发我们心中的震惊。”',NULL,'线下',0,0,'意大利之旅','2015-11-26 10:58:02',1,NULL),
	(98,'30718a04-00b5-4a7c-a5ff-3d5118295a82','中国合伙人','中国合伙人_Big.png',1,'112分钟','陈可辛','黄晓明/邓超',1,2013,'中国',' 剧情','结识于80年代的大学好友成东青、孟晓骏、王阳一起打架、泡妞、梦想去美国。有的美国梦圆，有的美国梦碎，有的美国梦圆了又碎——惟齐力创办英语培训学校的新梦想，将他们绑在了一起。',NULL,'线下',0,0,'中国合伙人','2015-11-26 10:58:02',1,NULL),
	(179,'30acc4d4-998f-4108-9fe9-792a6dfa7a4a','米其林情缘','米其林情缘_Big.png',1,'122分钟','莱塞·霍尔斯道姆','海伦·米伦/欧姆·普瑞',1,2014,'美国',' 剧情','22岁的印度青年Hassan Haji随家人搬到法国南部开了一家印度餐馆，很快便引起了街对面一家米其林星级餐厅的女大厨Mallory女士的注意，在她的帮助下Hassan最终成为了一名著名厨师。',NULL,'线下',0,0,'米其林情缘','2015-11-26 10:58:02',1,NULL),
	(32,'3110ff4e-c466-44f8-8666-d65918b99e76','智取威虎山','智取威虎山_Big.png',1,'143分钟','徐克','张涵予/梁家辉/林更新/余男/佟丽娅/韩庚',1,2014,'中国','战争','1947年冬，东北民主联军203小分队在首长少剑波的带领下，奉上级命令进入匪患猖獗的林海雪原保护百姓安全，侦察员杨子荣与卫生员白茹火线驰援。为彻底瓦解土匪势力，杨子荣执意请求乔装潜入匪窝“威虎山”。历经了重重考验的杨子荣因献宝有功，被匪首座山雕封为“威虎山老九”。杨子荣一面与八大金刚周旋，一面涉险为山下战友传出情报，而山寨中的一名神秘女子却屡屡将他陷于生死绝境。被203小分队生擒的土匪联络副官栾平趁乱逃脱，竟出现在威虎寨中与杨子荣当面对质。座山雕寿辰“百鸡宴”上，杨子荣与203小分队的战友们迎来了剿匪收网的最佳时机，一场鏖战在所难免。',NULL,'线下',0,0,'智取威虎山','2015-11-26 10:58:02',1,NULL),
	(79,'31921a42-8b62-4007-b123-a496485fefc2','豪门夜宴','豪门夜宴_Big.png',1,'90分钟','徐克','曾志伟/郑裕玲/吴耀汉/洪金宝/林子祥/张学友/梁家辉/梁朝伟/周润发/刘德华/成龙/周星驰',1,1991,'中国','喜剧','开发商曾小智（曾志伟 饰）为人油嘴滑舌，为了买入楼盘谎话说尽，他的竞争对手洪大宝（洪金宝 饰）不遑多让，二人在经纪人学友（张学友 饰）的牵线下亦敌亦友。曾小智获悉科威特王子阿里巴巴（林子祥 饰）即将抵港，而王子手中握有一份重建海湾战争后家园的巨额开发计划，为了得到合同，曾小智决定请出自己多年没有探望过的老爸曾老伯（吴耀汉 饰）配合，打造自己的孝子形象迎合王子。小智和娇生惯养的妻子咪咪（郑裕玲 饰）将曾伯从小妹阿芝（关之琳 饰）和丈夫阿辉（梁家辉 饰）家中接出，并拟定多种训练对父亲进行“上层人”的改造。曾老伯苦不堪言，而宴会因洪大宝的介入一再出现状况，一心求财的曾小智能够如愿么？\n　　本片为帮助1991年大陆水灾筹备善款而拍摄，其中客串的明星多达上百位。',NULL,'线下',0,0,'豪门夜宴','2015-11-26 10:58:02',1,NULL),
	(137,'31c47546-49b0-44ac-9d9a-e8a554151363','安妮：纽约奇缘','安妮：纽约奇缘_Big.png',1,'118分钟','威尔·古勒','奎文赞妮·瓦利斯/杰米·福克斯',1,2014,'美国','喜剧','奎文赞妮·瓦利斯饰演主角安妮，一位年轻，快乐的被收养儿童，但她也同样敢于踏上如今的纽约街头。还是婴儿的她最初被亲生父母遗弃并许下诺言说某天他们会回来找她，但自从住进了她的养母汉尼根小姐（卡梅隆·迪亚茨饰演）家里后苦难的日子就开始了。',NULL,'线下',0,0,'安妮：纽约奇缘','2015-11-26 10:58:02',1,NULL),
	(153,'324c5da2-3fc1-4553-a217-3a667f2f6678','星河战队','星河战队_Big.png',1,'129分钟','保罗·范霍文','卡斯帕·凡·迪恩/戴安· 梅尔',1,1997,'美国','动作','本片讲述了未来世界人族与虫族的对决，电影版中大量的虫族造成了强烈的视觉冲击。',NULL,'线下',0,0,'星河战队','2015-11-26 10:58:02',1,NULL),
	(282,'3276ff98-8cfa-40ca-baf2-b70ffa1856f1','我老公不靠谱','我老公不靠谱_Big.png',1,'106分钟','阮世生','郑伊健/蔡卓妍',1,2012,'中国','喜剧','《我老公不靠谱》是十年前的电影《我老婆未满十八岁》的续集。讲述yoyo与张十三结婚十年后情海翻波，各自面临新的考验。',NULL,'线下',0,0,'我老公不靠谱','2015-11-26 10:58:02',1,NULL),
	(86,'32855f91-7e0d-4beb-bc20-969779ea79fb','疯狂原始人','',1,'98分钟','科克·德·米科/克里斯·桑德斯','尼古拉斯·凯奇/艾玛·斯通/瑞安·雷诺兹',1,2013,'美国 ','动画','原始人咕噜一家六口在老爸Grug（尼古拉斯·凯奇 Nicolas Cage 配音）的庇护下生活。每天抢夺鸵鸟蛋为食，躲避野兽的追击，每晚听老爸叙述同一个故事，在山洞里过着一成不变的生活。大女儿Eep（艾玛·斯通 Emma Stone 配音）是一个和老爸性格截然相反的充满好奇心的女孩，她不满足一辈子留在这个小山洞里，一心想要追逐山洞外面的新奇世界。 \n　　没想到世界末日突然降临，山洞被毁，一家人被迫离开家园，展开一场全新的旅程。离开了居住了“一辈子”的山洞，展现在他们眼前的是一个崭新绚丽却又充满危险的新世界，到处都是食人的花草和叫不出名字的奇异鸟兽，一家人遇到了全所未有的危机。在旅途中，他们还遇到了游牧部落族人Guy（瑞恩·雷诺兹 Ryan Reynolds 配音），他有着超凡的创造力和革新思想，帮助咕噜一家躲过了重重困难，途中他还发明了很多“高科技”产品，并让他们知道了原来生活需要“用脑子”，走路需要“鞋子”等等。一行人在影片中展开了一场闹腾而又惊险的旅程。',NULL,'线下',0,0,'疯狂原始人','2015-11-26 10:58:02',1,NULL),
	(22,'32fe24c0-6a6f-4cd4-b884-bec4a36e1852','太极1','',1,'100分钟','冯德伦','梁家辉/Angelababy/袁晓超',1,2012,'中国','动作','清朝中叶以来，内忧外患不断——内有天理教作乱，外有西方列强入侵；鸦片战争失利后，西洋各国长驱直入，圈地自重。工业革命兴领的种种新科技，更是势如破竹大举进入中国。传统崩溃，却有英雄豪杰，崛地而起，领一时之风骚，太极拳一代宗师杨露禅，便于此时现世。\n杨露禅天性憨直驽钝，但是身负异秉“三花聚顶”。他自幼丧母，跟随天理教教主走四方、打天下，但是由于用劲过度，“三花聚顶”已经威胁到了他的性命，除非河南清风岭陈家沟的“陈家拳”才能救他。为了保住性命，也为了完成母亲的遗愿，杨露禅来到陈家沟学拳。因为“陈家拳不外传”的铁律他吃足了苦头，后来虽得到陈家拳掌门陈长兴青睐，却意外卷入“直隶铁道总监造”方子敬和掌门之女陈玉娘的感情纠纷里。\n在陈长兴指点下，杨露禅和玉娘联手毁掉方子敬用来铺路毁村的机械怪兽“特洛伊”，解除了陈家沟的灭顶之机。但是立下大功的他却被村民怀疑“偷拳”，要废去他的武功。在最后关头，陈玉娘挺身而出决定下嫁杨露禅，救了他的性命。\n此时，杨露禅与《太极》的故事才刚刚开始。',NULL,'线下',0,0,'太极1','2015-11-26 10:58:02',1,NULL),
	(124,'34982c93-cb37-4e2d-a772-3e96617c6351','合法入侵','合法入侵_Big.png',1,'110分钟','尼尔·拉布特','塞缪尔·杰克逊/帕特里克·威尔森',1,2008,'美国','惊悚 ','故事的主人公是一对夫妇，男方是白人，女方是黑人，他们虽然肤色相异，但是感情非常好。两个人一起搬进了梦寐以求的别墅里，没想到他们的新邻居——一个奉行种族歧视主义的黑人警察，对他们非常看不惯，因此不断的制造麻烦，想要将他们逼走。忍无可忍的夫妇俩决定反击，没想到却引起了更大的纷争……',NULL,'线下',0,0,'合法入侵','2015-11-26 10:58:02',1,NULL),
	(14,'3498417e-fe73-4827-a785-aa911b6dddbd','爱丽丝梦游仙境','',1,'108分钟','蒂姆·波顿','米娅·华希科沃斯卡约翰尼·德普',1,2010,'美国','科幻','　距离那一次历险奇遇已经过去了十年……曾经漫游奇境的爱丽丝（米娅·华希科沃斯卡饰），今年业已19岁，她生活在一个华丽富庶的大庄园里，衣食无忧，生活奢靡，在社会风气的带动下，渐渐的成长为家庭心目中所冀望的那种贵族女子，却早已忘却自己在9岁时的那些奇妙无比的经历。时光荏苒，在家族为他举办的19岁的生日宴会上，一位富豪的儿子向他求婚，对方是哈米什·爱斯科特（利奥·比尔饰），哈米什虽然家财万贯，性格却愚笨而木讷，跟爱丽丝根本不是一路人。爱丽丝发觉到自己并不想要这样的生活，渴望改变现状的她在小白兔的带领下，爱丽丝再次步入仙境。\n　　这里依然是她童年来过的地方，一切都没有发生太大的变化，有着奇妙的黄色瞳孔的疯帽子先生（约翰尼·德普饰）率先欢迎了爱丽丝的到来，而专断凶狠的红桃皇后（海伦娜·伯翰·卡特饰饰）依然尖叫着要砍掉其他人的头，甚至连自己的妹妹白皇后（安妮·海瑟薇饰）也不放过。在双胞胎兄弟（马特·卢卡斯饰）的帮助下，爱丽丝逐渐地恢复了记忆，她将在这个童话般的奇妙世界里重新审视自己……',NULL,'线下',0,0,'爱丽丝梦游仙境','2015-11-26 10:58:02',1,NULL),
	(29,'34b14930-af6f-49e1-b169-3203aaee298f','斯大林格勒','',1,'135分钟','费多尔·邦达尔丘克','彼得·费奥多罗夫/托马斯·克莱舒曼',1,2013,'俄罗斯','战争','日本爆发大地震，一名俄国救援人员为了给压在瓦砾下并失去了父亲的姑娘打气鼓劲，讲述了自己“五个父亲”的故事——而他的母亲正是斯大林格勒战役中的女主角卡嘉。 1942年，斯大林格勒。苏联军队根据作战计划向盘据伏尔加河左岸的德国军队展开反攻，然而反攻受阻，只有格罗莫夫大尉率领的几名侦察兵渡过到了对岸，并固守在一栋三层楼的房子里，他们临危受命要不惜任何代价守住这栋房子，除了另外几名奇迹般幸免的苏军士兵外，他们遇到了这栋房子的最后一位住——19岁的卡嘉。德国军官卡恩奉命要夺回这栋被对手占领的房子。在平均寿命不到一昼夜的斯大林格勒保卫战中，能够坚守一个星期的人们即被认为是老兵。所以，活着已是最大的奢侈，更遑论对家庭的守望。卡嘉的出现犹如一道清风，为五个在冰冷战争中浸泡许久的苏联大兵（五个爸爸）带来了生活的渴望，善良的卡嘉用自己微薄的力量，抚慰着这些在战争中受伤的灵魂，一起度过最艰难的岁月。',NULL,'线下',0,0,'斯大林格勒','2015-11-26 10:58:02',1,NULL),
	(178,'35ea0137-2852-46d0-9b9d-20965ec69694','等风来','等风来_Big.png',1,'107分钟','滕华涛','倪妮/井柏然',1,2013,'中国','剧情','这就是等风来的故事。王灿没有顿悟出什么，程羽蒙也要接着面对她的人生，李热血还是会用自己的一腔热血换来不对等的回应，大姐团要接着回归自己琐碎的家庭生活，但是，有些回忆，会让他们在复制黏贴的日子里，静静的等风声从耳边响起。',NULL,'线下',0,0,'等风来','2015-11-26 10:58:02',1,NULL),
	(261,'3804ea4a-2274-40a4-947c-0a115f36a998','隔绝','隔绝_Big.png',1,'110分钟','泽维尔·吉恩斯','米洛·文堤米利亚/迈克尔·比恩',1,2012,'美国','惊悚','影片讲述了末日之后的纽约，8个幸存者在地下掩体里，等待救援的同时展开相互攻歼。 ',NULL,'线下',0,0,'隔绝','2015-11-26 10:58:02',1,NULL),
	(189,'3a76cd24-4dcf-44c6-a5c7-376018c306fc','虎胆龙威3','虎胆龙威3_Big.png',1,'128分钟','约翰·麦克蒂尔南','布鲁斯·威利斯/塞缪尔·杰克逊',1,1995,'美国','?冒险','影片讲述了约翰·迈克莱恩和哈莱姆店主一同在纽约逮捕德国恐怖分子西蒙·格鲁伯,在那里他计划抢劫的联邦储备银行大楼。',NULL,'线下',0,0,'虎胆龙威3','2015-11-26 10:58:02',1,NULL),
	(152,'3a977cb3-c0eb-4ec9-8c74-8a76ac15d14e','明月刀雪夜歼仇','明月刀雪夜歼仇_Big.png',1,'89分钟','楚原','陈萍/罗烈',1,1977,'中国','剧情','天下第一快刀”傅红雪（狄龙饰）为报父仇，万里寻凶，期间七名凶手竟一一离奇暴毙。傅与好友叶开（刘永饰）多番调查，发现七名凶手全部未死；他们合力在幕后操纵，让傅堕入圈套，始出面联手对付，傅之处境岌岌可危……',NULL,'线下',0,0,'明月刀雪夜歼仇','2015-11-26 10:58:02',1,NULL),
	(69,'3acdf993-f65d-42e7-819b-9f7829f20984','私人定制','',1,'113分钟','冯小刚','葛优/白百何/李小璐/郑恺/王宝强/宋丹丹/关晓彤/成龙/范伟/李咏/苗圃',1,2013,'中国','喜剧','影片主要讲述了一个又一个令人捧腹的圆梦故事：素有“小妞儿电影代言人”之称的白百何在片中分身各种职业，大厨卧底售楼小姐无一不活灵活现，相比过去的单一直线型角色，这次的曲线演绎也把握得游刃有余大范儿尽显。愿望规划师杨重（葛优 饰）、情境设计师小白（白百何 饰）、梦境重建师小璐（李小璐 饰）与心灵麻醉师马青（郑恺 饰）四人组成的公司“私人订制”，以“替他人圆梦”为自身业务，专门为不同客户量身订制“圆梦方案”，无论客户的白日梦多奇葩、要求多严格，“圆梦四人组”统统来者不拒，甘愿满足客户的任何需求，正如同“私人订制”公司的口号——“成全别人，恶心自己”。 \n　　一时间，许多怀揣着“奇葩梦”的客户纷纷找上门，私人订制公司也接连面临各种挑战：立志追求高雅跟俗“一刀两断”的全球最“俗”导演（李诚儒 饰）、想要当清官“自愿”接受钱色诱惑的司机师傅（范伟 饰）、生日愿望是想变成“有钱人”的河道清洁工人丹姐（宋丹丹 饰）“寻梦者”络绎不绝，“圆梦四人组”也绞尽脑汁为每一位客户私人订制圆梦方案，过程中发生了许许多多令人捧腹的荒诞事儿，每一位客户也都在最后“梦想成真”。',NULL,'线下',0,0,'私人定制','2015-11-26 10:58:02',1,NULL),
	(30,'3b60a275-d566-4267-9cb1-47989b218bee','太极旗飘扬','太极旗飘扬_Big.png',1,'145分钟','姜帝圭','张东健/元斌/李恩珠',1,2004,'韩国','战争','1950年6月24日。为了全家人的生计，振泰（张东健饰）每天在汉城钟路为人擦皮鞋，日子虽然过得辛苦，但只要一想到因自己的努力而终于步入大学校园的弟弟振硕（元斌饰），还有即将与恋人英秀（李恩珠饰）结婚而充满希望和幸福时，他就感到无比欣慰。\n可是正当振泰沉浸在自己的幸福世界时，突如其来的噩耗却改变了一切。有一天，从学校归来的振硕，涨红着脸告诉振泰即将爆发战争的消息。同一时间，收音机的广播里、外面的街道上，到处弥漫着战争的气氛。满载大兵的军用卡车和军事演练一次又一次的经过面前，街上人群神色匆忙，一下子昔日繁华的钟路陷入了一片混乱之中。而远处不断传来的轰炸声、喊救命的声音，还有越来越多的运尸车，都让振泰强烈意识到战争的来临。\n振泰于是慌慌张张打包行囊带着一家人和英秀的弟妹们一起加入避难行列，大家唯恐走散所以手拉着手紧紧相随，最后终于在灰土交加中到大邱。可就在此时，振泰和振硕兄弟俩稀里糊涂地被推上了军用列车，此时此刻他们才知道自己已被强行征兵而即将奔赴前线。\n被强行征兵的振泰不得不抛下曾应允今年秋天就娶进家门的英秀和身体欠恙的母亲，和弟弟振硕一起从军去了。振泰和振硕被拉到了每天吞噬数千数万人生命的战场，而参战的振泰的唯一心愿，就是宁死也要让弟弟振硕活着回家。于是，振泰怀着只要自己在战场上立功获勋章即可让弟弟活着回家的希望，不顾一切地投身到这场无法预知的残酷战争中。而单纯善良的振硕在这场血雨腥风的战争中也不失其纯净的心灵，他一边经历着残酷的战争，一边成长。',NULL,'线下',0,0,'太极旗飘扬','2015-11-26 10:58:02',1,NULL),
	(213,'3b887f54-faa0-4dda-8352-ec0c4f986d0a','陌生人','陌生人_Big.png',1,'90分钟','布莱恩·伯蒂诺','丽芙·泰勒/斯科特·斯比德曼',1,2008,'美国','恐怖','一对夫妇面对着死亡的威胁，也忘记了曾经的不愉快，齐心协力，为了生存而共同与恶人殊死抗争。而在强烈的求生意志下，他们也发挥了完全超越他们自己想像的能力。一场生死攸关的血腥搏斗开始了……',NULL,'线下',0,0,'陌生人','2015-11-26 10:58:02',1,NULL),
	(325,'3bdaf12a-b001-4e05-a413-f4c5270676aa','大眼睛','大眼睛_Big.png',1,'105分钟 ','蒂姆·波顿','艾米·亚当斯/克里斯托弗·瓦尔兹',1,2014,'美国','传记','在上个世纪60年代，一种名为“大眼孩子”的插图流行起来。不久，其作者沃尔特·基恩遭到起诉，被指责盗取他人作品，而对方正是沃尔特的妻子玛格丽特。玛格丽特表示，大眼孩子的绘画原本出自她之手，性格内向的她每天在地下室里作画，而丈夫沃尔特仅仅是在画作下方签上自己的名字进行销售而已。最终二人婚姻破裂。事情闹上法庭后，法官让二人现场作画，沃尔特推三阻四，借口不断，最终版权案真相大白。',NULL,'线下',0,0,'大眼睛','2015-11-26 10:58:02',1,NULL),
	(57,'3be90cbb-462b-4243-8f34-34973eaabd41','超萌英雄','',1,'89分钟','欧阳奋强','欧弟/杨舒婷/成泰燊/田源',1,2014,'中国','喜剧','欧弟扮演的“屌丝男”和杨舒婷扮演的“D CUP富二代”这对孤男寡女在机缘巧合下被迫同车自驾游三千公里，伴随着未知的危险和刚上路时两人之间不断的摩擦，两人踏上旅途，一路上历经重重考验和磨难，既被犯罪团伙围追堵截濒临绝境，又半路杀出第三者上演“重口味”追爱大作战。在西域壮美的风光和少数民族的热情之中，两性关系也在慢慢的发酵，女神芳心逐渐被融化。',NULL,'线下',0,0,'超萌英雄','2015-11-26 10:58:02',1,NULL),
	(247,'3c3bf8b4-47b6-4801-93b2-25bcf75fa5f2','暗杀','暗杀_Big.png',1,'140分钟','崔东勋','全智贤/李政宰/河正宇',1,2015,'韩国','剧情','影片以1933年的上海和被日本占领朝鲜京城为故事背景，讲述了独立军成员、韩国临时政府要员和职业杀手联手暗杀亲日派的故事。',NULL,'线下',0,0,'暗杀','2015-11-26 10:58:02',1,NULL),
	(3,'3da4edce-b445-42c8-88a7-3b8a1997d61c','变形金刚2','变形金刚2_Big.png',1,'150分钟','迈克尔·贝','希亚·拉博夫梅根·福克斯',1,2009,'美国','科幻','距离那场举世震惊的大战已经过去了数年，虽然美国政府宣布此事只是一场与外星人无关的恐怖袭击，但大部分人都明白，这不过只是政府掩盖事实真相的一昧说辞。擎天柱（皮特·库林配音）等变形金刚继续生活在地球上，与人类和平共处，山姆（希亚·拉博夫饰）也已经顺利读完高中，即将进入大学生涯，而米凯拉（梅根·福克斯饰）就没有那么幸运了，异地恋的结果则是山姆把大黄蜂（马克·瑞恩配音）留给了米凯拉。踏进大学校园，山姆对一切事物都感到新鲜，而且还认识了一个漂亮的女同学爱丽丝（伊莎贝尔·卢卡斯饰）。不过在全新的环境里没生活多久的他又陷入了一个令他头疼的境地，他的脑海里常常出现一些莫名其妙的符号，而且似乎冥冥里来自遥远星球的一个声音正在召唤着他……',NULL,'线下',0,0,'变形金刚2','2015-11-26 10:58:02',1,NULL),
	(190,'3e48ebe9-4377-4838-9b81-6beea5b792ad','虎胆龙威4','虎胆龙威4_Big.png',1,'128分钟','伦·怀斯曼','布鲁斯·威利斯/贾斯汀·朗',1,2007,'美国','?冒险','讲述了某年7月4日，周末，正在休假的约翰接到一个新任务：逮捕黑客马特·法莱尔。事情并没有看上去那么简单：极端恐怖分子经过周密策划之后，准备利用黑客技术，在美国独立日当天让全美国的计算机系统集体瘫痪，马特·法莱尔的帮助下，老英雄继续“生猛”的故事。',NULL,'线下',0,0,'虎胆龙威4','2015-11-26 10:58:02',1,NULL),
	(277,'3ed3cbf3-d520-4cf7-bfe2-cb715e18b974','水中仙','水中仙_Big.png',1,'103分钟','尼尔·乔丹','柯林·法瑞尔/艾丽卡·巴赫蕾达-库鲁斯',1,2010,'爱尔兰','奇幻',' 一个爱尔兰渔民在他的渔网中发现了水中仙女Ondine。这个德国神话中的不朽少女，没有灵魂，她必须学会与人类相爱，牺牲永生，才能赋予自己灵魂。',NULL,'线下',0,0,'水中仙','2015-11-26 10:58:02',1,NULL),
	(165,'3f5846a2-0b2a-4eb8-ba87-e4678c5ffc30','波普先生的企鹅','波普先生的企鹅_Big.png',1,'95分钟','马克·沃特斯','金·凯瑞/卡拉·古奇诺、安吉拉·兰斯伯瑞',1,2011,'美国','喜剧','影片改编自同名儿童读物《波普先生的企鹅》，讲述波普先生和六指企鹅们之间的奇趣故事。',NULL,'线下',0,0,'波普先生的企鹅','2015-11-26 10:58:02',1,NULL),
	(267,'3f709847-3703-415e-abf4-df87f27d8892','快递惊魂','快递惊魂_Big.png',1,'115分钟',' 赵凡求','李民基/金仁权/姜艺媛',1,2011,'韩国','动作','影片讲述了平日用摩托车送外卖的送货员误打误撞配送了一枚炸弹，并由此引出了一系列惊险又搞笑的故事。 ',NULL,'线下',0,0,'快递惊魂','2015-11-26 10:58:02',1,NULL),
	(123,'3fa31815-dbd9-4b61-8862-7d65b3065234','变种异煞','变种异煞_Big.png',1,'79分钟','安德鲁·尼科尔','伊桑·霍克/乌玛·瑟曼',1,1997,'美国','爱情 ','在科技非常发达的未来，人已经不能按自己的意愿生活，命运在出生前就被安排好；人可以决定遗传基因，基因则决定人的命运，不过科技不能控制人的思维。主角文森特是出生在基因人风行前的普通人，不过他弟弟却是一个处处强于他的基因人，为了改变自己的命运，文森特决定毁灭自己的基因，重新制造一个自身。',NULL,'线下',0,0,'变种异煞','2015-11-26 10:58:02',1,NULL),
	(322,'404be4df-4d08-40f1-982b-b7f27964e2c1','博物馆奇妙夜3','博物馆奇妙夜3_Big.png',1,'97分钟','肖恩·利维','本·斯蒂勒/罗宾·威廉姆斯/丹·史蒂文斯',1,2015,'美国','奇幻','影片讲述赖瑞带着他的纽约自然历史博物馆的馆藏朋友踏上前往伦敦大英博物馆的旅程。',NULL,'线下',0,0,'博物馆奇妙夜3','2015-11-26 10:58:02',1,NULL),
	(93,'4179a8e6-c31f-4940-8261-69c89c8bc3e4','K星异客','K星异客_Big.png',1,'120分钟 ','伊恩·索夫特雷','凯文·史派西/杰夫·布里吉斯',1,2001,'美国',' 科幻','布鲁特(Prot，凯文-斯贝西饰，Kevin Spacey)是一家精神病医院中的一个神秘病人，声称自己来自一个遥远的叫作K-Pax的星球。他的医生马克-鲍威尔博士(杰夫-布里奇斯饰，Jeff Bridges)也被这个快乐、自信的人迷惑了，布鲁特所描述的1000光年以外的星球生活使其它病人将信将疑。 当布鲁特说他将在夏季结束以前回去时，病房中所有的病人都争着要与他一同回去。随着布鲁特宣布离开地球的日期日益临近，鲍威尔博士在科学对信念这个问题上难以定夺，并开始怀疑他自己辨别真实情况与幻想的能力。',NULL,'线下',0,0,'K星异客','2015-11-26 10:58:02',1,NULL),
	(252,'41b469f5-bc03-479b-b4c4-4b18b2c6d044','龙珠Z：复活的F','龙珠Z：复活的F_Big.png',1,'20分钟','山室直仪','野泽雅子/中尾隆圣/山寺宏一',1,2015,'日本','冒险','在与破坏神比鲁斯的战斗之后，地球再度迎来和平，艾纪779年，弗利萨军的残党索尔贝和塔格玛为了寻找龙珠而逼近地球。其目的是，为了让军团再起而令弗利萨复活。宇宙史上最邪恶的这一愿望终于实现，复活的弗利萨计划着向孙悟空复仇，展开为期四个月的修炼。于是，新弗利萨军聚集到地球，孙悟饭、比克、小林等人与1000名士兵展开激战。',NULL,'线下',0,0,'龙珠Z：复活的F','2015-11-26 10:58:02',1,NULL),
	(54,'4230fe51-6c59-44dc-b66b-96a13540673d','忠犬八公','',1,'93分钟','莱塞·霍尔斯道姆','理查·基尔，琼·艾伦，萨拉·罗默尔',1,2009,'美国','剧情','影片讲述一位大学教授收养了一只小秋田犬，取名“八公”。之后的每天，八公早上将教授送到车站，傍晚等待教授一起回家。不幸的是，教授因病辞世，再也没有回到车站，然而八公在之后的9年时间里依然每天按时在车站等待，直到最后死去',NULL,'线下',0,0,'忠犬八公','2015-11-26 10:58:02',1,NULL),
	(187,'42e17cdb-35f8-45bb-962a-db18d067228d','蒂莫西的奇异生活','蒂莫西的奇异生活_Big.png',1,'104分钟','皮特·海格斯','乔尔·埃哲顿/珍妮弗·加纳',1,2012,'美国','奇幻','一对无法生育的夫妻吉姆及辛蒂，一直希望能够有个孩子，所以他们把所有的期望都写了下来，希望能上天能赐与他们一个可爱的宝贝，然后将这些纸条都装进一个盒子，埋在后院。没想到，神奇的事情发生了！经过一个暴风雨的夜晚，一个小男孩小芽竟出现在他们家门口，并自认是他们的孩子，他们得到了一个独一无二的宝贝！这个奇幻的男孩，会给这对夫妻带来什么样的新人生呢？',NULL,'线下',0,0,'蒂莫西的奇异生活','2015-11-26 10:58:02',1,NULL),
	(288,'43687625-4383-4652-8e72-c074a1d05b7c','一夜疯狂','一夜疯狂_Big.png',1,'82分钟','任意飞','秦彩瑶/童丹',1,2015,'中国','剧情','《一夜疯狂》影片讲述的是：一位普通的员工置身一件离奇复杂的诈骗案件当中却不自知，围绕着诈骗案件发生了一系列不可思议又让人啼笑皆非的故事。\n',NULL,'线下',0,0,'一夜疯狂','2015-11-26 10:58:02',1,NULL),
	(110,'43d45308-995f-4e43-abda-063ef55b237c','全民目击','全民目击_Big.png',1,'119分钟','非行','孙红雷/郭富城',1,2013,'中国','犯罪','富豪林泰（孙红雷饰）婚期将至，准新娘却惨死地下停车场，林泰的富二代女儿林萌萌成为最大嫌疑人，林泰不惜重金聘请国内顶级律师周莉（余男饰）为独女辩护，而公诉方却是互生罅隙多年的检察官童涛（郭富城饰）。随着法庭质证的深入，罪案真相却越来越扑朔迷离，谁才是真正的凶手？',NULL,'线下',0,0,'全民目击','2015-11-26 10:58:02',1,NULL),
	(233,'45261495-84c8-494b-bee3-0b2761a09871','我和厄尔以及将死的女孩','我和厄尔以及将死的女孩_Big.png',1,'\n104分钟','阿方索·戈麦兹-瑞洪','托马斯·曼/奥利维亚·库克',1,2015,'美国','剧情','影片中的故事发生在匹兹堡，片名中的“我”名叫格雷格（托马斯·曼 饰演，他曾出演2012年的电影《X计划》），是一个17岁的瘦高个儿高中男生，时不时地用旁白音给观众讲述他的校园生活故事。像其他孩子一样，格雷格害怕自己无法融入周围的环境，因此他很努力地展现自己开朗的一面，与学校里的各种圈子和同学保持友好关系，在和他人的交往中低调而随和。这种小心翼翼甚至延伸到了他最好的朋友厄尔（RJ Cyler 饰演）身上，格雷格将他称为自己的“合作者”而不是“朋友”。',NULL,'线下',0,0,'我和厄尔以及将死的女孩','2015-11-26 10:58:02',1,NULL),
	(284,'45561a74-d36d-4566-9c05-366760af8604','无厘头杀手','无厘头杀手_Big.png',1,'50分钟','孙华中','叶婷/孙华中/张世玉',1,2015,'中国','动作','《杀手之失败任务》讲述的国内一个黑势力公司因为要进入一个国际比赛幕后主办权，必须秘密杀掉来访大使，内幕操作以达到瞒天过海吸引境外黑钱的目的，在国外大使抵达期间，特地从国外请了两组杀手，其中一个悲催的杀手从一下飞机就经历各种倒霉的事情，在暗杀大使的过程中一次次错过时机最后狼狈不堪…而饰演警察的王磊也在办案的过程中遇到了当年的女友，外表强悍内心温柔的警官与初恋的意外相遇也在经历了生死离别之后以完美的结局落幕为本片增添了一点浪漫色彩。',NULL,'线下',0,0,'无厘头杀手','2015-11-26 10:58:02',1,NULL),
	(12,'45e4fe32-2629-4cad-84dd-de3d09194991','移动迷宫','移动迷宫_Big.png',1,'113分钟 ','韦斯·波尔','迪伦·奥布莱恩卡雅·斯考达里奥',1,2014,'美国','科幻','影片改编自詹姆斯·达什纳撰写的同名反乌托邦科幻小说三部曲的第一本。讲述了一个叫托马斯的男孩在电梯中醒来，他发现自己失忆了，除了名字什么都记不得。当电梯打开，他来到了一个陌生的地方“林间空地”( The Glade)。这里四周被高大的石头墙包围着，墙外有一群巨大的怪兽威胁着墙内人们的生命。墙内住着50位男孩，他们都被困在了绵延不绝的迷宫森林当中。一天，电梯为他们送来了一个女孩特雷莎，她是来到“林间空地”的第一个女孩。此后，迷宫逐渐开始发生变化，一切都陷入了混乱中，托马斯和特雷莎决定一起走上破解迷宫之路，找出迷宫背后令人不寒而栗的秘密。',NULL,'线下',0,0,'移动迷宫','2015-11-26 10:58:02',1,'2015-12-10 09:17:18'),
	(35,'46512de0-425a-4f6c-8f15-2f8670661f22','笔仙惊魂3','笔仙惊魂3_Big.png',1,'93分钟','关尔','余心恬/郭艳/郭鑫/郎鹏/付曼/薛斐',1,2014,'中国','惊悚','生物系校花高沫陷入一片迷惘与恐惧之中——因为她的眼睛能通灵看到鬼。在学校自习室、女生厕所、图书馆和深夜的校园，她的眼睛总是不期然地撞见一个神秘的红衣生物在游荡。假期来临之际，高沫与海蓝、张宇等一群热爱户外旅行的大学生驴友聚在一起，六名大学生在向导阿吉的带领下开始了刺激的深山之旅……\n虽然种种死亡的征兆预示着这注定是一场夺命之旅，但众人还是没有听从向导的劝告，在好奇心的驱使下，玩起了一个古老的招灵游戏——笔仙。至此，通向地狱的大门再度被打开，来自异度空间的邪灵带来了死亡的诅咒，杀戮的梦魇正式开始，笔仙的升级诅咒根本无法破除！不死不休。',NULL,'线下',0,0,'笔仙惊魂3','2015-11-26 10:58:02',1,NULL),
	(269,'4783aef8-5b80-484c-b8e6-041031824d59','龙卷风','龙卷风_Big.png',1,'113分钟','简·德·邦特','海伦·亨特/比尔·帕克斯顿',1,1996,'美国 ','动作 ','美国60年代，一场恐怖的龙卷风暴袭击了乔·哈汀一家，乔的父亲为了保护家人而被风暴卷走。幼年的经历促使乔长大后成了一名专业研究龙卷风的气象专家。',NULL,'线下',0,0,'龙卷风','2015-11-26 10:58:02',1,NULL),
	(394,'4796c965-7d71-44f9-a86f-6c19ce7753cf','最长的旅程','最长的旅程_Big.png',1,'139分钟','小乔治·提尔曼','斯科特·伊斯特伍德/布丽特妮·罗伯森',1,2015,'美国','剧情','故事分为两个部分。一边是一位91岁的老人被困在一起车祸当中，他回忆起了自己和不久前刚刚去世的妻子携手相伴度过的一生。在距离车祸现场不远的地方，一对年轻的情侣坠入爱河。',NULL,'线下',0,0,'最长的旅程','2015-11-26 10:58:02',1,NULL),
	(364,'47ccc683-201a-4ead-9f8c-79c1b20b5875','瑞奇和闪电','瑞奇和闪电_Big.png',1,'117分钟','JonathanDemme ','梅丽尔-斯特里普/塞巴斯蒂安·斯坦',1,2015,'美国','剧情','《瑞奇和闪电》讲述了一个年轻时离家前往加州追寻财富与名望的女摇滚歌手，多年后她回到故乡，希望能挽救母女之间的关系，尽到一个母亲的责任。',NULL,'线下',0,0,'瑞奇和闪电','2015-11-26 10:58:02',1,NULL),
	(395,'48e71711-88d3-4668-9a63-5598c5dca024','鞋匠人生','鞋匠人生_Big.png',1,'99分钟','托马斯·麦卡锡','亚当·桑德勒/史蒂夫·布西密',1,2014,'美国','剧情','麦克斯·辛金（亚当·桑德勒 Adam Sandler 饰）在他家传好几代的纽约修鞋铺工作。偶然发现一个可以让他踏进顾客生活，并且能够用新奇方式看世界的神奇传家宝。有时候，只有穿上另一个人的鞋子走在路上时，才能真正发现自己是谁……\n\n \n',NULL,'线下',0,0,'鞋匠人生','2015-11-26 10:58:02',1,NULL),
	(145,'4a28ad6e-b246-49f5-b150-56c478824066','恋恋笔记本','恋恋笔记本_Big.png',1,'118分钟','尼克·卡索维茨','瑞恩·高斯林/瑞秋·麦克亚当斯',1,2004,'美国','爱情','一家风光迤逦的私人疗养院，一位神秘的老男人(詹姆斯·加纳饰)每天都会准时拜访一位患有老年痴呆症的老女人(吉娜·罗兰饰)。他总是在腿上摊开一本褪色的笔记本，轻轻地为女人讲述其中记载的故事，每当女人听到日记中的字句，脸上就会迸发出异样的神采，仿佛再次回到那段激情燃烧的岁月……',NULL,'线下',0,0,'恋恋笔记本','2015-11-26 10:58:02',1,NULL),
	(128,'4a60f878-351b-4e82-885b-f507b916b6a2','听风者','听风者_Big.png',1,'119分钟','麦兆辉','梁朝伟/周迅',1,2012,'中国','悬疑','电影讲述神秘组织701负责监听敌方电台，而敌方几百个电台同时消失，令701陷入混乱。负责寻找奇人异士的周迅，将听觉敏锐的盲者梁朝伟带回701，并通过他的异能把敌台一一找回。然而，有一天，梁朝伟做错了一件事，令周迅也陷入危险中……',NULL,'线下',0,0,'听风者','2015-11-26 10:58:02',1,NULL),
	(95,'4aa4e991-8eb9-43c8-a2a3-642ddffddbfe','一球成名','一球成名_Big.png',1,'95分钟','丹尼·加农','斯蒂芬·迪兰/安娜·弗莱尔',1,2005,'美国','运动','圣地亚哥·穆内兹(库诺·贝克饰)是从小生长在墨西哥乡间的足球少年，童年便在心中勾勒出成为职业球员的梦想。一天夜里，父亲匆忙带着全家老小登上一辆货车，怀着美国梦奔向逃离贫穷的边境。虽然穿越铁丝网时圣地亚哥遗失了心爱的足球，却为日后的梦想成真拉开了帷幕。',NULL,'线下',0,0,'一球成名','2015-11-26 10:58:02',1,NULL),
	(275,'4b042c65-3e1e-4ce5-afd9-5268801c375c','撒娇女人最好命','撒娇女人最好命_Big.png',1,'95分钟',' 彭浩翔','周迅/黄晓明/隋棠',1,2015,'中国',' 喜剧','影片讲述了周迅饰演的撒娇绝缘体“苦追”黄晓明的故事，因为碰上了深谙撒娇之道的情敌隋棠，周迅决定苦练撒娇技术。',NULL,'线下',0,0,'撒娇女人最好命','2015-11-26 10:58:02',1,NULL),
	(26,'4b7070e8-7461-49dc-b8a6-e91a3e83aec8','一个人的武林','',1,'94分钟','陈德森','甄子丹/王宝强/杨采妮/白冰/张蓝心/姜大卫/元彬/方中信',1,2014,'中国','动作','封号南拳王的洪拳武术家暴毙于隧道中的自家车上，尸体并没刀伤或枪伤痕迹，初步监定死于重拳，重案组总督察陆玄心负责调查，对死因感到不解；此时却收到监狱传来消息，犯了误杀罪的服刑犯人夏侯武，主动表示愿意协助警方调查，条件是即时假释。\n“先练拳次练腿，后擒拿用兵器，由外而内”，夏侯武断言凶手行凶目的并非寻仇，且会继续犯案。果然，号称北腿王、擒拿王、兵器王的武术界精英相继遇害，均死于各自成名的武功之下。得到夏侯武提供线索，以及现场遗下的仿古暗器“堂前燕”，陆玄心终于发现凶手藏身之所，这时夏侯武却违反假释令突然失踪。 两个武艺超凡的杀人犯同时在逃，他们是敌是友？两雄相遇，一场巅峰对决势所难免。',NULL,'线下',0,0,'一个人的武林','2015-11-26 10:58:02',1,NULL),
	(362,'4bbf4b73-4c43-4224-a02c-99c5fd64463f','忍者神龟变种时代','忍者神龟变种时代_Big.png',1,'101分钟','乔纳森·理贝斯曼','皮特·普劳泽克/阿伦·瑞奇森',1,2014,'美国','动作 ','城市需要英雄来拯救，黑暗降临纽约，大反派施莱德和他率领的异族用铁腕压制一切，从警察到政客都被其所控制。神龟们和无畏的女记者爱普莉尔以及聪明的摄像师菲诺通力合作，摧毁施莱德的恐怖计划，让这座城市重新恢复宁静。',NULL,'线下',0,0,'忍者神龟变种时代','2015-11-26 10:58:02',1,NULL),
	(181,'4cad61ba-fab5-425e-aa69-de68b031d326','终点之城','终点之城_Big.png',1,'117分钟','詹姆斯·伊沃里','奥玛尔·梅特瓦利/安东尼·霍普金斯',1,2009,'美国','剧情','28岁的堪萨斯州大学博士生Omar Razaghi，想为已经去世多年的作家Jules Gund写一本自传。为此，Omar要打通三个与Jules Gund比较亲近的人——Gund的哥哥、遗孀以及年轻的情妇，才能获得撰写自传的认可。',NULL,'线下',0,0,'终点之城','2015-11-26 10:58:02',1,NULL),
	(23,'4d2360d3-9bfa-4a00-a260-15d309404a59','太极2','',1,'95分钟','冯德伦','梁家辉/袁晓超/杨颖/彭于晏/冯绍峰/吴彦祖',1,2012,'中国','动作','杨露禅和陈玉娘大喜之日，失踪多年的陈家长子栽秧（冯绍峰饰），突然带着媳妇允儿（谢欣颖饰）现身，并以“莫测高深”的武功震慑众人。未久，高挂在陈家祠堂里的铜钟大法陀，突然在深夜落地自转、巨响不歇。村民骚动，他们说铜钟夜响是灭族前兆，长老则认为收外姓入门，触犯了祖先立下的禁忌铜钟谶。任凭玉娘如何辩护，改变不了家族成员驱逐杨露禅的决心。\n当所有矛头都指向杨露禅一人的时候，深谋远虑的掌门人陈长兴亲手拆穿了儿子栽秧的诡计：他用花样百出的科学手法伪装成武功高手。和允儿连手制造骚乱、混淆视听，目的在挑拨离间家族内部和谐，与方子敬里应外合，陈家沟不攻自破。\n太极拳的精髓，消解了让杨露禅头上的肉角，并为他赢来陈玉娘的爱情。但遭到朝廷通缉的方子敬已经逃亡，另一场风云变幻，似乎在隐隐酝酿。',NULL,'线下',0,0,'太极2','2015-11-26 10:58:02',1,NULL),
	(342,'4d623820-a815-4647-a86f-2d63787a4878','江南1970','江南1970_Big.png',1,'139分钟','庾河','李敏镐/金来沅',1,2015,'韩国','动作','影片以上世纪七十年代的首尔为背景，讲述正在开发中的江南土地上，发生在两个男人之间的恩怨情仇。是导演刘河“街头三部曲”的完结篇，前两部分别是《马粥街残酷史》和《卑劣的街头》。',NULL,'线下',0,0,'江南1970','2015-11-26 10:58:02',1,NULL),
	(180,'4de34038-ba75-4e58-9f5d-f8ecde1f5f1b','精武青春','精武青春_Big.png',1,'87分钟','邱礼涛','吴千语/徐正曦',1,2014,'中国','爱情','电影讲述了以文安为代表的一群年轻人，在经历人生中最耀眼却又最迷茫的时期，遭遇挫折、困惑后在自我否定中渐渐成长，不但找到了人生中最珍贵的友情和爱情，更重要是认清了自己的价值和人生方向，勇敢向前的故事。',NULL,'线下',0,0,'精武青春','2015-11-26 10:58:02',1,NULL),
	(314,'4eaaf9ef-9bc8-424d-9b38-ef34255e6716','44号孩子','44号孩子_Big.png',1,'137分钟','丹尼尔·伊斯皮诺萨','汤姆·哈迪/劳米·拉佩斯',1,2015,'捷克','惊悚','故事发生在斯大林时代的前苏联，男主角Leo Demidov是一名苏联国家安全部(MGB)的特工，他尽忠职守、热爱自己的国家，充满理想主义。作为一名战斗英雄，Leo享受国家给予的特别待遇，不仅他自己一家住在莫斯科的豪宅区，他的父母也分到了很好的公寓。尽管也秘密逮捕和刑讯逼供，但Leo认为这都是为了国家利益。不过一桩儿童系列凶杀案改变了Leo的生活轨迹，政府不愿承认凶案的事实，一心想捉到凶手的Leo成为政府猜疑的目标，只有他的妻子始终站在他这一边……',NULL,'线下',0,0,'44号孩子','2015-11-26 10:58:02',1,NULL),
	(346,'4ebc61db-696a-4428-afbb-164561f69b41','烈日迷踪','烈日迷踪_Big.png',1,'95分钟','Trey Nelson','乔什·杜哈明乔什·维金斯',1,2015,'美国','动作 ','约翰的故事,一个小骗子,在路易找到一个不太可能的同谋,一个刚刚沦为孤儿的十几岁的男孩。 作为他们的乡村道路冒险进展和约翰拖孩子抢劫,两人打造一个意想不到的和强大的债券。',NULL,'线下',0,0,'烈日迷踪','2015-11-26 10:58:02',1,NULL),
	(31,'4f872ab7-fa33-4bd3-9496-915375b7438d','太平轮（上）','',1,'129分钟','吴宇森','章子怡/金城武/黄晓明/宋慧乔/佟大为/长泽雅美',1,2014,'中国','战争','1945年夏，国军将军雷义方（黄晓明饰）在平原战场率兵大败日军。国军通讯兵佟大庆（佟大为饰）俘获了台湾籍日军军医严泽坤（金城武饰）。日军投降之后，三人各行其道。雷义方回到了上海，认识了豪门千金周蕴芬（宋慧乔饰）。两人一见钟情，不久成婚。但随即，内战爆发了。严泽坤在抗战后回到台湾，却发现曾经的恋人日本女孩雅子（长泽雅美饰）已经被遣返回日本。佟大庆则爱上了白天做护士照顾伤兵，晚上在街头招客的妓女于真（章子怡饰），两人原本各取所需照了张“结婚照”，没想到真的成了一对苦恋的情侣。国共一场大战，国民党军全面溃败。众人都想登上太平轮，离开上海去台湾。这艘船成了最后的希望。没想到，意外的沉船改变了所有人的命运，船上近千人绝大多数都在海难中遇难。',NULL,'线下',0,0,'太平轮（上）','2015-11-26 10:58:02',1,NULL),
	(25,'4f9b1084-4323-4e83-b22a-c37f2384da1c','一代宗师','',1,'101分钟','王家卫','梁朝伟/章子怡/王庆祥/张震/宋慧乔/张晋/赵本山/小沈阳， ',1,2013,'中国','动作','广东佛山人叶问（梁朝伟饰），咏春拳掌门人。年少时家境优渥，从师咏春拳第三代传人陈华顺学习拳法，师傅“一条腰带一口气”的告诫，支持他走过兵荒马乱、朝代更迭的混乱年代。妻子张永成（宋慧乔饰）泼辣干练，二人夫唱妇随，琴瑟合璧。1936年，佛山武术界乱云激荡。八卦掌宗师宫羽田（王庆祥饰）年事已高，承诺隐退。然而其所担任的中华武士会会长职位，自然引起武林高手的关注与觊觎。包括白猿马三（张晋饰）、关东之鬼丁连山（赵本山饰）、咏春叶问等高手无不将目光聚焦在正气凛然的宫羽田身上。拳有南北，国有南北乎？最有德行之人才堪会长重任，然这浮世虚名却引得无数迷乱之人狂醉奔忙，浪掷残生。生逢乱世，儿女情长埋藏心底，被冷若寒冰的车轮碾作碎泥。',NULL,'线下',0,0,'一代宗师','2015-11-26 10:58:02',1,NULL),
	(298,'50d1ec31-fa99-48b4-942a-200658582c6e','非你勿扰','非你勿扰_Big.png',1,'83分钟','赵艺然',' 穆婷婷/姜潮/大左',1,2015,'中国','爱情',' 甜点师吴凡（大左 饰）一直默默关注着相亲节目中的人气女神白雪（穆婷婷 饰），把她当成心中的另一半。一次偶然机会，吴凡阴差阳错牵手白雪。同时，白雪的前男友顾明（姜潮 饰）又想和她旧情复燃，想方设法重新追回白雪。 面对霸道旧爱顾明的热烈追求和暖男糕点师吴凡的真情呵护，白雪该如何选择。',NULL,'线下',0,0,'非你勿扰','2015-11-26 10:58:02',1,NULL),
	(148,'51b5832b-0362-4e69-94cc-b8f048b2b75e','搜索','搜索_Big.png',1,'119分钟','陈凯歌','高圆圆/姚晨/赵又廷',1,2012,'中国','爱情','该片展示了年龄、身份、地位各不相同的五个女人在面对逆境时如何“二次成长”。',NULL,'线下',0,0,'搜索','2015-11-26 10:58:02',1,NULL),
	(300,'522c5334-3298-41b4-9b2e-2bb171f1dda6','推拿','推拿_Big.png',1,'114分钟 ','娄烨','秦昊/郭晓东/梅婷/黄轩',1,2014,'中国','剧情','一群盲人推拿师的喜怒哀乐。',NULL,'线下',0,0,'推拿','2015-11-26 10:58:02',1,NULL),
	(257,'5270e1d1-f4d3-4382-bc5e-05ae596607ed','赤脚小子',' 赤脚小子_Big.png',1,'90分钟','杜琪峰','郭富城/吴倩莲/张曼玉/狄龙',1,1993,'中国','动作','《赤脚小子》是由杜琪峰执导，郭富城、吴倩莲、张曼玉、狄龙等主演的动作电影。讲述赤脚小子独自前往省城闯荡的故事。',NULL,'线下',0,0,'赤脚小子','2015-11-26 10:58:02',1,NULL),
	(62,'52af863c-f84b-4162-b43d-34b79bde655a','搞定岳父大人','',1,'91分钟','李海蜀','徐峥/许绍雄/林鹏/李凤绪',1,2012,'中国','喜剧','无房无车无存款的心理医生范坚强（徐峥饰）跟着女友（林鹏饰）回家，准备拜见未来的岳父大人。刚一见面，范坚强就被惊出几身冷汗：岳父苏伯虎（许绍雄饰）富得流油真是要了他的命！但更要命的是自己知道他所有不可告人的秘密！眼见准女婿随时会让自己身败名裂，苏伯虎想尽歪招要赶走范坚强。范坚强怎么甘心束手就擒？他见招拆招，借力打力，伺机反扑，但是想搞定岳父大人谈何容易！',NULL,'线下',0,0,'搞定岳父大人','2015-11-26 10:58:02',1,NULL),
	(56,'5361319d-d4ee-4492-9e9e-698563d70d80','澳门风云2','',1,'110 分钟','王晶','周润发/张家辉/刘嘉玲/余文乐/王诗龄/袁泉',1,2015,'中国','喜剧','随着澳门赌侠石一坚（周润发饰）协助国际刑警大破洗钱集团DOA后便退隐江湖，可是DOA首席会计师小马（张家辉饰）从网上盗取DOA一百伍十亿美元，与女儿初一（王诗龄饰）潜逃泰国。坚之大弟子阿乐（余文乐饰）加入国际刑警，并邀请坚协助捉拿DOA真正幕后主脑苍井女士，两人前赴泰国寻找小马成为控方证人，追查过程中坚重遇了一生最爱的莫愁（刘嘉玲饰演）。',NULL,'线下',0,0,'澳门风云2','2015-11-26 10:58:02',1,NULL),
	(11,'53ad0e4c-afdd-4b7b-ab77-0d52cc04cecc','星际传奇3','星际传奇3_Big.png',1,'119分钟','大卫·杜西','范·迪塞尔卡尔·厄本',1,2013,'美国','科幻','被自己的同伴背叛并遗弃之后，瑞迪克发现自己又变成了一个人，在一个不知名的星球上生活。而外面的人，都认为他已经死了，而将他的名字从赏金猎人的名册中划掉了。为了活命，瑞迪克只能慢慢地去熟悉那些怪物猎兽的习性和生活习惯，并想出无数的办法来对付他们。这种粗粝的生活让瑞迪克变得更为强大--远远比以往更为强大。得知瑞迪克没有死之后，银河系把对他的赏金提高了一倍。各种各样的赏金猎人闻风而动，他们从银河系的四面八方赶来，就是为了取得瑞迪克的首级，好回去领取赏金。在来到这个星球之后，这些赏金猎人发现自己根本不是瑞迪克的对手，而他们自己也渐渐变成了瑞迪克手下的复仇的牺牲品。在设计抓住瑞迪克之后，赏金猎人觉得自己已经是胜券在握了，但是他们不知道的是，这个时候，真正恐怖的事情才刚刚开始，那些嗜血的怪兽，已经全体出动，要把这群人类杀光吃尽……',NULL,'线下',0,0,'星际传奇3','2015-11-26 10:58:02',1,'2015-12-03 14:27:07'),
	(67,'54d682e4-d16a-4e49-bb3c-56642e9d9b95','女人公敌','',1,'120分钟','管晓杰','赵奕欢/刘惠璞/文卓',1,2013,'中国','喜剧','孙小美是一家化妆品公司河马家的员工 ，处事果断行动迅速，出差刚回到北京去往公司的她在出租车上换好了上班行头，入职刚几个月便晋升为公司的总裁助理，这让公司的美女主管们都对她羡慕嫉妒恨，于是她们给她设置了接二连三的重重关卡，小美陷入了各种名誉危机、事业陷阱危机。小美不但对工作热情认真，而且有很独特的营销眼光，她看到了现代社会新媒体的发展迅速，决定把新产品的广告主要投放在新媒体上，可是各个部门的领导尤其是慕妍对她的营销策略百般挑剔，这时小美想到了聚美优品，聚美优品是化妆品的网上大卖场，要想把自己的产品推销出去就得通过它。于是她开始通过自己的努力，克服种种困难，最终获得了极大的成功，并得到了公司领导的认可。',NULL,'线下',0,0,'女人公敌','2015-11-26 10:58:02',1,NULL),
	(44,'54fab2f6-0797-4b5e-a8d2-8a3acee8a3d2','闺蜜','闺蜜_Big.png',1,'118分钟','黄真真','陈意涵/薛凯琪/杨子姗/余文乐/钟汉良/吴建豪',1,2014,'中国','爱情','小美 （杨子姗饰）、希汶 （陈意涵饰）及Kimmy（薛凯琪饰）三个女生是亲密无间却个性各异的闺蜜。心地善良、带点傻气的希汶过着简单的生活，生活重心就是她的未婚夫林杰 （钟汉良饰）；Kimmy家境富裕，为人有点任性，面对男人敢要敢做，对朋友则义气行先；酷酷的小美是三人中最有理想和志气的一个，她的愿望是成为一个独立的女导演。\n三个女生自毕业后就住在一起，本来过着平静的生活，但这种平静一日却被希汶未婚夫林杰的出轨所打破。她们三人一起在咖啡店看到林杰拖着外遇出现，令这段感情彻底地无法挽回，失恋的希汶坠进伤心的深渊，整日不吃不喝行尸走肉，Kimmy和小美为了“救回”希汶，想出终极苦肉计令希汶从失恋的伤痛中苏醒。希汶在入错的KTV包房中饮醉酒遇上好男人乔立 （余文乐饰），双方互生好感，但希汶却对对方的性取向产生怀疑而闹出笑话，直至她知道乔立原来和自己同是天涯沦落人。\n为了令小美能认识名导演李安，Kimmy举办了一个盛大的派对，派对上Kimmy对型男音乐人九天 （吴建豪饰） 产生兴趣，不断向对方挑逗，但九天竟看上了不苟言笑的小美，当晚小美更彻夜不归，令一向要风得风的Kimmy感到不是滋味儿。九天请小美跟她到欧洲作巡回演唱，小美不加思索便答应，眼看三人便要散伙，Kimmy走到九天的船上，用最激烈的方法向小美证明，九天不是一个值得她付托终生的男人',NULL,'线下',0,0,'闺蜜','2015-11-26 10:58:02',1,NULL),
	(380,'560f7f2e-e9b9-47ea-9c1b-4c036c2a1b45','西部慢调','西部慢调_Big.png',1,'84分钟 ','约翰·麦克林','迈克尔·法斯宾德/柯蒂·斯密特-麦菲',1,2015,'英国','动作','故事发生在19世纪未，17岁少年杰伊从苏格兰前往美国科罗拉多州寻真爱，但美国远非他想像中安全，杰伊遇到心上人之前，先碰上神秘人塞拉斯，后者成为他旅途中的保镖。两人经历了一趟险象环生的奇妙旅程……',NULL,'线下',0,0,'西部慢调','2015-11-26 10:58:02',1,NULL),
	(333,'562fd1a9-0235-4b1a-8596-9ecd088a9903','哥斯拉2014','哥斯拉2014_Big.png',1,'95分钟','马可·拉索','格辛·安东尼/弗雷德丽克·达尔·汉森',1,2014,'加拿大','冒险','28岁的威廉（格辛·安东尼饰）因祖父的一封来自丹麦的信，决定与好友杰瑞米（塞巴斯蒂安·阿梅斯托饰）及其他的女友（奥利维亚·格兰特饰）前往哥本哈根探寻自我。在根本哈根，威廉认识了当地女孩埃菲（Frederikke Dahl Hansen饰）并逐渐爱上了她。但是某日，威廉发现埃菲竟然只有14岁，他意识到要认真对待这份感情……',NULL,'线下',0,0,'哥斯拉2014','2015-11-26 10:58:02',1,NULL),
	(192,'570605fb-cb37-420b-9adb-f02d2e8ea3ae','蝙蝠','蝙蝠_Big.png',1,'79分钟','Crane Wilbur','Vincent Price/Agnes Moorehead/Gavin Gordon',1,1959,'美国','恐怖','剧情介绍　故事由一个神秘的作家Cornelia Van Gorder住进了一间发生过多起离奇谋杀案件的近郊出租屋…',NULL,'线下',0,0,'蝙蝠','2015-11-26 10:58:02',1,NULL),
	(225,'58919824-ffa8-416a-8eb2-1a1a3813749b','白日杀机','白日杀机_Big.png',1,'62分钟','张帆','章宇/张小仟/亦涵',1,2015,'中国','恐怖','陈伟和性感美女艾菲驱车前往一处废弃多年的化工帮做规划设计。一路之上，身为第三者的艾菲主动投怀送抱，陈伟也背着女友和艾菲屡屡偷欢。二人在青天白日下的化工厂历经诸多惊悚之事：墙上划着血字，艾菲居然凭空消失了。在发觉自己已成为落入神秘人虎口的待宰羔羊后，陈伟与神秘人斗智斗勇展开了激烈的搏斗，最终陈伟和艾菲能否成功逃生？他又如何逃脱道德和良知的拷问......当一切终于尘埃落定，真正的危机似乎才刚刚开始',NULL,'线下',0,0,'白日杀机','2015-11-26 10:58:02',1,NULL),
	(324,'5a46ebf7-9a71-4d51-96a1-05fd39e2ff5d','大喜临门','大喜临门_Big.png',1,'120分钟',' 黄朝亮','谢新达/林心如/李东学/寇世勋',1,2015,'中国','喜剧 ','该片以两岸婚姻为背景，讲述了两家人因婚俗不同引发的一连串令人啼笑皆非的故事。',NULL,'线下',0,0,'大喜临门','2015-11-26 10:58:02',1,NULL),
	(331,'5b3bfdb9-32ed-412a-8be4-5fdead747403','复仇之角','复仇之角_Big.png',1,'120分钟','亚历山大-阿嘉','丹尼尔-雷德克里夫 /朱诺-坦普尔',1,2013,'美国','惊悚','伊格·佩西斯（丹尼尔·雷德克里夫 Daniel Radcliffe 饰）和梅琳·威廉姆斯（朱诺·坦普尔 Juno Temple 饰）是一对自幼青梅竹马的男女朋友，但在一年前的某天，他们的人生发生了翻天覆地的巨变。两人在森林里约会时，梅琳被人残忍杀害。在此之后伊格作为犯罪嫌疑人遭到警方调查，不过最终他被无罪释放。重获自由身的伊格对梅琳久久无法忘怀，而来自周遭的谴责和质疑更让其痛不欲生。在哀悼梅琳的夜晚，伊格恼羞成怒，做出亵渎神明的举动。次日一早，他惊讶地发现自己长出一对魔鬼的角，而且似乎凡是接近他的人都会变的举止古怪，当彼此接触后更会窥见对方的内心世界。',NULL,'线下',0,0,'复仇之角','2015-11-26 10:58:02',1,NULL),
	(51,'5b505b5b-bed4-45f3-a1d9-a3b69c48341e','导盲犬小Q','',1,'100分钟','崔洋一','小林薰/椎名桔平/香川照之/户田惠子',1,2004,'日本','剧情','导盲犬可鲁（小Q）为中年失明的渡边先生服务，经过一番磨合后终于成为最佳拍档。两年后因渡边患上肾衰竭被送回训练中心。小Q在渡边去世后做导盲犬示范表演时，被寄养家庭的“养父母”仁井夫妇接回家中，但一个月后患白血病去世',NULL,'线下',0,0,'导盲犬小Q','2015-11-26 10:58:02',1,NULL),
	(9,'5c43806a-33b3-4599-83ed-0f6cd8f2f6e7','星际传奇1','星际传奇1_Big.png',1,'108分钟','大卫·杜西','范·迪塞尔拉妲·米契尔',1,2000,'美国','科幻','一艘运送重犯的飞船正朝位于遥远的星系边缘的新梅卡星飞去，突发的机械故障使飞船迫降在一个荒凉的行星上。这是一个被废弃的星球，承受着三个太阳的曝晒，根本没有夜晚。机组成员中只有副驾驶卡罗琳?弗莱幸免，其他幸存者包括警官约翰斯和他押解的杀人犯瑞狄克。他们爬出飞船的残骸，走上这个不毛的星球，寻找生存之地。心神刚刚安定的人们不久就发现这并不是一个安全的地方。一名幸存者被一只神秘的突变生物杀死，这只残忍、狡猾的生物生活在一个废弃的矿井里，它曾杀死了这里以前的所有居民。它唯一的弱点就是经不起阳光的直射，但是这个星球60年一次的日全食却即将开始…',NULL,'线下',0,0,'星际传奇1','2015-11-26 10:58:02',1,NULL),
	(34,'5c7fbf9d-ca63-42e0-a3c0-b7b008100ac7','笔仙惊魂2','笔仙惊魂2_Big.png',1,'88分钟','关尔','赵奕欢/王一',1,2013,'中国','惊悚','华西学院的苏苏是一个万众倾慕的国民校花，她热恋中的男友是本校的一名校草，临近毕业的时候，很多校园情侣都面临毕业分手的命运因此伤心不已，之后怪事不断出现，某天，苏苏行走在校园小径上，看到一个穿着校服的女生走在前面，苏苏追上问路的时候，发现这位女生竟然是一位面容诡异的老妪！\n此后，苏苏遇到的灵异事件更是层出不穷，尤其是当苏苏有一次旅游遇到山洪封山，不得不住进一家地图上没有的神秘旅店之后……\n层出不穷的诡异事件无时无刻不在折磨着苏苏脆弱的神经，可是根本就没有人相信苏苏眼睛里看到的东西。苏苏经历的这些灵异事件真的是在我们熟悉的这个时空中发生的吗?神秘莫测的结局又揭示出女主角遗忘了一段什么样的经历呢?让我们拭目以待 ……',NULL,'线下',0,0,'笔仙惊魂2','2015-11-26 10:58:02',1,NULL),
	(391,'5c88d206-2d1c-424a-a009-5f286c02ce26','战斧骨','战斧骨_Big.png',1,'132分钟','S·克雷格·扎勒','库尔特·拉塞尔/帕特里克·威尔森',1,2015,'美国','恐怖','库尔特·拉塞尔所扮演的警长将和一些村民一起去营救被食人族劫走的人质。这些食人族相当可怕，在饥饿的状态下，他们会相互残杀然后吃掉被杀死的人。不过，要找到这些食人族并不简单，这需要翻山越岭，远离人类的文明。',NULL,'线下',0,0,'战斧骨','2015-11-26 10:58:02',1,NULL),
	(191,'605edd5f-78bf-4804-926b-4aef573fc9a5','虎胆龙威5','虎胆龙威5_Big.png',1,' 98分钟',' 约翰·摩尔','布鲁斯·威利斯/杰·科特尼',1,2013,'美国','?冒险','影片讲述了警探约翰·麦克莱恩及其儿子杰克·麦克莱恩在俄罗斯与当地恶势力进行殊死对决的故事。',NULL,'线下',0,0,'虎胆龙威5','2015-11-26 10:58:02',1,NULL),
	(147,'6110a1bd-5d3b-4f7d-ad43-cd866ed1bfe3','拉撒路效应','拉撒路效应_Big.png',1,'83分钟','大卫·贾柏','奥利维亚·王尔德/马克·杜普拉斯',1,2015,'美国','惊悚','讲述了美国的一群医学院学生竟然掌握了让人起死回生的医术，但是在试验尚未完成的阶段，他们将一位死者佐伊（奥利维亚·王尔德 饰）复活，结果发生了更为可怕的事情。',NULL,'线下',0,0,'拉撒路效应','2015-11-26 10:58:02',1,NULL),
	(46,'61a0fbb6-6a44-4577-bb34-e16aa713bfaf','情书','',1,'117分钟','岩井俊二','中山美穗/柏原崇/丰川悦司',1,1995,'日本','爱情','日本神户某个飘雪的冬日，渡边博子（中山美穗）在前未婚夫藤井树的三周年祭日上又一次悲痛到不能自已。正因为无法抑制住对已逝恋人的思念，渡边博子在其中学同学录里发现“藤井树” 在小樽市读书时的地址时，依循着寄发了一封本以为是发往天国的情书。\n　　不想不久渡边博子竟然收到署名为“藤井树（中山美穗）”的回信，经过进一步了解，她知晓此藤井树是一个同她年纪相仿的女孩，且还是男友藤井树（柏原崇）少年时代的同班同学。为了多了解一些昔日恋人在中学时代的情况，渡边博子开始与女性藤井树书信往来。而藤井树在不断的回忆中，渐渐发现少年时代与她同名同姓的那个藤井树曾对自己藏了一腔柔情',NULL,'线下',0,0,'情书','2015-11-26 10:58:02',1,NULL),
	(120,'62f7d4f0-9770-49f3-9f85-b67ee63971d8','北京纽约','北京纽约_Big.png',1,'107分钟','李晓雨','林志玲/刘烨',1,2015,'中国','爱情','2008是中国腾飞的一年，又是美国经济衰退的一年。北京，纽约，两座城市相隔万里，迥异的文化背景下来自异乡的人们都在找寻着自己的理想与幸福。茉莉(林志玲饰)，一个美丽的中国女人，年幼时只身到纽约追逐梦想；蓝一（刘烨饰），茉莉青梅竹马的恋人，通过在北京不懈奋斗，功成名就；乔（理查德德克里克饰），一个才华横溢的美国男人，励志成为摄影师。命运安排让茉莉在两个男人、两种生活方式、两种文化之间作出抉择……',NULL,'线下',0,0,'北京纽约','2015-11-26 10:58:02',1,NULL),
	(297,'64f5bb46-942f-4d6a-a66f-d683e4589bdc','斗地主','斗地主_Big.png',1,'88分钟','韩兆','韩兆/刘桦/买红妹/曹随风/潘长江',1,2015,'中国','喜剧','  民国初年，鱼龙混杂，三教九流聚集的黑桃城出了件蹊跷事。青楼“人间天上”的头牌艺人，才貌双绝的春天姑娘莫名其妙地失踪了，一时间众说纷纭。实际上，春天是被为富不仁的地主王大猫霸占，欲娶为小老婆。王大猫此前曾有过七房姨太太，奇怪的是除了大太太红桃，其余的都是短命鬼。死因各不相同，结果只有一个。春天姑娘自打进了地主家，瞬间便命悬一线，岌岌可危。',NULL,'线下',0,0,'斗地主','2015-11-26 10:58:02',1,NULL),
	(175,'6520f5c7-e680-4ce4-94b6-1db5d170f9f9','神偷奶爸','神偷奶爸_Big.png',1,'95分钟','皮艾尔·柯芬','史蒂夫·卡瑞尔/杰森·席格尔',1,2010,'美国',' 动画','故事讲述了史蒂夫·卡瑞尔配音的可怜主人公格鲁，策划了一出完美的计划，图谋把月亮偷到手。不料格鲁盗取的收缩射线枪被新贼维克托抢走。为了夺回收缩射线枪，格鲁决定领养三位孤儿——玛戈伊迪丝和阿格蕾丝），利用她们进入维克托戒备森严的城堡兜售饼干的机会实施偷盗。没想到小女孩们的到来却改变了他的生活，他还能完成他的偷月计划么？',NULL,'线下',0,0,'神偷奶爸','2015-11-26 10:58:02',1,NULL),
	(159,'66d3bd7b-db3a-4ff6-927a-a3c4f37fa849','最长的一码','最长的一码_Big.png',1,'103分钟','彼得·西格尔','亚当·桑德勒/克里斯·洛克',1,2005,'美国','喜剧','曾红极一时的职业橄榄球手因打假球被取消比赛资格，又因偷车及酒后驾驶被送进监狱，却碰上了酷爱橄榄球的狱长。他欣赏保罗的才能，于是要求他和其他囚犯组建一支球队，与狱警球队展开对抗的故事。',NULL,'线下',0,0,'最长的一码','2015-11-26 10:58:02',1,NULL),
	(188,'670f9c46-e37a-4a0c-a5dc-33d08b70e4de','虎胆龙威2','虎胆龙威2_Big.png',1,'123分钟','雷尼·哈林','约翰·阿莫斯/汤姆·鲍尔',1,1990,'美国','?冒险','本片讲述在美国首都华盛顿的杜勒斯机场，恐怖分子为了劫持一名从中美洲引渡到美国受审的大毒犯军事强人，由一群美国前军官率领特种部队用高科技手法将机场控制，用盘旋在天空无法降落的班机为人质，威胁机场人员就范。可惜，他们没想到约翰·迈克莱恩警探正好来机场迎接妻子。凭着他对恐怖分子的灵敏嗅觉和不凡身手，他再度以一当百，跟恐怖集团进行斗智斗力的死亡游戏。',NULL,'线下',0,0,'虎胆龙威2','2015-11-26 10:58:02',1,NULL),
	(256,'67ed87cd-eb40-419d-a94d-481f684547b0','残梦',' 残梦_Big.png',1,'95分钟','杨紫婷','杨紫婷/孙文婷/霍政谚',1,2012,'中国','爱情','影片讲述了一个发生在上世纪20、30年代的飘零乱世的故事。从上海富豪公子郁成业在新婚之夜中毒身亡开始，在案件侦破的中，将郁公子与孟家姐妹的情感纠葛铺展开来。',NULL,'线下',0,0,'残梦','2015-11-26 10:58:02',1,NULL),
	(115,'6971e06b-0ee6-4dcf-bfca-7bee6afa7cb4','初恋时光','初恋时光_Big.png',1,'83分钟','殷国君','黄又南/赵柯',1,2014,'中国','爱情','名模那笛因酗酒陷入低谷回到家乡，初恋男友白熠峰为拯救那笛用情至深，最终两人回到了初恋时光。大学生乔剑和杨晓萱相爱，乔剑为照顾母亲两人始终无法相聚，一次意外乔剑去世，杨晓萱为爱继续乔剑没有完成的事业。',NULL,'线下',0,0,'初恋时光','2015-11-26 10:58:02',1,NULL),
	(70,'699ad6ea-2936-468a-a203-b23129bf6da8','微爱之渐入佳境','',1,'120分钟','顾长卫','杨颖/陈赫/张鲁一/姜瑞佳/曹璐/涂彦倪',1,2014,'中国','喜剧','沙果，黄小瓜，马呆，三头文艺小蛮牛，歃血为盟，与狼同居，沙果经不住微信上一个野模百般纠缠，误入勾搭是一种时尚的爱情漩涡，黄小瓜为戏疯，为爱狂，手提菜刀威逼男老板潜规则自己，爱情义举，惊天地泣鬼神，马呆被投资人马小姐的情操深深折服，甘愿与牛欢歌，莫愁，莫愁，半夜惊起女鬼忧愁。微爱就是红酒配饺子的小小浪漫，追梦心酸，狗搭共温暖，五台山脚下，善男信女，莫非真要剃度？一条微信一场梦，一段人生一份情，爱的路上，谁想灭谁，又谈何容易？微时代爱情，微辣，微甜，微酸，这就是生活的惊喜，我们用微爱传递，你我共珍重。文艺三剑客沙果（陈赫饰）、黄小瓜（张鲁一饰）、马呆（曹璐饰）经历着同甘共苦的北漂生活，土豪马大姐（王姬饰）的出现让他们的职业生涯迎来了曙光。为了争取马大姐的投资，“微男”沙果开始了艰难的剧本创作。与此同时，美艳的“威女”车模陈西、小狗“莫愁”意外出现在了沙果的世界中。为了写好剧本，沙果倾其所有，黄小瓜、马呆怪招出尽；为了赢得爱情，沙果为陈西扑汤蹈火，而黄小瓜也邂逅了清纯的小青（姜瑞佳饰），并且逐渐为爱走火入魔。在微时代的千变万化中，生活处处存在惊喜',NULL,'线下',0,0,'微爱之渐入佳境','2015-11-26 10:58:02',1,NULL),
	(135,'6a207d57-3f24-43e5-920b-4cbb47f89774','天伦之旅（2009）','天伦之旅（2009）_Big.png',1,'99分钟','柯克·琼斯','罗伯特·德尼罗/德鲁·巴里摩尔',1,2009,'美国/意大利','剧情','主人公是一位鳏夫，他在妻子去世后，决定去探望多年未见的孩子们，共聚天伦。但这次旅行让他百感交集：他所寄予厚望的孩子们各有各的烦恼，过的并不如意。孩子们试图撒谎以安慰父亲，而父亲则在妻子的坟前诉说着“大家一切都好”。',NULL,'线下',0,0,'天伦之旅（2009）','2015-11-26 10:58:02',1,NULL),
	(316,'6b13919c-9d92-456d-8c5d-bf2c224c3309','暗夜逐仇','暗夜逐仇_Big.png',1,'114分钟','佐米·希尔拉','连姆·尼森/乔尔·金纳曼',1,2015,'美国','犯罪','吉米·科龙(连姆·尼森 饰演)是一位布鲁克林的职业杀手，“掘墓人”是他的绰号。他曾经为黑帮工作，与黑帮大佬西恩·马奎尔出生入死结下了深厚的情谊。然而吉米的儿子迈克尔(乔尔·金纳曼 饰演)却遭到黑帮追杀，虽然与儿子一直关系疏远，但吉米不得不为了保全迈克尔的性命而与西恩反目为仇。在这个疯狂的夜晚中，吉米与迈克尔一起并肩作战，与围剿他们的腐败警察、合约杀手以及黑帮们斗智斗勇。',NULL,'线下',0,0,'暗夜逐仇','2015-11-26 10:58:02',1,NULL),
	(127,'6b25b2c7-fc6f-4dd0-b8a3-7b06cad13cee','名利场','名利场_Big.png',1,'140分钟','米拉·奈尔','瑞茜·威瑟斯彭/杰姆斯·鲍弗',1,2004,'美国','爱情','这部影片改编自William Makepeace Thackeray 的以Rebecca (Becky) Sharp为主人公的经典小说。出身于下层社会的Becky，利用她的机智，圆滑和性，排除万难，成功栖身于1820年的伦敦上层社会，并在其中穿梭周旋。',NULL,'线下',0,0,'名利场','2015-11-26 10:58:02',1,NULL),
	(224,'6be44f71-f022-49ce-8b29-b3a3311673df','我的P.S.搭档','我的P.S.搭档_Big.png',1,'112分钟','卞成贤','金雅中/池城',1,2012,'韩国','爱情','影片讲述的是被爱情伤害过一男一女因为偶然的串线导致阴差阳错地互通了电话，通话的过程既搞笑又充满刺激性的对话，是一出极富喜感的故事',NULL,'线下',0,0,'我的P.S.搭档','2015-11-26 10:58:02',1,NULL),
	(88,'6cb63f6e-26b5-4b3c-ae77-2c4e4c243632','魁拔之大战元泱界','魁拔之大战元泱界_Big.png',1,'83分钟','王川','刘婧荦 / 刘校妤 / 王凯 / 敖磊 / 瞿澳晖 / 郭政建 / 杨晨',1,2013,'中国','动画','每隔333年，强大而神秘的生物魁拔诞生天地之间，引起元泱界莫大的灾难。第六代魁拔魁拔蛮吉（刘婧荦 配音）悄然逃过一劫，而今随着蛮小满（王凯 配音）朝着最伟大妖侠的道路上不断前进。他们成功登上开往涡流岛的曲境一号，随着众多神圣联军战士逼近那个危险所在，指望打败魁拔建功立业。与此同时，天界魁拔司主神镜心（刘露 配音）准确测出新一代魁拔的正确方位。为了给这个难缠的对手以致命一击，她不惜使用牺牲地界生物的光势。 \n　　在涡流岛上，神圣联军的先头部队遭到幽弥狂及其战友的强力扑杀。随后蛮小满、雪伦（敖磊 配音）、蛮吉随着镜心登岛，惨烈的战斗撼动元泱界的每一个角落……',NULL,'线下',0,0,'魁拔之大战元泱界','2015-11-26 10:58:02',1,NULL),
	(341,'6d8fbf6e-c6cd-4411-ad55-80b76654e76b','霍比特人3五军之战','霍比特人3五军之战_Big.png',1,'144分钟 ','彼得·杰克逊','马丁·弗瑞曼/理查德·阿米蒂奇',1,2014,'美国','冒险','本集中，夺回孤山的“矮人王”索林顺理成章的占据了无数远古矮人的财宝，同时这些堆积如山的财宝也吸引着人类勇士巴德和精灵王瑟兰迪尔所率的联军，矮人一族面临着一场巨大的危机。随后冲着无尽财宝而来的半兽人大军蜂拥而至，面对这些邪恶、贪婪的半兽人，与人类和精灵联军对峙已久的矮人一族也终于放下隔阂，在“矮人王”索林的率领下与人类、精灵歃血为盟，共同对抗半兽人部队。',NULL,'线下',0,0,'霍比特人3五军之战','2015-11-26 10:58:02',1,NULL),
	(383,'6ea7d6e1-5106-413b-a2d0-62a0fc7d5c79','心花路放','心花路放_Big.png',1,'118分钟','宁浩','黄渤/徐峥',1,2014,'中国','爱情','耿浩（黄渤 饰）在偶遇“小三”危机，陷入情感困境。面对背叛，耿浩陷入了难以自拔的痛苦之中，好基友郝义（徐峥 饰）为了帮他摆脱痛苦，决定带他南下“猎艳”，遍访“百花”。于是两个“暴走兄弟”带上一只狗，开始了一段疯狂而搞笑的放浪旅途。一路上他们结识了各式女伴，并经历了一连串奇葩的遭遇。最后，两人最终明白了爱的真谛，并收获了彼此的幸福。',NULL,'线下',0,0,'心花路放','2015-11-26 10:58:02',1,NULL),
	(230,'6f693c82-5090-479d-a5b9-efdea5d6ac05','终结者创世纪','终结者创世纪_Big.png',1,'127分钟',' 艾伦·泰勒','阿诺·施瓦辛格/艾米莉亚·克拉克/李秉宪',1,2015,'美国','科幻','影片讲述了未来战争如火如荼，凯尔发现眼前的世界与预计中完全不同，一场关乎人类未来的“人机”大战正式上演。',NULL,'线下',0,0,'终结者创世纪','2015-11-26 10:58:02',1,NULL),
	(377,'6f7af159-ef01-4920-a85f-94f7127a6e3e','透纳先生','透纳先生_Big.png',1,'150分钟','迈克·李','蒂莫西·斯波/玛丽昂·百利',1,2014,'英国','传记 ','《透纳先生》讲述了英国画家约翰·透纳充满创作激情的人生经历，他曾经因创作手法过于先锋而备受诋毁，然而透纳视绘画创作为生命，一生佳作累累，即使临死前都挣扎着爬起床临摹一具女尸。他在晚年尤其自19世纪40年代起即致力于绘画形式与色彩的探索，用食材、口水等不可思议的颜料作画，引来一片争议之声，被视为英国最伟大的画家之一，也是出了名的艺术怪人。',NULL,'线下',0,0,'透纳先生','2015-11-26 10:58:02',1,NULL),
	(319,'6f8cf273-89eb-4c91-bde5-b8421bb8c2aa','别惹德州','别惹德州_Big.png',1,'87分钟','安妮·弗莱彻','索菲娅·维加拉/瑞茜·威瑟斯彭',1,2015,'美国','喜剧','性格暴躁、行为古板的女警库珀（瑞茜·威瑟斯彭 Reese Witherspoon 饰），被上司安排护送一位做了污点证人的毒枭妻子丹妮艾拉·里瓦（索菲娅·维加拉 Sofía Vergara 饰）横越德州，让她和丈夫去指证一个黑帮大佬。丹妮艾拉是一个身材火辣、脾气火爆的的哥伦比亚美女，两人明显相处不来。她们的行程还没开始，同行警察和里瓦先生就中了埋伏，让里瓦太太变成寡妇，这场从圣安东尼奥到达拉斯的旅程，转变成一场与时间和子弹赛跑的爆笑逃亡……',NULL,'线下',0,0,'别惹德州','2015-11-26 10:58:02',1,NULL),
	(176,'6fd63bd0-a444-4dab-8310-b85cb9213b11','窃听风云3','窃听风云3_Big.png',1,'131分钟','麦兆辉','古天乐/吴彦祖',1,2014,'中国','剧情','香港新界陆氏家族在此盘亘百年，某日，同村的罗永就（古天乐饰）醉酒撞死了异姓兄弟陆永远，从此与陆永远之妻月华（周迅饰）结下不解之仇。一场爱恨交织，钱权阴谋的悲欢故事揭开序幕。',NULL,'线下',0,0,'窃听风云3','2015-11-26 10:58:02',1,NULL),
	(130,'6ffcebc8-a77a-4a14-be92-a11d78adc6a3','四大名捕','四大名捕_Big.png',1,'118分钟','陈嘉上','邓超/刘亦菲',1,2012,'中国','动作','影片讲述了明朝的安全机构“神侯府”与“六扇门”之间为破同一件大案，斗智斗勇但最后齐心协力侦破案件的故事，诸葛神侯（黄秋生饰）领导着冷血（邓超饰）、无情（刘亦菲饰）、铁手（邹兆龙饰）、追命（郑中基饰）等四大名捕与六扇门门主（成泰燊饰）展开了一番生死追逐。',NULL,'线下',0,0,'四大名捕','2015-11-26 10:58:02',1,NULL),
	(77,'707d4949-0fa2-477c-8514-65182d0f6168','国产凌凌漆','',1,'84分钟','周星驰/李力持','周星驰/袁咏仪/罗家英/陈宝莲/黄锦江',1,1994,'中国','喜剧','凌凌漆（周星驰饰）是国家后备特工，因长期被上级弃用，而沦为卖肉摊主。一天，一具价值连城的恐龙头骨丢失，是一个浑身盔甲的金枪客所为，南方将军决定派凌凌漆去接受夺回恐龙头骨的任务。同为落寞特工的达闻西向凌凌漆转达了任务并为其发明了种种疯狂的武器道具。凌凌漆按照线索到达香港，并与联络人李香琴碰头。\n他俩后来在嫌疑人富商赖有为居所中遍寻线索，却遇上一群人袭击，凌凌漆中枪受伤，他却突然发现体内的子弹属李香琴所有，明白到李香琴就是金枪客派来的杀手，但经历了出生入死的战斗后，他们产生了感情，李香琴转而与凌凌漆合作。后来金枪客身份暴露，他原来就是指派凌凌漆来港的南方将军。故事最后，凌凌漆凭着自己精湛的肉刀技巧，将金枪客除掉。',NULL,'线下',0,0,'国产凌凌漆','2015-11-26 10:58:02',1,NULL),
	(326,'7118c9db-ef89-459c-8f12-41120aea4fdb','丹尼科林斯','丹尼科林斯_Big.png',1,'106分钟','丹·弗格曼','阿尔·帕西诺/安妮特·贝宁',1,2015,'美国','喜剧','1970年代传奇摇滚乐手丹尼柯林斯（阿尔·帕西诺 Al Pacino 饰）在经历人生低潮时，经纪人（克里斯托弗·普卢默 Christopher Plummer 饰）发现了一封40年来从未送达的信，这封信居然来自披头士主唱约翰·列侬，在40年前写给当时19岁的他，这让他再度受到启发，毅然决然地离开现在奢华的生活，踏上寻找生命意义的旅程，而他也在这段旅程中收获了真爱和消失已久的创作灵感……',NULL,'线下',0,0,'丹尼科林斯','2015-11-26 10:58:02',1,NULL),
	(273,'716eb546-f3f2-46d2-8dfd-e2fa13b7d163','炮弹专家','炮弹专家_Big.png',1,'107分钟','路易斯·罗萨','西尔维斯特·史泰龙/莎朗·斯通',1,1994,'美国','剧情','《炮弹专家》是1994年路易斯·罗萨执导的惊悚动作片，由西尔维斯特·史泰龙、莎朗·斯通、詹姆斯·伍兹、埃里克·罗伯茨、罗德·斯泰格尔主演，全片讲述了 一个中央情报局特工辞职以后以杀手为生的事情。',NULL,'线下',0,0,'炮弹专家','2015-11-26 10:58:02',1,NULL),
	(215,'725498af-f270-4973-badb-4230908a3efd','非常营救','非常营救_Big.png',1,'84分钟','毛坚','赵文瑄/任帅',1,2012,'中国','剧情','1932年4月29日，在上海的大韩民国临时政府领袖金九与韩国爱国志士尹奉吉等周密策划，在上海虹口公园日军庆祝“淞沪战争胜利祝捷大会”会场成功实施爆炸，被日军追杀。浙江嘉兴名士褚辅成先生向金九伸出了援助之手，从1932年5月到1936年2月，金九先生在褚辅成和家人及嘉兴民众的掩护下，在嘉兴通过地下渠道，积极领导韩国的民族独立运动。',NULL,'线下',0,0,'非常营救','2015-11-26 10:58:02',1,NULL),
	(369,'7295d7b2-4b9c-4ed7-b3f7-a21acf40fee7','神奇四侠2015','神奇四侠2015_Big.png',1,'100分钟','乔什·特兰克','迈克尔·B·乔丹/迈尔斯·特勒',1,2015,'美国','动作','该片讲述了四位年轻人，被传送到一个处处充满危机的宇宙时空，因宇宙射线的影响四人的外貌身形都发生了巨大的变化并拥有了超能力，为保护地球家园组成了“神奇四侠”，对抗毁灭钢眼博士的故事',NULL,'线下',0,0,'神奇四侠2015','2015-11-26 10:58:02',1,NULL),
	(10,'72c86753-8f97-40d7-a217-c4354bfead5c','星际传奇2','星际传奇2_Big.png',1,'135分钟','大卫·杜西','范·迪塞尔科鲁姆·费奥瑞',1,2004,'美国','科幻','整整5年的时间里，瑞迪(范·迪塞尔饰)一直在银河系的边缘地带一些被遗忘的星球之间来回游荡，躲避着那些只为钱眼红的雇佣兵的追捕，因为他的项上人头现在值一大笔钱。后来，瑞迪来到一个名叫“Helion”的星球上，发现这里是一个融合了多种文化且非常进步的地方，可惜已经被马歇尔王(柯姆·菲尔饰)大肆侵略进而统治，他是一个专制的暴君，其终极目标就是通过自己那支强大的“死亡使者”军队来征服整个人类文明社会。',NULL,'线下',0,0,'星际传奇2','2015-11-26 10:58:02',1,'2015-12-03 14:18:49'),
	(400,'7536312f-0565-49ef-b0aa-f850f4eccedc','入殓师','入殓师_Big.png',1,'130分钟','泷田洋二郎','本木雅弘/山崎努',1,2008,'日本','恐怖','影片讲述了日本入殓师的生活，影片以一名入殓师新手的视角，去观察各种各样的死亡，凝视围绕在逝者周围的充满爱意的人们。',NULL,'线下',0,0,'入殓师','2015-11-26 10:58:02',1,NULL),
	(75,'75615048-ca0c-4c37-a4fe-18b67740f043','赌侠1','',1,'99分钟','王晶','周星驰/刘德华/吴孟达/张敏/陈法蓉/向华强',1,1991,'中国','喜剧','赌神高进(周润发饰)在公海一场惊天豪赌击败赌魔陈金城后，收刀仔(刘德华饰)为徒，带其回美国将毕生绝技传与于刀仔。一年后，刀仔在龙五(向华强饰的陪同下重出江湖，代表师父以赌技致力慈善事业，号称赌侠。另一方面赌圣阿星(周星驰饰)欲拜赌神为师，遂找刀仔引见。两雄相遇。互展计谋绝技，平分秋色。此时陈金城义子侯赛因为替义父报仇，设计在赌船上打着赌神旗号，企图千尽东南亚所有阔佬，并使赌神身败名裂。侯赛因一伙设计挟持龙五龙九和阿叔，叫刀仔不敢揭穿其真实身份。在最后时刻，刀仔和阿星并肩合作，一用赌神绝学，一用特异功能，终于在最短时间赢得巨额赌本，并施巧计战胜侯赛因。阿星也如愿以偿见到赌神。',NULL,'线下',0,0,'赌侠1','2015-11-26 10:58:02',1,NULL),
	(348,'757b666e-ea4b-432e-91bc-184afe29b599','林荫大道','林荫大道_Big.png',1,'88分钟','蒂托·蒙蒂尔','罗宾·威廉姆斯/罗伯托·阿奎尔',1,2014,'美国','剧情','尽管诺兰和他的妻子乔伊在同一屋檐下生活，但是两人却像是两个世界的人。尽管职场得意，但依然填补不了诺兰心中的空虚。但是里欧的出现却让他的生活彻底改变，这个不靠谱的男青年带着诺兰开启了一段旅途，也开启了人生的另一种可能性。',NULL,'线下',0,0,'林荫大道','2015-11-26 10:58:02',1,NULL),
	(198,'75e688ef-070a-4587-958c-7e2321672ef0','超完美男人','超完美男人_Big.png',1,'100分钟','马克·罗斯曼','希拉里·达芙/海瑟·洛克莱尔',1,2005,'中国','爱情','霍利·汉密尔顿的单亲妈妈吉恩每次在同男友分手之后都会离开她现任男友的家搬到另外一个地方去，然而霍利早已经厌烦了这样的生活。她策划了一个小小的阴谋，为她的母亲自编自导自演了一系列浪漫的邂逅，然而就在她努力用自己的诡计维持着母亲的幸福的同时，她的母亲吉恩也因此错过了眼前现实中的完美男人。',NULL,'线下',0,0,'超完美男人','2015-11-26 10:58:02',1,NULL),
	(250,'75f78760-fb7c-4c8e-a508-ed29b27fe4ef','故事中的故事','故事中的故事_Big.png',1,'125分钟','马提欧·加洛尼','萨尔玛·海耶克/文森特·卡索',1,2015,'意大利','奇幻','剧情由“女王”（The Queen）、“两个老妇人”（The Two Old Women）及“跳蚤”（The Flea）多个单元组成。改编自17世纪由吉姆巴地斯达·巴西耳创作出版的那不勒斯语童话故事集《五日谈》',NULL,'线下',0,0,'故事中的故事','2015-11-26 10:58:02',1,NULL),
	(374,'7641b386-8d78-4d8e-be75-bc3653cebdc2','失魂姐弟','失魂姐弟_Big.png',1,'88分钟','Craig Johnson','克里斯汀·韦格/比尔·哈德尔',1,2014,'美国','剧情','关系疏远的孪生姐弟玛吉和米勒在同一天大难不死。两人结伴回到儿时小镇，面对各自未解的心结。玛吉烦恼着她并不快乐的婚姻，米勒则要面对有过难忘回忆的前男友。姐弟的父亲曾经告诫他们不管发生什么都要在一起，也许这句话自有它的道理…',NULL,'线下',0,0,'失魂姐弟','2015-11-26 10:58:02',1,NULL),
	(207,'7691fb84-5aa7-4a10-8aa3-187c3238c24c','金蝉脱壳','金蝉脱壳_Big.png',1,'115分钟','米凯尔·哈弗斯特罗姆','西尔维斯特·史泰龙/阿诺·施瓦辛格',1,2013,'美国','动作','雷是个监狱设计师，原计划测试世界上最坚不可摧的监狱，不料却被关入狱中企图灭口。为了复仇，雷必须想办法逃出这座自己亲手设计的全透明无隐私的高压监狱。他与亦正亦邪的囚犯大佬斯万、强强联手，准备一同逃出生天……',NULL,'线下',0,0,'金蝉脱壳','2015-11-26 10:58:02',1,NULL),
	(392,'77e1dbf1-0879-4dd3-af3d-d9123e34ae3d','钟馗伏魔雪妖魔灵','钟馗伏魔雪妖魔灵_Big.png',1,'118分钟','鲍德熹','陈坤/李冰冰',1,2015,'中国','奇幻 ','扈都——盛世唐朝西部的边境之城。为保护百姓不受妖魔的侵害，钟馗在张道仙的指引下成为斩妖士，深入魔界盗取集合妖魔能量的宝盒，以期利用千年不遇的机会，彻底扫荡魔界，给人间带来永久和平。魔王则派各路妖怪前来想夺回宝盒，维护魔界的的势力。一身正气的钟馗在御敌过程中却发现原以为界限分明的人魔两界，远比想象的要复杂。而偶遇昔日恋人雪妖，误入这段注定不该发生的恋情，使得钟馗开始怀疑存在的目的。在与魔界一次次的冲突后，钟馗慢慢察觉自己已经陷入了一个巨大的阴谋之中……',NULL,'线下',0,0,'钟馗伏魔雪妖魔灵','2015-11-26 10:58:02',1,NULL),
	(350,'798a5f88-1f3b-4f97-8fda-90b15148411d','旅程终点','旅程终点_Big.png',1,'106分钟','詹姆斯·庞索特','杰西·艾森伯格/杰森·席格尔',1,2015,'美国','剧情','影片改编自真人真事，讲述了畅销书《无尽的玩笑》作者大卫·福斯特·华莱士（杰森·席格尔 饰）和《滚石》杂志记者（杰西·艾森伯格 饰）一同踏上新书全国宣传之旅过程中发生的故事。',NULL,'线下',0,0,'旅程终点','2015-11-26 10:58:02',1,NULL),
	(264,'79bbd0db-9c85-43a9-8a48-e88bfbff1a13','火车','火车_Big.png',1,'110分钟','边永妵','李善均/金敏喜',1,2012,'韩国','惊悚','《火车》描写了身为警察的男主人公追踪欠下巨债去后向不明的侄子和其未婚妻的过程。整个故事映射了因信用卡透支、分期付款等问题所衍生出的现代信用社会的黑暗面。',NULL,'线下',0,0,'火车','2015-11-26 10:58:02',1,NULL),
	(177,'7a40a95f-81d1-4cc6-933f-d26f3852ec2f','第一次','第一次_Big.png',1,'106分钟','韩延','杨颖/赵又廷',1,2012,'中国','爱情','从小与母亲郑青相依为命的宋诗乔（Angelababy 饰），患有不能从事任何激烈运动的遗传疾病。爱幻想但从未曾恋爱过的她，每天最喜欢的就是对着录音机说出心底的小秘密。郑青最大的愿望就是能让女儿体会爱情的美好，就在此时，诗乔巧遇了高中同学宫宁（赵又廷 饰），两人迅速展开恋情，这也是诗乔第一次感受爱情的美好。而深深被诗乔吸引的宫宁，开始鼓励诗乔勇敢追寻她的跳舞梦。但没想到的是，诗乔和宫宁故事的另一面才正要拉开序幕……',NULL,'线下',0,0,'第一次','2015-11-26 10:58:02',1,NULL),
	(39,'7afc8183-2b10-46c5-9b0a-5e37f2c397ec','女生宿舍','',1,'96分钟','梁婷','温心/成毅/赵多娜/尹正/赵美彤/王千一/杜双宇',1,2014,'中国','惊悚','故事发生在上世纪三十年代医学院。新生夏梦芊（温心饰）和方慧茹（赵多娜饰）入了一间尘封多年并有过“闹鬼”传说的415宿舍，舍友一个又一个离奇地死亡，学校陷入了诡异阴霾的气氛中。夏梦芊因意外撞破了舍友何秋岚（王千一饰）和某男同学的恋情，然后何秋岚被匿名举报，导致自杀，并留下了遗书指证举报她的人。当真相在扑朔迷离间还没有彻底揭开前，另一个舍友汪子乔（赵美彤饰）却上吊自杀，高年级的师哥高慕南（成毅饰）和邹智勇（尹正饰）查出了汪子乔的死是被谋杀伪造的“自杀”假象，而凶手的杀人动机是什么？真相出乎意料之外却又是共鸣于情理之中。',NULL,'线下',0,0,'女生宿舍','2015-11-26 10:58:02',1,NULL),
	(361,'7db5b5d8-f847-44a9-b378-28e96e7138af','青春誓约','青春誓约_Big.png',1,'129分钟','James Kent','基特·哈灵顿/海莉·阿特维尔',1,2015,'英国','剧情','影片改编自英国女作家维拉·布里顿（Vera Brittain）成书于1933年的同名回忆录改编，回顾了她本人在一战期间的生活经历，以及她走向反战主义的心路历程。片中布里顿本人由瑞典新星艾丽西卡·维坎德饰演，哈灵顿将出演她的初恋情人。',NULL,'线下',0,0,'青春誓约','2015-11-26 10:58:02',1,NULL),
	(41,'7dcc0be3-f37b-48eb-bbe3-6b2268b62aa9','秘术之盗墓江湖','秘术之盗墓江湖_Big.png',1,'75分钟','吴兵','安以轩/汪东城/郭德纲/宁桓宇/陈欣淇',1,2014,'中国','历险','女主角安以轩 自爆自己是孤儿 出身在孤儿院 从而打破一直的白富美富二代形象 这使得公司对他的做法很不满意 公司认为这对她今后的路造成很大影响剧情 占用10分钟最起码 这时候来了个快递 说让安以轩回家里看看 于是她就回到老家。第二个场景 工地办公室，工头卖挖出来的古玩 废话剧情不多说，重点是 工头倒卖古玩（占用10分钟 也就1分钟的事）这时候 安以轩来了 昔日的老宅已成工地 他要找内个给他写信的婆婆 工头让 汪东城带他去工地的周转房去 说东西都在哪里接着就是 安以轩住进去要找自己身世之谜 然后半夜闹鬼（安以轩贴着面膜更像鬼 这段 特别假 一点不可怕 各种抄袭鬼片里的）最后其实是汪东城干的 就是为了让她走 其实汪东城要来这间房子里找《屠龙秘术》汪东城的父母 是盗墓的 一辈子就在找《秘术》都没找到 最后留给他一张图 说《秘术》就在这里 他就找啊找啊 找不着 其实藏在蜡烛里 钥匙就是 安以轩的项链最后汪东城被警方抓了 说盗取国家文物。。。说《秘术》里面记载着全国的宝藏所在。',NULL,'线下',0,0,'秘术之盗墓江湖','2015-11-26 10:58:02',1,NULL),
	(129,'7ecd1e36-8e0c-4647-80d1-d957c83dbe80','周末午夜光明','周末午夜光明_Big.png',1,'117分钟','彼得·博格','比利·鲍伯·松顿/卢卡斯·布莱克',1,2004,'美国','动作','影片根据作家H·G·Bissinger的小说改编，故事主角是一个德州小镇上的橄榄球队，由于预算削减他们面临着困境，必须用比赛的胜利来证明自己存在的价值……',NULL,'线下',0,0,'周末午夜光明','2015-11-26 10:58:02',1,NULL),
	(38,'7fbd5095-0420-4b07-9fbe-558ec516f246','催眠大师','',1,'102分钟','陈正道','徐峥/莫文蔚/胡静/王耀庆',1,2014,'中国','惊悚','国内擅长催眠疗法的知名心理治疗师徐瑞宁（徐峥饰）正值事业风生水起之时，由他治疗过的病人全都痊愈出院，这也使得徐瑞宁信心倍增，直至骄傲自大。就连自己的学生在课堂上对他理论的质疑，都毫不收敛的回击过去，这些都被徐瑞宁的大学老师方教授看在眼里。在徐瑞宁一次讲课后，方教授受到其学生的请求，让徐瑞宁诊断一位特殊的病人任小妍（莫文蔚 饰），但方教授嘱咐徐瑞宁，称这位病人的十分怪异，她看过的心理医师没有一名能够治疗她的病情，任小妍讲话虚实难辨而且懂得如何回击治疗师。方教授口中所说的这名病人，让徐瑞宁对她产生了极大的兴趣，并且自大的认为没有治不好的病人。当任小妍来到徐瑞宁的诊疗室时，徐瑞宁发现这位病患确实如同方教授所说很有古怪。任小妍声称自己能够看到已经死去的人，并且寻求她的帮助完成生前没有做过的事，徐瑞宁听后不以为然，但任小妍解释自己根本就没有心理疾病，她所看到的都是真实存在的。徐瑞宁在任小妍一顿疯语过后，决定采用催眠疗法进行治疗。而当任小妍成功进入催眠状态后，徐瑞宁想要找出任小妍的心理阴影所在，却不曾想自己被带入了一个可怕的陷阱。',NULL,'线下',0,0,'催眠大师','2015-11-26 10:58:02',1,NULL),
	(90,'802c029d-1086-40b6-b29e-e75745f3e1c6','潜艇总动员3','',1,'80分钟','何子力','范楚绒/洪天海',1,2013,'中国','动画','300年前，沿海居民不堪忍受外来殖民侵略者的压迫与搜刮，组成海盗与殖民者作战。海盗们将殖民者的财宝抢来埋藏在一片神秘海域，传说堆积如山的财宝光芒闪耀，变成美丽的彩虹，从此海盗和他们的宝藏以彩虹而闻名。自称彩虹海盗后人的海狸波波（谢元真 配音）将传说编成故事说给海底居民们听，结果引来了寻找财宝不成的海马家族以及凶狠神秘的独眼鲨（谭满堂 配音）。危急时刻，波波得到小潜艇阿力（范楚绒 配音）的救助。他们带上小潜艇贝贝（洪海天 配音）以及海马家族，踏上了寻找彩虹宝藏的旅途。 \n　　浩瀚无垠的大海尽头，等待这群冒险者的将会是什么',NULL,'线下',0,0,'潜艇总动员3','2015-11-26 10:58:02',1,NULL),
	(249,'803ef715-a348-4c11-a39e-622ff3874fbc','街角洋果子店','街角洋果子店_Big.png',1,'117分钟',' 深川荣洋','江口洋介/苍井优',1,2011,'日本','剧情','该片根据梶原一骑所著漫画改编的电视剧《西洋古董洋果子店》，讲述了一个从乡下来的女生到一个叫“街角”的蛋糕店来寻找恋人未果之后发现的一系列的故事。',NULL,'线下',0,0,'街角洋果子店','2015-11-26 10:58:02',1,NULL),
	(307,'809d7f3f-f3c5-48be-be9c-b48abe624e91','有客到','有客到_Big.png',1,'87分钟','吴家丽','刘心悠/徐子珊/谢婷婷/郭伟亮',1,2015,'中国','恐怖','影片以三段式灵异故事接合成的《有客到》，故事以殡仪业为背景。 殡仪馆，是逝世者最后停居之地，亦是超渡亡灵的地方，凡是未经仪式引魂净化的孤魂野鬼，一般称之为阴灵，这类鬼魂对人世仍存依恋，为着解决未了心事，常做出扰人之举，从而引申出灵异怪事，世人俗称撞鬼…',NULL,'线下',0,0,'有客到','2015-11-26 10:58:02',1,NULL),
	(78,'8293f568-17df-4ef8-a379-8cc9a03a34d6','行运一条龙','',1,'99分钟','李力持','陈晓东/郑秀文/周星驰/谷德昭/葛民辉',1,1998,'中国','喜剧','阿水不但是茶餐厅专家，亦是众所周知的情场圣手，他的好朋友阿福(葛民辉饰)和得男都不时请教他追 求异性之道。其后阿水因打架受伤入院，竟然与做女护士的初恋情人Candy(郑秀文饰)重遇，情场老手阿水居然变得彷如情窦初开，为了接近Candy，不断到医院打针来与Candy见面，经过多次打针酷刑后，终于约会到Candy 。\n另一方面，外卖仔阿福是个超龄处男，一直都无胆入情关，直至武馆经纪人Fanny(杨恭如饰)的出现，阿福在阿水的教导之下，经过多次碰壁后 ， 终于约会到Fanny， 二人在经历多番波折后终有了好结果。\n得男初入社会做事 ，巧遇芳芳(舒淇饰)，无意在杂志社发现芳芳是大地产商李家宁离家出走的独女。得男心生一计，利用芳芳做独家报道，希望可以扬名立万。芳芳悲愤莫名，感觉被得男欺骗，一怒之下 离开，最后二人自知双方都有错，不约而同地找对方重修旧好。\n与此同时Candy假扮与阿水和好如初，其实一直都没有忘记中学舞会被整蛊之仇，并设下陷阱令阿水当众出丑，阿水在没有防备之下被狠狠整了 一顿。\n正当茶餐厅各人在感情路上分别遇上波折的同时，茶餐厅亦面对被疯狂加租，原来是大地产商暗中阴谋想 收铺要重建旧区，茶餐厅面临倒闭命运，不知各人命运如何发展………',NULL,'线下',0,0,'行运一条龙','2015-11-26 10:58:02',1,NULL),
	(266,'82e5a814-5f80-4ed2-bc58-ded6c6f6925b','禁区','禁区_Big.png',1,'61分','六娃 ','杨地',1,2015,'中国','动作','小王是个普通的上班族小屌丝，一个意外的机会得到一个魔盒。魔盒有一个功能，把物品放进去便能得到等价值的金钱。小王在使用魔盒的过程中遇到了其他的魔盒持有者，也发现盒子能够吞噬其他盒子，每个魔盒持有者都有自己的故事和目的，他们潜伏在城市里，与其他人无异，而魔盒却将他们链接在一起，每当夜幕降临，魔盒的秘密让他们就成为城市夜幕下的另一种存在。         小王是个普通的上班族小屌丝，一个意外的机会得到一个魔盒。魔盒有一个功能，把物品放进去便能得到等价值的金钱。小王在使用魔盒的过程中遇到了其他的魔盒持有者，也发现盒子能够吞噬其他盒子，每个魔盒持有者都有自己的故事和目的，他们潜伏在城市里，与其他人无异，而魔盒却将他们链接在一起。\n\n',NULL,'线下',0,0,'禁区','2015-11-26 10:58:02',1,NULL),
	(332,'834dd8d5-7602-4408-b3a2-f79d23f5bffb','哥本哈根','哥本哈根_Big.png',1,'90分钟',' Howard Davies','弗兰西丝卡·安妮丝/丹尼尔·克雷格',1,2002,'英国','剧情 ','《哥本哈根》讲述一个迈克尔Frayn的著名的获奖话剧，约1941哥本哈根物理学家尼尔斯玻尔和沃纳海森堡之间的会议电视改编。在这个时候，年轻的海森堡正在领导一个摇摇欲坠的德国研究项目为核能源，而中年和看似孤立的玻尔在与盟军的代理商联系，并仍在核物理研究社区的位置杰出的影响。',NULL,'线下',0,0,'哥本哈根','2015-11-26 10:58:02',1,NULL),
	(360,'8399191d-58c9-4d8a-8df5-6dadae12127b','奇人密码古罗布之谜','奇人密码古罗布之谜_Big.png',1,'103分钟','黄强华','萧煌奇',1,2015,'中国','动画','霹雳国际多媒体2015年度推出的3D木偶电影。为揭开灭门真相，遗孤张墨、张彤带着父亲遗物「奇人阿西」，依循线索亡命西域，寻找延续阿西生命的关键能源，野心勃勃的楼兰王子则欲夺取能源以复辟，借机利用张墨挥军古罗布，一场攸关天地存续的浩劫即将漫天而来。',NULL,'线下',0,0,'奇人密码古罗布之谜','2015-11-26 10:58:02',1,NULL),
	(89,'85152605-8c0c-42ed-a325-ce3f71ded66d','龙之谷','龙之谷_Big.png',1,'88分钟','宋岳峰','胡歌/景甜',1,2014,'中国','动画','不务正业的流浪少年兰伯特意外听到了邪恶的大黑龙手下魔族准备攻占阿尔特里亚大陆的情况，为了保护家乡他与魔物周旋被困，却被游侠巴尔纳救下，加入到了游侠杰兰特、阿尔杰塔（景甜 配音）的队伍中。精灵一族中的法师首领卡拉秋（夏梓桐 配音）也带着公主内尔文与弓箭手随从莉亚（徐娇 配音）前来邀请人类国王参战，面对魔物的入侵，他们和游侠队伍以及人类骑士贝斯柯德（胡歌 配音）组成了对付大黑龙的联盟。众人历经困难来到了大黑龙的巢穴，兰伯特与莉亚日久生情，但是他们却不知道杰兰特和阿尔杰塔，以及贝斯柯德各自带着不为人知的秘密……',NULL,'线下',0,0,'龙之谷','2015-11-26 10:58:02',1,NULL),
	(276,'858f23e8-df1c-4a4f-a5d1-c5979624859e','神奇侠侣','神奇侠侣_Big.png',1,'100分钟','谷德昭','吴君如/古天乐/文章',1,2011,'中国','喜剧','本片由谷德昭执导，陈可辛为制片人，古天乐、吴君如、文章、王柏杰、杜汶泽等主演。该片主要讲述的是一对古代超级英雄夫妻退隐江湖又披挂复出的故事。',NULL,'线下',0,0,'神奇侠侣','2015-11-26 10:58:02',1,NULL),
	(378,'86982c1c-41b3-457c-8bc5-34fac1d34de9','万物理论','万物理论_Big.png',1,'123分钟','詹姆斯·马什','埃迪·雷德梅恩/菲丽希缇·琼斯',1,2014,'英国','传记','影片根据霍金的妻子Jane Hawking的回忆录改编。制片方和编剧花了三年时间才说服简同意将回忆录改编成电影。',NULL,'线下',0,0,'万物理论','2015-11-26 10:58:02',1,NULL),
	(370,'8764b423-0ee1-4819-bec4-af1e6ee66fc3','生活残骸','生活残骸_Big.png',1,'122分钟','贾德·阿帕图','艾米·舒默/比尔·哈德尔',1,2015,'美国','喜剧','影片根据艾米·舒默本人的真实经历改编，讲述一直与不同男人约会的女孩艾米，忽然遇见了真爱。艾米从小被父亲教导婚姻不现实，一夫一妻不现实，长大后不断约会却从不恋爱。一日，她作为男性杂志编辑，前往采访一位专为运动员治疗运动损伤的医生（比尔·哈德尔饰），不料遇见了可能终结她完美单身生活的真命天子。',NULL,'线下',0,0,'生活残骸','2015-11-26 10:58:02',1,NULL),
	(164,'87db6496-95b8-4b1c-920c-c334fe26333d','汉娜','汉娜_Big.png',1,'111分钟','乔·怀特','西尔莎·罗南/艾瑞克·巴纳',1,2011,'美国','动作','汉娜》的主角是一个14岁的东欧女孩，她的父亲从小就把她培养成了一个冷血杀手。后来汉娜认识了一个法国家庭，和他们的女儿成为了好友，并和其他青少年一样开始经历成长的阵痛。然而好景不长，她的父亲又把她拉回了自己那个冷冰冰的世界，汉娜被送到CIA中情局的集中营，他们要把她训练成杀人机器，为了能够获得自由正常的生活，汉娜只能铤而走险。',NULL,'线下',0,0,'汉娜','2015-11-26 10:58:02',1,NULL),
	(53,'895d764d-37ba-4999-a506-c0c69448b770','小时代3：刺金时代','小时代3：刺金时代_Big.png',1,'130分钟','郭敬明','杨幂/柯震东/郭采洁/陈学冬/郭碧婷/谢依霖/任言恺/李贤宰',1,2014,'中国','剧情','原本离开了姐妹们，准备和堕落的男友席城离开上海的南湘重新回归到姐妹们身边。顾里率领众人搬进了新的别墅，大家继续着同一屋檐下的乌托邦生活。林萧、顾里陪同宫洺参加罗马的时尚活动，还叫上了南湘和唐宛如，又在罗马遇上了顾里的混血表弟Neil。然而当林萧回到上海，却接到了男友崇光癌症复发不幸去世的噩耗。\n几个月后，终于振作起来重新开始新生活的林萧却遇到了一个总是让她莫名想起崇光的外国模特陆烧。与此同时，顾里从未见过面的亲生弟弟顾准突然出现，手握顾家20%的隐藏股份，他告诉顾里M.E有一个巨大的财务漏洞，姐弟两人联手想要夺回被M.E收购的盛古公司。顾里说服姐妹们借着宫洺生日暨M.E周年庆的机会去宫家老宅偷取关键文件，一切会如她们预想的那样顺利吗？一个最漫长难熬的夜晚在静静等待着她们。',NULL,'线下',0,0,'小时代3：刺金时代','2015-11-26 10:58:02',1,NULL),
	(217,'8d3823b1-d119-4344-b932-8604ee66bcde','鲁滨逊漂流记','鲁滨逊漂流记_Big.png',1,'88分钟','罗德·哈迪','皮尔斯·布鲁斯南/William Takaku',1,1997,'美国','冒险','遭遇船难而流落荒岛的英国水手鲁宾逊，在极度与世隔绝的情况下，运用水手时代训练而来的地理方位标示、天象人文观测、日移与潮汐变化等计法，与奥妙的大自然搏斗，亦记录自己的荒岛生涯，并能随时保持理智等待契机！',NULL,'线下',0,0,'鲁滨逊漂流记','2015-11-26 10:58:02',1,NULL),
	(260,'8edc4997-7f30-486d-ad8b-a5264aa30608','感染列岛','感染列岛_Big.png',1,'138分钟',' 濑濑敬久','妻夫木聪/檀丽/国仲凉子',1,2009,'日本 ','科幻','该片将未知病毒袭击日本作为背景，讲述了整个日本危在旦夕的故事。',NULL,'线下',0,0,'感染列岛','2015-11-26 10:58:02',1,NULL),
	(185,'9018a51f-2f76-4f47-953f-80683ba3d178','美国队长2','美国队长2_Big.png',1,'128分钟','安东尼·罗素','克里斯·埃文斯/斯嘉丽·约翰逊',1,2014,'美国','动作','故事发生在《复仇者联盟》两年后，史蒂夫已定居华盛顿，努力适应现代社会的生活。然而当一起神秘袭击事件伤害到神盾局的重要人物时，美国队长必须重新出马，联合黑寡妇击退前来刺杀他的刺客，找出幕后真凶。',NULL,'线下',0,0,'美国队长2','2015-11-26 10:58:02',1,NULL),
	(49,'912bcfc9-c651-47f4-9b7e-08b2c8a32dd9','冲上云霄','冲上云霄_Big.png',1,'100分钟','叶伟信/邹凯光','古天乐/吴镇宇/张智霖/郑秀文/佘诗曼/郭采洁',1,2015,'中国','剧情','年青机师张春亮（古天乐饰），另一身分是富商儿子，从爸爸手上接管生意后，全力打理天颂航空。他对公司的空中服务员潘家诗（佘诗曼饰）照顾有加，原来二人是前度关系。数年前，张春亮因要往纽约接管家族生意，只好无奈跟她暂别，但其实大家心中都一直有对方，只是没有宣之于口。\n为帮公司建立新形象，张春亮邀请谭梦（郑秀文饰）拍摄宣传片，并由唐亦琛（吴镇宇饰） 担任拍摄时的飞行顾问，碰巧二人早前为航班误点有过磨擦，令见面时非常尴尬，但过程中竟又互相发现对方的优点，暗生情愫。\n顾夏阳（张智霖饰）为接受待遇更佳的私人机师一职，离开天颂。一次航程，遇上年轻活泼的女子薛健雅（郭采洁饰），起初只觉得她是贪图金钱、任性妄为的女子，但性格吻合又令两人火速恋上，正当爱得缠绵之际，夏阳得悉原来奉行及时行乐的薛健雅的背后另有原因……\n三段感情，发展都不似预期，但原来只要明白到世事再没完美，能够在岁月如歌中找到快乐便已足够',NULL,'线下',0,0,'冲上云霄','2015-11-26 10:58:02',1,NULL),
	(226,'914edc29-7534-44c2-92b6-2b1bc4cb56cb','魁拔3','魁拔3_Big.png',1,'88分钟','张钢/周洁/王川','刘婧荦/姚姝/王宇腾/杨晨/刘校妤',1,2014,'中国','冒险','影片剧情延续前两部故事情节，主人公蛮吉等人将继续寻找“魁拔”的征程。此番，众妖侠再遇劲敌，粼妖海问香与萨库人大仓将成为他们的两大拦路虎。而作为第六代魁拔的主人公蛮吉，却并不知自己真实身份，周围亲人朋友也并未有所察觉。',NULL,'线下',0,0,'魁拔3','2015-11-26 10:58:02',1,NULL),
	(365,'9188eb5f-7fe7-4761-8332-a4d221a6c7d0','丧家之女','丧家之女_Big.png',1,'95分钟','亨利·霍伯森',' 阿诺·施瓦辛格/ 阿比盖尔·布蕾斯琳',1,2015,'瑞士','恐怖','讲述了一种僵尸病毒在全球爆发，一个偏僻小镇的农夫韦德（施瓦辛格扮演）的大女儿不幸染上这种病毒。人类还没有研制出有效的疫苗，为防止病毒扩散，政府试图将感染者都集中在隔离区任其自生自灭。为了不让心爱的女儿被抓进地狱般的隔离区，安详快乐地度过人生的最后一段时光，这位父亲展开了最后的斗争。',NULL,'线下',0,0,'丧家之女','2015-11-26 10:58:02',1,NULL),
	(294,'91ca7f69-8dc6-4878-ac99-735457befd40','朱诺','朱诺_Big.png',1,'96分钟','贾森·雷特曼','艾伦·佩吉/迈克尔·塞拉/詹妮弗·加纳/杰森·贝特曼',1,2007,'美国','喜剧','高中生朱诺（艾伦·佩姬 饰）大大咧咧，是个可爱的精灵鬼，正经历着青春期到成人的蜕变。这一天她突然做出决定：要和帅气的田径队员布里克（迈克尔·塞拉 饰）共尝禁果。朱诺这次可闯了大祸，她一不留心竟然珠胎暗结，接下来的麻烦可想而知。和布里克谈婚论嫁显然还为时过早，然而堕胎是犯法行为。朱诺和好友商量，决定把孩子生下来，然后交给一对善心的夫妇抚养。然而，父母终究得知了朱诺的秘密，反应并没有朱诺料想的那么糟糕——一家人因为腹中的孩子团结起来，共商计策，为她分担怀孕的点滴苦乐。但是，朱诺毕竟是一个超级年轻的妈妈，小小年龄如何应对这一切，恐怕还要经历一次心灵的蜕变。',NULL,'线下',0,0,'朱诺','2015-11-26 10:58:02',1,NULL),
	(61,'928f41d9-112a-4a33-81e5-8173db32ac89','分手大师','',1,'116分钟','邓超/俞白眉','邓超/杨幂/梁超/古力娜扎/柳岩',1,2014,'中国','喜剧','茫茫人海，风雨飘摇，俯瞰城市，每一个大厦每一个窗户里都有无数男女为了感情哭闹，争吵，自杀，上吊！单身，不是问题，恋爱，才是烦恼，分手更是难题，谁能救万千痴男怨女于水火？分手代理，应运而生。\n　　梅远贵（邓超饰）是一名专业的“分手大师”，谈过76次恋爱，分过77次手，了解男女情爱上的弱点，致力于解决人来情感问题，专门为各种情侣恋人办理分手，分居，离婚以及分家业务。他发明的无痛分手法，无痛苦，不麻醉，没有后遗症，一经治愈绝不复发，药到病除，绝对可靠。迄今为止，上至达官贵人下至贩夫走卒，一共帮助2000多对夫妻恋人成功离婚或分手。其间，见证了各式动人爱情破碎的时刻，也见证了各类爱与不爱的悲欢，他的全面独家分手方略成为广大想分手男女的福音和救命草，客户络绎不绝，往来者奇葩不断，其中不妨各种学派的专家大师级人物。\n某天正当他决定收山不做分手生意之时，接到了一单特别的任务，客户要甩掉的女人叫叶小春（杨幂饰）。',NULL,'线下',0,0,'分手大师','2015-11-26 10:58:02',1,NULL),
	(271,'9381be5e-472b-4255-bac1-ac262a11bf94','柠檬的爱情','柠檬的爱情_Big.png',1,'60分钟','杨木生','迟筱暄/黄嫀砚',1,2013,'中国','爱情','片的故事背景是在福建闽南某个城市，以青春爱情创业奋斗为主题、闽南的人文特色为背景、当下社会的青年梦为基调清，通过几对都市青年的视线，清新唯美地讲述女主角宁檬跟谢明和吴可之间复杂纠葛的情感故事。',NULL,'线下',0,0,'柠檬的爱情','2015-11-26 10:58:02',1,NULL),
	(301,'94158cbf-5f79-4a8a-afaf-d7e65c9fdce2','王牌特工：特工学院','王牌特工：特工学院_Big.png',1,'127分钟','马修·沃恩','科林·费斯/塔伦·埃哲顿',1,2015,'美国','动作','影片讲述了一个资深间谍从街头找回了自己前同事的儿子，此男是一个毫无修养的混子，但在对他实施了一系列培训之后，混子变成了一个像绅士一样的超级间谍。',NULL,'线下',0,0,'王牌特工：特工学院','2015-11-26 10:58:02',1,NULL),
	(372,'94ae337f-9b8e-486e-86d0-83a306b1b422','圣人文森特','圣人文森特_Big.png',1,'103分钟','泰德·梅尔菲','比尔·默瑞/泰伦斯·霍华德',1,2014,'美国','喜剧','单身母亲玛姬（梅丽莎·麦卡西饰演）为了维持全家生计不得不在医院加倍工作，为此她只能把儿子交付给看似无害的隔壁邻居圣文森（比尔·默瑞饰）照看，可她不知道的是这是她做过最糟糕的决定。圣文森这个老兵把自己堕落的生活方式一览无遗的呈现在男孩面前，把喝酒，赌博，撒谎，偷窃等行为都通通教授给小男孩。然而小孩却在这些不堪中找到了闪亮之处。这段关系能让一老一少都有所改变吗？',NULL,'线下',0,0,'圣人文森特','2015-11-26 10:58:02',1,NULL),
	(235,'94d62b5d-b9b2-4545-be59-2ce974d0f78b','太平轮下彼岸','太平轮下彼岸_Big.png',1,'131分钟','吴宇森','章子怡/金城武',1,2015,'中国','爱情 ','战争年代，时局动荡，人民颠沛流离。三对不同背景的主人公被卷入硝烟与战火，与挚爱分离。国军军官雷义方（黄晓明 饰）生死不明，太太（宋慧乔 饰）独在台湾饱受相思之苦；军医严泽坤（金城武 饰）与青梅竹马的日本女孩雅子（长泽雅美 饰）因政局变化被分隔，再难相见；底层女性于真（章子怡 饰）和通信兵（佟大为 饰）萍水相逢，又被乱世冲散；尽管命途颠簸，但他们仍不惜与命运奋力抗争，书写了战乱年代的悲欢离合。最终，命运的齿轮将所有人卷入逃难的太平轮上，他们会如何相遇，各自的命运又将何去何从？',NULL,'线下',0,0,'太平轮下彼岸','2015-11-26 10:58:02',1,NULL),
	(168,'95ca815d-e69c-4d61-8e7f-addfb4323016','灰姑娘（2015）','灰姑娘（2015）_Big.png',1,'112分钟','肯尼思·布拉纳','莉莉·詹姆斯/理查德·麦登',1,2015,'美国','冒险','母亲离世后，瑞拉的父亲再娶了一位后母。为了支持深爱的父亲，瑞拉热情欢迎后母和她的两位女儿进入自己的家庭。然而当父亲也意外去世后，她才发现自己身陷嫉妒和折磨。',NULL,'线下',0,0,'灰姑娘（2015）','2015-11-26 10:58:02',1,NULL),
	(295,'95eb984d-a9d5-46e6-8dae-392a28814791','1980年代的爱情','1980年代的爱情_Big.png',1,'100分钟','霍建起','芦芳生/杨采钰',1,2015,'中国','爱情','关雨波大学毕业后分回故乡的小镇政府工作，颓废消极的他在小镇借酒浇愁，邂逅了在供销社当营业员的成丽雯。雯是关的高中同学，当年关暗恋着雯，并偷放过一封情书在雯的书包里。1978年高考结束，全校仅关考上省城大学，从此两人境遇不同，渐渐没了联系。而今重逢昔日的初恋对象，关内心激动，而雯却保持着距离。因彼此身份悬殊，雯反而显得孤傲难近。在这寂寞小镇，两个青年互相寻找着温情。雯虽然在生活中关心他，鼓励他重新振作，但雯的内心情感始终理性的封闭着。关重新发现着这个女人的一切善美，并试图闯进她的生活。',NULL,'线下',0,0,'1980年代的爱情','2015-11-26 10:58:02',1,NULL),
	(2,'9675b580-58dc-4d00-bc2b-74346cbf9596','超世纪战神','超世纪战神_Big.png',1,'155分钟','安布汗·辛哈','沙鲁克·罕卡琳娜·卡普',1,2011,'美国','科幻','电影剧情描述一位父亲夏卡(沙鲁克汗饰)是伦敦龙头电玩公司的程式设计师，为了打进儿子帕提热爱的酷炫游戏，成为儿子的好麻吉，创造出一个永远打不死的反派电玩角色Ra One；并以自己的样子为蓝本，打造一个负责追捕Ra One的超级英雄.',NULL,'线下',0,1,'超世纪战神','2015-11-26 10:58:02',1,NULL),
	(108,'96bb616c-ea70-425f-a512-3c5b781546a4','光辉岁月','光辉岁月_Big.png',1,'102分钟','熊欣欣','曾志伟/黄日华',1,2013,'中国','剧情','屡仆屡起的“同盟会”革命党在广州攻打两广总督衙门，史称“黄花岗起义”，血战一昼夜后虽告失败，但已撼动整个大清王朝，故事由此开始。 ',NULL,'线下',0,0,'光辉岁月','2015-11-26 10:58:02',1,NULL),
	(220,'9757b92a-bf9f-4f77-b1fc-99c64ceccc12','活死人归来3','活死人归来3_Big.png',1,'91分钟','布莱恩·尤兹纳','肯特·麦克柯/詹姆斯·T·卡伦汉',1,1993,'美国','恐怖','寇特为军方科学家之子，其父在军中利用特殊药剂将死人复活。某日寇特女友茱莉车祸身亡，为了让女友复活，遂利用其父的特殊技术将茱莉还魂，却不知此一技术并无法使死人真正复活，只能使死人具活动能力，成为吃人僵尸……',NULL,'线下',0,0,'活死人归来3','2015-11-26 10:58:02',1,NULL),
	(236,'992b87c3-5030-491b-bb36-ea344db54776','杀破狼','杀破狼_Big.png',1,'97分钟','叶伟信','甄子丹/洪金宝',1,2005,'中国','动作','《杀破狼》是一部叶伟信执导的时装警匪动作片，由任达华、甄子丹、洪金宝和吴京主演。主要讲述了即将退休的督查陈国忠、黑社会老大王宝、新任督查马军之间的生死搏斗。',NULL,'线下',0,0,'杀破狼','2015-11-26 10:58:02',1,NULL),
	(313,'9991fadb-3897-465c-9979-8ae3e0fc26b0','无赖汉','无赖汉_Big.png',1,'118分钟','吴胜旭','全度妍/金南佶/朴圣雄',1,2015,'韩国','犯罪','该片主要该讲述了刑警郑在坤与杀人犯的情人金慧京之间的爱情故事。',NULL,'线下',0,0,'无赖汉','2015-11-26 10:58:02',1,NULL),
	(349,'9b28138c-0313-4f70-9f96-9846bf23016e','鲁斯和亚历克斯','鲁斯和亚历克斯_Big.png',1,'92分钟','理查德·隆克瑞恩','黛安·基顿/摩根·弗里曼',1,2014,'美国','剧情','改编自Jill Ciment所著小说《英雄措施(Heroic Measures)》。在纽约一所公寓里，一对老夫妻打算搬离，但是面对生活了一辈子的地方，他们总有各种剪不断理还乱的恋旧情怀……',NULL,'线下',0,0,'鲁斯和亚历克斯','2015-11-26 10:58:02',1,NULL),
	(113,'9c40d19f-40c7-4855-897a-7830f0f0db71','冲霄楼','冲霄楼_Big.png',1,'91分钟','张彻','鹿峰/龙天翔',1,1982,'中国','动作','本片改编自侠义小说《七侠五义》，人物繁多，情节多变，难得张彻处理得有条不紊，角色性格分明。故事讲述襄阳王(艾飞 饰)在王府中建造机关密布之冲霄楼，又广招花蝴蝶花冲(鹿峰 饰)、神手大圣邓车(王力 饰)和小诸葛沉仲元(龙天翔 饰)等江湖侠士加盟，以谋造反。包公洞悉襄阳王叛迹，乃命门生颜春敏(孙建 饰)前往调查……冲宵楼的机关设计，险象横生，配合新一代张家班的熟练合作，拍出奇诡精妙的动作效果，耳目一新。',NULL,'线下',0,0,'冲霄楼','2015-11-26 10:58:02',1,NULL),
	(255,'9cfddb80-baa3-4deb-87dc-ca46bf04dcb5','爱国者','爱国者_Big.png',1,'168分钟','罗兰·艾默里奇','梅尔·吉布森/希斯·莱杰',1,2000,'美国','动作','梅尔·吉布森在片中饰演男主角本杰明·马丁，一个美国独立战争期间的英雄，早期曾经为殖民扩张而战，后来对战争产生了厌恶，直到轰轰烈烈的美国独立战争的战火烧到了家门口，才逼他又投身到了美国人民追求自由和民主的斗争中。 ',NULL,'线下',0,0,'爱国者','2015-11-26 10:58:02',1,NULL),
	(193,'9d824e7b-787f-4488-a54f-ded87358c41a','西风烈','西风烈_Big.png',1,'113分钟','高群书','吴镇宇/段奕宏',1,2010,'中国','犯罪','《西风烈》是现代西部警匪片，讲述的是四个警探深入无人区抓捕外逃重犯的故事。四对四的正邪较量：警探团队个个身怀绝技，有神枪手、飞车王、大力士；逃犯团伙包括一名本地杀手、两名国际杀手以及杀手女友。',NULL,'线下',0,0,'西风烈','2015-11-26 10:58:02',1,NULL),
	(172,'9e47092d-7c13-46df-bb5e-ace2668ef062','相助','相助_Big.png',1,'146分钟 ','塔特·泰勒','艾玛·斯通/维奥拉·戴维斯',1,2011,'美国','剧情','改编自Kathryn Stockett的同名小说，讲述20世纪60年代美国密西西比发生的社会现象。一位大学女孩Skeeter非常看不惯美国社会对黑人女佣的不公平对待，想通过写书来帮助这些女佣脱离困境。',NULL,'线下',0,0,'相助','2015-11-26 10:58:02',1,NULL),
	(287,'9e5eb32c-7c2f-49e0-9efc-ab69a605fcf1','一爱到底','一爱到底_Big.png',1,'95分钟','朱丽·戴维斯','丹·布卡廷斯基/亚当·戈德堡',1,2001,'美国','喜剧','艾利和汤姆是一对极端，艾利的父母对于感情的分析和表达一直过于夸张，影响了艾利和他的妹妹；汤姆正相反，非常淡然，不能表达哪怕最轻微的情感，更别提深厚强烈的感情，同时他刚刚戒掉酗酒的习惯。这两个人偏偏被各自的好朋友杰基和布莱特拉到一起，认为是天生一对。',NULL,'线下',0,0,'一爱到底','2015-11-26 10:58:02',1,NULL),
	(195,'9e6727da-61f5-4402-8839-ca05383cb511','赌城大亨之新哥传奇','赌城大亨之新哥传奇_Big.png',1,'126分钟','王晶','刘德华/万梓良',1,1992,'中国',' 动作','剧情由二战爆发时期展开，大学生贺新与郭英南赴梳打埠谋生，不久即凭聪明才智急速富起。王昌忌妒在心，设计逼迫贺与郭离埠。10年后，已在香港另有成就的贺、郭二人伙同来自上海的“赌王之王”聂昆，联手赴梳打埠争夺赌权……',NULL,'线下',0,0,'赌城大亨之新哥传奇','2015-11-26 10:58:02',1,NULL),
	(318,'9f123cf3-55fd-40e5-9225-187e17f0b3bf','辩护人','辩护人_Big.png',1,'127分钟','梁宇皙','宋康昊/林时完',1,2013,'韩国','剧情','影片以1981年韩国第五共和国全斗焕军事独裁政权执政初期的釜山为背景，讲述了平凡税务律师宋佑硕（宋康昊 饰）的为震惊全国的“釜林事件”受害学生进行人权辩护的故事。',NULL,'线下',0,0,'辩护人','2015-11-26 10:58:02',1,NULL),
	(169,'9f77c696-dabf-4883-b381-b9eb550b44d9','爱的就是你','爱的就是你_Big.png',1,'91分钟 ','查理·迈科多维尔','马克·杜普拉斯/伊丽莎白·莫斯',1,2014,'美国','喜剧','一对夫妻为挽救婚姻，在理疗师的建议下度假，却遭遇奇异事件',NULL,'线下',0,0,'爱的就是你','2015-11-26 10:58:02',1,NULL),
	(375,'9fc10864-6d82-4f55-9dc2-15e719cb441b','时光尽头的恋人','时光尽头的恋人_Big.png',1,'112分钟','李·托兰德·克莱格','布莱克·莱弗利/米契尔·哈思曼',1,2015,'美国','浪漫','影片的故事讲述一位年轻女孩阿戴琳因一次意外奇迹般地不会变老、容颜永驻的故事。阿戴琳在一场致命事故的恢复过程中发现自己停止变老，获得了青春永驻的魔力。 ',NULL,'线下',0,0,'时光尽头的恋人','2015-11-26 10:58:02',1,NULL),
	(358,'a0584ca4-4e9b-4da4-88de-f812328f5a8e','鸟人','鸟人_Big.png',1,'119分钟','亚利桑德罗·冈萨雷斯·伊纳里图','迈克尔·基顿/艾玛·斯通',1,2014,'美国','剧情','这部电影讲述了一位曾经扮演过超级英雄的过气演员（迈克尔·基顿饰），希望通过出演一部舞台剧来挽救事业，但是跟他合作的傲慢男主角却威胁着要把所有东西都毁于一旦。艾玛将饰演这位过气演员的女儿，她本身也是问题缠身，刚刚从戒疗所里出来，之后做父亲的助手。',NULL,'线下',0,0,'鸟人','2015-11-26 10:58:02',1,NULL),
	(246,'a1c1445d-df5f-47f8-80e1-c3458c14d82a','刺客聂隐娘','刺客聂隐娘_Big.png',1,'105分钟','侯孝贤','舒淇/张震/周韵',1,2015,'中国','古装','该片讲述了聂隐娘幼时被一道姑掳走，13年后被送回已是一名技艺高超的传奇女侠的故事。',NULL,'线下',0,0,'刺客聂隐娘','2015-11-26 10:58:02',1,NULL),
	(94,'a1ed435e-cc3e-43bb-8d97-ee6c45834d09','X战警','X战警_Big.png',1,'132分钟','马修·沃恩','迈克尔·法斯宾德/詹姆斯·麦卡沃伊',1,2011,'美国','动作','60年代古巴导弹危机发生时，讲述在变种人未被世人所知的时候，Charles Xavier和Erik Lensherr还没有被人称作“X教授”和“万磁王”。他们只是变种人中最早发现自己超能力的两个年轻人。他们那时也不是对手，而是非常亲密的朋友。两人以及其他几个变种人在一起工作，试图阻止“末日”的到来。但在这个过程中，两人之间出现了裂缝，最终，在万磁王的兄弟会与X教授率领的X战警之间，一场永恒之战开始了……',NULL,'线下',0,0,'X战警','2015-11-26 10:58:02',1,NULL),
	(335,'a28dcd4f-af98-4e13-bded-e8d32bc7b94f','海雾','海雾_Big.png',1,'111分钟','沈成宝','金允石/朴有天',1,2014,'韩国','剧情 ','电影是一部讲述满载着梦想出航的六名船员，在茫茫海雾中载着偷渡客而被卷进一场无法控制的事件的惊悚剧情片。',NULL,'线下',0,0,'海雾','2015-11-26 10:58:02',1,NULL),
	(265,'a2a0fdd7-5779-44ca-a79c-755546f9652d','将军号','将军号_Big.png',1,'107分钟',' 巴斯特·基顿','巴斯特·基顿/Marion Mack',1,1926,'美国 ','喜剧','影片的故事取材自关于南北战争，片中巴斯特饰演的火车司机强尼一生只爱两件事，一是他的“将军号”机车，此外就是他的女友安娜。他应征入伍被拒绝，遭到了安娜的误会和鄙夷，认为他是个胆小鬼。然而当“将军号”和安娜被北方军队设计掳走后，强尼不遗余力、一往无前地与敌人展开追逐，开始了惊险刺激的营救行动。',NULL,'线下',0,0,'将军号','2015-11-26 10:58:02',1,NULL),
	(106,'a2c8679e-1e7f-4d43-a79d-11952bd5d4d0','傲慢与偏见（2005）','傲慢与偏见_Big.png',1,'129分钟 ','乔·赖特','凯拉·奈特莉/马修·麦克费登',1,2005,'英国','爱情','该片讲述了19世纪初期英国的乡绅之女伊丽莎白·班内特五姐妹的爱情与择偶的故事。因为男主人公富家公子达西的傲慢，从而使女主人公伊丽莎白对其产生了偏见，险些错过心中的真爱',NULL,'线下',0,0,'傲慢与偏见（2005）','2015-11-26 10:58:02',1,NULL),
	(66,'a2cf1517-5997-490c-a074-99081656e79f','六福喜事','',1,'93分钟','谷德昭','黄百鸣/曾志伟/吴君如/郑中基/薛凯琪/熊黛林/吴千语/大鹏/于波',1,2014,'中国','喜剧','电影《六福喜事》讲述了雷鸣（黄百鸣饰）和杨伟（曾志伟饰）这对“老对头”都盼望抱孙子，并督促儿子儿媳、侄子侄媳生育，期间产生了一系列爆笑故事。富商雷鸣得知死对头杨伟将要迎来一个男孙，怒不可遏，要挟侄孙雷带子（郑中基饰）与侄孙媳妇雪儿（薛凯琪饰）即刻传宗接代，更重金礼聘星级月嫂宫三（吴君如饰）严格监管，起初令二人生活遭逢巨变，但却间接重拾了夫妻间久违了的激情和浪漫，展开了活色生香的“生育的进击”。雷鸣确诊患有老年痴呆，为了圆其心愿，雪儿假装大肚，并向有孕在身的黛黛（熊黛林饰）和秀波（于波饰）夫妇求助，欲借其子瞒过叔公。不料想生产当日，杨伟出现，众人精心编造的弥天大谎眼看就要拆穿。',NULL,'线下',0,0,'六福喜事','2015-11-26 10:58:02',1,NULL),
	(309,'a3023dcc-cd40-4551-add4-c005deb1a42c','华丽上班族','华丽上班族_Big.png',1,'123分钟','杜琪峰 ','周润发/张艾嘉/陈奕迅',1,2015,'中国','剧情','该片讲述了一个刚刚步入社会成为上班族的年轻人，莫名被卷入一场公司利益博弈的故事。',NULL,'线下',0,0,'华丽上班族','2015-11-26 10:58:02',1,NULL),
	(330,'a3cd4648-33bd-42eb-872c-4b4d20e99967','弗里敦','弗里敦_Big.png',1,' 113 分钟','Garrett Batty','Nuong Faalong/Robert Conder',1,2015,'美国','剧情','入了残酷的内战中，六利比里亚传教士在蒙罗维亚逃离他们祖国的广泛的暴力。目的地：弗里敦，塞拉利昂。与当地教会领袖布巴卡尔帮助菲利浦（亨利adofo），传教士使艰难的旅程，只有他们的麻烦在杀死自己的叛军战斗机弯复合。基于真实的事件，弗里敦是一个令人激动的、希望和生存的故事。',NULL,'线下',0,0,'弗里敦','2015-11-26 10:58:02',1,NULL),
	(132,'a40d25ed-beef-431e-acb7-c4a0d9680c4d','基督再临','基督再临_Big.png',1,'100分钟','斯科特·查尔斯·斯图瓦特','保罗·贝坦尼/凯特·沃什',1,2010,'美国','惊悚','上帝被人类的行为惹怒，带来了洪水与灾难，如今，他对人类再次失去了信心。一支以加百利为首的天使军团降临人间，对人类进行最后的审判。而我们唯一的希望维系在怀有“救世之星”弥赛亚的年轻女招待与天使长米迦勒（保罗·贝坦尼 饰）身上……',NULL,'线下',0,0,'基督再临','2015-11-26 10:58:02',1,NULL),
	(48,'a487407b-f301-496f-9f92-a8217ae52a9c','边境风云','',1,'97分钟','程耳','孙红雷/王珞丹/杨坤/张默/倪大红/高叶',1,2012,'中国','剧情','该片讲述了在中缅两国的边境，因一起毒品交易的意外事件，孙红雷饰演的毒贩劫持了女孩小安为人质，抚养其长大，两人相爱，并结为夫妇。多年后欲金盆洗手的孙红雷带着王珞丹在张默饰演的警察的追捕、黑帮（杨坤饰）的追杀、小安父亲（倪大红饰）的怨恨等重重包围下试图干完最后一票，绝境求生',NULL,'线下',0,0,'边境风云','2015-11-26 10:58:02',1,NULL),
	(83,'a535512b-51bf-4c42-90be-b5d5e36cc10a','后天','后天_Big.png',1,'124 分钟','罗兰·艾默里奇','丹尼斯·奎德 /杰克·吉伦哈尔/埃米·罗森\n\n',1,2004,'美国','灾难','以美国为代表的地球一天之内突然急剧降温，进入冰期的科幻故事。故事中，气候学家杰克·霍尔(丹尼斯·奎德饰演)在观察史前气候研究后指出，温室效应带来的全球暖化将会引发地球空前灾难。杰克博士曾警告政府官员采取预防行动，但警告显然已经太晚。杰克·霍尔博士于是急告美国副总统宣布北纬30度以南全美民众尽速向赤道方向撤离，该线以北民众要尽量保暖。\n　　而就在此时，霍尔博士得知儿子山姆(杰克·吉伦荷饰)只身前往纽约去营救女友，于是决定冒险前进纽约在冰天雪地中展开救援行动。这时候灾难从纽约开始，曼哈顿摩天大楼遭到强烈旋风的袭击，大部摧毁。突然间，地铁隧道里涌出狂暴不止的汹涌洪水。大水吞噬了纽约，淹没了美国，欧洲也在洪水之下不复存在。此后，冰层和白雪覆盖了整个地球表面，冰期时代开始了。\n　　当镜头再次回到美国时，那些侥幸生还的美国人都逃往墨西哥，请求进入那里的难民营。影片末尾处美国总统不得不叹息承认道，他所奉行的气候政策是一次巨大的败笔。',NULL,'线下',0,0,'后天','2015-11-26 10:58:02',1,NULL),
	(334,'a5513bd8-94b9-4729-84ca-d2b262dd7864','海绵宝宝历险记海绵出水','海绵宝宝历险记海绵出水_Big.png',1,'92分钟','Paul Tibbitt','安东尼奥·班德拉斯/蒂姆·康威，罗伯·鲍森',1,2015,'美国','喜剧','讲述了围绕蟹黄堡的神秘配方，痞老板和蟹老板展开了新一轮的战争。虽然海绵宝宝成功挫败痞老板的猛烈攻势，但是却依然中了对方的诡计。关键时刻，配方凭空消失，直接后果便是导致没人能再做出蟹黄堡。对于日常极度依赖蟹黄堡的比奇堡的居民来说，这一消息无异于晴天霹雳。小镇的宁静荡然无存，海底世界陷入末日般的混乱与动荡之中。由于搭救了痞老板，海绵宝宝被大家当作叛徒对待。危机时刻，海绵宝宝、派大星、痞老板、蟹老板、松鼠珊蒂、章鱼哥得以穿越时空，并顺着蟹黄堡的香味来到了人头攒动的沙滩上。 在那里他们遇见了利用诡计偷走秘方的胡子海盗（安东尼奥·班德拉斯 Antonio Banderas 饰），于是一场蟹黄堡的攻防战由此展开……',NULL,'线下',0,0,'海绵宝宝历险记海绵出水','2015-11-26 10:58:02',1,NULL),
	(203,'a5652e81-eea0-430f-9bed-b545e27a3068','逐梦奇迹','逐梦奇迹_Big.png',1,'111分钟','Logan Miller','艾德·哈里斯/布拉德·道里夫',1,2008,'美国','剧情','剧情描述一名拥有酗酒毛病的父亲，因总是烂醉误事，被世人放弃而失去尊严，而他的双胞胎儿子们，看到父亲被酒精一点一滴的吞噬灵魂，即使一再被父亲拖累，也永不放弃帮助父亲重新站起。不仅剧情感人至极，戏外导演们的为梦想努力的精神及传奇际遇更是令人敬佩，他们最后刷爆十九张信用卡，才完成这部梦想之作。',NULL,'线下',0,0,'逐梦奇迹','2015-11-26 10:58:02',1,NULL),
	(237,'a8b74c83-4d20-489a-b486-4111e008a7bc','三城记','三城记_Big.png',1,'130分钟','张婉婷\n','\n汤唯/刘青云/井柏然/秦海璐',1,2015,'中国','爱情','电影《三城记》取材自真实的故事，讲述在战火纷飞的背景之下，几位主人公辗转于徽州、上海和香港三个城市之间，用生命追逐爱情，上演一段浪漫的乱世爱情故事，成为一段传奇。',NULL,'线下',0,0,'三城记','2015-11-26 10:58:02',1,NULL),
	(134,'a9317cba-dbf8-4224-8685-3d6ba5e6ea46','大谎言家','大谎言家_Big.png',1,'87分钟','肖恩·利维','弗朗基·穆尼兹/保罗·吉亚玛提',1,2002,'美国','喜剧','杰森·谢泼德（弗兰奇·莫尼兹饰）是个14岁的中学生，他聪明伶俐，学习勤奋。一天杰森突然发现自己的课堂作业居然被好莱坞制片人马提·沃尔夫盗用并根据它拍成了一部卖座大片《超级大骗子》，于是杰森和好朋友凯丽来到洛杉矶准备找马提理论一番，为自己讨个说法。',NULL,'线下',0,0,'大谎言家','2015-11-26 10:58:02',1,NULL),
	(72,'a9708248-7f30-4a0f-a2d9-0458358bf262','笑功震武林','',1,'90分钟','王晶','洪金宝/曾志伟/吴君如/元华/郑中基/王祖蓝',1,2013,'中国','喜剧','民国初年，东北地区形势复杂，军阀、土匪、日本特务势力交错，各占地盘，民不聊生。军阀林国栋虽无大志，但仍有爱国之心，日本多次拉拢，俱不为所动。区内唯有福星镇一地，可称为人间乐土，奇怪地向不受土匪侵袭，各山头均传说此地邪门，凡土匪冒犯福星镇者，都会无故消失。其实是有七大退隐江湖的武林高手隐居于此，当中包括小裁缝娇婆四（王祖蓝饰）、开饭店的姐妹麦当娜（吴君如饰）与麦当红（谢娜饰）、当奶妈的花天娇（曾志伟饰）、道士甲乙炳（元华饰）、卖胭脂水粉的小喇叭（郑中基饰）跟妓院老板娘黛玉姐（孟瑶饰），人人身怀绝技。他们每一次都把土匪消灭得干干净净，保了镇民平安。林国栋（洪金宝饰）的女儿雪儿（童菲饰），喜爱烹饪，时来镇上买新鲜蔬果，由于美丽活泼，深得众侠欢心，尤其是小裁缝娇婆四，更是对她一见钟情，把她当梦中情人。\n日本女特务黑泽青子，勾结汉奸猛虎庄之洪虎、洪豹、洪凤，设立情报基地，用密码传送情报回国，并对林国栋施以色诱，然后以忍术控制其神智，再要害死雪儿，幸雪儿逃脱。雪儿逃往福星镇求七侠救父亲出险境。七侠尚未考虑清楚，青子已先下手为强，雇用杀手来狙杀他们，全镇老百姓愤而反抗，连百岁老人亦不甘人后，感动了七侠，一齐出手，击退杀手。七侠连手赶赴猛虎庄。黑泽青子一手安排了她与林国栋的婚礼，妄图成为师长夫人后控制林国栋的军队，幸众侠及时赶到，破坏婚礼，林国栋恢复神智，与众侠合力大战青子与洪家兄妹，终尽歼强敌！七侠远去，林国栋亦决意全力对抗日本势力，誓保中国大好河山。',NULL,'线下',0,0,'笑功震武林','2015-11-26 10:58:02',1,NULL),
	(186,'aadd7e32-c0f9-4903-b67d-65309b626c39','自由坠落','自由坠落_Big.png',1,'100 分钟','斯蒂芬·拉坎特','汉诺·科弗勒/马克思·雷迈特',1,2013,'德国','剧情','《自由坠落》讲述36岁的防暴警察马克有一个女友，并且即将为人父。但他情不自禁的爱上了英俊的警察同事凯。马克在熟悉的旧世界和刺激的新体验中间难以决断，最终让一切失控…',NULL,'线下',0,0,'自由坠落','2015-11-26 10:58:02',1,NULL),
	(310,'ad21f00c-aabc-44ea-ad1d-dfb91ccb2ad0','恋爱中的城市','恋爱中的城市_Big.png',1,'117分钟','文牧野/董润年','杨幂/郑开元/江疏影/李贤宰',1,2015,'中国','爱情','该片讲述了五对情侣在全球五大“恋爱圣地”，分别上演风格迥异的爱情故事。',NULL,'线下',0,0,'恋爱中的城市','2015-11-26 10:58:02',1,NULL),
	(357,'addbb485-a486-4010-9531-b32698e7f4ab','难忘同窗情','难忘同窗情_Big.png',1,'\n96分钟','Jesse Zwick','奥布瑞·普拉扎/马克思·格林菲尔德',1,2014,'美国','剧情','六个许久不联系的大学好友共聚一堂，计划共同度过3天小长假，让他们重逢的机遇却有些悲伤————六人中的亚历克斯在不久前自杀未遂，好友们决定照看并阻止他再次寻短。然而当有着无数共享记忆的旧日同窗相聚，早已被生活改变的他们将碰出怎样的火花？近在咫尺的旧爱又对已成人的密友们有何影响？',NULL,'线下',0,0,'难忘同窗情','2015-11-26 10:58:02',1,NULL),
	(139,'ae47db8d-cbc1-4041-8623-10b7f84771c3','密道追踪之阴兵虎符','密道追踪之阴兵虎符_Big.png',1,'95分钟','俞岛','李炳渊/母其弥雅',1,2014,'中国','动作','讲述了古城镇的钢厂地下惊现金元时期的古墓，千年古墓重见天日，宝藏价值连城，其中的“阴兵虎符”更是无价之宝，各路盗墓人马纷涌而至，夺宝大战一触即发，而虎符背后隐藏的惊天秘密 ，将众人的命运推进千年古墓的生死迷局之中……',NULL,'线下',0,0,'密道追踪之阴兵虎符','2015-11-26 10:58:02',1,NULL),
	(81,'af2e9542-7e5d-4595-95b1-d49ab74dfa5d','鹿鼎记2神龙教主','',1,'93分钟','王晶 ','周星驰/温兆伦/邱淑贞/林青霞/刘松仁/张敏/李嘉欣/吴君如/袁洁莹',1,1993,'中国','喜剧','该片承接上集假太后潜入宫中谋夺皇位计划失败后，逃脱返回神龙教坛向教主请罪，及后教主道出自己已时日无多，下令假太后现身变回龙皇接杖神龙教主之位及辅助平西王吴三桂登上皇位。宫庭内康熙皇帝设宴款待平西世子，怎料韦小宝被发现是丽春院的小子，及后皇上宣布赐婚其妹建宁公主给吴应熊，下令小宝与众臣护送出嫁。驿馆中，多隆哭诉小宝被奸人害死，怎知小宝出现，吓至多隆面容失色，逼他出街大叫“反清复明”找出反贼陈近南，怎料双皇一早设计使多隆闯入平西王府遇见吴三桂，多隆以为吴三桂是陈近南而大叫口号，被王府众侍卫狂打。 众人骑马逃走时，怎被皇上及大批官兵追上包围，最后康熙亦念旧日之友情及建宁公主，而放过所有人。',NULL,'线下',0,0,'鹿鼎记2神龙教主','2015-11-26 10:58:02',1,NULL),
	(6,'b047c2ee-6732-4bcc-a606-aca885d77ab9','第五元素','Upload/Img/201512/567103b34e9b4.jpg',1,'125分钟','吕克·贝松','布鲁斯·威利斯加里·奥',1,1997,'法国','科幻','影片《第五元素》是1997年哥伦比亚影片公司出品的一部科幻电影，由吕克·贝松执导，布鲁斯·威利斯、加里·奥德曼、伊安·霍姆和米拉·乔沃维奇等联袂出演。影片于1997年5月7日在美国上映。电影故事发生在2259年的未来纽约，一股宇宙之中的邪恶力量想统治地球，人类面临万劫不复的黑暗世界。外星善良势力预见到这一天的来临，并一直关注着事态的发展，但他们派来地球拯救人类和宇宙的“第五元素”却被恶势力击落。人类复原了“第五元素”，并派出现为纽约出租车司机的前特工柯本协助，最终将恶势力摧毁拯救了人类',NULL,'线下',0,0,'第五元素','2015-11-26 10:58:02',1,NULL),
	(312,'b0952f79-605f-4cf1-ac0b-c56bbf2aa0e4','情敌蜜月','情敌蜜月_Big.png',1,'120分钟',' 张林子','张雨绮/权相佑/霍建华/施予斐',1,2015,'中国','爱情','电影讲述的是两位配对专家假扮情侣，在执行一次拆散富豪千金任务中，却偏偏情逢敌手，在蜜月旅行中上演了一场斗智斗勇最后谈情说爱的浪漫喜剧故事。',NULL,'线下',0,0,'情敌蜜月','2015-11-26 10:58:02',1,NULL),
	(283,'b138659f-a807-41dd-9d68-0e172393fdef','我在路上最爱你','我在路上最爱你_Big.png',1,'94分钟','金丰起','黄圣依/池珍熙/文章',1,2014,'中国/韩国','爱情','讲述在一辆南下列车上男女主人公不期而遇，在旅行途中产生的一段浪漫爱情故事。',NULL,'线下',0,0,'我在路上最爱你','2015-11-26 10:58:02',1,NULL),
	(339,'b1b13e1c-9d14-415a-a75f-192152fba443','幻世追踪','幻世追踪_Big.png',1,'96分钟','布莱恩·A·米勒','托马斯·简/布鲁斯·威利斯',1,2015,'美国','动作 ','《幻世追踪》是由布莱恩·A·米勒执导，托马斯·简、布鲁斯·威利斯和夏洛特·柯克等主演的一部美国科幻电影。影片故事背景设在未来，威利斯经营的娱乐场所幻世，拥有一批机器人，当作人类发泄情绪，实施现实生活中无法实施的各种残忍犯罪的受害人。',NULL,'线下',0,0,'幻世追踪','2015-11-26 10:58:02',1,NULL),
	(76,'b25a2260-4440-4a83-8719-bde5c89a4c8d','赌侠II上海滩赌圣','',1,'116分钟','王晶','周星驰,/吕良伟/巩俐/吴君如/吴孟达/向华强/张敏/程东',1,1991,'中国','喜剧','阿星（周星驰 饰）由赌神（周润发饰）处学成归来，恰逢不甘心失败的大军集合中南海五大高手复仇，虽有龙五（向华强 饰）相助，但阿星与三叔（吴孟达 饰）仍被大军等人发功送至1937年的上海, 阿星与三叔失散后意外击杀谋害许文强之凶手，得以结识丁力（吕良伟 饰），自此与祖父周大福（吴孟达 饰）留在丁力身边，丁力女友如仙（巩俐饰）（台湾版为（方季惟饰））令阿星魂牵梦绕，却不知她是自己所中意女孩如梦（巩俐 饰）的孪生姐姐，川岛芳子意欲控制上海，于是网罗大军等人频频向丁力发难，并约定最后以赌局决定胜负，阿星从日本人手中涉险逃脱，终于赶上赌局，而决定这场赌局的关键，却是一个名叫“今晚打老虎”的神秘人物……',NULL,'线下',0,0,'赌侠II上海滩赌圣','2015-11-26 10:58:02',1,NULL),
	(306,'b33e97d3-cabb-4471-bcbf-2b2152ff93e7','小叮当永无兽传奇','小叮当永无兽传奇_Big.png',1,'76分钟','Steve Loter','金妮弗·古德温/梅·惠特曼/刘玉玲',1,2014,'美国','冒险',' 小叮当：永无兽传奇是奇妙仙子系列动画电影中第六部电影，芳雯作为这部电影的主角。小叮当的朋友芳雯结识了强大又神秘的永无兽，并与它成为了朋友。但是其它仙子并不认可永无兽，以尼克斯为主首的侦查仙子更是将永无兽当成祸害仙子谷的不详征兆。面对这一切，芳雯该何去何从？',NULL,'线下',0,0,'小叮当永无兽传奇','2015-11-26 10:58:02',1,NULL),
	(154,'b3641150-3363-427c-9445-be5330f1f390','星际穿越','星际穿越_Big.png',1,'169分钟','克里斯托弗·诺兰','马修·麦康纳/安妮·海瑟薇',1,2014,'美国','冒险 ','星际穿越》的故事讲述了未来的地球气候环境急剧恶化、粮食严重紧缺，人类已经难以生存。马修?麦康纳饰演的主人公库珀与安妮?海瑟薇等被选中作为拯救人类未来计划的一员，必须前往太阳系之外另寻适宜人类居住的星球。',NULL,'线下',0,0,'星际穿越','2015-11-26 10:58:02',1,NULL),
	(45,'b3741ee8-74c4-436a-8fe7-bc7702928d42','临时同居','',1,'100分钟','卓韵芝','张家辉/郑秀文/欧豪',1,2014,'中国','爱情','勤奋努力的地产经纪项少龙（张家辉饰） ，求婚却因婚房太小而被拒。女友提出要在一年的时间里住上豪宅，对少龙来说简直就是个不可能的任务。每日都苦思赚钱大计的少龙突然遇到一个难得的好机会——一个名为“天下无双”的梦幻豪宅低价放盘。如果自己可以顺利买下再转手，便可一举实现目标。于是他找来四个人和他一起“炒楼”：金凤（郑秀文饰）有一定资产正准备租房的女人；阿黑（Angelababy饰）少龙前妻的女儿；Very（欧豪饰）与少龙同一间地产公司的实习生、富二代。 怎料刚刚买下豪宅就遇到政府打压炒楼，楼市惨淡。于是四人都搬进了单位，组成了一个临时家庭，各种矛盾也接踵而来。',NULL,'线下',0,0,'临时同居','2015-11-26 10:58:02',1,NULL),
	(80,'b3b65f93-7365-4402-8e27-33a72dee2307','济公','',1,'85分钟','杜琪峰/程小东','周星驰/张曼玉/吴孟达/黄秋生/梅艳芳/苑琼丹/黄志强',1,1993,'中国','喜剧','影片讲述降龙罗汉与众仙打赌，要在一定时限内令三名凡人肯为他人作出牺牲，否则再受轮回之苦。他投胎成为济公，一面游戏人间，一面普渡为生，被他选中的三个目标是：九世乞丐黄秋生，九世妓女张曼玉，九世恶人黄志强。三人被济公感化，果然作出为人牺牲之举，妓女更对济公一往情深。降龙罗汉最终功德圆满，返回天庭，荣升为降龙尊者。',NULL,'线下',0,0,'济公','2015-11-26 10:58:02',1,NULL),
	(381,'b560d934-bf50-41cb-83d5-36b57aa85bc6','小萝莉的神猴大叔','小萝莉的神猴大叔_Big.png',1,'163分钟','卡比尔·可汗','萨尔曼·汗/哈莎妮·马霍特拉',1,2015,'印度','剧情','印度教教徒Bajrangi（萨尔曼·汗 Salman Khan 饰），与Rasika（卡琳娜·卡普尔 Kareena Kapoor 饰）在新德里的月光集市相遇，彼此有所误解而成为一对冤家，但他们却联手帮助一位有语言障碍的穆斯林小女孩Shahida（Harshaali Malthotra 饰），让她回到自己的家乡与家人团聚。',NULL,'线下',0,0,'小萝莉的神猴大叔','2015-11-26 10:58:02',1,NULL),
	(162,'b6e225ce-6f19-40b3-a5a5-ed0bae72f2b0','死亡诗社','死亡诗社_Big.png',1,'\n128分钟','彼得·威尔','罗宾·威廉斯/伊桑·霍克',1,1989,'美国','剧情','1959年，内向的托德·安德森前去威尔顿预备学院读书。他的室友尼尔阳光开朗，却天天受父亲管制。一天，他们班上迎来了新教师约翰·基廷。基廷以反传统的教育方法，向学生介绍了许多有思想的诗歌，提倡自由发散式思维，引起了巨大的反响。渐渐地，一些人接受了他，开始勇敢把握自己的人生。',NULL,'线下',0,0,'死亡诗社','2015-11-26 10:58:02',1,NULL),
	(262,'b78fd4ff-48e1-4e43-abce-1910ee34e8ff','黑暗终结者','黑暗终结者_Big.png',1,'89分钟','康斯坦尼·马科斯莫夫','弗拉季米尔·弗多维琴科夫/露波芙·托卡丽娜',1,2011,'俄罗斯','动作','罗斯科幻巨制，改编自瓦西里-戈洛瓦乔夫的科幻小说，故事发生在被“黑暗世界”所控制的莫斯科城，曾惨遭奸人陷害坠机却奇迹般复活归来的勇士马维在光明世界的指引下成为一名勇猛的黑暗终结者……',NULL,'线下',0,0,'黑暗终结者','2015-11-26 10:58:02',1,NULL),
	(328,'b81b027f-8d41-4f8f-8fac-e616fc446fd0','冬眠','冬眠_Big.png',1,'\n196分钟','努里·比格·锡兰','哈鲁克·比尔吉奈尔/梅丽莎·索岑',1,2014,'土耳其','剧情','《冬眠》讲述了退休演员艾登的生活，他在安纳托利亚中部经营着一家小旅馆，和年轻妻子尼哈尔生活在一起，但他们的感情已经不复当初。他的妹妹则沉浸在离婚不久的痛苦之中。随着冬天的到来，白雪覆盖大地，旅店成为他们的庇护所，同时也成了一座舞台，上演出各种悲欢离合……',NULL,'线下',0,0,'冬眠','2015-11-26 10:58:02',1,NULL),
	(157,'b82a074c-5ac8-4cac-840e-75da191674df','最后的乘客','最后的乘客_Big.png',1,'97分钟','Omid Nooshin','多格雷·斯科特/琳赛·邓肯',1,2013,'英国','悬疑','刘易斯·史蒂文斯（多格雷·斯科特饰）是一个忙碌的医生，他把身在伦敦的父亲和年幼的儿子接回来，坐上了末班火车。在车上刘易斯碰上了一个美丽妖娆的女子，他瞬间觉得生活终于开始有了起色。可是接着事故发生了，刘易斯发现火车上的乘务员都不见了，而且刹车装置已经被破坏，车上为数不多的乘客并不知情，此时火车已经被一个对社会充满仇恨的人控制，他想让火车坠毁，或者说他想要车上的人和他一起陪葬~而刘易斯就肩负着如何让火车停下来的任务···',NULL,'线下',0,0,'最后的乘客','2015-11-26 10:58:02',1,NULL),
	(82,'b91f2e02-339b-4a25-a261-472ed1db0c5a','少年班','少年班_Big.png',1,'115分钟','肖洋 ','孙红雷/周冬雨',1,2015,'中国','喜剧','1998年，来自西安交大的“少年班”导师周知庸（孙红雷 饰），前往全国各处寻找智商超群的天才少年，最终被选出的22个少年将被赋予艰巨的使命。少年吴未（董子健 饰）就是其中的一员，在这个特殊的班级里，他先后认识了有暴力倾向的麦克（王栎鑫 饰）、小天才方厚正（李佳奇 饰）、“神棍”王大法（柳希龙 饰），以及聪明却冷若冰霜的周兰（周冬雨 饰），五位天才少年从此开始了早于同龄人的大学生活，同时还面对着青春期的各种“疑难杂症”。女神江依琳（夏天 饰）的出现扰乱了男生们的心，攻克“世界数学大赛”的压力也从天而降，而导师周知庸也面对着人生中的最大难题，“少年班”该何去何从？天才少年人生的征途才刚刚开始…… ',NULL,'线下',0,0,'少年班','2015-11-26 10:58:02',1,NULL),
	(183,'ba6da0ff-3ab8-4529-9062-8c7205ea5ba1','缺席的人','缺席的人_Big.png',1,'116分钟','乔尔·科恩','比利·鲍伯·松顿/弗兰西斯·麦克多蒙德',1,2001,'英国','犯罪','故事发生在1949年，该片的主角是旧金山北郊一个小镇上的理发师艾德，他因病未能参加二战，战后的生活更是风平浪静，他天性内向，不爱说话，只是默默地抽烟，跟爱出风头的老婆似乎没有什么感情，甚至对老婆红杏出墙都没什么反应。不满现状的艾德一旦“行动”起来，“现状”就像是一个巨大的旋涡，让他欲罢不能。',NULL,'线下',0,0,'缺席的人','2015-11-26 10:58:02',1,NULL),
	(351,'ba940416-04c7-4797-8047-151aa3d8d450','美丽谎言','美丽谎言_Big.png',1,'110分钟','菲利普·法拉迪约','瑞茜·威瑟斯彭/寇瑞·斯托尔',1,2014,'美国','剧情','影片根据真人真事改编，聚焦一位经历无数战火的苏丹年轻人，中了移民彩票后他与三名和他身世一样漂泊的年轻人移居美国。来到美国后，他们首次接触到各种新鲜事物，也结识了一个坦率开朗的美国女人，在她的帮助下，他们开始找工作，文化的差异让他们遇到不少困难……',NULL,'线下',0,0,'美丽谎言','2015-11-26 10:58:02',1,NULL),
	(59,'babe08bf-4a10-47b0-b871-55452ae22205','大腕','',1,'113分钟','冯小刚','葛优/关之琳/唐纳德·萨瑟兰/英达',1,2001,'中国','喜剧','一位国际大导演泰勒将其新作的外景地选在了中国。谁料天有不测风云，泰勒在拍戏中一病不起。眼看大腕命在旦夕，大家决定为他操办一场体面风光的葬礼。于是，电影厂下岗摄影师优优和木讷迂腐的商人路易?王揽上了这活儿，一时间，大腕的葬礼成了所有媒体关注的焦点，谁也不甘心错过这样大好的商机。这可愁坏了优优，更愁坏了大腕的助手露茜。就在葬礼准备得如火如荼的时候，不可置信的事发生了。',NULL,'线下',0,0,'大腕','2015-11-26 10:58:02',1,NULL),
	(111,'bb6a32ed-a3aa-450b-b31b-6e010d7f7f0c','公路美人','公路美人_Big.png',1,'105分钟','非可','齐溪/张念骅',1,2015,'中国','爱情','美女作家安东妮为推广新书而参加了卫视当红婚恋节目《爱上你》，并意外牵手汉人藏迷摄影家秀巴，随他前往梅里雪山。与安东妮相恋三年的男友，某内衣公司CEO曾浩为此千里迢迢追女友至香格里拉，从而认识了藏人美女司机敏琼。敏琼为曾浩的执着所动，曾浩也为敏琼的善良所动，在追寻安东妮的路上发生了一系列使得曾、敏感情得以升华的事件。当四人各自复归原位之时，一场突发事故，最终揭开了敏琼的身世之谜，巧妙诠释了一个“逃到天边也逃不出爱情”的宿命主题，它是一部发生在当下藏地“在路上”的传奇爱情电影。',NULL,'线下',0,0,'公路美人','2015-11-26 10:58:02',1,NULL),
	(223,'bb6ce419-7ef8-4a1d-b3a0-525a809af2a8','阴阳先生','阴阳先生_Big.png',1,'73分钟','张涛','彭禺厶/高成龙/刘玥彤/李婉儿/艾晓琪',1,2015,'中国','惊悚','我行走在阴阳两界，读过书抓过鬼，收过妖还杀过僵尸……这就是我，隐藏在都市中的阴阳先生。',NULL,'线下',0,0,'阴阳先生','2015-11-26 10:58:02',1,NULL),
	(366,'bbdc6ee1-9429-4657-8c67-d7a36c564990','上帝帮助女孩','上帝帮助女孩_Big.png',1,'111分钟','斯图尔特·默多克','艾米莉·布朗宁/奥利·亚历山大',1,2014,'英国','剧情','故事发生在苏格兰格拉斯哥。主人公少女伊娃(艾米莉·布朗宁 饰演)住在一家专门提供给情绪出现问题的病人的医院。伊娃开始每天写歌，来帮助自己康复。通过写歌，她遇到了詹姆斯(奥利·亚历山大 饰演) 和凯西( 汉娜·穆雷 饰演)，他们也都站在自己人生的岔路口上。在一个漫长又梦幻的夏天里，这个关于复苏的故事开始了。',NULL,'线下',0,0,'上帝帮助女孩','2015-11-26 10:58:02',1,NULL),
	(386,'bbde84b6-460c-48f9-bf4d-72e288e1ce0b','夜莺','夜莺_Big.png',1,'95分钟','费利普·弥勒','李保田/杨心仪',1,2014,'法国/中国','剧情','《夜莺》讲述的是一位老人和孩子的故事。这位老人为了兑现多年前的承诺，准备带着他的夜莺结伴远行，从北京赶赴老家广西，因为儿子和儿媳忙于工作无暇兼顾，使得他不得不带上年仅8岁的孙女一同出行。伴随一只夜莺，一位老人和一个都市的小女孩，就这样开始了一场注定不平静的心灵之旅。',NULL,'线下',0,0,'夜莺','2015-11-26 10:58:02',1,NULL),
	(55,'bc49b196-e950-4b8a-9ce3-ce5db039368d','澳门风云1','',1,'93分钟','王晶/钟少雄','周润发/谢霆锋/杜汶泽/景甜/高虎/童菲/张晋/伍允龙/吴辰君',1,2014,'中国','喜剧','闻名中外，曾担任美国赌场保安总顾问的魔术手石一坚（周润发 饰），终回流澳门退休，更宴请各方朋友到来庆祝生日宴。其中好友Benz哥奔驰（许绍雄 饰）与他的儿子小冷（谢霆锋 饰）以及外甥牛必胜牛牛（杜汶泽饰），更特别由香港来到澳门到贺。 翌日，大陆、香港以及澳门三地警方，竟不相约而同找上石一坚，希望他可以打击对付DOA组织集团的高先生（高虎 饰），但坚却以退休为由婉拒了事。\n而小冷同母异父的哥哥是中国公安安排在高先生的卧底，因为左眼假眼记录了洗黑钱的现场并被杀手知道是内鬼和追杀，他躲在小冷在香港的房子里时，把左眼掏出按在了一个比比熊的一只眼睛里。另一边厢，小冷竟与牛必胜一起找上门，希望坚哥收他俩为徙弟，坚哥虽欣赏小冷，但奈何已经退休，只好拒绝，但看在Benz哥份上，就招待他一夜。谁不知，当晚竟遇上了杀手（张晋 饰），杀手们不问原因直接追击小冷以及坚哥爱女阿彩（童菲 饰）。期间虽有中国公安洛子雯（景甜 饰）相救，但阿彩终难逃一劫，被害至失忆。（阿彩失忆为坚哥刻意安排为将假眼送至公安手中） 明查暗访下才知道，幕后的黑手竟是高先生。事情又岂会是无缘无故发生，坚哥与小冷二人联手，加上女公安洛子雯三人，布下奇谋妙计对付高先生，斗智斗力，誓要查个水落石出，将他绳之于法。',NULL,'线下',0,0,'澳门风云1','2015-11-26 10:58:02',1,NULL),
	(401,'be949e83-60a6-45c5-a65d-4fb873ac1a4d','春田花花同学会','春田花花同学会_Big.png',1,'95分钟','赵良骏','周笔畅/黄秋生/吴镇宇',1,2006,'中国','喜剧','故事讲述春田花花幼稚园里一班小朋友，长大后在各行各业中经历的酸甜苦辣。',NULL,'线下',0,0,'春田花花同学会','2015-11-26 10:58:02',1,NULL),
	(299,'bf0afdd8-a797-4fca-9824-21333327abeb','马达加斯加的企鹅','马达加斯加的企鹅_Big.png',1,'93分钟','埃里克·达尼尔/西蒙·J·史密斯','汤姆·麦克格雷斯/克里斯·米勒',1,2014,'美国','动画','《马达加斯加的企鹅》是由埃里克·达尼尔、西蒙·J·史密斯导演，由梦工厂出品的一部喜剧动画冒险电影。影片讲述了四个企鹅在全世界各地冒险的故事。',NULL,'线下',0,0,'马达加斯加的企鹅','2015-11-26 10:58:02',1,NULL),
	(194,'bfd8968e-d959-4680-8f96-9209dee992de','谍中谍5神秘国度','谍中谍5神秘国度_Big.png',1,'131分钟','克里斯托夫·迈考利','汤姆·克鲁斯/丽贝卡·弗格森',1,2015,'美国',' 冒险 ','汤姆·克鲁斯饰演的伊桑·亨特将与他的团队一起遭到一个名为“神秘国度”的组织追杀，对方是与他们同样技艺高超的劲敌，试图摧毁阿汤哥所在的“不可能任务情报署”(IMF)。西蒙·佩吉、杰瑞米·雷纳、文·瑞姆斯三位老搭档悉数回归，接应阿汤哥共赴这场不可能的任务。',NULL,'线下',0,0,'谍中谍5神秘国度','2015-11-26 10:58:02',1,NULL),
	(240,'bfdcaae9-d8f4-42d5-a225-14aed117c79b','狂野飞车','狂野飞车_Big.png',1,'104分钟',' 帕特里克·卢西尔','尼古拉斯·凯奇/艾梅柏·希尔德',1,2015,'美国','动作','《狂暴飞车》是顶峰娱乐2011年上映的一部3D动作电影。由帕特里克·卢西尔执导，尼古拉斯·凯奇、艾梅柏·希尔德等主演。该片讲述了已经死掉的米尔顿因为女儿被杀、外孙被绑架，从地狱里爬出来进行复仇和营救的故事。',NULL,'线下',0,0,'狂野飞车','2015-11-26 10:58:02',1,NULL),
	(8,'c087b1c0-8b69-40ab-9193-6aab3a926ace','太空运输','',1,'111分钟','Ivan Engler','Martin ',1,2009,'瑞士','科幻','地球生态完全毁坏之后，人类迁居外太空，造成太空站人满为患，而唯一获得解救的希望就在距离地球五个光年的另一个星球上……在前往新星球的途中，所有人都将进入冷冻休眠状态，只有几个士兵轮值守卫，而在年轻医官萝拉的四个月轮守当中，诡异、寂静的太空船上似乎有其他生物存在着……到底那些生物是敌是友？这场充满灾难的人类迁徙之旅能顺利完成吗？',NULL,'线下',0,0,'太空运输','2015-11-26 10:58:02',1,NULL),
	(363,'c11bbb5f-fb75-4a8b-a722-972df293f7dc','如果我留下','如果我留下_Big.png',1,'106分钟','R.J.卡特勒','科洛·格蕾斯·莫瑞兹/米瑞·伊诺丝',1,2014,'美国','剧情','影片的故事讲述了一个天赋超群的古典音乐少女意外地与家人遭遇严重车祸，在昏迷之中忽然灵魂出窍，在生死之间看见未来。少女一边亲眼看着男友和同伴奔向医院，护士在耳边喃喃低语的场景，一边思索要如何做出艰难的选择：是随父母离世而去，还是苏醒过来继续人生。有媒体评价本片为青少年版的《人鬼情未了》。',NULL,'线下',0,0,'如果我留下','2015-11-26 10:58:02',1,NULL),
	(388,'c130c4bf-db5b-4d10-83f7-49d1f137c06b','永远16岁','永远16岁_Big.png',1,'100分钟','Lynn Shelton','凯拉·奈特莉/科洛·莫瑞兹',1,2014,'美国','喜剧','讲述了梅根和她新交的好朋友安妮卡，一起享受青春的故事。',NULL,'线下',0,0,'永远16岁','2015-11-26 10:58:02',1,NULL),
	(71,'c176c930-0b83-4ffe-9f66-3e7e0e32c89c','西游之一路向东','西游之一路向东_Big.png',1,'60分钟','洛森（契子）','子昊/刘朋洋/张有才/张鹏/李岩/麦希',1,2014,'中国','喜剧','如来派师徒四人与小白龙去东土大唐去传教，如来与大唐皇帝李世民有约，大唐支持佛教事业，如来需派遣得力国师稳固他帝王基业，赐长生不老药一粒，赐取之不尽宝藏藏宝图。\n唐僧师徒四人一路上遇到了各路妖魔鬼怪，有为长生不老药而来，有为藏宝图而来，途径受劫九九八十一难，展开了一系列难以预测的离奇故事。',NULL,'线下',0,0,'西游之一路向东','2015-11-26 10:58:02',1,NULL),
	(201,'c20f896c-e139-4b55-af69-3d8ccec08398','辉煌年代','辉煌年代_Big.png',1,'114分钟','谢加·凯普尔','凯特·布兰切特/克里夫·欧文',1,2007,'英国','爱情 ','16世纪末期，故事紧接首部曲《伊莉莎白》，英女王伊莉莎白一世铲除政治异己、登上权力巅峰，揭开大英帝国的《辉煌年代》。当务之急是要面对苏格兰女王玛丽·斯图亚特，真正的劲敌则是玛丽潜在的后台西班牙的菲利普二世。正是在击溃西班牙引以为傲的“无敌舰队”之后，纵横七海、进入殖民全盛期的大不列颠才夺得“日不落”称号。而机关算尽仍游刃有余的女王，也将在权谋与杀伐的风口浪尖上，同沃特·劳利爵士共谱一段游离于正史之外的恋情。',NULL,'线下',0,0,'辉煌年代','2015-11-26 10:58:02',1,NULL),
	(292,'c2a35052-0771-4e81-98d3-eac2ab3b8a85','忧郁症','忧郁症_Big.png',1,'127分钟','拉斯·冯·提尔','克斯汀·邓斯特/夏洛特·甘斯布/基弗·萨瑟兰',1,2011,'德国','科幻','贾斯汀和卡莱尔是一对姐妹，原先关系十分亲密，可是随后却渐行渐远。贾斯汀和米歇尔要举办婚礼，可是在结婚后不久，贾斯汀就患上了忧郁症。这种疾病非但没有让贾斯汀歇斯底里，反而让她在地球在遭受诅咒和被毁灭之前异常的冷静。可是她的姐妹，克莱尔却对即将到来的一切感到异常的恐惧。',NULL,'线下',0,0,'忧郁症','2015-11-26 10:58:02',1,NULL),
	(64,'c2b7d48c-e9d9-42b3-a05c-d429973a1a83','甲方乙方','',1,'97分钟','冯小刚','葛优/何冰/刘蓓/冯小刚',1,1997,'中国','喜剧','这是一部在现实和虚构之间自由切换的电影，姚远(葛优饰)、周北雁 (刘蓓饰)、钱康(冯小刚饰)、梁子(何冰饰)——三男一女，四个善良，智慧又善解人意的自由职业者，在1997年夏天开办了一项“好梦一日游”的业务。工作重点是帮助消费者过一天好梦成真的瘾。刚开始试营业，立刻引来一批突发奇想的顾客。如：卖书的板儿爷想当一天巴顿将军(英达饰)；厨子(李琦饰)因为嘴不严，一直梦想尝尝守口如瓶的滋味；一时间把“好梦一日游”的四个人忙得团团转：刚脱下美军伤兵的衣服又换上清兵的军服；一会儿是参加作战会议的将领，一会儿又成了溜须拍马的卫兵；白天开着敞蓬吉普背着电台在坦克训练场的土路上颠簸，夜里又开着老式的吉普车鬼鬼祟祟地闯入民居去抓人。因为没有经验闹出了很多笑话，工作中也是漏洞百出。于是，四个人开了一个纠偏会，统一了认识，明确规定了对于有不健康愿望的顾客要敢于说“不”，使“好梦一日游”的业务逐渐走上正轨。他们通过“爱情梦”帮助因为屡遭失恋对生活丧失信心的人恢复了自信；又通过“受气梦”教育了大男子主义顾客；又利用了大款想做“受苦梦”、明星想做“普通人的梦”，嘲弄了那些得了便宜还卖乖的人。在帮助顾客实现梦想的过程中，他们从开心、好玩、甚至有些胡闹中，渐渐地投入了自己的真情。到后来，为帮助身患癌症的无房夫妇做一个“团圆梦”，竟将自己准备结婚的新房贡献来。',NULL,'线下',0,0,'甲方乙方','2015-11-26 10:58:02',1,NULL),
	(199,'c3390f2d-a3ea-4424-bba8-55f1230a823d','超级战舰','超级战舰_Big.png',1,'132分钟','彼得·博格','泰勒·克奇/连姆·尼森',1,2012,'中国',' 动作 ','故事灵感来自孩之宝同名畅销战棋游戏“战舰攻防战”， 电影讲述海军中尉Alex (泰勒·克奇饰) 被上级派往美国飞弹驱逐舰 (USS John Paul Jones) 上履行职务。',NULL,'线下',0,0,'超级战舰','2015-11-26 10:58:02',1,NULL),
	(242,'c37c432b-463b-4293-9f93-e2896e9b94a9','煎饼侠','煎饼侠_Big.png',1,'113分钟','董成鹏','大鹏（董成鹏）/袁姗姗/柳岩',1,2015,'中国','喜剧','该影片主要讲述了人气爆棚的演员大鹏由于一次意外事故跌入人生谷底后发生的趣事。',NULL,'线下',0,0,'煎饼侠','2015-11-26 10:58:02',1,NULL),
	(73,'c40d4a1c-9bd1-49c2-8120-17537aafed73','赌霸','',1,'94分钟','刘镇伟/元奎','吴孟达/郑裕玲/梅艳芳/钟镇涛/元华/成奎安/元奎/吴君如/秦沛/卢冠廷/周星驰',1,1991,'中国','喜剧','香港经典搞笑赌片《赌圣延续篇之赌霸》谨以此片怀念已故的梅艳芳女士 梅艳芳饰演赌圣的姐姐，同样怀有特异功能，因不满其弟在港以赌博赚钱，乃到香港将其弟捉回大陆。另一方面，运气十足的郑裕玲是一个鱼市老千，为了筹钱为其弟治病而答应三叔吴孟达参加国际赌王大赛。郑假装有特异功能，被梅看穿，但不识破。赌赛主办人秦沛为赢得胜利，一边请密宗大师传授功力，一边暗派杀手对付郑，未到最后关头，真不知鹿死谁手。',NULL,'线下',0,0,'赌霸','2015-11-26 10:58:02',1,NULL),
	(343,'c49fd80b-5d2c-45d4-b116-56be8cae28e2','骄傲','骄傲_Big.png',1,'120分钟','马修·沃楚斯','本·施耐泽/乔治·麦凯',1,2014,'英国','喜剧','1984年夏天，玛格丽特·撒切尔正当权，英国的全国矿工工会发起了一场罢工。与此同时，伦敦举行了一场同志大游行，同性恋者试图筹集善款，来给罢工中的旷工家庭减去一些经济负担。然而最大的问题在于，矿工工会的人对于这样的举动并不感激，相反他们觉得很丢脸……',NULL,'线下',0,0,'骄傲','2015-11-26 10:58:02',1,NULL),
	(65,'c6156d74-1b3c-4ee5-aa1f-bba614a39060','老男孩猛龙过江','老男孩猛龙过江_Big.png',1,'114分钟','肖央','肖央/王太利/屈菁菁/曲婉婷/郝凯瑞',1,2014,'中国','喜剧','两个怀揣梦想的大叔孤注一掷跨国寻梦的冒险历程，片中郁郁不得志的“筷子兄弟”将迎来事业的“第二春”，在大洋彼岸上演了一系列的爆笑励志闹剧。肖大宝靠在浴场唱歌来维持生计，生活带给他太多无奈，梦想在肖大宝眼里只是回忆时的牛逼，而另一边王小帅，作为上门女婿，在家人和邻里眼中是“软饭男”，连同睡一床的老婆也不理解他，多次劝他放弃梦想回归现实生活。\n终于在一次神秘的机缘下，New York给两位屌丝抛来了橄榄枝，面对窘迫生活对梦想孤注一掷的“老男孩”终于要为梦想启程。这对“活宝组合”将重拾信心又聚在了一起，决定前往美国勇闯选秀节目。两兄弟千辛万苦来到纽约，却阴差阳错卷入了黑帮斗争事件',NULL,'线下',0,0,'老男孩猛龙过江','2015-11-26 10:58:02',1,NULL),
	(167,'c681e082-8834-4b1b-9a7b-8b059431eee0','激战','激战_Big.png',1,'120分钟','林超贤','张家辉/彭于晏',1,2013,'中国','动作','一边是过气香港拳王程辉（张家辉 饰）；一边是家族破产的富二代林思齐（彭于晏 饰）。两个风光一时的失意人，一个为了避债，一个为寻父，在澳门相遇成为拳击师徒。辉为了挽回人生尊严；齐为了鼓励失踪的父亲别放弃，师徒二人踏上MMA的擂台，无惧地挑战强大对手。',NULL,'线下',0,0,'激战','2015-11-26 10:58:02',1,NULL),
	(251,'c6d59949-6cf4-447f-8eba-a033d1f1ede5','太平洋幽灵','太平洋幽灵_Big.png',1,'','Brian Peter Falk','汤姆·费尔顿/加瑞特·迪拉胡特',1,2013,'美国','冒险','942年1月16日，美军飞行员哈罗德-迪克森(Harold Dixon，加列特-迪拉亨特饰演)、投弹手托尼-帕斯图拉(Tony Pastula，汤姆-费尔顿饰演)、通讯兵金恩-奥德里奇(Gene Aldrich，杰克-阿贝尔饰演)受命去执行一项任务。但是，飞机因燃油耗尽不得不紧急迫降，三个人不得不弃机逃生。他们没有食物、没有淡水、没有补给，挤在一个约3平米大小的黄色救生筏里，在充满危险的南太平洋上漂流等待救援',NULL,'线下',0,0,'太平洋幽灵','2015-11-26 10:58:02',1,NULL),
	(15,'c6f96e3b-54ce-47fc-b69f-b99aed18bca3','蝎子王3','',1,'105分钟','罗伊·雷内  ','维克多·韦伯斯特',1,2012,'美国','奇幻','影片一开始，莫萨尤斯失去了他心爱的皇后并且被前国王驱赶。现在莫萨尤斯受到了埃及国王荷鲁斯的雇佣保护盟友不受敌人的攻击，而作为回报，国王将会把女儿和拥有神力的徽章赐予莫萨尤斯。莫萨尤斯接受了这危险的任务，并且将要面对危险的敌人。',NULL,'线下',0,0,'蝎子王3','2015-11-26 10:58:02',1,NULL),
	(114,'c7193289-1328-4a33-a786-d65258af894c','初到东京','初到东京_Big.png',1,'100分钟','蒋钦民','秦昊/倍赏千惠子',1,2013,'中国/日本','剧情','讲述围棋手吉流初到东京留学，陷入迷茫困境，在去千叶的列车上，他与背着蔬菜进京的五十岚婆婆有了一次奇特偶遇，从此他的生活进入了一个不同的圈子，他与婆婆的孙子翔一，与翔一的女朋友奈菜子，与干洗店的服务员田原，开始有了剪不断理还乱的关系。那些苦闷激情的青春，在温馨的美景中渐渐淡去。',NULL,'线下',0,0,'初到东京','2015-11-26 10:58:02',1,NULL),
	(359,'c7882358-307c-4f64-bd70-c2ad69f46682','拼凑梦想','拼凑梦想_Big.png',1,'83分钟','肖恩·麦克纳马拉','乔治·洛佩兹/杰米·李·柯蒂斯',1,2015,'美国','剧情','影片根据真实事件改编，讲述了四个拉丁裔的高中生参加水下机器人设计竞赛的故事，他们有着过人的天赋，却因为移民“户口”的问题处处被人看轻。好在，他们得到了学校新来的老师弗雷迪的帮助。没有任何经验，只有800美元的经费，却要和全美最顶尖的麻省理工的机器人建造团队比拼，后者是这项赛事的卫冕冠军。在这过程中，四名学生不仅仅学会了建造机器人，同时经历了心灵上的脱变与成长。',NULL,'线下',0,0,'拼凑梦想','2015-11-26 10:58:02',1,NULL),
	(7,'c8113018-4074-430c-9402-b4c3f07af3ca','明日边缘','',1,'113分钟','道格·里曼','汤姆·克鲁斯/艾米莉·布朗特',1,2014,'美国','科幻','《明日边缘》是一部动作故事片，讲述了在不久的将来一种外星物种无情地攻击地球，地球上的任何武装力量都无法与之抗衡。影片主角威廉?凯奇（汤姆?克鲁斯饰演）是一个从未亲历过战争的军官，直到有一天他突然参与了一场自杀式行动。凯奇在数分钟内就被杀死，随即发现他自己进入到一个不可思议的时间循环之中——他不断反复经历着这场残忍的战斗，一遍又一遍的反复着战斗和死亡的过程。但是在每次的战斗之中，凯奇在对付敌人的过程中发现自己和自己的伙伴，特种部队战士丽塔·芙拉塔斯基（艾米莉?布朗特饰演）逐渐变得越来越强大。在凯奇和丽塔与外星人的战斗期间，每一次重复的过程都让他们离打败敌人的胜算更进了一步。',NULL,'线下',0,0,'明日边缘','2015-11-26 10:58:02',1,'2015-12-15 14:03:26'),
	(227,'c8a26c20-98c2-4b98-910a-5b64b4799f19','搏击之王','搏击之王_Big.png',1,'97分钟','David Worth/Mark DiSalle','Dennis Alexio/陈国新/Michel Qissi',1,1989,'美国','动作','美国重量级搏击冠军艾瑞受邀前往泰国曼谷，与当地泰国拳击王唐波竞赛，谁知艾瑞一时掉以轻心，被唐波打得双腿残废，差点丧命。略懂搏击的克特为了替哥哥艾瑞报仇决定向当地武学大师西安学习泰拳。恶霸佛瑞迪是当地的大混混，经常任其手下骚扰当地居民，并要求居民缴交保护费，克特为了替西安侄女麦丽解围，与其手下大打出手，此事传到佛瑞迪耳中，为了解决新仇旧恨，佛瑞迪决定派出唐波依照古法与之打斗。',NULL,'线下',0,0,'搏击之王','2015-11-26 10:58:02',1,NULL),
	(231,'c97715ea-69c2-4480-bf6e-1feaead563d5','纸镇','纸镇_Big.png',1,'109分钟 ','杰克·施莱尔','奈特·沃尔夫/卡拉·迪瓦伊',1,2015,'美国','剧情','昆汀从小就一直单恋勇于冒险的隔壁邻居玛戈，但两人在学校里的生活却是天差地别。某天晚上，玛戈打开昆汀房间的窗户重新踏入他的生命，并要求他协助一连串的报复行动，而昆汀也乖乖答应。在通宵的冒险结束后，翌日，昆汀像往常一样来到学校时却发现玛戈离奇地失踪。她的家人与警察都认为她不过是又开了一个小玩笑，昆汀却觉察出其中的异样。根据玛戈昨夜的反常举动与她刻意留下的蛛丝马迹，昆汀与他的朋友开始了寻找玛戈的旅程。一张惠特曼的诗歌残片、一段网站上的留言，线索零碎又环环相扣。昆汀沿着断续的线索搜寻，然而他越接近目的地，越对自己从小认识的那名女孩感到陌生。“你将前往纸镇，永不归来。”玛戈留下的文字，引领昆汀逐步走进那座由现实与虚构交杂而成的纸镇。',NULL,'线下',0,0,'纸镇','2015-11-26 10:58:02',1,NULL),
	(208,'c9bee5b1-5252-427e-87cf-a739b2c0596e','钢的琴','钢的琴_Big.png',1,'101分钟','张猛','王千源/秦海璐',1,2011,'中国','喜剧','讲述了钢厂下岗工人为了女儿的音乐梦想而不断艰苦努力，最后通过身边朋友的帮助用钢铁为女儿打造出一架钢琴的故事。',NULL,'线下',0,0,'钢的琴','2015-11-26 10:58:02',1,NULL),
	(356,'ca1ff515-4ce3-4b7a-bdc2-3b6c2ebfdd27','魔力月光','魔力月光_Big.png',1,'97分钟 ','伍迪·艾伦','艾玛·斯通/科林·费斯',1,2014,'美国','喜剧','故事发生在上世纪20年代的法国南部，艾玛·斯通和《神秘河》女星马西娅·盖伊·哈登饰演上流社会圈中一对母女，她们串通一气，与科林·费斯饰演的英国魔术师展开周旋。科林想要揭穿骗局，不料一段奇妙情缘因此而生。\n',NULL,'线下',0,0,'魔力月光','2015-11-26 10:58:02',1,NULL),
	(184,'ca75a761-3106-431c-aa5d-87000a576aca','美国人','美国人_Big.png',1,'92分钟','安东·寇班','乔治·克鲁尼/薇奥兰特·普拉西多',1,2010,'美国','剧情','在《美国人》中，克鲁尼饰演一位独自行动、技术高超的杀手，名叫杰克。当杰克在瑞典完成了一个任务之后，又一个更艰巨的任务等待着他——他会被派往美国去暗杀。',NULL,'线下',0,0,'美国人','2015-11-26 10:58:02',1,NULL),
	(272,'cb1e9a9a-0963-4fb9-9448-9944c1c805d6','怒火攻心','怒火攻心_Big.png',1,'88分钟','马克·耐沃尔代/布莱恩·泰勒','杰森·斯坦森/艾米·斯马特/厄尔·卡罗尔',1,2006,'美国','动作 ','影片讲述了斯坦森扮演的切弗厌倦了杀手生涯，想与女友退隐江湖，开始新生活却不为人所容，他在睡梦中被注射了毒药，女友也身处陷境，为挽救女友和自己的性命，他必须拖着中毒的躯体，扫平一切障碍。 ',NULL,'线下',0,0,'怒火攻心','2015-11-26 10:58:02',1,NULL),
	(245,'cb60bbd7-e053-4fdb-8416-fe7c3836d6c0','二十','二十_Big.png',1,'115分钟','李炳宪','金宇彬/李俊昊/姜河那',1,2015,'韩国','喜剧','影片讲述三个刚满二十岁的男生面对全新的人生、爱情、友情所经历的成长故事。',NULL,'线下',0,0,'二十','2015-11-26 10:58:02',1,NULL),
	(321,'cbc079bd-a3a1-47d4-a686-2613a70a6125','冰雪奇缘生日惊喜','冰雪奇缘生日惊喜_Big.png',1,'8分钟','克里斯·巴克/珍妮弗·李','伊迪娜·门泽尔/乔纳森·格罗夫',1,2015,'美国','喜剧 ','《冰雪奇缘》将制作番外短片，短片将由电影版的两位导演继续执导，暂定名《Frozen Fever》，讲述安娜的生日到来，艾莎与克斯托夫准备为其大肆庆祝，但艾莎的冰雪能力再次惹出麻烦。雪宝、斯文这对活宝也将精彩亮相。',NULL,'线下',0,0,'冰雪奇缘生日惊喜','2015-11-26 10:58:02',1,NULL),
	(270,'cc1993ae-34d1-4fed-b6b7-070110ea483a','魔术师','魔术师_Big.png',1,'109分钟','尼尔·博格','爱德华·诺顿/杰西卡·贝尔',1,2006,'美国 ','爱情','0世纪50年代末期，曾经风靡一时的剧场风云变幻，人们迷恋电视、迷恋摇滚，对于曾经伴随他们长大的各种杂耍则不再关注。他是一个经验丰富的魔术师，舞台上得体从容，现实中却不得不为了可怜的生活费而流转于各个表演场所，上至华贵的音乐厅，下至破落偏僻的小酒馆，不变的是他对魔术的执着。在苏格兰某个乡间逗留时，魔术师结识了一个小女孩，她感叹于那些神奇的魔法，于是偷偷离开故乡，转而追随魔术师的脚步。他们辗转来至爱丁堡，生活变得愈加艰辛，而为了满足女孩对魔法的信任和对繁华世界的向往，魔术师不得不想各种办法去赚钱。',NULL,'线下',0,0,'魔术师','2015-11-26 10:58:02',1,NULL),
	(117,'cd11cb5a-3970-4079-8d7d-7f710045c298','初雪','初雪_Big.png',1,'98分钟','韩相熙','宫崎葵/李准基',1,2007,'韩国/日本','爱情','韩国的转学生民（李俊基 饰）和日本女学生（宫崎葵 饰）越过了语言和文化的障碍，在东京产生的异国恋情，美丽的风景和浪漫的青春年华交织的一段浪漫史。',NULL,'线下',0,0,'初雪','2015-11-26 10:58:02',1,NULL),
	(92,'cd3b3813-9606-4e7e-aae8-7087175c6ffb','0.5的爱情','0.5的爱情_Big.png',1,'85分钟 ','邢潇','蒲巴甲/江语晨',1,2014,'中国','爱情','当爱情面临金钱、地位的诱惑你是否还会紧守那一份最初的感动，当真爱面临世俗、自尊的挑战你是否愿意削去自己一半的棱角和爱人融成一个整体？0.5的爱情，为真情付出，为挚爱守望。',NULL,'线下',0,0,'0.5的爱情','2015-11-26 10:58:02',1,NULL),
	(96,'cd6c64f8-a462-40ef-94d8-ad5788e84b87','三日刺杀','三日刺杀_Big.png',1,'117分钟','约瑟夫·麦克金提·尼彻','凯文·科斯特纳/艾梅柏·希尔德',1,2014,'美国','犯罪','本片故事讲述凯文·科斯特纳饰演的国际特工伊桑·雷纳，多年危险暴力的职业生涯使得他与妻子（康妮·尼尔森 饰）及女儿的关系渐行渐远，为了修复家庭，他准备洗手退休。然而，神秘冷艳的美女上级（艾梅柏·希尔德 饰）交给他最后一单任务：搞定全世界最难对付的两个恐怖分子；此外还要在妻子出城期间，独自照看正处于青春叛逆期的女儿，要知道，他已经足足十年没有和女儿单独相处过了……',NULL,'线下',0,0,'三日刺杀','2015-11-26 10:58:02',1,NULL),
	(393,'cd870633-b29b-43e5-a089-84bc4c26a62c','重返20岁','重返20岁_Big.png',1,'131分钟','陈正道','杨子姗/归亚蕾',1,2015,'中国','喜剧','影片讲述了一位年过七旬的老太太（归亚蕾 饰）奇迹般地重新拥有了20岁少女（杨子姗 饰）的身体，从而引发了一系列令人啼笑皆非又感人至深的故事。',NULL,'线下',0,0,'重返20岁','2015-11-26 10:58:02',1,NULL),
	(141,'ce07883b-dbc4-4f7b-a991-4a6512b5a980','小黄人大眼萌','小黄人大眼萌_Big.png',1,'91分钟','皮埃尔·柯芬','皮埃尔·柯芬/桑德拉·布洛克',1,2015,'美国','动画','讲述了小黄人这群萌物在遇到格鲁之前的经历，揭示了小黄人的起源——最初为单细胞的黄色生物体，慢慢进化演变成为专为坏人服务的可爱仆人。',NULL,'线下',0,0,'小黄人大眼萌','2015-11-26 10:58:02',1,NULL),
	(200,'ce16a6ee-38ae-4e21-8a88-c222a7b700cd','超能查派','超能查派_Big.png',1,'120分钟','尼尔·布洛姆坎普','沙尔托·科普雷/戴夫·帕特尔',1,2015,'美国',' 动作 ','人工智能机器人查派是世界上第一个自我觉醒的机器人，故事将围绕它与人类世界的互动和自我成长而展开。',NULL,'线下',0,0,'超能查派','2015-11-26 10:58:02',1,NULL),
	(5,'ce28020e-4404-4e0f-83e3-f2c5b8ac25c0','超体','超体_Big.png',1,'89分钟','吕克·贝松','斯嘉丽·约翰逊摩根·弗里曼',1,2014,'美国','科幻','居住在台北的年轻女子露西，被迫成为“人体快递”， 胃里被黑帮植入一种新型病毒，在一次被暴打后，胃里的病毒融入血液，从而使她意外拥有了用意念便可控制周围物体的超能力，比如预见未来、用意念移动物品、消除疼痛、瞬间变身等。',NULL,'线下',0,0,'超体','2015-11-26 10:58:02',1,NULL),
	(21,'cf5241c4-61cf-4440-8535-ed40ec0eb110','四大名捕3','四大名捕3_Big.png',1,'97分钟','陈嘉上/秦小珍','邓超/刘亦菲/苏有朋/郑中基/邹兆龙/江一燕/黄秋生/柳岩/包贝尔/吴映洁',1,2014,'中国','动作','承接《四大名捕2》，无情离开后，冷血为追查捕神死因回到六扇门，“四大名捕”分崩离析，名存实亡。此时，皇宫却出大乱，不愿被困皇宫的宋徽宗执意微服出访，却遭刺杀，而后皇帝失踪。作为帝王的皇帝自认为自己是个明君，但却有点高傲自大，当自己遭遇软禁，皇位受到要挟之时，碍于内乱的逼迫不得不投身神侯府以寻求支援，围绕帝王展开的阴谋一点点浮出水面，各种力量之间的对抗也给神侯府带来了不小的麻烦。 冷血、铁手、追命联手追查，无情冷眼旁观、伺机复仇，一个潜藏已久的惊天阴谋即将彻底浮现，武功盖世的幕后黑手也行将出手，“四大名捕”将迎来生死之决、终极一战',NULL,'线下',0,0,'四大名捕3','2015-11-26 10:58:02',1,NULL),
	(354,'cf99da5e-c05b-4159-98c5-39bb6b6dfd28','鸣梁海战','鸣梁海战_Big.png',1,'126分钟','金汉珉','崔岷植/柳承龙',1,2014,'韩国','动作','《鸣梁海战》是2014年韩国史诗大片。1597年3月，以野蛮凶狠著称的日本海贼王（柳承龙饰演）所率领的海盗部队，大举侵朝。朝鲜一代名将李舜臣（崔岷植饰演）亲率仅有的12艘军舰。利用鸣梁海域的潮汐特点，抓住有利战机，击沉敌船30余艘，毙敌4000余人，重创了日本舰队，创造了世界海战史上一次以少胜多的著名战役。',NULL,'线下',0,0,'鸣梁海战','2015-11-26 10:58:02',1,NULL),
	(142,'d0253f98-cd17-44df-bce6-e8581b2cad49','巴巴杜','巴巴杜_Big.png',1,'93分钟','詹妮弗·肯特','伊斯·戴维斯/Noah Wiseman',1,2014,'澳大利亚','恐怖','艾米莉亚的丈夫于六年前不幸丧生，艾米莉亚一直无法走出阴影，即便如此她仍然要照顾叛逆的儿子塞缪尔。塞缪尔经常梦到一头怪物，他坚信这个怪物某天会出现并杀死他们两母子。某天一本叫做《巴巴杜》的故事画册莫名出现在艾米莉亚的家里，塞缪尔坚信巴巴杜就是他一直梦到的怪物。一开始并不相信的艾米莉亚也开始看到奇异的影子，她逐渐明白儿子一直以来的警告有可能是真的……',NULL,'线下',0,0,'巴巴杜','2015-11-26 10:58:02',1,NULL),
	(63,'d06c8708-c0fc-49f4-927b-dbc0a16bcc63','后备空姐','后备空姐_Big.png',1,'107分钟','管晓杰','赵奕欢/刘宇珽/文卓/秦汉擂/邹杨',1,2014,'中国','喜剧','先天条件极差的女屌丝赵小凡（赵奕欢饰）为了实现自己的空姐梦，先是挑战来自空乘世家的白富美刘筝筝（刘宇珽饰），接着又带领一票吊车尾军团对抗来自各国的美女空姐团。在这个过程中，赵小凡坚韧的毅力和不懈的精神不仅得到了旁人的肯定，还收获了真挚的友谊。但就在形势一片大好之时，赵小凡突然发现自己患有眩晕症，根本不能成为一名空姐。',NULL,'线下',0,0,'后备空姐','2015-11-26 10:58:02',1,NULL),
	(384,'d3e5a9e2-5b5e-49a4-acb1-bb202dfa1325','许三观卖血记','许三观卖血记_Big.png',1,'124分钟','李在容','河正宇/河智苑/尹恩惠/郑万植',1,2014,'韩国','剧情','许三观的故事预计从1910年讲起，出生在平壤的“许三观”靠卖血度过了朝鲜时代、日本占领时期、南北分裂等一个个人生难关，以一个小人物的命运见证朝鲜半岛历史的变迁。',NULL,'线下',0,0,'许三观卖血记','2015-11-26 10:58:02',1,NULL),
	(13,'d4c81d8a-5e13-4117-b1d7-97f62c83ffcb','X战警2014','X战警2014_Big.png',1,'130分钟','布莱恩·辛格','休·杰克曼詹姆斯·麦卡沃伊',1,2014,'美国','科幻','变种人被新型特种战斗机器人“哨兵”所猎杀，面临灭绝的危险。金刚狼必须穿越时空找到X教授和万磁王，改变历史。在过去与未来两个时空里，X战警同哨兵机器人的大决战即将展开……\n\n　　故事发生在并不遥远的未来，X战警遭遇了史上最大的生存危机，他们必须回到过去拯救自己的命运。X战警也许在我们这个时代，是有着最先进基因的生物，但在不久的未来，他们都被“特拉斯克工业”创始人玻利瓦尔·特拉斯克所制造并指挥的新型特种战斗机器人“哨兵”所猎杀，并有着被灭绝的危险。\n　　哨兵机器人可以检测出任何形式的变种类型，而他们的基因则能够让他们瞬间变换和改造自身，从而击败X战警。这使得X战警的唯一希望，便是回到过去，在特拉斯克的研究最终导致他们的灭绝之前，改变历史。\n　　利用幻影猫凯蒂的能力，金刚狼罗根穿越时空开始了这个艰辛的旅程。这一次，他必须联合年轻的变种人领袖X教授，以及他一生的对手万磁王，去找到魔形女，并阻止特拉斯克。时间已经迫在眉睫，在过去，亦在未来，X战警同哨兵机器人的大决战即将展开……',NULL,'线下',0,0,'X战警2014','2015-11-26 10:58:02',1,NULL),
	(311,'d55f83a4-3cb8-449b-b6ab-a266abd43ff7','烈日灼心','烈日灼心_Big.png',1,'139分钟',' 曹保平','邓超/段奕宏/郭涛/王珞丹',1,2015,'中国','犯罪','影片改编自女作家须一瓜的长篇小说《太阳黑子》，讲述了三个身份各异的结拜兄弟共同抚养一个孤女，看似风平浪静，实则暗流涌动，在巧合之下牵扯出一桩惊天大案。',NULL,'线下',0,0,'烈日灼心','2015-11-26 10:58:02',1,NULL),
	(102,'d75a2413-3b73-411f-aec3-18e3c23c7658','从心开始','从心开始_Big.png',1,'120分钟','麦克·宾德尔','亚当·桑德勒/唐·钱德尔',1,2007,'美国','剧情','世上最可怕的事情，不是被悲伤击垮，而是无法从悲伤中站起来……曼哈顿，多年未曾谋面的查理·法曼和艾伦·约翰逊在街角偶遇，他们在大学时不但是好友，还是“同居”的室友，毕业后，他们因过于专注自己的生活而失去了联系。',NULL,'线下',0,0,'从心开始','2015-11-26 10:58:02',1,NULL),
	(196,'d80382f4-2894-4095-9424-7f3acb2d963c','赎罪','赎罪_Big.png',1,'123分钟','乔·怀特','凯拉·奈特莉/詹姆斯·麦卡沃伊',1,2007,'美国','剧情','《赎罪》改编自得过普立策文学奖的小说，以1930年为背景，描述名叫Briony的女子跨时空追寻她的姐姐及其男友罗比涉及的一件犯罪案。',NULL,'线下',0,0,'赎罪','2015-11-26 10:58:02',1,NULL),
	(131,'daa6d52a-d03e-45a7-b8a9-73992ff2fd86','坚不可摧','坚不可摧_Big.png',1,'\n137分钟','安吉丽娜·朱莉','杰克·奥康奈尔/石原贵雅',1,2014,'美国','传记','故事主人公Zamperini是美国加州意大利移民的第一代后裔。从小他就精力旺盛，加入学校田径队让他远离了街头的打打杀杀，体育天赋让他破了一些纪录，但更惊人的是，他入选了美国奥林匹克代表团，去参加了1936年在纳粹德国举办的柏林奥运会，并受到了第三帝国元首希特勒的接见并与之握手——尽管他的五千米成绩仅为第八。',NULL,'线下',0,0,'坚不可摧','2015-11-26 10:58:02',1,NULL),
	(138,'db17d286-8aa1-4c4e-9ef8-01775bf3584b','家有仙妻','家有仙妻_Big.png',1,'101分钟','诺拉·艾芙隆','妮可·基德曼/威尔·法瑞尔',1,2005,'美国','爱情','住在加州圣费尔南多谷的伊莎贝尔（妮可·基德曼）是个天真善良的女巫，她对自己的人生规划既不是成为一个哈利·波特那样的巫界明星，也不是冲锋陷阵、当个拯救全人类的女英雄，她只想过上正常人的普通生活。',NULL,'线下',0,0,'家有仙妻','2015-11-26 10:58:02',1,NULL),
	(112,'dbba1d33-0ee2-4ec9-8d9c-a0c3c608005b','冒顿','冒顿_Big.png',1,'94分钟','郭郅','戴路/王刚/赵小锐/赵汝彬',1,2012,'中国','传记','公元前220年前后，中国北方草原自西而东分别居住着月氏、匈奴、东胡等部族。匈奴大单于为了废长立幼，举兵攻打月氏，欲借月氏之手杀掉在月氏当人质的冒顿',NULL,'线下',0,0,'冒顿','2015-11-26 10:58:02',1,NULL),
	(18,'dc3eed18-e2d8-4ebb-b71b-09f50a4fddad','蝙蝠侠：前传','',1,'140分钟','克里斯托弗 诺兰','克里斯蒂安·贝尔/迈克尔·凯恩/连姆·尼森/凯蒂·霍尔姆斯/威廉·菲德内尔',1,2000,'美国','动作','布鲁斯 韦恩（克里斯汀-贝尔 Christian Bale 饰）童年时亲眼目睹了父母在高谭市街头被歹徒枪杀，韦恩充满怒火。在继承了父亲亿万家产后，韦恩开始环游世界，希望凭自己的力量复仇和打击犯罪！\n韦恩为了了解罪犯的心理，在亚洲他亲自体现了犯罪的感觉，最后被捕入狱。他在狱中遇到了武艺高强的杜卡，杜卡传授了韦恩高强的武艺和坚韧的意志力。韦恩很快被神秘的影忍者盟看上，忍者大师一直想邀他加入。\n韦恩不久发现影忍者盟对自己的家乡高谭市另有企图，他毅然回到了故乡。韦恩在自己的庄园发现了一个地下室，从此他多了一个身份—蝙蝠侠。蝙蝠侠开始了对抗笼罩在高谭市的黑暗。',NULL,'线下',0,0,'蝙蝠侠：前传','2015-11-26 10:58:02',1,NULL),
	(317,'dc554682-c517-45ba-a8e5-4fae1293dbba','肮脏的周末','肮脏的周末_Big.png',1,'93分钟','尼尔·拉布特','马修·布罗德里克/爱丽丝·伊芙',1,2015,'美国','喜剧','一同出差的莱斯和奈特莉因故滞留在阿尔伯克基机场。莱斯决定进城转转，奈特莉发现他不只转转那么简单。两人都有自己的小秘密，在这个最不可能的地方，他们都找到了生命中的火花。',NULL,'线下',0,0,'肮脏的周末','2015-11-26 10:58:02',1,NULL),
	(202,'dce53a57-d4fa-4e51-b31b-18e2cba8aa1e','追凶（2005）','追凶（2005）_Big.png',1,'110分钟','莱恩·约翰逊','约瑟夫·高登-莱维特/诺拉·泽荷特勒',1,2005,'美国','悬疑','布伦丹·弗莱是一位特立独行的中学生，心机过人的他一直隔绝于各种错综复杂的是非之外，直到某天突然接到前女友艾米丽的求救电话，随即又杳无音讯，布伦丹才真正陷入了不解的谜团。',NULL,'线下',0,0,'追凶（2005）','2015-11-26 10:58:02',1,NULL),
	(158,'dd56ed12-a16e-4f3d-b139-4079e49878e1','最后的骑士','最后的骑士_Big.png',1,'115分钟','纪里谷和明','克里夫·欧文/摩根·弗里曼',1,2015,'美国','动作 / 冒险','影片以虚拟的未知时代为背景，讲述了勇猛忠诚的将军雷顿（克里夫·欧文 饰）和其拥戴的强悍君主巴托（摩根·弗里曼 饰）二人为挑战腐败不堪的绝对权威，不惜让自身卷入生死攸关的事件，从而引发了一连串惊心动魄的故事。',NULL,'线下',0,0,'最后的骑士','2015-11-26 10:58:02',1,NULL),
	(151,'de05f0a9-bb6a-492d-aac2-fdf0cc3813a7','无人区','无人区_Big.png',1,'117分钟','宁浩','徐峥/余男',1,2013,'中国',' 犯罪','徐峥饰演的律师赴新疆一座边远城市为一名盗猎者辩护，结果在回来的路上反被追杀。途中还遭遇了舞女、走私贩、盗贼、警察各色人等，上演了一出惊心动魄的逃亡之旅。',NULL,'线下',0,0,'无人区','2015-11-26 10:58:02',1,NULL),
	(399,'dec6b038-ff3a-406f-a113-6a1e2571d570','剪刀手爱德华','剪刀手爱德华  _Big.png',1,'105分钟','蒂姆·波顿','约翰尼·德普/薇诺娜·瑞德',1,1990,'美国','剧情 ','爱德华（德普 饰）拥有一双异于常人的剪刀手，只能隐居古堡，直到佩格（黛安娜?维斯特 饰）出现。跟随佩格融入人类社会的爱德华用剪刀手赢得人们喜爱，并俘获了佩格女儿金（薇诺娜 饰）的芳心，但无法拥抱令他异常痛苦。',NULL,'线下',0,0,'剪刀手爱德华  ','2015-11-26 10:58:02',1,NULL),
	(43,'df942346-ce0b-4d3a-a7bf-2b1f900961c9','不再说分手','',1,'105分钟','郑丹瑞 ','郑伊健/周秀娜/王菀之/何浩鹏',1,2014,'中国','爱情','阿森和小岚是一对相恋八年的情侣，而他们用以维持感情的方法只有两个字——分手。\n 因为小岚知道只要她提出分手，阿森就会百依百顺的哄她开心，所以小岚也就有了继续得寸进尺的理由。在第99次分手之后，两人终于认定彼此，许下不再轻易分手的承诺，更决心要为未来共同打拼，合理经营一家属于自己的咖啡店。再加上一群好朋友的加入，原本平淡无奇的咖啡店变得热闹了起来。只不过，咖啡店的成功让阿森和小岚之间的距离越来越远，周围的一切仿佛都在引爆他们的第100次分手。',NULL,'线下',0,0,'不再说分手','2015-11-26 10:58:02',1,NULL),
	(103,'e00fc0fc-29bc-47ef-8745-1b3ce051e437','伸冤人','伸冤人_Big.png',1,'128分钟','安东尼·福奎阿','丹泽尔·华盛顿/科洛·莫瑞兹',1,2014,'美国','犯罪','伸冤人》原是一档于1985—1989年期间在美国CBS电视台播出的犯罪系列剧集。男主角是一名私家侦探，他是一位老练的前政府特工，为了弥补过去所犯下的过错，而与法律系统的漏洞过失进行斗争。',NULL,'线下',0,0,'伸冤人','2015-11-26 10:58:02',1,NULL),
	(305,'e02d116b-f9c9-47c9-b625-9ce4dcec966a','美国狙击手','美国狙击手_Big.png',1,'132分钟','克林特·伊斯特伍德','布莱德利·库珀/西耶娜·米勒',1,2015,'美国','剧情','影片是根据美国著名阻击手克里斯·凯尔自传《美国狙击手》改编，讲述这位海豹突击队神枪手的传奇故事。',NULL,'线下',0,0,'美国狙击手','2015-11-26 10:58:02',1,NULL),
	(259,'e04fd9fc-278f-43f0-94d3-f06a0c6d6ecf','大闹天宫','大闹天宫_Big.png',1,'88分钟','速达/陈志宏','李扬/陈道明',1,2012,'中国','奇幻','片以神话形式，通过孙悟空闹龙宫、反天庭的故事，突出表现了主角孙悟空的传奇经历。',NULL,'线下',0,0,'大闹天宫','2015-11-26 10:58:02',1,NULL),
	(170,'e05b70c6-28d2-4589-902e-a13b1b30e0f1','猩球崛起：黎明之战','猩球崛起：黎明之战_Big.png',1,'130分钟','马特·里夫斯','安迪·瑟金斯/杰森·克拉克',1,2014,'美国','动作 ','遭此横祸的人类只有一小部分幸存下来，而他们正威胁着凯撒统领的高度进化猿族大军，虽然双方一度达成了短暂却脆弱的和解，但为了争夺地球的绝对领导权，一场激烈的人猿大战一触即发。',NULL,'线下',0,0,'猩球崛起：黎明之战','2015-11-26 10:58:02',1,NULL),
	(173,'e0dec640-a96a-45c4-adce-bf0096562017','真实的谎言','真实的谎言_Big.png',1,'141分钟','詹姆斯·卡梅隆','阿诺·施瓦辛格/杰米·李·柯蒂斯',1,1994,'美国',' 动作','影片讲述了一个隐姓埋名的特工Harry怀疑他老婆有外遇，便在暗地里进行调查，无意中发现了一群恐怖分子的大阴谋，他们试图用核弹来威胁政府；又逢爱女被绑架，于是Harry飞身夺救。',NULL,'线下',0,0,'真实的谎言','2015-11-26 10:58:02',1,NULL),
	(398,'e259c6c7-a590-4d96-a154-f2a163fb1e9f','云之彼端约定的地方','云之彼端约定的地方_Big.png',1,'91分钟','新海诚','吉冈秀隆/荻原圣人',1,2004,'日本','动画','在日本战后被分割统治的另一个世界里，1996年夏，位于联合国统治下的北海道的神秘巨塔工程悄然开始了。而在美国占领的本州，这个塔真正建设目的却无人知晓。',NULL,'线下',0,0,'云之彼端约定的地方','2015-11-26 10:58:02',1,NULL),
	(368,'e2f38136-4096-46cd-b41e-121b2868de32','深夜姐妹会','深夜姐妹会_Big.png',1,'104分钟','Caryn Waechter','乔基·亨莉/卡拉·海沃德',1,2014,'美国','剧情','埃米莉·帕里斯（卡拉·海沃德 饰）曝光了一个秘密少女社团，她们选择离开了社交网络从而进入了另外一个深夜姐妹会，她们所发现的林中世界。埃米莉则诬陷这群女孩儿在树林里的不雅行为。使得这个小镇成为了美国媒体的焦点。然而，女孩儿们坚持了不能说出去的誓约，这个谜团将如何解开呢？',NULL,'线下',0,0,'深夜姐妹会','2015-11-26 10:58:02',1,NULL),
	(42,'e3180f6f-d876-4fb1-9e57-8d66e650cbbd','百濑朝向这边','',1,'108分钟','耶云哉治','早见明里/向井理/竹内太郎/石桥杏奈',1,2014,'日本','爱情','影片讲述了新近获得新人奖的青年作家相原升(向井理饰)接到故乡母校高中的邀请，勉为其难要回校做汇报演讲。下火车没多久，他重逢当年被视为女神一般存在的神林学姐，咖啡馆内的交流，让阿升回想起学生时代的一段难忘故事。\n15年前的阿升(竹内太郎 饰)丝毫没有任何存在感，而学姐神林彻子(石桥杏奈 饰)则备受关注，她的身边则同样是校园里的风云人物宫崎瞬(工藤阿须加饰)。谁也想不到，宫崎和阿升还是青梅竹马的玩伴。瞬哥背着彻子和名叫百濑阳(早见明里 饰)的女孩偷偷交往，为了瞒过女友他拜托阿升与百濑在校园里假扮男女朋友。为了报答瞬哥，阿升勉为其难答应下来，只是未曾想到这个青春的谎言竟让他久久无法忘怀……',NULL,'线下',0,0,'百濑朝向这边','2015-11-26 10:58:02',1,NULL),
	(337,'e496654b-4f4b-4dbe-80ef-2367f1e9bf49','坏姐姐之拆婚联盟','坏姐姐之拆婚联盟_Big.png',1,'108分钟 ','金泰均','陈意涵/池珍熙',1,2014,'中国','喜剧','职业占星师黄二珊（陈意涵饰），几乎将星座奉为生活准则。当她得知身在韩国的弟弟（陈学冬饰）即将举行婚礼，且新娘是星盘上认定的最不合适人选，黄二珊几近崩溃，直奔釜山，势必要搞垮这场婚礼。在飞机上，喝醉的黄二珊将心事和计划都告诉了隔壁乘客——韩国大叔（池珍熙饰）。落地后，她赫然发现大叔就是弟弟未婚妻的父亲。 这样“不靠谱”的拆婚联盟是否能顺利完成这场拆婚行动？二珊和大叔两颗不安分的心是否又会擦出些许火花？',NULL,'线下',0,0,'坏姐姐之拆婚联盟','2015-11-26 10:58:02',1,NULL),
	(397,'e683e351-2232-4f40-8b4c-5edf8bf99fa8','诺亚方舟创世之旅','诺亚方舟创世之旅_Big.png',1,'138分钟 ','达伦·阿罗诺夫斯基','罗素·克劳/詹妮弗·康纳利',1,2014,'美国','动作','在《圣经》中，上帝要用洪水毁灭地上的人类，他选中了诺亚一家作为新人类的种子。诺亚一边赶造方舟，一边劝告世人悔改其行为。诺亚花了整整120年时间终于造成了一只庞大的方舟，并听从上帝的话，把全家八口搬了进去，各种飞禽走兽也一对对赶来，有条不紊地进入方舟。7天后，洪水自天而降，一连下了40个昼夜，人群和动植物全部陷入没顶之灾。几十天后，鸽子衔来了橄榄枝，表示大水已经消退，方舟上的人类和万物重新开始在地上繁衍。',NULL,'线下',0,0,'诺亚方舟创世之旅','2015-11-26 10:58:02',1,NULL),
	(296,'e7a8b66d-37bd-4219-a60a-203018fa5e06','巴黎假期','巴黎假期_Big.png',1,'112分钟','阮世生','古天乐/郭采洁/徐正曦/刘梓妍/方中信',1,2015,'中国','爱情','在巴黎，女画家丁晓敏（郭采洁 饰）为帮男友徐晖（徐正曦 饰）实现艺术梦想甘愿停学打工牺牲自己，然而却惨遭抛弃，自此变得癫癫丧丧、自暴自弃。正巧，居家好男人林俊杰（古天乐 饰）受邀来到巴黎打理酒庄，阴差阳错下假扮成gay和丁晓敏同居一屋。为了帮助丁晓敏走出感情创伤，林俊杰体贴地照顾起她的生活。',NULL,'线下',0,0,'巴黎假期','2015-11-26 10:58:02',1,NULL),
	(99,'e83386e2-0535-4cfa-9c5d-e82980f7790d','临终囧事','临终囧事_Big.png',1,'94分钟','钱江汉','包贝尔/詹瑞文',1,2013,'中国','惊悚','牛小波出生在一个棺材世家，小时候一场荒诞的事故，他永远失去“笑容”，幸好一直生活在农村，简单的环境没让他觉得不会“笑”是一件多么严重的事情，长大后努力走出大山，离开养大他的棺材铺，到外面的世界去闯荡，却还是不得不进了殡仪馆工作，在殡仪馆中小波见证了人生百态。在“人生最后一站”的平台上，让小波慢慢成长，最终牛小波学会了“笑”…',NULL,'线下',0,0,'临终囧事','2015-11-26 10:58:02',1,NULL),
	(293,'e837a5f6-928a-4a68-9a0c-63bb9f4c180e','真爱无价','真爱无价_Big.png',1,'105分钟','皮埃尔·沙而瓦多利','奥黛丽·塔图/加德·艾尔马莱/玛丽·克里斯汀·亚当/弗农·多',1,2006,'法国','爱情','艾琳（奥黛丽·塔图 饰）的梦想是结交很多的富家子弟，让他们成为裙下之臣。五星级酒店就是她的活动场所。这天她来到高级饭店，投入有钱佬雅克的怀抱，却误打误撞认识了酒店服务生让（加德·艾尔马莱 饰）。艾琳以为让是一个富家子弟，纵情诱惑，二人一夜浪漫后，艾琳才发现让根本不是有钱人，于是愤然离去。',NULL,'线下',0,0,'真爱无价','2015-11-26 10:58:02',1,NULL),
	(50,'e8954475-22c0-4059-9621-4e400cafb6e1','匆匆那年','',1,'120分钟','张一白','彭于晏/倪妮/郑恺/魏晨/陈赫/张子萱',1,2014,'中国','剧情','年近三十的陈寻在90后女孩七七追问下，回忆起了自己与方茴的同居时光。 当年近而立的陈寻再次回忆这段纯真感情时加入了思考和反省。这既是陈寻的青春记忆，也是属于80后整整一代人的匆匆那年。',NULL,'线下',0,0,'匆匆那年','2015-11-26 10:58:02',1,NULL),
	(27,'e89c5d70-3c17-4d08-8675-8e760b45d4ab','父辈的旗帜','父辈的旗帜_Big.png',1,'135分钟','克林特·伊斯特伍德','莱恩·菲利普/亚当·比奇/杰西·布拉德福德',1,2006,'美国','战争','1945年2月，硫磺岛战役，美国海军第五师开始试图占领高地，胶着到第五天，美军严重死伤，而日方也被迫撤退到岛屿的岩洞中。为了带给士兵们希望，一天清晨，第五师收到了插旗指令。海军士兵约翰·布拉德利（莱恩·菲利普饰）与战友艾拉·海耶斯（亚当·比奇饰）、雷内·加侬（杰西·布拉德福德饰）以及另三位战友共同冲上硫磺岛的制高点苏利班奇峰，并且六人合力将一面美国国旗插了上去。那一刻，美联社战地记者乔·罗森塔尔将六名士兵奋勇举旗的场景拍摄下来，并将照片发回国内，18个小时后照片传到纽约，大大鼓舞了美国士兵的士气，最终为取得整个战争的胜利起到了关键性的作用。从此，这六名士兵成为了举国英雄。\n但其中三位很快便倒在了这块被战火烧得炙热的黑土地上，永远不会知道他们将因此而不朽，而幸存的三位插旗英雄，因为照片的轰动影响，被调回了美国。对于急切需要财政支援的政府而言，他们更该做的不是在战争中出生入死，而是顶着“英雄”头衔来往巡回于全国，推销战争债券以筹集款项。扮演着“完美的英雄”，发表着感人至深的演讲，这群并无意成为英雄且永远也无法摆脱死难战友阴影的十八九岁的孩子们，人生彻底改变。但他们对自己被当成民族英雄般的偶像却毫无兴趣，也从不认为自己是英雄，他们只希望能够跟那些没有享受到丝毫荣耀、在战火中壮烈牺牲的兄弟们呆在一起，希望可怕的战争永远不要再有。',NULL,'线下',0,0,'父辈的旗帜','2015-11-26 10:58:02',1,NULL),
	(229,'e98417cd-6f26-4280-bab1-511e548c8035','侏罗纪世界','侏罗纪世界_Big.png',1,'124分钟','科林·特雷沃罗','克里斯·普拉特/布莱丝·达拉斯·霍/文森特·多诺费奥',1,2015,'美国','动作','侏罗纪世界》讲述科学家欧文在纳布拉尔岛上的恐龙主题公园中与迅猛龙们打成一片，并意外发生了一些事故和故事。',NULL,'线下',0,0,'侏罗纪世界','2015-11-26 10:58:02',1,NULL),
	(16,'e9e2713f-fdfd-4f1a-8e3a-6f9f771ad31d','300勇士：帝国崛起','',1,'102分钟','诺姆·穆罗','苏利文·斯坦普莱顿/罗德里格·桑托罗/爱娃·格林',1,2014,'美国','动作','在著 名的马拉松战役中，希腊英雄特米斯托克列斯（苏利文·斯坦普莱顿饰）射杀波斯国王大流士王，从此埋下薛西斯一世（罗德里格·桑托罗饰）卷土重来的祸根。在波斯王国海军统帅阿特米西亚（伊娃·格林饰）的煽动下，薛西斯率领大军与斯巴达的领袖列奥尼达（杰拉德·巴特勒饰）及其三百勇士在温泉关爆发流传千古的血战。\n另一边，阿特米西亚统帅的强大海上部队逼近爱琴海另一边的雅典。危险关头，特米斯托克列斯再度站出来，和希腊的勇士们为了捍卫自由迎战这个体内流淌着复仇之血的黑色女神。翻云吐雾，恶浪滔天，最残酷的杀戮在遥远的时代进行。',NULL,'线下',0,0,'300勇士：帝国崛起','2015-11-26 10:58:02',1,NULL),
	(340,'e9e9fc47-2395-4ef9-87fc-aa867dd39b60','霍比特人2史矛革之战','霍比特人2史矛革之战_Big.png',1,'161分钟','彼得·杰克逊','马丁·弗瑞曼/伊恩·麦克莱恩',1,2013,'美国','冒险','成功到达雾山后，甘道夫与矮人远征队分道扬镳，索林一行人必须独自面对幽林带来的危险，在这里他们将碰到精灵一族。当他们顺利穿越幽林来到孤山脚下的长湖镇，他们必须躲过恶龙史矛革的监视，找到进入孤山的秘密之门……',NULL,'线下',0,0,'霍比特人2史矛革之战','2015-11-26 10:58:02',1,NULL),
	(221,'eba2e2ba-1c37-4e16-8703-ae522dd9b677','欲罪','欲罪3_Big.png',1,'77分钟','刘继源','刘小乔/康瑞林/孔详伟/娟子/吴金标',1,2015,'中国','爱情','雪儿虽是个年轻貌美的有夫之妇，可丈夫整天忙于工作对她不管不问。一次偶然的晨练认识了一位优秀的摄影师，这个摄影师对她确实体贴尤嘉，而且共同的爱好使得两人很快碰出爱的火花。经历了几次冰与火的交融后雪儿才发现摄影师是个彻头彻尾的情感骗子。但此时丈夫已经发现他们的暧昧关系，一次口角中将摄影师置于死地，夫妻惶惶不可终日',NULL,'线下',0,0,'欲罪','2015-11-26 10:58:02',1,NULL),
	(278,'ec88fc95-44b1-4a28-a981-9331d3328f38','苔藓','苔藓_Big.png',1,'155分钟','康佑硕','郑在泳/朴海日',1,2010,'韩国','悬疑','已经厌倦都市生活的青年刘海国突然收到已经断绝关系二十年的父亲的死亡讣告，匆匆赶到父亲寄居的村镇。然而，从刘海国踏进这个陌生小镇的一刻起，便感到身边都是诡异的眼光。父亲的葬礼结束后，村民们为“欢送”刘海国举办了聚会，而当刘海国宣布要继续留在该地时，一种神秘的氛围笼罩在了周围。村子的权力核心--70多岁的里长最终同意了刘海国的决定。留下来的刘海国渐渐发现，里长非等闲之辈，尽管年纪很大，但明显是全村人的精神领袖。刘海国开始感到这里实际上隐藏着不为人知的秘密。',NULL,'线下',0,0,'苔藓','2015-11-26 10:58:02',1,NULL),
	(238,'ed14a403-0842-4669-8d56-50f2d7ee1356','破风','破风_Big.png',1,'125分钟','林超贤','彭于晏/窦骁/崔始源/王珞丹',1,2015,'中国','运动','该片讲述了四个年轻人加入单车队顶级赛事，在残酷激烈的竞争中，每个人都需要面对来自友情与爱情、名利与牺牲、个人与团队等方面的抉择与考验的故事。',NULL,'线下',0,0,'破风','2015-11-26 10:58:02',1,NULL),
	(150,'edf9008e-9bcc-4ff4-863a-dbb711cde154','新大头儿子和小头爸爸之秘密计划','新大头儿子和小头爸爸之秘密计划_Big.png',1,'\n87分钟','何澄','刘纯燕/董浩',1,2014,'中国','动画','大头儿子、小头爸爸和围裙妈妈一家人，各自有着自己的梦想，他们把这些梦想称为自己的“秘密计划”。爸爸妈妈并不真正理解大头儿子的梦想，认为大头儿子在胡闹。爸爸妈妈也有着自己的梦想，但爸爸妈妈的梦想都与大头儿子梦想的实现产生了一次又一次的冲突，他们是否还能重拾往日的欢乐……',NULL,'线下',0,0,'新大头儿子和小头爸爸之秘密计划','2015-11-26 10:58:02',1,NULL),
	(320,'ef23279e-5305-4261-b62b-359304c1fc98','冰封之地','冰封之地_Big.png',1,'105分钟',' 斯科特·沃克','尼古拉斯·凯奇/瓦妮莎·哈金斯',1,2013,'美国','犯罪','《冻结之地》又名《冰封之地》，是斯科特·沃克自编自导的导演处女作，根据上世纪80年代阿拉斯加的妓女猎杀案改编而成，由尼古拉斯·凯奇主演。影片讲述的是一个警探、一个妓女联起手来追捕一名变态杀人狂的故事。',NULL,'线下',0,0,'冰封之地','2015-11-26 10:58:02',1,NULL),
	(205,'f0bbf3e6-ca6f-41a4-9932-eaf73fd6a223','金刚','金刚_Big.png',1,'200分钟','彼得·杰克逊','娜奥米·沃茨/杰克·布莱克',1,2005,'新西兰','冒险','一位过度热心的电影导演，带领着他的女主角以及作家，加入了一个远征探险队，他们要寻找金刚世界上最大的大猩猩，但是他们全部低估了金刚这一神话般产物的力量……',NULL,'线下',0,0,'金刚','2015-11-26 10:58:02',1,NULL),
	(303,'f1f7c3b4-3de0-4204-be8f-75660f4a7d56','超验骇客','超验骇客_Big.png',1,'113分钟',' 瓦利·菲斯特','约翰尼·德普/凯特·玛拉',1,2014,'美国','动作','影片讲述科学家威尔遭到一群反科学恐怖分子暗杀，妻子艾芙林将他的精神转入超级电脑的原型机，不久威尔以计算机形态回应了她...反科学恐怖组织发现这一切，他们试图偷走这台超级电脑并摧毁他。',NULL,'线下',0,0,'超验骇客','2015-11-26 10:58:02',1,NULL),
	(344,'f203f585-2bb9-418e-a113-2e1a51f08303','掘火者','掘火者_Big.png',1,'85 分钟','乔·斯万博格','安娜·肯德里克/梅兰妮·林斯基',1,2015,'美国','剧情 ','这是由杰克·约翰逊与罗丝玛丽·德薇特出演的夫妻之间的爱情故事 , 讲述成立一个家庭需要面对的种种压力和痛苦 , 以及怎样在长期关系中保持新鲜刺激感 .',NULL,'线下',0,0,'掘火者','2015-11-26 10:58:02',1,NULL),
	(174,'f2703640-d657-455c-bf22-4901bf39ebdb','硬汉2：奉陪到底','硬汉2：奉陪到底_Big.png',1,'86分钟','丁晟','刘烨/张梓琳',1,2011,'中国','动作','故事发生在美丽的海滨城市，主人公老三是一名退伍海军，在工作中始终保持着军人的作风，对不良现象挺身而出。在不经意中碰到了以黑勇为首的抢劫团伙，正当该团伙实施犯罪时，老三挺身而出，维护正义。最终在公安人员的打击下，犯罪分子被绳之以法，同时老三也收获了爱情。',NULL,'线下',0,0,'硬汉2：奉陪到底','2015-11-26 10:58:02',1,NULL),
	(161,'f3001086-5654-4dd1-b17a-bb2255f7edc5','木星上行','木星上行_Big.png',1,'127分钟','安迪·沃卓斯基','查宁·塔图姆/米拉·库妮丝',1,2015,'美国','冒险','故事设定在遥远的未来，那时盛行各种基因改造，人类可以将动物基因与人类基因相结合而获得更强大的力量，而纯粹的人类反而变成社会底层。',NULL,'线下',0,0,'木星上行','2015-11-26 10:58:02',1,NULL),
	(382,'f35e9ca9-4f00-4202-a034-947ce16c9851','小乌龟是如何长大的','小乌龟是如何长大的_Big.png',1,'88分钟','Dearbhla Walsh','詹姆斯·柯登/达斯汀·霍夫曼',1,2014,'英国','喜剧','Hoppy先生（Dustin Hoffman饰）的退休生活表面上挺平淡的，就是照料照料阳台上的花园，从家里闲逛到商店再逛回家。不过这些平静的表面下，他激情似火而又无可救药地暗恋上了楼下邻居Silver太太（Judi Dench饰）。退休的单身汉Hoppy先生对他的邻居Silver太太有好感，而Silver太太只对她的宠物乌龟有感情。他们的初见是在拥挤的电梯里。那时，他就完全被她的开朗和热情迷住了，不过这一点他总是忘记告诉她，尽管他们经常站在各自的阳台上作为邻居互相聊天。Hoppy先生发现Silver太太因为宠爱的宠物乌龟长不大而烦恼，他希望能借此机会让她高兴，两人间的关系会因此变得更亲密也说不定哦。',NULL,'线下',0,0,'小乌龟是如何长大的','2015-11-26 10:58:02',1,NULL),
	(19,'f4c0a763-4b97-4584-847e-b94cd81d28d5','不二神探','',1,'98分钟','王子鸣','文章/李连杰/刘诗诗/谢天华 /柳岩/林峰/梁小龙/郑嘉颖/黄晓明/吴京/韩子轩（客串）/陈妍希',1,2013,'中国','动作','数日内，三起“微笑杀人案”震动全城。在调查过程中，青年警探、警局“活宝”王不二语出惊人：这是一起连环谋杀案！遂与搭档黄非红开始了一段惊悚刺激，又状况不断的“缉凶”之旅。黄非红在旁边看似总是乌龙，但其实是真正的功夫高手，每到关键时刻，他总能帮助王不二化险为夷。案件侦办过程中，王不二先是将怀疑对像锁定为女明星刘金水，随着案情的深入，刘金水的嫌疑被逐渐撇清，她的姐姐戴依依等人成了王不二的怀疑对象。最后，王不二决定假扮刘金水的男友来引诱凶手现身。与此同时，危险也慢慢向王不二靠近，真相即将大白于天下，王不二与凶手的终极对决，也就此展开。',NULL,'线下',0,0,'不二神探','2015-11-26 10:58:02',1,NULL),
	(204,'f5048637-6edc-4597-b9d6-635a987e6c52','速度与激情6','速度与激情6_Big.png',1,'130分钟','林诣彬','范·迪塞尔/保罗·沃克',1,2013,'美国','动作','剧情讲述了多米尼克在率领伙伴大干一票收获1亿美金之后过得逍遥快活，但他们因犯罪纪录而无法回到自己的国家。此时霍布斯正在缉拿一个在12个国家流窜作案的雇佣兵犯罪集团，他招募多米尼克团伙与雇佣兵集团在伦敦上演飙车决战，而他想无论两方胜负如何其罪行都将被一笔勾销的故事。',NULL,'线下',0,0,'速度与激情6','2015-11-26 10:58:02',1,NULL),
	(347,'f509529e-6181-4f46-8c9a-abe1f8c24d41','邻居大战','邻居大战_Big.png',1,'96分钟','尼古拉斯·斯托勒','塞斯·罗根/萝丝·拜恩',1,2014,'美国','喜剧','影片描述一对拥有新生女儿的年轻夫妻与隔壁新搬来的大学兄弟会一群年轻学生之间的激烈大战。',NULL,'线下',0,0,'邻居大战','2015-11-26 10:58:02',1,NULL),
	(119,'f5338f76-b4bc-49b7-971e-d332cdc38fac','功夫侠','功夫侠_Big.png',1,'87分钟','宁瀛','陈虎/蒋梦婕',1,2013,'中国','动作','《功夫侠》讲述陈虎扮演的会功夫的普通青年人解救被绑票的外国儿童人质的故事。',NULL,'线下',0,0,'功夫侠','2015-11-26 10:58:02',1,NULL),
	(376,'f56e8f2c-4a5f-4fce-bfcd-0d49d3a263a9','头脑特工队','头脑特工队_Big.png',1,'94分钟','彼特·道格特','艾米·波勒/比尔·哈德尔',1,2015,'美国','冒险','影片讲述了小女孩莱利因为爸爸的工作变动而搬到旧金山，她的生活被这五种情绪所掌控，尽展脑内情绪的缤纷世界。',NULL,'线下',0,0,'头脑特工队','2015-11-26 10:58:02',1,NULL),
	(279,'f58bd6d0-fd2e-4ea2-a71c-231191a65ae9','逃出生天','逃出生天_Big.png',1,'90分钟','彭发/彭顺','刘青云/古天乐/李心洁',1,2013,'中国','冒险','阿强三年前和大哥大军（刘青云 饰）产生矛盾离开消防队，如今正值阿强（古天乐 饰）自己的公司举行庆功会，却不料突遭火灾。现任消防队大队长大军接到报警前来营救，与弟弟火场重逢，时隔多年兄弟俩合理对被困群众展开救援。',NULL,'线下',0,0,'逃出生天','2015-11-26 10:58:02',1,NULL),
	(274,'f5b1db06-250a-4987-be82-5c39ead06df1','求爱操作团','求爱操作团_Big.png',1,'62分钟','吕磊','罗翔/朱佳希/庞勇/邓林林',1,2015,'中国','爱情','龄成功白领林墨（罗翔饰），在一次无意的酒后事故中被一陌生女孩楚荆所救，林墨一见倾心，怎奈数次求爱被拒。心急之下求助“求爱操作团”。操作团为他制定了一系列求爱计划，并一步步拉近了他和楚荆的距离。正当计划顺风顺水之时，林墨发现好像这几个人对自己背景非常了解，而且楚荆也好像在哪里见过，原来他才是这次“ 求爱操作团”的攻破对象?',NULL,'线下',0,0,'求爱操作团','2015-11-26 10:58:02',1,NULL),
	(336,'f62d13b5-c549-4bbc-b718-01ed9e32e663','盒子怪','盒子怪_Big.png',1,'\n97分钟','格拉汉姆·阿纳贝尔','艾萨克·赫普斯戴德-怀特/艾丽·范宁',1,2014,'美国','冒险','　故事讲述了一个小镇中的盒怪们“胡作非为”，他们不但偷孩子还会偷粮食偷乳酪，是所有镇民的眼中钉。但实情是，这群怪物一直在抚养一个名为Eggs的孤儿，他们组成的“摩登家庭”在下水道的世界里生活得很幸福。但小镇居民一心想要除掉盒怪，长大的Eggs只能冒险来到地面之上拯救亲人，也要改变镇民们的顽固思想。',NULL,'线下',0,0,'盒子怪','2015-11-26 10:58:02',1,NULL),
	(100,'f637d139-062c-4b13-9c47-f0b116dd956a','云水谣','云水谣_Big.png',1,'112分钟','尹力','陈坤/李冰冰',1,2006,'中国','爱情','年轻俊朗的青年陈秋水因做家庭教师而来到王家，并与王家千金王碧云一见钟情，两人很快坠入爱河并私订终身。但适逢台湾局势动荡，作为热血青年的陈秋水为躲避迫害从台湾辗转来到大陆，自此两个相爱的恋人被无情的现实分隔两岸，唯有坚守着“等待彼此”的誓言相互思念对方。',NULL,'线下',0,0,'云水谣','2015-11-26 10:58:02',1,NULL),
	(28,'f64d8dc3-9a6b-47e8-bb3a-efab4b292ad3','卢旺达饭店','',1,'121分钟','特瑞·乔治','唐·钱德尔/苏菲·奥康尼多/杰昆·菲尼克斯/尼克·诺尔特',1,2004,'英国','战争','1962年，卢旺达宣布独立后，胡图族与图西族两部族之间矛盾重重，多次发生冲突，战事持续不断。\n1994年4月6日，一架载着卢旺达胡图族总统朱韦纳尔·哈比亚利马纳和布隆迪总统西普里安·恩塔里亚米拉的座机在卢旺达首都基加利上空被火箭击落，两国元首同时罹难。1994年4月7日，空难在卢旺达国内引发了胡图族与图西族两族的互相猜疑，从而爆发了一场规模空前的武装冲突和种族大屠杀，令世界震惊的人间惨剧拉开了帷幕。被胡图族种族主义者控制的广播电台也为大屠杀的行为煽风助阵，他们叫嚣着“让一切的郁积都爆发出来吧。在这样一个时刻，鲜血将滚滚而出”，失控的人群在媒体的号召下四处搜寻和杀死图西族人，空气中弥漫着血腥的味道。\n当一个国家陷入了疯狂，世界也闭上了双眼时，有一个名叫保罗·卢斯赛伯吉纳（唐·钱德尔饰）的饭店经理却敞开了温暖的怀抱，他经营着当地一家云集着欧洲游客和军界政要的米勒·科林斯饭店，八面玲珑地运用着一切关系尽心地呵护着饭店的顾客们。保罗是胡图族人，而他的妻子塔莎娜（苏菲·奥康尼多 饰）却是图西族的，对他而言，在动荡的时局中，保护他的图西族的亲戚与朋友成为了一生中面临的最大使命与挑战。联合国维和部队的无所作为和与世界媒体的隔绝使得保罗夫妇二人和在饭店中避难的1268名当地居民更加坚定了活下去的信心与勇气，“我们一定让全世界都无地自容地去采取应有的行动”。事态越来越严重，百日之内竟有约100万人死于非命，但米勒·科林斯饭店却成为了嗜血荒漠中的一片生命绿洲',NULL,'线下',0,0,'卢旺达饭店','2015-11-26 10:58:02',1,NULL),
	(219,'f6f5b7e9-4fb7-4e4c-8fc7-09e7fd73a1ed','麦克法兰','麦克法兰_Big.png',1,'128分钟','妮琪·卡罗','凯文·科斯特纳/玛丽亚·贝罗',1,2015,'美国','剧情','《麦克法兰》根据1987年的真实故事改编，科斯特纳扮演的教练来到一个穷困无比，尘土飞扬，居民多为拉美裔…',NULL,'线下',0,0,'麦克法兰','2015-11-26 10:58:02',1,NULL),
	(133,'f70b211d-7b8a-4313-a5da-5e7f8facc231','大力神重生','大力神重生_Big.png',1,'95分钟','Nick Lyon','John Hennigan/克里斯蒂安·奥利佛',1,2014,'美国','动作','一个年轻人的新娘被邪恶的国王绑架，他向大力神寻求帮助。因杀害家人而被放逐，破落的英雄一直过着流亡生活。年轻人的勇气激励了海克力斯。他们一起抗争，拯救新娘并且挽回了大力士的荣誉。',NULL,'线下',0,0,'大力神重生','2015-11-26 10:58:02',1,NULL),
	(68,'f7470c02-4624-4e50-9696-fdc810cd498d','让子弹飞','',1,'133分钟','姜文','姜文/周润发/葛优/刘嘉玲/陈坤/周韵/廖凡',1,2010,'中国','喜剧','该片讲述了北洋年间，南部中国。一场惊天动地的的火车劫案之后，号令山林的绿林悍匪张牧之，遭遇行走江湖的通天大骗老汤，两人从生死宿敌变成莫逆之交，然而真正的决战才刚刚开始，南国一霸黄四郎虎视眈眈镇守鹅城，一场场情杀命案连环上演，华南三王各自为阵，鹅城双艳粉墨登场，乱世枭雄的混战一触即发。',NULL,'线下',0,0,'让子弹飞','2015-11-26 10:58:02',1,NULL),
	(118,'f7a9eba0-5f24-4d28-912b-7a52b7123ecd','刺客（2013)','刺客（2013)_Big.png',1,'90分钟','苗述','梁家仁/姜超',1,2013,'中国','动作','公元前360年， 魏王出兵大举攻楚，楚国不支，楚王不知所措、慌不择路，欲行偷梁换柱之计混出王宫，但被魏国大将军识破，与太傅一起被俘。楚国大将军屠甲死里逃生，遂训练两少年习武为刺客，兄雷，弟惊禅，厚积薄发。',NULL,'线下',0,0,'刺客（2013)','2015-11-26 10:58:02',1,NULL),
	(315,'f90e27ee-6571-4ac6-bb7a-79cf2dc132eb','艾尔莎与弗雷德','艾尔莎与弗雷德_Big.png',1,'\n104分钟 ','迈克尔·莱德福','雪莉·麦克雷恩/克里斯托弗·普卢默',1,2014,'阿根廷','爱情','独居老妇人爱尔莎隔壁搬来了一位刚丧偶的新邻居阿尔弗雷德。虽然生活背景、环境、性格完全不同，但这两位独居的老人被彼此吸引了，他们相爱了。阿尔弗雷德也成功地走出了丧妻的阴影。但事实上，开朗的爱尔莎身患重病，而她过去对阿尔弗雷德所说的一切也大都是谎言。知道了真相的阿尔弗雷德却决定帮爱尔莎一圆她未了的心愿，他带着爱尔莎来到了她梦寐以求的罗马……',NULL,'线下',0,0,'艾尔莎与弗雷德','2015-11-26 10:58:02',1,NULL),
	(241,'f914dcdc-31af-49c4-b03e-e064562b96f5','军犬麦克斯','军犬麦克斯_Big.png',1,'111分钟','鲍兹·亚金','罗比·阿梅尔/劳伦·格拉汉姆',1,2015,'美国','剧情','影片讲述美国海军陆战队士兵凯尔（罗比·阿梅尔 饰）与他的军犬麦克斯感情甚笃，凯尔在阿富汗的战场意外牺牲之后，麦克斯患上战后创伤综合征，无法再与其他士兵一同执行任务。凯尔的家人遂领养了麦克斯，朝夕相处之间，凯尔十四岁的弟弟贾斯汀（乔什·维金斯 饰）与麦克斯建立了友谊，彼此治愈。当一位可疑的前战友泰勒（卢克·克莱恩坦克 饰）忽然出现，父亲又在森林里神秘失踪后，贾斯汀与麦克斯组成黄金搭档。',NULL,'线下',0,0,'军犬麦克斯','2015-11-26 10:58:02',1,NULL),
	(379,'fa8bda20-573f-4690-9c7d-867d8786c34b','我是路人甲','我是路人甲_Big.png',1,'134分钟 ','尔冬升','万国鹏/王婷',1,2015,'中国','喜剧','大学毕业的万国鹏（万国鹏 饰）为了完成演员梦想，从老家东北雪乡一路来到浙江横店，对拍戏一窍不通的他初来乍到屡屡碰壁，更引发连串笑话，但他从不轻言放弃，而是坚持一步一个脚印往前走，终于慢慢踏上正轨，成为一名“专业”的群众演员。 ',NULL,'线下',0,0,'我是路人甲','2015-11-26 10:58:02',1,NULL),
	(163,'fb242cf5-b933-46f4-b548-d13e6d2d610a','水中生活','水中生活_Big.png',1,'117分钟','韦斯·安德森','比尔·默瑞/欧文·威尔逊',1,2004,'美国','冒险','本片讲述了一个妙趣横生的深海冒险故事。处于事业低谷的海洋学家的爱恨情仇，随着最后一次探险之旅尽皆展现在观众眼前，旅程纠缠着海盗、孤岛和致命的美洲鲨，在漫无边际的海洋中搅起一个人性的大漩涡。',NULL,'线下',0,0,'水中生活','2015-11-26 10:58:02',1,NULL),
	(160,'fc570799-3c8d-424d-a26a-fe3644a7d11f','木乃伊2：木乃伊归来','木乃伊2：木乃伊归来_Big.png',1,'130分钟 ','斯蒂芬·索莫斯','道恩·强森/布兰登·费舍',1,2001,'美国','奇幻','影片讲的是埃及探险的故事，情节之繁复、追杀之不停、特级之多样，足以让观众眼花缭乱。',NULL,'线下',0,0,'木乃伊2：木乃伊归来','2015-11-26 10:58:02',1,NULL),
	(24,'fda5455d-726c-4073-9a2f-af29251d31c1','绣春刀','',1,'108分钟','路阳','张震/刘诗诗/王千源/李东学/聂远/朱丹/周一围/叶青',1,2014,'中国','动作','明朝崇祯皇帝登基后，权倾天下的大太监魏忠贤被弹劾辞官，阉党覆灭。锦衣卫授命追捕阉党。锦衣卫卢剑星、沈炼、靳一川三人是结拜兄弟，感情非常好。大哥卢剑星非常希望自己能够升到百户的职位，二哥沈炼暗恋着教坊司的女子周妙彤，三弟靳一川则有着不可告人的过去被人攒在手里。一天，内宫太监赵靖忠秘密找到三兄弟，要他们奉皇命去追杀要出京流放的大太监魏忠贤。一场追杀之后，三人带回了大太监魏忠贤的尸首，本以为凭此大功，三人的夙愿皆可实现。没想到这一切只不过是一个阴谋的开始，三人即将落入更加危险的境地。',NULL,'线下',0,0,'绣春刀','2015-11-26 10:58:02',1,NULL),
	(209,'ff38e5a0-ada2-43aa-90c5-ff08d29f3cdf','铁甲钢拳','铁甲钢拳_Big.png',1,'126分钟','肖恩·利维','休·杰克曼/达科塔·高尤',1,2011,'美国','动作','　影片讲述了在不远的未来，人类拳击被政府取缔，只有机器人的拳击赛才合法。休·杰克曼在片中出演一位前拳击手，他在长时间的沉睡之后醒来，发现人类已经不能参与拳击运动了，而且自己还有一个11岁的儿子，于是决定成为拳击经纪人。在寻找中他发现了一个求胜心很强，却已经被弃用的机器人，于是他和儿子一起努力让它成为冠军。',NULL,'线下',0,0,'铁甲钢拳','2015-11-26 10:58:02',1,NULL),
	(218,'ff59e222-1a93-4586-9182-064b420797cd','鸿门宴传奇','鸿门宴传奇_Big.png',1,'132分钟','李仁港','黎明/冯绍峰',1,2011,'中国','动作','暴秦末年，天下大乱。西楚项羽自立霸王，赤旗刘邦斩蛇起义。乱世英雄，结拜兄弟，为“先入咸阳，册封秦王”的游戏生死相搏。妙计张良，奇谋范增，谁棋高一着？水火之仇化为一局剑拔弩张的“鸿门宴”，当所有受邀者前程剧变之时，才发现这场“鸿门宴”远未结束…',NULL,'线下',0,0,'鸿门宴传奇','2015-11-26 10:58:02',1,NULL),
	(87,'ffd2d366-230f-4d4c-b582-36106f13027f','极地大冒险1','',1,'75 分钟','迈克尔·亨纳','汤米·柯贝拉',1,2008,'德国 ','动画','小驯鹿尼科梦想着能和从未相见的驯鹿爸爸一样成为会飞的圣诞驯鹿。尽管有很严重的眩晕，尼科还是每天偷偷溜出它所住的山谷，花大部分时间向罕见的芬兰飞行松鼠家族成员Julius学习飞行课。',NULL,'线下',0,0,'极地大冒险1','2015-11-26 10:58:02',1,NULL),
	(396,'','','猩球崛起2黎明之战_Big.png',1,'130分钟','马特·里夫斯','安迪·瑟金斯/杰森·克拉克',1,2014,'美国','剧情','虽然《猩球崛起：黎明之战》设定在前作15年后，但故事却与首集结尾致命病毒弥漫全球密切相关，遭此横祸的人类只有一小部分幸存下来，而他们正威胁着凯撒统领的高度进化猿族大军，虽然双方一度达成了短暂却脆弱的和解，但为了争夺地球的绝对领导权，一场激烈的人猿大战一触即发。',NULL,'线下',0,0,'猩球崛起2黎明之战','2015-11-26 10:58:02',1,NULL),
	(402,'','',NULL,2,'20','苏丽','苏丽',10,2015,'中国','喜剧，玄幻，历史','这是一个欢乐的小故事。',NULL,'',0,0,NULL,'2015-12-02 14:27:42',1,'2015-12-21 10:46:29'),
	(403,'f61df752-00a9-4b37-9771-7bb4fe16702d','xdghh',NULL,1,'114','sfdn','xn',24,2015,'xn','xfn','xn',NULL,'',0,0,NULL,'2015-12-21 10:29:58',1,'2015-12-21 10:58:03'),
	(404,'803daa2a-cedd-4a47-8019-9615bc891cb6','dbnxdgn',NULL,1,'231','zdb','zh',21,2015,'h','seth','eshseht',NULL,'',0,0,NULL,'2015-12-21 10:32:18',1,'2015-12-21 10:57:46'),
	(405,'6d61bf9a-3f7d-4149-aaa1-50a1ced56f1d','eheh',NULL,1,'dbdzf','zsg','zsf',24,2015,'zsfd','dzfhb','',NULL,'',0,0,NULL,'2015-12-21 13:48:45',1,'2015-12-21 13:48:48'),
	(406,'3597207b-4b5e-406a-bb77-ca160ed2905d','121',NULL,0,'151','zdfb','zdfh',24,2015,'dzfh','dfh','zdh',NULL,'',0,0,NULL,'2015-12-21 13:50:55',1,'2015-12-21 13:50:59'),
	(407,'2237d945-68cc-471a-8564-6d1356ff594a','二胎','二胎_Big.png',2,'45分钟','庞好','蒋欣,曹炳琨,莫小棋,冯嘉怡,潘虹,刘莉莉',33,2014,'中国','现代剧情','80后模范夫妻唐乔菲（蒋欣饰）和林海生（曹炳琨饰）结婚八年，育有一子，在双方父母的帮衬下过着比上不足比下有余的生活，但长辈们每每爆发的抢孩子大战，总让小夫妻俩心力交瘁，而唐乔菲的意外怀孕打破了这个家庭的平静。','二胎_normal.png','线下',1,0,'二胎','2015-12-23 11:42:28',1,NULL);

/*!40000 ALTER TABLE `pl_video` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table pl_video_tmp
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pl_video_tmp`;

CREATE TABLE `pl_video_tmp` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(64) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `pl_video_tmp` WRITE;
/*!40000 ALTER TABLE `pl_video_tmp` DISABLE KEYS */;

INSERT INTO `pl_video_tmp` (`id`, `uuid`, `name`)
VALUES
	(1,'0010990d-df65-43d4-83a8-a6b61114ff35','绑架弗雷迪喜力'),
	(2,'0017fe28-dacc-4df7-9151-0b457276f69c','霸王别姬'),
	(3,'01d6a325-46dd-41ea-8d2b-1a357071d75e','初恋红豆冰'),
	(4,'0219d1ad-6243-445a-81b2-071a07920750','滚蛋吧肿瘤君'),
	(5,'02e9ebae-b172-4689-b3b6-d69bd5fe6e11','金刚狼2'),
	(6,'032a79a6-914d-4f13-8f14-31d39f0591b7','暴力街区（2014）'),
	(7,'03517e95-c4e3-4543-a005-ff7ef36b2e1e','不凡之路'),
	(8,'041fc006-0a34-437b-a311-3c6635f5d57c','速度与激情7'),
	(9,'0443c99c-17dc-4054-a708-fe78864a1bc6','斗士'),
	(10,'044f7b30-98c1-4006-b8cf-c00299458d25','我的宝贝'),
	(11,'04d83413-7dc2-4258-8061-d3c3ff67cb72','暴疯语'),
	(12,'055667f7-4e08-4959-aa5c-e4a420119451','模仿游戏'),
	(13,'0563df51-402f-4ce9-bbf0-17675781af2c','魔力麦克'),
	(14,'05f9828d-f6c1-4a04-b463-67094477f20b','远离尘嚣'),
	(15,'061b4754-a2e2-458e-a1b1-f6f328c63af2','水浒传2011版'),
	(16,'06be2cf9-8ba5-4d33-bb9a-bcb2df51ed18','单亲度假村'),
	(17,'070cd65c-beda-4d84-ae97-9f2adfad955c','九层妖塔'),
	(18,'072c8087-b63c-4786-8686-ed6181379287','恶魔之手'),
	(19,'0740d78a-24b6-4034-8e98-23d01e70e271','她'),
	(20,'07665884-0e59-4ece-bb92-dccf62ebc781','保持通话'),
	(21,'079e479f-6684-402e-b4fa-d29149e8d64a','大话天仙'),
	(22,'07a38633-c9a1-42eb-bbf8-78cc9d99e743','不求上进的玉子'),
	(23,'07e330b1-695e-4d4d-8554-614809f5a358','福尔摩斯先生'),
	(24,'08354038-1db9-4ea0-ad7d-ebb2f67a4ea2','环形使者'),
	(25,'0837bf88-47e6-49a1-b459-ba306f2c5252','王朝的女人杨贵妃'),
	(26,'0945076a-d170-4ea7-b157-383ff0ce8e31','倾城'),
	(27,'0a3984c8-8fc6-4f57-baee-eca3d34c2f8d','麻辣女兵'),
	(28,'0bcc7e27-8dea-4ce1-9252-81ad9527bb75','超能陆战队'),
	(29,'0be8e714-2d55-40ee-9216-9ded5f2c8046','小淘气尼古拉'),
	(30,'0c541cae-e777-4b71-a771-3f37a29c2a00','生命之书'),
	(31,'0d26ee89-f362-46fe-94aa-960544a4552c','门第'),
	(32,'0d589378-b1d2-4f8f-8cbc-4012cb95d793','黄飞鸿之英雄有梦'),
	(33,'0eb3343a-77e7-4454-aaa3-5ce38a4e0d3f','勇敢的心'),
	(34,'0f492d22-5d59-4dee-a780-8e6ed8804c64','名侦探柯南：异次元的狙击手'),
	(35,'102fccd1-dadc-4330-8902-4c8ca33d3fd4','鸳鸯佩'),
	(36,'1046c5de-40de-479c-a1be-36d3dc232836','二炮手'),
	(37,'112dc6ba-41e8-4950-a00b-15ba19c2cb6a','无人驾驶'),
	(38,'112fd073-902c-4720-88ef-5c3e1b67b1a2','雷神'),
	(39,'11b86753-f52f-47e1-b774-1b08fc74aeae','我爱男闺蜜'),
	(40,'11efe283-9377-4866-98a4-cff3ba3b0e82','国际市场'),
	(41,'1242d7ba-3704-4f20-bc8a-f463d4a9d966','圣龙奇兵大冒险'),
	(42,'1249bb6b-0b2e-4a46-a8c3-88bc5acf025d','卧底'),
	(43,'12cea2b4-d983-42f5-b2e1-8fa6907c0857','厨子戏子痞子'),
	(44,'13f36835-5b03-4eaa-9e83-634e235bd623','我爱奇诺奥'),
	(45,'1405255e-18b9-41b4-8c47-f85ea12e79e3','铜雀台'),
	(46,'141f3afe-cda7-4310-a576-c7eab817a8ff','百团大战'),
	(47,'15ed36c3-f560-4b7f-92d8-4a637b3018b3','战马'),
	(48,'16ba6f48-b0d6-462c-8054-db88c30f0f21','心跳戈壁'),
	(49,'16fb7a3f-5596-4875-939e-7da93b40d8fa','京城81号'),
	(50,'177277a9-e671-4b22-ae2b-72215090556f','笔仙惊魂1'),
	(51,'1783b45c-eb04-44ff-810d-e40d848d3db4','咱们结婚吧'),
	(52,'1791adf4-d461-48aa-9fcc-dfb9002c4e7b','箭在弦上'),
	(53,'17a3ff88-ea0b-43c3-a208-66990d582cca','七月半之恐怖宿舍'),
	(54,'18b29d8a-1f32-411e-9a2d-ca33a20d7854','倚天屠龙记之魔教教主'),
	(55,'18e258b3-bb40-4ecf-89c7-4a929b0826b2','僵尸世界大战'),
	(56,'191b9a04-8eae-4a5d-a9d5-88b5861e2acb','异形4'),
	(57,'1975c482-75c9-4727-8ae3-1f97dc75c2bf','涉足荒野'),
	(58,'1aa30411-14f2-4be7-b412-73921c98cf54','利维坦'),
	(59,'1ab466f6-f57e-4fc1-8fe4-c8c6260221ac','少年包青天3'),
	(60,'1ad6fb8c-ad4a-45d2-b118-564884d07253','年鉴计划'),
	(61,'1af341a0-0e71-4e03-ba12-2a4a27cd9503','剑侠'),
	(62,'1b4e6cdc-8350-4d65-bd2b-12d949c9bdba','末日崩塌'),
	(63,'1bbabbf4-53c8-4ddb-a483-c651c107fdef','幸存的女孩'),
	(64,'1c2a3377-7020-4c48-9f32-f9156d828d7e','下一站再爱你'),
	(65,'1d4f9e76-9370-40ba-af34-73b1f4dab760','孤岛惊魂'),
	(66,'1dac42c7-d617-461b-accf-a3335dd9397e','姨妈的后现代生活'),
	(67,'1e906f73-4f80-4747-a273-491948575e28','失孤'),
	(68,'1f1792a3-eddf-4e59-9a56-f01fa6438576','十万火急'),
	(69,'1f2cf62e-9228-46c8-afae-3e15eb9909a5','狼图腾'),
	(70,'201d4072-02c6-4108-9fb3-06c78bbf94ba','嫌疑人X'),
	(71,'21ea3a5b-0be2-45f7-9978-91dd3ce74e9f','夜行者'),
	(72,'2237d945-68cc-471a-8564-6d1356ff594a','二胎'),
	(73,'22495d86-2ab2-4ab4-a32d-59742b6b0bb9','特种部队'),
	(74,'22555ba6-86a8-448c-8272-92ced3d02a85','拥抱星星的月亮'),
	(75,'22e90c57-fc80-4af3-80cb-4d3407e0f9b6','赌圣'),
	(76,'231d9f6d-7722-40b3-b879-5af63e0ca94c','火蓝刀锋'),
	(77,'23d0d3da-bc1d-439d-934d-6dac84aee9f9','明星伙伴大电影'),
	(78,'24695c4a-febe-43e4-b302-3030b9c185b0','天黑请闭眼'),
	(79,'2597a859-4b41-411f-9d4c-95b4c4629202','妈祖'),
	(80,'25c88d99-f239-4744-88a6-5d6f7e4fad61','饥饿游戏3：嘲笑鸟（上）'),
	(81,'25fc1cec-8003-4afd-9c1e-6d41f32dbe77','欢迎来到我的世界'),
	(82,'26e737b1-e5f2-441c-b62e-63706c7b3a00','美人无泪山河恋'),
	(83,'275de537-cf54-43b3-a8cc-3bee70f979c6','变形金刚4'),
	(84,'27b30b80-b243-4c7d-a13e-7b781e285948','同桌的你'),
	(85,'27d2687a-44bc-4ae8-9c78-cbd2e7837e12','全城通缉'),
	(86,'282079af-9de8-46c2-8cc2-60b26908ed02','幽暗山谷'),
	(87,'2826eac8-8e0a-4c49-9a42-ea8af1c3f02f','人间小团圆'),
	(88,'28807094-77b7-4fe2-8e58-648b46f2cb80','魔境仙踪'),
	(89,'291dfdea-9439-4f48-9a4d-27df41c6c01a','我的经济适用男'),
	(90,'29b0fd75-c9b8-4145-9459-0a39ddbfa8de','疯狂试爱'),
	(91,'2b849ad9-728d-4828-8f4f-e03549618fc6','意外的恋爱时光'),
	(92,'2bf19499-9417-440d-9cb8-7246fd872498','窥爱'),
	(93,'2c9cfc17-f6e3-49c5-892f-265e78287f61','同居三人行'),
	(94,'2ce4db48-ac43-4191-ae8c-60ef9edf5d67','花漾'),
	(95,'2ddfe7a4-1bd8-407a-a97b-04e89a43e40b','赏金猎手'),
	(96,'2e1c230b-c1fa-4bd3-ae92-0346840372fd','我的绝密生涯'),
	(97,'2e88220d-c0e4-4d95-be0c-37eb1eed78cc','非诚勿扰1'),
	(98,'2e899000-5caf-44e9-90cc-b7f0e4ad3d53','花千骨'),
	(99,'2ed26d5e-294f-4ea8-a9ec-25828c80b147','捉妖记'),
	(100,'2f31eab8-5050-477e-a61f-e27f81657e9f','白发魔女传之明月天国'),
	(101,'2fc5311b-3169-4de1-90b2-b9d369ebff54','末日孤舰第一季'),
	(102,'3001c58c-cb14-4408-ac4e-1a50078d21e1','北京遇上西雅图'),
	(103,'3020c725-ab68-49ce-a8ae-46194114e859','神探狄仁杰'),
	(104,'30323495-07d8-4433-855a-f61d7a05ad11','混蛋3'),
	(105,'3068072f-f4a2-40ab-b5fa-f2adacb944cf','意大利之旅'),
	(106,'30718a04-00b5-4a7c-a5ff-3d5118295a82','中国合伙人'),
	(107,'30acc4d4-998f-4108-9fe9-792a6dfa7a4a','米其林情缘'),
	(108,'3106558d-f8fa-4313-a446-ff7d2a447ee9','战长沙'),
	(109,'3110ff4e-c466-44f8-8666-d65918b99e76','智取威虎山'),
	(110,'31821610-cfce-4051-91e4-877b138f5300','烽火佳人'),
	(111,'31921a42-8b62-4007-b123-a496485fefc2','豪门夜宴'),
	(112,'31c47546-49b0-44ac-9d9a-e8a554151363','安妮：纽约奇缘'),
	(113,'324c5da2-3fc1-4553-a217-3a667f2f6678','星河战队'),
	(114,'3276ff98-8cfa-40ca-baf2-b70ffa1856f1','我老公不靠谱'),
	(115,'32855f91-7e0d-4beb-bc20-969779ea79fb','疯狂原始人'),
	(116,'32a2d1cd-4b46-4425-8cc1-f5fc0ae74c7a','郑和下西洋'),
	(117,'32fe24c0-6a6f-4cd4-b884-bec4a36e1852','太极1'),
	(118,'33c490ad-0b58-4109-a876-1b0cf1f6517e','精灵旅社2'),
	(119,'34982c93-cb37-4e2d-a772-3e96617c6351','合法入侵'),
	(120,'3498417e-fe73-4827-a785-aa911b6dddbd','爱丽丝梦游仙境'),
	(121,'34b14930-af6f-49e1-b169-3203aaee298f','斯大林格勒'),
	(122,'35ea0137-2852-46d0-9b9d-20965ec69694','等风来'),
	(123,'368c07eb-7a63-4025-bbd3-4c10738e0d46','潜伏'),
	(124,'36b43ddd-2df4-45dd-9f7c-33d51fd88733','屌丝男士第4季'),
	(125,'377f2351-689b-4e7e-9074-d7dd1ff343f9','武媚娘传奇'),
	(126,'3804ea4a-2274-40a4-947c-0a115f36a998','隔绝'),
	(127,'383cf0d5-eef7-4e26-929f-c806d6869468','战雷'),
	(128,'39787e85-d1c5-4c9a-a918-ce0a245f9444','偏偏喜欢你'),
	(129,'3a76cd24-4dcf-44c6-a5c7-376018c306fc','虎胆龙威3'),
	(130,'3a977cb3-c0eb-4ec9-8c74-8a76ac15d14e','明月刀雪夜歼仇'),
	(131,'3acdf993-f65d-42e7-819b-9f7829f20984','私人定制'),
	(132,'3b60a275-d566-4267-9cb1-47989b218bee','太极旗飘扬'),
	(133,'3b887f54-faa0-4dda-8352-ec0c4f986d0a','陌生人'),
	(134,'3bdaf12a-b001-4e05-a413-f4c5270676aa','大眼睛'),
	(135,'3be90cbb-462b-4243-8f34-34973eaabd41','超萌英雄'),
	(136,'3c3bf8b4-47b6-4801-93b2-25bcf75fa5f2','暗杀'),
	(137,'3d0976f5-6608-4d4b-be02-8fbd2b246abb','恋恋不忘'),
	(138,'3d7403a1-7621-431d-8c00-27466737b05c','大好时光'),
	(139,'3da4edce-b445-42c8-88a7-3b8a1997d61c','变形金刚2'),
	(140,'3e48ebe9-4377-4838-9b81-6beea5b792ad','虎胆龙威4'),
	(141,'3ed3cbf3-d520-4cf7-bfe2-cb715e18b974','水中仙'),
	(142,'3f5846a2-0b2a-4eb8-ba87-e4678c5ffc30','波普先生的企鹅'),
	(143,'3f709847-3703-415e-abf4-df87f27d8892','快递惊魂'),
	(144,'3fa31815-dbd9-4b61-8862-7d65b3065234','变种异煞'),
	(145,'404be4df-4d08-40f1-982b-b7f27964e2c1','博物馆奇妙夜3'),
	(146,'4179a8e6-c31f-4940-8261-69c89c8bc3e4','K星异客'),
	(147,'41b469f5-bc03-479b-b4c4-4b18b2c6d044','龙珠Z：复活的F'),
	(148,'4230fe51-6c59-44dc-b66b-96a13540673d','忠犬八公'),
	(149,'42ce1254-bbc6-42b5-b87a-29b3688ea7d2','金玉良缘'),
	(150,'42e17cdb-35f8-45bb-962a-db18d067228d','蒂莫西的奇异生活'),
	(151,'43687625-4383-4652-8e72-c074a1d05b7c','一夜疯狂'),
	(152,'43d45308-995f-4e43-abda-063ef55b237c','全民目击'),
	(153,'45261495-84c8-494b-bee3-0b2761a09871','我和厄尔以及将死的女孩'),
	(154,'45561a74-d36d-4566-9c05-366760af8604','无厘头杀手'),
	(155,'45e4fe32-2629-4cad-84dd-de3d09194991','移动迷宫'),
	(156,'46512de0-425a-4f6c-8f15-2f8670661f22','笔仙惊魂3'),
	(157,'4783aef8-5b80-484c-b8e6-041031824d59','龙卷风'),
	(158,'47886d84-13d1-46c0-b9fe-bb62ca3a3cf5','古剑奇谭'),
	(159,'4796c965-7d71-44f9-a86f-6c19ce7753cf','最长的旅程'),
	(160,'47ccc683-201a-4ead-9f8c-79c1b20b5875','瑞奇和闪电'),
	(161,'48e71711-88d3-4668-9a63-5598c5dca024','鞋匠人生'),
	(162,'4a28ad6e-b246-49f5-b150-56c478824066','恋恋笔记本'),
	(163,'4a60f878-351b-4e82-885b-f507b916b6a2','听风者'),
	(164,'4aa4e991-8eb9-43c8-a2a3-642ddffddbfe','一球成名'),
	(165,'4b042c65-3e1e-4ce5-afd9-5268801c375c','撒娇女人最好命'),
	(166,'4b7070e8-7461-49dc-b8a6-e91a3e83aec8','一个人的武林'),
	(167,'4bbf4b73-4c43-4224-a02c-99c5fd64463f','忍者神龟变种时代'),
	(168,'4c5bb573-d0c2-487e-9484-2e3ec52eb48a','倚天屠龙记2009版'),
	(169,'4cad61ba-fab5-425e-aa69-de68b031d326','终点之城'),
	(170,'4d2360d3-9bfa-4a00-a260-15d309404a59','太极2'),
	(171,'4d623820-a815-4647-a86f-2d63787a4878','江南1970'),
	(172,'4de34038-ba75-4e58-9f5d-f8ecde1f5f1b','精武青春'),
	(173,'4eaaf9ef-9bc8-424d-9b38-ef34255e6716','44号孩子'),
	(174,'4ebc61db-696a-4428-afbb-164561f69b41','烈日迷踪'),
	(175,'4f872ab7-fa33-4bd3-9496-915375b7438d','太平轮（上）'),
	(176,'4f9b1084-4323-4e83-b22a-c37f2384da1c','一代宗师'),
	(177,'50d1ec31-fa99-48b4-942a-200658582c6e','非你勿扰'),
	(178,'51b5832b-0362-4e69-94cc-b8f048b2b75e','搜索'),
	(179,'522c5334-3298-41b4-9b2e-2bb171f1dda6','推拿'),
	(180,'5267d61c-451c-4d87-b448-e07dce7251e9','我和我的他们'),
	(181,'5270e1d1-f4d3-4382-bc5e-05ae596607ed','赤脚小子'),
	(182,'52af863c-f84b-4162-b43d-34b79bde655a','搞定岳父大人'),
	(183,'5361319d-d4ee-4492-9e9e-698563d70d80','澳门风云2'),
	(184,'53ad0e4c-afdd-4b7b-ab77-0d52cc04cecc','星际传奇3'),
	(185,'53ebb0ef-b63a-4039-9c86-0b19a15b4d69','中国远征军'),
	(186,'54d682e4-d16a-4e49-bb3c-56642e9d9b95','女人公敌'),
	(187,'54dbeaf1-dfd5-492a-b2fe-a4022579fca3','伪装者'),
	(188,'54fab2f6-0797-4b5e-a8d2-8a3acee8a3d2','闺蜜'),
	(189,'560f7f2e-e9b9-47ea-9c1b-4c036c2a1b45','西部慢调'),
	(190,'562fd1a9-0235-4b1a-8596-9ecd088a9903','哥斯拉2014'),
	(191,'570605fb-cb37-420b-9adb-f02d2e8ea3ae','蝙蝠'),
	(192,'57e4c673-f253-4679-b054-1ecc82004fc4','两生花'),
	(193,'58919824-ffa8-416a-8eb2-1a1a3813749b','白日杀机'),
	(194,'5a1296fd-513d-4b24-85e8-d63df83e63e2','琅琊榜'),
	(195,'5a46ebf7-9a71-4d51-96a1-05fd39e2ff5d','大喜临门'),
	(196,'5b3bfdb9-32ed-412a-8be4-5fdead747403','复仇之角'),
	(197,'5b505b5b-bed4-45f3-a1d9-a3b69c48341e','导盲犬小Q'),
	(198,'5c43806a-33b3-4599-83ed-0f6cd8f2f6e7','星际传奇1'),
	(199,'5c7fbf9d-ca63-42e0-a3c0-b7b008100ac7','笔仙惊魂2'),
	(200,'5c88d206-2d1c-424a-a009-5f286c02ce26','战斧骨'),
	(201,'605edd5f-78bf-4804-926b-4aef573fc9a5','虎胆龙威5'),
	(202,'6110a1bd-5d3b-4f7d-ad43-cd866ed1bfe3','拉撒路效应'),
	(203,'61a0fbb6-6a44-4577-bb34-e16aa713bfaf','情书'),
	(204,'62f7d4f0-9770-49f3-9f85-b67ee63971d8','北京纽约'),
	(205,'64f5bb46-942f-4d6a-a66f-d683e4589bdc','斗地主'),
	(206,'6520f5c7-e680-4ce4-94b6-1db5d170f9f9','神偷奶爸'),
	(207,'66d3bd7b-db3a-4ff6-927a-a3c4f37fa849','最长的一码'),
	(208,'670f9c46-e37a-4a0c-a5dc-33d08b70e4de','虎胆龙威2'),
	(209,'671a6978-1be9-43e2-a2d7-e6ab382ac350','雪豹-坚强岁月'),
	(210,'67ed87cd-eb40-419d-a94d-481f684547b0','残梦'),
	(211,'68c0a386-4c6a-48c5-8b83-fcd456d34272','边关烽火情'),
	(212,'6971e06b-0ee6-4dcf-bfca-7bee6afa7cb4','初恋时光'),
	(213,'698fc2c6-44b6-405a-8bad-36d11d97056c','新亮剑'),
	(214,'699ad6ea-2936-468a-a203-b23129bf6da8','微爱之渐入佳境'),
	(215,'6a207d57-3f24-43e5-920b-4cbb47f89774','天伦之旅（2009）'),
	(216,'6b13919c-9d92-456d-8c5d-bf2c224c3309','暗夜逐仇'),
	(217,'6b25b2c7-fc6f-4dd0-b8a3-7b06cad13cee','名利场'),
	(218,'6be44f71-f022-49ce-8b29-b3a3311673df','我的P.S.搭档'),
	(219,'6ca90c4f-66e8-431e-9235-eab5a5ddade2','三个奶爸'),
	(220,'6cb63f6e-26b5-4b3c-ae77-2c4e4c243632','魁拔之大战元泱界'),
	(221,'6d8fbf6e-c6cd-4411-ad55-80b76654e76b','霍比特人3五军之战'),
	(222,'6ea7d6e1-5106-413b-a2d0-62a0fc7d5c79','心花路放'),
	(223,'6ed7c361-1a1a-40a0-a93f-f9cbc107c024','终极对决'),
	(224,'6f693c82-5090-479d-a5b9-efdea5d6ac05','终结者创世纪'),
	(225,'6f7af159-ef01-4920-a85f-94f7127a6e3e','透纳先生'),
	(226,'6f8cf273-89eb-4c91-bde5-b8421bb8c2aa','别惹德州'),
	(227,'6fd63bd0-a444-4dab-8310-b85cb9213b11','窃听风云3'),
	(228,'6ffcebc8-a77a-4a14-be92-a11d78adc6a3','四大名捕'),
	(229,'7050bf29-26f2-488a-9c50-17e82e28483f','父母爱情'),
	(230,'707d4949-0fa2-477c-8514-65182d0f6168','国产凌凌漆'),
	(231,'7118c9db-ef89-459c-8f12-41120aea4fdb','丹尼科林斯'),
	(232,'716eb546-f3f2-46d2-8dfd-e2fa13b7d163','炮弹专家'),
	(233,'725498af-f270-4973-badb-4230908a3efd','非常营救'),
	(234,'7295d7b2-4b9c-4ed7-b3f7-a21acf40fee7','神奇四侠2015'),
	(235,'72c86753-8f97-40d7-a217-c4354bfead5c','星际传奇2'),
	(236,'7536312f-0565-49ef-b0aa-f850f4eccedc','入殓师'),
	(237,'75615048-ca0c-4c37-a4fe-18b67740f043','赌侠1'),
	(238,'757b666e-ea4b-432e-91bc-184afe29b599','林荫大道'),
	(239,'75c64e7c-4ed4-47d9-8c34-c145404a5dc2','打狗棍'),
	(240,'75e688ef-070a-4587-958c-7e2321672ef0','超完美男人'),
	(241,'75f78760-fb7c-4c8e-a508-ed29b27fe4ef','故事中的故事'),
	(242,'7641b386-8d78-4d8e-be75-bc3653cebdc2','失魂姐弟'),
	(243,'7691fb84-5aa7-4a10-8aa3-187c3238c24c','金蝉脱壳'),
	(244,'77e1dbf1-0879-4dd3-af3d-d9123e34ae3d','钟馗伏魔雪妖魔灵'),
	(245,'798a5f88-1f3b-4f97-8fda-90b15148411d','旅程终点'),
	(246,'79bbd0db-9c85-43a9-8a48-e88bfbff1a13','火车'),
	(247,'7a3e45fe-b01a-4fc8-8f96-3adf9c55a321','幸运者'),
	(248,'7a40a95f-81d1-4cc6-933f-d26f3852ec2f','第一次'),
	(249,'7afc8183-2b10-46c5-9b0a-5e37f2c397ec','女生宿舍'),
	(250,'7db5b5d8-f847-44a9-b378-28e96e7138af','青春誓约'),
	(251,'7dcc0be3-f37b-48eb-bbe3-6b2268b62aa9','秘术之盗墓江湖'),
	(252,'7e6a1341-c3f3-4c2c-8eaf-5d60b274756b','大漠枪神'),
	(253,'7ecd1e36-8e0c-4647-80d1-d957c83dbe80','周末午夜光明'),
	(254,'7eefa92f-17af-4d5a-99ad-43613f01bf42','黑暗物质第一季'),
	(255,'7fbd5095-0420-4b07-9fbe-558ec516f246','催眠大师'),
	(256,'802c029d-1086-40b6-b29e-e75745f3e1c6','潜艇总动员3'),
	(257,'803ef715-a348-4c11-a39e-622ff3874fbc','街角洋果子店'),
	(258,'806d1353-5fcb-4d64-bb0e-c46b9f2918f7','亮剑'),
	(259,'809d7f3f-f3c5-48be-be9c-b48abe624e91','有客到'),
	(260,'8242a578-5e5e-48c7-9927-301b3f1e92ed','神雕侠侣2014版'),
	(261,'8293f568-17df-4ef8-a379-8cc9a03a34d6','行运一条龙'),
	(262,'82e5a814-5f80-4ed2-bc58-ded6c6f6925b','禁区'),
	(263,'834dd8d5-7602-4408-b3a2-f79d23f5bffb','哥本哈根'),
	(264,'83762e52-7b37-49c7-b5dd-d6bf16e2f204','战魂'),
	(265,'8399191d-58c9-4d8a-8df5-6dadae12127b','奇人密码古罗布之谜'),
	(266,'845b66c3-9821-4e27-b55f-19ccf077e93b','征服'),
	(267,'85152605-8c0c-42ed-a325-ce3f71ded66d','龙之谷'),
	(268,'858f23e8-df1c-4a4f-a5d1-c5979624859e','神奇侠侣'),
	(269,'86982c1c-41b3-457c-8bc5-34fac1d34de9','万物理论'),
	(270,'87183f4b-2097-4bf6-b3c0-05a45deaad44','红日'),
	(271,'8764b423-0ee1-4819-bec4-af1e6ee66fc3','生活残骸'),
	(272,'87db6496-95b8-4b1c-920c-c334fe26333d','汉娜'),
	(273,'895d764d-37ba-4999-a506-c0c69448b770','小时代3：刺金时代'),
	(274,'8a84257b-6c36-46b9-8afc-8bb9ba2f4905','抓住彩虹的男人'),
	(275,'8b22fb80-a6ce-4453-8a39-059dc85c5e11','大陆小岛'),
	(276,'8c34d537-e8cf-4dab-a0bb-1a972fc58c23','屌丝男士第2季'),
	(277,'8d3823b1-d119-4344-b932-8604ee66bcde','鲁滨逊漂流记'),
	(278,'8edc4997-7f30-486d-ad8b-a5264aa30608','感染列岛'),
	(279,'9018a51f-2f76-4f47-953f-80683ba3d178','美国队长2'),
	(280,'90b94ce0-0b5e-4e4f-8390-c28ecebb0bc4','北京青年'),
	(281,'912bcfc9-c651-47f4-9b7e-08b2c8a32dd9','冲上云霄'),
	(282,'914edc29-7534-44c2-92b6-2b1bc4cb56cb','魁拔3'),
	(283,'9188eb5f-7fe7-4761-8332-a4d221a6c7d0','丧家之女'),
	(284,'91ca7f69-8dc6-4878-ac99-735457befd40','朱诺'),
	(285,'91d6fe3b-f342-43bc-9308-ef6576f6f7f0','刺蝶'),
	(286,'928f41d9-112a-4a33-81e5-8173db32ac89','分手大师'),
	(287,'932cbe1f-b131-4433-b9c8-277f19687ed8','末日孤舰第二季'),
	(288,'9381be5e-472b-4255-bac1-ac262a11bf94','柠檬的爱情'),
	(289,'94158cbf-5f79-4a8a-afaf-d7e65c9fdce2','王牌特工：特工学院'),
	(290,'945bbc03-f86f-4f1d-b188-042dfdaf9fb3','最佳前男友'),
	(291,'94ae337f-9b8e-486e-86d0-83a306b1b422','圣人文森特'),
	(292,'94d62b5d-b9b2-4545-be59-2ce974d0f78b','太平轮下彼岸'),
	(293,'95ca815d-e69c-4d61-8e7f-addfb4323016','灰姑娘（2015）'),
	(294,'95eb984d-a9d5-46e6-8dae-392a28814791','1980年代的爱情'),
	(295,'9675b580-58dc-4d00-bc2b-74346cbf9596','超世纪战神'),
	(296,'96bb616c-ea70-425f-a512-3c5b781546a4','光辉岁月'),
	(297,'96f23bb2-9cc2-4c2b-99c7-46741dc15ebf','毛泽东'),
	(298,'9757b92a-bf9f-4f77-b1fc-99c64ceccc12','活死人归来3'),
	(299,'992b87c3-5030-491b-bb36-ea344db54776','杀破狼'),
	(300,'9991fadb-3897-465c-9979-8ae3e0fc26b0','无赖汉'),
	(301,'9ad91625-dce3-4538-8d1f-45a89b65fb2f','乔省长和他的女儿们'),
	(302,'9b28138c-0313-4f70-9f96-9846bf23016e','鲁斯和亚历克斯'),
	(303,'9c40d19f-40c7-4855-897a-7830f0f0db71','冲霄楼'),
	(304,'9cfddb80-baa3-4deb-87dc-ca46bf04dcb5','爱国者'),
	(305,'9d4b6406-cdf7-4ea9-b85b-d7d5a1298df6','心术'),
	(306,'9d7bbff9-68d8-453e-8f2d-de3da785b9fc','大舜'),
	(307,'9d824e7b-787f-4488-a54f-ded87358c41a','西风烈'),
	(308,'9e47092d-7c13-46df-bb5e-ace2668ef062','相助'),
	(309,'9e5eb32c-7c2f-49e0-9efc-ab69a605fcf1','一爱到底'),
	(310,'9e6727da-61f5-4402-8839-ca05383cb511','赌城大亨之新哥传奇'),
	(311,'9f123cf3-55fd-40e5-9225-187e17f0b3bf','辩护人'),
	(312,'9f77c696-dabf-4883-b381-b9eb550b44d9','爱的就是你'),
	(313,'9fc10864-6d82-4f55-9dc2-15e719cb441b','时光尽头的恋人'),
	(314,'a0584ca4-4e9b-4da4-88de-f812328f5a8e','鸟人'),
	(315,'a1c1445d-df5f-47f8-80e1-c3458c14d82a','刺客聂隐娘'),
	(316,'a1ed435e-cc3e-43bb-8d97-ee6c45834d09','X战警'),
	(317,'a28dcd4f-af98-4e13-bded-e8d32bc7b94f','海雾'),
	(318,'a2a0fdd7-5779-44ca-a79c-755546f9652d','将军号'),
	(319,'a2c8679e-1e7f-4d43-a79d-11952bd5d4d0','傲慢与偏见（2005）'),
	(320,'a2cf1517-5997-490c-a074-99081656e79f','六福喜事'),
	(321,'a3023dcc-cd40-4551-add4-c005deb1a42c','华丽上班族'),
	(322,'a30a0a1b-8c3e-4b2b-ab67-7061e1b01aa9','如果没有'),
	(323,'a3b5f858-d843-4688-8e28-1bc6027e0bba','新济公活佛'),
	(324,'a3cd4648-33bd-42eb-872c-4b4d20e99967','弗里敦'),
	(325,'a40d25ed-beef-431e-acb7-c4a0d9680c4d','基督再临'),
	(326,'a487407b-f301-496f-9f92-a8217ae52a9c','边境风云'),
	(327,'a535512b-51bf-4c42-90be-b5d5e36cc10a','后天'),
	(328,'a5513bd8-94b9-4729-84ca-d2b262dd7864','海绵宝宝历险记海绵出水'),
	(329,'a5652e81-eea0-430f-9bed-b545e27a3068','逐梦奇迹'),
	(330,'a76f1251-094b-4bdc-a66a-b4376e9a3d98','冰与火的青春'),
	(331,'a8b74c83-4d20-489a-b486-4111e008a7bc','三城记'),
	(332,'a9317cba-dbf8-4224-8685-3d6ba5e6ea46','大谎言家'),
	(333,'a9708248-7f30-4a0f-a2d9-0458358bf262','笑功震武林'),
	(334,'a98c4499-cf1e-4558-b80e-cf3b68898132','我的媳妇是女王'),
	(335,'a9963dcc-1c29-4512-af15-e38c5f758095','笑傲江湖2013版'),
	(336,'aadd7e32-c0f9-4903-b67d-65309b626c39','自由坠落'),
	(337,'ad21f00c-aabc-44ea-ad1d-dfb91ccb2ad0','恋爱中的城市'),
	(338,'ad52b9d5-44a2-4650-be99-b6eab63ed75a','绝爱'),
	(339,'ad63fb05-e317-4fa5-84cf-a6372d132288','极品女士第1季'),
	(340,'addbb485-a486-4010-9531-b32698e7f4ab','难忘同窗情'),
	(341,'ae47db8d-cbc1-4041-8623-10b7f84771c3','密道追踪之阴兵虎符'),
	(342,'ae7bf156-bd70-45bd-974f-abf8e7cae9d2','断奶'),
	(343,'af2e9542-7e5d-4595-95b1-d49ab74dfa5d','鹿鼎记2神龙教主'),
	(344,'b047c2ee-6732-4bcc-a606-aca885d77ab9','第五元素'),
	(345,'b0952f79-605f-4cf1-ac0b-c56bbf2aa0e4','情敌蜜月'),
	(346,'b138659f-a807-41dd-9d68-0e172393fdef','我在路上最爱你'),
	(347,'b1b13e1c-9d14-415a-a75f-192152fba443','幻世追踪'),
	(348,'b25a2260-4440-4a83-8719-bde5c89a4c8d','赌侠II上海滩赌圣'),
	(349,'b2908c12-5857-4971-94e1-782be136c9d4','极品女士第3季'),
	(350,'b321b789-0762-45ab-a8ef-56e99ba632c6','屌丝男士第3季'),
	(351,'b33e97d3-cabb-4471-bcbf-2b2152ff93e7','小叮当永无兽传奇'),
	(352,'b3641150-3363-427c-9445-be5330f1f390','星际穿越'),
	(353,'b3741ee8-74c4-436a-8fe7-bc7702928d42','临时同居'),
	(354,'b3b65f93-7365-4402-8e27-33a72dee2307','济公'),
	(355,'b560d934-bf50-41cb-83d5-36b57aa85bc6','小萝莉的神猴大叔'),
	(356,'b634645c-a08b-46dd-8762-8d92530512e3','神犬小七'),
	(357,'b6e225ce-6f19-40b3-a5a5-ed0bae72f2b0','死亡诗社'),
	(358,'b78fd4ff-48e1-4e43-abce-1910ee34e8ff','黑暗终结者'),
	(359,'b81b027f-8d41-4f8f-8fac-e616fc446fd0','冬眠'),
	(360,'b82a074c-5ac8-4cac-840e-75da191674df','最后的乘客'),
	(361,'b8eac971-9d6b-437a-ac75-25adc1bb3653','男神执事团'),
	(362,'b91f2e02-339b-4a25-a261-472ed1db0c5a','少年班'),
	(363,'ba6da0ff-3ab8-4529-9062-8c7205ea5ba1','缺席的人'),
	(364,'ba940416-04c7-4797-8047-151aa3d8d450','美丽谎言'),
	(365,'babe08bf-4a10-47b0-b871-55452ae22205','大腕'),
	(366,'bb6a32ed-a3aa-450b-b31b-6e010d7f7f0c','公路美人'),
	(367,'bb6ce419-7ef8-4a1d-b3a0-525a809af2a8','阴阳先生'),
	(368,'bbdc6ee1-9429-4657-8c67-d7a36c564990','上帝帮助女孩'),
	(369,'bbde84b6-460c-48f9-bf4d-72e288e1ce0b','夜莺'),
	(370,'bc49b196-e950-4b8a-9ce3-ce5db039368d','澳门风云1'),
	(371,'bcd0d713-9401-448c-a360-92ba11a20f0c','明若晓溪'),
	(372,'bd16ac5f-26cf-461f-afaf-bd7da8f152e5','左手劈刀'),
	(373,'be949e83-60a6-45c5-a65d-4fb873ac1a4d','春田花花同学会'),
	(374,'bf0afdd8-a797-4fca-9824-21333327abeb','马达加斯加的企鹅'),
	(375,'bfd8968e-d959-4680-8f96-9209dee992de','谍中谍5神秘国度'),
	(376,'bfdcaae9-d8f4-42d5-a225-14aed117c79b','狂野飞车'),
	(377,'c087b1c0-8b69-40ab-9193-6aab3a926ace','太空运输'),
	(378,'c11bbb5f-fb75-4a8b-a722-972df293f7dc','如果我留下'),
	(379,'c130c4bf-db5b-4d10-83f7-49d1f137c06b','永远16岁'),
	(380,'c176c930-0b83-4ffe-9f66-3e7e0e32c89c','西游之一路向东'),
	(381,'c20f896c-e139-4b55-af69-3d8ccec08398','辉煌年代'),
	(382,'c2a35052-0771-4e81-98d3-eac2ab3b8a85','忧郁症'),
	(383,'c2b7d48c-e9d9-42b3-a05c-d429973a1a83','甲方乙方'),
	(384,'c3390f2d-a3ea-4424-bba8-55f1230a823d','超级战舰'),
	(385,'c37c432b-463b-4293-9f93-e2896e9b94a9','煎饼侠'),
	(386,'c40d4a1c-9bd1-49c2-8120-17537aafed73','赌霸'),
	(387,'c49fd80b-5d2c-45d4-b116-56be8cae28e2','骄傲'),
	(388,'c6156d74-1b3c-4ee5-aa1f-bba614a39060','老男孩猛龙过江'),
	(389,'c681e082-8834-4b1b-9a7b-8b059431eee0','激战'),
	(390,'c6d59949-6cf4-447f-8eba-a033d1f1ede5','太平洋幽灵'),
	(391,'c6f96e3b-54ce-47fc-b69f-b99aed18bca3','蝎子王3'),
	(392,'c7193289-1328-4a33-a786-d65258af894c','初到东京'),
	(393,'c774b271-4aaf-498c-9b1b-b49b170d82ff','极品女士第2季'),
	(394,'c7882358-307c-4f64-bd70-c2ad69f46682','拼凑梦想'),
	(395,'c8113018-4074-430c-9402-b4c3f07af3ca','明日边缘'),
	(396,'c8a26c20-98c2-4b98-910a-5b64b4799f19','搏击之王'),
	(397,'c97715ea-69c2-4480-bf6e-1feaead563d5','纸镇'),
	(398,'c9bee5b1-5252-427e-87cf-a739b2c0596e','钢的琴'),
	(399,'ca1ff515-4ce3-4b7a-bdc2-3b6c2ebfdd27','魔力月光'),
	(400,'ca75a761-3106-431c-aa5d-87000a576aca','美国人'),
	(401,'cb1e9a9a-0963-4fb9-9448-9944c1c805d6','怒火攻心'),
	(402,'cb60bbd7-e053-4fdb-8416-fe7c3836d6c0','二十'),
	(403,'cbc079bd-a3a1-47d4-a686-2613a70a6125','冰雪奇缘生日惊喜'),
	(404,'cc1993ae-34d1-4fed-b6b7-070110ea483a','魔术师'),
	(405,'cc519c80-7e2f-49ce-845f-7fd2f1ee1129','屌丝男士第1季'),
	(406,'ccd90b0c-905f-4579-9cfd-a35918e79813','红楼梦'),
	(407,'cd11cb5a-3970-4079-8d7d-7f710045c298','初雪'),
	(408,'cd3b3813-9606-4e7e-aae8-7087175c6ffb','0.5的爱情'),
	(409,'cd6c64f8-a462-40ef-94d8-ad5788e84b87','三日刺杀'),
	(410,'cd870633-b29b-43e5-a089-84bc4c26a62c','重返20岁'),
	(411,'cdea6b17-64d1-4e8c-9381-0b7e28522c3c','无心法师'),
	(412,'cdf71e31-5ef1-4238-b94b-221280104400','冬暖花会开'),
	(413,'ce050f15-e5e9-40d5-bcb4-50c3eddf2ce5','黑狐'),
	(414,'ce07883b-dbc4-4f7b-a991-4a6512b5a980','小黄人大眼萌'),
	(415,'ce16a6ee-38ae-4e21-8a88-c222a7b700cd','超能查派'),
	(416,'ce28020e-4404-4e0f-83e3-f2c5b8ac25c0','超体'),
	(417,'cf5241c4-61cf-4440-8535-ed40ec0eb110','四大名捕3'),
	(418,'cf99da5e-c05b-4159-98c5-39bb6b6dfd28','鸣梁海战'),
	(419,'d0253f98-cd17-44df-bce6-e8581b2cad49','巴巴杜'),
	(420,'d06c8708-c0fc-49f4-927b-dbc0a16bcc63','后备空姐'),
	(421,'d200cbb8-606d-4427-88ff-f85e30d6206c','租个女友回家过年'),
	(422,'d2edc843-6b00-481d-a175-8df4d7070b22','石敢当之雄峙天东'),
	(423,'d3e5a9e2-5b5e-49a4-acb1-bb202dfa1325','许三观卖血记'),
	(424,'d4a2ad47-eb5c-481e-8194-54b17610605b','末代皇帝传奇'),
	(425,'d4c81d8a-5e13-4117-b1d7-97f62c83ffcb','X战警2014'),
	(426,'d55f83a4-3cb8-449b-b6ab-a266abd43ff7','烈日灼心'),
	(427,'d75a2413-3b73-411f-aec3-18e3c23c7658','从心开始'),
	(428,'d80382f4-2894-4095-9424-7f3acb2d963c','赎罪'),
	(429,'daa6d52a-d03e-45a7-b8a9-73992ff2fd86','坚不可摧'),
	(430,'db17d286-8aa1-4c4e-9ef8-01775bf3584b','家有仙妻'),
	(431,'dbba1d33-0ee2-4ec9-8d9c-a0c3c608005b','冒顿'),
	(432,'dc0467b5-f7e2-4d0a-8bda-835cf1359630','嫦娥'),
	(433,'dc3eed18-e2d8-4ebb-b71b-09f50a4fddad','蝙蝠侠：前传'),
	(434,'dc554682-c517-45ba-a8e5-4fae1293dbba','肮脏的周末'),
	(435,'dce53a57-d4fa-4e51-b31b-18e2cba8aa1e','追凶（2005）'),
	(436,'dd56ed12-a16e-4f3d-b139-4079e49878e1','最后的骑士'),
	(437,'de05f0a9-bb6a-492d-aac2-fdf0cc3813a7','无人区'),
	(438,'dec6b038-ff3a-406f-a113-6a1e2571d570','剪刀手爱德华'),
	(439,'df942346-ce0b-4d3a-a7bf-2b1f900961c9','不再说分手'),
	(440,'e00ba471-a8de-41ae-8c16-665ab80374ee','闯关东'),
	(441,'e00fc0fc-29bc-47ef-8745-1b3ce051e437','伸冤人'),
	(442,'e02d116b-f9c9-47c9-b625-9ce4dcec966a','美国狙击手'),
	(443,'e04fd9fc-278f-43f0-94d3-f06a0c6d6ecf','大闹天宫'),
	(444,'e05b70c6-28d2-4589-902e-a13b1b30e0f1','猩球崛起：黎明之战'),
	(445,'e0dec640-a96a-45c4-adce-bf0096562017','真实的谎言'),
	(446,'e17aafaa-22bc-4c1b-aa74-64f772fca85a','将军'),
	(447,'e259c6c7-a590-4d96-a154-f2a163fb1e9f','云之彼端约定的地方'),
	(448,'e2f2c2af-fbf6-4650-93ce-518eff534b2a','杉杉来了'),
	(449,'e2f38136-4096-46cd-b41e-121b2868de32','深夜姐妹会'),
	(450,'e3180f6f-d876-4fb1-9e57-8d66e650cbbd','百濑朝向这边'),
	(451,'e496654b-4f4b-4dbe-80ef-2367f1e9bf49','坏姐姐之拆婚联盟'),
	(452,'e4bc3194-4b2b-4105-a795-78e626c9fcf9','千山暮雪'),
	(453,'e683e351-2232-4f40-8b4c-5edf8bf99fa8','诺亚方舟创世之旅'),
	(454,'e7a8b66d-37bd-4219-a60a-203018fa5e06','巴黎假期'),
	(455,'e7cb09d8-e45f-4505-a424-a55c0f1d9305','步步惊心'),
	(456,'e83386e2-0535-4cfa-9c5d-e82980f7790d','临终囧事'),
	(457,'e837a5f6-928a-4a68-9a0c-63bb9f4c180e','真爱无价'),
	(458,'e8954475-22c0-4059-9621-4e400cafb6e1','匆匆那年'),
	(459,'e89c5d70-3c17-4d08-8675-8e760b45d4ab','父辈的旗帜'),
	(460,'e98417cd-6f26-4280-bab1-511e548c8035','侏罗纪世界'),
	(461,'e99e8ade-f066-4757-8fc2-2fca36c13d2b','收获的季节'),
	(462,'e9e2713f-fdfd-4f1a-8e3a-6f9f771ad31d','300勇士：帝国崛起'),
	(463,'e9e9fc47-2395-4ef9-87fc-aa867dd39b60','霍比特人2史矛革之战'),
	(464,'ea3c2c6c-0c33-4b22-9036-c64d0a678ec2','平凡的世界'),
	(465,'eba2e2ba-1c37-4e16-8703-ae522dd9b677','欲罪'),
	(466,'ec88fc95-44b1-4a28-a981-9331d3328f38','苔藓'),
	(467,'ed14a403-0842-4669-8d56-50f2d7ee1356','破风'),
	(468,'edf9008e-9bcc-4ff4-863a-dbb711cde154','新大头儿子和小头爸爸之秘密计划'),
	(469,'eef93ad2-9cbf-4831-ab45-9b87c5502243','虎妈猫爸'),
	(470,'ef23279e-5305-4261-b62b-359304c1fc98','冰封之地'),
	(471,'ef2e5b99-d020-4602-b33d-fbc1b4f08892','风中奇缘'),
	(472,'f0bbf3e6-ca6f-41a4-9932-eaf73fd6a223','金刚'),
	(473,'f1f7c3b4-3de0-4204-be8f-75660f4a7d56','超验骇客'),
	(474,'f203f585-2bb9-418e-a113-2e1a51f08303','掘火者'),
	(475,'f2703640-d657-455c-bf22-4901bf39ebdb','硬汉2：奉陪到底'),
	(476,'f3001086-5654-4dd1-b17a-bb2255f7edc5','木星上行'),
	(477,'f35e9ca9-4f00-4202-a034-947ce16c9851','小乌龟是如何长大的'),
	(478,'f4c0a763-4b97-4584-847e-b94cd81d28d5','不二神探'),
	(479,'f4f9470d-9f9b-4ea5-a59e-af1a1e600ede','情定三生'),
	(480,'f5048637-6edc-4597-b9d6-635a987e6c52','速度与激情6'),
	(481,'f509529e-6181-4f46-8c9a-abe1f8c24d41','邻居大战'),
	(482,'f5338f76-b4bc-49b7-971e-d332cdc38fac','功夫侠'),
	(483,'f56e8f2c-4a5f-4fce-bfcd-0d49d3a263a9','头脑特工队'),
	(484,'f58bd6d0-fd2e-4ea2-a71c-231191a65ae9','逃出生天'),
	(485,'f5b1db06-250a-4987-be82-5c39ead06df1','求爱操作团'),
	(486,'f62d13b5-c549-4bbc-b718-01ed9e32e663','盒子怪'),
	(487,'f637d139-062c-4b13-9c47-f0b116dd956a','云水谣'),
	(488,'f64d8dc3-9a6b-47e8-bb3a-efab4b292ad3','卢旺达饭店'),
	(489,'f6f5b7e9-4fb7-4e4c-8fc7-09e7fd73a1ed','麦克法兰'),
	(490,'f6fc46e7-e053-405b-a2e0-1a3c311ba115','何以笙箫默'),
	(491,'f70b211d-7b8a-4313-a5da-5e7f8facc231','大力神重生'),
	(492,'f71b76f7-b172-4d6a-a11c-15522a573038','铁在烧'),
	(493,'f7470c02-4624-4e50-9696-fdc810cd498d','让子弹飞'),
	(494,'f7a9eba0-5f24-4d28-912b-7a52b7123ecd','刺客（2013)'),
	(495,'f90e27ee-6571-4ac6-bb7a-79cf2dc132eb','艾尔莎与弗雷德'),
	(496,'f914dcdc-31af-49c4-b03e-e064562b96f5','军犬麦克斯'),
	(497,'fa8bda20-573f-4690-9c7d-867d8786c34b','我是路人甲'),
	(498,'fb242cf5-b933-46f4-b548-d13e6d2d610a','水中生活'),
	(499,'fb42e314-7dfc-411e-9712-105be94485f2','少年四大名捕（张翰版）'),
	(500,'fc570799-3c8d-424d-a26a-fe3644a7d11f','木乃伊2：木乃伊归来'),
	(501,'fda5455d-726c-4073-9a2f-af29251d31c1','绣春刀'),
	(502,'fe6587fa-f5ba-45bd-9f23-a9b20901cc07','产科男医生'),
	(503,'ff38e5a0-ada2-43aa-90c5-ff08d29f3cdf','铁甲钢拳'),
	(504,'ff59e222-1a93-4586-9182-064b420797cd','鸿门宴传奇'),
	(505,'ffd2d366-230f-4d4c-b582-36106f13027f','极地大冒险1');

/*!40000 ALTER TABLE `pl_video_tmp` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
