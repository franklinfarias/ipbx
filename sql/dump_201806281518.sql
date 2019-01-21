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
INSERT INTO `client` VALUES (1,'COSTA&SILVA','Advogados Costa & Silva','franklin.farias@vert.com.br','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<document>\r\n   <servicenow>\r\n      <host>vert.service-now.com</host>\r\n      <user>franklin.farias</user>\r\n      <password>Fks@2390</password>\r\n      <sys_domain>108244cf6fa28304706dd7aabb3ee423</sys_domain>\r\n      <tables>\r\n         <incident sysparm_query=\"stateIN=6,7,8^ORDERBYclosed_at\">incident</incident>\r\n         <request sysparm_query=\"stateIN=5,7,11^ORDERBYclosed_at\">sc_req_item</request>\r\n         <problem sysparm_query=\"state=4^ORDERBYclosed_at\">problem</problem>\r\n         <change sysparm_query=\"ORDERBYclosed_at\">change_request</change>\r\n      </tables>\r\n   </servicenow>\r\n   <zabbix>\r\n      <host>10.61.231.133</host>\r\n      <user>franklin.farias</user>\r\n      <password>Fks@2390</password>\r\n      <groupid>36</groupid>\r\n      <triggerid>14251</triggerid>\r\n   </zabbix>\r\n   <asterisk>\r\n      <webservice />\r\n      <code />\r\n   </asterisk>\r\n</document>','1','2014-10-12 03:00:00','2018-04-21 08:44:55'),(2,'CAUBR','Conselho de Arquitetura e Urbanismo do Brasil','franklin.farias@vert.com.br','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<document>\r\n   <servicenow>\r\n      <host>vert.service-now.com</host>\r\n      <user>franklin.farias</user>\r\n      <password>Fks@2390</password>\r\n      <sys_domain>960706730f7a32004fe186ea42050e88</sys_domain>\r\n      <tables>\r\n         <incident sysparm_query=\"stateIN=6,7,8^ORDERBYclosed_at\">incident</incident>\r\n         <request sysparm_query=\"stateIN=5,7,11^ORDERBYclosed_at\">sc_req_item</request>\r\n         <problem sysparm_query=\"state=4^ORDERBYclosed_at\">problem</problem>\r\n         <change sysparm_query=\"ORDERBYclosed_at\">change_request</change>\r\n      </tables>\r\n   </servicenow>\r\n   <zabbix>\r\n      <host>10.61.231.133</host>\r\n      <user>franklin.farias</user>\r\n      <password>Fks@2390</password>\r\n      <groupid>19</groupid>\r\n      <triggerid>14251</triggerid>\r\n   </zabbix>\r\n   <asterisk>\r\n      <webservice />\r\n      <code />\r\n   </asterisk>\r\n</document>','1','2014-10-12 03:00:00','2018-04-21 08:45:10'),(3,'FIPECQ','FundaÃ§Ã£o de PrevidÃªncia Complementar dos Empregados da FINEP','franklin.farias@vert.com.br','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<document>\r\n   <servicenow>\r\n      <host>vert.service-now.com</host>\r\n      <user>franklin.farias</user>\r\n      <password>Fks@2390</password>\r\n      <sys_domain>fe4fb8450fc30300cb42c2da42050e7d</sys_domain>\r\n      <tables>\r\n         <incident sysparm_query=\"stateIN=6,7,8^ORDERBYclosed_at\">incident</incident>\r\n         <request sysparm_query=\"stateIN=5,7,11^ORDERBYclosed_at\">sc_req_item</request>\r\n         <problem sysparm_query=\"state=4^ORDERBYclosed_at\">problem</problem>\r\n         <change sysparm_query=\"ORDERBYclosed_at\">change_request</change>\r\n      </tables>\r\n   </servicenow>\r\n   <zabbix>\r\n      <host>10.61.231.133</host>\r\n      <user>franklin.farias</user>\r\n      <password>Fks@2390</password>\r\n      <groupid>37</groupid>\r\n      <triggerid>14251</triggerid>\r\n   </zabbix>\r\n   <asterisk>\r\n      <webservice />\r\n      <code />\r\n   </asterisk>\r\n</document>','1','2014-10-12 03:00:00','2018-04-21 08:45:26'),(4,'PROGEN','Projetos, Gerenciamento e Engenharia','franklin.farias@vert.com.br','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<document>\r\n   <servicenow>\r\n      <host>vert.service-now.com</host>\r\n      <user>franklin.farias</user>\r\n      <password>Fks@2390</password>\r\n      <sys_domain>ba0746730f7a32004fe186ea42050e00</sys_domain>\r\n      <tables>\r\n         <incident sysparm_query=\"stateIN=6,7,8^ORDERBYclosed_at\">incident</incident>\r\n         <request sysparm_query=\"stateIN=5,7,11^ORDERBYclosed_at\">sc_req_item</request>\r\n         <problem sysparm_query=\"state=4^ORDERBYclosed_at\">problem</problem>\r\n         <change sysparm_query=\"ORDERBYclosed_at\">change_request</change>\r\n      </tables>\r\n   </servicenow>\r\n   <zabbix>\r\n      <host>10.61.231.133</host>\r\n      <user>franklin.farias</user>\r\n      <password>Fks@2390</password>\r\n      <groupid>0</groupid>\r\n      <triggerid>14251</triggerid>\r\n   </zabbix>\r\n   <asterisk>\r\n      <webservice />\r\n      <code />\r\n   </asterisk>\r\n</document>','1','2014-10-12 03:00:00','2018-04-21 08:45:43');
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
INSERT INTO `domain` VALUES ('ind_st_ativo_inativo','0','Inativo','1'),('ind_st_ativo_inativo','1','Ativo','1'),('ind_tp_profile','1','Administrators','1'),('ind_tp_profile','2','Managers','1'),('ind_tp_profile','3','Supervisors','1'),('ind_tp_profile','4','Users','1'),('ind_tp_notification','0','Tarefa','1'),('ind_tp_notification','1','NotificaÃ§Ã£o','1'),('ind_tp_notification','2','Mensagem','1'),('ind_st_notification','0','NÃ£o lido','1'),('ind_st_notification','1','Lido','1'),('ind_st_notification','2','ExcluÃ­do','1'),('ind_tp_cron_job','01','Uma vez','1'),('ind_tp_cron_job','02','A cada 5 min','1'),('ind_tp_cron_job','03','A cada 10 min','1'),('ind_tp_cron_job','04','A cada 30 min','1'),('ind_tp_cron_job','05','A cada 1h','1'),('ind_tp_cron_job','06','A cada 2h','1'),('ind_tp_cron_job','07','A cada 12h','1'),('ind_tp_cron_job','96','DiÃ¡rio','1'),('ind_tp_cron_job','97','Mensal','1'),('ind_tp_cron_job','98','Semanal','1'),('ind_tp_cron_job','99','Anual','1');
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
INSERT INTO `user` VALUES (1,1,'Franklin Farias','franklin.farias','1000','franklin.farias@vert.com.br','$2y$10$srCpIyDqDBC1ofBU7tmHBeCZpMMcibwicFVwbk8vuYmjDdihzJDDK','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0�\0\0�\0\0\0K\�\�i\0\0\0sRGB\0�\�\�\0\0\0gAMA\0\0���a\0\0\0	pHYs\0\0\�\0\0\�\�o�d\0\0\0\ZtEXtSoftware\0Paint.NET v3.5.100�r�\0\07QIDATx^\�{\�&E�\��|����\"�h(Ψ�� \�I\Z\�:�.��\n\�\�(��M#(h�\�*\�e[]D�^\�\�\�n\�\�izf\'6b&6f�\rccc�z��+߮�\�sVVf\�uG��\�\�P�y\�u?�w^$�\�b�\�\�/0v\nG\nN�K�56��g��\�\��\�\�\�\�ve�ɶ\�lE&K\�L|\"|؀0�4 \�\�&\�1�{ƽ\��,x&<ہ\�qe�Nc��,:3=h\�\Z.H\�\�c�<�.(��E�\�d{\�D=$2٢f\�\�z�Yc�\n\�\�\r�iHl\�\�D=$2Y03�C\�B�\�?.��l\�SY�1Q�L6���\�2~)c������\�\Ze�\�\�!\�И��D&�f&V���b\�&�u�Jf\�D=$2\�h31´YLQ\���z逺B��\�CIؘ��D&d&8���F>�.\�;IИ��D&\�4�q\�Hq��\�u�`��1Q�LF\rR��\�zQ0�ܘ��D&\�3\n��\�\�\rQ>\�\�J����zHd+7�WNC���|\�D=$���5~�\�\�\�)17�KkM2&\�!��Ȭ����\�6\Z���O��\�+	hL\�C\"[�Y�FB\\�\r\�+Q\�=�1Q�,c�F�]\\�*\\,|o�pG\�\�D=$�\�\�\Z�K�k�J\�|QI���zHd�\Z��i�\Z��߄�*�x2&\�!�%n\��v��8D*�W\�ZS2ј��D����HV�*D*��HF\Z��\�34��ѱ\�(D�(��0&\�!�%bָ�\�@��5>ቝ���\�E0\�\�ʑ�4&\�!�EnhL��へ��7\�\���\�\�O|��]A\���\�D=$��\�\Z�>*p\��{s\�;޻�䢯���N��h2bL\�C\"�Ь\�`�*�\�X��>��^\0��\�C\�k\�\"h\�o���\�\"2k$H�k\���\�\�����AA\�P��dL\�C\"���Q(A\���]4��\�\�\�׋\�(\�^��\�6k\�sD�\�,�\0�hP~Č�zHd�9?v\�\�pU�\�\��5\Z<\n\"Q�6�ڝ���D\�\�\�ݴ\\\�D \��G�\�X\�_&\�!�4spͮJ\0�aA�\nz*\��b1V7[��zHd̜ZI�N\�m\�\�O\�\����$;��\�f6sd�:�ƛ\�u��?��U�F���D6���ב0,X4�Y[\�3Dd\�a�\�f�^G\�4�i[��\�Q�mo��zHd�\�U3�2�m-CY\�7+z�\�4c��\'3\�\�6$gK\�*fh\0\�|�}��\n�\�l�Ca��3�\�5��<2\���Fo��G\�ss�[\�EEJ�\'\�\�n\�|�6&\�!�M0sB$\�u:`�`�D}L~\�\�\�,����+�}K-H���I���t���zHd#\�[�h\�*b\�[�퉸\0^u�u�o�u_�hC���@Nv+&\�!��0s8\rY%@yE�\�$w9��K/�����V�\'G�CZL\�C\"h\�hZۑ\�-I�a�cTx٫�\�D�\�g�\�9V4�d��zHd=͜�힛Uq\�{\�9 C��օ$\�x2y&\�!��0s(\�;�00A�\�\�w\�xS\0}�Ȑގ���$�\"L\�C\"\�0s$��0L\���B\�@�\�\�\�\�whaaҠ\�G`��\�Z\�H�\��	{�^HW\0�o�i���a�,�z�:��\�\Z\�G\�;2�iEy״\�Kn���*��\�\��󁆱�\�D!\���\�*f΂d�\�wdBӦ�]��p��\�A��\�IM�.�\�D=$����hq`f0Q]\�B��-��!MCY}g}�$�n\�!��\�\n�cJ�guG[�[��`\�D\�P�f4\"� \�D=$23s�ߡ\��!L\�M9\n\�G������6,�Z\��\"L\�C�z3G�4]\�$\"q.�\�35A��\�3yá�i�h{f�\�~�Ȇŧ�2Qɪ\rPq�/���΍_q�T\�}8\�\�7���.�\�w�\�R^$��A��zHVkV�+� 2\�e��Vԛz�\�\�:�g\Z@\�wi=H�.d%�1Q\�*\�*\\k<V\0zN؛�\�\�����\�c��PW\"},�V��zHVg�\�JŋL�\ZL�u\�Ά�@y�	Aצ�\�׿i\�\�+��\Z�&\�!Y���+.2\�q�7����\�L���;^}\�ɽ�`}�M	 \�u!\�^�Ț�A��zHVc�\�JE��A\�\�] \0����;\�t^\��\0S�~O��D\�\"L\�C�\nC�V*Xd���\Z@X/=�\�\�SS\�e��~\�\�\�\�\�$�0QI����T�\�7| \�Uqg�7t\�\Z@@yK[���ك��dm��J���YON�ي�\\H�+\���\���RTl��X�&\�!\�֬\�\�c��\�iK�0\�kc�2�R\�\�T\�U3\�bC&\�!\�\�Pa�\n+�\��\0lT�\�V�@0\�}�\�\�%�0QIv���T�\��:�c�PM��i\�\�\�}C(o��� X��iø_\�7{�-ރ��deVA��\n\�fZaUY����Lw O\�\�3\�R\�\�;p�x<�\��\�.�L\�C��Y\�\�<���W$��6�.\�\�-g\��Sm虰׏�\�;\��s\�y�\�\�d�\��D���$C�\�*L$\���\�E���a\��1�\�\�g\�W\n(\�\�-�0QI�f�3\�{Q!/�б`SC&\�e\�y\�\�x��v,m��1��P^Z��4^\�Xg��䭨VA\"b4|�2�\�ӓ`���\�8��O\�rԙ#Ir���\�\�D=$I�U�\n&~1\�4\����[b¬)��)t%\�}�rE2^=����А�zH�5+�#���1{ll8&>��Sq\�\�w`}{\��\�\"�s�ܕ3I�#��\r6&\�!IҬ��\�#r�+k�{L�b\�L*7�w�\�@ �\�_(P�\���W=�ֈ0QIrf�W��n\'\�%AP`b\�p=��)�S�\�V\�o	Е+��Q3����$)�ƌ�sE���@\��=�j\nM[�0 �s]�a���\'�H�\�6hf��$eV��K�-\"�\rU1�Z�>\�wC\�\�siPoʑD\�\�B\�z��$cV�\�*-3~�\�q�1wobsN\�\�\�\�+�\�X!{�\�D=$I�������/1��1�>@�ā�T~$*v�k5&\�!�ެ �4��Ze�E\�k]\�ྰ.+\�\�ӆc�L�e�.�\�+�\�D=$Q���)���r�i�T��.p߸<Gy\���A=���\�\�zH�6+<�4�\0$Z��\�~�CtqP\�\��s��\�\�C^���{��Tg��h\�\nNy�X*x@@�\�|����d@A�+�DAc>��zH�4+���jm�\�3j\���5��A9�ʣh8+\n��\ny\�gL\�C�Ya)\�\����/0\�^�\�\�o\�zg(���\'��\��C�\�\�\�D=$љ�6I�\0�,gb2�y@y�\\\�\�\�\�(�m�\�D=$Q�\�N��\�`\�\�\�\�\�\�\�.k\�g�\���y�����ξ3ՙ��$\Z��\�>W��!&\"CA\�7\�U\�k\�\�k�KkD�`\�~YL\�C�Y�h��H�\�����T\�f\�\n\�c\�L.�B�ao�&\�!�¬@4t	�8~��G8�ۈ\�;�/ʅD\�v(��zH7+\r]EĘ�<�\�V���\�#Ѵ\�h\�e1Q\�\�f����H@�F��ui�ɐd;�\�b�#\���,jV\0\Z��$I�h00\�\'\�-E\�\��\�ꙡdzT웕�\Z�\�\�Ud��¯U%\���\�>�\rcEžYY�1{h-��>\�W��^G\� \�\�5\�W\�X\�Q[`��\�\�Vb!�f_a���\�:@=w%\�\�/̏\�b,\�5��\�\�\�\�v\��\Z�7�w\�\0��1?�1\�,�d\��P\��E4-Ě&.b4\rga�w\�GbQ2��\�\"q�m\�#\�\�=IEB9��oڠQg�D�5߄�=�\�|D\�+\�y�\n�\n\0?`��<H�\�ms��ك\�(��ba����\�\��\�11\��P�\�A��>��\�C)q)\���,�������\�\Z\�A�%���=�V�G\�E_�\�>Q\08����X7�\�|JDA>+\�\�a�\�<R^�\�\�j��Ĺ``�a\�W�;o��+\�7m�Ѵ݈��5��\�V��$�+iO\�д\�\�y\��\�\�\'\�]W��\�{\���}��&\�i�v�\�\�*r��{b�$)��y\�Wo\��\�?\�\��\�\�\�\�u\���]c��\��\��e\�\Z���oI�\��kn��+\ri\�e7�\�G\�\\��\���\0\�2|u\�o\�|➿\�<�\�ߟ{x��\�\�^��\�?�y\���[!\�\�\�\�[\��\�m�\�}\��ؽ7�gB9�<by�\�0�-\ri�B즵h0r�\0-�\�\�W\�\�>�*�c��_<�y졏oJ�_��<�wH\0\�>�}o(�\�X;_9C�KDCZ��a-\ZL�\�\nt&!� B\�`��\�\�`|>�^ߠ�0\�\�\�cn0�U�\�\�J�t\�͞�ܼ����%6M�\�\��\�ACT\�\���%r%\�\�\�\�G̿DT�(\�9n�U\�#\�3�B/D^���\��ާ�7��\'��)/*Ԗ&\�/\�nR��D�\�=�\'!7N\\:x80\�\�\�P�B\r�5��D����k\�|G3��!\�^�ݠz	\�c���K�p�\�Py�.\�	9�\��Rc�%�$\�^�ݜz�p\��\��P���\�YVS�*�K\�=\�@0c�9\�<�1%qn�n7�u	�\�O�\�k���2b��4cEk3\�\�-\r�,���M9�å�!\�u!vSZu�\�M1�\�\�\'H�2���!=\�~b�\�ǰ{�M9���I׺�!�>\�Uw}i��3q�M���2}\�V\�\�\r\�1B,6,�Q\0I��z!v3\�q71\�\Z�{\�\��7K\�R\Z���N!p8B\�B\�y\�Z��\�\�k7��>\�\�g\��C\���U�����\�K$9\�8/\�nD��q�C$\���	��V�q�t-&L�\�BƗ3�	�u� X���\"��\0��.|�\r8\�GZL�$˞�n7p�rC\"\��\�\�*�,�\�`��9X\�yx�/\�\��DA�3\�\nt��f\'\�\�\�(�$\�2ۛ\�k\�n ѣ\�a�����v1�\�\03���I�,3�׾�p\�&DB��C�@\�DN\��\�g�0n8���H�Å��3�RM\�M�\���U\�A\�a�ȉ�@\�L,\�k\"	\�N\�/ܩ܀H@p4)�9`\"\'\�#d\0�Tp�\�\�)\�}~�/S�<a\�F�!��:�ȉ�@ܞX\�\�D2�I�\�)y�8ط\r�\�ˮ��\��D\�D;�&M�d�}�V�\'� L\�@\�@\�jG^�I*&\���cٗ��|�Hl\��B�e`u1\n Y0\�\�t�Y����炮��\�\�au1X�\0��yk�C�2 t\0�\�\�׵����9�?)�d�|�Mهk\�G ��\\D�\�9\Z9����9P\0Ɇyք\�k\�\�L@\0	��P3��#ԡR\�\�7�M$�o�hz��%\"QB���\�pV/��?)�dñB���}���2$\�AR/l\�ǄM�᱇>N\�\�7\n Y\�w\�>P\�W�\02�*�\�\\q�r�p\�\�u\�� Q\0\�\n\�X�a\Z�ʈ9z,,dcb&�=�9ge��@�\�\�0�}���2\�\�{�\�-�@���e�%\��)�Y�e\�O>M�M$��a,� \r_e~)� Zߑ>$81�\�\�\�O\�\�D\�L_Th���2\�\�O����\"�D� ���D��A\�\�׼���H�\�Mهh\�\��y L���G~`\�Ô\�Kn����H��Eg�غ�}�H�)D#\�~�:\�H��\�\�\�ެ�\�3dJ\0\�쪼��P$[\�o�no\�Ƀ�\�D�L\�e�#�a\�\�Ý\�wP?\�3��B{�N\�&]���\��B.�\�\�g\"y^(\��0�7j�n\�0hC�����!\�\�P\0ɚ\�\�\�M���1/�\�T��\�LlD~��\�|����}���Ȃ\�\�y\�M�+\"2IO&i0��2t]&f0?Y0��[�!\"#��dB�Б�\�c\�0օ_x���ȃ\",�3{\�N�D^`̚	C{]�Y2_h���Ȋ�\"<t��Xg�gƬ�0��XC�i\�\�DV�?+\�^��G\��ӏS1`(���!\�?����Ȋ�y{�\��\0&m��>�,(\�\�U\�o=��P\�?VBߙX:\�|}I�k\�j\�^b/\���L��џn�?��\�?�����\�\�]�߾�\����ݵ�p}�	 7�\�͛;?x˞?��\�c\��Dt��i��̸�[\�o����Wy��On>��۷�P\n\���>\��W_w�澏��\�}�\�\��~�A\�G\0��c�(��{_,{�\��\��\"��\�}�6�&�Ǐ?�\n\�3��2&2\"_\\\0�����J�9�F���|{�\��\��\n�\��ߤ\r����^	����\�.��o\�it\�SO$/�P�\�^���1iְ��\0�cO�Ј<A�3_\n|���H�\���G- \���:t\�\�DkAփ\�L��\�P\��\�dEs\"\���z&|��\�=���3Yn!�1����$iN�\��@τ\���Qژ\�\01\�Z���>|���H�\�D:y�H�����y\�Ȼ\�\Z\�c�/2iR���f\�\n�`\ry,�Y��\�3�\0\�\"Y\�+\�\�\�ʋD�\�|\�m\�c��\�P��\�ր0_|���H�\�\"l�7��X�0G\0LlD~�\��/�E$+\�[�\�œ��D�+�`z\'����/�E$+Na\�\�E\��\�_NP�$\�\Z\�\�\�\'���*��>��H$\�\\\��R\��P>H��\�X�\"=/�����/\�\�s!p��� �S>H��\�X��0;\�c@�VF̕\�T\��)�\�|a,ʁd\��=�\�:D*#\�\n �ʛ?�\�ч�{b\�?4�7#\�\n ���ȇ�AR\�Ƣ\0�\��\�?4�7#.��\�i#K9���ٯP\�yP�k\�c�O2_\�r~*��\�t\�\"qX#KYT4�7_p\�K���/����H�\�E�\��s�?�\��u(��fb\�Ky\n/`�0m��%\��\r \�\"a~��o\�\�<���\�u\������)O\�\�\�\0_d>*\�\����!_~�{�1��,*�ʛ/\�)���\�\��\�GE�\\�\0�5 ��#XcCYT\0�>\�X��\���I�\�(�d�ϩ�eQ\�T1O�Χ\\\�\�Ơ)�ٲ\r :$SXcCYT�fb\�I���/����ȂC ZD�)�\�Ua\�L���\��\���z\�Q\0\�_y���h&V~<�\�zf�0\�?�f@NT.�L��џ\�F=���\�\�:&B\"]�3�\0���o�,8�\0�U\��E\\�a�*,���H�\�,�|aZ@�=�@2\�\�0VUX��\�ʋ\�,�|a\Z�\��ܹ�[\�\�\�=���\0�ZfB$҄\�1�!���O�l\����9\�:s�6�0q\�L�|`3�\0��\�/��8�\0\�� 2b\��\�L\\��I>\�{V\�\���\�\�ׁ\�J��7�\�\\q5#���\�/i3_\���Z\n +\�\�cgd1q\�\�$\�,�|���r\�AdE�\����\�3&H\"-X\�\�]h߫u�\0�2\�L\�e\��HOL\�fu�/��i�\�Cd���\�\�(��>\�C�\�0_hB��։\�J9��\�TL\\�\�\�Ӕ@\��%\�c\"@V̭\��a��ә�8�\"=m���W�|�|>\�|K����3�\�H��8�\"=mX�:�/\0�\n|F����\�1@��!\�\�š�\�ӥi��\��\r���p(�\n�\�Ɣ\�N��\�\�\�\�\�\�Ҵ݁��hKvф�h\�\��?Fť\�\�\�=LJ\�\�\���֧u\�|B��h�O\0ImA!V\�c�\�W8ֳ���d��Z\�\�g�H1��էCDt�\0\"Z\�@0�	\�\�`�\�v\�\�`X\�\��|i[@\����O\�P\0�\\�W\'����%�F�\�\��\�:4^�p��CO�m�CDt�\0\"Z��0q���(\�{4\�\�3\��ܒ���\�Wх�h�o\0	�Ao��\�zJ\�\n=\�է��\0\"�P\0��\r �� ��*.��\��\�\0х�h�o\0�?+�`�*�܆oP�s�\�\�8@D\n ���>Ҿ�\�\\\�0�U޵f!7\�\�\��-K\�\�\�\�E!}��:�˖	\��RK��S�\�\�b\�\�P\0�E\09]�(\�C~\�2�\Z\�\�s�\��\�g�����\�\��heH\0�\����\�\��D�L@P\0(��v.�\�3T\\��\0�X�uت	?+��	\�\�\�Dt�\r \'*�\��& PS�H�\�t}�i����2�\\@D\�@�T.\n���\�^K���b\�w�i\�\�&�1\r�\�~X���ݘYl/�����Q\0�\\r\�T`�:�\�\�>g	\�y�����\�O�\��k\�2_�\�6��\\b;�\�\�^�\�1�4|S�\�7\�\�\���^ {/�\�\�|A��@v*�\�f\�P�\0VX7m\�\n�|��X4��\�p\�\� pL-O�:�/QbGDt2t*o��_�!\�\�\��\�7�S�C����\�Cڹ��!Jl\���B\�c\�Tޔ@ ��a��::��\r�!J\\�\"���x\�\�o�B�*����\�\��Q�\�^���|�X��m��\�?\�U�(D�K�\�v*4��^Au�����\�|R��jp\�Y*�B2�Ĺ\"|l�V��V�\�ʻHҗ;VbZ\�\�P]�\�t>�\�d\�B\�#�<�\�\�&\�!/��\�|@�\'��\r ZL(:�92u��&�\�H�@ބ=G(�!zp�\�\0r��G!j`j\'��\�\0&�C20\�=\�\�\�G�{!*.\�\�6�h-�\��L�\�\���\�$9fXa���m.\�s\"]\�?DOv��\r *��\�t^�`\�[C��r8�3<��ZL�%��\�+ѓE����Q	V&<)\01\�H���\��B#\�5!\Z�})\�\�y��:]t���t�<o\"�j\ZbB��-�� \�ޗ\n�}%zr�\�\�.j*�\�Ŕ\�yc�m_���\0ѵǕ{/�{/�\�\�\�S\�¯=G\�[�\n\��:���\�+z\�{sE�<�Q�\�Z\��)�\�\�\�n\�EB42��)\'�d�,a�\�\�.��H�F\�\��>\�@ac��\nшz!y�އB.\�f\�L,ћ\��n\���\��rf<Qy��ļ��\�`�ZͼC9Q���\��\'�BDJD�\�}��\��j�G\�%sѱoP��3?\�H\�\�Ō�A�NR9�P�R\�\\��\�f/R\"]FCY頡+1�\��3{�\�bZ?\�)���\�	tg�\"%\�\�hRޭ7w^r\�;4\�JL�9�\�\�^�\�b�o��%�\�\�1��j�\�*ob��K�L,�Y=	ѓ��\�m�\�ӕ71�(�\��E�*�#!p�\�f/\�\�\�b2\n\"ˣ\�!<Q\�½\�\�\�ZP(�� �\n\�#\��F>@�Q(��G�C���\�ޤ<����H v�U��\��pfo\�z\�M�M\��н��j�&��p�mp�A\�N�[��\���j�F���\��W{gy�:�\�X91��\�?�fo־Xb6��Yy�	(\�!\�{��&�7�|�\�ѐ\�pp����D\0\�`�ٛ/�|���\�z#=�^��c��\�\�>@烈`l{#ʍP��z\" \�\�t�}���@$5\��</y�M\�Q,��\�U�\�t^�M��3Q]J��e7}�j�A\�*,D0H^yӻ�\�\���=���bI\��?\�\�ÎU>\\��\���ӛ���W���\�\�\\t3\�ʫ�\�<p�{6\�8y���9V\��t�\�0�X���ˏ7��\�{� ���=7SN�\�o8����\�\�{><++!\�g�ʙ}���Ģ8�u<��]��\���\�_\�L�c\�U�}\�6~�?\�Q{.�\�B\�\��3�P\rc�E9u�s5�u�\�\��E��w~붷�Sw\�\��3�g\" ����هjK,\�g�\�CTt\�@�!\�j&\�K��\rr\�1�{.�gd\�.D@�_9�\�0�X�����\�<y\�&\\\�$\�0��j\�i4q\�c�\�g\"����ه\�t�7�:���o�H��\�@\�}|z<\�e��\�n|�i�\�Bb�\��&�?P�2!�q鷞\��\�\�u�/�h΅�\�\�B\"�\�a��\�{л\�3,5��}\��مāB\�\�1�\�%�s\�7�y\�S�m~\�^�H,e\�k|�\'�m�\�\�\�@�����U�ٗh�w\�\�߶�\�\�߶�\�/o\�\"��\�q*\�)�\����\�>#�UAD,���\���}	�x\�I�\".x8��������t6A\�\�Swm�����=#����3M��u{_�/\�I�\"\�)�#� �\�\�\�D��\�P�/۩|�\�i\ne��o\�I6�<�\�\�3�Q�\�)\�=�\�jM���>�\�\�\���\�g�P\�H�\�\�P33\�ڏ&�/\�ASb�\�\�:�\r\"s\�\����ϼ�>C\n\"bF\�[�\�d��J�\�	D�ϯ�b=c��CAD\�@�\�y\�싕Lޘ<n�/V��{�~*\�KP��;\�p\��ٗk�E\�?��\�`�����w_�\"�\�+x8PV���<\'�5��ӕb�x�GT(�P�\�\��RCZm\�t��2ce)\�\0N2��\�M\�VnJ\nD\�G���}\�\�7w>�\�\��\�\�I\�\� �Đ\�\\�Á�C�,Q�([1�\�BƗ5�M\�[��\�\�܊\Z���<4n�/�\�\�>C\�\�7C�\�\�\��\�\�\�\�\�u�\�QD��Sw�\�nF�c��\�yr�7�\�\�ܽ����\���\�6��\�OR\���\���\r\�kA��^\�ձȚ���\�kv3�қ!�7�\�\�_��717\�\��\��\��\���A`,S�\�.\r\�u��F��ג-\�M\�m2�!6�(�kN=�{@D��\�@5�\0_I���G�	7$_�\�0_Ip��\�x\�nJ���Im\�iN\�[\�;0\���1�\��4ݔ��!�hH,j\�\�}8�;V�Q�rO\�\�r�\�쭴\�D\��\�\�֚�G�=���%��K+\�:>��ӑ�p=	)���X��4_�Di[�8�4\�\�)\�S`	ƼG\�N5�Amo\�$21��5D1�� 0��^\�?�\�S\n3��+y?\�m[\�\�\�&\��~�al�54\��4\�6L\�<��\�/�}�L�w\�Ùݨz!�/0\�.\�\�\'�\�5\�b>\�\�&X[����\�\�nV��`\�ǲ�i����G�m�\�vD\'i�>�\�\rkFVO\�㈋\�~�\�Z��5�Z�Hߺ�.��ֺ�0��YT��\��\�\\c�ˁ��I\'��\�2�q�N\'`���\����_�\\c�˃��Y[��\��pf7�^H,�Z\�\n�(/2\���׈x@�B\�bmnŤ\��pf��z\r�B\�:�t�\�\�}r/�\��\�kD|���7�G<;\�N1{�U��^Gz��\��@��\�5\"N\�\�\�yS\�f��p��\01\'qS�Ϋ\�i��\�\�\�J\�)\�7�Z\�\�\�8ZT3�\��-�\0��g��6�\�c~�?\�ܷ\�C�fq!�j\�*}\\\0a逶��\�i-\Z\�k�`\�/.\�\'\�\�\"=�<W=V��0\�\�ڧ�=\\\�\�z��#/��\\+\��m��\�LH\�n�\�f7�WSt\�\�\�\�\�J�\�\�~��-\�os�ĳ�����\�1m�\�\�A�I�\��,���?��q�\�\��\�u��=��\�=O^��\�\�\����gN�}\�[���e��@��l\\��6�Y\�/q\�d��+�$\n\���O޼C\�ǟ�z+�G��V4\��\�s7\�\�\�	<#{�2(+�\�e��D��\�\�dD��Nz�,�v\�zc�\�\�\�	<#{���\�2�L�H��]�5{h$ԓ\\��\�q��=~憭`�\�6�\�\�\�{\�	<#{v�{-�3�Z�@\�A$�\�C\�>�\�kV�/\�~�ƭ�@�\��6r=<{\�A]�^\�u��\�\�2	��V�5+��ֆ\�<\�CN��\�Y{c�/hv\�C�3b�g\��\�넗�}(x6�\�K�\�/\�ݐ��@\�fm>b�m6�-\�\�f��\�PV\�< \0\�!��=ر�{e\�5��POD�\�}����Z=�w�\��\\�\�Z\'ͼ��zH�0+�臲p3s���4\�O<s�/5\�4+�\�}@y�?\�W\0Sz\"x��g��CY�L�?�玑D\�]\�]1QI4f\�PV�ۓ\�\�^y�Sj=�)�����~�\�\0�\�]�{E9u�\n\�Ey\�\�s�|ۓ�\�J���$\Z�B�r(\�G��bcD����a<�\�JEx������\�\0�\n\"�Euz�ַ\�\�S�R�@�G\�g��0ۡ�B6�\"�$Q�LTCY��q\�\�[���ChX�ѭ�!��\�z�\0�\�\Z\"�x�9k>?e�\�h�\�\�\�7늉zH�3+�h.��\�\���������c�-`�#�\0|\'{C?�A@[X�W\r`ڰ��L\�C�YA��\\p\�z:�9�{�\�\�ѕg����t\�\�\n \0u\�\�W\��\�+��6��\\\"�D�9[\�\�>c��(\�\n�O-�\�;N0��p=��\n�\�\Z\�\�344g\0]\�0\Z�\Z\�H\�	�`\�S\r����(&\�!�֬�vK�;��0u�9�\�ߣ\n�h���Dv�r�;�\�\�Vu�e��oP�h;�L\�\0���\"��,֌�zH�6+�����PCW������&\"�l�\�o\�\�@@[>\��\�#����R�C�60͘��Rc���\�\nS{�\�CB]Aܪ�\�\�xؔ\�!\�\"�\0�i�Z,�\"?��P����A&\�!�ެ\0qvH�|\�ܳ� 8�Y\�jd\�\�PT�!\��mkJ}�!\�,h^\�L\�C��YAΞ�\�\�\�Q��z�Q΃ \�pt\��P\�\0�{+�JV�c\�\�@+��x�1\�Q6&\�!IƬ@g\�\�d���P�c^ ��3��C�{D\�C?(\�\�<tG��@+��xdo��.c���\�\nv��\�\�J�C(�*I\Z5��\�^u�\�3&\��m\�D=$I������U��s\rO��H��M�4c�mN�\�s\�ǘ��$9���T��M;\�^5d�\n \�\0m\�w^\��ｒ\�Uc��$\�\n�P�\�G\���1WͲJ����\�3/\�r���A\�D=$ɚ�\�M}�> &G�\�H�u�6:�Ϋx\�\�6I\�kL\�C��Y��^�\�����\�\0�N|%\�=�BZW�w��$oV�V���y�\��6\n \�\�W�0#�\�;Ę��$y�J�݉�u\n\�\0�n|��\�B:�)\�cL\�C��YE��\�\�s�<P\0>�\��3CF͸b\�D=$\�*��Va���]��G>(�05�\�\�\�[��1QIVf\�y�:v\�d\���P\0��A�\�N��\�4�jL\�C��Y���\�\����9\�G5U7+@�m{\�:hӜ�\�z���di��J\�\�1v\�^E�(��2h\�m\'H�ma�S\�=x����$[C�U*psͩGh\�w�\�I�EDT��\�	4��;\�,�\�D=$Y�Uܾ��\�{\�>Z\�]\��������Q\0�yV\�]@cʚcLZ(\�eL\�C���]e��\�9\��D(��&\��Y��Qƚ5x����d��3|%�\�\�\��(��f0&\�!Y�}�N�\�nc�\�Y7@DЀ��hM!;����ʬr{\�=ց�\�b`>$X��1Q\�\�\\��\Z\�\�\�@I\��\�4��@���\�D=$�4Tt�\��@w��\�{�\�hB\�PV�\�c��\�\Z*�\�\0[4t�.@D_Z��	0&\�!Y��\�ˎ AX\n b\�_0&\�!Y��rΠYW\�CD\ZQ�\�V��5&\�!����`p�(���0&\�!�f��k�Pv�?\n b Ј\�B67&\�!��\�\�`\� \�qD�(��@�\�Ø��DV18�q�p�9\n �\'Є����zHd\�\�Q.(�9�\�\�h��<DeL\�C\"k1s�%\'�\0\":Xt�n�1Q��\�́WJ�2�1Q����#\�J��\�\�w�\��1Q	�(\�C)�.D�l�\�LDzQԁ�c!����y���M�3\ru\�EQ�l\�dʋ���LDzQԩ�9�\n�>tq \�\0Q�^u��\�aH\�t\�B��@ۥ\�;��:���\�f\�GJN)���#E�\�4@ԡE�.3�Đֹ��\n!\�m�sK���(\��1sL\�\�\"^�fYu\�\0Q�^u��9���\"\�m�\�4@ԡE��f��\�Ә(o3���(\�5s^�QoD���͍\�ˊi��C/�:S\����ވa@[;P4�Q\�4@ԡEfN�܈�18\�\�dLDzQ\��e\�\�ȍ�,^\��)o�>1\ru\�EQǷ��c�x�b\ZhC޷^g\Z \�Ћ�\�\\fΏU\�\Z\�bh3��ɧ\�\0Q�^u\�4kH�kXK�~��LJ�w\�\0Q�^uB�5\n\rk	\�\�,\�U̘�:���Ҭ�h\�\�A[z>9\�\0Q�^uB�5\�\�\�.�b\�\rx�]\�ט�:�����Y\�A~D4����5\�\�fLDzQ\�Y\�И%\�E\�̞ \�cLDzQԉŬq!ѮmQDn���$\��\�\0Q�^ub34��ѱ\�(D*D8�1\ru\�EQ\'VC\�3�#���.p8c\Z \�Ћ�N\�f�Q\�v��&\��\Z\�\0Q�^uR14N㘡u$\"\���\�\��3���(\�f\�X����],|>|\�Tc\Z \�Ћ�N\�f\r\�(\�.B_�r.\�R\�4@ԡE�\�\Z���\�\\$7L\�fLDzQ\�\�ͬ�2\�+S�*\�*c\Z \�Ћ�N�f��\�7�\\�\�|>�Eo�\�\0Q�^u\�`&nM���D�D\�k7|\Z\�\0Q�^u\�f&H�+��4�N��1���(\�\�  ��(�\�\�j�F٘�:���#��AX\n�Q\�$P��\Zec\Z \�Ћ���n&8\r,\�l��@��\�\�)+\�\0Q�^ud\�fB��\�\�`-�z\'�:Aݠ��[ژ�:���#f&R���&\Z9k0Q�2G٣��n;�1\ru\�EQG6\�L\�\\\�4\�\��)\�V=\�4@ԡE�3�C��1���\��\�e�\�\�4@ԡEY3A\�\�4\�\�4�`\�X�\�(�\�DCQ��i��C/�:�e\�\�C`Q�ꆠ�4 �)�M��\��,x&<�QCP\�\0Q�^udq���빸ދ\�1;\�Q�\���SO\"rc\Z \�Ћ��,_+	�P\�S\�Ԙ�*��\\\�/��i�\0\0\0\0IEND�B`�','UYoHtUjqs6lY9e4KdTnpkGyt63Lz5zxc94GxwMhXqITTEcUdo7I6XpdcnljS','1','2014-10-12 03:00:00','2018-04-21 08:44:04'),(2,1,'TarcÃ­sio Belo','tarcisio.belo','1001','tarcisio.belo@vert.com.br','$2y$10$pSvmOYOBpAM7tvWaHf76HOIleYfsUOSNzfURS7lVT0dzK4MMby2/C','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0\�\0\0\0\�\0\0\0f};\0\0\0sRGB\0�\�\�\0\0\0gAMA\0\0���a\0\0\0	pHYs\0\0\�\0\0\�\�o�d\0\0\0\ZtEXtSoftware\0Paint.NET v3.5.100�r�\0\0(pIDATx^\�	pWv����I\�d&�L�R5���qRI%3\�L��T����2�6���MB �Հ1�10�6#�\�`�\�,\�`�,�1c\�\"V!Ďv�\��[��������$�v�~���?��v\�\��=Ϣo��<��[&�\�g^e\�c�0�\"\�2Ca��ȃ�(e�L��:P\�S�z\�<��)qf3S��\�y\�1#	�)A��m@[Ц\�3?PM�̳�5\�_1�\�Dfs�i�`�\rmD[\�f���Tw<�q\�b��G\�5\�\�c倨�}@_\�\'�\�;\�x��`~\�d2K�{���>\�7�}E��\�\��gO���Iu\Z��)g��@�\�w�\0��&�n7�1s�;��\"�|\���r�gn0p�B\�1_1I O��\�+�\�;s��\������R\�;ZD|\����Pn�\�\�ƃ�/\�<���\�#r\�K��_��=���\���Y�\�2\� {4�>��r�gV7�\�0\�\�I�\�}\�k��7j<���\����\�T2\� z4=�=\�\�jX<ki\���\�\�L	\�M�[�\�c\�ݥoI\��o\�0�\�\�`y��\��\�򬹌��өY\�F\Z\�1\�Xy�]\�a\�\�\�L!\�N\��Ƭ�\ZFϢm\�\\5\�2\�Qþ`\�0�\�\�$�\�Ś���w԰?C���ƫ�\�N\��!L#9\�þ`L1�ޕ��;��w�ʹ`l1\���ݳp��o\�w�\�T灱�75���2vT:�g$Gz8�y���g���F3\�U*����\�\��n\�1\�&h\0Z�������f3\�]\��Ё���(��\�\�\�\�4��3+ci\��6�є��\�\�q4k�?�\�u�\�\�\�\��m\��\��M@�\�\�.\�㹍/\�9�\���M�\�$PF�dꐘBm\�S�U�\�\�0m9M\\R\nu\�\�Q��\�н�r.\0\Zq\�s&\�0sF9�Q�l���=�(�\"�����\�\�H���v���]yd�V\�$\�(��k�#l˩\��\�8JJN�\�(��-�˟�R�O��g	:�:*9����5�4(A;}�D\�T��&ks��\�r��s��;�s\�\�\��fik\Zˁ\�>��\�!�\�R�RBZ7\�o��,m��\��TC{\'R\�X��\��s%+gw\�g~\�B갭��\�\�\�~\�h��A��{QN�\�G��\�w8e\���=�}R��))�}n[��Z�K%/{w\�if�\�m��̺\�\�(5-Yi�@0t\�ڇ�����^\�@�t\�֗\�$f�y\0&��\�up\�)\�z\�i%3�\Zw/��}��kbhT�Dj\'�\�D�Ω�D��\�\�%o�/H@����bz�S�)#\�\�$\�\�<%3{\Zw`$c\�\�\�\�kM�\�#;j�O\�Li��[�P\�ۿk\����G�\��j�t\��+%��\�\�d��\�t\n�\'�\�L�;[Z��q\�\�H%7{7<��Q�%g�k\�$<6.���;u6	0��\�\"���{t�K\�\�M�A��k���\�EGh,E\�\�\�\r�W\�\�-Ap���\�D�Ё�*]\�8*\�\�1��HR>#��յ\�� \���Ip�5{L�\�7��������\��;�\ZnKv�\�6j�a��\�M�л���~Iy��\�9�9H�{\�̙>�\�^\��\����\��\�3x��\�[pe]�v\�,6��4�<wH\�	�>��mbfاK\0G\\\�5\�-���v\\��GAb>\�J\�\�%��}��\�b_��}%G\�7�c\�I�k\�\�k\�\���N9ԩ[\�\�\���lc�\0 f}�w\�ow�G>��\�j&.�k�\�QV*O\�C\\�����*�ٙ\��F\�L\��)9Z˸a`�\�R\�m���\\�]R�6�N\�o����ک�Q���\�q:���r2��O�|�\�&��dəy\�t:|�\�\Z����5���~�Kj�m�*\\I\\\0�S#YҺSz\�\�Z\0�0��ѽ_\�oyL�\��<\0�J�|4��=]{\r�K�`�\�L\�w�㚻\�Тu\�sc�\Zg[&��;�\n�\0�6ǥ\���G�L�\�eana����;\�\�)\�n\�\�Ϝ\�Hvf2\��\��Z`��g\�\Z7?Fo\��:�G F\�Nɲ(�K~��\�\�̗w\�r~5�<����t\�A�\�5 �<�5a\���O�f���|z)�\�\�@�T2m\�\�cm}I\�ȴQ\r#2�*�|k��Wy�:\�iҷM���\�N�1\r\���N�\�Ғ�\�5ǭ\�6[\�y��Ɇ\�\�\�\�E�S\'|w\�\�\�&\�:�tc^\0a#�Qhfb9Pp9G���\����\�O��\�x\�\��NXʢׁ\�5\�~���yX<\�+�\�\�LVrm^\�\�T\Zb{nljE�]r�\�7&֡\�ا]\�\�o�t�#`\�L���ci�T��q}U>)�����\���\�÷/8%ė\0\��\�\�p\���6�l\n4�{%\�\�1�7w�8��_M\�n��w\�M��m�S��&\�z�d\��\�n\"�\'ձq��}R^L��%\�݈҄1H�ϸ�s��\�\0W\�\�7��v\�oV\�\0ߜh�\�76Zm��\\Y6\�\�W�\�\�F1A\��f�pq\��wqϡ���\�1\�Qee\���\�\�p0\�\�<����.\��S2\�o�\0`D���]�N\�-WA>	�\�\�K��1\�j��o\�\ZW���EU�\�0��vy�E�#�ym�\�0\�\�y\��/\� \�\�K�\� H��f�]\�2��\�s&,�\"@\�\�]�f�~\�Ε�d�\�q� F x�Q�D�+[H�o�PG P\�����(R{C��-8�\�\�����KJ\�Mc\\�\�3�:����1�\�^\�\�G\�\�;\�j,�\�C$�������J\�\�7.|��2G�`|`���\�H�\��i4s\�X\Z=j(�\�ӛҳ��8�\�7�$Zm�RϩYc��Mq3�[n\Z:t M~\�EZ�p2mZ9˯\�:��`�U�ޱ\�ݚ�\�]\����2T\�H�\0�1e,\��\�\Z�n���Mt�p�XEG?[L[Vͦ�ޙHoL�P�����!4x\�Q�\�f\�ȗh\�\�\�i\�\�\�i\�쩴d�lںv\�\��6�:�����\�\�@U�>�\�%u��zOA@?��֬B��C�d�Q\�:zƅ.2T\�X�9\�#���>@6i��}f#�~��\�]E\'�H{�-�\�\�к\�в�9�p\��Y3�\��\�o�\�g���`\�,-\�\�\��r�\�]Fg�|��\�\�F�_���.o��\�\�\�v�AP���ӹk7\�7b��ut�\�\�\�Q7��P8�\��\�E-j��r`\�\�\��\�f�[��\�??C􍃀����F.l��pG#AS�E�ٙ���\n\�\�\�ቢoƛJލ3.�\�a\��\"A���Z�6��fW�\r���\�ɮx��n�o�p!��\�a&\�}Lt%�ٕ.\�s\�~��y\�\�J\�\r3.\�)没@\�,@\�Y.\nͮ�O�V\�wO�\n�����{\�ƙ3��i��\�)�fGpQ@\�#��\�/&C\�=r\�\�{L�9�`s�C;�b�#\�O��دG\�\�*�\��\�Qr�\�8#ގ躟ev��m\�Qlv�\� �r�|\�p��\�\�\�ș&\nq\rn��>���K>q��\�\�3\��C�\�P�k6qR�۳X죋��*�\�o���!����w��D^���K>q	m��\�7N\\`\�\�\Z��b�!@\\|J���\�އ���1�\�k\�b�#\�\�_\"�\�\�\�\�O�\�2��`�y�\���(6;R|b�\�G�^\�2�\� �q���L�\"\�W~$�ّ[�\�\�>��\�Va \'�\�|\\y�J\'\�$�\�7�D�ّ\�%\�(6.�]�^�h\��z \���Į$\�e^��\�\�\��&x/@4�C�C��\�M�]�t��\�5G��y��A��D#�\n_޹Ӕ\�uH�X#GEfgfO{9��^�h\�T\�\�o�\�i\�?c\��\0�$�Y��-��\�rzt~��ǗV�v�\��us�\��b\�iO�7\��)@�|���UT{b<U\�\�J��\�\� ��z7�=�:=��\�/_驵u�\�I7�\�\��FW=9�$!%�j�l��5\�F�{��>Ϧ\�㓨\�\�*�z���\\}���*?���\�a��j���\�\�ū\�A|���7n5%r(��\�@.UG\�\'&Q�\�/Sա~T�;Y\�o>�\�]WFQY�m�\��X�<�O%G����n\�-��\�[\"eee({�|_/��f��\�[6ݯ��#�>�o4��\�3�\�ߗ�e�\n�:\�\r��)5$p(���\�h�)ZF5>�\�\�\"M_\��	�M|:�;�A�֠���T�E��[LU4Jo\��\�\�\�{t\�^����j!�\�\�C���i\�m���\'/�F\�\��\"�?\�3�\�%AR�B�\�x\�{%%tU��\��a`\�ܗ�f\�\0q�4�.P\�\�L��s\��˫C\�^Y%ݸu\��\�o��F�xB���l~�b\�o��\�O|�\�\�Cɷ\�\�*<�\0I1\�t$\�\'\'\�o`\�ܱ�XFD՗?hKS}�U\\\�\�p\�\�}��й~\�v@� X*�\�p�<\�UǫU\�d�\�#�\�[��\�C�񦝎�\�<Ct#Iv\�*=e�\��<���\�\�QQ\���\�\Z-�A��y�ynr�>\�-��\�3_]��[~a�\�\�+@\�Cɷd�\n-@֚v:�]q�X�\�U�j�\�\0qZ�\���\�t��o\0#8z\�&$�UO�����\��j}�|b�}\�,>R\�\�)\�N\�Q�;El37NYoR��Ӣʋ[��pcP\� 00�0né����\�\nz�\���\�w\�\'f�\�?�sJ<���ÑT}�%���W\���\�JT\�N%�}\"/���\0#�re��\���筸��j��+�\�\���O\�T�i�\�c����!\�\�F\�R�Y�8\�f �h�D\rHe\��\��˷\�\��}��Tr�<���¾�|\�@�A�Ě6:�]�\�`��t�\�w�\�އyn�ɺ_��]ΧX\��\�7@\�K\�\�\�#�k\�\�Lv�\��]0\�f� �\'^\�I�M\�\�} 8��>\0�(~�\�Xm������h�\�K\�\�\�#2ִѱԜ�/�+\�A\�2\�NTQQti	N�\�s�18*\�\�R\�g\���K\�\�\�?\�\�}\�P\�\"@\�6:�\�oȃn�\�GPs�U�z\�s�\�D��a�\�3K|7\n��s�%\�:�y�u����\�\�\�\��z�hKM�(r\�\�)� \�1\��\0���[�T�;U{v\�\\v8J�u(\� ��6:\\��݈\�`.R~�/�^=\�8��\�&����\���ܟGOM\�\r+@\�q�Wg\�i�s\�C5g��c\�9���-�\�\�1T��\'\�,��\����\�}\�faEeU�\�}9T{OGʿ�[o��\�\�Cѷ\�\�4\�i���::R|�� \Z%[\�\�\�T��\��r<\�<��\�\�\\�\�\�Һ\�~][\�^quUC\���\�\�3x;d🉮/@\�;ɧ\�\"\�]ϡ\�~\���E\0\��\��\�\�)W��\\�:\�G{ޣl?�/U\�\�I\��\�#�uC2@\�g.���S�\0�v8��#�e0v\�>\�����\�=�\�\�k�SI�K�C|&�\�\�2@*w\�j��JB�m��b\�`o3	E�\0��\�3їǝv�\��\�w\�	R\���zI�B \�5�W�]�{\�hMU_��\�\�fSM\�R\�H͡�\�)��/Z��+�{>�}\��G�\�\\��D\�ӶT�7�\'��T{z�(;�\�<\���}�����>}\�2�\01Q{|�(;Q{�5\�\�Ci_(\�w\�\'n\�xߔ$;��\�zpt��/^�\���G����#x�Ć\\q_(\�w\�\'n\�5�S%[\�.�J�B��K>q3�\�n�jg;M`��\�D՞T�k�\�}\"*\�\�sRd\�\�z�_(�\�F\�|�O��\n\�}\�\��S�\09f\�\�z\Z2��\Z��\��ޫ�@�%_��#�����jg{z\\l\��O\�b\�?/\�3���ϒ/\\\�\�\�F���WD1مǗWjKܥ}f\�W\�\�-A�L5m�`�\"�����l\�\�_UߢE�}�|\��\�T\�`\�F�\�\�\�M��..�\�x�>B2�f\�衳#���/\n\�`�^{\�\rq@\�ܺ�=L\� �i\�\�a\0�\�y\Zϊ<<���z�>�oR�=|�\'\�g��&�|܎7o\�\�j0ᾠOR_=�����w�>a\�\�ӕP/<�*xV�\�\�<d�\���~<��B�g�i��>W��v�Ah�\0\�ލ��\�o\��Uxh�i��ħ�� RK���GT�y&ަ�}�\�a\�mZ��5\��\�\�v��\�}�\�\�\�-F���*<�\0yִ\�#Z�\�\�hE{�\�횟,�Ϫ�\�\�i\��?\�U$�g�\0�<q\�\�*n�w\�\�\�\�*<\�77$�}\�ހwP59\�&oB\�`���xb�q�)�G8숡\�\�/ko6�\�p[\�&��h:�\�Wa�\�xc�)�GشҞ���9Q�\�\�P�l�7\�h9*,�o�S\"��9ؓ]\� \n�9@\�h�\�6����\�;.�zDH\��R\�\�M���\�y�\�x�MqI�C��\��\�rmW:w\�m���NrS��P\'\�\�\�T8\Z\�L7%����;�\�齳\�̾9t\��Jzt�\�p�lԁ�P\'\�\�\�\�*�w�\rSkH\�!�w$hbչ�\�{|��\�;\�D\�ƺP�\�&�����F��l��[�\�*>��½\���{v�\\*=��\\i�\�e�,�i�u�n�Ma�d�b0\�D\�M�<\"�h�+~\�\�9��-*9^�\���|	\�\"��\�\�\�=\nWa\�8\�3\�CC&���\�0Q\�F��x��}]@��[�\�_�]�zpe�>c۝\�+�4H+�auJm�h���1d�ҝy��CQ��l\�	೔&�Sj�G\�Q�\�8�w�\�\���B���\�\\\��4]l�G\�S�\�8�/\�jVC��-\�=U@g\Zp$h(\�;\�\�m�h�J�\�g\�n(�#8@��wҭ��t��\��7뼟Lkە\�\�7Δa*\�#L񆶴� ��,�@�UTUz�n�(h� )\��]-��\�+��:Q7ڀ�Hm�J��}�ƙ~\�\�4\��k\�\�\�Y\�h��\�s��{\�a��z�Qy��n~��\�\�f�̦s�ߧ�\�\��\�A��m@[\�&��@\�?R��\�8\�CAǗ\'\�\�Q�5q�c\'\�ݲJ�p5*\�\��\�Ct����eч\�l:{p!];��\�\�\��Ձ:Q�\��\�ĊD�\�~LQr�\�8�?3ޣ�A�jY\r:\�\'J�v\�\'~\�-7\���7��\��?���\�	\�\"�޿w�I\�\�U�\�\0uۂ���R\�=4�\�Vro�q���[��\�M�\�\��vy,}�N<\r>\�O�`ۧ��{��<]\Z5��-XJ�/�����ӭ�3t\�\�v>���\�%�\�-m\� -�\��\�_���yi�D�};\�6�mD[\�\�K\�v�}��\�B6(�7ܸ�?1�\r�:��\�\�ѭͭ�x}�_C��S\�ӌ\�q�B�D\�\�I��))Ԫ}*e\�#���b�`�gΧ�s=\��\�\�Tv��o?(+\�ӯ\�Et\�\�>���\Z�pl��۰\�/m\�m��|�\�\����:���[jڊ6��&k}@_\�\'�\r}D_\�g�>�|\�@�\�?)�7ܸ�\�3�T��\�\�VtmC+��:��^Қ�\�iK\�w�W�$Ѐ�$\�\�L�v	u� \�!��(D0`�\�t��Z\�\�g���s>w��\�Je%7�`�w\�RH�\���S*\�P\�@]�uKm���}\�+���\��|\��G�\���\�KM_ɼq\��\Z\n�e۞�k\�[Q;\�A��\�4iD<\r\�H\�:w���\�A�̜��u��,\�D[<c^��u\�w@E,\�>#H*\�@]�Sj�\�,��>\�#�jX\�D\�w�<�-|_Kc`qR��o\\؟1��[m��v4z`u\�\��H\�b:�Q^���uV�ߪ��\�\�e���	\�@]�Sj�ڌ�K}j(�-|_\�\��M�Z�3%\�\�\�\�P�����}�5�\�Ӄ\�\�\����Ԯ�\0�L�2Gmɢ墨�	\�@]�Sj��]\�S��\�1�\�Jce�*YGϸPE,�r9|[}�Ak\��M�<h\�&5��(>#����w\�7O�,\\�Յ:��Aۥ>E�Ũ��\�\�X��r��\�\�C7.8��\��+\�bhڨ���B\�GVn\���\��#_7\�uIm0��K}j*06#��4�-\0���\�}\�\�qEk���E�\�\�H;\�nK���\�Aij��\Z\"�\�L��5t}\�zQ\�\�u�.�\rf\�v�OM\r\�\nc���ƴ�v�s\�*�q�ô\�R��Z\��\�(��<\�AN\�\�E��\�T��Q\�\�u�.�\rf\�v�O\�\�c�1�ƶ�f�Gɸi�+Zb��Y8�2��\�&�\�oN���\�\'�\�����&�C�[m��Ԝ`1�\�71K�|�޸�_1��7X�}`Q\�\�\�2�Tf$\�c��\�EQ�3q\�ti�\�\�R\���>�AZ��:���!����XbL�qY>��+%\�\�1��\�˅�\�mK	�w\"\nIt���3 P\�m\�\�B��t�\�1\��l8 텁/jy\�\��\�`H}j	0�\�f\n��\�Vm\�J���\�Ј�\�mg6�U��\�\�\�z7�Lr.-����\�\�=Yx.\�S�r#�\�ïL\�!\�-��K}j)0�\�&\\\��%\�\�5���15�!Q�ko�\�\09�W�cD�0:\�.�\�\�g\�\�W�ѽ�+��#\��\�b�,���Q�T�\�.��%�c�%\rDh��*���q�\Z\Z/nm\�\�\0]{=y8*\�\�YDw�}+��1�L�-\��]\�SK��ƘKZh$S�L[θ?fN\Z\�(\nW\�RZ�5&\�\�=�\�\�\�\�\��([�3h�\�\'+�1\�\�K�h \�䏕L[ָ!d�U\�\Z�G��\n��B��}D��\�\�\�t���s\�\0e�l�\�`�\�R��\�\Z��!\�\��<�aܠqL���\�A�)/ċ��əy��Bq\�\�	Q\�eJu�m��d%\�\�؇���qJ�\�1n3\�T�����۴\��p�c5���+7�\"o(S�+h�\�\'+\r@�F\�\Zl�ň�5n~\�D54l�tV�u\�F\�$d�\�ŸI�\�v.\�e�L��P�\�R���\0MHZ�hO�}A�70��\�M(s\�Ɖ��*�\�}��D�\�=B�Lo!i(e�L��`X\�H}@�VB\0\�%(Z۸���<R\rI\�\�f{�#ZDz%\��`\r\�;�\r�UԈ\�\�E(K�#V��%M@�f�5\�\�;�7\�\�ר\�wP\�NdeR;\��Д�I3\�\�\�\r�җ\�OSye\�A�<ȋ2P�TG(\�f�/V\��.;�ִ\�أm\�\��3!���\\k�����o5	ƈ��5q�o/�A\n\�\��,��P�\�R_���H\�1\0��\\\�\�^\�\r�5S�:����;z�p^\�`&Ћ�|\�vM\�m\�I\�.>y�\\} -� /\�@YR�h�64Ј���k%7{\Zw\�Y\�\��o��\�\�F�\�\r\�����Vo\�EWJn�ai�Vχ2��C��J}�\��b\�M=�dfo\�\�1~w\��r2\�!v!%��(\�PL���O\�`�ֽTz\��%\�F�i�yP�Tv(\�V�vZ1j���┼�aܡ\\F[�[��9JO�\�}�`�K\�\��!�&��lޱ�n߫l\�>sz�!�\n�U\�]�V�hGi(W\�\�Y\�\�\�\�}��#\�Fw��\��\��h\�Թ}B?���\�\���d\�a�{$��m\�t\�+����\��E�#��R\�\�4\�@CJN\�4\�\�+S_����`7���(�s>��\�1�G�h\�\�x\�\0\�=�i�9\0>Ki�W*\�ڀ��Mh\�hl�]�f�%#g[ǔ�W�\�\�N�3X\�\�#�:��\�Q�\�бS\Z\�>��R�F\��,)���Ќ��;�;=78�\�d\��k�߰���\�y�2͠-Rm\n4b��\�\�4t�y�a[\�R\"[\�h\�z1\0B�<RY�@���\�hÝ��; ��Q�%I��H��Ƭ�b�y����6Im�\�D������̔)\�ؒ�~3\�\�ȗ\�� \�#�%\�\�\��\�B���g0v\��2%\�A�#6.\�wٷ>�&v}\�I8 m8ooh\�\"�\�&@��d\�\�\�1\�0G��lG���\�^��\�\�\�`�@Z�3�m�\�f0�\�(9x&;\�\'\�\ZƖW�R�\�[�b^v�p���n�M6\0c�1����g���\�Ɩ��p�\Z6z�H+�a\�nD�c���߳p��\�\\e$\�Z�\���Sϒ�t�V1 � ��\�\�B�R[,\�6F\r�g\r1v\�/�-\�#Fr�%	硪�\�.�\�\�Hy�\��a(�%\���j�=k��#q\�5�)g$�[��.���u^~}�F�Fʫ�:��-\�c\�RE\�ة�\�|\�<f$\�[�.=��\�w��WĠ0�4R^���:-\n\�c�\�j8=k\nc�9�\"S�Ha)\�$f�\\\��\��\rb`\0\��\0mQ\"�-\�iA0V�?W\�\�YS;��\�N\��Һ�\"\�\�.�`���L�.�����V\r�g\�m\��.\�e\�ҧ]�^z�\��ibp\0\��X�%\�\�c\�E\r�g-i<?e�2�=튉K�n\�OHc	Ɋ�;�ۤ\�%(eIuX�\�\�jx<�����Y\�Xr	}ۤ,q)ʻ�\�\�\�eHe[\0����\ZϬj<H`�2���HK\�_�>/ @�͜΢K\�\�c��\���\�\�xаBx=c�g\�\�K\��z@�`�1���ç��\�\�ƃ�;f)S\�H�ݬ��\��\Z8\�o\�	>c��\�bK\�\�C��wʽ�9\�xP\�LdJ��ꅷ�\�#s,�>\�\�떰׽5���\�3��y�߳\�7䧘\�\�^�\�\�))YO~\�m\�\�9�\0�g};\�Hy�	�>���R\��\�M\��O\���i���\��A#\��������\��|�O\�M�y�˳�\�_`�%XZ\�w򽍱`\�&\r|\�6\��4\�+���;\�О5�A(^K�5ٜ\�\�1\�x�\r|n\�%\�\������^Px\�pc��\�,dN3Q�&t̄\�\Z�,�iz@�\�\���w�{�y]���D\�\rf;s��4x2H�\"@oڄ���h����A�Lf3��s��`�8x�n\�\�E�(u�.ԉ�\�/<��A�\�\�?1ݘ|\�e\�t\� @�z:\�A^���� hr�\���?*�aY\�}V�\0\0\0\0IEND�B`�','AO8a66OT6sAnhQlAxEhllV9SAs0Pf9yHLv35KlLzS2OZuvwRSht1Vq7PfHXa','1','2014-10-12 03:00:00','2018-04-21 08:44:28');
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
