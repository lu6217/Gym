/*
SQLyog Enterprise - MySQL GUI v6.03
Host - 5.1.30-community : Database - test
*********************************************************************
Server version : 5.1.30-community
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

create database if not exists `test`;

USE `test`;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

/*Table structure for table `demo_activity` */

DROP TABLE IF EXISTS `demo_activity`;

CREATE TABLE `demo_activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `beginTime` datetime DEFAULT NULL,
  `endTime` datetime DEFAULT NULL,
  `info` varchar(255) DEFAULT NULL,
  `summary` varchar(255) DEFAULT NULL,
  `leader_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK282E15EB5FAA4EAD` (`leader_id`),
  CONSTRAINT `FK282E15EB5FAA4EAD` FOREIGN KEY (`leader_id`) REFERENCES `demo_leader` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `demo_activity` */

insert  into `demo_activity`(`id`,`beginTime`,`endTime`,`info`,`summary`,`leader_id`) values (1,'2016-05-03 00:00:00','2016-05-18 00:00:00','111','111',1);

/*Table structure for table `demo_family_member` */

DROP TABLE IF EXISTS `demo_family_member`;

CREATE TABLE `demo_family_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `birthday` datetime DEFAULT NULL,
  `chengWei` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `workAddr` varchar(255) DEFAULT NULL,
  `leader_id` int(11) DEFAULT NULL,
  `dict_zzmm` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK109A795FAA4EAD` (`leader_id`),
  KEY `FK109A79CE8F3072` (`dict_zzmm`),
  CONSTRAINT `FK109A79CE8F3072` FOREIGN KEY (`dict_zzmm`) REFERENCES `sys_dict` (`id`),
  CONSTRAINT `FK109A795FAA4EAD` FOREIGN KEY (`leader_id`) REFERENCES `demo_leader` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `demo_family_member` */

/*Table structure for table `demo_leader` */

DROP TABLE IF EXISTS `demo_leader`;

CREATE TABLE `demo_leader` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cardNo` varchar(255) DEFAULT NULL,
  `inTime` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `outTime` datetime DEFAULT NULL,
  `recordTime` datetime DEFAULT NULL,
  `dict_batchNo` int(11) DEFAULT NULL,
  `dict_endService` int(11) DEFAULT NULL,
  `dict_helpType` int(11) DEFAULT NULL,
  `dict_nation` int(11) DEFAULT NULL,
  `record_userId` int(11) DEFAULT NULL,
  `dict_sex` int(11) DEFAULT NULL,
  `dict_stateType` int(11) DEFAULT NULL,
  `dict_xueli` int(11) DEFAULT NULL,
  `dict_zzmm` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK158D6EE5E606242D` (`record_userId`),
  KEY `FK158D6EE5772E1D0D` (`dict_helpType`),
  KEY `FK158D6EE5E059F24C` (`dict_endService`),
  KEY `FK158D6EE52EB01C99` (`dict_nation`),
  KEY `FK158D6EE53B6DEF9B` (`dict_batchNo`),
  KEY `FK158D6EE5FDEC8106` (`dict_sex`),
  KEY `FK158D6EE512205F65` (`dict_xueli`),
  KEY `FK158D6EE5B2B952AB` (`dict_stateType`),
  KEY `FK158D6EE5CE8F3072` (`dict_zzmm`),
  CONSTRAINT `FK158D6EE5CE8F3072` FOREIGN KEY (`dict_zzmm`) REFERENCES `sys_dict` (`id`),
  CONSTRAINT `FK158D6EE512205F65` FOREIGN KEY (`dict_xueli`) REFERENCES `sys_dict` (`id`),
  CONSTRAINT `FK158D6EE52EB01C99` FOREIGN KEY (`dict_nation`) REFERENCES `sys_dict` (`id`),
  CONSTRAINT `FK158D6EE53B6DEF9B` FOREIGN KEY (`dict_batchNo`) REFERENCES `sys_dict` (`id`),
  CONSTRAINT `FK158D6EE5772E1D0D` FOREIGN KEY (`dict_helpType`) REFERENCES `sys_dict` (`id`),
  CONSTRAINT `FK158D6EE5B2B952AB` FOREIGN KEY (`dict_stateType`) REFERENCES `sys_dict` (`id`),
  CONSTRAINT `FK158D6EE5E059F24C` FOREIGN KEY (`dict_endService`) REFERENCES `sys_dict` (`id`),
  CONSTRAINT `FK158D6EE5E606242D` FOREIGN KEY (`record_userId`) REFERENCES `sys_appuser` (`id`),
  CONSTRAINT `FK158D6EE5FDEC8106` FOREIGN KEY (`dict_sex`) REFERENCES `sys_dict` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;

/*Data for the table `demo_leader` */

insert  into `demo_leader`(`id`,`cardNo`,`inTime`,`name`,`outTime`,`recordTime`,`dict_batchNo`,`dict_endService`,`dict_helpType`,`dict_nation`,`record_userId`,`dict_sex`,`dict_stateType`,`dict_xueli`,`dict_zzmm`) values (1,'1000000','2016-05-30 10:13:26','领导0',NULL,NULL,229,226,205,104,NULL,187,207,174,160),(6,'1000005','2016-05-30 10:13:26','领导5',NULL,NULL,229,226,205,104,NULL,187,207,174,160),(9,'1000008','2016-05-30 10:13:26','领导8',NULL,NULL,229,226,205,104,NULL,187,207,174,160),(10,'1000009','2016-05-30 10:13:26','领导9',NULL,NULL,229,226,205,104,NULL,187,207,174,160),(11,'10000010','2016-05-30 10:13:26','领导10',NULL,NULL,229,226,205,104,NULL,187,207,174,160),(12,'10000011','2016-05-30 10:13:26','领导11',NULL,NULL,229,226,205,104,NULL,187,207,174,160),(13,'10000012','2016-05-30 10:13:26','领导12',NULL,NULL,229,226,205,104,NULL,187,207,174,160),(14,'10000013','2016-05-30 10:13:26','领导13',NULL,NULL,229,226,205,104,NULL,187,207,174,160),(15,'10000014','2016-05-30 10:13:26','领导14',NULL,NULL,229,226,205,104,NULL,187,207,174,160),(16,'10000015','2016-05-30 10:13:26','领导15',NULL,NULL,229,226,205,104,NULL,187,207,174,160),(17,'10000016','2016-05-30 10:13:26','领导16',NULL,NULL,229,226,205,104,NULL,187,207,174,160),(18,'10000017','2016-05-30 10:13:26','领导17',NULL,NULL,229,226,205,104,NULL,187,207,174,160),(19,'10000018','2016-05-30 10:13:26','领导18',NULL,NULL,229,226,205,104,NULL,187,207,174,160),(20,'10000019','2016-05-30 10:13:26','领导19',NULL,NULL,229,226,205,104,NULL,187,207,174,160),(21,'10000020','2016-05-30 10:13:26','领导20',NULL,NULL,229,226,205,104,NULL,187,207,174,160),(22,'10000021','2016-05-30 10:13:26','领导21',NULL,NULL,229,226,205,104,NULL,187,207,174,160),(23,'10000022','2016-05-30 10:13:26','领导22',NULL,NULL,229,226,205,104,NULL,187,207,174,160),(24,'10000023','2016-05-30 10:13:26','领导23',NULL,NULL,229,226,205,104,NULL,187,207,174,160),(25,'10000024','2016-05-30 10:13:26','领导24',NULL,NULL,229,226,205,104,NULL,187,207,174,160),(26,'10000025','2016-05-30 10:13:26','领导25',NULL,NULL,229,226,205,104,NULL,187,207,174,160),(27,'10000026','2016-05-30 10:13:27','领导26',NULL,NULL,229,226,205,104,NULL,187,207,174,160),(28,'10000027','2016-05-30 10:13:27','领导27',NULL,NULL,229,226,205,104,NULL,187,207,174,160),(29,'10000028','2016-05-30 10:13:27','领导28',NULL,NULL,229,226,205,104,NULL,187,207,174,160),(30,'10000029','2016-05-30 10:13:27','领导29',NULL,NULL,229,226,205,104,NULL,187,207,174,160),(31,'10000030','2016-05-30 10:13:27','领导30',NULL,NULL,229,226,205,104,NULL,187,207,174,160),(32,'10000031','2016-05-30 10:13:27','领导31',NULL,NULL,229,226,205,104,NULL,187,207,174,160),(33,'10000032','2016-05-30 10:13:27','领导32',NULL,NULL,229,226,205,104,NULL,187,207,174,160),(34,'10000033','2016-05-30 10:13:27','领导33',NULL,NULL,229,226,205,104,NULL,187,207,174,160),(35,'10000034','2016-05-30 10:13:27','领导34',NULL,NULL,229,226,205,104,NULL,187,207,174,160),(36,'10000035','2016-05-30 10:13:27','领导35',NULL,NULL,229,226,205,104,NULL,187,207,174,160),(37,'10000036','2016-05-30 10:13:27','领导36',NULL,NULL,229,226,205,104,NULL,187,207,174,160),(38,'10000037','2016-05-30 10:13:27','领导37',NULL,NULL,229,226,205,104,NULL,187,207,174,160),(39,'10000038','2016-05-30 10:13:27','领导38',NULL,NULL,229,226,205,104,NULL,187,207,174,160),(40,'10000039','2016-05-30 10:13:27','领导39',NULL,NULL,229,226,205,104,NULL,187,207,174,160),(41,'10000040','2016-05-30 10:13:27','领导40',NULL,NULL,229,226,205,104,NULL,187,207,174,160),(42,'10000041','2016-05-30 10:13:27','领导41',NULL,NULL,229,226,205,104,NULL,187,207,174,160),(43,'10000042','2016-05-30 10:13:27','领导42',NULL,NULL,229,226,205,104,NULL,187,207,174,160),(44,'10000043','2016-05-30 10:13:27','领导43',NULL,NULL,229,226,205,104,NULL,187,207,174,160),(45,'10000044','2016-05-30 10:13:27','领导44',NULL,NULL,229,226,205,104,NULL,187,207,174,160),(46,'10000045','2016-05-30 10:13:27','领导45',NULL,NULL,229,226,205,104,NULL,187,207,174,160),(47,'10000046','2016-05-30 10:13:27','领导46',NULL,NULL,229,226,205,104,NULL,187,207,174,160),(48,'10000047','2016-05-30 10:13:27','领导47',NULL,NULL,229,226,205,104,NULL,187,207,174,160),(49,'10000048','2016-05-30 10:13:27','领导48',NULL,NULL,229,226,205,104,NULL,187,207,174,160),(50,'10000049','2016-05-30 10:13:27','领导49',NULL,NULL,229,226,205,104,NULL,187,207,174,160),(51,'10000050','2016-05-30 10:13:27','领导50',NULL,NULL,229,226,205,104,NULL,187,207,174,160),(52,'10000051','2016-05-30 10:13:27','领导51',NULL,NULL,229,226,205,104,NULL,187,207,174,160),(53,'10000052','2016-05-30 10:13:27','领导52',NULL,NULL,229,226,205,104,NULL,187,207,174,160),(54,'10000053','2016-05-30 10:13:27','领导53',NULL,NULL,229,226,205,104,NULL,187,207,174,160),(55,'10000054','2016-05-30 10:13:27','领导54',NULL,NULL,229,226,205,104,NULL,187,207,174,160),(56,'10000055','2016-05-30 10:13:27','领导55',NULL,NULL,229,226,205,104,NULL,187,207,174,160),(57,'10000056','2016-05-30 10:13:27','领导56',NULL,NULL,229,226,205,104,NULL,187,207,174,160),(58,'10000057','2016-05-30 10:13:27','领导57',NULL,NULL,229,226,205,104,NULL,187,207,174,160),(59,'10000058','2016-05-30 10:13:27','领导58',NULL,NULL,229,226,205,104,NULL,187,207,174,160),(60,'10000059','2016-05-30 10:13:27','领导59',NULL,NULL,229,226,205,104,NULL,187,207,174,160),(61,'10000060','2016-05-30 10:13:27','领导60',NULL,NULL,229,226,205,104,NULL,187,207,174,160),(62,'10000061','2016-05-30 10:13:27','领导61',NULL,NULL,229,226,205,104,NULL,187,207,174,160),(63,'10000062','2016-05-30 10:13:27','领导62',NULL,NULL,229,226,205,104,NULL,187,207,174,160),(64,'10000063','2016-05-30 10:13:27','领导63',NULL,NULL,229,226,205,104,NULL,187,207,174,160),(65,'10000064','2016-05-30 10:13:27','领导64',NULL,NULL,229,226,205,104,NULL,187,207,174,160),(66,'10000065','2016-05-30 10:13:27','领导65',NULL,NULL,229,226,205,104,NULL,187,207,174,160),(67,'10000066','2016-05-30 10:13:27','领导66',NULL,NULL,229,226,205,104,NULL,187,207,174,160),(68,'10000067','2016-05-30 10:13:27','领导67',NULL,NULL,229,226,205,104,NULL,187,207,174,160),(69,'10000068','2016-05-30 10:13:27','领导68',NULL,NULL,229,226,205,104,NULL,187,207,174,160),(70,'10000069','2016-05-30 10:13:27','领导69',NULL,NULL,229,226,205,104,NULL,187,207,174,160),(71,'10000070','2016-05-30 10:13:27','领导70',NULL,NULL,229,226,205,104,NULL,187,207,174,160),(72,'10000071','2016-05-30 10:13:27','领导71',NULL,NULL,229,226,205,104,NULL,187,207,174,160),(73,'10000072','2016-05-30 10:13:27','领导72',NULL,NULL,229,226,205,104,NULL,187,207,174,160),(74,'10000073','2016-05-30 10:13:27','领导73',NULL,NULL,229,226,205,104,NULL,187,207,174,160),(75,'10000074','2016-05-30 10:13:27','领导74',NULL,NULL,229,226,205,104,NULL,187,207,174,160),(76,'10000075','2016-05-30 10:13:27','领导75',NULL,NULL,229,226,205,104,NULL,187,207,174,160),(77,'10000076','2016-05-30 10:13:27','领导76',NULL,NULL,229,226,205,104,NULL,187,207,174,160),(78,'10000077','2016-05-30 10:13:27','领导77',NULL,NULL,229,226,205,104,NULL,187,207,174,160),(79,'10000078','2016-05-30 10:13:27','领导78',NULL,NULL,229,226,205,104,NULL,187,207,174,160),(80,'10000079','2016-05-30 10:13:27','领导79',NULL,NULL,229,226,205,104,NULL,187,207,174,160),(81,'10000080','2016-05-30 10:13:27','领导80',NULL,NULL,229,226,205,104,NULL,187,207,174,160),(82,'10000081','2016-05-30 10:13:27','领导81',NULL,NULL,229,226,205,104,NULL,187,207,174,160),(83,'10000082','2016-05-30 10:13:27','领导82',NULL,NULL,229,226,205,104,NULL,187,207,174,160),(84,'10000083','2016-05-30 10:13:27','领导83',NULL,NULL,229,226,205,104,NULL,187,207,174,160),(85,'10000084','2016-05-30 10:13:28','领导84',NULL,NULL,229,226,205,104,NULL,187,207,174,160),(86,'10000085','2016-05-30 10:13:28','领导85',NULL,NULL,229,226,205,104,NULL,187,207,174,160),(87,'10000086','2016-05-30 10:13:28','领导86',NULL,NULL,229,226,205,104,NULL,187,207,174,160),(88,'10000087','2016-05-30 10:13:28','领导87',NULL,NULL,229,226,205,104,NULL,187,207,174,160),(89,'10000088','2016-05-30 10:13:28','领导88',NULL,NULL,229,226,205,104,NULL,187,207,174,160),(90,'10000089','2016-05-30 10:13:28','领导89',NULL,NULL,229,226,205,104,NULL,187,207,174,160),(91,'10000090','2016-05-30 10:13:28','领导90',NULL,NULL,229,226,205,104,NULL,187,207,174,160),(92,'10000091','2016-05-30 10:13:28','领导91',NULL,NULL,229,226,205,104,NULL,187,207,174,160),(93,'10000092','2016-05-30 10:13:28','领导92',NULL,NULL,229,226,205,104,NULL,187,207,174,160),(94,'10000093','2016-05-30 10:13:28','领导93',NULL,NULL,229,226,205,104,NULL,187,207,174,160),(95,'10000094','2016-05-30 10:13:28','领导94',NULL,NULL,229,226,205,104,NULL,187,207,174,160),(96,'10000095','2016-05-30 10:13:28','领导95',NULL,NULL,229,226,205,104,NULL,187,207,174,160),(97,'10000096','2016-05-30 10:13:28','领导96',NULL,NULL,229,226,205,104,NULL,187,207,174,160),(98,'10000097','2016-05-30 10:13:28','领导97',NULL,NULL,229,226,205,104,NULL,187,207,174,160),(99,'10000098','2016-05-30 10:13:28','领导98',NULL,NULL,229,226,205,104,NULL,187,207,174,160),(100,'10000099','2016-05-30 10:13:28','领导99',NULL,NULL,229,226,205,104,NULL,187,207,174,160);

/*Table structure for table `demp_data_import` */

DROP TABLE IF EXISTS `demp_data_import`;

CREATE TABLE `demp_data_import` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activityCnt` int(11) NOT NULL,
  `ctime` datetime DEFAULT NULL,
  `leaderCnt` int(11) NOT NULL,
  `memberCnt` int(11) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `uploadFile` varchar(255) DEFAULT NULL,
  `from_deptId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8F8913FF122A87BA` (`from_deptId`),
  CONSTRAINT `FK8F8913FF122A87BA` FOREIGN KEY (`from_deptId`) REFERENCES `sys_dept` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `demp_data_import` */

