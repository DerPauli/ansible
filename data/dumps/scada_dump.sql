-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: localhost    Database: scada
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
-- Table structure for table `controller_parameters`
--

DROP TABLE IF EXISTS `controller_parameters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `controller_parameters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `p_value` float DEFAULT NULL,
  `i_value` float DEFAULT NULL,
  `disturb_feed_fwd` float DEFAULT NULL,
  `detection_ctrl` tinyint(4) DEFAULT NULL,
  `du_dt_max` float DEFAULT NULL,
  `umax_time` float DEFAULT NULL,
  `slew_rate_limit` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=big5;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `controller_parameters`
--

LOCK TABLES `controller_parameters` WRITE;
/*!40000 ALTER TABLE `controller_parameters` DISABLE KEYS */;
INSERT INTO `controller_parameters` VALUES (1,'First','New entry First',1.1,2.2,3.3,1,4,5,6),(2,'SecondOne','New entry for my supi dupi',6,5,4,0,3,2,1),(3,'testentry','New entry for test',1.15,2.4,3.5,0,4.6,5.72,6.84),(4,'shootMe','New entry for shooting someone',1.1,2.2,3.3,0,4.4,5.5,6.6),(5,'shootHim','New entry for shootHim',0.2,22,123,0,1,2,8);
/*!40000 ALTER TABLE `controller_parameters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csu_gamps`
--

DROP TABLE IF EXISTS `csu_gamps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csu_gamps` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gamp_hw_id` int(11) DEFAULT NULL,
  `system_csus_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_csu_gamps_system_csus1_idx` (`system_csus_id`),
  CONSTRAINT `fk_csu_gamps_system_csus1` FOREIGN KEY (`system_csus_id`) REFERENCES `system_csus` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csu_gamps`
--

LOCK TABLES `csu_gamps` WRITE;
/*!40000 ALTER TABLE `csu_gamps` DISABLE KEYS */;
INSERT INTO `csu_gamps` VALUES (1,1,1);
/*!40000 ALTER TABLE `csu_gamps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(63) NOT NULL,
  `description` varchar(254) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Egston','Internal Egston PE user');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gamp_component_set`
--

DROP TABLE IF EXISTS `gamp_component_set`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gamp_component_set` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `system_component_id` int(11) NOT NULL,
  `operation_register_set_id` int(11) NOT NULL,
  `gamp_config_id` int(11) NOT NULL,
  `csu_gamps_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_table1_system_component1_idx` (`system_component_id`),
  KEY `fk_table1_gamp_config_set1_idx` (`operation_register_set_id`),
  KEY `fk_gamp_component_set_gamp_config1_idx` (`gamp_config_id`),
  KEY `fk_gamp_component_set_csu_gamps1_idx` (`csu_gamps_id`),
  CONSTRAINT `fk_gamp_component_set_csu_gamps1` FOREIGN KEY (`csu_gamps_id`) REFERENCES `csu_gamps` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_gamp_component_set_gamp_config1` FOREIGN KEY (`gamp_config_id`) REFERENCES `gamp_config` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_table1_gamp_config_set1` FOREIGN KEY (`operation_register_set_id`) REFERENCES `operation_register_set` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_table1_system_component1` FOREIGN KEY (`system_component_id`) REFERENCES `system_component` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gamp_component_set`
--

LOCK TABLES `gamp_component_set` WRITE;
/*!40000 ALTER TABLE `gamp_component_set` DISABLE KEYS */;
/*!40000 ALTER TABLE `gamp_component_set` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gamp_config`
--

DROP TABLE IF EXISTS `gamp_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gamp_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `users_id` int(11) NOT NULL,
  `public` tinyint(4) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `limits_a_id` int(11) DEFAULT NULL,
  `limits_b_id` int(11) DEFAULT NULL,
  `ctrl_paramrs_a_id` int(11) DEFAULT NULL,
  `ctrl_paramrs_b_id` int(11) DEFAULT NULL,
  `operation_mode_id` int(11) NOT NULL,
  `source_mode_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_system_config_users1_idx` (`users_id`),
  KEY `fk_system_config_system_limits1_idx` (`limits_a_id`),
  KEY `fk_system_config_system_limits2_idx` (`limits_b_id`),
  KEY `fk_system_config_controller_parameters1_idx` (`ctrl_paramrs_a_id`),
  KEY `fk_system_config_controller_parameters2_idx` (`ctrl_paramrs_b_id`),
  KEY `fk_gamp_config_operation_mode1_idx` (`operation_mode_id`),
  KEY `fk_gamp_config_source_mode1_idx` (`source_mode_id`),
  CONSTRAINT `fk_gamp_config_operation_mode1` FOREIGN KEY (`operation_mode_id`) REFERENCES `operation_mode` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_gamp_config_source_mode1` FOREIGN KEY (`source_mode_id`) REFERENCES `source_mode` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_system_config_controller_parameters1` FOREIGN KEY (`ctrl_paramrs_a_id`) REFERENCES `controller_parameters` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_system_config_controller_parameters2` FOREIGN KEY (`ctrl_paramrs_b_id`) REFERENCES `controller_parameters` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_system_config_system_limits1` FOREIGN KEY (`limits_a_id`) REFERENCES `system_limits` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_system_config_system_limits2` FOREIGN KEY (`limits_b_id`) REFERENCES `system_limits` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_system_config_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gamp_config`
--

LOCK TABLES `gamp_config` WRITE;
/*!40000 ALTER TABLE `gamp_config` DISABLE KEYS */;
INSERT INTO `gamp_config` VALUES (1,1,1,'GampCfg1','My super gamp 1',NULL,NULL,NULL,NULL,2,1),(2,1,1,'GampCfg2','My super gamp 2',NULL,NULL,NULL,NULL,1,1),(6,1,1,'FirstGUIConfig','New parameter set created by me',1,NULL,1,NULL,5,2);
/*!40000 ALTER TABLE `gamp_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operation_mode`
--

DROP TABLE IF EXISTS `operation_mode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operation_mode` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `hw_mode_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operation_mode`
--

LOCK TABLES `operation_mode` WRITE;
/*!40000 ALTER TABLE `operation_mode` DISABLE KEYS */;
INSERT INTO `operation_mode` VALUES (1,'Free amp','Free amplifier mode',1),(2,'Three phase','',2),(3,'Three phase + N','',3),(4,'3x1 phase trafo','',0),(5,'DC bipolar','',6),(6,'DC unipolar','',0);
/*!40000 ALTER TABLE `operation_mode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operation_register_set`
--

DROP TABLE IF EXISTS `operation_register_set`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operation_register_set` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `set_id` int(11) NOT NULL,
  `operation_source_set_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_config_set_register_value_set1_idx` (`set_id`),
  KEY `fk_config_set_operation_source_set1_idx` (`operation_source_set_id`),
  CONSTRAINT `fk_config_set_operation_source_set1` FOREIGN KEY (`operation_source_set_id`) REFERENCES `operation_source_set` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_config_set_register_value_set1` FOREIGN KEY (`set_id`) REFERENCES `register_value_set` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operation_register_set`
--

LOCK TABLES `operation_register_set` WRITE;
/*!40000 ALTER TABLE `operation_register_set` DISABLE KEYS */;
INSERT INTO `operation_register_set` VALUES (7,3,1),(8,3,2),(9,3,3),(10,3,4),(11,3,5),(12,3,6),(13,3,7),(14,3,8),(15,3,9),(16,3,10),(17,3,11),(18,3,12),(19,3,13),(20,16,1),(21,17,2),(22,18,3),(23,19,4),(24,13,6),(25,12,5),(26,21,8),(27,20,7),(28,14,12),(29,15,13);
/*!40000 ALTER TABLE `operation_register_set` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operation_source_set`
--

DROP TABLE IF EXISTS `operation_source_set`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operation_source_set` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `operation_mode_id` int(11) NOT NULL,
  `source_mode_id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_operation_source_set_operation_mode1_idx` (`operation_mode_id`),
  KEY `fk_operation_source_set_source_mode1_idx` (`source_mode_id`),
  CONSTRAINT `fk_operation_source_set_operation_mode1` FOREIGN KEY (`operation_mode_id`) REFERENCES `operation_mode` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_operation_source_set_source_mode1` FOREIGN KEY (`source_mode_id`) REFERENCES `source_mode` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operation_source_set`
--

LOCK TABLES `operation_source_set` WRITE;
/*!40000 ALTER TABLE `operation_source_set` DISABLE KEYS */;
INSERT INTO `operation_source_set` VALUES (1,1,1,'Free amp - voltage'),(2,1,2,'Free amp - current'),(3,1,3,'Free amp - U-I'),(4,1,4,'Free amp - I-U'),(5,2,1,'Three phase - voltage'),(6,2,2,'Three phase - current'),(7,3,1,'Three phase + N - voltage'),(8,3,2,'Three phase + N - current'),(9,4,1,'Three phase + N + Trafo - voltage'),(10,5,1,'DC bipolar - voltage'),(11,5,2,'DC bipolar - current'),(12,6,1,'DC unipolar - voltage'),(13,6,2,'DC unipolar - current');
/*!40000 ALTER TABLE `operation_source_set` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `register_config`
--

DROP TABLE IF EXISTS `register_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `register_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_id` int(11) NOT NULL,
  `address` int(11) NOT NULL,
  `group` int(11) DEFAULT '0',
  `name` varchar(63) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `defaultVal` int(11) DEFAULT NULL,
  `active` tinyint(4) DEFAULT '1',
  `writeable` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_register_config_system_item_type1_idx` (`type_id`),
  KEY `idx_register_config_name` (`name`),
  KEY `idx_register_config_type_name` (`type_id`,`name`),
  CONSTRAINT `fk_register_config_system_item_type1` FOREIGN KEY (`type_id`) REFERENCES `system_item_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=479 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `register_config`
--

LOCK TABLES `register_config` WRITE;
/*!40000 ALTER TABLE `register_config` DISABLE KEYS */;
INSERT INTO `register_config` VALUES (1,4,32772,1,'TEST_MODE','TEST MODE CONTROL REGISTER',0,1,1),(2,4,32776,1,'MASTER_CONFIG','MASTER SLAVE CONFIG',0,1,1),(3,4,32780,1,'ICR','INTERNAL CONTROL REGISTER',0,1,1),(4,4,32784,1,'CDA_CTRL','CDA Control Register',0,1,1),(5,4,20,1,'SW_VERSION','Software Version Register',0,1,0),(6,4,24,1,'FW_VERSION','Firmare Version Register',0,1,0),(7,4,32796,1,'OPERATION_MODE','Operation Mode',0,1,1),(8,4,32800,1,'RTLINK_DELAY','RTLINK_DELAY_COUNTER',0,1,1),(9,4,32804,1,'MATRIX_SEL','MATRIX_SEL',0,1,1),(10,4,32808,1,'SP_SEL','Setpoint Selection Register <br>TMCR and ICR have higher priority => if (TMCR(8) == 1 or ICR(4) == 1) then<br>This register is ignored',0,1,1),(11,4,32832,1,'ADC_CTRL','ADC CONTROL REGISTER',0,1,1),(12,4,32836,1,'ADC_TMR','ADC TIMER',0,1,1),(13,4,32840,1,'ADC_TMR2','ADC TIMER2',0,1,1),(14,4,32844,1,'ADC_OFFSET','ADC OFFSET',0,1,1),(15,4,32848,1,'USCALE','USCALE',0,1,1),(16,4,32852,1,'ISCALE','ISACLE',0,1,1),(17,4,32896,1,'SFP_CTRL','SFP CONTROL REGISTER',0,1,1),(18,4,132,1,'SFP1_NUM_FRAME_ERRORS','SFP1 Number of frame errors (low level)',0,1,0),(19,4,136,1,'SFP2_NUM_FRAME_ERRORS','SFP2 Number of frame errors (low level)',0,1,0),(20,4,140,1,'SFP3_NUM_FRAME_ERRORS','SFP3 Number of frame errors (low level)',0,1,0),(21,4,144,1,'SFP4_NUM_FRAME_ERRORS','SFP4 Number of frame errors (low level)',0,1,0),(22,4,232,1,'SFP5_NUM_FRAME_ERRORS','SFP5 Number of frame errors (low level)',0,1,0),(23,4,236,1,'SFP6_NUM_FRAME_ERRORS','SFP6 Number of frame errors (low level)',0,1,0),(24,4,148,1,'SFP1_NUM_RCV_FRAMES','SFP1 Number of received frames',0,1,0),(25,4,152,1,'SFP2_NUM_RCV_FRAMES','SFP2 Number of received frames',0,1,0),(26,4,156,1,'SFP3_NUM_RCV_FRAMES','SFP3 Number of received frames',0,1,0),(27,4,160,1,'SFP4_NUM_RCV_FRAMES','SFP4 Number of received frames',0,1,0),(28,4,240,1,'SFP5_NUM_RCV_FRAMES','SFP5 Number of received frames',0,1,0),(29,4,244,1,'SFP6_NUM_RCV_FRAMES','SFP6 Number of received frames',0,1,0),(30,4,164,1,'SFP1_MSGNR','SFP1 Message number',0,1,0),(31,4,168,1,'SFP2_MSGNR','SFP2 Message number',0,1,0),(32,4,172,1,'SFP3_MSGNR','SFP3 Message number',0,1,0),(33,4,176,1,'SFP4_MSGNR','SFP4 Message number',0,1,0),(34,4,248,1,'SFP5_MSGNR','SFP5 Message number',0,1,0),(35,4,252,1,'SFP6_MSGNR','SFP6 Message number',0,1,0),(36,4,180,1,'SFP1_STATUS','SFP1 status',0,1,0),(37,4,184,1,'SFP2_STATUS','SFP2 status',0,1,0),(38,4,204,1,'SFP3_STATUS','SFP3 status',0,1,0),(39,4,640,1,'SFP4_STATUS','SFP4 status',0,1,0),(40,4,644,1,'SFP5_STATUS','SFP5 status',0,1,0),(41,4,648,1,'SFP6_STATUS','SFP6 status',0,1,0),(42,4,188,1,'SFP1_FRERR','SFP0 Number of frame errors (protocol level)',0,1,0),(43,4,192,1,'SFP2_FRERR','SFP1 Number of frame errors (protocol level)',0,1,0),(44,4,196,1,'SFP3_FRERR','SFP2 Number of frame errors (protocol level)',0,1,0),(45,4,200,1,'SFP4_FRERR','SFP3 Number of frame errors (protocol level)',0,1,0),(46,4,652,1,'SFP5_FRERR','SFP4 Number of frame errors (protocol level)',0,1,0),(47,4,656,1,'SFP6_FRERR','SFP5 Number of frame errors (protocol level)',0,1,0),(48,4,208,1,'SFP1_CRC_ERRORS','sfp1 number of crc errors',0,1,0),(49,4,212,1,'SFP2_CRC_ERRORS','sfp2 number of crc errors',0,1,0),(50,4,216,1,'SFP3_CRC_ERRORS','sfp3 number of crc errors',0,1,0),(51,4,220,1,'SFP4_CRC_ERRORS','sfp4 number of crc errors',0,1,0),(52,4,224,1,'SFP5_CRC_ERRORS','sfp5 number of crc errors',0,1,0),(53,4,228,1,'SFP6_CRC_ERRORS','sfp6 number of crc errors',0,1,0),(54,4,33024,1,'PAR_CTRL_1_CFG','select currents and setpoints for parallel controller 0',0,1,1),(55,4,33028,1,'PAR_CTRL_2_CFG','select currents and setpoints for parallel controller 1',0,1,1),(56,4,33032,1,'PAR_CTRL_3_CFG','select currents and setpoints for parallel controller 2',0,1,1),(57,4,33036,1,'PAR_CTRL_4_CFG','select currents and setpoints for parallel controller 3',0,1,1),(58,4,33040,1,'PAR_CTRL_5_CFG','select currents and setpoints for parallel controller 4',0,1,1),(59,4,33044,1,'PAR_CTRL_6_CFG','select currents and setpoints for parallel controller 5',0,1,1),(60,4,33048,1,'MCTRL_1_CFG','Select U- and I-values for multicontrol',0,1,1),(61,4,33052,1,'MCTRL_2_CFG','Select U- and I-values for multicontrol',0,1,1),(62,4,33056,1,'MCTRL_3_CFG','Select U- and I-values for multicontrol',0,1,1),(63,4,33060,1,'MCTRL_4_CFG','Select U- and I-values for multicontrol',0,1,1),(64,4,33064,1,'MCTRL_5_CFG','Select U- and I-values for multicontrol',0,1,1),(65,4,33068,1,'MCTRL_6_CFG','Select U- and I-values for multicontrol',0,1,1),(66,4,33088,1,'PAR_CTRL_1_RVIRT','',0,1,1),(67,4,33092,1,'PAR_CTRL_2_RVIRT','',0,1,1),(68,4,33096,1,'PAR_CTRL_3_RVIRT','',0,1,1),(69,4,33100,1,'PAR_CTRL_4_RVIRT','',0,1,1),(70,4,33104,1,'PAR_CTRL_5_RVIRT','',0,1,1),(71,4,33108,1,'PAR_CTRL_6_RVIRT','',0,1,1),(72,4,33112,1,'PAR_CTRL_FILT','',0,1,1),(73,4,348,1,'PANIC_G1','',0,1,0),(74,4,352,1,'PANIC_G2','',0,1,0),(75,4,356,1,'PANIC_CDA_SWITCH_OFF','',0,1,0),(76,4,33128,1,'PANIC_P_DUDT_MAX','',0,1,1),(77,4,33132,1,'PANIC_P_U_MAX','',0,1,1),(78,4,33136,1,'PANIC_P_U_MAXT','',0,1,1),(79,4,33140,1,'RST_PANIC','',0,1,1),(80,4,376,1,'PAR_CTRL_P_FILT_PANIC','',0,1,0),(81,4,33152,1,'TPG_A_P1','',0,1,1),(82,4,33156,1,'TPG_B_P1','',0,1,1),(83,4,33160,1,'TPG_A_P2','',0,1,1),(84,4,33164,1,'TPG_B_P2','',0,1,1),(85,4,33168,1,'TPG_A_P3','',0,1,1),(86,4,33172,1,'TPG_B_P3','',0,1,1),(87,4,33176,1,'TPG_SCALE_SIN3','',0,1,1),(88,4,33180,1,'TPG_DC_P1','',0,1,1),(89,4,33184,1,'TPG_DC_P2','',0,1,1),(90,4,33188,1,'TPG_DC_P3','',0,1,1),(91,4,33192,1,'TPG_DC_N','',0,1,1),(92,4,33196,1,'FOURIER_VM_PHASE_STEP_P1_LW','',0,1,1),(93,4,33200,1,'FOURIER_VM_PHASE_STEP_P1_HW','',0,1,1),(94,4,436,1,'PLL_OMEGA_LW','',0,1,0),(95,4,440,1,'PLL_OMEGA_HW','',0,1,0),(96,4,33792,1,'RECT_HIGH_VAL','',0,1,1),(97,4,33796,1,'RECT_LOW_VAL','',0,1,1),(98,4,33800,1,'RECT_HIGH_STEPS','',0,1,1),(99,4,33804,1,'RECT_LOW_STEPS','',0,1,1),(100,4,33216,1,'TRAFO_CTRL_P_DC_I','',0,1,1),(101,4,33220,1,'TRAFO_CTRL_P_DC_P','',0,1,1),(102,4,33240,1,'TRAFO_CTRL_P_FL_FILTER','',0,1,1),(103,4,33244,1,'TRAFO_CTRL_P_FL_PHI_MAX','',0,1,1),(104,4,33248,1,'TRAFO_CTRL_P_IDIFF','',0,1,1),(105,4,33252,1,'TRAFO_CTRL_P_OB_UBAL_MAX','',0,1,1),(106,4,33256,1,'TRAFO_CTRL_P_OB_UBAL_I','',0,1,1),(107,4,33260,1,'TRAFO_CTRL_P_OB_UBAL_P','',0,1,1),(108,4,33264,1,'TRAFO_CTRL_P_OB_UBAL_PD','',0,1,1),(109,4,33268,1,'TRAFO_CTRL_P_RVIRT','',0,1,1),(110,4,33272,1,'CL_CTRL_G1_P_CONFIG','',0,1,1),(111,4,33276,1,'CL_CTRL_G1_P_UREG_SR1','',0,1,1),(112,4,33280,1,'CL_CTRL_G1_P_UREG_SR2','',0,1,1),(113,4,33284,1,'CL_CTRL_G1_P_UREG_PD','',0,1,1),(114,4,33288,1,'CL_CTRL_G1_P_UREG_GS','',0,1,1),(115,4,33292,1,'CL_CTRL_G1_P_UREG_PDIR','',0,1,1),(116,4,33296,1,'CL_CTRL_G1_P_UREG_P','',0,1,1),(117,4,33300,1,'CL_CTRL_G1_P_UREG_I','',0,1,1),(118,4,33304,1,'CL_CTRL_G1_P_UREG_IGS','',0,1,1),(119,4,33308,1,'CL_CTRL_G1_P_UREG_MAX','',0,1,1),(120,4,33312,1,'CL_CTRL_G1_P_UREG_MIN','',0,1,1),(121,4,33316,1,'CL_CTRL_G1_P_IREG_STA','',0,1,1),(122,4,33320,1,'CL_CTRL_G1_P_FILT_STA','',0,1,1),(123,4,33324,1,'CL_CTRL_G2_P_CONFIG','',0,1,1),(124,4,33328,1,'CL_CTRL_G2_P_UREG_SR1','',0,1,1),(125,4,33332,1,'CL_CTRL_G2_P_UREG_SR2','',0,1,1),(126,4,33336,1,'CL_CTRL_G2_P_UREG_PD','',0,1,1),(127,4,33340,1,'CL_CTRL_G2_P_UREG_GS','',0,1,1),(128,4,33344,1,'CL_CTRL_G2_P_UREG_PDIR','',0,1,1),(129,4,33348,1,'CL_CTRL_G2_P_UREG_P','',0,1,1),(130,4,33352,1,'CL_CTRL_G2_P_UREG_I','',0,1,1),(131,4,33356,1,'CL_CTRL_G2_P_UREG_IGS','',0,1,1),(132,4,33360,1,'CL_CTRL_G2_P_UREG_MAX','',0,1,1),(133,4,33364,1,'CL_CTRL_G2_P_UREG_MIN','',0,1,1),(134,4,33368,1,'CL_CTRL_G2_P_IREG_STA','',0,1,1),(135,4,33372,1,'CL_CTRL_G2_P_FILT_STA','',0,1,1),(136,4,33376,1,'CL_CTRL_G1_P_IREG_BALANCE','',0,1,1),(137,4,33380,1,'CL_CTRL_G2_P_IREG_BALANCE','',0,1,1),(138,4,61440,1,'DM_PLPS_START','PL to PS Datamover Start',0,1,1),(139,4,61444,1,'DM_PLPS_RESET','PL to PS Datamover Reset',0,1,1),(140,4,61448,1,'FIRECOM_RST','Firecom Reset',0,1,1),(141,4,61452,1,'RAM_FIFO','RAM FIFO',0,1,1),(142,4,61456,1,'REG_FIFO','REG FIFO',0,1,1),(143,4,61464,1,'SWITCH_FIFO_DM_PS','Switch between FIFO and Datamover Mode for REG/RAM FIFO',0,1,1),(144,4,61468,1,'UDP_STREAMER_CONFIG','UDP Streamer config',0,1,1),(145,4,61472,1,'UDP_STREAMER_PORT','UDP Streamer port',0,1,1),(146,4,61476,1,'UDP_STREAMER_SRC_IP','IP src address for UDP Streamer',0,1,1),(147,4,61480,1,'UDP_STREAMER_DEST_IP','IP dest address for UDP Streamer',0,1,1),(148,4,61484,1,'UDP_STREAMER_DEST_MAC_HW','MAC dest address for UDP Streamer',0,1,1),(149,4,61488,1,'UDP_STREAMER_DEST_MAC_LW','MAC dest address for UDP Streamer',0,1,1),(150,4,61492,1,'UDP_STREAMER_SRC_MAC_HW','MAC src address for UDP Streamer',0,1,1),(151,4,61496,1,'UDP_STREAMER_SRC_MAC_LW','MAC src address for UDP Streamer',0,1,1),(152,4,61500,1,'UDP_STREAMER_SEL_HW','UDP Streamer sel highword',0,1,1),(153,4,61504,1,'UDP_STREAMER_SEL_LW','UDP Streamer sel lowword',0,1,1),(154,4,61460,1,'UDP_STREAMER_PAYLOAD_LENGTH','length of upd payload',0,1,1),(155,4,61560,1,'FC_CTRL','Control Register for FC',0,1,1),(156,4,61512,1,'FC0_MSG_TX_CMD','FC0 command word',0,1,1),(157,4,61516,1,'FC0_MSG_TX_W0','FC0 first data word',0,1,1),(158,4,61520,1,'FC0_MSG_TX_W1','FC0 second data word',0,1,1),(159,4,61524,1,'FC0_MSG_TX_W2','FC0 third data word',0,1,1),(160,4,61528,1,'FC0_MSG_TX_W3','FC0 fourth data word',0,1,1),(161,4,28744,1,'FC0_MSG_RX_CMD','FC0 command word',0,1,0),(162,4,28748,1,'FC0_MSG_RX_W0','FC0 first data word',0,1,0),(163,4,28752,1,'FC0_MSG_RX_W1','FC0 second data word',0,1,0),(164,4,28756,1,'FC0_MSG_RX_W2','FC0 third data word',0,1,0),(165,4,28760,1,'FC0_MSG_RX_W3','FC0 fourth data word',0,1,0),(166,4,28764,1,'FC0_STATUS','status register for first FC interface',0,1,0),(167,4,61536,1,'FC1_MSG_TX_CMD','FC1 command word',0,1,1),(168,4,61540,1,'FC1_MSG_TX_W0','FC1 first data word',0,1,1),(169,4,61544,1,'FC1_MSG_TX_W1','FC1 second data word',0,1,1),(170,4,61548,1,'FC1_MSG_TX_W2','FC1 third data word',0,1,1),(171,4,61552,1,'FC1_MSG_TX_W3','FC1 fourth data word',0,1,1),(172,4,28768,1,'FC1_MSG_RX_CMD','FC1 command word',0,1,0),(173,4,28772,1,'FC1_MSG_RX_W0','FC1 first data word',0,1,0),(174,4,28776,1,'FC1_MSG_RX_W1','FC1 second data word',0,1,0),(175,4,28780,1,'FC1_MSG_RX_W2','FC1 third data word',0,1,0),(176,4,28784,1,'FC1_MSG_RX_W3','FC1 fourth data word',0,1,0),(177,4,28788,1,'FC1_STATUS','status register for first FC interface',0,1,0),(178,4,28792,1,'FC_TEST_RX_PACKETS_LW','number of packets received when using test design on interface specified <br>In fc_iface_sel (32 lsbs)',0,1,0),(179,4,28796,1,'FC_TEST_RX_PACKETS_HW','number of packets received when using test design on interface specified <br>In fc_iface_sel (32 msbs)',0,1,0),(180,4,28800,1,'FC_TEST_TX_PACKETS_LW','number of packets transmitted when using test design (32 lsbs)',0,1,0),(181,4,28804,1,'FC_TEST_TX_PACKETS_HW','number of packets transmitted when using test design (32 msbs)',0,1,0),(182,4,28808,1,'SFP_TEST_RX_PACKETS_LW','number of packets received when using test design on interface specified <br>In fc_iface_sel (32 lsbs)',0,1,0),(183,4,28812,1,'SFP_TEST_RX_PACKETS_HW','number of packets received when using test design on interface specified <br>In fc_iface_sel (32 msbs)',0,1,0),(184,4,28816,1,'SFP_TEST_TX_PACKETS_LW','number of packets transmitted when using test design (32 lsbs)',0,1,0),(185,4,28820,1,'SFP_TEST_TX_PACKETS_HW','number of packets transmitted when using test design (32 msbs)',0,1,0),(186,4,49152,1,'USET_TRAFO_M_11','',0,1,1),(187,4,49156,1,'USET_TRAFO_M_12','',0,1,1),(188,4,49160,1,'USET_TRAFO_M_13','',0,1,1),(189,4,49164,1,'USET_TRAFO_M_14','',0,1,1),(190,4,49168,1,'USET_TRAFO_M_15','',0,1,1),(191,4,49172,1,'USET_TRAFO_M_16','',0,1,1),(192,4,49176,1,'USET_TRAFO_M_21','',0,1,1),(193,4,49180,1,'USET_TRAFO_M_22','',0,1,1),(194,4,49184,1,'USET_TRAFO_M_23','',0,1,1),(195,4,49188,1,'USET_TRAFO_M_24','',0,1,1),(196,4,49192,1,'USET_TRAFO_M_25','',0,1,1),(197,4,49196,1,'USET_TRAFO_M_26','',0,1,1),(198,4,49200,1,'USET_TRAFO_M_31','',0,1,1),(199,4,49204,1,'USET_TRAFO_M_32','',0,1,1),(200,4,49208,1,'USET_TRAFO_M_33','',0,1,1),(201,4,49212,1,'USET_TRAFO_M_34','',0,1,1),(202,4,49216,1,'USET_TRAFO_M_35','',0,1,1),(203,4,49220,1,'USET_TRAFO_M_36','',0,1,1),(204,4,49224,1,'USET_TRAFO_M_41','',0,1,1),(205,4,49228,1,'USET_TRAFO_M_42','',0,1,1),(206,4,49232,1,'USET_TRAFO_M_43','',0,1,1),(207,4,49236,1,'USET_TRAFO_M_44','',0,1,1),(208,4,49240,1,'USET_TRAFO_M_45','',0,1,1),(209,4,49244,1,'USET_TRAFO_M_46','',0,1,1),(210,4,50176,1,'I_TRAFO_M_11','',0,1,1),(211,4,50180,1,'I_TRAFO_M_12','',0,1,1),(212,4,50184,1,'I_TRAFO_M_13','',0,1,1),(213,4,50188,1,'I_TRAFO_M_14','',0,1,1),(214,4,50192,1,'I_TRAFO_M_15','',0,1,1),(215,4,50196,1,'I_TRAFO_M_16','',0,1,1),(216,4,50200,1,'I_TRAFO_M_17','',0,1,1),(217,4,50204,1,'I_TRAFO_M_21','',0,1,1),(218,4,50208,1,'I_TRAFO_M_22','',0,1,1),(219,4,50212,1,'I_TRAFO_M_23','',0,1,1),(220,4,50216,1,'I_TRAFO_M_24','',0,1,1),(221,4,50220,1,'I_TRAFO_M_25','',0,1,1),(222,4,50224,1,'I_TRAFO_M_26','',0,1,1),(223,4,50228,1,'I_TRAFO_M_27','',0,1,1),(224,4,50232,1,'I_TRAFO_M_31','',0,1,1),(225,4,50236,1,'I_TRAFO_M_32','',0,1,1),(226,4,50240,1,'I_TRAFO_M_33','',0,1,1),(227,4,50244,1,'I_TRAFO_M_34','',0,1,1),(228,4,50248,1,'I_TRAFO_M_35','',0,1,1),(229,4,50252,1,'I_TRAFO_M_36','',0,1,1),(230,4,50256,1,'I_TRAFO_M_37','',0,1,1),(231,4,40960,1,'DBG_A_SEL','',0,1,1),(232,4,40964,1,'DBG_B_SEL','',0,1,1),(233,4,40968,1,'DBG_C_SEL','',0,1,1),(234,4,40972,1,'DBG_D_SEL','',0,1,1),(235,4,40976,1,'DBG_E_SEL','',0,1,1),(236,4,40980,1,'DBG_F_SEL','',0,1,1),(237,4,40984,1,'DBG_CTRL','',0,1,1),(238,4,40988,1,'DBG_PHASE_STEP','',0,1,1),(239,4,40992,1,'DBG_PHASE_STEP_MUL','',0,1,1),(240,4,40996,1,'DBG_CDA_SIM_P_RVIRT','',0,1,1),(241,4,41000,1,'DBG_CDA_SIM_P_GAIN_SHIFT','',0,1,1),(242,4,41004,1,'DBG_CDA_SIM_P_PARALLEL_SHIFT','',0,1,1),(243,4,41008,1,'DBG_CDA_SIM_P_LP2FLT','',0,1,1),(244,4,41012,1,'DBG_MATRIX_SEL','',0,1,1),(245,4,41016,1,'DBG_CDA_SIM_TPG_P_A_P1','',0,1,1),(246,4,41020,1,'DBG_CDA_SIM_TPG_P_B_P1','',0,1,1),(247,4,41024,1,'DBG_CDA_SIM_TPG_P_A_P2','',0,1,1),(248,4,41028,1,'DBG_CDA_SIM_TPG_P_B_P2','',0,1,1),(249,4,41032,1,'DBG_CDA_SIM_TPG_P_A_P3','',0,1,1),(250,4,41036,1,'DBG_CDA_SIM_TPG_P_B_P3','',0,1,1),(251,4,41040,1,'DBG_CDA_SIM_TPG_P_SCALE_SIN3','',0,1,1),(252,4,41044,1,'DBG_CDA_SIM_TPG_P_DC_P1','',0,1,1),(253,4,41048,1,'DBG_CDA_SIM_TPG_P_DC_P2','',0,1,1),(254,4,41052,1,'DBG_CDA_SIM_TPG_P_DC_P3','',0,1,1),(255,4,41056,1,'DBG_CDA_SIM_TPG_P_DC_N','',0,1,1),(256,4,41057,1,'DBG_CDA_SIM_TPG_P_PHASE_STEP','',0,1,1),(257,4,41064,1,'DBG_CDA_SIM_P_U_OFFSET','',0,1,1),(258,4,41068,1,'DBG_CDA_SIM_P_MB_SEL_0','',0,1,1),(259,4,41072,1,'DBG_CDA_SIM_P_MB_SEL_1','',0,1,1),(260,4,41076,1,'DBG_CDA_SIM_P_MB_SEL_2','',0,1,1),(261,4,41080,1,'DBG_CDA_SIM_P_MB_SEL_3','',0,1,1),(262,4,41084,1,'DBG_CDA_SIM_P_MB_SEL_4','',0,1,1),(263,4,41088,1,'DBG_CDA_SIM_P_MB_P_OFFSET','',0,1,1),(264,4,41092,1,'DBG_CDA_SIM_P_SIM_CONFIG','',0,1,1),(265,4,41096,1,'DBG_CDA_SIM_P_MATRIX_3_GAIN_SHIFT','',0,1,1),(266,4,41100,1,'DBG_CDA_SIM_P_CDA_OFFSET','',0,1,1),(267,4,41216,1,'DBG_CDA_SIM_P_MATRIX_11','',0,1,1),(268,4,41220,1,'DBG_CDA_SIM_P_MATRIX_12','',0,1,1),(269,4,41224,1,'DBG_CDA_SIM_P_MATRIX_13','',0,1,1),(270,4,41228,1,'DBG_CDA_SIM_P_MATRIX_14','',0,1,1),(271,4,41232,1,'DBG_CDA_SIM_P_MATRIX_15','',0,1,1),(272,4,41236,1,'DBG_CDA_SIM_P_MATRIX_16','',0,1,1),(273,4,41240,1,'DBG_CDA_SIM_P_MATRIX_17','',0,1,1),(274,4,41244,1,'DBG_CDA_SIM_P_MATRIX_18','',0,1,1),(275,4,41248,1,'DBG_CDA_SIM_P_MATRIX_19','',0,1,1),(276,4,41252,1,'DBG_CDA_SIM_P_MATRIX_21','',0,1,1),(277,4,41256,1,'DBG_CDA_SIM_P_MATRIX_22','',0,1,1),(278,4,41260,1,'DBG_CDA_SIM_P_MATRIX_23','',0,1,1),(279,4,41264,1,'DBG_CDA_SIM_P_MATRIX_24','',0,1,1),(280,4,41268,1,'DBG_CDA_SIM_P_MATRIX_25','',0,1,1),(281,4,41272,1,'DBG_CDA_SIM_P_MATRIX_26','',0,1,1),(282,4,41276,1,'DBG_CDA_SIM_P_MATRIX_27','',0,1,1),(283,4,41280,1,'DBG_CDA_SIM_P_MATRIX_28','',0,1,1),(284,4,41284,1,'DBG_CDA_SIM_P_MATRIX_29','',0,1,1),(285,4,41288,1,'DBG_CDA_SIM_P_MATRIX_31','',0,1,1),(286,4,41292,1,'DBG_CDA_SIM_P_MATRIX_32','',0,1,1),(287,4,41296,1,'DBG_CDA_SIM_P_MATRIX_33','',0,1,1),(288,4,41300,1,'DBG_CDA_SIM_P_MATRIX_34','',0,1,1),(289,4,41304,1,'DBG_CDA_SIM_P_MATRIX_35','',0,1,1),(290,4,41308,1,'DBG_CDA_SIM_P_MATRIX_36','',0,1,1),(291,4,41312,1,'DBG_CDA_SIM_P_MATRIX_37','',0,1,1),(292,4,41316,1,'DBG_CDA_SIM_P_MATRIX_38','',0,1,1),(293,4,41320,1,'DBG_CDA_SIM_P_MATRIX_39','',0,1,1),(294,4,41324,1,'DBG_CDA_SIM_P_MATRIX_41','',0,1,1),(295,4,41328,1,'DBG_CDA_SIM_P_MATRIX_42','',0,1,1),(296,4,41332,1,'DBG_CDA_SIM_P_MATRIX_43','',0,1,1),(297,4,41336,1,'DBG_CDA_SIM_P_MATRIX_44','',0,1,1),(298,4,41340,1,'DBG_CDA_SIM_P_MATRIX_45','',0,1,1),(299,4,41344,1,'DBG_CDA_SIM_P_MATRIX_46','',0,1,1),(300,4,41348,1,'DBG_CDA_SIM_P_MATRIX_47','',0,1,1),(301,4,41352,1,'DBG_CDA_SIM_P_MATRIX_48','',0,1,1),(302,4,41356,1,'DBG_CDA_SIM_P_MATRIX_49','',0,1,1),(303,4,41360,1,'DBG_CDA_SIM_P_MATRIX_51','',0,1,1),(304,4,41364,1,'DBG_CDA_SIM_P_MATRIX_52','',0,1,1),(305,4,41368,1,'DBG_CDA_SIM_P_MATRIX_53','',0,1,1),(306,4,41372,1,'DBG_CDA_SIM_P_MATRIX_54','',0,1,1),(307,4,41376,1,'DBG_CDA_SIM_P_MATRIX_55','',0,1,1),(308,4,41380,1,'DBG_CDA_SIM_P_MATRIX_56','',0,1,1),(309,4,41384,1,'DBG_CDA_SIM_P_MATRIX_57','',0,1,1),(310,4,41388,1,'DBG_CDA_SIM_P_MATRIX_58','',0,1,1),(311,4,41392,1,'DBG_CDA_SIM_P_MATRIX_59','',0,1,1),(312,4,41396,1,'DBG_CDA_SIM_P_MATRIX_61','',0,1,1),(313,4,41400,1,'DBG_CDA_SIM_P_MATRIX_62','',0,1,1),(314,4,41404,1,'DBG_CDA_SIM_P_MATRIX_63','',0,1,1),(315,4,41408,1,'DBG_CDA_SIM_P_MATRIX_64','',0,1,1),(316,4,41412,1,'DBG_CDA_SIM_P_MATRIX_65','',0,1,1),(317,4,41416,1,'DBG_CDA_SIM_P_MATRIX_66','',0,1,1),(318,4,41420,1,'DBG_CDA_SIM_P_MATRIX_67','',0,1,1),(319,4,41424,1,'DBG_CDA_SIM_P_MATRIX_68','',0,1,1),(320,4,41428,1,'DBG_CDA_SIM_P_MATRIX_69','',0,1,1),(321,4,41432,1,'DBG_CDA_SIM_PARALLEL_MATRIX_11','',0,1,1),(322,4,41436,1,'DBG_CDA_SIM_PARALLEL_MATRIX_12','',0,1,1),(323,4,41440,1,'DBG_CDA_SIM_PARALLEL_MATRIX_13','',0,1,1),(324,4,41444,1,'DBG_CDA_SIM_PARALLEL_MATRIX_14','',0,1,1),(325,4,41448,1,'DBG_CDA_SIM_PARALLEL_MATRIX_15','',0,1,1),(326,4,41452,1,'DBG_CDA_SIM_PARALLEL_MATRIX_16','',0,1,1),(327,4,41456,1,'DBG_CDA_SIM_PARALLEL_MATRIX_17','',0,1,1),(328,4,41460,1,'DBG_CDA_SIM_PARALLEL_MATRIX_18','',0,1,1),(329,4,41464,1,'DBG_CDA_SIM_PARALLEL_MATRIX_19','',0,1,1),(330,4,41468,1,'DBG_CDA_SIM_PARALLEL_MATRIX_21','',0,1,1),(331,4,41472,1,'DBG_CDA_SIM_PARALLEL_MATRIX_22','',0,1,1),(332,4,41476,1,'DBG_CDA_SIM_PARALLEL_MATRIX_23','',0,1,1),(333,4,41480,1,'DBG_CDA_SIM_PARALLEL_MATRIX_24','',0,1,1),(334,4,41484,1,'DBG_CDA_SIM_PARALLEL_MATRIX_25','',0,1,1),(335,4,41488,1,'DBG_CDA_SIM_PARALLEL_MATRIX_26','',0,1,1),(336,4,41492,1,'DBG_CDA_SIM_PARALLEL_MATRIX_27','',0,1,1),(337,4,41496,1,'DBG_CDA_SIM_PARALLEL_MATRIX_28','',0,1,1),(338,4,41500,1,'DBG_CDA_SIM_PARALLEL_MATRIX_29','',0,1,1),(339,4,41504,1,'DBG_CDA_SIM_PARALLEL_MATRIX_31','',0,1,1),(340,4,41508,1,'DBG_CDA_SIM_PARALLEL_MATRIX_32','',0,1,1),(341,4,41512,1,'DBG_CDA_SIM_PARALLEL_MATRIX_33','',0,1,1),(342,4,41516,1,'DBG_CDA_SIM_PARALLEL_MATRIX_34','',0,1,1),(343,4,41520,1,'DBG_CDA_SIM_PARALLEL_MATRIX_35','',0,1,1),(344,4,41524,1,'DBG_CDA_SIM_PARALLEL_MATRIX_36','',0,1,1),(345,4,41528,1,'DBG_CDA_SIM_PARALLEL_MATRIX_37','',0,1,1),(346,4,41532,1,'DBG_CDA_SIM_PARALLEL_MATRIX_38','',0,1,1),(347,4,41536,1,'DBG_CDA_SIM_PARALLEL_MATRIX_39','',0,1,1),(348,4,41540,1,'DBG_CDA_SIM_PARALLEL_MATRIX_41','',0,1,1),(349,4,41544,1,'DBG_CDA_SIM_PARALLEL_MATRIX_42','',0,1,1),(350,4,41548,1,'DBG_CDA_SIM_PARALLEL_MATRIX_43','',0,1,1),(351,4,41552,1,'DBG_CDA_SIM_PARALLEL_MATRIX_44','',0,1,1),(352,4,41556,1,'DBG_CDA_SIM_PARALLEL_MATRIX_45','',0,1,1),(353,4,41560,1,'DBG_CDA_SIM_PARALLEL_MATRIX_46','',0,1,1),(354,4,41564,1,'DBG_CDA_SIM_PARALLEL_MATRIX_47','',0,1,1),(355,4,41568,1,'DBG_CDA_SIM_PARALLEL_MATRIX_48','',0,1,1),(356,4,41572,1,'DBG_CDA_SIM_PARALLEL_MATRIX_49','',0,1,1),(357,4,41576,1,'DBG_CDA_SIM_PARALLEL_MATRIX_51','',0,1,1),(358,4,41580,1,'DBG_CDA_SIM_PARALLEL_MATRIX_52','',0,1,1),(359,4,41584,1,'DBG_CDA_SIM_PARALLEL_MATRIX_53','',0,1,1),(360,4,41588,1,'DBG_CDA_SIM_PARALLEL_MATRIX_54','',0,1,1),(361,4,41592,1,'DBG_CDA_SIM_PARALLEL_MATRIX_55','',0,1,1),(362,4,41596,1,'DBG_CDA_SIM_PARALLEL_MATRIX_56','',0,1,1),(363,4,41600,1,'DBG_CDA_SIM_PARALLEL_MATRIX_57','',0,1,1),(364,4,41604,1,'DBG_CDA_SIM_PARALLEL_MATRIX_58','',0,1,1),(365,4,41608,1,'DBG_CDA_SIM_PARALLEL_MATRIX_59','',0,1,1),(366,4,41612,1,'DBG_CDA_SIM_PARALLEL_MATRIX_61','',0,1,1),(367,4,41616,1,'DBG_CDA_SIM_PARALLEL_MATRIX_62','',0,1,1),(368,4,41620,1,'DBG_CDA_SIM_PARALLEL_MATRIX_63','',0,1,1),(369,4,41624,1,'DBG_CDA_SIM_PARALLEL_MATRIX_64','',0,1,1),(370,4,41628,1,'DBG_CDA_SIM_PARALLEL_MATRIX_65','',0,1,1),(371,4,41632,1,'DBG_CDA_SIM_PARALLEL_MATRIX_66','',0,1,1),(372,4,41636,1,'DBG_CDA_SIM_PARALLEL_MATRIX_67','',0,1,1),(373,4,41640,1,'DBG_CDA_SIM_PARALLEL_MATRIX_68','',0,1,1),(374,4,41644,1,'DBG_CDA_SIM_PARALLEL_MATRIX_69','',0,1,1),(375,4,41648,1,'DBG_CDA_SIM_MATRIX3_11','',0,1,1),(376,4,41652,1,'DBG_CDA_SIM_MATRIX3_12','',0,1,1),(377,4,41656,1,'DBG_CDA_SIM_MATRIX3_13','',0,1,1),(378,4,41660,1,'DBG_CDA_SIM_MATRIX3_14','',0,1,1),(379,4,41664,1,'DBG_CDA_SIM_MATRIX3_15','',0,1,1),(380,4,41668,1,'DBG_CDA_SIM_MATRIX3_16','',0,1,1),(381,4,41672,1,'DBG_CDA_SIM_MATRIX3_21','',0,1,1),(382,4,41676,1,'DBG_CDA_SIM_MATRIX3_22','',0,1,1),(383,4,41680,1,'DBG_CDA_SIM_MATRIX3_23','',0,1,1),(384,4,41684,1,'DBG_CDA_SIM_MATRIX3_24','',0,1,1),(385,4,41688,1,'DBG_CDA_SIM_MATRIX3_25','',0,1,1),(386,4,41692,1,'DBG_CDA_SIM_MATRIX3_26[54]','',0,1,1),(387,4,41696,1,'DBG_CDA_SIM_MATRIX3_31','',0,1,1),(388,4,41700,1,'DBG_CDA_SIM_MATRIX3_32','',0,1,1),(389,4,41704,1,'DBG_CDA_SIM_MATRIX3_33','',0,1,1),(390,4,41708,1,'DBG_CDA_SIM_MATRIX3_34','',0,1,1),(391,4,41712,1,'DBG_CDA_SIM_MATRIX3_35 [32]','',0,1,1),(392,4,41716,1,'DBG_CDA_SIM_MATRIX3_36','',0,1,1),(393,3,1,1,'FW_VER','Firmware Version',0,1,0),(394,3,2,1,'GEN_STATUS','General Status',0,1,0),(395,3,3,1,'SAFETY_STAT','I2t Overcurrent',0,1,0),(396,3,4,1,'DRIVER_STAT','LEG Driver Stat',0,1,0),(397,3,5,2,'DCP','DC+ Voltage',0,1,0),(398,3,6,2,'DCM','DC- Voltage',0,1,0),(399,3,7,2,'VOUT','Output Voltage',0,1,0),(400,3,8,2,'ILEG1','ILEG1_measurement',0,1,0),(401,3,9,2,'ILEG2','ILEG2_measurement',0,1,0),(402,3,10,2,'ILEG3','ILEG3_measurement',0,1,0),(403,3,11,2,'ILEG4','ILEG4_measurement',0,1,0),(404,3,12,2,'ILEG5','ILEG5_measurement',0,1,0),(405,3,13,2,'ILEG6','ILEG6_measurement',0,1,0),(406,3,14,2,'IOUT','Iout_measurement',0,1,0),(407,3,15,2,'TEMP1','Temp1 Sensor Value (high side)',0,1,0),(408,3,16,2,'TEMP2','Temp2 Sensor Value (low side)',0,1,0),(409,3,17,2,'TEMP3','Temp3 Sensor Value (onboard)',0,1,0),(410,3,18,2,'DEWVAL','Dew Sensor Value',0,1,0),(411,3,19,2,'VOUTC','VOUT Calibrated',0,1,0),(412,3,20,2,'IOUTC','IOUT Calibrated',0,1,0),(413,3,21,2,'VDCC','VDC Calibrated',0,1,0),(414,3,22,5,'BEO_A','Observer A',0,1,0),(415,3,23,5,'BEO_B','Observer B',0,1,0),(416,3,24,5,'BEO_C','Observer C',0,1,0),(417,3,25,5,'BEO_D','Observer D',0,1,0),(418,3,26,1,'STATISTICS_COUNT','Statistic Counters',0,1,0),(419,3,128,3,'ILIMIT_P','Limitation for positive current in for current limit loop',0,1,1),(420,3,129,3,'IBEGOPTI','Current limition optimisation',0,1,1),(421,3,130,3,'MAXIBEG','Maximum current limitation',0,1,1),(422,3,131,3,'RVIRT','Virtual resistance',0,1,1),(423,3,132,3,'SET_U','SET_U register for voltage loop',0,1,1),(424,3,133,3,'MAXVDC','Anti Windup Maximum',0,1,1),(425,3,134,3,'ACTD_G','Active Damping G Parameter',0,1,1),(426,3,135,3,'ACTD_G1','Active Damping G1 Parameter',0,1,1),(427,3,136,3,'ACTD_FI','Active Damping filter',0,1,1),(428,3,137,3,'ACTD_H','Active Damping H Parameter',0,1,1),(429,3,138,3,'ILIM_GS','Current limitation loop GS Parameter',0,1,1),(430,3,139,3,'ILIM_I','Current  limitaion loop I Parameter',0,1,1),(431,3,140,3,'ILIM_I2','Current  limitaion loop I2 Parameter',0,1,1),(432,3,141,3,'ILIM_P','Current  limitaion loop P Parameter',0,1,1),(433,3,142,3,'ILIM_PD','Current  limitaion loop PD Parameter',0,1,1),(434,3,143,3,'ILIM_SR','Current  limitaion loop SR Parameter',0,1,1),(435,3,144,3,'IREG_GS','Current Loop GS parameter',0,1,1),(436,3,145,3,'IREG_I','Current Loop I parameter',0,1,1),(437,3,146,3,'IREG_I2','Current Loop I2 parameter',0,1,1),(438,3,147,3,'IREG_P','Current Loop P parameter',0,1,1),(439,3,148,3,'IREG_PD','Current Loop PD parameter',0,1,1),(440,3,149,3,'IREG_SR','Current Loop SR parameter',0,1,1),(441,3,150,3,'UREG_GS','Voltage Loop GS parameter',0,1,1),(442,3,151,3,'UREG_I','Voltage Loop I parameter',0,1,1),(443,3,152,3,'UREG_I2','Voltage Loop I2 parameter',0,1,1),(444,3,153,3,'UREG_P','Voltage Loop P parameter',0,1,1),(445,3,154,3,'UREG_PD','Voltage Loop PD parameter',0,1,1),(446,3,155,3,'UREG_SR','Voltage Loop SR parameter',0,1,1),(447,3,156,3,'VCL_CFG','Voltage and Current Loop Configuration register',0,1,1),(448,3,157,3,'ILIMIT_N','Limitatioin for negative current in for Current limit loop',0,1,1),(449,3,158,3,'RAWDUTY100','defines the 100% duty cycle for PWM module',0,1,1),(450,3,159,3,'UOFFSET','Offset value for voltage setpoint',0,1,1),(451,3,160,1,'GENERAL_CTRL','General Controlregister_config ',0,1,1),(452,3,161,6,'VOUT_OFFSET','Vout Offset',0,1,1),(453,3,162,6,'VOUT_SCAL','Vout Scale',0,1,1),(454,3,163,6,'DCP_OFFSET','DCP Offset',0,1,1),(455,3,164,6,'DCP_SCAL','DCP Scale',0,1,1),(456,3,165,6,'DCM_OFFSET','DCM Offset',0,1,1),(457,3,166,6,'DCM_SCAL','DCM Scale',0,1,1),(458,3,167,6,'IOUT_OFFSET','Iout Offset',0,1,1),(459,3,168,6,'IOUT_SCAL','Iout Scale',0,1,1),(460,3,169,6,'IGBT_WARNING','IGBT Hi-Lo Temperatur warning threshold',0,1,1),(461,3,170,6,'IGBT_SHTDOWN','IGBT Hi-Lo Temperatur shutdown threshold',0,1,1),(462,3,171,6,'INTERN_SHTDOWN','Interne Temperatur shutdown threshold',0,1,1),(463,3,172,6,'DEWPOINT_WARNING','Dewpoint warning threshold',0,1,1),(464,3,173,6,'DEWPOINT_SHTDOWN','Dewpoint shutdown threshold',0,1,1),(465,3,174,1,'DC_SAFETY_LIMIT','Limit for DC-Voltage (DC FW Comp Error)',0,1,1),(466,3,175,3,'GAIN_L2','Gain_l2 register in fp 4.12 format',0,1,1),(467,3,176,4,'TEST_MODE','Test mode',0,1,1),(468,3,177,4,'FORCE_LEG_EN_CMD','Force Leg Enable command',0,1,1),(469,3,178,4,'PWM_DUTY_CYCLE','PWM duty cycle (see TEST_MODE.FORCE_RAW_DUTYCYC)',0,1,1),(470,3,179,5,'BEO_AB_SEL','Debug DAC channel select for DACs 0 and 1',0,1,1),(471,3,180,5,'BEO_CD_SEL','Debug DAC channel select for DACs 2 and 3',0,1,1),(472,3,181,5,'BEO_A_CFG','Config register for DAC0',0,1,1),(473,3,182,5,'BEO_B_CFG','Config register for DAC1',0,1,1),(474,3,183,5,'BEO_C_CFG','Config register for DAC2',0,1,1),(475,3,184,5,'BEO_D_CFG','Config register for DAC3',0,1,1),(476,3,185,3,'VDC_FI','VDC Filter koefficient',0,1,1),(477,3,186,3,'MINVDC','Anti Windup Minimum',0,1,1),(478,3,187,3,'VDC_UV','VDC undervoltage',0,1,1);
/*!40000 ALTER TABLE `register_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `register_value_set`
--

DROP TABLE IF EXISTS `register_value_set`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `register_value_set` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `description` varchar(254) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_register_value_set_system_item_type1_idx` (`type_id`),
  CONSTRAINT `fk_register_value_set_system_item_type1` FOREIGN KEY (`type_id`) REFERENCES `system_item_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `register_value_set`
--

LOCK TABLES `register_value_set` WRITE;
/*!40000 ALTER TABLE `register_value_set` DISABLE KEYS */;
INSERT INTO `register_value_set` VALUES (3,3,'v420_Vreg_HIL_dutylimit',''),(4,4,'S4D01UU00_00',''),(5,4,'S4D01II11_00',''),(6,4,'S4D01UI01_00',''),(7,4,'S4D01IU10_00',''),(8,4,'S4A02IU10_00',''),(9,4,'S4A02UU00_00',''),(10,4,'S4A03IU10_00',''),(11,4,'S4A03UU00_00',''),(12,4,'S6A02UU00_00',''),(13,4,'S6A02IU10_00',''),(14,4,'S6D07UU00_00',''),(15,4,'S6D07II00_00',''),(16,4,'S6D01UU00_00',''),(17,4,'S6D01II11_00',''),(18,4,'S6D01UI01_00',''),(19,4,'S6D01IU00_00',''),(20,4,'S6A03UU00_00',''),(21,4,'S6A03IU00_00','');
/*!40000 ALTER TABLE `register_value_set` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `register_values`
--

DROP TABLE IF EXISTS `register_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `register_values` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `set_id` int(11) NOT NULL,
  `register_id` int(11) NOT NULL,
  `value` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_register_values_register_value_set1_idx` (`set_id`),
  KEY `fk_register_values_register_config1_idx` (`register_id`),
  CONSTRAINT `fk_register_values_register_config1` FOREIGN KEY (`register_id`) REFERENCES `register_config` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_register_values_register_value_set1` FOREIGN KEY (`set_id`) REFERENCES `register_value_set` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1035 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `register_values`
--

LOCK TABLES `register_values` WRITE;
/*!40000 ALTER TABLE `register_values` DISABLE KEYS */;
INSERT INTO `register_values` VALUES (1,3,419,12288),(2,3,420,0),(4,3,422,8192),(5,3,423,0),(6,3,424,-496),(7,3,425,3072),(8,3,428,768),(9,3,426,2048),(10,3,427,-32639),(11,3,466,16384),(12,3,429,512),(13,3,430,4096),(14,3,431,16384),(15,3,432,16384),(16,3,433,0),(17,3,434,8192),(18,3,435,0),(19,3,436,0),(20,3,437,0),(21,3,438,0),(22,3,439,0),(23,3,440,0),(24,3,441,0),(25,3,442,16),(26,3,443,16384),(27,3,444,2048),(28,3,445,0),(29,3,446,397),(30,3,447,256),(31,3,448,-12291),(32,3,449,25199),(34,3,451,8),(35,3,452,-12),(36,3,453,-18272),(37,3,454,2048),(38,3,455,9696),(39,3,456,2048),(40,3,457,9068),(41,3,458,0),(42,3,459,-8),(43,3,460,1048),(44,3,461,818),(45,3,462,1048),(46,3,463,607),(47,3,464,-1),(48,3,465,27034),(49,3,467,0),(50,3,468,0),(51,3,469,0),(52,3,476,4096),(53,3,477,504),(54,3,478,19661),(55,4,7,4194560),(56,4,2,32768),(57,4,10,0),(58,4,17,0),(59,4,14,12451),(60,4,1,0),(61,4,3,64),(62,4,4,0),(63,4,76,786),(64,4,77,28672),(65,4,78,12),(66,4,110,0),(67,4,111,2048),(68,4,112,2048),(69,4,113,5),(70,4,115,16384),(71,4,116,1800),(72,4,117,512),(73,4,114,0),(74,4,118,0),(75,4,119,26000),(76,4,120,39536),(77,4,121,0),(78,4,122,0),(79,4,136,0),(80,4,123,0),(81,4,124,2048),(82,4,125,2048),(83,4,126,5),(84,4,128,16384),(85,4,129,1800),(86,4,130,512),(87,4,127,0),(88,4,131,0),(89,4,132,26000),(90,4,133,39536),(91,4,134,0),(92,4,135,0),(93,4,137,0),(94,4,72,16384),(95,4,66,4096),(96,4,67,4096),(97,4,68,4096),(98,4,69,4096),(99,4,70,4096),(100,4,71,4096),(101,4,100,0),(102,4,101,0),(103,4,102,0),(104,4,103,0),(105,4,104,0),(106,4,105,0),(107,4,106,0),(108,4,107,0),(109,4,108,0),(110,4,109,0),(111,5,7,4194561),(112,5,2,32768),(113,5,10,0),(114,5,17,0),(115,5,14,12451),(116,5,1,0),(117,5,3,64),(118,5,4,0),(119,5,76,786),(120,5,77,28672),(121,5,78,12),(122,5,110,1),(123,5,111,2048),(124,5,112,2048),(125,5,113,5),(126,5,115,0),(127,5,116,16384),(128,5,117,1638),(129,5,114,0),(130,5,118,0),(131,5,119,12600),(132,5,120,52936),(133,5,121,8192),(134,5,122,0),(135,5,136,0),(136,5,123,1),(137,5,124,2048),(138,5,125,2048),(139,5,126,5),(140,5,128,0),(141,5,129,16384),(142,5,130,1638),(143,5,127,0),(144,5,131,0),(145,5,132,12600),(146,5,133,52936),(147,5,134,8192),(148,5,135,0),(149,5,137,0),(150,5,72,16384),(151,5,66,4096),(152,5,67,4096),(153,5,68,4096),(154,5,69,4096),(155,5,70,4096),(156,5,71,4096),(157,5,100,0),(158,5,101,0),(159,5,102,0),(160,5,103,0),(161,5,104,0),(162,5,105,0),(163,5,106,0),(164,5,107,0),(165,5,108,0),(166,5,109,0),(167,6,7,4194562),(168,6,2,32768),(169,6,10,0),(170,6,17,0),(171,6,14,12451),(172,6,1,0),(173,6,3,64),(174,6,4,0),(175,6,76,786),(176,6,77,28672),(177,6,78,12),(178,6,110,0),(179,6,111,2048),(180,6,112,2048),(181,6,113,5),(182,6,115,16384),(183,6,116,1800),(184,6,117,512),(185,6,114,0),(186,6,118,0),(187,6,119,26000),(188,6,120,39536),(189,6,121,0),(190,6,122,0),(191,6,136,0),(192,6,123,1),(193,6,124,2048),(194,6,125,2048),(195,6,126,5),(196,6,128,0),(197,6,129,16384),(198,6,130,1638),(199,6,127,0),(200,6,131,0),(201,6,132,12600),(202,6,133,52936),(203,6,134,8192),(204,6,135,0),(205,6,137,0),(206,6,72,16384),(207,6,66,4096),(208,6,67,4096),(209,6,68,4096),(210,6,69,4096),(211,6,70,4096),(212,6,71,4096),(213,6,100,0),(214,6,101,0),(215,6,102,0),(216,6,103,0),(217,6,104,0),(218,6,105,0),(219,6,106,0),(220,6,107,0),(221,6,108,0),(222,6,109,0),(223,7,7,4194563),(224,7,2,32768),(225,7,10,0),(226,7,17,0),(227,7,14,12451),(228,7,1,0),(229,7,3,64),(230,7,4,0),(231,7,76,786),(232,7,77,28672),(233,7,78,12),(234,7,110,1),(235,7,111,2048),(236,7,112,2048),(237,7,113,5),(238,7,115,0),(239,7,116,16384),(240,7,117,1638),(241,7,114,0),(242,7,118,0),(243,7,119,12600),(244,7,120,52936),(245,7,121,8192),(246,7,122,0),(247,7,136,0),(248,7,123,0),(249,7,124,2048),(250,7,125,2048),(251,7,126,5),(252,7,128,16384),(253,7,129,1800),(254,7,130,512),(255,7,127,0),(256,7,131,0),(257,7,132,26000),(258,7,133,39536),(259,7,134,0),(260,7,135,0),(261,7,137,0),(262,7,72,16384),(263,7,66,4096),(264,7,67,4096),(265,7,68,4096),(266,7,69,4096),(267,7,70,4096),(268,7,71,4096),(269,7,100,0),(270,7,101,0),(271,7,102,0),(272,7,103,0),(273,7,104,0),(274,7,105,0),(275,7,106,0),(276,7,107,0),(277,7,108,0),(278,7,109,0),(279,8,7,4194816),(280,8,2,32768),(281,8,10,0),(282,8,17,0),(283,8,14,12451),(284,8,1,0),(285,8,3,64),(286,8,4,0),(287,8,76,786),(288,8,77,28672),(289,8,78,12),(290,8,110,1),(291,8,111,2048),(292,8,112,2048),(293,8,113,5),(294,8,115,0),(295,8,116,16384),(296,8,117,1638),(297,8,114,0),(298,8,118,0),(299,8,119,12600),(300,8,120,52936),(301,8,121,8192),(302,8,122,0),(303,8,136,50),(304,8,123,0),(305,8,124,2048),(306,8,125,2048),(307,8,126,5),(308,8,128,16384),(309,8,129,1800),(310,8,130,512),(311,8,127,0),(312,8,131,0),(313,8,132,26000),(314,8,133,39536),(315,8,134,0),(316,8,135,0),(317,8,137,0),(318,8,72,16384),(319,8,66,4096),(320,8,67,4096),(321,8,68,4096),(322,8,69,4096),(323,8,70,4096),(324,8,71,4096),(325,8,100,0),(326,8,101,0),(327,8,102,0),(328,8,103,0),(329,8,104,0),(330,8,105,0),(331,8,106,0),(332,8,107,0),(333,8,108,0),(334,8,109,0),(335,9,7,4194816),(336,9,2,32768),(337,9,10,0),(338,9,17,0),(339,9,14,12451),(340,9,1,0),(341,9,3,64),(342,9,4,0),(343,9,76,786),(344,9,77,28672),(345,9,78,12),(346,9,110,0),(347,9,111,2048),(348,9,112,2048),(349,9,113,5),(350,9,115,16384),(351,9,116,1800),(352,9,117,512),(353,9,114,0),(354,9,118,0),(355,9,119,26000),(356,9,120,39536),(357,9,121,0),(358,9,122,0),(359,9,136,0),(360,9,123,0),(361,9,124,2048),(362,9,125,2048),(363,9,126,5),(364,9,128,16384),(365,9,129,1800),(366,9,130,512),(367,9,127,0),(368,9,131,0),(369,9,132,26000),(370,9,133,39536),(371,9,134,0),(372,9,135,0),(373,9,137,0),(374,9,72,16384),(375,9,66,4096),(376,9,67,4096),(377,9,68,4096),(378,9,69,4096),(379,9,70,4096),(380,9,71,4096),(381,9,100,0),(382,9,101,0),(383,9,102,0),(384,9,103,0),(385,9,104,0),(386,9,105,0),(387,9,106,0),(388,9,107,0),(389,9,108,0),(390,9,109,0),(391,10,7,4195073),(392,10,2,32768),(393,10,10,0),(394,10,17,0),(395,10,14,12451),(396,10,1,0),(397,10,3,64),(398,10,4,0),(399,10,76,768),(400,10,77,28672),(401,10,78,12),(402,10,110,1),(403,10,111,2048),(404,10,112,2048),(405,10,113,5),(406,10,115,0),(407,10,116,16384),(408,10,117,1638),(409,10,114,0),(410,10,118,0),(411,10,119,12600),(412,10,120,52936),(413,10,121,8192),(414,10,122,0),(415,10,136,0),(416,10,123,0),(417,10,124,2048),(418,10,125,2048),(419,10,126,5),(420,10,128,16384),(421,10,129,1800),(422,10,130,512),(423,10,127,0),(424,10,131,0),(425,10,132,26000),(426,10,133,39536),(427,10,134,0),(428,10,135,0),(429,10,137,0),(430,10,72,16384),(431,10,66,4096),(432,10,67,4096),(433,10,68,4096),(434,10,69,4096),(435,10,70,4096),(436,10,71,4096),(437,10,100,0),(438,10,101,0),(439,10,102,0),(440,10,103,0),(441,10,104,0),(442,10,105,0),(443,10,106,0),(444,10,107,0),(445,10,108,0),(446,10,109,0),(447,11,7,4195072),(448,11,2,32768),(449,11,10,0),(450,11,17,0),(451,11,14,12451),(452,11,1,0),(453,11,3,64),(454,11,4,0),(455,11,76,768),(456,11,77,28672),(457,11,78,12),(458,11,110,0),(459,11,111,2048),(460,11,112,2048),(461,11,113,5),(462,11,115,16384),(463,11,116,1800),(464,11,117,512),(465,11,114,0),(466,11,118,0),(467,11,119,26000),(468,11,120,39536),(469,11,121,0),(470,11,122,0),(471,11,136,0),(472,11,123,0),(473,11,124,2048),(474,11,125,2048),(475,11,126,5),(476,11,128,16384),(477,11,129,1800),(478,11,130,512),(479,11,127,0),(480,11,131,0),(481,11,132,26000),(482,11,133,39536),(483,11,134,0),(484,11,135,0),(485,11,137,0),(486,11,72,16384),(487,11,66,4096),(488,11,67,4096),(489,11,68,4096),(490,11,69,4096),(491,11,70,4096),(492,11,71,4096),(493,11,100,0),(494,11,101,0),(495,11,102,0),(496,11,103,0),(497,11,104,0),(498,11,105,0),(499,11,106,0),(500,11,107,0),(501,11,108,0),(502,11,109,0),(503,3,421,512),(504,3,450,12451),(505,12,7,6291968),(506,12,2,32768),(507,12,14,12451),(508,12,3,0),(509,12,4,0),(510,12,76,786),(511,12,77,28672),(512,12,78,12),(513,12,110,0),(514,12,111,2048),(515,12,112,2048),(516,12,113,5),(517,12,115,16384),(518,12,116,1800),(519,12,117,512),(520,12,114,0),(521,12,118,0),(522,12,119,26000),(523,12,120,39536),(524,12,121,0),(525,12,122,0),(526,12,136,0),(527,12,123,0),(528,12,124,2048),(529,12,125,2048),(530,12,126,5),(531,12,128,16384),(532,12,129,1800),(533,12,130,512),(534,12,127,0),(535,12,131,0),(536,12,132,26000),(537,12,133,39536),(538,12,134,0),(539,12,135,0),(540,12,137,0),(541,12,72,16384),(542,12,66,4096),(543,12,67,4096),(544,12,68,4096),(545,12,69,4096),(546,12,70,4096),(547,12,71,4096),(548,12,100,0),(549,12,101,0),(550,12,102,0),(551,12,103,0),(552,12,104,0),(553,12,105,0),(554,12,106,0),(555,12,107,0),(556,12,108,0),(557,12,109,0),(558,13,7,6291969),(559,13,2,32768),(560,13,14,12451),(561,13,3,0),(562,13,4,0),(563,13,76,786),(564,13,77,28672),(565,13,78,12),(566,13,110,1),(567,13,111,2048),(568,13,112,2048),(569,13,113,5),(570,13,115,0),(571,13,116,16384),(572,13,117,1638),(573,13,114,0),(574,13,118,0),(575,13,119,12600),(576,13,120,52936),(577,13,121,8192),(578,13,122,0),(579,13,136,50),(580,13,123,0),(581,13,124,2048),(582,13,125,2048),(583,13,126,5),(584,13,128,16384),(585,13,129,1800),(586,13,130,512),(587,13,127,0),(588,13,131,0),(589,13,132,26000),(590,13,133,39536),(591,13,134,0),(592,13,135,0),(593,13,137,0),(594,13,72,16384),(595,13,66,4096),(596,13,67,4096),(597,13,68,4096),(598,13,69,4096),(599,13,70,4096),(600,13,71,4096),(601,13,100,0),(602,13,101,0),(603,13,102,0),(604,13,103,0),(605,13,104,0),(606,13,105,0),(607,13,106,0),(608,13,107,0),(609,13,108,0),(610,13,109,0),(611,14,7,6293248),(612,14,2,32768),(613,14,14,12451),(614,14,3,0),(615,14,4,0),(616,14,76,768),(617,14,77,28672),(618,14,78,12),(619,14,110,0),(620,14,111,2048),(621,14,112,2048),(622,14,113,5),(623,14,115,16384),(624,14,116,1800),(625,14,117,512),(626,14,114,0),(627,14,118,0),(628,14,119,12600),(629,14,120,52936),(630,14,121,0),(631,14,122,0),(632,14,136,0),(633,14,123,0),(634,14,124,2048),(635,14,125,2048),(636,14,126,5),(637,14,128,16384),(638,14,129,1800),(639,14,130,512),(640,14,127,0),(641,14,131,0),(642,14,132,12600),(643,14,133,52936),(644,14,134,0),(645,14,135,0),(646,14,137,0),(647,14,72,16384),(648,14,66,4096),(649,14,67,4096),(650,14,68,4096),(651,14,69,4096),(652,14,70,4096),(653,14,71,4096),(654,14,100,0),(655,14,101,0),(656,14,102,0),(657,14,103,0),(658,14,104,0),(659,14,105,0),(660,14,106,0),(661,14,107,0),(662,14,108,0),(663,14,109,0),(664,15,7,6293249),(665,15,2,32768),(666,15,14,12451),(667,15,3,0),(668,15,4,0),(669,15,76,768),(670,15,77,28672),(671,15,78,12),(672,15,110,1),(673,15,111,2048),(674,15,112,2048),(675,15,113,5),(676,15,115,0),(677,15,116,13107),(678,15,117,1146),(679,15,114,0),(680,15,118,0),(681,15,119,12600),(682,15,120,52936),(683,15,121,3276),(684,15,122,0),(685,15,136,0),(686,15,123,0),(687,15,124,2048),(688,15,125,2048),(689,15,126,5),(690,15,128,16384),(691,15,129,1800),(692,15,130,512),(693,15,127,0),(694,15,131,0),(695,15,132,12600),(696,15,133,52936),(697,15,134,0),(698,15,135,0),(699,15,137,0),(700,15,72,16384),(701,15,66,4096),(702,15,67,4096),(703,15,68,4096),(704,15,69,4096),(705,15,70,4096),(706,15,71,4096),(707,15,100,0),(708,15,101,0),(709,15,102,0),(710,15,103,0),(711,15,104,0),(712,15,105,0),(713,15,106,0),(714,15,107,0),(715,15,108,0),(716,15,109,0),(717,16,7,6291712),(718,16,2,32768),(719,16,14,12451),(720,16,3,0),(721,16,4,0),(722,16,76,786),(723,16,77,28672),(724,16,78,12),(725,16,110,0),(726,16,111,2048),(727,16,112,2048),(728,16,113,5),(729,16,115,16384),(730,16,116,1800),(731,16,117,512),(732,16,114,0),(733,16,118,0),(734,16,119,26000),(735,16,120,39536),(736,16,121,0),(737,16,122,0),(738,16,136,0),(739,16,123,0),(740,16,124,2048),(741,16,125,2048),(742,16,126,5),(743,16,128,16384),(744,16,129,1800),(745,16,130,512),(746,16,127,0),(747,16,131,0),(748,16,132,26000),(749,16,133,39536),(750,16,134,0),(751,16,135,0),(752,16,137,0),(753,16,72,16384),(754,16,66,4096),(755,16,67,4096),(756,16,68,4096),(757,16,69,4096),(758,16,70,4096),(759,16,71,4096),(760,16,100,0),(761,16,101,0),(762,16,102,0),(763,16,103,0),(764,16,104,0),(765,16,105,0),(766,16,106,0),(767,16,107,0),(768,16,108,0),(769,16,109,0),(770,17,7,6291713),(771,17,2,32768),(772,17,14,12451),(773,17,3,0),(774,17,4,0),(775,17,76,786),(776,17,77,28672),(777,17,78,12),(778,17,110,1),(779,17,111,2048),(780,17,112,2048),(781,17,113,5),(782,17,115,0),(783,17,116,16384),(784,17,117,1638),(785,17,114,0),(786,17,118,0),(787,17,119,12600),(788,17,120,52936),(789,17,121,8192),(790,17,122,0),(791,17,136,0),(792,17,123,1),(793,17,124,2048),(794,17,125,2048),(795,17,126,5),(796,17,128,0),(797,17,129,16384),(798,17,130,1638),(799,17,127,0),(800,17,131,0),(801,17,132,12600),(802,17,133,52936),(803,17,134,8192),(804,17,135,0),(805,17,137,0),(806,17,72,16384),(807,17,66,4096),(808,17,67,4096),(809,17,68,4096),(810,17,69,4096),(811,17,70,4096),(812,17,71,4096),(813,17,100,0),(814,17,101,0),(815,17,102,0),(816,17,103,0),(817,17,104,0),(818,17,105,0),(819,17,106,0),(820,17,107,0),(821,17,108,0),(822,17,109,0),(823,18,7,6291714),(824,18,2,32768),(825,18,14,12451),(826,18,3,0),(827,18,4,0),(828,18,76,786),(829,18,77,28672),(830,18,78,12),(831,18,110,0),(832,18,111,2048),(833,18,112,2048),(834,18,113,5),(835,18,115,16384),(836,18,116,1800),(837,18,117,512),(838,18,114,0),(839,18,118,0),(840,18,119,26000),(841,18,120,39536),(842,18,121,0),(843,18,122,0),(844,18,136,0),(845,18,123,1),(846,18,124,2048),(847,18,125,2048),(848,18,126,5),(849,18,128,0),(850,18,129,16384),(851,18,130,1638),(852,18,127,0),(853,18,131,0),(854,18,132,12600),(855,18,133,52936),(856,18,134,8192),(857,18,135,0),(858,18,137,0),(859,18,72,16384),(860,18,66,4096),(861,18,67,4096),(862,18,68,4096),(863,18,69,4096),(864,18,70,4096),(865,18,71,4096),(866,18,100,0),(867,18,101,0),(868,18,102,0),(869,18,103,0),(870,18,104,0),(871,18,105,0),(872,18,106,0),(873,18,107,0),(874,18,108,0),(875,18,109,0),(876,19,7,6291715),(877,19,2,32768),(878,19,14,12451),(879,19,3,0),(880,19,4,0),(881,19,76,786),(882,19,77,28672),(883,19,78,12),(884,19,110,1),(885,19,111,2048),(886,19,112,2048),(887,19,113,5),(888,19,115,0),(889,19,116,13107),(890,19,117,1146),(891,19,114,0),(892,19,118,0),(893,19,119,12600),(894,19,120,52936),(895,19,121,3276),(896,19,122,0),(897,19,136,0),(898,19,123,0),(899,19,124,2048),(900,19,125,2048),(901,19,126,5),(902,19,128,16384),(903,19,129,1800),(904,19,130,512),(905,19,127,0),(906,19,131,0),(907,19,132,26000),(908,19,133,39536),(909,19,134,0),(910,19,135,0),(911,19,137,0),(912,19,72,16384),(913,19,66,4096),(914,19,67,4096),(915,19,68,4096),(916,19,69,4096),(917,19,70,4096),(918,19,71,4096),(919,19,100,0),(920,19,101,0),(921,19,102,0),(922,19,103,0),(923,19,104,0),(924,19,105,0),(925,19,106,0),(926,19,107,0),(927,19,108,0),(928,19,109,0),(929,20,7,6292224),(930,20,2,32768),(931,20,14,12451),(932,20,3,0),(933,20,4,0),(934,20,76,768),(935,20,77,28672),(936,20,78,12),(937,20,110,0),(938,20,111,2048),(939,20,112,2048),(940,20,113,5),(941,20,115,16384),(942,20,116,1800),(943,20,117,512),(944,20,114,0),(945,20,118,0),(946,20,119,26000),(947,20,120,39536),(948,20,121,0),(949,20,122,0),(950,20,136,0),(951,20,123,0),(952,20,124,2048),(953,20,125,2048),(954,20,126,5),(955,20,128,16384),(956,20,129,1800),(957,20,130,512),(958,20,127,0),(959,20,131,0),(960,20,132,26000),(961,20,133,39536),(962,20,134,0),(963,20,135,0),(964,20,137,0),(965,20,72,16384),(966,20,66,4096),(967,20,67,4096),(968,20,68,4096),(969,20,69,4096),(970,20,70,4096),(971,20,71,4096),(972,20,100,0),(973,20,101,0),(974,20,102,0),(975,20,103,0),(976,20,104,0),(977,20,105,0),(978,20,106,0),(979,20,107,0),(980,20,108,0),(981,20,109,0),(982,21,7,6292225),(983,21,2,32768),(984,21,14,12451),(985,21,3,0),(986,21,4,0),(987,21,76,262),(988,21,77,28672),(989,21,78,12),(990,21,110,1),(991,21,111,2048),(992,21,112,2048),(993,21,113,5),(994,21,115,0),(995,21,116,13107),(996,21,117,1146),(997,21,114,0),(998,21,118,0),(999,21,119,12600),(1000,21,120,52936),(1001,21,121,3276),(1002,21,122,0),(1003,21,136,0),(1004,21,123,0),(1005,21,124,2048),(1006,21,125,2048),(1007,21,126,5),(1008,21,128,16384),(1009,21,129,1800),(1010,21,130,512),(1011,21,127,0),(1012,21,131,0),(1013,21,132,26000),(1014,21,133,39536),(1015,21,134,0),(1016,21,135,0),(1017,21,137,0),(1018,21,72,16384),(1019,21,66,4096),(1020,21,67,4096),(1021,21,68,4096),(1022,21,69,4096),(1023,21,70,4096),(1024,21,71,4096),(1025,21,100,0),(1026,21,101,0),(1027,21,102,0),(1028,21,103,0),(1029,21,104,0),(1030,21,105,0),(1031,21,106,0),(1032,21,107,0),(1033,21,108,0),(1034,21,109,0);
/*!40000 ALTER TABLE `register_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `setpoint_source`
--

DROP TABLE IF EXISTS `setpoint_source`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `setpoint_source` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `value` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `setpoint_source`
--

LOCK TABLES `setpoint_source` WRITE;
/*!40000 ALTER TABLE `setpoint_source` DISABLE KEYS */;
INSERT INTO `setpoint_source` VALUES (1,'Internal AWFG',0),(2,'External HIL (SFP)',1);
/*!40000 ALTER TABLE `setpoint_source` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `source_mode`
--

DROP TABLE IF EXISTS `source_mode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `source_mode` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `source_mode`
--

LOCK TABLES `source_mode` WRITE;
/*!40000 ALTER TABLE `source_mode` DISABLE KEYS */;
INSERT INTO `source_mode` VALUES (1,'Voltage'),(2,'Current'),(3,'Mixed U-I'),(4,'Mixed I-U');
/*!40000 ALTER TABLE `source_mode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_component`
--

DROP TABLE IF EXISTS `system_component`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_component` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent` int(11) DEFAULT NULL,
  `type_id` int(11) NOT NULL,
  `hw_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKsystem_com408620` (`parent`),
  KEY `extends` (`id`),
  KEY `fk_system_component_system_item_type1_idx` (`type_id`),
  CONSTRAINT `FKsystem_com408620` FOREIGN KEY (`parent`) REFERENCES `system_component` (`id`),
  CONSTRAINT `fk_system_component_system_item_type1` FOREIGN KEY (`type_id`) REFERENCES `system_item_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_component`
--

LOCK TABLES `system_component` WRITE;
/*!40000 ALTER TABLE `system_component` DISABLE KEYS */;
INSERT INTO `system_component` VALUES (1,NULL,1,1),(2,1,2,1),(3,2,5,1),(4,2,4,1),(6,4,3,1),(7,4,3,2),(8,4,3,3),(9,4,3,4),(10,4,6,1),(11,4,6,2),(12,2,4,2),(62,12,3,1),(63,12,3,2),(64,12,3,3),(65,12,3,4),(66,12,6,1),(67,12,6,2),(68,4,3,5),(69,4,3,6);
/*!40000 ALTER TABLE `system_component` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_component_address`
--

DROP TABLE IF EXISTS `system_component_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_component_address` (
  `system_component_id` int(11) NOT NULL,
  `ip` varchar(15) NOT NULL,
  `cfg_port` int(11) DEFAULT NULL,
  `stat_port` int(11) DEFAULT NULL,
  PRIMARY KEY (`system_component_id`),
  KEY `fk_system_ccb_system_component1_idx` (`system_component_id`),
  CONSTRAINT `fk_system_ccb_system_component1` FOREIGN KEY (`system_component_id`) REFERENCES `system_component` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_component_address`
--

LOCK TABLES `system_component_address` WRITE;
/*!40000 ALTER TABLE `system_component_address` DISABLE KEYS */;
INSERT INTO `system_component_address` VALUES (3,'10.52.254.100',NULL,NULL),(4,'10.52.254.203',33500,33600),(12,'10.52.254.220',33500,33600);
/*!40000 ALTER TABLE `system_component_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_config`
--

DROP TABLE IF EXISTS `system_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `users_id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_system_config_users2_idx` (`users_id`),
  CONSTRAINT `fk_system_config_users2` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_config`
--

LOCK TABLES `system_config` WRITE;
/*!40000 ALTER TABLE `system_config` DISABLE KEYS */;
INSERT INTO `system_config` VALUES (1,1,'TestConfig1','My super cool test config numero uno'),(2,1,'TestConfig2','My super cool test config numero due');
/*!40000 ALTER TABLE `system_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_csu`
--

DROP TABLE IF EXISTS `system_csu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_csu` (
  `system_component_id` int(11) NOT NULL,
  `csu_tag` tinyint(4) DEFAULT NULL,
  `cda_count` tinyint(4) DEFAULT NULL,
  `multi_mode` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`system_component_id`),
  KEY `fk_system_csu_system_component1_idx` (`system_component_id`),
  CONSTRAINT `fk_system_csu_system_component1` FOREIGN KEY (`system_component_id`) REFERENCES `system_component` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_csu`
--

LOCK TABLES `system_csu` WRITE;
/*!40000 ALTER TABLE `system_csu` DISABLE KEYS */;
INSERT INTO `system_csu` VALUES (2,1,4,0);
/*!40000 ALTER TABLE `system_csu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_csus`
--

DROP TABLE IF EXISTS `system_csus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_csus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `csu_hw_id` int(11) NOT NULL,
  `system_config_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_system_gamps_system_config1_idx` (`system_config_id`),
  CONSTRAINT `fk_system_gamps_system_config1` FOREIGN KEY (`system_config_id`) REFERENCES `system_config` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_csus`
--

LOCK TABLES `system_csus` WRITE;
/*!40000 ALTER TABLE `system_csus` DISABLE KEYS */;
INSERT INTO `system_csus` VALUES (1,1,1),(2,1,2);
/*!40000 ALTER TABLE `system_csus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_item_type`
--

DROP TABLE IF EXISTS `system_item_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_item_type` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `show_as` varchar(45) DEFAULT NULL,
  `is_leaf` tinyint(1) DEFAULT NULL,
  `hw_version` int(11) DEFAULT NULL,
  `fw_version` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_item_type`
--

LOCK TABLES `system_item_type` WRITE;
/*!40000 ALTER TABLE `system_item_type` DISABLE KEYS */;
INSERT INTO `system_item_type` VALUES (0,'UKN','Unknown',0,100,100),(1,'SYS','System',0,100,100),(2,'CSU','Cabinet',0,100,100),(3,'CDA','Amplifier',1,100,100),(4,'CCD','Group',0,100,100),(5,'PLC','PLC',1,100,100),(6,'CMB','Measurement',1,100,100),(7,'IOBox','IOBox',1,100,100),(8,'GIV','Grid inverter',1,100,100);
/*!40000 ALTER TABLE `system_item_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_limits`
--

DROP TABLE IF EXISTS `system_limits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_limits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `v_min` float DEFAULT NULL,
  `v_max` float DEFAULT NULL,
  `i_min` float DEFAULT NULL,
  `i_max` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_limits`
--

LOCK TABLES `system_limits` WRITE;
/*!40000 ALTER TABLE `system_limits` DISABLE KEYS */;
INSERT INTO `system_limits` VALUES (1,'MyLimits','Limits for testing the system',5.2,181.2,2.4,184),(7,'kurt','New entry',2.2,1.1,4.4,3.3),(8,'DerPauli','New entry from Pauli',4,5,2,3),(9,'MeierGotthart1','New entry from Meier Gotthart',0,10,1,6);
/*!40000 ALTER TABLE `system_limits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_properties`
--

DROP TABLE IF EXISTS `user_properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_properties` (
  `users_id` int(11) NOT NULL,
  `guiRowColorEven` varchar(15) DEFAULT NULL,
  `guiRowColorOdd` varchar(15) DEFAULT NULL,
  KEY `fk_user_properties_users1_idx` (`users_id`),
  CONSTRAINT `fk_user_properties_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_properties`
--

LOCK TABLES `user_properties` WRITE;
/*!40000 ALTER TABLE `user_properties` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(63) NOT NULL,
  `level` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
INSERT INTO `user_roles` VALUES (1,'DevAdmin',100),(2,'UserAdmin',75),(3,'User',25);
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `username` varchar(31) NOT NULL,
  `password` varchar(63) DEFAULT NULL,
  `user_role_id` int(11) NOT NULL,
  `name` varchar(127) DEFAULT NULL,
  `email` varchar(127) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `FKusers895240` (`user_role_id`),
  KEY `fk_users_customer1_idx` (`customer_id`),
  CONSTRAINT `FKusers895240` FOREIGN KEY (`user_role_id`) REFERENCES `user_roles` (`id`),
  CONSTRAINT `fk_users_customer1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,1,'admin','ISMvKXpXpadDiUoOSoAfww==',1,'Administrator','admin@egston.com',1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-02-16 10:02:53
