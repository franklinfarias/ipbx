-- MySQL dump 10.13  Distrib 5.7.18, for Linux (x86_64)
--
-- Host: s2in.vert.com.br    Database: s2n
-- ------------------------------------------------------
-- Server version	5.7.21

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client` (
  `id_client` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `short_name` varchar(15) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `config` text,
  `ind_st_client` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_client`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (1,'COSTA&SILVA','Advogados Costa & Silva','franklin.farias@vert.com.br','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<document>\r\n   <servicenow>\r\n      <host>vert.service-now.com</host>\r\n      <user>franklin.farias</user>\r\n      <password>Fks@2390</password>\r\n      <sys_domain>108244cf6fa28304706dd7aabb3ee423</sys_domain>\r\n      <tables>\r\n         <incident sysparm_query=\"stateIN=6,7,8^ORDERBYclosed_at\">incident</incident>\r\n         <request sysparm_query=\"stateIN=5,7,11^ORDERBYclosed_at\">sc_req_item</request>\r\n         <problem sysparm_query=\"state=4^ORDERBYclosed_at\">problem</problem>\r\n         <change sysparm_query=\"ORDERBYclosed_at\">change_request</change>\r\n      </tables>\r\n   </servicenow>\r\n   <zabbix>\r\n      <host>10.61.231.133</host>\r\n      <user>franklin.farias</user>\r\n      <password>Fks@2390</password>\r\n      <groupid>36</groupid>\r\n      <triggerid>14251</triggerid>\r\n   </zabbix>\r\n   <asterisk>\r\n      <webservice />\r\n      <code />\r\n   </asterisk>\r\n</document>','1','2014-10-12 03:00:00','2018-04-21 08:44:55'),(2,'CAUBR','Conselho de Arquitetura e Urbanismo do Brasil','franklin.farias@vert.com.br','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<document>\r\n   <servicenow>\r\n      <host>vert.service-now.com</host>\r\n      <user>franklin.farias</user>\r\n      <password>Fks@2390</password>\r\n      <sys_domain>960706730f7a32004fe186ea42050e88</sys_domain>\r\n      <tables>\r\n         <incident sysparm_query=\"stateIN=6,7,8^ORDERBYclosed_at\">incident</incident>\r\n         <request sysparm_query=\"stateIN=5,7,11^ORDERBYclosed_at\">sc_req_item</request>\r\n         <problem sysparm_query=\"state=4^ORDERBYclosed_at\">problem</problem>\r\n         <change sysparm_query=\"ORDERBYclosed_at\">change_request</change>\r\n      </tables>\r\n   </servicenow>\r\n   <zabbix>\r\n      <host>10.61.231.133</host>\r\n      <user>franklin.farias</user>\r\n      <password>Fks@2390</password>\r\n      <groupid>19</groupid>\r\n      <triggerid>14251</triggerid>\r\n   </zabbix>\r\n   <asterisk>\r\n      <webservice />\r\n      <code />\r\n   </asterisk>\r\n</document>','1','2014-10-12 03:00:00','2018-04-21 08:45:10'),(3,'FIPECQ','FundaÃƒÂ§ÃƒÂ£o de PrevidÃƒÂªncia Complementar dos Empregados da FINEP','franklin.farias@vert.com.br','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<document>\r\n   <servicenow>\r\n      <host>vert.service-now.com</host>\r\n      <user>franklin.farias</user>\r\n      <password>Fks@2390</password>\r\n      <sys_domain>fe4fb8450fc30300cb42c2da42050e7d</sys_domain>\r\n      <tables>\r\n         <incident sysparm_query=\"stateIN=6,7,8^ORDERBYclosed_at\">incident</incident>\r\n         <request sysparm_query=\"stateIN=5,7,11^ORDERBYclosed_at\">sc_req_item</request>\r\n         <problem sysparm_query=\"state=4^ORDERBYclosed_at\">problem</problem>\r\n         <change sysparm_query=\"ORDERBYclosed_at\">change_request</change>\r\n      </tables>\r\n   </servicenow>\r\n   <zabbix>\r\n      <host>10.61.231.133</host>\r\n      <user>franklin.farias</user>\r\n      <password>Fks@2390</password>\r\n      <groupid>37</groupid>\r\n      <triggerid>14251</triggerid>\r\n   </zabbix>\r\n   <asterisk>\r\n      <webservice />\r\n      <code />\r\n   </asterisk>\r\n</document>','1','2014-10-12 03:00:00','2018-04-21 08:45:26'),(4,'PROGEN','Projetos, Gerenciamento e Engenharia','franklin.farias@vert.com.br','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<document>\r\n   <servicenow>\r\n      <host>vert.service-now.com</host>\r\n      <user>franklin.farias</user>\r\n      <password>Fks@2390</password>\r\n      <sys_domain>ba0746730f7a32004fe186ea42050e00</sys_domain>\r\n      <tables>\r\n         <incident sysparm_query=\"stateIN=6,7,8^ORDERBYclosed_at\">incident</incident>\r\n         <request sysparm_query=\"stateIN=5,7,11^ORDERBYclosed_at\">sc_req_item</request>\r\n         <problem sysparm_query=\"state=4^ORDERBYclosed_at\">problem</problem>\r\n         <change sysparm_query=\"ORDERBYclosed_at\">change_request</change>\r\n      </tables>\r\n   </servicenow>\r\n   <zabbix>\r\n      <host>10.61.231.133</host>\r\n      <user>franklin.farias</user>\r\n      <password>Fks@2390</password>\r\n      <groupid>0</groupid>\r\n      <triggerid>14251</triggerid>\r\n   </zabbix>\r\n   <asterisk>\r\n      <webservice />\r\n      <code />\r\n   </asterisk>\r\n</document>','1','2014-10-12 03:00:00','2018-04-21 08:45:43');
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cron_job`
--

DROP TABLE IF EXISTS `cron_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cron_job` (
  `id_cron_job` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `execute_after` timestamp NULL DEFAULT NULL,
  `executed_at` timestamp NULL DEFAULT NULL,
  `succeeded` int(11) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `execution_result` text,
  `ind_tp_cron_job` varchar(10) DEFAULT NULL,
  `ind_st_cron_job` varchar(10) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_cron_job`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cron_job`
--

LOCK TABLES `cron_job` WRITE;
/*!40000 ALTER TABLE `cron_job` DISABLE KEYS */;
/*!40000 ALTER TABLE `cron_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `domain`
--

