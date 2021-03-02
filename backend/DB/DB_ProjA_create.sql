-- MySQL dump 10.13  Distrib 5.7.29, for macos10.14 (x86_64)
--
-- Host: localhost    Database: projA
-- ------------------------------------------------------
-- Server version	5.7.29

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
-- Current Database: `projA`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `projA` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `projA`;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (8,'Appliances'),(3,'Automobile'),(5,'Books'),(1,'Electronics'),(10,'Food'),(4,'Furniture'),(7,'Pets'),(2,'Real Estate'),(6,'Subscriptions'),(9,'Toys');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `countries` (
  `code` varchar(4) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `continent_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`code`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES ('AUS','Australia','Australia'),('GBR','United Kingdom','Europe'),('IND','India','Asia'),('POL','Poland','Europe'),('SGP','Singapore','Asia'),('USA','United States','America');
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posting`
--

DROP TABLE IF EXISTS `posting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `public_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `price` int(11) DEFAULT NULL,
  `country` varchar(4) DEFAULT NULL,
  `status` varchar(255) DEFAULT 'NEW',
  PRIMARY KEY (`id`),
  UNIQUE KEY `public_id` (`public_id`),
  KEY `country` (`country`),
  KEY `status` (`status`),
  KEY `category` (`category`),
  KEY `created_by` (`created_by`),
  CONSTRAINT `posting_ibfk_1` FOREIGN KEY (`country`) REFERENCES `countries` (`code`),
  CONSTRAINT `posting_ibfk_2` FOREIGN KEY (`status`) REFERENCES `status` (`status`),
  CONSTRAINT `posting_ibfk_3` FOREIGN KEY (`category`) REFERENCES `category` (`name`),
  CONSTRAINT `posting_ibfk_4` FOREIGN KEY (`created_by`) REFERENCES `users` (`uname`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posting`
--

LOCK TABLES `posting` WRITE;
/*!40000 ALTER TABLE `posting` DISABLE KEYS */;
/*!40000 ALTER TABLE `posting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posting_image`
--

DROP TABLE IF EXISTS `posting_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posting_image` (
  `posting_id` int(11) DEFAULT NULL,
  `posting_image` blob,
  KEY `posting_id` (`posting_id`),
  CONSTRAINT `posting_image_ibfk_1` FOREIGN KEY (`posting_id`) REFERENCES `posting` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posting_image`
--

LOCK TABLES `posting_image` WRITE;
/*!40000 ALTER TABLE `posting_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `posting_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posting_interest`
--

DROP TABLE IF EXISTS `posting_interest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posting_interest` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `posting_id` int(11) DEFAULT NULL,
  `posting_owner` varchar(255) DEFAULT NULL,
  `interest_by` varchar(255) DEFAULT NULL,
  `interest_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `accept` tinyint(1) DEFAULT '0',
  `accept_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `posting_id` (`posting_id`),
  KEY `posting_owner` (`posting_owner`),
  KEY `interest_by` (`interest_by`),
  CONSTRAINT `posting_interest_ibfk_1` FOREIGN KEY (`posting_id`) REFERENCES `posting` (`id`),
  CONSTRAINT `posting_interest_ibfk_2` FOREIGN KEY (`posting_owner`) REFERENCES `posting` (`created_by`),
  CONSTRAINT `posting_interest_ibfk_3` FOREIGN KEY (`interest_by`) REFERENCES `users` (`uname`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posting_interest`
--

LOCK TABLES `posting_interest` WRITE;
/*!40000 ALTER TABLE `posting_interest` DISABLE KEYS */;
/*!40000 ALTER TABLE `posting_interest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posting_public`
--

DROP TABLE IF EXISTS `posting_public`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posting_public` (
  `public_id` int(11) NOT NULL,
  `posting_id` int(11) NOT NULL,
  `global` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`public_id`,`posting_id`),
  KEY `posting_id` (`posting_id`),
  CONSTRAINT `posting_public_ibfk_1` FOREIGN KEY (`posting_id`) REFERENCES `posting` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posting_public`
--

LOCK TABLES `posting_public` WRITE;
/*!40000 ALTER TABLE `posting_public` DISABLE KEYS */;
/*!40000 ALTER TABLE `posting_public` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `status` (
  `id` int(11) NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` VALUES (3,'CLOSED'),(1,'NEW'),(2,'OPEN'),(4,'REOPEN');
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `uname` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uname` (`uname`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Keerthivasan Rangarajan','kerangar','kerangar@cisco.com',NULL),(2,'Aditya Ghate','gghate','gghate@cisco.com',NULL),(3,'Srivijay Vaidyanathan','smvaidya','smvaidya@cisco.com',NULL),(4,'Pankaj Yadav','pankayad','pankayad@cisco.com',NULL),(5,'Ankur Yadav','ankuryad','ankuryad@cisco.com',NULL),(6,'Varun Kushwah','vakushwa','vakushwa@cisco.com',NULL);
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

-- Dump completed on 2021-03-02 17:26:20
