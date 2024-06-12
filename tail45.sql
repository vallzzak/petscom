/*!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-11.4.2-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: tail45
-- ------------------------------------------------------
-- Server version	11.4.2-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Table structure for table `dog`
--

DROP TABLE IF EXISTS `dog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dog` (
  `num` int(11) NOT NULL AUTO_INCREMENT,
  `code` text DEFAULT NULL,
  `name` text DEFAULT NULL,
  `gender` tinytext DEFAULT 'M',
  `birth` date DEFAULT NULL,
  PRIMARY KEY (`num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dog`
--

LOCK TABLES `dog` WRITE;
/*!40000 ALTER TABLE `dog` DISABLE KEYS */;
/*!40000 ALTER TABLE `dog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `local-db`
--

DROP TABLE IF EXISTS `local-db`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `local-db` (
  `num` int(11) NOT NULL AUTO_INCREMENT,
  `code` text DEFAULT NULL,
  `email` text DEFAULT NULL,
  `id` text DEFAULT NULL,
  `name` text DEFAULT NULL,
  PRIMARY KEY (`num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `local-db`
--

LOCK TABLES `local-db` WRITE;
/*!40000 ALTER TABLE `local-db` DISABLE KEYS */;
/*!40000 ALTER TABLE `local-db` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member` (
  `num` int(11) NOT NULL AUTO_INCREMENT,
  `country` tinytext DEFAULT NULL,
  `code` text DEFAULT NULL,
  `email` text DEFAULT NULL,
  `id` text DEFAULT NULL,
  `group` text DEFAULT NULL,
  `name` text DEFAULT NULL,
  `gender` tinytext DEFAULT 'M',
  `phone` int(11) DEFAULT NULL,
  `homepage` text DEFAULT NULL,
  `birth` date DEFAULT NULL,
  `zip` int(11) DEFAULT NULL,
  `address1` longtext DEFAULT NULL,
  `address2` longtext DEFAULT NULL,
  `city` text DEFAULT NULL,
  `state` text DEFAULT NULL,
  `SMS` tinytext DEFAULT 'N',
  `SMSdate` date DEFAULT NULL,
  `email-accept` tinytext DEFAULT 'N',
  `emailacceptdate` date DEFAULT NULL,
  `register` int(11) DEFAULT NULL,
  `points` int(11) DEFAULT NULL,
  `usage` int(11) DEFAULT NULL,
  `own` int(11) DEFAULT NULL,
  `registerdate` date DEFAULT NULL,
  `uploadnum` int(11) DEFAULT NULL,
  `replynum` int(11) DEFAULT NULL,
  `criticnum` int(11) DEFAULT NULL,
  `requestnum` int(11) DEFAULT NULL,
  `loginnum` int(11) DEFAULT NULL,
  `lastlogin` date DEFAULT NULL,
  `lastip` text DEFAULT NULL,
  `buytotal` int(11) DEFAULT NULL,
  `buytotalkrw` int(11) DEFAULT NULL,
  `naver` text DEFAULT NULL,
  `kakao` text DEFAULT NULL,
  `PassRemain` date DEFAULT NULL,
  `PassType` tinyint(4) DEFAULT NULL,
  `LeaseTicket` tinyint(4) unsigned NOT NULL DEFAULT 0,
  `SnackTicket` tinyint(3) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`num`),
  UNIQUE KEY `code` (`code`) USING HASH
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES
(74,'KR','m20240513f07dd6c62295b','ballzzak@gmail.com','ballzzak@gmail.com','운영진 그룹','서재성','M',1089669598,'','1985-04-01',0,'','','','','N','0000-00-00','N','0000-00-00',0,0,0,0,'2024-05-13',0,0,0,0,222,'2024-06-11','211.221.158.223',0,0,'','',NULL,NULL,0,0),
(75,'KR','m20240516183799d0df6c9','ballzzak@nate.com','ballzzak@nate.com','일반 회원 (온라인 가입자)','홍길순','F',1089669598,'https://petscom.com/admin/member/list/?q=YToxOntzOjEwOiJqb2luX29yZGVyIjtzOjQ6ImRlc2MiO30%3D&mode=add&idx=39559534','1990-04-19',16047,'경기 의왕시 모락로 104 (오전동, 철쭉마을한광샤인빌리지)','한광샤인','','','N','0000-00-00','N','0000-00-00',0,0,0,0,'2024-05-16',0,0,0,0,14,'2024-06-10','221.165.147.196',0,0,'','','2024-06-13',3,6,24),
(76,'KR','m2024052944396409cf807','77neo77@naver.com','77neo77@naver.com','일반 회원 (온라인 가입자)','김효섭','M',1042149443,'','1981-05-20',6376,'서울 강남구 세곡동 356-2','102호','','','Y','2024-05-29','Y','2024-05-29',0,0,0,0,'2024-05-29',0,0,0,0,2,'2024-05-29','106.101.130.50',0,0,'','3503476235',NULL,NULL,0,0),
(77,'KR','m20240530c7298506fbe9d','jour@kakao.com','jour@kakao.com','일반 회원 (온라인 가입자)','심재규','M',1063550065,'','1984-10-25',6001,'서울 강남구 압구정로 151 (압구정동, 현대아파트)','107동 906호','','','Y','2024-05-30','Y','2024-05-30',0,0,0,0,'2024-05-30',0,0,0,0,6,'2024-06-04','211.195.109.87',0,0,'','3485874667',NULL,NULL,0,0),
(78,'KR','m202405310c92536ea20cf','kangej3190@icloud.com','kangej3190@icloud.com','운영진 그룹','강은정','F',1065631996,'','1996-09-05',12808,'경기 광주시 도척면 도척윗로 210-34 (궁평리)','아르빌101동303호','','','Y','2024-05-31','Y','2024-05-31',0,0,0,0,'2024-05-31',0,0,0,0,1,'2024-05-31','14.36.72.179',0,0,'','3506322493',NULL,NULL,0,0),
(79,'KR','m20240531cfba4cf200a48','aha3639@kakao.com','aha3639@kakao.com','운영진 그룹','곽현아','F',1033173639,'','2001-02-15',17072,'경기 용인시 기흥구 금화로58번길 10 (상갈동, 금화마을주공4단지아파트)','405-1503','','','Y','2024-05-31','Y','2024-05-31',0,0,0,0,'2024-05-31',0,0,0,0,1,'2024-05-31','14.36.72.179',0,0,'','3506353511',NULL,NULL,0,0),
(80,'KR','m20240603b4ce61c3409e7','jqscod@gmail.com','jqscod@gmail.com','일반 회원 (온라인 가입자)','심재규','M',1090240042,'','1984-10-25',0,'','','','','Y','2024-06-03','Y','2024-06-03',0,0,0,0,'2024-06-03',0,0,0,0,3,'2024-06-03','59.13.46.31',0,0,'','3510077005','2024-06-13',3,4,0),
(81,'KR','m202406031a000860c66ad','myid0611@naver.com','myid0611@naver.com','운영진 그룹','이유진','F',1045655023,'','1997-06-11',17074,'경기 용인시 기흥구 용구대로1890번길 43 (보라동, 보라그린빌)','5동 202호','','','Y','2024-06-03','Y','2024-06-03',0,0,0,0,'2024-06-03',0,0,0,0,1,'2024-06-03','106.101.129.236',0,0,'','3510433153',NULL,NULL,0,0);
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2024-06-12 14:54:57