DROP TABLE IF EXISTS `domain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `domain` (
  `name_column` varchar(255) DEFAULT NULL,
  `desc_code` varchar(10) DEFAULT NULL,
  `desc_status` varchar(255) DEFAULT NULL,
  `ind_st_domain` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `domain`
--

LOCK TABLES `domain` WRITE;
/*!40000 ALTER TABLE `domain` DISABLE KEYS */;
INSERT INTO `domain` VALUES ('ind_st_ativo_inativo','0','Inativo','1'),('ind_st_ativo_inativo','1','Ativo','1'),('ind_tp_profile','1','Administrators','1'),('ind_tp_profile','2','Managers','1'),('ind_tp_profile','3','Supervisors','1'),('ind_tp_profile','4','Users','1'),('ind_tp_notification','0','Tarefa','1'),('ind_tp_notification','1','NotificaÃƒÂ§ÃƒÂ£o','1'),('ind_tp_notification','2','Mensagem','1'),('ind_st_notification','0','NÃƒÂ£o lido','1'),('ind_st_notification','1','Lido','1'),('ind_st_notification','2','ExcluÃƒÂ­do','1'),('ind_tp_cron_job','01','Uma vez','1'),('ind_tp_cron_job','02','A cada 5 min','1'),('ind_tp_cron_job','03','A cada 10 min','1'),('ind_tp_cron_job','04','A cada 30 min','1'),('ind_tp_cron_job','05','A cada 1h','1'),('ind_tp_cron_job','06','A cada 2h','1'),('ind_tp_cron_job','07','A cada 12h','1'),('ind_tp_cron_job','96','DiÃƒÂ¡rio','1'),('ind_tp_cron_job','97','Mensal','1'),('ind_tp_cron_job','98','Semanal','1'),('ind_tp_cron_job','99','Anual','1');
/*!40000 ALTER TABLE `domain` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (9,'2014_10_12_000001_create_profile_table',1),(10,'2014_10_12_000002_create_rule_table',1),(11,'2014_10_12_000003_create_profile_rule_table',1),(12,'2014_10_12_000004_create_user_table',1),(13,'2014_10_12_000006_create_cron_job_table',1),(14,'2014_10_12_000007_create_notification_table',1),(15,'2014_10_12_000008_create_client_table',1),(16,'2014_10_12_000099_create_domain_table',1),(17,'2014_10_12_100005_create_password_resets_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification` (
  `id_notification` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ind_tp_notification` varchar(10) DEFAULT NULL,
  `notification_time` timestamp NULL DEFAULT NULL,
  `id_user_origin` int(11) DEFAULT NULL,
  `id_user_destiny` int(11) DEFAULT NULL,
  `subject` varchar(255) NOT NULL,
  `body` text,
  `ind_st_notification` varchar(10) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_notification`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification`
--

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset`
--

DROP TABLE IF EXISTS `password_reset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_reset` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_reset_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset`
--

LOCK TABLES `password_reset` WRITE;
/*!40000 ALTER TABLE `password_reset` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile`
--

DROP TABLE IF EXISTS `profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profile` (
  `id_profile` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name_profile` varchar(255) NOT NULL,
  `ind_tp_profile` varchar(10) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_profile`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile`
--

LOCK TABLES `profile` WRITE;
/*!40000 ALTER TABLE `profile` DISABLE KEYS */;
INSERT INTO `profile` VALUES (1,'Admin',NULL,'2014-10-12 03:00:00','2014-10-12 03:00:00'),(2,'Managers',NULL,'2014-10-12 03:00:00','2014-10-12 03:00:00'),(3,'Supervisors',NULL,'2014-10-12 03:00:00','2014-10-12 03:00:00'),(4,'Users',NULL,'2014-10-12 03:00:00','2014-10-12 03:00:00');
/*!40000 ALTER TABLE `profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile_rule`
--

DROP TABLE IF EXISTS `profile_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profile_rule` (
  `id_profile` int(10) unsigned NOT NULL,
  `id_rule` int(10) unsigned NOT NULL,
  KEY `profile_rule_id_profile_foreign` (`id_profile`),
  KEY `profile_rule_id_rule_foreign` (`id_rule`),
  CONSTRAINT `profile_rule_id_profile_foreign` FOREIGN KEY (`id_profile`) REFERENCES `profile` (`id_profile`),
  CONSTRAINT `profile_rule_id_rule_foreign` FOREIGN KEY (`id_rule`) REFERENCES `rule` (`id_rule`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile_rule`
--

LOCK TABLES `profile_rule` WRITE;
/*!40000 ALTER TABLE `profile_rule` DISABLE KEYS */;
INSERT INTO `profile_rule` VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(2,1),(2,2),(3,1),(3,2),(4,1),(4,2);
/*!40000 ALTER TABLE `profile_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rule`
--

DROP TABLE IF EXISTS `rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rule` (
  `id_rule` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name_rule` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_rule`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rule`
--

LOCK TABLES `rule` WRITE;
/*!40000 ALTER TABLE `rule` DISABLE KEYS */;
INSERT INTO `rule` VALUES (1,'Home','home','2014-10-12 03:00:00','2014-10-12 03:00:00'),(2,'User->Profile','user/profile','2014-10-12 03:00:00','2014-10-12 03:00:00'),(3,'User->Index','user/index','2014-10-12 03:00:00','2014-10-12 03:00:00'),(4,'User->Create','user/create','2014-10-12 03:00:00','2014-10-12 03:00:00'),(5,'User->Edit','user/edit','2014-10-12 03:00:00','2014-10-12 03:00:00'),(6,'User->Store','user/store','2014-10-12 03:00:00','2014-10-12 03:00:00');
/*!40000 ALTER TABLE `rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id_user` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_profile` int(10) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `login` varchar(255) NOT NULL,
  `extension` varchar(10) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `photo` blob,
  `remember_token` varchar(100) DEFAULT NULL,
  `ind_st_user` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_user`),
  UNIQUE KEY `user_login_unique` (`login`),
  UNIQUE KEY `user_email_unique` (`email`),
  UNIQUE KEY `user_extension_unique` (`extension`),
  KEY `user_id_profile_foreign` (`id_profile`),
  CONSTRAINT `user_id_profile_foreign` FOREIGN KEY (`id_profile`) REFERENCES `profile` (`id_profile`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,1,'Franklin Farias','franklin.farias','1000','franklin.farias@vert.com.br','$2y$10$srCpIyDqDBC1ofBU7tmHBeCZpMMcibwicFVwbk8vuYmjDdihzJDDK','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0\0‘\0\0\0K\ã\åi\0\0\0sRGB\0®\Î\é\0\0\0gAMA\0\0±üa\0\0\0	pHYs\0\0\Ã\0\0\Ã\Ço¨d\0\0\0\ZtEXtSoftware\0Paint.NET v3.5.100ôr¡\0\07QIDATx^\í{\Ó&E™\æı|„şıÿ\"¼h(Î¨ø® \ÊI\Z\Ã:¶.ƒ\n\Ó\ã(Œ„M#(h¯\Ú*\×e[]D˜^\í\Å\Ñn\Å\ëizf\'6b&6f‰\rcccşzö¾+ß®·\êªsVVf\ÖuGüº\Ş\çP•y\çu?™w^$“\åbÿ\æ\ä¯/0v\nG\nN§Kœ56Ág–¿\ß\é¾÷\â\î\ë‚\âve²É¶\ÙlE&K\ÆL|\"|Ø€0Ÿ4 \Ö\ç&\ê1ƒ{Æ½\ãğ,x&<Û\âqe²Nc¢™,:3=h\ì\Z.H\Ì\Ñcˆ<³.(‹ƒEñ\Èd{\ÆD=$2Ù¢f\Â\èzòYc \n\Ê\È\riHl\å\ÆD=$2Y03±C\ÏBÁ\Â?.¨ l\ÕSY‘1Q‰L6›™˜\á2~)c¬ÿƒ‰Ÿğ\Ê\Ze¾\í¥\Õ!\ËĞ˜¨‡D&óf&V®‡ñb\Â&–u¢Jf\ÆD=$2\Ùh31Â´YLQ\Åğ‰zé€ºB¡\î”CIØ˜¨‡D&d&8®—¡F> .\Õ;IĞ˜¨‡D&\ë4‹q\ÌHq½…\êu­`’€1Q‰LF\rR‰‚\ÆzQ0‰Ü˜¨‡D&\Û3\n¬ô\Æ\Ì\rQ>\ß\ĞJùˆŒ‰zHd+7—WNCô¾¢|\ÆD=$²•š5~¬\Ñ\Ğ\ì)17›KkM2&\ê!‘­È¬¡£·\Ù6\Z¢¾OÁ·\Ô+	hL\ÔC\"[Y£FB\\½\r\×+Q\â=€1Q‰,c³FŒ]\\µ*\\,|o·pG\Ù\ÆD=$²\Ì\Ì\Z¬KŠk˜J\Ä|QI÷Œ‰zHd™\Z§i–\Z¦±ß„*x2&\ê!‘%n\Ö±v‹½8D*ÀW\á³ZS2Ñ˜¨‡D–¨¡ñHV²*D*À‡HF\Zõ\È34¶¢Ñ±\Æ(Dª(Œ0&\ê!‘%bÖ¸\ã@·Ÿ5>á‰¯œ¡\×E0\à\ãÊ‘ô4&\ê!‘EnhL†’ã¸ü®7\×\Üş±\Í\ËO|Ÿş]A\Éö\ÆD=$²ˆ\Í\Z¦>*p\ä•÷{s\Ó;Ş»Áä¢¯ÿœ¾N¾¨h2bL\ÔC\"‹Ğ¬\Ñ`Ÿ*­\ãX€—>øô^\0‡ş\ìC\Ûk\ìµ\"h\Úo‹õ\È\"2k$Hk\åøÂ”ˆ\ã\Õ÷¤¯AA\ÛP¢½dL\ÔC\"‹À¬Q(A\×ıù]4ˆ¼\î\Ï\Ğ×‹\à(\Ñ^õ\È6k\ÊsD’\è,€\0‘hP~ÄŒ‰zHd™9?v\È\ÕpU„\ì\Şı5\Z<\n\"Q6´Ú™¨‡D\Ø\Ì\Ùİ´\\\ÖD \ßÁG‘\èX\å´_&\ê!‘4spÍ®J\0¬aA£\nz*\ìıb1V7[‹‰zHdÌœZIò„¨N\åm\ã\ÇO\Ñ\Ï‹²š$;õ\Èf6sdõ:„Æ›\Şu»¶?‰“UôF˜¨‡D6“™óª×‘0,X4Y[\ì3Dd\İa¢\Ùf«^G\â4­i[ °\ÏQmo„‰zHd\ÍU3¬2 m-CY\Ú7+z\Í4c¢™\'3\ç\Ä6$gK\Î*fh\0\Ø|‘}–ˆ\n´\Ñl¶Ca¢™3‡\Ü5´š<2\ŞğÁFo„øG\ï¾ssı[\ŞEEJ¨\'\Ú\ên\Ñ|“6&\ê!‘M0sB$\Êu:`¤`±D}L~\â\â\Û,øüñ›+®}K-H´¡†I¶›t‚‰zHd#\Í[‘h\È*b\Ê[’í‰¸\0^uùu›o¾u_ hC½¤@Nv+&\ê!‘0s8\rY%@yEù\Ğ$w9€€K/»ª÷–V¨\'G²CZL\ÔC\"h\æhZÛ‘\Õ-Ia¯cTxÙ«®\ìD¬\ØgŠ\è9V4ódŒ‰zHd=Íœùí›Uq\ï{\Ö9 C‚ˆÖ…$\Úx2y&\ê!‘õ0s(\ä;´00Aª\Â\Şw\ÕxS\0}‚ÈŞˆ´õ$ò\"L\ÔC\"\ë0s$ø”0L\ÜûôB\Ú@¹\á\í·\Ğ\ÏwhaaÒ \ÍG`õ\ÈZ\ÌH«\Ê‡	{Ÿ^HW\0ôo¯i¥a¬,ˆzõ:õ\È\Z\ÌG\ë;2 iEy×´\ŞKn¼•*¯½\ê\Íôó†±²\áD!\Ñõ\È*fÎ‚d¹\ÖwdBÓ¦ˆ]şúpõ›\ŞA¿°\ÏIMˆ.¹\ÎD=$²’™ƒhq`f0Q]\ëBşø-ıò!MCY}g}‰$ˆn\Ñ!õ\È\nƒcJ–guG[[˜°`\ÑD\ÓP–f4\"š \ÂD=$23sœß¡\à‘!L\ÔM9\n\äG†À¦öö6,’Z\Åù\"L\ÔC²z3GÀ4]\æ$\"q.ü\Â35A¯Â†±\Ğ3yÃ¡›ih{f±\ï¨~¾È†Å§ù2QÉª\rPq‘/¾ÿ±Î_qüT\í}8\×\ãº7¿“‰.ğ¾\êwŒ\İR^$Á¢A„‰zHVkVñ‡+ 2\ãeùòVÔ›z€\Í\Æ:ôg\Z@\Øwi=Hö.d%¸1Q\É*\Í*\\k<V\0zNØ›’\Ü\å÷ ·€\ëc¨®PW\"},²V„‰zHVg¨\èJÅ‹LÁ\ZL±u\ÂÎ†—@yˆ	A×¦\İ×¿i\ß\ç+‘¾\Z‚&\ê!Y•¡‚+.2\Éqˆ7†”œ°\ãL²°;^}\ïÉ½÷`}®M	 \Õu!\Õ^Èš A„‰zHVc¨\ØJE‹ŒA\Ş\â] \0³«œ°;\Üt^\×û\0S¨~OõşD\Ö\"L\ÔC²\nC…V*Xd‚„»\Z@X/=„\ê\áSS\Èe¯»~\ß\ç\é˜\Û\Õ$ˆ0QIö†Š¬T¬\È7| \äUqg½7t\å˜\Z@@yK[š¬’Ùƒõdm¨ÀJ…Š€YON¸ÙŠò¦\\H™+\ßø¶\Úû†RTl½‰X³&\ê!\ÉÖ¬\â´\Îc…”\á iKô0\Ükc¶2©R\Æ\ÒT\ŞU3\ÛbC&\ê!\É\ÒPa•\n+¡\Üû\0lT§\ÚVñ@0\Ë}\È\ê™%ˆ0QIv†ŠªTœ\Èô:c¨PM¢—i\Û\â¤\í}C(o°ˆõ XùiÃ¸_\Ü7{‘-ŞƒõdeVA»•\n\â‚fZaUYø«´–Lw O\Â\Ş3\äR\Ø\ç;pÿx<\í«À\ë.¾L\ÔC’Y\Å\è<ÁôW$ ·6œ.\Ø\Î-g\ÂªSmè™°×¡\é;\ÚÀs\âyñ\Ü\ê¥d‡\×óD˜¨‡$C…\Ã*L$\ÓŒ®\ŞE˜¨—a\ïñ1…\×\Ñg\ÆW\n(\Ù\á-ˆ0QIòf¡3\Ì{Q!/€Ğ±`SC&\êe\Øy\æ\Øx‘½v,m¹–1 œP^Zœ˜4^\ÎXg¢’ä­¨VA\"b4|õ2š\èÓ“`»ôú\Ê8º¦O\å‡rÔ™#Ir¶±\Ñ\ÆD=$I›U€\n&~1\Ï4\Êô™Š[bÂ¬)öº)t%\Ò}rE2^=“¤˜´Ğ‰zH’5+ø#•Š‚1{ll8&>•¾Sq\Ë\çw`}{\Íš\Î\"™s¡Ü•3I‚#…¬\r6&\ê!IÒ¬Àµ\Ö#rğ+kª{L…b\ÈL*7w\Ş@ «\Ş_(Pş\èõ©W=£Öˆ0QIrf­Wƒµn\'\Ü%AP`b\Îp=„¶)¿SÀ\çV\ïo	Ğ•+‰–Q3³˜¨‡$)³ÆŒ«sE‹ˆ@\àğ=‹j\nM[˜0 ğs]•a÷¸¨\'õH¢\Ú6hfõ$eV¸§K…-\"À\rU1¡ZŠ>\ÓwC\Ã\îsiPoÊ‘D\Ç\éB\îzõ$cV°\Ç*-3~–\Êq´1wobsN\å\ê\Ï\é+¢\áX!{\ÆD=$I˜¨ö¸ŠŒ£/1«ª1ö>@¬ÄúT~$*vùk5&\ê!‰Ş¬ •4üZe˜E\åk]\ßà¾°.+\ß\ËÓ†c½Lıeõ.‚\Ó+©\ÎD=$Q› ¶)‰ˆ˜r˜i…T±.pß¸<Gy\Û÷¥A=³úÁ\é\Üî„‰zH¢6+<­4\0$Z—²\Â~ÁCtqP\ä\ÔÁs¹\Ê\ÒC^˜Š­{´®Tg¢’h\Í\nNyX*x@@ñ\ë|®µ©°d@A½+ˆDAc>„‰zH¢4+°†òjmò\Ø3j\Èú5‚òA9…Ê£h8+\n …\ny\ÜgL\ÔC¥Ya)\ï\Øƒ‰Š/0\î^†\ï\İo\×zg(¿¹ó\'˜®\ÍüC…\î\Ü\ËD=$Ñ™”6IŒ\0¬,gb2y@y¢\\\ç\ê™\è¸\İ(¨mº\ÈD=$Q™\ĞN¥À\Ä`\Ü\Û\ç–\ë\Ø\Ø\Ã.k\Ïg„\åŒòöyüùŠÎ¾3Õ™¨‡$\Z³‚\Ñ>W‘€!&\"CA\â7\ÆU\ák\å\ïkˆKkD¢`\ß~YL\ÔCY¡h«’H˜\ÚûÀº†T\×f\ä\n\êc\êL.õB¢ao«&\ê!‰Â¬@4t	¯8~ŠŠG8”Ûˆ\Ô;¾/Ê…D\Ãv(‹‰zH7+\r]EÄ˜³<ğ\ËVù´\Û#Ñ´\Şh\Øe1Q\É\âf… ¡«H@òœ‰F˜ñ£uiƒÉd;ö\Ëb¾#\áõ,jV\0\ZºŠ$I™h00\Ë\'\×-E\Ö\êõ\Éê™¡dzTì›•µ\Z³\×\ĞUdô¾Â¯U%\Èó½\É>½\rcEÅ¾YY«1{h-Œˆ>\ÃW˜ª^G\Ş \É\Ş5\íW\ÃX\ÑQ[`˜µ\Ù\ãŒVb!ºf_a†•‚\Ç:@=w%\Ø\á/Ì\Äb,\ä5³‡\Õ\Ù\æ‘\Ñv\Ö‚\Z‘7¨w\æ\0û¤1?‹1\è,õd\ÍôP\åÁE4-Äš&.b4\rga«w\æGbQ2›§\Ù\"q®m\Ú#\ã’\Ï=IEB9úoÚ Qg…D´5ß„º=œ\Ö|D\È+\ïyˆ\n„\n\0?`ş¡<H”\ìms’•Ùƒ\á(öÀba®ü‹\×\Ä§\à11\ëşPõ\åA¢…>•´\ÙC)q)\Õü†,˜ˆˆõ‚¡¬\ê\Z\åA¢%¯„º=VœG\ÊE_ú\Ñ>Q\08˜ˆ‰ˆX7¬\Â|JDA>+\Ô\ía´\â<R^ş\É\Çj¢ Ä¹``‘a\ÕW´;o´œ+\ä7m³Ñ´İˆ©¥5¢\êVğ¯¾÷$õ+iO\ëµĞ´\İ\Èy\Ãû\ï\Ş\'\Ú]W´\İ{\Ëş¢}±¢&\íi½vó\Ú\ï*r½ó{b€$)¥y\ÍWo\Şı\î?\İ\ãó\Ç\ï\Ü\Üu\Çûö]cï‹òı\ã™À\í¸e\ï\Z›½oIª\Éôknÿõ+\ri\î“e7®\ŞG\ä\\øµ\çö„\0\Ä2|u\Ío\Ø|â¿\Ü<ñ\ã›ßŸ{x³ù\ç¿\é^û“\Ç?¿y\èÁ£[!\Æ\ç°\Ï\Í[\Şö\ÖmÀ\Ã}\áşØ½7gB9 <by\ê0ó-\riöBì¦µh0r\0-Á\Ò\ÃW\Ù\ß>û*¤cù§_<´yì¡oJ¨_ôø<¾wH\0\ì>›}o(ª\ÃX;_9CıKDCZ½»a-\ZL€\ê\nt&!€ B\è™`ú¿\æ\ç`|>û^ß ¼0\Ì\Å\îcn0ŒUö\Í\ÄJ‚t\ÚÍ¨Ü¼ˆò¬%6M„\à\Òñ\ÅACT\ì»\æ½œ%r%\å\í\Ş\áGÌ¿DTœ(\ä9n³U\ï#\Ê3°B/D^À÷ğ\ÎğŞ§ğ¢7À¾\'ö)/*Ô–&\É/\ÄnR½D¸\æ=½\'!7N\\:x80\ë‰\İ\ßPˆB\rÁ5òD¹²û›k\ì|G3±’!\î^ˆİ z	\á¦c†œ¾Kğpø\İPy.\Ğ	9œ\åöRcş%¢$\Ş^ˆİœz‰p\á\Ù€Pùˆ›\ïYVS™*ºK\ä=\Ú@0c÷9\å<ó1%qn÷n7¦u	ñ\ÒOŸ\Şkü¡ò2b¢·4cEk3\Ø\ç-\r¦,³ûõM9¢Ã¥’!\Îu!vSZu\åM1\Í\Â\'Hò2±‹‘!=\Ì~bŸ\ÈÇ°{öM9¢©¼I×º»!õ>\ãUw}i¯ñ3qğM¬½2}\ÖV\à\ï±\r\Ã1B,6,¯Q\0IŠ¸z!v3\Úq71\Ü\Zœ{\Î\ÄÁ7K\ÏR\Z‚…ÿN!p8B\åB\Üy\éZ’ñ\ì\Ôk7£ó>\ãµ\ï¿g\ÛğC\ìûğU®°ºğ\ÛK$9\â8/\ÄnD½q‹C$\Ğñ	œ˜V¾q‰t-&L’\İBÆ—3»	u Xü…†\"®\0²¬.|ƒ\r8\áGZL˜$Ën7p°rC\"\Üş\Ç\×*€,«\ß`¤9X\Èyx³/\×\ÂÁDAò3\Ô\nt¬öf\'\æ…\Õ\Å(€$\Í2Û›\Øk\ênÂ Ñ£\Âa˜À‰ùÀv1¬\æ\03ù´I²,3¥×¾ôp\é&DB¸“C@\ÈDN\Ì¶\Égõ0n8”ùšH‚Ã…¬‡3ûRM\İM”\ßÿ‡U\è˜A\Ãa˜È‰ù@\ÜL,\æk\"	\ÂN\éµ/Ü©Ü€H@p4)„9`\"\'\æ#d\0ÁTp\ä\Ù)\ä}~³/Sò<a\ÜFŠ!¦ğ:˜È‰ù@ÜX\Ì\×D2„I¦\Û)y8Ø·\rş\ÒË®¢‚\à­D\ÏD;ò&M˜dº}‰V\' L\æ@\ë@\ÂjG^üI*&\ÏüûcÙ—œ­|©Hl\åòBe`u1\n Y0\ï\ÊtûY›¯øğç‚®‰õ\à¥\Üau1X¢\0’óyk®C£2 t\0‰\í\Ø×µ€«9€?)€dÁ|‡MÙ‡k\íG €„\\D˜\Ò9\Z9«9P\0É†yÖ„\Øk\ã\ÄL@\0	µˆP3°–#Ô¡R\à\Ê7¾M$üo°hz¬ò%\"QB²\ÍpV/¾?)€dÃ±Böı™}¨†¯2$\ÄAR/l\êÇ„M„á±‡>N\ë\Æ7\n Y\áw\Ë>P\ÃW\02÷*ô\×\\qµr‘p\×\ï£u\äü Q\0\É\n\ÃXöa\Z¾Êˆ9z,,dcb&–=‘9geÁŸ@²\Â\ß0–}˜†¯2\â\Ò{¿\é-€@”¬e¢%\âù)ôY½e\ëO>MıM$‰Ÿa,û \r_e~)ú Zß‘>$81’\Õ\ï\àO\Ì\×D\ÒL_Th¢ƒ£2\ã\âOš¼‘\"†D˜ ‰ôÀD‡©A\ä\å×¼úšHš\éMÙ‡h\ï«\ÌÀy Lú¢G~`\ÂÃ”\á¬Kn¼•úšHš³EgöØº}°H˜)D#\æ~°:\ïƒH¶Œ\ß\â\İŞ¬­\Û3dJ\0\Ñìª¼»ğP$[\Æoñno\ÖÉƒ™\ÂD L\Ïe¢#òa\ì\ÂÃ\ÃwP?\É3ş¤B{³N\Ì&]¨÷±\ÆôB.¾\í\êg\"y^(\ÂÁ0³7jún\Æ0hC½õ€õ!\Ì\ÚP\0Éš\á«\Ò\íMš¾›1/¹\îTšÀ\ÛLlD~ §\É| ‹}ƒú™È‚\á\Óy\íM§+\"2IO&i0¡ù2t]&f0?Y0ü¨[ò!\"#ôdBÀĞ‘´\ëc\è0Ö…_x†ú™Èƒ\",ô3{\ÃNõD^`Ìš	C{]­Y2_h‚ù˜ÈŠ\"<t›½XgŸgÆ¬™0”ÿXCòi\Ì\ÇDVô?+\İ^¬üG\æ¼øÓS1`(€¬!\ä’?¹ú˜ÈŠşy{±\Ö¬\0&mœ¸>†,(\Ô\ŞU\Ğo=ˆ½P\ë?VBß™X:\×|}I¢k\Öj\è^b/\ÒúL¹şÑŸn?ıø\æ‡?ÿö–‡ş\Ô\æ]‡ß¾¹\ìòö­İµˆp}ô	 7½\åÍ›;?xË?Á·\àc\Ì÷Dt¯±iÿ«Ì¸ô[\Ïoø¿şıWyş‰On>û‰Û·¢P\n\íÀ»>\Øñ·W_wıæ¾şù\æ¿}ó\î\Íÿ~şA\êG\0¾Ÿc¾(’¦{_,{‘\Îÿ\Èü\"ü—\ß}6ô&şÇ?»\n\×3Á¢2&2\"_\\\0ÀğƒùJğ9õF²£ı|{\Îÿ\Èü\nü\Åóß¤\r¼ø•‰^	„„‰Œ\È.…ºo\ëit\ßSO$/ŠPÁ\Í^ „1iÖ°‡‚\0‚cO™Ğˆ<A3_\n|ù¦H–\æ…öG- \Ìüò:t\Õ\ÄDkAÖƒ\ÛL‘ù\ÂP\àƒ\ê…dEs\"\İş¨z&|ğñ\Ğ=ˆ‰¶3Yn!ó…1À™Š$iN¤\Û•@Ï„\ïıôQÚ˜\Ç\01\ÑZõ€>|‘ù¨H’\æD:y±H”øõ¦y\íÈ»\Ü\Z\æc€/2iR„‹ıf\Ğ\nôŒ`\ry,­Yø±\à3€\0\æ£\"Y\ê+\Ò\í\â¡Ê‹D¢\Ü|\êm\Äc˜\èP©õ\àÖ€0_|’ùªH’\İ\"lœ7»¨X™0G\0LlD~¸\Ó™/ŒE$+\ê[»\ÛÅ“•‰D™+€`z\'‘®¾™/ŒE$+Na\ã¼\ÙE\ÍÀ\Ê_NP´$\Ü\Z\ß\ä\î\' ¾*’¤>‹¼H$\Ê\\\ä¡R\ÑùP>HŠù\ÂX´\"=/Š°ñ³ª/\é\âs!p‚¢µ ùS>HŠù\ÂX´˜0;\ác@´VFÌ•\ÑT\Şü)Ÿ\Â|a,Êd\Çù=±\ì:D*#\æ\n šÊ›?·\àÑ‡ó{b\Ù?4…7#\æ\n €‰È‡òAR\ÌÆ¢\0’\ç§ò\Ú?4…7#.ÿö\Ïi#K9€üöÙ¯P\áyP®k\æcO2_\Ér~*¯ı\ãt\å\"qX#KYT4•7_p\æK¹®™/Œ…ù¨Hš\ÓEø\Øs•?Š\Äñu(‹Šfb\åKy\n/`¾0m¦˜%\çŠğ±\r \ì\"a~øóo\Ó\Æ<†²¨\Üu\Çû¨øˆô)O\á\Ì\Æ\0_d>*\Ò\Æƒ!_~ö{´1¡,*šÊ›/\å)¼€ù\Â\à‹\ÌGEò\\€\0¢5 ‚­#XcCYT\0‘>\åX€ù\Â´I¶\ì(€dŠÏ©¼eQ\ÚT1O°Î§\\\Ï\ÌÆ )¼Ù²\r :$SXcCYT€fb\åIµ™/Œù¦È‚C ZD˜)¾\éUa\ÑL¬ü¨\ÎÀ\Ì†¢z\ÖQ\0\É_yª°h&V~<ñ\ãµzf¾0\å?²f@NT.ŠL¸şÑŸ\ÒF=”ª°\à\Ä:&B\"]ª3°\0ó…¡À™oŠ,8†\0¢U\èƒE\\¬a¡*,€‰H—\ê,À|aZ@˜=§@2\Ç\Ç0VUX€ö\ÄÊ‹\ê,À|a\Z¾\ÊÜ¹ô[\Ï\Ó\Æ=„ª°\0¬ZfB$Ò„\Õ1ó…!À÷˜OŠl\Ø…9\ß:sŠ6ğ¾0q\ÑL¬|`3°\0ó…¾À\ç˜/Š¬8‹\0\Âş 2b\êö\îL\\´¥I>\à¬{V\Ç\Ìú¢\í\Û×\ÈJ˜²7—\×\\q5#‘Ÿ¸\ç/i3_\èƒö¾Z\n +\ã\Ñcgd1q\Ú\Ò$\Ø,À|¡ø˜r\ëAdEŒ\İ‹‰À\â3&H\"-X\İ\æ]hß«u¡\0²2\ÆL\ëe\â”HOL\Çfu˜/´¡i»\ëCd…•\Å\Ä(‘>\ÕC¤\Ê0_hB³®Ö‰\ÈJ9şô\ãTL\\€\é\éÓ”@\Ìğ%\æc\"@VÌ­\ßûa¯³Ó™¸8´\"=m°¯«WÀ|¡|>\Ä|K¬•ƒ3ø\ÙH˜¸8´\"=mX:˜/\0ø\n|F³­„ˆ\Ø1@”!\Â\ÄÅ¡­\İÓ¥iº£\êğ\røˆ‡p(€\n¶\áÆ”\ÌNœ¤\â\â\Ğ\Ö\î\éÒ´İº‡hKvÑ„ˆh\å\Å÷?FÅ¥\Ì\ï\Ï=LJ\Ä\Í\í¸…Ö§u\Ï|B‡ˆh¥O\0ImA!V\Ğcø\àW8Ö³”Áôd·úZ\ä€\Üg¥H1‹Õ§CDt¡\0\"Z\é@0”	\Ô\Ò`†\Şv\æ\Å`X\Ï\×·|i[@\è¸ø¶¨O\áP\0­\\üW\'¨¸”‰%¡F\â\İõ\ë:4^˜p€€CO¥m¡CDt¡\0\"Zˆ0q©²”(\â{4\Ú\Ö3\Ä‚Ü’ÁÁŒ\İWÑ…ˆh¥o\0	Ao£\ÆzJ\ê\n=\ÌÕ§‡¦\0\"ºP\0­ô\r ¡ò ¹*.„\è‘ô\É\0Ñ…ˆh¥o\0Á?+Ÿ`¨*¶Ü†oPs÷\æº\Ö8@D\n ¢•‹>Ò¾½\Ì\\\Ã0øUŞµf!7\æ\ì\Ñõ-K\Ñ\È\Ù\êE!}¦ñ:ğË–	\Ö”RKûS\ç\Òb\ß\ÅP\0œE\09]¹(\ÄC~\Ù2Á\Z\Æ\ês²\êÁ\ÓgÁğû†ˆ\è\à´ˆheH\0¾\ÄŸ³ö\à\áğD†L@P\0(€ˆv.ü\Â3T\\šğ‘\0†X®uØª	?+«¡	\Ê\Ú\ÊDt°\r \'*…\Ø—& PSƒH\Ót}€i¾¬¼ú2´\\@D\Ç@T.\n±—\î^K¦±b\×wŠi\Ğ\Â&‰1\r¥\á~X¹µİ˜Yl/ş´ª­Q\0\\r\ã­T`º:‹\â\È>g	\Êy‡˜’ù¸\ÜOµ\ìšÀk\Ç2_¢\Ä6€ª\\b;‡\ï \Ó^Ÿ\é½1‰4|S„\Ø7\å\à\Öş^ {/¬\×\É|Aˆ‡@v*…\Øf\ãP‘\0VX7m\Ó\nó¶|¸÷X4¢¼\Øp\Ö\Í pL-Oô:™/QbGDt2t*oø_ù!\Ï\è\è‚\Û7ùSÀCù¹²ô\ÙCÚ¹õõ!Jl\È•‹B\ìc\èTŞ”@ ³‰a®›::°…\ró!J\\ğ\"ùƒûx\É\ëo¢B“*øµ\Ä\ĞÀQ\Ã^±ô¤|¡X¢‹mğ€\Ù?\ÎUÿ(D™Kş\äv*4±^Au–‚òò\ß|Rıjp\ÂY*›B2¢Ä¹\"|lˆV£‹V†\ìÊ»HÒ—;VbZ\ë\ÂP]ô\àt>¶\äd\åB\ì#ö<ˆ\ï\ç&\æ!/œƒ\Ï|@ˆ\'‹ğ±\r ZL(:‰92u›&¦\æHš@Ş„=G(ÿ!zp¤\Û\0r¸òG!j`j\'œ˜\ë\0&›C20\í–=\Ç\Ò\àG«{!*.\Â\Ç6€h-ˆ\è¿L™\è\Ä‚ˆ\Ï$9fXa¨‰ım.\És\"]\ë?DOvŠğ±\r *‚’\Òt^·`\Ã[Cör8¡3<†ZL‹%û \á+Ñ“Eøøƒ‘Q	V&<)\01\ïHª‹û\ÎğB#\Õ5!\Z¾})\Â\Æy³‹:]t’úªt¬<o\"¶j\ZbB¢-© \ÃŞ—\nš}%zr¶\ç\Í.j*¯\èÅ”\İyc€m_‚ ‚\0ÑµÇ•{/{/ş\×\Ø\ëS\âÂ¯=G\ë[ˆ\n\ç§ğ:³‹š\Ê+z\á{sE±<øQÀ\êZ\Âù)¼\Î\ì\ân\åEB42ö)\'šdõ,a·\ç\Í.¬¼HˆF\Ô\Éõ>\Ä@ac¿‘\nÑˆz!y Ş‡B.\êf\ÔL,Ñ›\ØŠn\Ôû©\ÏÀrf<Qy±­Ä¼½‰\è`÷ZÍ¼C9Q„‹º\Ùµ\'–BDJD\Ö}ˆœ\ß«jöG\í‰%sÑ±oPñ¢3?\ÄH\Î\ïÅŒ¼AˆNR9±PºR\â\\Œ \Íf/R\"]FCYé ¡+1’\æº3{‘\ébZ?\è)²º¢\Í	tgö\"%\Ò\ÅhRŞ­7w^r\İ;4\ëJL¡9\î\Ì^¤\éb©o¶˜%»\×\ê¬1¾½jö\Â*obøµK…L,†Y=	Ñ“Šğ\Ğmö\âÓ•71•(ˆ\ÄÁEù*­#!pº\İf/\Ö\Ö\îb2\n\"Ë£\à!<Q\ßÂ½\É\ì\ÅZP(¼  ²\n\Â#\í«F>@ˆQ(ˆ„GÁCø¤ı\ÍŞ¤<ˆğ†‚H v¯Uğ¾\éŸÿpfo\Òz\áMñM\ÕóĞ½ş£jö&­³pñmp£A\ïNû[‰™\è·ş£jöF­³°\İÁW{gy½:ô\îX91‘ş\ë?ªfoÖ¾Xb6ğ‹Yy‘	(\ß!\æ§{ÿ«&³7ª|˜\ŞÑ\Öpp‡†¬D\0\á`¸Ù›/¨|˜³€\ä¯z#=°^‡¶c¹ \ã\Ì>@çƒˆ`l{#ÊP°»z\" \İ\çt™}ˆ¦óŠ @$5\İ÷</yıM\ÚQ,Áğ\é»U³\Ñt^±MŒõ3Q]J’‹e7}·jöA\ç*,D0H^yÓ»¸\È\æò·= ©¹bI\Îò?\İ\ìÃU>\\ˆ \ÜúÓ›‡¿ôW›·¿\í\Í\\t3\àÊ«®\İ<p÷{6\ï8yŠ–9V\Èÿt³\Ó0–X”«şË7¿ú\Û{· ¼ÿ=7SN‘\ëo8´ùüı\ï\ß{><++!\âgøÊ™} †±Ä¢8u<õğ]›»\ïü÷\Û_\îL˜c\æU¯}\Ã6~÷?\İQ{.ö\ìB\Ä\ßğ•3ûP\rc‰E9uús5±uü\Ç\ÏüE½’w~ë¶·ñ“Sw\Ó\çÀ3²g\" ş†¯œÙ‡jK,\Êgÿ\ëCTt\Ë@˜!\Ğj&\àK€¼\rr\è1±{.ƒgd\Ï.D@ü_9³\Ö0–XŒÿ»›\ß<y\Ş&\\\Ï$\ä0—j\ëi4q\×c\Ğg\"ş‡¯œÙ‡\ë¬t±7Ÿ:³ùıo¾H…·\è@\Ô}|z<\èe°œ\Æn|øiú\ìBbú\âÁ&³?Pù2!‚qé·\ßü\ë\ßuó/¿hÎ…½\Ì\èB\" \Ïa¼¯\Å{Ğ»\é3,5„—}\ã—ôÙ…ÄB\î\ç1û\í%‚s\É7¶y\ßS÷m~\î‹^ƒH,e\Øk|ó‹\'mŸ\Ï\Ê\Ê@ˆ™™¾÷U—Ù—h‹w\ê\Ñß¶ù\Ü\Ïß¶ù\æ/o\Ù\"ÿó\Ìq*\Ä)‚\àñõŸ\Ş>#UAD,Àø­\Ûûš}	¶x\×I…\".x8¾ü‹·ù§¿ût6A\ä\ÌSwm¾ø³›÷=#™•…3MŸ¶u{_³/\ÒI…\"\Ò)«#— Â‚‡\Ï\Î\ÊDˆò\àP³/Û©|¹\Şi\neşûo\ïI6ˆ<ñ\Ì\é3•Q\Ø)\ä=Œ\ÙjMˆ˜>Á\Ã\á‚\Èÿú\Ùg©P\ÇHŸ\à\áP33\ßÚ&³/\ÕASb†\Ç\ã¿:²\r\"s\Ï\ÎòÁ·Ï¼—>C\n\"bF\æ[û\Ñdö¥J¦\ïŒ	DşÏ¯¼b=c‚‡CAD\Ì@¸\äy\Õì‹•LŞ˜<nš/V¬Ÿ{ú~*\âKP¦;\á™p\ÉóªÙ—kƒE\á…?ış\ç©`Á‘ÿ÷w_‰\"¹\î+x8PV¬…Á<\'ö5»Ó•b¯xøGT(§P\æ‹\äúRCZm\Ót§€2ce)\Ä\0N2¾œ\ÙM\ìVnJ\nD\ïŠG¿·ı}\Ë\Ç7w>û\á\Íñ\ç\ŞI\Ò\å ²Ä\Ö\\ÁÃ²C¢,Q¦([1€\İBÆ—5»M\é[°„\ì†\ïÜŠ\Z®º’<4nš/ø\ç\ç>C\Å\Ş7C¦\é\Î\Êü\È\Ó\İ\Ö\êu¢\íQD‰ğSw›\ÌnFûc­Œ\Ëyr¯7\Ä\îÜ½‰©”ƒ\Èÿı\í—6ÿğ\ÃOR\á÷Á\ÒÁ£\r\×kA¹^\ê’Õ±Èšù÷½\êkv3šÒ›!®7ñ\Ö\Ó_¦717\Í\×ñ\ÂóŸ\ßü\îŸ A`,S¦\é.\r\êuŒºF«×’-\ËM\İm2»!6•(ŠkN=²{@D˜À\ä@5ˆ\0_Iö”ƒGğ	7$_\Ï0_Ip¤\íx\ÌnJ½ˆIm\ÈiN\Ê[\Â;0\åù‘1\Ä÷4İ”¨‰!¸hH,j\â\ë}8³;VºQ˜rO\Â\Írº\ïì­´\á¯D\Ø¥\ï\ĞÖšƒGğ=ø ›%¦K+\ä:>³›Ó‘·p=	)¤œ“Xšò4_¶Di[ˆ8÷4\İ\Ü)\ÏS`	Æ¼G\ÖN5»Amo\â$215D1® 0¼…^\É?ş\èS\n3‡¯+y?\Ëm[\Ò\×\ì&\Õñ~•al™54\á—ò4\ß6L\Î<÷ú\Â/ğ}õL¼w\ïÃ™İ¨z!À/0\å.\Â\Ó\'ˆ\à5\ì½b>\Ğ\Ğ&X[½‰¿÷\á\ÌnV½`\î½Ç²°i¾ü½G„mù\ÖvD\'iô>œ\Ù\rkFVO\Ôãˆ‹\ç~ó\ÑZğÀ5öZõHßº.³›Öº0¾«YTññ\Èó\ï­\\c¯Ë¶£I\'ñ®û\è2»q­N\'`†‰’\ãñòõ_®\\c¯Ëƒ¶¤Y[¤\×ûpf7¯^H,¦Z\ë\nğ”(/2\Äÿ³×ˆx@›B\ÛbmnÅ¤\Ûûpf z\rüB\Ò:tø\Ç\ß}r/€\àÿ\ÙkD| ©7²G<;\îN1{UŸ¢^Gzüø\×½@ğÿ\ì5\"N\Ô\Ù\ÏyS\Íf§òp«û\01\'qSÎ«\é»i‚¶\Ç\Ú\äJ\Ø)\ä7³Z\Õ\Ù\é8ZT3¬\Ò›-º\0‚ÿg¯ñƒ6¸\Âc~—?\ëÜ·\ÙC­fq!¦j\È*}\\\0aé€¶¸²\é¾i-\Z\ìkö`\Ù/.\Ä\'\æ\Ä\"=<W=V²ø0\Ş\íÚ§š=\\\Ö\Ózµ¶#/°ú\\+\Ğóm”µ\İLH\Ún—\Ùf7­WSt\ç\ç\Ä\Ï\ŞJ¯\Ï\É~õ¡-\ìos²Ä³®‰Œ§ú\æ1m·\Ë\ìA³I¨\Ã•,÷„ó?œ½qó©\Ú\Üÿ\ìu›=õ†\Í=O^¹ù\è\ã¯\İş—½gN°}\É[˜”Ÿe€²@™ l\\ü€6›Y\É/q\Şdö°+Ÿ$\n\ãøôOŞ¼C\ãÇŸ¾z+’G¿ùV4\Ûø\ìs7\Ñ\Ï\Ë	<#{ö2(+”\Êeˆ²D™²\Ï\ÍdDòº³NzŸ,v\ÚzcÁ\ç°\ï\Ê	<#{ö¾¨\×2ŒL‚Hºû]5{h$Ô“\\¡®\àqüò=~æ†­`¹\Ş6û\Û\×\Ñ{\È	<#{v”{-¨3õZş@\âA$Ÿ\çC\Í>¹\êkVÁ/\Ù~ôÆ­ø@ˆ\æº6r=<{\æ¹A]º^\êu½†\á\Â2	‘¼Vœ5+€¤Ö†\ä<\ÊCN÷ş\àªY{cÁ/hv\ïCÁ3b¸g\Êğ\Şë„—ı}(x6ö\ÌK‚\çƒ/\àİ»÷@\Ûfm>bm6›-\É\âf…\ÌPV\ë< \0\Õ!§£=Ø±€{e\Ï5„²POD¼\×}À–Z=Àwğ\Üğ¥\\†\ÄZ\'Í¼€‰zH¢0+ˆè‡²p3s¸°4\ìO<sí¶¡/5\ä4+ö\Ü}@y”?\ËW\0Sz\"x¦òg¥ŒCY£Lœ?²ç‘D\Î]\ß]1QI4f\íPVŒÛ“\à\×^y†Sj=‰)Œıµòª~–\Ï\0ğ\ìµ]”{E9uş\n\ßEy\Å\Øs‰|Û“½\íJ˜¨‡$\Z³B‰r(\ë²GŒbcDŒ·£±a<ú\èJExş¡¹‹¦µ\ï\0†\n\"EuzùÖ·\á\ãSòR¾@›G\Ûgš°0Û¡«B6·\"¾$Q™LTCY˜•q\ß\Ù[©ƒ…ChX¬Ñ­™!¿ô\Ûz\0‚\ï\Z\"‚xö9k>?e¨\Òhû\Î\Ì\Ú7ëŠ‰zH¢3+ h.µ¿\Ä\İûœò¾À°²c´-`œ#€\0|\'{C?šA@[XªW\r`Ú°µƒL\ÔC¥YA­\\p\Şz:ü9˜{\Ä\ãÑ•gô¥¨t\å\æ\n \0u\É\ŞW\ÏÀ\Ş+öƒ6ò\\\"D’9[\È\ã>c¢’(\Í\n‡O-¶\í;N0™÷p=£\nƒ\è\Z\Æ\ê344g\0]\Ã0\Z¾\Z\ÚH\è	´`\áS\r¡…ô(&\ê!‰Ö¬ÀvK”;Ÿı0u¤9À\Êß£\n£h›…DvŸr;€\à\ÚVu¯eö•oP®h;¬L\ç\0šÀ´\"»…,ÖŒ‰zH¢6+¸•‚œPCWŸ©›®£&\"¬lñ\ë´o\Ù\Î@@[>\ÏÀ\Ş#ú²R‡C€60Í˜™…Rc¢’¨\Í\nS{ƒ\åCB]AÜª‹\Ù\ÄxØ”\Ù!\å\"€\0–išZ,†\"?²ÀP´¯õ„A&\ê!‰Ş¬\0qvH|\ÈÜ³® 8šY\å—jd\èŠ\îPTó!\ÊømkJ}ö!\à¬,h^\çL\ÔC’„YAÎ¹\â\Ñ\ïQ‡ñzóQÎƒ \×pt\àP\È\0‚{+ÿJVşc\æ\î@+˜†x¦1\ïQ6&\ê!IÆ¬@g\İ\êd®ƒ¦P®c^ ˜™3¦œC€{D\ÏC?(\æ\å<tG€¾@+˜†xdo«’.c¢’¤\Ì\nv–³\Ô\çJœC(*I\Z5¡ˆ\Ú^uˆ\Ó3&\Ôm\ÎD=$I™®÷ı²°UÁ‰s\rO¤Hş´M÷4c†mNö\ís\ÕÇ˜¨‡$9³öšT÷½M;\Æ^5d•\n \ë\0m\Òw^\Äó¶ï½’\æUc¢’$\Í\núP©\àG\ã»÷1WÍ²Jõ€¶\é3/\â¹r¨·A\ÆD=$Éšø\äM}ö> &G•\ïHu6:¥Î«x\ê…\Ô6I\ìkL\ÔC’´YÁ^©\î³÷¡ùü\é¢\0²N|%\×=ôBZWšwõ$oV£Vªûšy¥\à‘6\n \ë\ÅW™0#‹\î°;Ä˜¨‡$y³Jµİ‰u\n\é£\0²n|‘‘\ëB:·)\écL\ÔC’…YEš™\å\ãŒs<P\0>‚\ÈÀ3CFÍ¸b\ÆD=$\Ù*¤¨Vaû˜º]»‚G>(€05ˆ\Ø\î\İ[ğ€1QIVf\Óy¦:v\Ód\Ğ¼P\0©A¤\çN½û\Î4ŸjL\ÔC’Yµ®¹\å‰\ã´òû€9\äG5U7+@„m{\Ê:hÓœ£\Öz´õdi¨¨J\Å\í1v\êî˜^Eü(€ˆ2h\ãm\'H¶mašS\à=xÀ˜¨‡$[C…U*psÍ©Gh\Åw¡\íIòEDT™²\í	4¦ª;\Æ,Á\ÆD=$Y›UÜ¾…†\ï{\ê>Z\é]\Üûƒ«¨£‰ôQ\0´yV\ç]@cÊšcLZ(\ØeL\ÔC’½¡]e¾\Â9\ÌÁD(€ˆ&\ĞöY½·QÆš5xÀ˜¨‡d†Š3|%\È\Ñ\Æÿ(†±f0&\ê!Y}ğ™»N°\Ênc \ÚY7@DĞ€¡ùhM!;³õ¬Ê¬r{\å=Öˆ\èb`>$Xğ€1Q\É\ê\\©ğ\Z\Ç\Ï\Ü@I\ä‡ˆ\è4ù@… Á\ÆD=$«4Tt¥\â÷@wõ¨\Ö{¬\ÑhB\ÇPVğ\àc¢’\Õ\Z*¼\â\0[4tµ.@D_Z†²	0&\ê!Yµ¡\âË AX\n b\Ä_0&\ê!Y½™rÎ YW\ëCD\ZQò\ÙV˜÷5&\ê!‘™Á´`p(€ˆ¡0&\ê!‘f±k¼Pv‘?\n b Ğˆ\İB67&\ê!‘•\Ì\ã`\á \ÌqD†(€ˆ@¼\åÃ˜¨‡DV18ˆq¶p‘9\n ¢\'Ğ„¨‚Œ‰zHd\Ä\ÌQ.(†9’\È\ÑhÁ…<DeL\ÔC\"k1sš%\'¢\0\":Xtšn—1Q‰¬\ÃÌWJ±2­1Q‰¬‡™#\íJ®±\Ğ\ÖwŠ\æµ1Q	½(\ê˜C)¹.Dşl“\åLDzQÔ™c!¹®¼ˆy‚¶½M–3\ru\èEQ§l\ædÊ‹‘ûòLDzQÔ©š9œ\n‘>tq \Ó\0Q‡^u˜™\ãaH\ët\áˆBˆ´@Û¥\ë;˜ˆ:ô¢¨\Óf\æ„GJN)„ˆŸ#Eó¥\Æ4@Ô¡E.3‡ÄÖ¹’ƒ\n!\âm´sK¦¢½(\êô1sL\Í\Ò\"^öfYu\Ó\0Q‡^u†˜9©¶†\"\ĞmÁ\Î4@Ô¡E¡f«»\ËÓ˜(o3¦¢½(\êŒ5s^¬QoDˆ° Í\ŞËŠi€¨C/Š:S\Ìù€¡Şˆa@[;P4¿Q\Æ4@Ô¡EfN­Üˆó18\×\ÑdLDzQ\Ôñe\æ\àÈœ,^\á´)o‡>1\ru\èEQÇ·™³c‹x­b\ZhCŞ·^g\Z \êĞ‹¢\Î\\fÎU\ì\Z\Öbh3­«É§\Ó\0Q‡^u\æ4kH²kXKˆ~ ­LJ’w\Ó\0Q‡^uB˜5\n\rk	\Ñ\Ì,\ÃUÌ˜ˆ:ô¢¨Ò¬‘h\íˆ\çA[z>9\Ó\0Q‡^uB›5\Ì\Ö\Ò.¿b\í \rx›]\Õ×˜ˆ:ô¢¨³”Y\ãA~D4ŠµŸŸ5\Ï\ÑfLDzQ\ÔY\ÚĞ˜%\ÚE\îÌ \ïcLDzQÔ‰Å¬q!Ñ®mQDnÀ§ƒ$\Èû\Ó\0Q‡^ub34¶¢Ñ±\Æ(D*D8œ1\ru\èEQ\'VC\ã3”#©Ÿ.p8c\Z \êĞ‹¢N\ìfQ\Év‘‹&\Çû\Z\Ó\0Q‡^uR14Nã˜¡u$\"\à‹ğ\É\è‡3¦¢½(\ê¤f\ÖX±µ²],|>|\ÇTc\Z \êĞ‹¢N\Êf\r\ç(\á.B_ór.\ÇR\Æ4@Ô¡E\Ì\Zµ†·\Ä\\$7L\ÕfLDzQ\Ô\ÉÍ¬¡2\Ô+S*\Ü*c\Z \êĞ‹¢N®f½\ì7¤\\‰\è|>“Eoƒ\Ó\0Q‡^u\Ö`&nM‰†¸DøD\Ôk7|\Z\Ó\0Q‡^u\Öf&H¼+˜¬4’Nˆ1¦¢½(\ê¬\Ù  …(˜\ä\ÏjƒFÙ˜ˆ:ô¢¨#ûƒAX\nQ\Î$P—«\Zec\Z \êĞ‹¢¬n&8\r,\Ól®ô@¡\î\Õ)+\Ó\0Q‡^ud\ífB„•\ï\è`-€z\'ñ:Aİ ’[Ú˜ˆ:ô¢¨#f&R˜Œµ&\Z9k0Qó2GÙ£²n;—1\ru\èEQG6\ÍL\Ä\\\ë4\ä\å”)\ÊV=\Æ4@Ô¡E™3¡C¿1´¢ \Ò”\Êe§\Æ\Æ4@Ô¡EY3A\Ä\Ğ4\â\×4†`\ÖXğ\ì(”\ÊDCQŒi€¨C/Š:²e\Í\ÄC`Qüê† 4 °)¯MÁ½\ãğ,x&<QCP\Ó\0Q‡^udq›‰®ë¹¸Ş‹\í1;\ßQş\Îò½¸ûSO\"rc\Z \êĞ‹¢,_+	ûP\ÔS\ÈÔ˜ˆ*›ı\\\Ã/¨ió\0\0\0\0IEND®B`‚','UYoHtUjqs6lY9e4KdTnpkGyt63Lz5zxc94GxwMhXqITTEcUdo7I6XpdcnljS','1','2014-10-12 03:00:00','2018-04-21 08:44:04'),(2,1,'TarcÃƒÂ­sio Belo','tarcisio.belo','1001','tarcisio.belo@vert.com.br','$2y$10$pSvmOYOBpAM7tvWaHf76HOIleYfsUOSNzfURS7lVT0dzK4MMby2/C','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0\È\0\0\0\É\0\0\0f};\0\0\0sRGB\0®\Î\é\0\0\0gAMA\0\0±üa\0\0\0	pHYs\0\0\Ã\0\0\Ã\Ço¨d\0\0\0\ZtEXtSoftware\0Paint.NET v3.5.100ôr¡\0\0(pIDATx^\í	pWv÷§¾™I\Ïd&“LªR5™ššqRI%3\ÉL¥’Tü¥¾™2«6´¡…MB öÕ€1Œ10»6#›\Å`ö\Å,\Æ`À,Œ1c\Ä\"V!Ävœ\ïü[·ıú÷ôô$õvª~¥§î»û?¯ûv\ß\î÷=Ï¢o•Ÿ<÷ó[&\Ég^e\Şc¶0˜\"\æ2Ca‚´Èƒ¼(e¡L”:P\×Sªz\Ï<³)qf3S˜\Ìy\æ1#	½)A¨m@[Ğ¦\ß3?PMõÌ³¦5\Û_1‰\ÌDfsŸi‰`´\rmD[\Ñf´ı¯Tw<ó¬q\ÆbúóG\æ5\æ\æcå€¨´}@_\Ğ\'ô\Í;\Âx¾±`~\Ìd2K™{Œ¢>\Ğ7ô}EŸ¬\Ü\à™gOŒ…Iu\Z³Š)gœÁ@Ÿ\Ñwø\0¾ğ&ın7Á1s˜;Œƒ\"ğ|\ßü—r—gn0pœB\å1_1I O€\à+ø\Ì;sªñ\àş‚Á•œR\Æ;ZD|\ßÁ‡¿Pnõ\Ì\îÆƒù/\Ì<¦Š‘\Ş#r\àKøô_”›=³›ñ\àıYÁ\Ô2\Ò {4ø>şr»gV7¬\ß0\Ô\àIƒ\ê}\àkøü7j<³šñ\àü”™\ÄT2\Ò z4=ğ=\Æ\à§jX<ki\ãÁÀ\İ\îL	\ãM¾[Œ\Æc\âİ¥oI\ãøo\æ0ƒ\å\Ò`y´Œ\Í«\áò¬¹ŒÓ©Y\ÌF\Z\ë€1\ÂXy§]\Ía\ì\è\ÖL!\ãN\ÙŒÆ¬µ\ZFÏ¢m\ì\\5\æ2\ŞQÃ¾`\ì0†\Ş\Ñ$š\ÆÅš©“ŒwÔ°?CŒ¥·Æ«±\ÆN\Äª!L#9\ÛÃ¾`L1¶Ş•®†;î¯™µŒw…Ê¹`l1\Æ­†İ³pŒöo\ÌwŒ\äTç±ş75ü…2vT:ƒg$Gz8Œyº’g’±ƒF3\ŞU*÷‚±­\ä\à™n\ì”1\ï&h\0Zø‘’‡»ñf3\ã]\ÂõĞ ‰Ÿ(™¸\Ó\Ø\Ë\à4®3+ci\ïü6ôÑ”öô\Î\Ëq4kŒ?ó\Æu \Õ\Ó\Ú\Ñşm\èò\Ú±M@«\ä\â.\ãã¹/\É9\àüªMğ\ã†$PF§dê˜Bm\âS©Uû\à\Ä0m9M\\R\nu\ï\ÜQœı\ÛĞ½­r.\0\Zq\×s&\è0sF9ÀQ”l¨Š=“(\"¦ƒ‘€€\É\ÊH¦…¯v ‹«]ydV\Ü$\è(ƒ…k’#lË©\å±ô\æ¨8JJN¡\Ø(…‚-‘ËŸıRœOÁ g	:¨:*9À–û 5½4(A;}’D\İT¤¤&ks™ò\ír»Šsƒ„;ös\æ¨\ê¨\íùfik\ZË\Ñ>¡ñ\Ó!\âR»RBZ7\ío»¤,m›”\ÖTC{\'R\áŠX±\åós%+gw\èg~\ÛBê°­À©\Í\Ô\â£~\Äh“A©{QNŸ\ç©G¿”\Ûw8e\ç =´}R))´}n[±½ZúK%/{w\äifƒ\ê˜mÁ©Ìº\é\í(5-Yi´@0t\êÚ‡òú¤^\Ğ@°t\êÖ—\Ú$fŠy\0&òó\Çup\Ó)\×z\æi%3û\Zw/³õ}‹kbhTÿDj\'‹\ÓD®Î©’Dû\Ù\Ô%o/H@””¬bz€S®)#\ã\İ$\Ğ\Ô<%3{\Zw`$c\ë\å\ê‡\ŞkM\Ò#;j´O\îLió©[şP\íÛ¿k\ÏÁ”ÁG€\Äôjút\É‚+%»§\ß\Ñd÷À\åt\n’\'•\ÆL ;[Z‰ıq\Ğ\ÖH%7{7<…©Q±%g¶k\Ô$<6.ƒ¢;u6	0¿À\Ü\"·‡{t‰K\é¢\ÍMŒA‚ k“ü”\ËEGh,E\É\Î\Æ\rşW\æ–\ê€-Ap´\ÎDĞ*]\à8*\à\Ó1³‡HR>#¸²Õµ\×ÿ \áÿƒIpº5{Lœ\Ø7­ı«’ŸµŠ\ßñ;¡\ZnKv½\Û6jÁaŸ\ÚM£Ğ»÷¦~IyŒ´\æ99H²{\ÓÌ™>š\Ú^\ì£\æ¬ıû‹\ÜÀ\ï3x™±\Ô[pe]Œv\Î,6ˆ§4˜<wH\î¢	§>ø¿mbfØ§K\0G\\\Ò5\Î-ğ“òv\\”GAb>\İJ\Í\î%¦¸}ôı\Öb_´÷}%G\ë7®c\ëIùk\Ï\Çk\Â\Â¨¤N9Ô©[\ê\Â\çû˜lcş\0 f}öw\ãow¤G>œ™\Åj&.¥k€\ØQV*O\ÌC\\û‚*¥Ù™\éúF\×L\Úû)9ZË¸a`ğ“\ÃR\Ãmú¥\\´]R¶6™N\ãoû¬œşÚ©‘Q˜¡€\Ğq:”œ•r2£O·|ÿ\Ó&€ dÉ™y\é¥t:|©\Ï\Züƒ’¥5Œô—~¦Kj°mÀ*\\I\\\0ƒS#YÒºSz\×\ŞZ\0„0¸‘Ñ½_\ĞoyL´\Í÷<\0J‰|4’ò =]{\röK`–\ÒL\Úw½ãš»\íĞ¢u\î´sc¦\Zg[&¨;½\n\0ø6Ç¥\Üú‚G•L™\Ìeana¼”‰;\ë\Ò)\Ön\Ó\âÏœ\ÆHvf2\İú\Ø§Z`š’g\Ë\Z7?Fo\ëû:‡G F\êNÉ²(­K~À¼\Â\éÌ—w\Ûr~5¤<óŠ—t\ÍAŸ\Ú5 <¼5a\Ø¦¿O›f¶£«|z)ù\Ä\Æ@“T2m\ã\àcm}I\×È´Q\r#2*¸|k¯ˆWÂŒy“:\åŠiÒ·MôŸ—\àN»1\r\î²÷‡N¿\ÒÒ’©\à5Ç­\å‚6[\î—y¹òÉ†\Æ\Ø\Ü\ÔEƒS\'|w\Ì\È\Õ&\é:˜tc^\0a#Qhfb9Pp9G£ˆ\äõ¡¥\ÑO¡ğ\×x\ç\İNXÊ¢×\Ó5\ã~œ’»yX<\â+ù\Æ\ÆLVrm^\ãŠ\ÏT\Zb{nljE™]r´\É7&Ö¡\æØ§]\Ú\åoõt#`\âL˜˜œciˆTq}U>)—ˆõò\Í˜œ\ÙÃ·/8%Ä—\0\îò\ë\Ûp\ïÀ¢6¢l\n4ú{%\Û\æ1®7w«8Š·_M\×n¼¥w\é­M¨ñmS¥ú&\àzÀd\æô\Ón\"š\'Õ±q´}R^L²õ%\íÒ„İˆ1HÏ¸¯sˆ»\ë\0W\â\Ğ7”v\ãoV\î\0ßœhô€\Ñ76Zm¾ˆ\\Y6\ã\ÈWõ\à\ÅF1A\èøf‡pq\Õ—wqÏ¡¾£\Ó1\ãQee\æôó\è\äp0\â›\İ<·¨’.\ÜÿS2\Ôo¾\0`D¿û¯]²N\ï®-WA>	±\Ï\ÕK¾±1\Ğj¶’o\Ó\ZW„‰ùEU±\ã0ˆ„vy—EŒ#ym”\Ì0\Ç\Ğy\Í÷/\Ì \î\ÆKû\Ì H¤«fõ]\Í2‚À\Ås&,ı\"@\É\Ç]†f›~\ÂÎ•¼d¨\Ôq„ F xˆQÿDŒ+[HoğPG P\ß°úÀó(R{Cû-8µ\Ä\ç«ùœûKJ\ÆMc\\Á\ß3÷:ˆ¾…1÷\è^\Ï\ÜG\Ì\ê;\Õj,õ\ÍC$¼ú’‡´û÷J\Î\Ñ7.|¦¡2G²`|`€¼ú\ÊHú\èıi4s\êX\Z=j(õ\îÓ›Ò³º¤8•\Â7±$ZmRÏ©YcÁ½Mq3©[n\Z:t M~\íEZºp2mZ9Ë¯\İ:˜û`¾U¼Ş±\ïİš®\ä]\ã‚ÿ‘©2T\äH¤\0™1e,\Ñõ\í\Z®n¡²¢Mt«pŸXEG?[L[VÍ¦÷Ş™HoL­Pÿı¨ÿ !4x\ÄQ¼\Ñf\ÈÈ—h\Ì\Ë\ãi\Ò\ä\×i\Îì©´dñlÚºv\í\Úø6:°„®»†\î\İ@U—>¦\Ç%uıøzOA@?¾Ö¬BğC¨dşQ\É:zÆ….2T\âX¤9\È#‡ø¤>@6i‚¼}f#•~·\Î]E\'öH{·-¦\í\ëĞº\ïĞ²‚9´p\ŞY3§\Ğô\éoˆ\Ìgº–¦`\Ñ,-\ß\æ\Õó´r\í]Fg|¤•\ç\ìFº_´™ª.o¡‡\Å\Û\Äv™AP›û©Ó¹k7\Ñ7b‘’utŒ\Ä\Ñ\ÃQ7ƒ±P8‚\äô\ÈE-j‹·r`\É\è\ßø\ÑfÁ[ú©\Ó??Côƒ€–£÷†F.l†¡pG#AS³E‘Ù™‰¯\n\è§\Î\Äá‰¢oÆ›JŞ3.¿\áa\ë¡\"Ašƒ€Zş6—„fW†\r¾¨ñ\ÃÉ®xšnüop!¾\ïa&\Ø}Lt%¡Ù•.\İs\Å~‚Â•®y\×\ï‹J\æ\r3.\à)æ²¡@\Ç,@\ÎY.\nÍ®´O”V\æwO¢\n÷¼¾ôó”’{\äÆ™3…¹i’\í)…fGpQ@\ê#À’\É/&C\É=r\ã\Ì{L…9`sC;Šb³#\×O­ûØ¯G\İ\ß*û\ÅÁ\ìQr\Ì8#ŞèºŸevŠµm\ÍQlv¤\ä¤ ør|\âp ñ\È\ß\ÊÈ™&\nq\rnû>ûˆ¾K>q“”\ì\Ã3\ÎğC¦\ØP€k6qR€Û³Xì£‹“õ*ù\×oœ¸­!³«¶šw«£D^‡…¾K>q	m•ü\ë7N\\`\Ê\ì\Z‚b¹!@\\|Jş¡\âŞ‡­º 1\ík\çŠb³#\ß\î_\"ö\Ñ\å\Í\×O„\Å2¹`—y¿\Üõ(6;R|bµ\ØG—^\Å2§\Â ¸q¢ù¦L®\"\ØW~$±Ù‘[…\ë\Å>ºü\ŞVa \'À\ë|\\yõJ\'\Ø$ı\ê7«D±Ù‘\Ç%\Û(6.ğ]¿^€h\Úşz \Şù†Ä®$\Øe^§­\æ\Í\ìø&x/@4şC…C ñ\ÎM‰]‡tŠ•\Õ5G™yşùAıôD#ø\n_Ş¹Ó”\ØuH§X#GEfgfO{9 Ÿ^€h\ìT\á\ào¼\ãi\Æ?c\Ğ¤\0Á$‘YŠ’-ôø\Òrzt~‘Ç—Vğvù\Ôğ“usú\éˆb\àiOŒ7\Æ¹)@¬|‰÷ñ•UT{b<U\ï\ïJûó©\ì\à ø¿z7ª=ù:=¾º\Î/_é©µu—\ßI7£\Â\â‰ñFW=9ó$!%‹j®lñ—5\ØF¿{“ª>Ï¦\Êã“¨\ì\Ú*½z–®—\\}ÿóü*?úŠ–\îa¡ÿj€¾ı\ê\ŞÅ«\ãA|¾‘7n5%r(­¨\ê@.UG\Õ\'&Qõ\×/SÕ¡~T¹;Y\Ûo>‚\à]WFQYƒmô\àøXª<O%G©¢²šn\ß-£’\Ò[\"eee({©|_/ªıfœ–\å¬[6İ¯¯¾#û>o4±¯\à3ø\Îß—e«\n‹:\ã\rÿ‡)5$p(­¨ú\Øhª)ZF5>ô\ç\ì\"M_\Ïğ	¦M|:;ò¡A˜Ö ö›ñTùEª¸[LU4Jo\Şƒ\ã\æ\í{t\ç^¹ö¹ôj!•\í\ïCµ§¦i\å”m¤ô¬\'/¹F\ß\áø\"À?\ì3ø\Î%ARªB£\Îx\Ş{%%tUûº\ÉÁa`\ÑÜ—f\î„\0q¶4.P\å\ŞLª¸s\É÷Ë«C\ç^Y%İ¸u\×÷\é•où‘FxBòöl~—b\Õo™ \ï’O|°\ï\àCÉ·\ä\×*<´\0I1\ít$\Õ\'\'\Ëo`\ÑÜ±šXFDÕ—?hKS}°U\\\Ø\èp\ë\Î}¿ Ğ¹~\ãv@ğ X*¨\æp­<\ÜUÇ«U\ëd¬\è#ğ¡\ä[’¬\ÂCñ¦¤\æ<Ct#Iv\×*=e½\×ü<º¸¬\î\èQQ\áò\Ê\Z-ŒA ƒy‰ynr÷>\ç-»­\Í3_]«•[~aõ\Ê\Ï+@\àCÉ·d¼\n-@Öšv:]qò€›X¾\àUúj÷\â\0qZ\Ú¨ò\Ät¿£o\0#8z\ç&$òUO¿«›‹€\Ó—j}—|b¾}\ì,>R\á¡\È)\ÓN\ÇQµ;El37NYoR®ƒÓ¢Ê‹[ü“pcP\è 00ÿ0nÃ©˜¯ò\Ü\nzğ\Õ¿ò\Ñw\É\'fª\Ô?‡sJ<şÀ°Ã‘T}%¶™‡W\Öû‰\ÆJT\èN%‡}\"/«¨ö\0#¸re›\àˆ¢ç­¸¸™jò+ÿ\á\Õõ¢O\ÌTñi\äc‡˜ø!\ä\ÃF\ÇRõY’8\Øf £h¬D\rHe\ÉŸ\ÈõË·\ã\ÜŸ}ÁÁTr€<ø²Â¾”|\ì@A€Äš6:“]ñ\â`›±t€\àwŠ\êŞ‡yn‚Éº_€œ]Î§X\Ãı\Ê7@\àK\Ñ\Ç\Î#’k\Ú\èLv´\âÁ]0\Øf¬ µ\'^\åIúM\à¡\î} 8Œ÷>\0(~ò\ÕXm©Š±ü°¤h™\æK\Ñ\Ç\Î#2Ö´Ñ±Ôœ™/º+\ÏA\ã2\ïNTQQti	N¥\Ìs‹18*\Ê\ïR\åg\éñÿK\Ù\è»\ä?\Î\Ì}\ëP\Æ\"@\æ™6:–\ê“oÈƒnÀ\ÊGPs U­z\ïsó\ÜD»÷a\Ê3K|7\n„s%\ß:”yu¦¥\ê\Ë\á\â ±z€hKMø(r\ã\ê)¿ \Ğ1\ßû\0ú½[…Tµ;U{v\Ä\\v8J¾u(\ë Ÿ›6:\\”İˆ\Õ`.R~ /•^=\ã8ª˜\ç&˜°û‚\ãöªÜŸGOM\Ë\r+@\Üq‰Wg\äŒi£s\ÙC5gŠ¯c\å9ˆ’-ô\à\ë1T¾¯\'\İ,úœ\á¦˜—˜\ï}\àfaEeU \Ê}9T{OGÊ¿„[o€°\ï\àCÑ·\Î\ä4\ä¢i££©::R|… \Z%[\é\á\éTµ¯\İÿr<\İ<¿‹\Ê\î\\¥\Ò\ÒÒº\à¸~][\Ş^quUC\Õû»\Ó\Ã3x;dğŸ‰®/@\à;É§\æ\"\Ä]Ï¡\ã~\Èù÷E\0\Ûˆ\âñ•\Õ\Ú)Wõ\\ª:\ØG{Ş£l?¦/U\ì\ïI\Õó\Ô#·uC2@\Øg.ºÿ¡Sƒ\0‘v8šª#ƒe0v\×>\æ‰÷‡ô¨\è=ª\Ú\ÇkÿSIøKöC|&ù\Ò\é¸2@*w\Äj’JB°m€Àb\Â`o3	E°\0¯\à3Ñ—Çv¶\ç\àw\İ	R\ÍóœzIûB \Ë5ÁW¢]€{\ìhMU_ô¡\ê\ïfSM\ÑR\ÇHÍ¡¾\Ú)–´/Z€œ+¨{>Ÿ}\ßÀG¢\ï\\‚»D\çÓ¶Tµ7ƒ\'¹ùT{z¦(;\ç<\Î÷…}¯ú¼³¶>}\å2¼\01Q{|¬(;Q{ò5\í\éCi_(\Ğw\É\'n\Æxß”$;ñğ\Ìzpt˜¸/^€\âˆ‰GıŸ‘°#x¹CÍ\\q_(\Ğw\É\'n\Æ5ğS%[\ê.õJûB€¾K>q3\æn¦jg;M`’€\ìDÕT¢k›\Å}\"*\î»\äsRd\Ú\èz_(‹\ÈF\Ô|‘OŠ\n\Ä}\è³\ä—S„\09f\Ú\èz\Z2Áµ\Z¿\ä÷Ş«ú@Ÿ%_¸œ#¦®§jg{z\\l\ï†O\Ïb\Ñ?/\î3ƒ¾¢Ï’/\\\Î\È\ÓF¦ö›WD1Ù…Ç—WjKÜ¥}f\ĞW\É\Ï-A€L5mô`°\"ö±­—l\Ó\Ş_Uß¢Eô}•|\àñ\ÜT\È`\ÓF…\İ\ï‰\àMŒ..÷\éx÷>B2’f\Úè¡³#–›/\n\Ë`¢^{\ê\rq@\ßÜºŒ=L\Ò ÿi\Ú\èa\0÷\Ây\ZÏŠ<<û®øz€>¡oRŸ=|ü\'\äg¦&°|Ü7o\Ô\Şj0á¾ OR_=üø™ş†wü>a\ã¨\åÓ•P/<°*xVı\Ñ\ã<d›\Ö©~<ùBşg·i§‡>W¯ıv²Ahö\0\ËŞ—¬\Ño\Ş»Uxhò¶i§‡Ä§­ô RKòøòGTıy&Ş¦µ}û\æa\æmZ€ô5\íô\Æ\Îv¶’\ê}\ë\Ş\ï-FŒ„¾*<´\0yÖ´\Ó#Z\Ì\ÅhE{\ÛíšŸ,ˆÏªğ\Ğ\äi\Æñ?\ÃU$§g°\0­<q\ç\Ó*n£w\äˆ\Ä\Â\Ó*<\êŒ77$ğ}\âŞ€wP59\Ü&oB\Ş`«°xb¼q¾)‘G8ìˆ¡\Ú\ã/ko6…\Úp[\Ğ&—½h:š\ÌWañ\Äxc)‘GØ´Ò§À9Q°\Í\ÚP÷l‡7\çh9*,oüS\"©9Ø“]\İ \n·9@\İhƒ\Ô6ˆøş\Æ;.™zDH\é¯R\Í\åM¢€›\Ôyı\àx±MqI…C ñ\Î¦\ÄrmW:w\àmª¼°NrS€ºP\'\ê–\Ú\äT8\Z\ïL7%öˆ›;»\Òé½³\èÌ¾9t\çôJzt­\é®p¡lÔºP\'\ê–\Ú\ä\é*wş\rSkH\ì!÷w$hbÕ¹ú\Õ{|úı\É;\ÊD\ÙÆºP·\Ô&°öÿF…ƒlœÀ[¸\Ø*>‰¡Â½\Óı„{vÿ\\*=±„\\iü\Üe ,”i¬u¢n©Maódb0\ãD\ÃM™<\"¤h÷+~\â\Õ9»ÿ-*9^ \Í‡ÿ|	\Ò\"ò¢©\ì¢\İ\Ş=\nWa\Ü8\Ñ3\ÌCC&¹ò\Ù0Q\ÄFŠ¾x—®}]@·¿[Á\â_¯]…zpe³>cÛ\Ó+´4H+•auJmñhş¡1dôˆÒy¢ˆCQøùl\í´	à³”&¨Sj‹G\ØQò¯\ß8±wš\Õ\î–ÁB¯»²\Ô\\\Üù4]l‹G\ØSò¯\ß8ñ/\ïjVCù´-\İ=U@g\Zp$h(\å;\Ú\ÈmñhıJş\ág\Øn(À#8@ª‹wÒ­“‹tº³\éò7ë¼ŸLkÛ•\ì\Ã7Î”a*\Ä#Lñ†¶´¿ •¶,Ÿ@•UTUz„nœ(h² )\Ü÷]-üŒ\Ê+ª´:Q7Ú€¶HmôJ†’}øÆ™~\Ä\Ü4\â„k\Û\Ò\ÊY\İhøğ¡\ÔsÀ´{\ßaª¨z Qy§ˆn~·Š\Î\ì‹fÌ¦s‡ß§›\Å\ßù\êA¨m@[\Ğ&©­@\ã?R²\Ì8\ãCAÇ—\'\Ñ\èQƒ5q‚c\'\Ñİ²JŸp5*\Ê\èö\åCtö‹š¸eÑ‡\Ãl:{p!];·Ÿ\Ê\Ê\îùÕ:Q·\Ş´\éÄŠD±\Í~LQr\Ü8ó?3Ş£¸AøjY\r:\Ü\'J°v\Ó\'~\Â-7\Ëı»7©¤\è?üŸù\ß	\Ò\"òŞ¿wûI\Ù\åU¾\Ï\0uÛ‚¶¡R\Û=4 \íVro˜qº–û[Ÿ£\ÒM­\è\âšúvy,}òN<\r>\ÌO`Û§Ÿû{¯ğ<]\Z5®-XJ÷/û¶—•—Ó­’3t\å\Ôv>ª¼§\Í%ƒ\â-m\Ò -ò\èù\ï_¾¦•yiôD­};\ê6·mD[\Ñ\æK\Üvô}‘ú\èB6(™7Ü¸?1\r…:–Š\í\ÏÑ­Í­¨x}_Cµ¡S\ÚÓŒ\ÑqôBÿD\Ê\ÏI¢))Ôª}*e\å#˜ùöbŸ`‹gÎ§Â˜s=\éú\Ò\ÕTvı–o?(+\çÓ¯\ëEt\í\ì>ºøõ\ZºplµöÛ°\Ï/m\émº¾|\Ë\Ê÷•‹:ôı¨[jÚŠ6§¤&k}@_\Ğ\'ô\r}D_\Ñgô>|\ã@ \é?)™7Ü¸\ï3‡T¡\à\î–VtmC+º°:†¾^Òš¶\ÎiK\Æw W†$Ğ€¼$\Ê\ÎL¦v	u \Ñ!¥‹(D0`ø\Ët¿¢Z\ì•\×gú„¬s>w•®\ÛJe%7µ`¹w\îRH\ÜøøS*\ÊP\ê@]¨uKm’»ˆ}\è+úŒ¾\Ãğ|\ßÀGğ\Õö™\äKM_É¼q\Æ¥\Z\n¶eÛ£k\ë[Q;\êAğş\Ä4iD<\r\ï›H\İ:w¤ø¤\àAŠÌœş¢uŸ,\ÔD[<c^€ u\Îw@E,\Ò>#H*\ê@]¨Sj‹\Ú,õ¥>\à#øjX\ïD\Íwğ¡<ğ-|_Kc`qR•¼o\\ØŸ1§…[mõ´v4z`u\É\îòH\Ğb:¤Q^ÿ‘¢uV­ßª‰ö\Ú\Âe¢¨£	\ê@]¨Sj‹ÚŒ¶K}j(ğ-|_\Ã\çğ½M‚Zş3%\ï\è\Ø\ÕP¥¸·µ}¿5\ãÓƒ\Ä\ä\è„™øÔ®¢\0L˜2GmÉ¢å¢¨£	\ê@]¨Sj‹´]\êS´€\ï1œ\ÆJceº*YGÏ¸PE,õr9|[}õAk\í¬M¼<h\Ñ&5»—(>#½¦›w\î7O€,\\®Õ…:¥¶AÛ¥>EŒÅ¨ş‰\Ú\ØXğˆr”‰\î\ÑC7.8‰±\Ä­+\ëbhÚ¨ø¨ŸB\ÕGVn\èù‡\ÎÁ#_7\ÛuIm0ƒ¶K}j*06#Œ•4†-\0´›¤\ä}\ã\ÂqEkª¬E¸\Ï\ßH;\ßnK³’\ÅAijºö\Z\"Š\ÏLÁò5t}\ÅzQ\Ô\Ñu .©\rf\Ğv©OM\r\Æ\nc†±“Æ´v£s\å*˜qÿÃ´\ÈRø›Z\Ñô\ã(¶ƒ<\ÍAN\ï\çEñ™õ\ÊTºñQ\Ô\Ñu .©\rf\Ğv©O\Í\Æc‡1”Æ¶€fÿGÉ¸i+Zb¨¸Y8³2–ú\ä&‰\ÎoNòú\Å\'ñ\İû‰¢&¨Cª[m—úÔœ`1–\Ò71K”|›Ş¸²_1÷•7Xº}`Q\Ê\è\Ô2§Tf$\ácı˜\×EQƒ3q\Ùtiô\ë\ÚR\Ü—À>¤AZ©€:¤ºƒ!õ©¹ÁXbL›qY>´ú+%\ß\æ1®°\ÉË…·\ÍmK	›w\"\nItÁ˜“3 P\Ôm\Ò\éB¿‘tû\Ğ1\íòl8 í…/jy\Í\å¡©\î`H}j	0¦\Ûf\n’ú\ßVm\ãJÿ‚ù\ÊĞˆ¨\Çmg6÷Uªú\È\í\ë¿z7“Lr.-—®¸\Ê\ï=Yx.\ÈSºr#—\ÑÃ¯L\Ô!\Õ-¶K}j)0¶\ã&\\\Öı%\Û\æ5®øÿ15ª!Qko±\à\09½WğcDş0:\Õ.ƒ\Î\Äg\Ó\åW§Ñ½¢+¢ø#\áş\Åb­,”‰²Q‡T·\Ú.õ©%Ác¬%\rDhóÿ*¹¶Œq¦\Z\Z/nm\É\à\0]{=y8*\Ö\ÎYDw}+Š½1 L”-\Õ´]\êSKƒ±Æ˜KZh$S•L[Î¸?fN\Z\Õ(\nW\ÆRZš5&\ä\Ù=Š\â\Æ\ä\é\ïˆ([ª3h»\Ô\'+€1\Ç\ØKšh \Ğä•L[Ö¸!dªU\Ã\ZGÀó\n’­B§®}Dñ£\Ï\à\Ñtû®ÿs\Ñ\0e¢l©\Î` \íRŸ¬\Æ\Z´!\Ğ\â•<­aÜ qLƒ—¡\àA)/Ä‹³É™y¢øBq\è\è	Q\äeJu…m—úd%\Ş\×Ø‡¶ ÁqJ–\Ö1n3\îTŒ˜½óÛ´\èòp‰c5¯™¥+7ˆ\"o(Sª+h»\Ô\'+\r@’F\Â\ZlšÅˆ5n~\ç°D54lğœtV¦u\çF\Ú$dˆ\âÅ¸I³\èv.\íe¡L©®P \íRŸ¬´\0MHZ©hOş}A«70‰\èM(s\ÇÆ‰²*‘\Ü}‡¾DŸ\î=B÷Lo!i(e¡L©®`X\íH}@’VB\0\Í%(ZÛ¸¡˜<R\rI\áŠ\Øf{–#ZDz%\Ìÿ`\r\í;ü\r•UÔˆ\Â\äE(Kª#V¾‚%M@’f 5\ë\Í;‚7\Ë\â×¨\ÆwP\ÇNdeR;\×ÿĞ”™I3\æ\Ó\Ê\rŸÒ—\ÇOSye\äA‚<È‹2P–TG(\Ğf©/V\Úó.;´Ö´\ËØ£m\Ü\àŸ3!—¢œ\\k‹‰¹™¸o5	Æˆ±“5qƒo/ŠA\n\ä\Ñó£,©P \ÍR_¬´H\Ú1\0ı\\\É\Î^\Æ\rÿ5S¬:Àø¡ö;z€p^\Ü`&Ğ‹´|\ívM\àm\ÜI\ç.>y‘\\} -ò /\Ê@YRÁhŠ64Ğˆ¤´õk%7{\Zw\àY\æ¾\ê¼o©­\Í\æFº\ä\r\ÅŠ·­ğVo\ŞEWJnŠaiVÏ‡2¤²C¶J}°\Ğ´b\ÖM=«dfo\ã\Ä1~w\Úñr2\É!v!%»§(\ÆPL˜ú¶O\è`ıÖ½Tz\Ëÿ%\ÔF°iŒyP†Tv(\ĞV©vZ1j‡–â”¼œaÜ¡\\F[ù[¾ı9JO·\Ç}`´K\Ê\ÅŠ!£&ø‰lŞ±Ÿnß«l\Ã>sz”!•\n´U\êƒ]€V hGi(W\É\ÊY\Æ\Ê\Ô\â}°’#\ìFwµô\çø\İò‡h\ßÔ¹}B?³şş\Ê\Í¢ÿd\Ïa¿{$øŒm\æt\È+•©ƒº\Ñ´EŸ#¡R\Û\í4\í@CJN\Î4\î\à+S_ˆ¯•œ`7’³ò(­s>µï˜­ı\ß1³G€h\Í\Ìx\çƒ\0\áƒ=i÷9\0>KiW*\ÓÚ€¶ Mh\Úhl³]f %#g[Ç””W¸\Ó\ÍN°3X\Æ\Ñ#Œ:¼ô\ÚQü\àĞ±S\Z\Ò>€¼R™F\Ğ»,)‰€‡ĞŒ’;Œ;=78Á\Öd\æôk¦ß°±¢ø\Ãy¥2Í -Rm\n4bŸ»\ä\Ñ4tœy a[\âR\"[\á»h\Ùz1\0B<RYÁ@›¤¶\ÚhÃÁ¡; ©Q±%I¹¢HƒñÆ¬…b„y¤²‚6Imµ\ĞD’‰»‘Ì”)\ÇØ’ú~3\Ä\ÈÈ—\ßƒ \È#•%\Ñ\Ğ\ß±\ĞB²’‡g0v\Èÿ2%\ÊA¶#6.\İwÙ·>ğ&v}\ÙI8 m8ooh\Ú\"µ\Ñ&@ÿ«d\á™\Ñ\Ø1\Ï0G•£lGû\Ã^£õ\Î\â\Ä`@Z©3¨m\Úf0ö\Ï(9x&;\è\'\Ì\ZÆ–W¸R²\Â[‚b^vŠp—— n©M6\0c1ÿ‰’g¡Œõ\æÆ–“÷p¨\Z6z¢H+•a\ÄnDÀc¬ †ß³p\Ã\\e$\ÇZ–\Öñ”SÏ’°tõV1 Œ ”\×\êBR[,\Æ6F\r·g\r1v\à/™-\Ì#Fr²%	ç¡ª™\ï.ƒ\Â\ÒHy\Øğa(Œ%\Æô—j˜=kŒ±#q\Ê5”)g$‡[’´.ù¢ u^~}–FFÊ«ƒ:¤º-\Æc\éRE\ÛØ©ÿ\Î|\É<f$\ç[.=ƒ¿\ËwÀğWÄ 0‚4R^€²¥:-\n\Æc÷\ïj8=k\ncÿ9ó\"SÁHa)\Ú$f†\\\Äø\Şò\rb`\0\ì“ò\0mQ\"—-\ÕiA0V³?W\Ã\èYS;û·\ÌN\Æò—ƒÒº‹\"\Ó\æ.ƒ`Ÿ” L©.‹±ÁıV\r›g\Ím\ìü.\Ìe\ÆÒ§]Á^zı\âøibp\0\ì“òXı%\Ô\Æc\ÒE\r“g-i<?e¦2–=íŠ‰K§n\ÂOHc	ÉŠõ;‚Û¤\å%(eIuXŒ\Æ\â§jx<³Šñ ü†Y\ÎXr	}Û¤,q)Ê»«\Û\Ì\éeHe[\0ø¾ÿ\ZÏ¬j<H`¶2–›ŸHK\ã_Ÿ>/ @°ÍœÎ¢K\Ø\ácøú\Êı\Ù\ÅxĞ°Bx=c©g\à\ÍK\ãŸóz@€`›1—°Ã§ğ­·ò\Ö\îÆƒø;f)S\ÅHƒİ¬˜—\Æ÷\Z8\Êo\Ù	>c›¾\ßbK\Ø\áCøòwÊ½9\ÅxP\ÅLdJ™½ê…·\ç#s,÷>\ë\Ûë–°×½5¥¯\à3ø®yß³\æ7ä§˜\Î\Ì^¦\Å\æ))YO~\Îm\Ü\ä9¾\0Ág};\ÒHy›	ø>‚¯R\îó\ÌM\ÆÿO\Ì¦ˆiö‘ú\ÒøA#\ÇûŸ±­…–°\Ãğ|òO\ÊMy¦Ë³®\á_`š%XZ\Çwò½±`\Å&\r|\Æ6\ì“ò4\è+úŒ¾;\ã…Ğ5­A(^Kô5Ùœ\Ë\Õ1\×xó­\r|n\â%\ì\èú„¾¡^Px\Öpcı“\Å,dN3Q¼&tÌ„\é\Zø,¥iz@ \í\èúòwª{y]ƒ¸˜D\æ\rf;s›4x2Hû\"@oÚ„¶¡h«µœA€Lf3›Ás…–`„8x§n\ï\ÕE™(u .Ô‰º\Ñ/<³A°\Ì\ï™?1İ˜|\æe\Åt\æ½ @ôz:\äA^”²¼ hrû\Ş÷ş?*ñaY\é}V\0\0\0\0IEND®B`‚','AO8a66OT6sAnhQlAxEhllV9SAs0Pf9yHLv35KlLzS2OZuvwRSht1Vq7PfHXa','1','2014-10-12 03:00:00','2018-04-21 08:44:28');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-06-28 15:19:03