/*Table structure for table `sys_appuser` */

DROP TABLE IF EXISTS `sys_appuser`;

CREATE TABLE `sys_appuser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ctime` datetime DEFAULT NULL,
  `passwd` varchar(255) DEFAULT NULL,
  `realName` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `uname` varchar(255) DEFAULT NULL,
  `dept_id` int(11) DEFAULT NULL,
  `dict_sex` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK69DC7F107C9B38BA` (`dept_id`),
  KEY `FK69DC7F10FDEC8106` (`dict_sex`),
  CONSTRAINT `FK69DC7F10FDEC8106` FOREIGN KEY (`dict_sex`) REFERENCES `sys_dict` (`id`),
  CONSTRAINT `FK69DC7F107C9B38BA` FOREIGN KEY (`dept_id`) REFERENCES `sys_dept` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_appuser` */

/*Table structure for table `sys_dept` */

DROP TABLE IF EXISTS `sys_dept`;

CREATE TABLE `sys_dept` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deepth` int(11) NOT NULL,
  `dname` varchar(255) DEFAULT NULL,
  `sn` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `leaf` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK2F6CEF219B58D835` (`parent_id`),
  CONSTRAINT `FK2F6CEF219B58D835` FOREIGN KEY (`parent_id`) REFERENCES `sys_dept` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `sys_dept` */

insert  into `sys_dept`(`id`,`deepth`,`dname`,`sn`,`parent_id`,`leaf`) values (1,1,'新疆大学',0,NULL,0),(2,2,'软件学院',1,1,1);

/*Table structure for table `sys_dict` */

DROP TABLE IF EXISTS `sys_dict`;

CREATE TABLE `sys_dict` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `itemName` varchar(255) DEFAULT NULL,
  `itemValue` varchar(255) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `sn` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=259 DEFAULT CHARSET=utf8;

/*Data for the table `sys_dict` */

insert  into `sys_dict`(`id`,`itemName`,`itemValue`,`note`,`sn`) values (104,'民族','汉族','',0),(105,'民族','壮族','',0),(106,'民族','满族','',0),(107,'民族','回族','',0),(108,'民族','苗族','',0),(109,'民族','维吾尔族','',0),(110,'民族','土家族','',0),(111,'民族','彝族','',0),(112,'民族','蒙古族','',0),(113,'民族','藏族','',0),(114,'民族','布依族','',0),(115,'民族','侗族','',0),(116,'民族','瑶族','',0),(117,'民族','朝鲜族','',0),(118,'民族','白族','',0),(119,'民族','哈尼族','',0),(120,'民族','哈萨克族','',0),(121,'民族','黎族','',0),(122,'民族','傣族','',0),(123,'民族','畲族','',0),(124,'民族','僳僳族','',0),(125,'民族','仡佬族','',0),(126,'民族','东乡族','',0),(127,'民族','拉祜族','',0),(128,'民族','水族','',0),(129,'民族','佤族','',0),(130,'民族','纳西族','',0),(131,'民族','羌族','',0),(132,'民族','土族','',0),(133,'民族','仫佬族','',0),(134,'民族','锡伯族','',0),(135,'民族','柯尔柯孜族','',0),(136,'民族','达斡尔族','',0),(137,'民族','景颇族','',0),(138,'民族','毛南族','',0),(139,'民族','撒拉族','',0),(140,'民族','布朗族','',0),(141,'民族','塔吉克族','',0),(142,'民族','阿昌族','',0),(143,'民族','普米族','',0),(144,'民族','鄂温克族','',0),(145,'民族','怒族','',0),(146,'民族','京族','',0),(147,'民族','基诺族','',0),(148,'民族','德昂族','',0),(149,'民族','保安族','',0),(150,'民族','俄罗斯族','',0),(151,'民族','裕固族','',0),(152,'民族','乌孜别克族','',0),(153,'民族','门巴族','',0),(154,'民族','鄂伦春族','',0),(155,'民族','独龙族','',0),(156,'民族','塔塔尔族','',0),(157,'民族','赫哲族','',0),(158,'民族','高山族','',0),(159,'民族','珞巴族','',0),(160,'政治面貌','中共党员','',0),(161,'政治面貌','中共预备党员','',0),(162,'政治面貌','共青团员','',0),(163,'政治面貌','民革党员','',0),(164,'政治面貌','民盟盟员','',0),(165,'政治面貌','民建会员','',0),(166,'政治面貌','民进会员','',0),(167,'政治面貌','农工党党员','',0),(168,'政治面貌','致公党党员','',0),(169,'政治面貌','九三学社社员','',0),(170,'政治面貌','台盟盟员','',0),(171,'政治面貌','无党派民主人士','',0),(172,'政治面貌','群众','',0),(173,'学历','大专','',0),(174,'学历','本科','',0),(175,'学历','硕士','',0),(176,'学历','博士','',0),(187,'性别','男','',0),(188,'性别','女','',0),(205,'援疆形式','计划内进疆','',0),(206,'援疆形式','计划外进疆','',0),(207,'援疆状态','服务期内','',0),(208,'援疆状态','期满返回','',0),(209,'身体状况','健康','',0),(210,'身体状况','不良','',0),(211,'家庭称谓','父亲','',0),(212,'家庭称谓','母亲','',0),(213,'家庭称谓','妻子','',0),(214,'家庭称谓','丈夫','',0),(215,'家庭称谓','儿子','',0),(216,'家庭称谓','女儿','',0),(217,'家庭称谓','其他','',0),(218,'学历','其它','',0),(219,'援疆状态','提前返回','',0),(220,'身体状况','其它','',0),(221,'服务期限','一个月','',0),(222,'服务期限','三个月','',0),(223,'服务期限','半年','',0),(224,'服务期限','一年','',0),(225,'服务期限','一年半','',0),(226,'服务期限','两年','',0),(227,'服务期限','三年','',0),(228,'服务期限','其他','',0),(229,'援疆批次','第1批','',0),(230,'援疆批次','第2批','',0),(231,'援疆批次','第3批','',0),(232,'援疆批次','第4批','',0),(233,'援疆批次','第5批','',0),(234,'援疆批次','第6批','',0),(235,'援疆批次','第7批','',0),(236,'援疆批次','第8批','',0),(237,'援疆批次','第9批','',0),(238,'援疆批次','第10批','',0),(239,'援疆批次','第11批','',0),(240,'援疆批次','第12批','',0),(241,'援疆批次','第13批','',0),(242,'援疆批次','第14批','',0),(243,'援疆批次','第15批','',0),(244,'援疆批次','第16批','',0),(245,'援疆批次','第17批','',0),(246,'援疆批次','第18批','',0),(247,'援疆批次','第19批','',0),(248,'援疆批次','第20批','',0),(249,'援疆批次','第21批','',0),(250,'援疆批次','第22批','',0),(251,'援疆批次','第23批','',0),(252,'援疆批次','第24批','',0),(253,'援疆批次','第25批','',0),(254,'援疆批次','第26批','',0),(255,'援疆批次','第27批','',0),(256,'援疆批次','第28批','',0),(257,'援疆批次','第29批','',0),(258,'援疆批次','第30批','',0);

/*Table structure for table `sys_file_attach` */

DROP TABLE IF EXISTS `sys_file_attach`;

CREATE TABLE `sys_file_attach` (
  `fileId` int(11) NOT NULL AUTO_INCREMENT,
  `createtime` datetime DEFAULT NULL,
  `creator` varchar(255) DEFAULT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `delFlag` int(11) DEFAULT NULL,
  `ext` varchar(255) DEFAULT NULL,
  `fileName` varchar(255) DEFAULT NULL,
  `filePath` varchar(255) DEFAULT NULL,
  `fileType` varchar(255) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `totalBytes` bigint(20) DEFAULT NULL,
  `global_typeId` int(11) DEFAULT NULL,
  PRIMARY KEY (`fileId`),
  KEY `FK7AB063F64490F40D` (`global_typeId`),
  CONSTRAINT `FK7AB063F64490F40D` FOREIGN KEY (`global_typeId`) REFERENCES `sys_global_type` (`proTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `sys_file_attach` */

insert  into `sys_file_attach`(`fileId`,`createtime`,`creator`,`creatorId`,`delFlag`,`ext`,`fileName`,`filePath`,`fileType`,`note`,`totalBytes`,`global_typeId`) values (4,'2016-05-30 13:37:23',NULL,1,0,'jpg','Winter.jpg','/test/pic/201605/58c7649705674249b7a05a5fe4c42b9d.jpg',NULL,'105.5 KB',105542,1),(5,'2016-05-30 13:38:37',NULL,1,0,'jpg','Water lilies.jpg','/test/pic/201605/f3e7b1b691bc47cdb3a04341c8403b5d.jpg',NULL,'83.8 KB',83794,1),(6,'2016-05-30 13:38:41',NULL,1,0,'jpg','Blue hills.jpg','/test/pic/201605/d6e8e40b6ee947be87038d51dab7a8e4.jpg',NULL,'28.5 KB',28521,1);

/*Table structure for table `sys_global_type` */

DROP TABLE IF EXISTS `sys_global_type`;

CREATE TABLE `sys_global_type` (
  `proTypeId` int(11) NOT NULL AUTO_INCREMENT,
  `catKey` varchar(255) DEFAULT NULL,
  `depth` int(11) DEFAULT NULL,
  `nodeKey` varchar(255) DEFAULT NULL,
  `parentId` int(11) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `sn` int(11) DEFAULT NULL,
  `typeName` varchar(255) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`proTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `sys_global_type` */

insert  into `sys_global_type`(`proTypeId`,`catKey`,`depth`,`nodeKey`,`parentId`,`path`,`sn`,`typeName`,`userId`) values (1,'test',1,'test',0,NULL,NULL,'test',NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
