-- MySQL dump 10.13  Distrib 5.5.35, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: dbWebportal
-- ------------------------------------------------------
-- Server version	5.5.35-0ubuntu0.12.04.2-log

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
-- Table structure for table `tblEinkauf_kopf`
--

DROP TABLE IF EXISTS `tblEinkauf_kopf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblEinkauf_kopf` (
  `fldIndex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldDatum` datetime NOT NULL,
  PRIMARY KEY (`fldIndex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblEinkauf_liste`
--

DROP TABLE IF EXISTS `tblEinkauf_liste`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblEinkauf_liste` (
  `fldIndex` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `fldReihenfolge` int(11) NOT NULL,
  `fldBez` char(80) CHARACTER SET latin1 DEFAULT '0',
  `fldArtikelnr` varchar(20) CHARACTER SET latin1 NOT NULL,
  `fldTyp` varchar(5) CHARACTER SET latin1 NOT NULL,
  `fldSort` varchar(20) CHARACTER SET latin1 NOT NULL,
  `fldAbteilung` varchar(30) CHARACTER SET latin1 NOT NULL,
  `fldOrt` varchar(25) CHARACTER SET latin1 NOT NULL,
  `fldPreis` decimal(10,2) NOT NULL,
  `fldAnz` decimal(10,3) NOT NULL,
  `fldArchivDat` char(10) CHARACTER SET latin1 NOT NULL,
  `fldKonto` varchar(15) CHARACTER SET latin1 NOT NULL,
  `fldBarcode` varchar(20) CHARACTER SET latin1 NOT NULL,
  `flde01vorrat` bigint(20) NOT NULL,
  `fldStatus` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'offen',
  `fldEinkaufDat` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `fldid_kopf` bigint(20) NOT NULL,
  PRIMARY KEY (`fldIndex`)
) ENGINE=MyISAM AUTO_INCREMENT=33154 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblabteilung`
--

DROP TABLE IF EXISTS `tblabteilung`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblabteilung` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldAbteilung` varchar(80) CHARACTER SET latin1 COLLATE latin1_german1_ci NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=MyISAM AUTO_INCREMENT=154 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbladr_group`
--

DROP TABLE IF EXISTS `tbladr_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbladr_group` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldbez` varchar(250) COLLATE utf8_bin NOT NULL,
  `fldtyp` varchar(20) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=MyISAM AUTO_INCREMENT=214 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbladr_grpdetail`
--

DROP TABLE IF EXISTS `tbladr_grpdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbladr_grpdetail` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldgrp_ind` bigint(20) NOT NULL,
  `fldbez` varchar(250) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbladr_liste`
--

DROP TABLE IF EXISTS `tbladr_liste`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbladr_liste` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldid_group` bigint(20) NOT NULL DEFAULT '0',
  `fldid_typ` bigint(20) NOT NULL DEFAULT '0',
  `fldfirstname` varchar(255) COLLATE utf8_bin NOT NULL,
  `fldlastname` varchar(255) COLLATE utf8_bin NOT NULL,
  `fldcompany` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `fldbriefanrede` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `fldanrede` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `fldstreet` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `fldplz` varchar(10) COLLATE utf8_bin NOT NULL,
  `fldtown` varchar(250) COLLATE utf8_bin NOT NULL,
  `fldtelefon` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `fldhandy` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `fldemail` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `fldbemerk` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `fldoeffnungszeiten` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=MyISAM AUTO_INCREMENT=734 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbladr_lstgrp`
--

DROP TABLE IF EXISTS `tbladr_lstgrp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbladr_lstgrp` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldid_liste` bigint(20) NOT NULL,
  `fldid_group` bigint(20) NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=MyISAM AUTO_INCREMENT=1244 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbladr_typ`
--

DROP TABLE IF EXISTS `tbladr_typ`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbladr_typ` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldbez` varchar(250) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbladrantw`
--

DROP TABLE IF EXISTS `tbladrantw`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbladrantw` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldadrind` bigint(20) NOT NULL,
  `fldadrbez` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fldstatus` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fldeingdat` date NOT NULL,
  `fldantwdat` date NOT NULL,
  `fldbemerk` varchar(250) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=MyISAM AUTO_INCREMENT=194 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblanlass`
--

DROP TABLE IF EXISTS `tblanlass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblanlass` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldbez` varchar(250) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblartikel`
--

DROP TABLE IF EXISTS `tblartikel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblartikel` (
  `fldIndex` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `fldBez` char(80) DEFAULT '0',
  `fldArtikelnr` varchar(20) NOT NULL,
  `fldTyp` varchar(5) NOT NULL,
  `fldSort` varchar(20) NOT NULL,
  `fldAbteilung` varchar(30) NOT NULL,
  `fldOrt` varchar(25) NOT NULL,
  `fldPreis` decimal(10,2) NOT NULL,
  `fldAnz` int(3) NOT NULL,
  `fldKonto` varchar(8) NOT NULL,
  `flda01barcode` varchar(20) NOT NULL,
  `fldReihenfolge` int(11) NOT NULL,
  `fldBarcode` varchar(20) NOT NULL,
  PRIMARY KEY (`fldIndex`)
) ENGINE=MyISAM AUTO_INCREMENT=894 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblaufgabenplan`
--

DROP TABLE IF EXISTS `tblaufgabenplan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblaufgabenplan` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldbez` varchar(50) COLLATE utf8_bin NOT NULL,
  `fldtext` varchar(500) COLLATE utf8_bin NOT NULL,
  `flddatum` date NOT NULL,
  `fldid_benutzer` bigint(20) NOT NULL,
  `fldrotate` varchar(1) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=InnoDB AUTO_INCREMENT=2204 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblbarcode`
--

DROP TABLE IF EXISTS `tblbarcode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblbarcode` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldbez` varchar(250) COLLATE utf8_bin NOT NULL,
  `fldbarcode` varchar(20) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblbenutzer`
--

DROP TABLE IF EXISTS `tblbenutzer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblbenutzer` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldbez` varchar(200) COLLATE utf8_bin NOT NULL,
  `fldtimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fldfullname` varchar(250) COLLATE utf8_bin NOT NULL,
  `fldpwd` varchar(250) COLLATE utf8_bin NOT NULL,
  `fldstatus` varchar(10) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=MyISAM AUTO_INCREMENT=50004 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblbeschenkte`
--

DROP TABLE IF EXISTS `tblbeschenkte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblbeschenkte` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldname` varchar(250) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=MyISAM AUTO_INCREMENT=124 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblbilder`
--

DROP TABLE IF EXISTS `tblbilder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblbilder` (
  `fldb01index` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldb01bez` varchar(200) NOT NULL,
  `fldb01bild` blob NOT NULL,
  `fldb01filetype` varchar(10) NOT NULL,
  PRIMARY KEY (`fldb01index`)
) ENGINE=MyISAM AUTO_INCREMENT=214 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblbildverz`
--

DROP TABLE IF EXISTS `tblbildverz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblbildverz` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldid_medium` bigint(20) NOT NULL,
  `fldverz` varchar(250) COLLATE utf8_bin NOT NULL,
  `fldbild` blob NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblblutdruck`
--

DROP TABLE IF EXISTS `tblblutdruck`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblblutdruck` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldblutdruck` varchar(10) COLLATE utf8_bin NOT NULL,
  `fldpuls` int(11) NOT NULL,
  `fldid_zeitpunkt` bigint(20) NOT NULL,
  `flddatum` date NOT NULL,
  `fldid_benutzer` bigint(20) NOT NULL,
  `flduhrzeit` time NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=InnoDB AUTO_INCREMENT=164 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblcomputer`
--

DROP TABLE IF EXISTS `tblcomputer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblcomputer` (
  `fldIndex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldHost` varchar(80) COLLATE utf8_bin NOT NULL,
  `fldIPAddr` varchar(150) COLLATE utf8_bin NOT NULL,
  `fldSyncart` varchar(10) COLLATE utf8_bin NOT NULL,
  `fldaktiv` varchar(1) COLLATE utf8_bin NOT NULL,
  `flddbname` varchar(100) COLLATE utf8_bin NOT NULL,
  `fldusername` varchar(50) COLLATE utf8_bin NOT NULL,
  `fldpassword` varchar(50) COLLATE utf8_bin NOT NULL,
  `fldcloud` varchar(1) COLLATE utf8_bin NOT NULL DEFAULT 'N',
  `fldlocal` varchar(1) COLLATE utf8_bin NOT NULL DEFAULT 'N',
  PRIMARY KEY (`fldIndex`)
) ENGINE=MyISAM AUTO_INCREMENT=64 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbldbsync`
--

DROP TABLE IF EXISTS `tbldbsync`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbldbsync` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `flddbname` varchar(100) COLLATE utf8_bin NOT NULL,
  `fldtblname` varchar(100) COLLATE utf8_bin NOT NULL,
  `fldtblindex` bigint(20) NOT NULL,
  `fldcompid` bigint(20) NOT NULL,
  `fldtimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fldstatus` varchar(20) COLLATE utf8_bin NOT NULL,
  `flddbsync` varchar(20) COLLATE utf8_bin NOT NULL DEFAULT 'NEW',
  PRIMARY KEY (`fldindex`)
) ENGINE=MyISAM AUTO_INCREMENT=179694 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbldocman_brfdetail`
--

DROP TABLE IF EXISTS `tbldocman_brfdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbldocman_brfdetail` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `flddocman_ind` bigint(20) NOT NULL,
  `fldbez` varchar(250) COLLATE utf8_bin NOT NULL,
  `flddatum` date NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbldocman_brfverkehr`
--

DROP TABLE IF EXISTS `tbldocman_brfverkehr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbldocman_brfverkehr` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldbez` varchar(250) COLLATE utf8_bin NOT NULL,
  `fldversendet` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fldantwdat` date NOT NULL,
  `fldan_ind` bigint(20) NOT NULL,
  `fldstatus` varchar(10) COLLATE utf8_bin NOT NULL,
  `fldfilename` varchar(512) COLLATE utf8_bin NOT NULL,
  `fldparent` bigint(20) NOT NULL DEFAULT '0',
  `fldsort` varchar(10) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=MyISAM AUTO_INCREMENT=1374 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbldocman_detail`
--

DROP TABLE IF EXISTS `tbldocman_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbldocman_detail` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `flddocman_ind` bigint(20) NOT NULL,
  `fldsort` varchar(3) COLLATE utf8_bin NOT NULL,
  `fldbez` varchar(250) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=MyISAM AUTO_INCREMENT=94 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbldocman_doc`
--

DROP TABLE IF EXISTS `tbldocman_doc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbldocman_doc` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fld_detail` bigint(20) NOT NULL,
  `fldbez` varchar(250) COLLATE utf8_bin NOT NULL,
  `fldlink` varchar(250) COLLATE utf8_bin NOT NULL,
  `flddocvon` datetime NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbldocman_liste`
--

DROP TABLE IF EXISTS `tbldocman_liste`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbldocman_liste` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldindkat` bigint(20) NOT NULL,
  `fldbez` varchar(250) COLLATE utf8_bin NOT NULL,
  `flddatum` date NOT NULL,
  `fldregal` varchar(250) COLLATE utf8_bin NOT NULL,
  `fldlink` varchar(250) COLLATE utf8_bin NOT NULL,
  `fldind_zimmer` bigint(20) NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=MyISAM AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblelternconfig`
--

DROP TABLE IF EXISTS `tblelternconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblelternconfig` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldsollstd` int(11) NOT NULL,
  `fldbez` varchar(250) COLLATE utf8_bin NOT NULL,
  `fldvondatum` date NOT NULL,
  `fldbisdatum` date NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblelternstunden`
--

DROP TABLE IF EXISTS `tblelternstunden`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblelternstunden` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `flddatum` date NOT NULL,
  `fldbez` varchar(250) COLLATE utf8_bin NOT NULL,
  `fldstunden` decimal(10,1) NOT NULL,
  `fldarchivdat` date NOT NULL DEFAULT '1900-01-01',
  `fldAnwender` varchar(20) COLLATE utf8_bin NOT NULL,
  `fldRang` varchar(2) COLLATE utf8_bin NOT NULL DEFAULT '00',
  `fldid_kitajahr` bigint(20) NOT NULL,
  `fldid_kitauser` bigint(20) NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=MyISAM AUTO_INCREMENT=344 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblerl_dauer`
--

DROP TABLE IF EXISTS `tblerl_dauer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblerl_dauer` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldbez` varchar(250) COLLATE utf8_bin NOT NULL,
  `fldprior` int(11) NOT NULL,
  `flddatum` date NOT NULL,
  `fldstatus` varchar(10) COLLATE utf8_bin NOT NULL,
  `fldGruppe` varchar(200) COLLATE utf8_bin NOT NULL,
  `fldcategory` varchar(200) COLLATE utf8_bin NOT NULL,
  `fldbenutzer` varchar(20) COLLATE utf8_bin NOT NULL,
  `fldmonat` int(11) NOT NULL,
  `fldkorrektur` int(11) NOT NULL DEFAULT '0',
  `fldzeitraum` varchar(10) COLLATE utf8_bin NOT NULL,
  `fldaktiv` varchar(1) COLLATE utf8_bin NOT NULL DEFAULT 'N',
  PRIMARY KEY (`fldindex`)
) ENGINE=MyISAM AUTO_INCREMENT=54 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblerledigung`
--

DROP TABLE IF EXISTS `tblerledigung`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblerledigung` (
  `fldIndex` bigint(3) unsigned NOT NULL AUTO_INCREMENT,
  `fldDetailInd` int(11) NOT NULL,
  `fldRang` varchar(2) NOT NULL,
  `fldBezeichnung` varchar(100) NOT NULL,
  `fldStatus` varchar(10) NOT NULL,
  `fldBenutzer` varchar(20) NOT NULL,
  `fldDatum` date NOT NULL,
  `fldErledigDat` varchar(10) NOT NULL,
  `fldArchivDat` varchar(10) NOT NULL,
  `fldbemerkung` varchar(250) NOT NULL,
  `fldtimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fldArt` varchar(20) NOT NULL,
  `fldPrior` int(11) NOT NULL,
  `fldGruppe` varchar(200) NOT NULL,
  `fldurl` varchar(255) NOT NULL,
  `fldcategory` varchar(200) NOT NULL,
  PRIMARY KEY (`fldIndex`)
) ENGINE=MyISAM AUTO_INCREMENT=2534 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblessensplan`
--

DROP TABLE IF EXISTS `tblessensplan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblessensplan` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `flddatum` date NOT NULL,
  `fldbez` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `fldid_rezepte` bigint(20) NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=MyISAM AUTO_INCREMENT=244 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbletagen`
--

DROP TABLE IF EXISTS `tbletagen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbletagen` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldbez` varchar(250) COLLATE utf8_bin NOT NULL,
  `fldbildid` bigint(20) NOT NULL,
  `fldwidth` int(11) NOT NULL,
  `fldheight` int(11) NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblfahrtenbuch`
--

DROP TABLE IF EXISTS `tblfahrtenbuch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblfahrtenbuch` (
  `fldIndex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldFahrzeug` varchar(50) COLLATE utf8_bin NOT NULL,
  `fldVondatum` date NOT NULL,
  `fldBisdatum` date NOT NULL,
  `fldVonkm` int(11) NOT NULL,
  `fldBiskm` int(11) NOT NULL,
  `fldDauer` varchar(5) COLLATE utf8_bin NOT NULL,
  `fldZeittarif` varchar(10) COLLATE utf8_bin NOT NULL,
  `fldStatus` varchar(10) COLLATE utf8_bin NOT NULL,
  `fldind_datum` bigint(20) NOT NULL,
  `fldid_adr` bigint(20) NOT NULL,
  PRIMARY KEY (`fldIndex`)
) ENGINE=MyISAM AUTO_INCREMENT=574 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblfilter`
--

DROP TABLE IF EXISTS `tblfilter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblfilter` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldfeld` varchar(80) COLLATE utf8_bin NOT NULL,
  `fldwert` varchar(80) COLLATE utf8_bin NOT NULL,
  `fldmaske` varchar(80) COLLATE utf8_bin NOT NULL,
  `fldName` varchar(80) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=MyISAM AUTO_INCREMENT=22754 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblfunc`
--

DROP TABLE IF EXISTS `tblfunc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblfunc` (
  `fldIndex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldBez` varchar(250) COLLATE utf8_bin NOT NULL,
  `fldphp` varchar(80) COLLATE utf8_bin NOT NULL,
  `fldMenuID` bigint(20) NOT NULL,
  `fldTyp` varchar(10) COLLATE utf8_bin NOT NULL,
  `fldTarget` varchar(50) COLLATE utf8_bin NOT NULL,
  `fldParam` varchar(100) COLLATE utf8_bin NOT NULL,
  `fldAktiv` varchar(5) COLLATE utf8_bin NOT NULL,
  `fldName` varchar(200) COLLATE utf8_bin NOT NULL,
  `fldtimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fldid_version` bigint(20) NOT NULL,
  `fldversion` varchar(5) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldIndex`)
) ENGINE=MyISAM AUTO_INCREMENT=444 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblgeburtstage`
--

DROP TABLE IF EXISTS `tblgeburtstage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblgeburtstage` (
  `fldIndex` int(3) NOT NULL AUTO_INCREMENT,
  `fldVorname` varchar(30) NOT NULL,
  `fldNachname` varchar(30) NOT NULL,
  `fldGebDatum` date NOT NULL,
  `fldSort` varchar(5) NOT NULL,
  `fldBemerk` varchar(80) NOT NULL,
  PRIMARY KEY (`fldIndex`)
) ENGINE=MyISAM AUTO_INCREMENT=74 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblgepaeck`
--

DROP TABLE IF EXISTS `tblgepaeck`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblgepaeck` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldbez` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=MyISAM AUTO_INCREMENT=134 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblgeraet`
--

DROP TABLE IF EXISTS `tblgeraet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblgeraet` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldbez` varchar(255) COLLATE utf8_bin NOT NULL,
  `fldgeraetenr` varchar(10) COLLATE utf8_bin NOT NULL,
  `fldfaktor` varchar(10) COLLATE utf8_bin NOT NULL,
  `fldid_wo` bigint(20) NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=InnoDB AUTO_INCREMENT=134 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblgeschenke`
--

DROP TABLE IF EXISTS `tblgeschenke`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblgeschenke` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `flddatum` datetime NOT NULL,
  `fldbez` varchar(250) COLLATE utf8_bin NOT NULL,
  `fldstatus` varchar(20) COLLATE utf8_bin NOT NULL,
  `fldpreis` decimal(10,2) NOT NULL,
  `flduser` varchar(50) COLLATE utf8_bin NOT NULL,
  `fldbeschenkter` varchar(50) COLLATE utf8_bin NOT NULL,
  `fldlink` varchar(250) COLLATE utf8_bin NOT NULL,
  `fldanlass` varchar(250) COLLATE utf8_bin NOT NULL,
  `fldprior` int(11) NOT NULL,
  `fldvon` varchar(50) COLLATE utf8_bin NOT NULL,
  `fldimage` varchar(250) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=MyISAM AUTO_INCREMENT=574 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblgrperl`
--

DROP TABLE IF EXISTS `tblgrperl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblgrperl` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldbez` varchar(200) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=MyISAM AUTO_INCREMENT=174 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblgrundartikel`
--

DROP TABLE IF EXISTS `tblgrundartikel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblgrundartikel` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldbez` varchar(250) COLLATE utf8_bin NOT NULL,
  `fldbezmz` varchar(250) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=MyISAM AUTO_INCREMENT=114 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblgrundeinheit`
--

DROP TABLE IF EXISTS `tblgrundeinheit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblgrundeinheit` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldkurz` varchar(50) COLLATE utf8_bin NOT NULL,
  `fldbez` varchar(200) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblheizung`
--

DROP TABLE IF EXISTS `tblheizung`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblheizung` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldbez` varchar(250) COLLATE utf8_bin NOT NULL,
  `fldid_ort` bigint(20) NOT NULL,
  `fldPreis` varchar(10) COLLATE utf8_bin NOT NULL,
  `fldAnz` varchar(10) COLLATE utf8_bin NOT NULL,
  `fldGespreis` varchar(10) COLLATE utf8_bin NOT NULL,
  `fldAbrjahr` year(4) NOT NULL,
  `fldArchivDat` varchar(10) COLLATE utf8_bin NOT NULL,
  `fldgeraetenr` varchar(10) COLLATE utf8_bin NOT NULL,
  `fldid_geraet` bigint(20) NOT NULL,
  `fldAbleseDat` date NOT NULL,
  `fldok` varchar(5) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=InnoDB AUTO_INCREMENT=364 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbljahr`
--

DROP TABLE IF EXISTS `tbljahr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbljahr` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldjahr` year(4) NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblkategorie`
--

DROP TABLE IF EXISTS `tblkategorie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblkategorie` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldbez` varchar(100) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblkitajahr`
--

DROP TABLE IF EXISTS `tblkitajahr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblkitajahr` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldbez` varchar(250) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblktoEATyp`
--

DROP TABLE IF EXISTS `tblktoEATyp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblktoEATyp` (
  `fldIndex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldBez` varchar(250) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldIndex`)
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblktoart`
--

DROP TABLE IF EXISTS `tblktoart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblktoart` (
  `fldIndex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldBez` varchar(200) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldIndex`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblktobanken`
--

DROP TABLE IF EXISTS `tblktobanken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblktobanken` (
  `fldIndex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldBez` varchar(50) NOT NULL,
  `fldArt` varchar(20) NOT NULL,
  `fldcalc` varchar(4) NOT NULL,
  `fldaktiv` varchar(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`fldIndex`)
) ENGINE=InnoDB AUTO_INCREMENT=154 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblktogrp_liste`
--

DROP TABLE IF EXISTS `tblktogrp_liste`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblktogrp_liste` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldbez` varchar(250) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblktogrpzuord`
--

DROP TABLE IF EXISTS `tblktogrpzuord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblktogrpzuord` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldid_kto` bigint(20) NOT NULL,
  `fldid_ktogrp` bigint(20) NOT NULL,
  `fldid_oberkonto` bigint(20) NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblktoinhgrp_liste`
--

DROP TABLE IF EXISTS `tblktoinhgrp_liste`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblktoinhgrp_liste` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldbez` varchar(250) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblktoinhgrpzuord`
--

DROP TABLE IF EXISTS `tblktoinhgrpzuord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblktoinhgrpzuord` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldid_ktoinhaber` bigint(20) NOT NULL,
  `fldid_ktoinhgrp` bigint(20) NOT NULL,
  `fldinhaber` varchar(50) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblktokonten`
--

DROP TABLE IF EXISTS `tblktokonten`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblktokonten` (
  `fldIndex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldKurz` varchar(20) NOT NULL,
  `fldBez` varchar(100) NOT NULL,
  `fldTyp` varchar(10) NOT NULL,
  `fldid_oberkonto` bigint(20) NOT NULL,
  `fldfarbe` varchar(7) NOT NULL,
  PRIMARY KEY (`fldIndex`)
) ENGINE=InnoDB AUTO_INCREMENT=474 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblktooberkonten`
--

DROP TABLE IF EXISTS `tblktooberkonten`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblktooberkonten` (
  `fldIndex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldKurz` varchar(100) COLLATE utf8_bin NOT NULL,
  `fldBez` varchar(100) COLLATE utf8_bin NOT NULL,
  `fldTyp` varchar(50) COLLATE utf8_bin NOT NULL,
  `fldid_ktogrp` bigint(20) NOT NULL,
  PRIMARY KEY (`fldIndex`)
) ENGINE=MyISAM AUTO_INCREMENT=124 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblktosal`
--

DROP TABLE IF EXISTS `tblktosal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblktosal` (
  `fldIndex` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `fldDetailind` bigint(20) NOT NULL DEFAULT '0',
  `fldDatum` date NOT NULL,
  `fldUhrzeit` time NOT NULL,
  `fldPos` int(3) NOT NULL,
  `fldBez` varchar(250) NOT NULL,
  `fldArt` varchar(1) NOT NULL,
  `fldKonto` varchar(20) NOT NULL,
  `fldBetrag` decimal(10,2) NOT NULL,
  `fldInhaber` char(20) NOT NULL,
  `fldKtoart` varchar(3) NOT NULL,
  `fldFix` decimal(10,2) NOT NULL,
  `fldorgdatum` date NOT NULL,
  `fldfremdbetrag` decimal(10,2) NOT NULL,
  `fldwaehrung` varchar(10) NOT NULL,
  `fldUmbuchInhaber` varchar(20) NOT NULL,
  `fldsel` varchar(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`fldIndex`)
) ENGINE=MyISAM AUTO_INCREMENT=36574 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblktosal_old`
--

DROP TABLE IF EXISTS `tblktosal_old`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblktosal_old` (
  `fldIndex` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `fldDetailind` bigint(20) NOT NULL DEFAULT '0',
  `fldDatum` date NOT NULL,
  `fldUhrzeit` time NOT NULL,
  `fldPos` int(3) NOT NULL,
  `fldBez` varchar(250) NOT NULL,
  `fldArt` varchar(1) NOT NULL,
  `fldKonto` varchar(20) NOT NULL,
  `fldBetrag` decimal(10,2) NOT NULL,
  `fldInhaber` char(20) NOT NULL,
  `fldKtoart` varchar(3) NOT NULL,
  `fldFix` decimal(10,2) NOT NULL,
  `fldorgdatum` date NOT NULL,
  `fldfremdbetrag` decimal(10,2) NOT NULL,
  `fldwaehrung` varchar(10) NOT NULL,
  `fldUmbuchInhaber` varchar(20) NOT NULL,
  `fldsel` varchar(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`fldIndex`)
) ENGINE=MyISAM AUTO_INCREMENT=35714 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblktotyp`
--

DROP TABLE IF EXISTS `tblktotyp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblktotyp` (
  `fldIndex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldTyp` varchar(50) COLLATE utf8_bin NOT NULL,
  `fldBez` varchar(200) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldIndex`)
) ENGINE=MyISAM AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblktozuord`
--

DROP TABLE IF EXISTS `tblktozuord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblktozuord` (
  `fldIndex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldKurz` varchar(20) COLLATE utf8_bin NOT NULL,
  `fldSuch` varchar(250) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldIndex`)
) ENGINE=MyISAM AUTO_INCREMENT=424 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbllanguage`
--

DROP TABLE IF EXISTS `tbllanguage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbllanguage` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldkurz` varchar(4) COLLATE utf8_bin NOT NULL,
  `fldbez` varchar(250) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblmengein`
--

DROP TABLE IF EXISTS `tblmengein`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblmengein` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldkurz` varchar(50) COLLATE utf8_bin NOT NULL,
  `fldbez` varchar(200) COLLATE utf8_bin NOT NULL,
  `fldid_grundeinheit` bigint(20) NOT NULL,
  `fldcalc` varchar(1) COLLATE utf8_bin NOT NULL,
  `fldfaktor` varchar(10) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=MyISAM AUTO_INCREMENT=64 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblmenu_liste`
--

DROP TABLE IF EXISTS `tblmenu_liste`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblmenu_liste` (
  `fldIndex` double NOT NULL AUTO_INCREMENT,
  `fldMenu` varchar(250) COLLATE utf8_bin NOT NULL,
  `fldtblwebadr` char(250) CHARACTER SET latin1 DEFAULT NULL,
  `fldSort` char(5) CHARACTER SET latin1 DEFAULT NULL,
  `fldGroup` char(20) CHARACTER SET latin1 DEFAULT NULL,
  `fldview` varchar(1) CHARACTER SET latin1 NOT NULL DEFAULT 'J',
  `fldid_modul` int(11) NOT NULL,
  `fldparent` varchar(250) COLLATE utf8_bin NOT NULL,
  `fldversion` varchar(5) COLLATE utf8_bin NOT NULL DEFAULT '0303',
  `fldTyp` varchar(50) COLLATE utf8_bin NOT NULL,
  `fldName` varchar(200) COLLATE utf8_bin NOT NULL,
  `fldtimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fldid_publictyp` bigint(20) NOT NULL,
  PRIMARY KEY (`fldIndex`)
) ENGINE=MyISAM AUTO_INCREMENT=1434 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblmenu_modul`
--

DROP TABLE IF EXISTS `tblmenu_modul`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblmenu_modul` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldbez` varchar(250) COLLATE utf8_bin NOT NULL,
  `fldwebadr` varchar(250) COLLATE utf8_bin NOT NULL,
  `fldlang` varchar(4) COLLATE utf8_bin NOT NULL,
  `fldversion` varchar(5) COLLATE utf8_bin NOT NULL,
  `fldtimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fldsource` varchar(2048) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=MyISAM AUTO_INCREMENT=1244 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblmenu_typ`
--

DROP TABLE IF EXISTS `tblmenu_typ`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblmenu_typ` (
  `fldIndex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldBez` varchar(50) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldIndex`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblorte`
--

DROP TABLE IF EXISTS `tblorte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblorte` (
  `fldIndex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldKurz` varchar(30) CHARACTER SET latin1 NOT NULL,
  `fldBez` varchar(100) CHARACTER SET latin1 NOT NULL,
  `fldo01typ` text CHARACTER SET latin1 NOT NULL,
  `fldo01pos` int(11) NOT NULL,
  `fldo01parent` bigint(20) NOT NULL,
  `fldzimmer` varchar(100) COLLATE utf8_bin NOT NULL,
  `fldmoebel` varchar(100) COLLATE utf8_bin NOT NULL,
  `fldetage` varchar(20) COLLATE utf8_bin NOT NULL,
  `fldsort` varchar(20) COLLATE utf8_bin NOT NULL,
  `fldstatus` varchar(10) COLLATE utf8_bin NOT NULL,
  `fldproz` int(11) NOT NULL DEFAULT '0',
  `fldind_zimmer` bigint(20) NOT NULL,
  `fldind_moebel` bigint(20) NOT NULL,
  `fldbildid` bigint(20) NOT NULL,
  `fldnummer` varchar(20) COLLATE utf8_bin NOT NULL,
  `fldmaxanz` int(11) NOT NULL,
  `fldid_etagen` bigint(20) NOT NULL,
  `fldid_benutzer` bigint(20) NOT NULL,
  `fldprior` int(11) NOT NULL DEFAULT '0',
  `fldid_status` bigint(20) NOT NULL,
  PRIMARY KEY (`fldIndex`)
) ENGINE=MyISAM AUTO_INCREMENT=1164 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblorttyp`
--

DROP TABLE IF EXISTS `tblorttyp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblorttyp` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldbez` varchar(20) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblpoll_antworten`
--

DROP TABLE IF EXISTS `tblpoll_antworten`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblpoll_antworten` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldbez` varchar(255) COLLATE utf8_bin NOT NULL,
  `fldanz` mediumint(9) NOT NULL,
  `fldid_umfrage` bigint(20) NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblpoll_umfragen`
--

DROP TABLE IF EXISTS `tblpoll_umfragen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblpoll_umfragen` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldkurz` varchar(20) COLLATE utf8_bin NOT NULL,
  `fldbez` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblprgtyp`
--

DROP TABLE IF EXISTS `tblprgtyp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblprgtyp` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldbez` varchar(250) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblprgupdate`
--

DROP TABLE IF EXISTS `tblprgupdate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblprgupdate` (
  `fldIndex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldBez` varchar(500) COLLATE utf8_bin NOT NULL,
  `fldVersion` varchar(10) COLLATE utf8_bin NOT NULL,
  `fldStatus` varchar(20) COLLATE utf8_bin NOT NULL,
  `fldLang` varchar(5) COLLATE utf8_bin NOT NULL,
  `fldModul` varchar(100) COLLATE utf8_bin NOT NULL,
  `fldDatum` date NOT NULL,
  `fldErldatum` date NOT NULL,
  `fldBemerkung` varchar(250) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldIndex`)
) ENGINE=MyISAM AUTO_INCREMENT=524 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblprior`
--

DROP TABLE IF EXISTS `tblprior`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblprior` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldprior` int(11) NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=MyISAM AUTO_INCREMENT=54 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblpublictyp`
--

DROP TABLE IF EXISTS `tblpublictyp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblpublictyp` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldbez` varchar(250) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblrechdat`
--

DROP TABLE IF EXISTS `tblrechdat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblrechdat` (
  `fldIndex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldBez` varchar(200) COLLATE utf8_bin NOT NULL,
  `fldLink` varchar(250) COLLATE utf8_bin NOT NULL,
  `fldBemerkung` varchar(250) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldIndex`)
) ENGINE=MyISAM AUTO_INCREMENT=114 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblrechnungen`
--

DROP TABLE IF EXISTS `tblrechnungen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblrechnungen` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldbez` varchar(250) COLLATE utf8_bin NOT NULL,
  `flddatum` date NOT NULL,
  `fldfilename` varchar(250) COLLATE utf8_bin NOT NULL,
  `fldid_adr` bigint(20) NOT NULL,
  `fldbetrag` decimal(10,2) NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=InnoDB AUTO_INCREMENT=174 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblreisegrp`
--

DROP TABLE IF EXISTS `tblreisegrp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblreisegrp` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldbez` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=MyISAM AUTO_INCREMENT=94 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblresyncalltyp`
--

DROP TABLE IF EXISTS `tblresyncalltyp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblresyncalltyp` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldbez` varchar(250) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblrezepte`
--

DROP TABLE IF EXISTS `tblrezepte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblrezepte` (
  `fldIndex` int(11) NOT NULL AUTO_INCREMENT,
  `fldBez` varchar(250) COLLATE utf8_bin NOT NULL,
  `fldLink` varchar(250) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldIndex`)
) ENGINE=MyISAM AUTO_INCREMENT=54 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblsel`
--

DROP TABLE IF EXISTS `tblsel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblsel` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldbez` varchar(1) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblsettrigger`
--

DROP TABLE IF EXISTS `tblsettrigger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblsettrigger` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldbez` varchar(10) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblstamm_typ`
--

DROP TABLE IF EXISTS `tblstamm_typ`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblstamm_typ` (
  `fldIndex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldBez` varchar(200) COLLATE utf8_bin NOT NULL,
  `fldTyp` varchar(20) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldIndex`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblstat_grp`
--

DROP TABLE IF EXISTS `tblstat_grp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblstat_grp` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldbezgrp` varchar(250) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblstat_zuord`
--

DROP TABLE IF EXISTS `tblstat_zuord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblstat_zuord` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldid_grp` bigint(20) NOT NULL,
  `fldid_status` bigint(20) NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=InnoDB AUTO_INCREMENT=174 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblstatus`
--

DROP TABLE IF EXISTS `tblstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblstatus` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldbez` varchar(20) COLLATE utf8_bin NOT NULL,
  `fldtyp` varchar(10) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=MyISAM AUTO_INCREMENT=114 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblstundenplan`
--

DROP TABLE IF EXISTS `tblstundenplan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblstundenplan` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `flddatum` date NOT NULL,
  `fldvonuhrzeit` time NOT NULL,
  `fldbisuhrzeit` time NOT NULL,
  `fldbez` varchar(250) COLLATE utf8_bin NOT NULL,
  `fldid_status` bigint(20) NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblsynctyp`
--

DROP TABLE IF EXISTS `tblsynctyp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblsynctyp` (
  `fldIndex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldBez` varchar(100) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldIndex`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbltabletten`
--

DROP TABLE IF EXISTS `tbltabletten`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbltabletten` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldbez` varchar(250) COLLATE utf8_bin NOT NULL,
  `fldvondatum` date NOT NULL,
  `fldanztage` int(11) NOT NULL,
  `fldbisdatum` date NOT NULL,
  `fldAnztab` int(11) NOT NULL,
  `fldDosierung` decimal(10,2) NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbltc_gepaeck`
--

DROP TABLE IF EXISTS `tbltc_gepaeck`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbltc_gepaeck` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldbez` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbltc_grund`
--

DROP TABLE IF EXISTS `tbltc_grund`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbltc_grund` (
  `fldIndex` int(11) NOT NULL AUTO_INCREMENT,
  `fldBez` varchar(250) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldIndex`)
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbltc_kosten`
--

DROP TABLE IF EXISTS `tbltc_kosten`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbltc_kosten` (
  `fldIndex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldid_reise` bigint(20) NOT NULL,
  `fldBez` varchar(250) COLLATE utf8_bin NOT NULL,
  `fldPreis` decimal(18,2) NOT NULL,
  `fldLink` varchar(250) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldIndex`)
) ENGINE=MyISAM AUTO_INCREMENT=64 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbltc_liste`
--

DROP TABLE IF EXISTS `tbltc_liste`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbltc_liste` (
  `fldIndex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldBez` varchar(250) COLLATE utf8_bin NOT NULL,
  `fldVondatum` date NOT NULL,
  `fldBisdatum` date NOT NULL,
  `fldid_grund` bigint(20) NOT NULL,
  PRIMARY KEY (`fldIndex`)
) ENGINE=MyISAM AUTO_INCREMENT=64 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbltc_reiseliste`
--

DROP TABLE IF EXISTS `tbltc_reiseliste`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbltc_reiseliste` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldAnz` decimal(10,0) NOT NULL,
  `fldbez` varchar(255) COLLATE utf8_bin NOT NULL,
  `fldgepaeck` varchar(50) COLLATE utf8_bin NOT NULL,
  `fldreisegrp` varchar(100) COLLATE utf8_bin NOT NULL,
  `fldstatus` varchar(20) COLLATE utf8_bin NOT NULL,
  `fldid_benutzer` bigint(20) NOT NULL,
  `fldid_gepaeck` bigint(20) NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=MyISAM AUTO_INCREMENT=2014 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbltc_status`
--

DROP TABLE IF EXISTS `tbltc_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbltc_status` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldbez` varchar(20) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=MyISAM AUTO_INCREMENT=54 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbltermine_liste`
--

DROP TABLE IF EXISTS `tbltermine_liste`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbltermine_liste` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldbez` varchar(250) COLLATE utf8_bin NOT NULL,
  `fldvondatum` date NOT NULL,
  `fldvonuhrzeit` time NOT NULL,
  `fldbisdatum` date NOT NULL,
  `fldbisuhrzeit` time NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=InnoDB AUTO_INCREMENT=344 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbltranslate`
--

DROP TABLE IF EXISTS `tbltranslate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbltranslate` (
  `fldIndex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldLang` varchar(5) COLLATE utf8_bin NOT NULL,
  `fldBez` varchar(250) COLLATE utf8_bin NOT NULL,
  `fldName` varchar(200) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldIndex`)
) ENGINE=MyISAM AUTO_INCREMENT=134 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbltrigger`
--

DROP TABLE IF EXISTS `tbltrigger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbltrigger` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldbez` varchar(100) COLLATE utf8_bin NOT NULL,
  `fldid_computer` bigint(20) NOT NULL,
  `fldsettrigger` varchar(1) COLLATE utf8_bin NOT NULL,
  `fldtxttrigger` varchar(4096) COLLATE utf8_bin NOT NULL,
  `fldAnz` int(11) NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=InnoDB AUTO_INCREMENT=20494 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbluserrotate`
--

DROP TABLE IF EXISTS `tbluserrotate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbluserrotate` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldid_vonuser` bigint(20) NOT NULL,
  `fldid_nachuser` bigint(20) NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblverbesserung`
--

DROP TABLE IF EXISTS `tblverbesserung`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblverbesserung` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `flddatum` datetime NOT NULL,
  `flduser` varchar(50) COLLATE utf8_bin NOT NULL,
  `fldbez` varchar(512) COLLATE utf8_bin NOT NULL,
  `fldvorschlag` varchar(250) COLLATE utf8_bin NOT NULL,
  `fldloesung` varchar(250) COLLATE utf8_bin NOT NULL,
  `fldstatus` varchar(20) COLLATE utf8_bin NOT NULL,
  `flddsstatus` varchar(20) COLLATE utf8_bin NOT NULL DEFAULT 'NEW',
  `fldprior` tinyint(4) NOT NULL DEFAULT '0',
  `flderldat` date NOT NULL DEFAULT '1900-01-01',
  `fldarchivdat` date NOT NULL DEFAULT '1900-01-01',
  `flddelete` varchar(1) COLLATE utf8_bin NOT NULL DEFAULT 'N',
  PRIMARY KEY (`fldindex`)
) ENGINE=MyISAM AUTO_INCREMENT=144 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblverpack`
--

DROP TABLE IF EXISTS `tblverpack`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblverpack` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldbez` varchar(250) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblversion`
--

DROP TABLE IF EXISTS `tblversion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblversion` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldbez` varchar(250) COLLATE utf8_bin NOT NULL,
  `fldkurz` varchar(5) COLLATE utf8_bin NOT NULL,
  `flddatum` date NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblvo_category`
--

DROP TABLE IF EXISTS `tblvo_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblvo_category` (
  `fldIndex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldBez` varchar(250) COLLATE utf8_bin NOT NULL,
  `fldSort` varchar(20) COLLATE utf8_bin NOT NULL,
  `fldProz` int(11) NOT NULL,
  `fldid_obercat` bigint(20) NOT NULL,
  PRIMARY KEY (`fldIndex`)
) ENGINE=MyISAM AUTO_INCREMENT=224 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblvo_obercategory`
--

DROP TABLE IF EXISTS `tblvo_obercategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblvo_obercategory` (
  `fldIndex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldBez` varchar(250) COLLATE utf8_bin NOT NULL,
  `fldSort` varchar(20) COLLATE utf8_bin NOT NULL,
  `fldProz` int(11) NOT NULL,
  PRIMARY KEY (`fldIndex`)
) ENGINE=MyISAM AUTO_INCREMENT=64 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblvo_usercategory`
--

DROP TABLE IF EXISTS `tblvo_usercategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblvo_usercategory` (
  `fldIndex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldid_user` bigint(20) NOT NULL,
  `fldid_category` bigint(20) NOT NULL,
  `fldProz` int(11) NOT NULL,
  `fldid_zimmer` bigint(20) NOT NULL,
  PRIMARY KEY (`fldIndex`)
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblvorrat`
--

DROP TABLE IF EXISTS `tblvorrat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblvorrat` (
  `fldv01index` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldv01bez` varchar(200) CHARACTER SET latin1 NOT NULL,
  `fldv01ort` bigint(20) NOT NULL DEFAULT '1',
  `fldv01wo` bigint(20) NOT NULL,
  `fldv01fach` bigint(20) NOT NULL,
  `fldv01barcode` text CHARACTER SET latin1 NOT NULL,
  `fldv01menge` decimal(11,3) NOT NULL,
  `fldv01me` text CHARACTER SET latin1 NOT NULL,
  `fldv01anzahl` int(11) NOT NULL,
  `fldv01anzme` text CHARACTER SET latin1 NOT NULL,
  `fldv01haltbar` date NOT NULL,
  `fldv01verpack` text CHARACTER SET latin1 NOT NULL,
  `fldv01erfassdat` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fldv01konto` bigint(20) NOT NULL,
  `fldv01bild` bigint(20) NOT NULL,
  `fldv01bemerk` varchar(200) COLLATE utf8_bin NOT NULL,
  `fldv01gekauftam` date NOT NULL,
  `fldv01status` varchar(20) COLLATE utf8_bin NOT NULL,
  `fldid_me` bigint(20) NOT NULL,
  `fldid_grundartikel` bigint(20) NOT NULL,
  `fldmindestmenge` int(11) NOT NULL,
  PRIMARY KEY (`fldv01index`)
) ENGINE=MyISAM AUTO_INCREMENT=354 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblvorschlaege`
--

DROP TABLE IF EXISTS `tblvorschlaege`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblvorschlaege` (
  `fldIndex` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `fldBez` char(80) DEFAULT '0',
  `fldBenutzer` char(20) DEFAULT NULL,
  `fldDatum` char(16) DEFAULT NULL,
  `fldStatus` char(10) DEFAULT 'Neu',
  PRIMARY KEY (`fldIndex`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblwaehrungen`
--

DROP TABLE IF EXISTS `tblwaehrungen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblwaehrungen` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldwaehrung` varchar(10) COLLATE utf8_bin NOT NULL,
  `fldbez` varchar(250) COLLATE utf8_bin NOT NULL,
  `fldkurs` decimal(10,2) NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblwunschliste`
--

DROP TABLE IF EXISTS `tblwunschliste`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblwunschliste` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldbez` varchar(250) COLLATE utf8_bin NOT NULL,
  `fldlink` varchar(250) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=MyISAM AUTO_INCREMENT=64 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblzeitpunkt`
--

DROP TABLE IF EXISTS `tblzeitpunkt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblzeitpunkt` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldbez` varchar(100) COLLATE utf8_bin NOT NULL,
  `fldvonuhrzeit` time NOT NULL,
  `fldbisuhrzeit` time NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblzeitraum`
--

DROP TABLE IF EXISTS `tblzeitraum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblzeitraum` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldbez` varchar(10) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblzutaten`
--

DROP TABLE IF EXISTS `tblzutaten`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblzutaten` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldid_rezepte` bigint(20) NOT NULL,
  `fldid_grundartikel` bigint(20) NOT NULL,
  `fldmenge` varchar(50) COLLATE utf8_bin NOT NULL,
  `fldid_me` bigint(20) NOT NULL,
  `fldbez` varchar(250) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=MyISAM AUTO_INCREMENT=54 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblzwieart`
--

DROP TABLE IF EXISTS `tblzwieart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblzwieart` (
  `fldart` varchar(20) COLLATE utf8_bin NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblzwiegespraech`
--

DROP TABLE IF EXISTS `tblzwiegespraech`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblzwiegespraech` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `flddatum` datetime NOT NULL,
  `fldbez` varchar(500) COLLATE utf8_bin NOT NULL,
  `fldarchivdat` date NOT NULL,
  `fldstatus` varchar(20) COLLATE utf8_bin NOT NULL,
  `fldart` varchar(20) COLLATE utf8_bin NOT NULL,
  `fldbenutzer` varchar(20) COLLATE utf8_bin NOT NULL,
  `fldid_gruppe` bigint(20) NOT NULL,
  `fldlink` varchar(250) COLLATE utf8_bin NOT NULL,
  `fldTarget` varchar(20) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=MyISAM AUTO_INCREMENT=464 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `viewktoinhgrp`
--

DROP TABLE IF EXISTS `viewktoinhgrp`;
/*!50001 DROP VIEW IF EXISTS `viewktoinhgrp`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `viewktoinhgrp` (
  `fldid` tinyint NOT NULL,
  `fldbez` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `viewstatuszimmer`
--

DROP TABLE IF EXISTS `viewstatuszimmer`;
/*!50001 DROP VIEW IF EXISTS `viewstatuszimmer`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `viewstatuszimmer` (
  `fldindex` tinyint NOT NULL,
  `fldbez` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `viewktoinhgrp`
--

/*!50001 DROP TABLE IF EXISTS `viewktoinhgrp`*/;
/*!50001 DROP VIEW IF EXISTS `viewktoinhgrp`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `viewktoinhgrp` AS select `zuord`.`fldid_ktoinhaber` AS `fldid`,`kto`.`fldBez` AS `fldbez` from ((`tblktobanken` `kto` join `tblktoinhgrp_liste` `grp`) join `tblktoinhgrpzuord` `zuord`) where ((`kto`.`fldIndex` = `zuord`.`fldid_ktoinhaber`) and (`grp`.`fldindex` = `zuord`.`fldid_ktoinhgrp`) and (`grp`.`fldindex` = 13)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `viewstatuszimmer`
--

/*!50001 DROP TABLE IF EXISTS `viewstatuszimmer`*/;
/*!50001 DROP VIEW IF EXISTS `viewstatuszimmer`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `viewstatuszimmer` AS select `stat`.`fldindex` AS `fldindex`,`stat`.`fldbez` AS `fldbez` from ((`tblstatus` `stat` join `tblstat_grp` `grp`) join `tblstat_zuord` `zuord`) where ((`stat`.`fldindex` = `zuord`.`fldid_status`) and (`grp`.`fldindex` = `zuord`.`fldid_grp`) and (`grp`.`fldindex` = 43)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-02-07 18:27:58
-- MySQL dump 10.13  Distrib 5.5.35, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: dbWebportal
-- ------------------------------------------------------
-- Server version	5.5.35-0ubuntu0.12.04.2-log

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
-- Dumping data for table `tblmenu_liste`
--

LOCK TABLES `tblmenu_liste` WRITE;
/*!40000 ALTER TABLE `tblmenu_liste` DISABLE KEYS */;
INSERT INTO `tblmenu_liste` VALUES (183,'Einkaufsliste','','00010','MAIN','J',173,'0','0303','MODUL','','0000-00-00 00:00:00',0),(193,'Administration','','00100','MAIN','J',133,'0','0303','','','0000-00-00 00:00:00',0),(203,'Geschenke','','00006',NULL,'J',183,'893','0303','MODUL','GIFT','0000-00-00 00:00:00',0),(213,'Konto','','00003',NULL,'J',153,'903','0303','MODUL','ACCOUNT','0000-00-00 00:00:00',0),(223,'Geburtstage','','00006',NULL,'J',193,'893','0303','MODUL','','0000-00-00 00:00:00',0),(233,'Erledigungen','','00002',NULL,'J',143,'903','0303','MODUL','TASK','0000-00-00 00:00:00',0),(243,'Notizen','','00003',NULL,'J',163,'0','0303','MODUL','NOTICE','0000-00-00 00:00:00',0),(393,'Prior',NULL,'',NULL,'J',303,'233','0303','','','0000-00-00 00:00:00',0),(263,'Adressliste','','00008',NULL,'J',203,'0','0303','','','0000-00-00 00:00:00',0),(283,'Status',NULL,'00013',NULL,'J',273,'233','0303','MODUL','','0000-00-00 00:00:00',0),(293,'Vorrat',NULL,'00004',NULL,'J',243,'903','0303','MODUL','','0000-00-00 00:00:00',0),(303,'Checkliste',NULL,'00005',NULL,'N',253,'0','0303','','','0000-00-00 00:00:00',0),(313,'Docman',NULL,'00006',NULL,'J',263,'0','0303','MODUL','','0000-00-00 00:00:00',0),(323,'Elternstunden',NULL,'00009',NULL,'J',233,'893','0303','MODUL','','0000-00-00 00:00:00',0),(333,'Home','','00001',NULL,'J',213,'0','0303','MODUL','','0000-00-00 00:00:00',0),(343,'Verbesserung',NULL,'00011',NULL,'N',223,'0','0303','','','0000-00-00 00:00:00',0),(353,'Essensplan',NULL,'00012',NULL,'N',223,'0','0303','','','0000-00-00 00:00:00',0),(363,'Fahrtenbuch',NULL,'00013',NULL,'J',283,'903','0303','MODUL','','0000-00-00 00:00:00',0),(373,'Kaufort',NULL,'00014',NULL,'J',293,'183','0303','','','0000-00-00 00:00:00',0),(383,'Status',NULL,'',NULL,'J',273,'183','0303','MODUL','','0000-00-00 00:00:00',0),(403,'Benutzer',NULL,'',NULL,'J',323,'233','0303','MODUL','USER','0000-00-00 00:00:00',0),(413,'Kategorie',NULL,'',NULL,'J',313,'233','0303','','','0000-00-00 00:00:00',0),(423,'Terminkalender',NULL,'00015',NULL,'N',333,'0','0303','PLUGIN','','0000-00-00 00:00:00',0),(433,'Stammdaten',NULL,'',NULL,'J',343,'183','0303','MODUL','','0000-00-00 00:00:00',0),(443,'Kontengruppe',NULL,'',NULL,'J',363,'213','0303','MODUL','','0000-00-00 00:00:00',0),(453,'Module',NULL,'',NULL,'J',353,'193','0303','MODUL','','0000-00-00 00:00:00',0),(463,'Konten',NULL,'',NULL,'J',373,'213','0303','MODUL','','0000-00-00 00:00:00',0),(473,'Kontensuchkrit','','',NULL,'J',383,'213','0303','MODUL','','0000-00-00 00:00:00',3),(483,'Computer',NULL,'',NULL,'J',393,'193','0303','MODUL','','0000-00-00 00:00:00',0),(493,'dbsync',NULL,'',NULL,'J',403,'193','0303','MODUL','','0000-00-00 00:00:00',0),(503,'Trigger',NULL,'',NULL,'J',413,'193','0303','MODUL','','0000-00-00 00:00:00',0),(933,'Heizung',NULL,'',NULL,'J',803,'903','0303','MODUL','','0000-00-00 00:00:00',0),(523,'Prgupdate','','00090',NULL,'J',433,'0','0303','MODUL','','0000-00-00 00:00:00',0),(533,'Funktionen','','',NULL,'J',443,'193','0303','MODUL','','0000-00-00 00:00:00',0),(543,'Oberkonten',NULL,'',NULL,'J',453,'213','0303','MODUL','','0000-00-00 00:00:00',0),(553,'Abteilungen',NULL,'',NULL,'J',463,'183','0303','MODUL','','0000-00-00 00:00:00',0),(563,'Adressgruppe',NULL,'',NULL,'J',473,'263','0303','MODUL','','0000-00-00 00:00:00',0),(573,'Kontenart',NULL,'',NULL,'J',483,'183','0303','MODUL','','0000-00-00 00:00:00',0),(583,'Adresszuordnung',NULL,'',NULL,'J',493,'263','0303','MODUL','','0000-00-00 00:00:00',0),(613,'Reiseliste','','00016',NULL,'J',513,'893','0303','MODUL','','0000-00-00 00:00:00',3),(603,'Bilder',NULL,'',NULL,'J',503,'293','0303','MODUL','','0000-00-00 00:00:00',0),(623,'Reisegrund',NULL,'',NULL,'J',523,'613','0303','MODUL','','0000-00-00 00:00:00',0),(633,'Gepaeckliste',NULL,'',NULL,'J',533,'613','0303','MODUL','','0000-00-00 00:00:00',0),(643,'Gepaeckstueck',NULL,'',NULL,'J',543,'613','0303','MODUL','','0000-00-00 00:00:00',0),(653,'Briefverkehr',NULL,'',NULL,'J',553,'313','0303','MODUL','','0000-00-00 00:00:00',0),(663,'Zimmer',NULL,'',NULL,'J',563,'293','0303','MODUL','','0000-00-00 00:00:00',0),(673,'Moebel',NULL,'',NULL,'J',573,'293','0303','MODUL','','0000-00-00 00:00:00',0),(683,'Faecher',NULL,'',NULL,'J',583,'293','0303','MODUL','','0000-00-00 00:00:00',0),(693,'RechDatum',NULL,'',NULL,'J',593,'363','0303','MODUL','','0000-00-00 00:00:00',0),(703,'Wiki','','00091',NULL,'J',613,'0','0303','MODUL','','0000-00-00 00:00:00',13),(713,'Sprache',NULL,'',NULL,'J',603,'193','0303','MODUL','','0000-00-00 00:00:00',0),(723,'Dauerauftrag',NULL,'',NULL,'J',623,'233','0303','MODUL','','0000-00-00 00:00:00',0),(733,'Kontotyp',NULL,'',NULL,'J',633,'213','0303','MODUL','','0000-00-00 00:00:00',0),(743,'Essensplan',NULL,'00010',NULL,'J',693,'0','0303','MODUL','','0000-00-00 00:00:00',0),(753,'Rezepte',NULL,'',NULL,'J',703,'743','0303','MODUL','','0000-00-00 00:00:00',0),(763,'Gruppe',NULL,'',NULL,'J',423,'243','0303','MODUL','','0000-00-00 00:00:00',0),(773,'Menutyp',NULL,'',NULL,'J',643,'193','0303','MODUL','','0000-00-00 00:00:00',0),(783,'Oberkategorie',NULL,'',NULL,'J',653,'293','0303','MODUL','','0000-00-00 00:00:00',0),(793,'Kategorie',NULL,'',NULL,'J',663,'293','0303','MODUL','','0000-00-00 00:00:00',0),(803,'Userkategory',NULL,'',NULL,'J',673,'293','0303','MODUL','','0000-00-00 00:00:00',0),(823,'Grundeinheit',NULL,'',NULL,'J',713,'293','0303','MODUL','','0000-00-00 00:00:00',0),(833,'Mengeneinheit',NULL,'',NULL,'J',723,'293','0303','MODUL','','0000-00-00 00:00:00',0),(843,'Zutaten',NULL,'',NULL,'J',733,'743','0303','MODUL','','0000-00-00 00:00:00',0),(853,'Grundartikel',NULL,'',NULL,'J',743,'293','0303','MODUL','','0000-00-00 00:00:00',0),(863,'Treegrid',NULL,'',NULL,'J',753,'313','0303','MODUL','','0000-00-00 00:00:00',0),(873,'Beschenkte',NULL,'',NULL,'J',763,'203','0303','MODUL','','0000-00-00 00:00:00',0),(893,'Familie',NULL,'00003',NULL,'J',773,'0','0303','MODUL','','0000-00-00 00:00:00',0),(903,'Privat',NULL,'00002',NULL,'J',783,'0','0303','MODUL','','0000-00-00 00:00:00',0),(913,'Reisekosten',NULL,'',NULL,'J',793,'613','0303','MODUL','','0000-00-00 00:00:00',0),(923,'Gruppe',NULL,'',NULL,'J',423,'233','0303','MODUL','','0000-00-00 00:00:00',0),(943,'Barcode',NULL,'',NULL,'J',813,'183','0303','MODUL','','2013-07-26 05:28:25',0),(953,'Update erzeugen',NULL,'',NULL,'J',823,'193','0303','MODUL','','2013-08-16 17:29:24',0),(1043,'Prgtyp','','',NULL,'J',873,'523','0308','MODUL','','2013-08-30 14:39:59',0),(973,'Termine','','00009',NULL,'J',843,'0','0307','MODUL','DATES','2013-08-27 17:43:06',0),(1053,'Rechnungen','','',NULL,'J',883,'313','0308','MODUL','','2013-08-30 18:32:18',0),(983,'Kalender','classes/calendar.php','',NULL,'J',853,'973','0308','WEBLINK','','2013-08-28 05:16:58',0),(1023,'Versionen','','',NULL,'J',863,'193','0308','MODUL','','2013-08-30 14:11:32',0),(1013,'Google Cal','','',NULL,'J',833,'973','0307','PLUGIN','','2013-08-28 05:25:26',13),(1063,'Konten&uumlbersicht','','',NULL,'J',893,'213','0308','MODUL','','2013-09-04 15:16:04',0),(1073,'Stammdatentyp','','',NULL,'J',903,'433','0308','MODUL','','2013-09-07 19:17:52',0),(1083,'synctyp','','',NULL,'J',913,'493','0308','MODUL','','2013-09-10 05:09:01',0),(1093,'dbsync-Remote','','',NULL,'J',923,'493','0308','MODUL','','2013-09-11 05:09:27',13),(1103,'Funktionen-Remote','','',NULL,'J',933,'533','0308','MODUL','','2013-09-11 18:28:13',13),(1113,'Erledigung-Remote','','',NULL,'J',943,'233','0308','MODUL','TASK','2013-09-11 19:21:20',13),(1123,'Publictyp','','',NULL,'J',953,'193','0309','MODUL','','2013-10-06 13:54:41',0),(1133,'Prgstatus','','',NULL,'J',273,'523','0309','MODUL','','2013-10-06 14:09:51',3),(1143,'Statusgruppe','','',NULL,'J',963,'1133','0309','MODUL','','2013-10-06 14:19:22',3),(1153,'Blutdruck','','',NULL,'J',973,'903','0309','MODUL','','2013-10-25 13:19:31',3),(1163,'Zeitpunkt','','',NULL,'J',983,'1153','0309','MODUL','','2013-10-25 13:30:58',3),(1173,'Kitajahr','','',NULL,'J',993,'323','0309','MODUL','','2013-10-25 19:43:55',3),(1183,'Kind','','',NULL,'J',1003,'323','0309','MODUL','','2013-10-25 20:17:50',3),(1193,'Stundenplan','','',NULL,'J',1013,'973','0309','MODUL','','2013-10-26 06:40:45',3),(1203,'Jahr','','',NULL,'J',1023,'933','0310','MODUL','','2013-11-09 22:43:35',3),(1213,'Ger&aumlte','','',NULL,'J',1033,'933','0310','MODUL','','2013-12-01 14:45:04',3),(1223,'Importtyp','','',NULL,'J',1043,'213','0310','MODUL','','2013-12-05 06:21:06',3),(1233,'Kontengruppe','','',NULL,'J',1053,'543','0310','MODUL','','2013-12-12 06:23:22',3),(1243,'Kontenzuordnung','','',NULL,'J',1063,'543','0310','MODUL','','2013-12-12 06:41:00',3),(1253,'Umfragen','','',NULL,'J',1073,'903','0310','MODUL','','2013-12-12 21:53:52',3),(1263,'Antworten','','',NULL,'J',1083,'1253','0310','MODUL','','2013-12-12 22:02:21',3),(1273,'Login','','',NULL,'J',1093,'1263','0310','MODUL','','2013-12-13 16:58:26',3),(1283,'Install erzeugen','','',NULL,'J',1103,'193','0310','MODUL','','2013-12-17 17:43:38',3),(1293,'Abmelden','','',NULL,'J',1113,'1263','0310','MODUL','','2013-12-20 21:15:17',3),(1303,'Etagen','','',NULL,'J',1123,'293','0310','MODUL','','2014-01-02 20:06:04',3),(1313,'Inhabergruppe','','',NULL,'J',1133,'443','0310','MODUL','','2014-01-07 07:14:46',3),(1323,'Inhaberzuord','','',NULL,'J',1143,'443','0310','MODUL','','2014-01-07 07:23:08',3),(1333,'Tabletten','','',NULL,'J',1153,'903','0310','MODUL','','2014-01-08 07:11:50',3),(1343,'Mysqldumper','','',NULL,'J',1163,'193','0310','MODUL','','2014-01-08 17:09:50',3),(1353,'Begehung','http://localhost/tools/sweethome3dviewer/index_walk.html','',NULL,'J',73,'663','0310','WEBLINK','','2014-01-10 17:28:51',3),(1363,'Luftbild','http://localhost/tools/sweethome3dviewer/index_air.html','',NULL,'J',73,'663','0310','WEBLINK','','2014-01-10 18:09:00',3),(1373,'Settrigger','','',NULL,'J',1173,'503','0310','MODUL','','2014-01-13 07:50:34',3),(1383,'Resyncalltyp','','',NULL,'J',1183,'193','0310','MODUL','','2014-01-13 17:01:32',3),(1403,'Aufgabenplan','','',NULL,'J',1203,'893','0310','MODUL','','2014-01-15 06:26:47',3),(1413,'Benutzerwechsel','','',NULL,'J',1223,'1403','0310','MODUL','','2014-01-16 21:29:33',3),(1423,'Bildverz','','',NULL,'J',1233,'903','0310','MODUL','','2014-01-27 06:35:18',3),(309,'Raum','','',NULL,'J',309,'933','0309','MODUL','','2014-02-06 17:44:49',3);
/*!40000 ALTER TABLE `tblmenu_liste` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-02-07 18:27:58
-- MySQL dump 10.13  Distrib 5.5.35, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: dbWebportal
-- ------------------------------------------------------
-- Server version	5.5.35-0ubuntu0.12.04.2-log

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
-- Dumping data for table `tblmenu_modul`
--

LOCK TABLES `tblmenu_modul` WRITE;
/*!40000 ALTER TABLE `tblmenu_modul` DISABLE KEYS */;
INSERT INTO `tblmenu_modul` VALUES (73,'Adressliste','sites/views/wp_adress/index.php','de','0302','0000-00-00 00:00:00',''),(63,'Geburtstage','sites/views/wp_birthday/index.php','de','0302','0000-00-00 00:00:00',''),(53,'Geschenkliste','sites/views/wp_present/index.php','de','0302','0000-00-00 00:00:00',''),(43,'Einkaufsliste','sites/views/wp_shopping/index.php','de','0302','0000-00-00 00:00:00',''),(33,'Notizen','sites/views/wp_notice/index.php','de','0302','0000-00-00 00:00:00',''),(23,'Konto','sites/views/wp_account/index.php','de','0302','0000-00-00 00:00:00',''),(13,'Erledigungen','sites/views/wp_tasks/index.php','de','0302','0000-00-00 00:00:00',''),(3,'Administration','admin/index.php','de','0302','0000-00-00 00:00:00',''),(83,'Home','welcome.php','de','0302','0000-00-00 00:00:00',''),(93,'Dummy','sites/views/wp_dummy/index.php','de','0302','0000-00-00 00:00:00',''),(113,'Elternstunden','sites/views/wp_parenthours/index.php','de','0302','0000-00-00 00:00:00',''),(123,'Vorrat','classes/showtab.php?menu=stock','de','0302','0000-00-00 00:00:00',''),(133,'Administration','classes/showtab.php?menu=admin','de','0303','0000-00-00 00:00:00',''),(143,'Erledigungen','classes/showtab.php?menu=tasks','de','0303','0000-00-00 00:00:00',''),(153,'Konto','classes/showtab.php?menu=account','de','0303','0000-00-00 00:00:00',''),(163,'Notizen','classes/showtab.php?menu=notice','de','0303','0000-00-00 00:00:00',''),(173,'Einkaufsliste','classes/showtab.php?menu=shopping','de','0303','0000-00-00 00:00:00',''),(183,'Geschenkliste','classes/showtab.php?menu=present','de','0303','0000-00-00 00:00:00',''),(193,'Geburtstage','classes/showtab.php?menu=birthday','de','0303','0000-00-00 00:00:00',''),(203,'Adressliste','classes/showtab.php?menu=address','de','0303','0000-00-00 00:00:00',''),(213,'Home','welcome.php','de','0303','0000-00-00 00:00:00',''),(223,'Dummy','classes/showtab.php?menu=dummy','de','0303','0000-00-00 00:00:00',''),(233,'Elternstunden','classes/showtab.php?menu=hours','de','0303','0000-00-00 00:00:00',''),(243,'Vorrat','classes/showtab.php?menu=stock','de','0303','0000-00-00 00:00:00',''),(253,'Checkliste','classes/showtab.php?menu=checklist','de','0303','0000-00-00 00:00:00',''),(263,'Docman','classes/showtab.php?menu=docman','de','0303','0000-00-00 00:00:00',''),(273,'Status','classes/showtab.php?menu=status','de','0303','0000-00-00 00:00:00',''),(283,'Fahrtenbuch','classes/showtab.php?menu=drive','de','0303','0000-00-00 00:00:00',''),(293,'Kaufort','classes/showtab.php?menu=station','de','0303','0000-00-00 00:00:00',''),(303,'Prior','classes/showtab.php?menu=prior','de','0303','0000-00-00 00:00:00',''),(313,'Kategoire','classes/showtab.php?menu=category','de','0303','0000-00-00 00:00:00',''),(323,'User','classes/showtab.php?menu=user','de','0303','0000-00-00 00:00:00',''),(333,'Terminkalender','http://localhost/luxcal/','de','0303','0000-00-00 00:00:00',''),(343,'Stammdaten','classes/showtab.php?menu=stamm','de','0303','0000-00-00 00:00:00',''),(353,'Modul','classes/showtab.php?menu=modul','de','0303','0000-00-00 00:00:00',''),(363,'Kontengruppe','classes/showtab.php?menu=kontengruppe','de','0303','0000-00-00 00:00:00',''),(373,'Konten','classes/showtab.php?menu=konten','de','0303','0000-00-00 00:00:00',''),(383,'Kontozuordnung','classes/showtab.php?menu=ktozuord','de','0303','0000-00-00 00:00:00',''),(393,'Computer','classes/showtab.php?menu=computer','de','0303','0000-00-00 00:00:00',''),(403,'dbsync','classes/showtab.php?menu=dbsync','de','0303','0000-00-00 00:00:00',''),(413,'Trigger','classes/showtab.php?menu=trigger','de','0308','0000-00-00 00:00:00',''),(423,'Erledigungsgruppe','classes/showtab.php?menu=erlgrp','de','0303','0000-00-00 00:00:00',''),(433,'Programmupdate','classes/showtab.php?menu=prgupdate','de','0303','0000-00-00 00:00:00',''),(443,'Funktion','classes/showtab.php?menu=func','de','0303','0000-00-00 00:00:00',''),(453,'Oberkonten','classes/showtab.php?menu=upperaccount','de','0303','0000-00-00 00:00:00',''),(463,'Abteilungen','classes/showtab.php?menu=abteilung','de','0303','0000-00-00 00:00:00',''),(473,'Adressgruppe','classes/showtab.php?menu=adrgrp','de','0303','0000-00-00 00:00:00',''),(483,'Kontenart','classes/showtab.php?menu=ktoart','de','0303','0000-00-00 00:00:00',''),(493,'Adresszuordnung','classes/showtab.php?menu=adrzuordnung','de','0303','0000-00-00 00:00:00',''),(503,'Bilder','classes/showtab.php?menu=images','de','0303','0000-00-00 00:00:00',''),(513,'Reise','classes/showtab.php?menu=travel','de','0303','0000-00-00 00:00:00',''),(523,'Reisegrund','classes/showtab.php?menu=tc_reason','de','0303','0000-00-00 00:00:00',''),(533,'GepÃ¤ckliste','classes/showtab.php?menu=tc_gepaeck','de','0303','0000-00-00 00:00:00',''),(543,'Gepaeckstueck','classes/showtab.php?menu=tc_gepaeckstueck','de','0303','0000-00-00 00:00:00',''),(553,'Briefverkehr','classes/showtab.php?menu=brfverkehr','de','0303','0000-00-00 00:00:00',''),(563,'Zimmer','classes/showtab.php?menu=rooms','de','0303','0000-00-00 00:00:00',''),(573,'MÃ¶bel','classes/showtab.php?menu=moebel','de','0303','0000-00-00 00:00:00',''),(583,'Faecher','classes/showtab.php?menu=faecher','de','0303','0000-00-00 00:00:00',''),(593,'RechDatum','classes/showtab.php?menu=rechdat','de','0303','0000-00-00 00:00:00',''),(603,'Sprache','classes/showtab.php?menu=translate','de','0303','0000-00-00 00:00:00',''),(613,'Wiki','http://localhost/mediawiki/index.php','de','0309','0000-00-00 00:00:00',''),(623,'Dauerauftrag','classes/showtab.php?menu=dauerauftrag','de','0303','0000-00-00 00:00:00',''),(633,'ktoeatyp','classes/showtab.php?menu=ktoeatyp','de','0303','0000-00-00 00:00:00',''),(643,'Menutyp','classes/showtab.php?menu=menutyp','de','0303','0000-00-00 00:00:00',''),(653,'Kategorie (AufrÃ¤umen)','classes/showtab.php?menu=vo_category','de','0303','0000-00-00 00:00:00',''),(663,'Unterkategorie','classes/showtab.php?menu=undercategory','de','0303','0000-00-00 00:00:00',''),(673,'Userkategory','classes/showtab.php?menu=usercategory','de','0303','0000-00-00 00:00:00',''),(693,'Essensplan','classes/showtab.php?menu=essensplan','de','0303','0000-00-00 00:00:00',''),(703,'Rezepte','classes/showtab.php?menu=rezepte','de','0303','0000-00-00 00:00:00',''),(713,'Grundeinheit','classes/showtab.php?menu=grundeinheit','de','0303','0000-00-00 00:00:00',''),(723,'Mengeneinheit','classes/showtab.php?menu=mengein','de','0303','0000-00-00 00:00:00',''),(733,'Zutaten','classes/showtab.php?menu=zutaten','de','0303','0000-00-00 00:00:00',''),(743,'Grundartikel','classes/showtab.php?menu=grundartikel','de','0303','0000-00-00 00:00:00',''),(753,'treegrid','classes/showtab.php?menu=treegrid','de','0303','0000-00-00 00:00:00',''),(763,'Beschenkte','classes/showtab.php?menu=beschenkte','de','0303','0000-00-00 00:00:00',''),(773,'Familie','sites/html/family.php?menu=family','de','0303','0000-00-00 00:00:00',''),(783,'Privat','sites/html/privat.php?menu=privat','de','0303','0000-00-00 00:00:00',''),(793,'Reisekosten','classes/showtab.php?menu=reisekosten','de','0303','0000-00-00 00:00:00',''),(803,'Heizung','classes/showtab.php?menu=heizung','de','0303','0000-00-00 00:00:00',''),(813,'Barcode','classes/showtab.php?menu=barcode','de','0303','2013-07-26 05:27:46',''),(823,'Update erzeugen','classes/updateerzeugen.php?idwert=953','de','0309','2013-08-16 17:30:25',''),(833,'gcal','classes/plugin/google/calendar.php?menu=gcal','de','0307','2013-08-27 17:38:10','<iframe src=\"https://www.google.com/calendar/embed?height=500&amp;wkst=1&amp;bgcolor=%23FFFFFF&amp;src=meh8bg5v4qo65dfl4v6as701fs%40group.calendar.google.com&amp;color=%23B1365F&amp;src=7lie3jn3a26mct92vlnifu0mmo%40group.calendar.google.com&amp;color=%2328754E&amp;src=bu0hs6s4bkprpkr24bqt113fbo%40group.calendar.google.com&amp;color=%235229A3&amp;src=de.german%23holiday%40group.v.calendar.google.com&amp;color=%23875509&amp;ctz=Europe%2FBerlin\" style=\" border-width:0 \" width=\"800\" height=\"500\" frameborder=\"0\" scrolling=\"no\"></iframe>'),(843,'Termine','classes/showtab.php?menu=termine','de','0307','2013-08-28 05:34:10',''),(853,'(ohne)','','de','0308','2013-08-29 05:25:44',''),(863,'Version','classes/showtab.php?menu=version','de','0308','2013-08-30 14:10:16',''),(873,'Prgtyp','classes/showtab.php?menu=prgtyp','de','0308','2013-08-30 14:36:59',''),(883,'Rechnung','classes/showtab.php?menu=rechnung','de','0308','2013-08-30 18:31:41',''),(893,'KontenÃ¼bersicht','classes/overviewaccount.php','de','0308','2013-09-04 15:15:19',''),(903,'Stammdatentyp','classes/showtab.php?menu=stammtyp','de','0308','2013-09-07 19:16:56',''),(913,'synctyp','classes/showtab.php?menu=synctyp','de','0308','2013-09-10 05:07:44',''),(923,'dbsync-Remote','classes/showtab.php?menu=dbsyncremote','de','0308','2013-09-11 05:07:57',''),(933,'Funktion-Remote','classes/showtab.php?menu=funcremote','de','0308','2013-09-11 18:27:21',''),(943,'Erledigung-Remote','classes/showtab.php?menu=tasksremote','de','0308','2013-09-11 19:20:29',''),(953,'Publictyp','classes/showtab.php?menu=publictyp','de','0309','2013-10-06 13:55:44',''),(963,'Statusgruppe','classes/showtab.php?menu=statusgrp','de','0309','2013-10-06 14:16:53',''),(973,'Blutdruck','classes/showtab.php?menu=blutdruck','de','0309','2013-10-25 13:18:25',''),(983,'Zeitpunkt','classes/showtab.php?menu=zeitpunkt','de','0309','2013-10-25 13:30:00',''),(993,'Kitajahr','classes/showtab.php?menu=kitajahr','de','0309','2013-10-25 19:41:06',''),(1003,'Kitauser','classes/showtab.php?menu=kitauser','de','0309','2013-10-25 20:17:05',''),(1013,'Stundenplan','classes/showtab.php?menu=stundenplan','de','0309','2013-10-26 06:37:41',''),(1023,'Jahr','classes/showtab.php?menu=jahr','de','0310','2013-11-09 22:41:49',''),(1033,'GerÃ¤te','classes/showtab.php?menu=geraet','de','0310','2013-12-01 14:44:10',''),(1043,'Kontotyp','classes/showtab.php?menu=ktotyp','de','0310','2013-12-05 06:20:02',''),(1053,'Kontengruppe','classes/showtab.php?menu=ktogrp','de','0310','2013-12-12 06:21:57',''),(1063,'Kontenzuordnung','classes/showtab.php?menu=ktogrpzuord','de','0310','2013-12-12 06:40:07',''),(1073,'Umfragen','classes/showtab.php?menu=poll_umfragen','de','0310','2013-12-12 21:52:40',''),(1083,'Antworten','classes/showtab.php?menu=poll_antworten','de','0310','2013-12-12 22:01:40',''),(1093,'Login','includes/SimpleMember/inc/login.php','de','0310','2013-12-13 16:57:46',''),(1103,'Installerzeugen','classes/installerzeugen.php','de','0310','2013-12-17 17:43:04',''),(1113,'logout','includes/SimpleMember/logout.php','de','0310','2013-12-20 21:14:13',''),(1123,'Etagen','classes/showtab.php?menu=etagen','de','0310','2014-01-02 20:05:25',''),(1133,'Kontoinhabergruppe','classes/showtab.php?menu=ktoinhgrp','de','0310','2014-01-07 07:13:58',''),(1143,'Inhaberzuord','classes/showtab.php?menu=ktoinhgrpzuord','de','0310','2014-01-07 07:22:26',''),(1153,'Tabletten','classes/showtab.php?menu=tabletten','de','0310','2014-01-08 07:10:01',''),(1163,'Mysqldumper','http://localhost/mysqldumper','de','0310','2014-01-08 17:07:55',''),(1173,'Settrigger','classes/showtab.php?menu=settrigger','de','0310','2014-01-13 07:49:52',''),(1183,'Resyncalltyp','classes/showtab.php?menu=resyncalltyp','de','0310','2014-01-13 17:00:56',''),(1203,'Aufgabenplan','classes/showtab.php?menu=aufgabenplan','de','0310','2014-01-15 06:23:50',''),(1223,'Benutzerwechsel','classes/showtab.php?menu=userrotate','de','0310','2014-01-16 21:28:47',''),(1233,'Bildverz','classes/showtab.php?menu=bildverz','de','0310','2014-01-27 06:33:43',''),(309,'Raum','classes/showtab.php?menu=raum','de','0309','2014-02-06 17:43:40','');
/*!40000 ALTER TABLE `tblmenu_modul` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-02-07 18:27:58
-- MySQL dump 10.13  Distrib 5.5.35, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: dbWebportal
-- ------------------------------------------------------
-- Server version	5.5.35-0ubuntu0.12.04.2-log

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
-- Dumping data for table `tblmenu_typ`
--

LOCK TABLES `tblmenu_typ` WRITE;
/*!40000 ALTER TABLE `tblmenu_typ` DISABLE KEYS */;
INSERT INTO `tblmenu_typ` VALUES (3,'MODUL'),(13,'PLUGIN'),(23,'WEBLINK');
/*!40000 ALTER TABLE `tblmenu_typ` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-02-07 18:27:58
-- MySQL dump 10.13  Distrib 5.5.35, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: dbWebportal
-- ------------------------------------------------------
-- Server version	5.5.35-0ubuntu0.12.04.2-log

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
-- Dumping data for table `tblfunc`
--

LOCK TABLES `tblfunc` WRITE;
/*!40000 ALTER TABLE `tblfunc` DISABLE KEYS */;
INSERT INTO `tblfunc` VALUES (3,'Ins Archiv','insarchiv.php',183,'MENU','','','J','','0000-00-00 00:00:00',0,'0302'),(13,'Aus Stammdaten','ausstammdaten.php',183,'MENU','','','J','','0000-00-00 00:00:00',0,'0302'),(23,'Monatsbericht','monatsbericht.php',213,'MENU','_blank','&drucken=J','J','','0000-00-00 00:00:00',0,'0302'),(33,'Aus Archiv','ausarchiv.php',183,'MENU','','','J','','0000-00-00 00:00:00',0,'0302'),(43,'Auswertung','KontenVorschau.php',183,'MENU','_blank','','J','','0000-00-00 00:00:00',0,'0302'),(53,'Adressliste','druckadressliste.php',263,'MENU','_blank','&wert=','J','','0000-00-00 00:00:00',0,'0302'),(63,'Gruppenliste','druckgruppenliste.php',263,'MENU','_blank','&wert=','J','','0000-00-00 00:00:00',0,'0302'),(73,'sync','sync.php',183,'MENUALL','','','J','','0000-00-00 00:00:00',0,'0302'),(83,'resync all','resyncall.php',183,'MENUALL','','','J','','0000-00-00 00:00:00',0,'0302'),(93,'export','export.php',183,'MENUALL','','','J','','0000-00-00 00:00:00',0,'0302'),(103,'import','import.php',183,'MENUALL','','','J','','0000-00-00 00:00:00',0,'0302'),(113,'raten','raten.php',213,'MENU','','','J','','0000-00-00 00:00:00',0,'0302'),(133,'Dauerauftrag','dauerauftrag.php',233,'MENU','','','J','','0000-00-00 00:00:00',0,'0302'),(143,'Druck Essensplan','druckessensplan.php',743,'MENU','_blank','','J','','0000-00-00 00:00:00',0,'0302'),(153,'PrÃ¼f Vorrat','pruefvorrat.php',843,'MENU','','','J','','0000-00-00 00:00:00',0,'0302'),(163,'Druck Telefonliste','drucktelefonliste.php',263,'MENU','_blank','&wert=','J','','0000-00-00 00:00:00',0,'0302'),(173,'Druck Elternstunden','druckelternstunden.php',323,'MENU','_blank','&wert=','J','','0000-00-00 00:00:00',0,'0302'),(183,'Preis Ã¤ndern','fieldchange.php',933,'MENU','','&wert=','J','','2013-07-26 05:52:22',0,'0302'),(193,'Preisabgleich','preisabgleich.php',183,'MENU','','&wert=','J','','2013-08-02 18:53:48',0,'0302'),(203,'Trigger','trigger.php',503,'MENU','','&trigger=4','J','','2013-09-03 05:30:27',0,'0302'),(243,'Delete select','delsel.php',1093,'MENU','','&cloud=CloudBees','J','','2013-09-11 06:05:12',0,'0302'),(223,'Delete select','delsel.php',493,'MENU','','','J','','2013-09-10 05:16:54',0,'0302'),(253,'Delete select','delsel.php',653,'MENU','','','J','','2013-09-12 05:43:27',0,'0302'),(263,'get docs','getdocs.php',653,'MENU','','','J','','2013-09-12 16:02:42',63,'0308'),(273,'Reiseliste','druckreiseliste.php',633,'MENU','_blank','','J','','2013-09-21 21:39:41',63,'0308'),(283,'Gebdat als Termin','birthdaytotermin.php',223,'MENU','','','J','','2013-10-04 19:39:45',63,'0308'),(293,'druck Einkauf','druckeinkaufsliste.php',183,'MENU','_blank','','J','','2013-10-09 13:07:43',73,'0309'),(303,'Druck Geschenke','druckgeschenkliste.php',203,'MENU','_blank','&wert=','J','','2013-11-16 14:02:12',0,'0310'),(313,'Aus Archiv','ausarchiv.php',933,'MENU','','','J','','2013-12-01 14:06:26',0,'0310'),(323,'Ins Archiv','insarchiv.php',933,'MENU','','','J','','2013-12-01 14:13:54',0,'0310'),(333,'Druck Liste','druckliste.php',243,'MENU','_blank','','J','','2013-12-03 07:16:11',0,'0310'),(343,'Grafik','grafik.php',213,'MENU','_blank','','J','grafik','2013-12-10 06:13:48',0,'0310'),(353,'Umbuchung','umbuch.php',213,'MENU','','','J','','2013-12-10 17:09:15',0,'0310'),(363,'Delete select','delsel.php',213,'MENU','','','J','','2013-12-28 22:24:41',0,'0310'),(373,'Druck Liste','druckliste.php',1333,'MENU','_blank','','J','','2014-01-08 08:15:43',0,'0310'),(383,'Druck Aufgabenplan','druckessensplan.php',1403,'MENU','_blank','','J','','2014-01-15 06:41:18',0,'0310'),(393,'Aufgabenplan kopieren','schedulecopy.php',1403,'MENU','','','J','','2014-01-15 17:11:14',0,'0310'),(403,'Delete select','delsel.php',1403,'MENU','','','J','','2014-01-15 22:16:48',0,'0310'),(413,'Druck Liste','druckliste.php',1153,'MENU','_blank','','J','','2014-01-21 22:21:07',0,'0310'),(423,'Drucke Leer','druckleer.php',1153,'MENU','_blank','','J','','2014-01-31 07:13:03',0,'0310'),(433,'Drucke Leer','druckleer.php',933,'MENU','_blank','','J','','2014-01-31 17:06:24',0,'0310'),(443,'Druck Vergleich','druckvergleich.php',933,'MENU','_blank','','J','','2014-01-31 23:26:06',0,'0310');
/*!40000 ALTER TABLE `tblfunc` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-02-07 18:27:58
-- MySQL dump 10.13  Distrib 5.5.35, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: dbWebportal
-- ------------------------------------------------------
-- Server version	5.5.35-0ubuntu0.12.04.2-log

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
-- Dumping data for table `tblmengein`
--

LOCK TABLES `tblmengein` WRITE;
/*!40000 ALTER TABLE `tblmengein` DISABLE KEYS */;
INSERT INTO `tblmengein` VALUES (3,'Stck','StÃ¼ck',23,'',''),(13,'TL','TeelÃ¶ffel',3,'x','0.005'),(23,'x','x',23,'',''),(33,'EL','EÃŸlÃ¶ffel',3,'x','0.010'),(43,'g','gramm',3,'x','0.001'),(53,'Pk.','PÃ¤ckchen',23,'',''),(63,'m.-groÃŸe','mittelgroÃŸe',23,'','');
/*!40000 ALTER TABLE `tblmengein` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-02-07 18:27:58
-- MySQL dump 10.13  Distrib 5.5.35, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: dbWebportal
-- ------------------------------------------------------
-- Server version	5.5.35-0ubuntu0.12.04.2-log

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
-- Dumping data for table `tblstatus`
--

LOCK TABLES `tblstatus` WRITE;
/*!40000 ALTER TABLE `tblstatus` DISABLE KEYS */;
INSERT INTO `tblstatus` VALUES (2,'offen','NEW'),(3,'erledigt','LOG'),(4,'zurueckges',''),(6,'klaeren',''),(7,'in Arbeit',''),(8,'spaeter',''),(9,'Aufgabe',''),(13,'Problem',''),(23,'Themen',''),(33,'bald',''),(43,'verschickt',''),(53,'OK',''),(83,'fehlt',''),(93,'Bugs','BUG'),(103,'aufgerÃ¤umt',''),(113,'entrÃ¼mpelt','');
/*!40000 ALTER TABLE `tblstatus` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-02-07 18:27:58
-- MySQL dump 10.13  Distrib 5.5.35, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: dbWebportal
-- ------------------------------------------------------
-- Server version	5.5.35-0ubuntu0.12.04.2-log

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
-- Dumping data for table `tblversion`
--

LOCK TABLES `tblversion` WRITE;
/*!40000 ALTER TABLE `tblversion` DISABLE KEYS */;
INSERT INTO `tblversion` VALUES (3,'0.3.0.2 ','0302','2013-08-30'),(13,'0.3.0.3','0303','2013-08-30'),(23,'0.3.0.4','0304','2013-08-30'),(33,'0.3.0.5','0305','2013-08-30'),(43,'0.3.0.6','0306','2013-08-30'),(53,'0.3.0.7','0307','2013-08-30'),(63,'0.3.0.8 (alpha)','0308','2013-08-29'),(73,'0.3.0.9 (alpha)','0309','2013-10-06'),(83,'Vollversion','full','0000-00-00'),(93,'0.3.0.10 (alpha)','0310','2013-10-30');
/*!40000 ALTER TABLE `tblversion` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-02-07 18:27:58

INSERT INTO `jp_menu` (`id`, `menutype`, `title`, `alias`, `note`, `path`, `link`, `type`, `published`, `parent_id`, `level`, `component_id`, `checked_out`, `checked_out_time`, `browserNav`, `access`, `img`, `template_style_id`, `params`, `lft`, `rgt`, `home`, `language`, `client_id`) VALUES
(1, '', 'Menu_Item_Root', 'root', '', '', '', '', 1, 0, 0, 0, 0, '0000-00-00 00:00:00', 0, 0, '', 0, '', 0, 283, 0, '*', 0),
(2, 'menu', 'com_banners', 'Banners', '', 'Banners', 'index.php?option=com_banners', 'component', 0, 1, 1, 4, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners', 0, '', 1, 10, 0, '*', 1),
(3, 'menu', 'com_banners', 'Banners', '', 'Banners/Banners', 'index.php?option=com_banners', 'component', 0, 2, 2, 4, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners', 0, '', 2, 3, 0, '*', 1),
(4, 'menu', 'com_banners_categories', 'Categories', '', 'Banners/Categories', 'index.php?option=com_categories&extension=com_banners', 'component', 0, 2, 2, 6, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners-cat', 0, '', 4, 5, 0, '*', 1),
(5, 'menu', 'com_banners_clients', 'Clients', '', 'Banners/Clients', 'index.php?option=com_banners&view=clients', 'component', 0, 2, 2, 4, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners-clients', 0, '', 6, 7, 0, '*', 1),
(6, 'menu', 'com_banners_tracks', 'Tracks', '', 'Banners/Tracks', 'index.php?option=com_banners&view=tracks', 'component', 0, 2, 2, 4, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners-tracks', 0, '', 8, 9, 0, '*', 1),
(7, 'menu', 'com_contact', 'Contacts', '', 'Contacts', 'index.php?option=com_contact', 'component', 0, 1, 1, 8, 0, '0000-00-00 00:00:00', 0, 0, 'class:contact', 0, '', 205, 210, 0, '*', 1),
(8, 'menu', 'com_contact', 'Contacts', '', 'Contacts/Contacts', 'index.php?option=com_contact', 'component', 0, 7, 2, 8, 0, '0000-00-00 00:00:00', 0, 0, 'class:contact', 0, '', 206, 207, 0, '*', 1),
(9, 'menu', 'com_contact_categories', 'Categories', '', 'Contacts/Categories', 'index.php?option=com_categories&extension=com_contact', 'component', 0, 7, 2, 6, 0, '0000-00-00 00:00:00', 0, 0, 'class:contact-cat', 0, '', 208, 209, 0, '*', 1),
(10, 'menu', 'com_messages', 'Messaging', '', 'Messaging', 'index.php?option=com_messages', 'component', 0, 1, 1, 15, 0, '0000-00-00 00:00:00', 0, 0, 'class:messages', 0, '', 211, 216, 0, '*', 1),
(11, 'menu', 'com_messages_add', 'New Private Message', '', 'Messaging/New Private Message', 'index.php?option=com_messages&task=message.add', 'component', 0, 10, 2, 15, 0, '0000-00-00 00:00:00', 0, 0, 'class:messages-add', 0, '', 212, 213, 0, '*', 1),
(12, 'menu', 'com_messages_read', 'Read Private Message', '', 'Messaging/Read Private Message', 'index.php?option=com_messages', 'component', 0, 10, 2, 15, 0, '0000-00-00 00:00:00', 0, 0, 'class:messages-read', 0, '', 214, 215, 0, '*', 1),
(13, 'menu', 'com_newsfeeds', 'News Feeds', '', 'News Feeds', 'index.php?option=com_newsfeeds', 'component', 0, 1, 1, 17, 0, '0000-00-00 00:00:00', 0, 0, 'class:newsfeeds', 0, '', 217, 222, 0, '*', 1),
(14, 'menu', 'com_newsfeeds_feeds', 'Feeds', '', 'News Feeds/Feeds', 'index.php?option=com_newsfeeds', 'component', 0, 13, 2, 17, 0, '0000-00-00 00:00:00', 0, 0, 'class:newsfeeds', 0, '', 218, 219, 0, '*', 1),
(15, 'menu', 'com_newsfeeds_categories', 'Categories', '', 'News Feeds/Categories', 'index.php?option=com_categories&extension=com_newsfeeds', 'component', 0, 13, 2, 6, 0, '0000-00-00 00:00:00', 0, 0, 'class:newsfeeds-cat', 0, '', 220, 221, 0, '*', 1),
(16, 'menu', 'com_redirect', 'Redirect', '', 'Redirect', 'index.php?option=com_redirect', 'component', 0, 1, 1, 24, 0, '0000-00-00 00:00:00', 0, 0, 'class:redirect', 0, '', 223, 224, 0, '*', 1),
(17, 'menu', 'com_search', 'Basic Search', '', 'Basic Search', 'index.php?option=com_search', 'component', 0, 1, 1, 19, 0, '0000-00-00 00:00:00', 0, 0, 'class:search', 0, '', 227, 228, 0, '*', 1),
(18, 'menu', 'com_weblinks', 'Weblinks', '', 'Weblinks', 'index.php?option=com_weblinks', 'component', 0, 1, 1, 21, 0, '0000-00-00 00:00:00', 0, 0, 'class:weblinks', 0, '', 229, 234, 0, '*', 1),
(19, 'menu', 'com_weblinks_links', 'Links', '', 'Weblinks/Links', 'index.php?option=com_weblinks', 'component', 0, 18, 2, 21, 0, '0000-00-00 00:00:00', 0, 0, 'class:weblinks', 0, '', 230, 231, 0, '*', 1),
(20, 'menu', 'com_weblinks_categories', 'Categories', '', 'Weblinks/Categories', 'index.php?option=com_categories&extension=com_weblinks', 'component', 0, 18, 2, 6, 0, '0000-00-00 00:00:00', 0, 0, 'class:weblinks-cat', 0, '', 232, 233, 0, '*', 1),
(21, 'menu', 'com_finder', 'Smart Search', '', 'Smart Search', 'index.php?option=com_finder', 'component', 0, 1, 1, 27, 0, '0000-00-00 00:00:00', 0, 0, 'class:finder', 0, '', 235, 236, 0, '*', 1),
(22, 'menu', 'com_joomlaupdate', 'Joomla! Update', '', 'Joomla! Update', 'index.php?option=com_joomlaupdate', 'component', 0, 1, 1, 28, 0, '0000-00-00 00:00:00', 0, 0, 'class:joomlaupdate', 0, '', 237, 238, 0, '*', 1),
(23, 'main', 'com_tags', 'Tags', '', 'Tags', 'index.php?option=com_tags', 'component', 0, 1, 1, 29, 0, '0000-00-00 00:00:00', 0, 1, 'class:tags', 0, '', 239, 240, 0, '', 1),
(101, 'mainmenu', 'Home', 'home', '', 'home', 'index.php?option=com_content&view=featured', 'component', 1, 1, 1, 22, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"featured_categories":[""],"layout_type":"blog","num_leading_articles":"1","num_intro_articles":"3","num_columns":"3","num_links":"0","multi_column_order":"1","orderby_pri":"","orderby_sec":"front","order_date":"","show_pagination":"2","show_pagination_results":"1","show_title":"","link_titles":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_readmore":"","show_readmore_title":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","show_feed_link":"1","feed_summary":"","menu-anchor_title":"","menu-anchor_css":"meinmenu","menu_image":"","menu_text":1,"page_title":"","show_page_heading":1,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 11, 12, 1, '*', 0),
(103, 'mainmenu', 'Joomla-Admin', 'administration', '', 'admin/administration', 'http://localhost/jp/joorgportal30/administrator', 'url', 1, 883, 2, 0, 0, '0000-00-00 00:00:00', 1, 1, '', 0, '{"menu-anchor_title":"","menu-anchor_css":"meinmenu","menu_image":"","menu_text":1}', 254, 255, 0, '*', 0),
(113, 'mainmenu', 'Privat', 'privat', '', 'privat', 'index.php?option=com_content&view=article&id=3', 'component', 1, 1, 1, 22, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"","link_titles":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_tags":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"meinmenu","menu_image":"","menu_text":1,"page_title":"","show_page_heading":1,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 13, 106, 0, '*', 0),
(123, 'mainmenu', 'Heizung', 'heizung', '', 'privat/heizung', 'index.php?option=com_wrapper&view=wrapper', 'component', 1, 113, 2, 2, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"url":"http:\\/\\/localhost\\/jp\\/joorgportal30\\/classes\\/showtab.php?menu=heizung&idwert=933","scrolling":"auto","width":"100%","height":"700","height_auto":"0","add_scheme":"1","frameborder":"0","menu-anchor_title":"","menu-anchor_css":"meinmenu","menu_image":"images\\/joomtree\\/minus.jpg","menu_text":1,"page_title":"","show_page_heading":1,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 14, 21, 0, '*', 0),
(193, 'main', 'COM_SEXYPOLLING_MENU', 'com-sexypolling-menu', '', 'com-sexypolling-menu', 'index.php?option=com_sexypolling', 'component', 0, 1, 1, 723, 0, '0000-00-00 00:00:00', 0, 1, 'components/com_sexypolling/assets/images/project_16.png', 0, '', 241, 252, 0, '', 1),
(203, 'main', 'COM_SEXYPOLLING_SUBMENU_POLLS', 'com-sexypolling-submenu-polls', '', 'com-sexypolling-menu/com-sexypolling-submenu-polls', 'index.php?option=com_sexypolling&view=sexypolls', 'component', 0, 193, 2, 723, 0, '0000-00-00 00:00:00', 0, 1, 'components/com_sexypolling/assets/images/poll_16.png', 0, '', 242, 243, 0, '', 1),
(213, 'main', 'COM_SEXYPOLLING_SUBMENU_ANSWERS', 'com-sexypolling-submenu-answers', '', 'com-sexypolling-menu/com-sexypolling-submenu-answers', 'index.php?option=com_sexypolling&view=sexyanswers', 'component', 0, 193, 2, 723, 0, '0000-00-00 00:00:00', 0, 1, 'components/com_sexypolling/assets/images/answer_16.png', 0, '', 244, 245, 0, '', 1),
(223, 'main', 'COM_SEXYPOLLING_SUBMENU_CATEGORIES', 'com-sexypolling-submenu-categories', '', 'com-sexypolling-menu/com-sexypolling-submenu-categories', 'index.php?option=com_sexypolling&view=sexycategories', 'component', 0, 193, 2, 723, 0, '0000-00-00 00:00:00', 0, 1, 'components/com_sexypolling/assets/images/category_16.png', 0, '', 246, 247, 0, '', 1),
(233, 'main', 'COM_SEXYPOLLING_SUBMENU_TEMPLATES', 'com-sexypolling-submenu-templates', '', 'com-sexypolling-menu/com-sexypolling-submenu-templates', 'index.php?option=com_sexypolling&view=sexytemplates', 'component', 0, 193, 2, 723, 0, '0000-00-00 00:00:00', 0, 1, 'components/com_sexypolling/assets/images/template_16.png', 0, '', 248, 249, 0, '', 1),
(243, 'main', 'COM_SEXYPOLLING_SUBMENU_STATISTICS', 'com-sexypolling-submenu-statistics', '', 'com-sexypolling-menu/com-sexypolling-submenu-statistics', 'index.php?option=com_sexypolling&view=sexystatistics', 'component', 0, 193, 2, 723, 0, '0000-00-00 00:00:00', 0, 1, 'components/com_sexypolling/assets/images/statistics_16.png', 0, '', 250, 251, 0, '', 1),
(253, 'mainmenu', 'Themenauswahl', 'themenauswahl', '', 'privat/umfragen/themenauswahl', 'index.php?option=com_sexypolling&view=sexypoll&poll=1', 'component', 0, 373, 3, 723, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"menu-anchor_title":"","menu-anchor_css":"meinmenu","menu_image":"","menu_text":1,"page_title":"","show_page_heading":1,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 29, 30, 0, '*', 0),
(263, 'mainmenu', 'Familie', 'familie', '', 'familie', 'index.php?option=com_content&view=category&id=13', 'component', 1, 1, 1, 22, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_category_title":"","show_description":"","show_description_image":"","maxLevel":"","show_empty_categories":"","show_no_articles":"","show_category_heading_title":"","show_subcat_desc":"","show_cat_num_articles":"","show_tags":"","page_subheading":"","show_pagination_limit":"","filter_field":"","show_headings":"","list_show_date":"","date_format":"","list_show_hits":"","list_show_author":"","orderby_pri":"","orderby_sec":"","order_date":"","show_pagination":"","show_pagination_results":"","display_num":"10","show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_readmore":"","show_readmore_title":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","show_feed_link":"","feed_summary":"","menu-anchor_title":"","menu-anchor_css":"meinmenu","menu_image":"","menu_text":1,"page_title":"","show_page_heading":1,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 111, 142, 0, '*', 0),
(273, 'mainmenu', 'Reiseliste', 'reiseliste', '', 'familie/reiseliste', 'index.php?option=com_wrapper&view=wrapper', 'component', 1, 263, 2, 2, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"url":"http:\\/\\/localhost\\/jp\\/joorgportal30\\/classes\\/showtab.php?menu=travel","scrolling":"auto","width":"100%","height":"700","height_auto":"0","add_scheme":"1","frameborder":"0","menu-anchor_title":"","menu-anchor_css":"meinmenu","menu_image":"images\\/joomtree\\/minus.jpg","menu_text":1,"page_title":"","show_page_heading":1,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 132, 141, 0, '*', 0),
(283, 'mainmenu', 'Gepäckliste', 'gepaeckliste', '', 'familie/reiseliste/gepaeckliste', 'index.php?option=com_wrapper&view=wrapper', 'component', 1, 273, 3, 2, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"url":"http:\\/\\/localhost\\/jp\\/joorgportal30\\/classes\\/showtab.php?menu=tc_gepaeck","scrolling":"auto","width":"100%","height":"700","height_auto":"0","add_scheme":"1","frameborder":"0","menu-anchor_title":"","menu-anchor_css":"meinmenu","menu_image":"","menu_text":1,"page_title":"","show_page_heading":1,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 135, 136, 0, '*', 0),
(293, 'main', 'com_postinstall', 'Post-installation messages', '', 'Post-installation messages', 'index.php?option=com_postinstall', 'component', 0, 1, 1, 32, 0, '0000-00-00 00:00:00', 0, 1, 'class:postinstall', 0, '', 225, 226, 0, '*', 1),
(303, 'mainmenu', 'Notizen', 'notizen', '', 'notizen', 'index.php?option=com_wrapper&view=wrapper', 'component', 1, 1, 1, 2, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"url":"http:\\/\\/localhost\\/jp\\/joorgportal30\\/classes\\/showtab.php?menu=notice","scrolling":"auto","width":"100%","height":"700","height_auto":"0","add_scheme":"1","frameborder":"0","menu-anchor_title":"","menu-anchor_css":"meinmenu","menu_image":"","menu_text":1,"page_title":"","show_page_heading":1,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 107, 110, 0, '*', 0),
(313, 'mainmenu', 'Docman', 'docman', '', 'docman', 'index.php?option=com_wrapper&view=wrapper', 'component', 1, 1, 1, 2, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"url":"http:\\/\\/localhost\\/jp\\/joorgportal30\\/classes\\/showtab.php?menu=docman","scrolling":"auto","width":"100%","height":"700","height_auto":"0","add_scheme":"1","frameborder":"0","menu-anchor_title":"","menu-anchor_css":"meinmenu","menu_image":"","menu_text":1,"page_title":"","show_page_heading":1,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 143, 148, 0, '*', 0),
(323, 'mainmenu', 'Adressliste', 'adressliste', '', 'adressliste', 'index.php?option=com_wrapper&view=wrapper', 'component', 1, 1, 1, 2, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"url":"http:\\/\\/localhost\\/jp\\/joorgportal30\\/classes\\/showtab.php?menu=address","scrolling":"auto","width":"100%","height":"700","height_auto":"0","add_scheme":"1","frameborder":"0","menu-anchor_title":"","menu-anchor_css":"meinmenu","menu_image":"","menu_text":1,"page_title":"","show_page_heading":1,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 149, 154, 0, '*', 0),
(333, 'mainmenu', 'Termine', 'termine', '', 'termine', 'index.php?option=com_wrapper&view=wrapper', 'component', 1, 1, 1, 2, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"url":"http:\\/\\/localhost\\/jp\\/joorgportal30\\/classes\\/showtab.php?menu=termine&idwert=973","scrolling":"auto","width":"100%","height":"700","height_auto":"0","add_scheme":"1","frameborder":"0","menu-anchor_title":"","menu-anchor_css":"meinmenu","menu_image":"","menu_text":1,"page_title":"","show_page_heading":1,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 155, 172, 0, '*', 0),
(343, 'mainmenu', 'Einkaufsliste', 'einkaufsliste', '', 'einkaufsliste', 'index.php?option=com_wrapper&view=wrapper', 'component', 1, 1, 1, 2, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"url":"http:\\/\\/localhost\\/jp\\/joorgportal30\\/classes\\/showtab.php?menu=shopping&idwert=183","scrolling":"auto","width":"100%","height":"700","height_auto":"0","add_scheme":"1","frameborder":"0","menu-anchor_title":"","menu-anchor_css":"meinmenu","menu_image":"","menu_text":1,"page_title":"","show_page_heading":1,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 173, 188, 0, '*', 0),
(353, 'mainmenu', 'Essensplan', 'essensplan', '', 'essensplan', 'index.php?option=com_wrapper&view=wrapper', 'component', 1, 1, 1, 2, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"url":"http:\\/\\/localhost\\/jp\\/joorgportal30\\/classes\\/showtab.php?menu=essensplan&idwert=743","scrolling":"auto","width":"100%","height":"700","height_auto":"0","add_scheme":"1","frameborder":"0","menu-anchor_title":"","menu-anchor_css":"meinmenu","menu_image":"","menu_text":1,"page_title":"","show_page_heading":1,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 189, 194, 0, '*', 0),
(363, 'mainmenu', 'Prgupdate', 'prgupdate', '', 'prgupdate', 'index.php?option=com_wrapper&view=wrapper', 'component', 1, 1, 1, 2, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"url":"http:\\/\\/localhost\\/jp\\/joorgportal30\\/classes\\/showtab.php?menu=prgupdate&idwert=523","scrolling":"auto","width":"100%","height":"700","height_auto":"0","add_scheme":"1","frameborder":"0","menu-anchor_title":"","menu-anchor_css":"meinmenu","menu_image":"","menu_text":1,"page_title":"Programmupdate","show_page_heading":1,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 195, 202, 0, '*', 0),
(373, 'mainmenu', 'Umfragen', 'umfragen', '', 'privat/umfragen', 'index.php?option=com_wrapper&view=wrapper', 'component', 1, 113, 2, 2, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"url":"http:\\/\\/localhost\\/jp\\/joorgportal30\\/classes\\/showtab.php?menu=poll_umfragen&idwert=1253","scrolling":"auto","width":"100%","height":"700","height_auto":"0","add_scheme":"1","frameborder":"0","menu-anchor_title":"","menu-anchor_css":"meinmenu","menu_image":"images\\/joomtree\\/minus.jpg","menu_text":1,"page_title":"","show_page_heading":1,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 26, 31, 0, '*', 0),
(383, 'mainmenu', 'Wiki', 'wiki', '', 'wiki', 'index.php?option=com_wrapper&view=wrapper', 'component', 1, 1, 1, 2, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"url":"http:\\/\\/localhost\\/tools\\/mediawiki\\/index.php","scrolling":"auto","width":"100%","height":"700","height_auto":"0","add_scheme":"1","frameborder":"0","menu-anchor_title":"","menu-anchor_css":"meinmenu","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 203, 204, 0, '*', 0),
(393, 'mainmenu', 'Jahr', 'jahr', '', 'privat/heizung/jahr', 'index.php?option=com_wrapper&view=wrapper', 'component', 1, 123, 3, 2, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"url":"http:\\/\\/localhost\\/jp\\/joorgportal30\\/classes\\/showtab.php?menu=jahr&idwert=1203","scrolling":"auto","width":"100%","height":"700","height_auto":"0","add_scheme":"1","frameborder":"0","menu-anchor_title":"","menu-anchor_css":"meinmenu","menu_image":"","menu_text":1,"page_title":"","show_page_heading":1,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 15, 16, 0, '*', 0),
(403, 'mainmenu', 'Geräte', 'geraete', '', 'privat/heizung/geraete', 'index.php?option=com_wrapper&view=wrapper', 'component', 1, 123, 3, 2, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"url":"http:\\/\\/localhost\\/jp\\/joorgportal30\\/classes\\/showtab.php?menu=geraet&idwert=1213","scrolling":"auto","width":"100%","height":"700","height_auto":"0","add_scheme":"1","frameborder":"0","menu-anchor_title":"","menu-anchor_css":"meinmenu","menu_image":"","menu_text":1,"page_title":"","show_page_heading":1,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 17, 18, 0, '*', 0),
(413, 'mainmenu', 'Raum', 'raum', '', 'privat/heizung/raum', 'index.php?option=com_wrapper&view=wrapper', 'component', 1, 123, 3, 2, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"url":"http:\\/\\/localhost\\/jp\\/joorgportal30\\/classes\\/showtab.php?menu=raum&idwert=309","scrolling":"auto","width":"100%","height":"700","height_auto":"0","add_scheme":"1","frameborder":"0","menu-anchor_title":"","menu-anchor_css":"meinmenu","menu_image":"","menu_text":1,"page_title":"","show_page_heading":1,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 19, 20, 0, '*', 0),
(423, 'mainmenu', 'Blutdruck', 'blutdruck', '', 'privat/blutdruck', 'index.php?option=com_wrapper&view=wrapper', 'component', 1, 113, 2, 2, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"url":"http:\\/\\/localhost\\/jp\\/joorgportal30\\/classes\\/showtab.php?menu=blutdruck&idwert=1153","scrolling":"auto","width":"100%","height":"700","height_auto":"0","add_scheme":"1","frameborder":"0","menu-anchor_title":"","menu-anchor_css":"meinmenu","menu_image":"images\\/joomtree\\/minus.jpg","menu_text":1,"page_title":"","show_page_heading":1,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 22, 25, 0, '*', 0),
(433, 'mainmenu', 'Zeitpunkt', 'zeitpunkt', '', 'privat/blutdruck/zeitpunkt', 'index.php?option=com_wrapper&view=wrapper', 'component', 1, 423, 3, 2, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"url":"http:\\/\\/localhost\\/jp\\/joorgportal30\\/classes\\/showtab.php?menu=zeitpunkt","scrolling":"auto","width":"100%","height":"700","height_auto":"0","add_scheme":"1","frameborder":"0","menu-anchor_title":"","menu-anchor_css":"meinmenu","menu_image":"","menu_text":1,"page_title":"","show_page_heading":1,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 23, 24, 0, '*', 0),
(443, 'mainmenu', 'Antworten', 'antworten', '', 'privat/umfragen/antworten', 'index.php?option=com_wrapper&view=wrapper', 'component', 1, 373, 3, 2, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"url":"http:\\/\\/localhost\\/jp\\/joorgportal30\\/classes\\/showtab.php?menu=poll_antworten","scrolling":"auto","width":"100%","height":"700","height_auto":"0","add_scheme":"1","frameborder":"0","menu-anchor_title":"","menu-anchor_css":"meinmenu","menu_image":"","menu_text":1,"page_title":"","show_page_heading":1,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 27, 28, 0, '*', 0),
(453, 'mainmenu', 'Tabletten', 'tabletten', '', 'privat/tabletten', 'index.php?option=com_wrapper&view=wrapper', 'component', 1, 113, 2, 2, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"url":"http:\\/\\/localhost\\/jp\\/joorgportal30\\/classes\\/showtab.php?menu=tabletten","scrolling":"auto","width":"100%","height":"700","height_auto":"0","add_scheme":"1","frameborder":"0","menu-anchor_title":"","menu-anchor_css":"meinmenu","menu_image":"","menu_text":1,"page_title":"","show_page_heading":1,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 32, 33, 0, '*', 0),
(463, 'mainmenu', 'Bildverz', 'bildverz', '', 'privat/bildverz', 'index.php?option=com_wrapper&view=wrapper', 'component', 1, 113, 2, 2, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"url":"http:\\/\\/localhost\\/jp\\/joorgportal30\\/classes\\/showtab.php?menu=bildverz&idwert=1423","scrolling":"auto","width":"100%","height":"700","height_auto":"0","add_scheme":"1","frameborder":"0","menu-anchor_title":"","menu-anchor_css":"meinmenu","menu_image":"","menu_text":1,"page_title":"Bildverzeichnis","show_page_heading":1,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 34, 35, 0, '*', 0),
(473, 'mainmenu', 'Erledigungen', 'erledigungen', '', 'privat/erledigungen', 'index.php?option=com_wrapper&view=wrapper', 'component', 1, 113, 2, 2, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"url":"http:\\/\\/localhost\\/jp\\/joorgportal30\\/classes\\/showtab.php?menu=tasks&idwert=233","scrolling":"auto","width":"100%","height":"700","height_auto":"0","add_scheme":"1","frameborder":"0","menu-anchor_title":"","menu-anchor_css":"meinmenu","menu_image":"images\\/joomtree\\/minus.jpg","menu_text":1,"page_title":"","show_page_heading":1,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 36, 49, 0, '*', 0),
(483, 'mainmenu', 'Prior', 'prior', '', 'privat/erledigungen/prior', 'index.php?option=com_wrapper&view=wrapper', 'component', 1, 473, 3, 2, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"url":"http:\\/\\/localhost\\/jp\\/joorgportal30\\/classes\\/showtab.php?menu=prior","scrolling":"auto","width":"100%","height":"700","height_auto":"0","add_scheme":"1","frameborder":"0","menu-anchor_title":"","menu-anchor_css":"meinmenu","menu_image":"","menu_text":1,"page_title":"","show_page_heading":1,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 37, 38, 0, '*', 0),
(493, 'mainmenu', 'Benutzer', 'benutzer', '', 'privat/erledigungen/benutzer', 'index.php?option=com_wrapper&view=wrapper', 'component', 1, 473, 3, 2, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"url":"http:\\/\\/localhost\\/jp\\/joorgportal30\\/classes\\/showtab.php?menu=user&idwert=403","scrolling":"auto","width":"100%","height":"700","height_auto":"0","add_scheme":"1","frameborder":"0","menu-anchor_title":"","menu-anchor_css":"meinmenu","menu_image":"","menu_text":1,"page_title":"","show_page_heading":1,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 39, 40, 0, '*', 0),
(503, 'mainmenu', 'Kategorien', 'kategorien', '', 'privat/erledigungen/kategorien', 'index.php?option=com_wrapper&view=wrapper', 'component', 1, 473, 3, 2, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"url":"http:\\/\\/localhost\\/jp\\/joorgportal30\\/classes\\/showtab.php?menu=category","scrolling":"auto","width":"100%","height":"700","height_auto":"0","add_scheme":"1","frameborder":"0","menu-anchor_title":"","menu-anchor_css":"meinmenu","menu_image":"","menu_text":1,"page_title":"","show_page_heading":1,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 41, 42, 0, '*', 0),
(513, 'mainmenu', 'Dauerauftrag', 'dauerauftrag', '', 'privat/erledigungen/dauerauftrag', 'index.php?option=com_wrapper&view=wrapper', 'component', 1, 473, 3, 2, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"url":"http:\\/\\/localhost\\/jp\\/joorgportal30\\/classes\\/showtab.php?menu=dauerauftrag","scrolling":"auto","width":"100%","height":"700","height_auto":"0","add_scheme":"1","frameborder":"0","menu-anchor_title":"","menu-anchor_css":"meinmenu","menu_image":"","menu_text":1,"page_title":"","show_page_heading":1,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 43, 44, 0, '*', 0),
(523, 'mainmenu', 'Gruppe', 'gruppe', '', 'privat/erledigungen/gruppe', 'index.php?option=com_wrapper&view=wrapper', 'component', 1, 473, 3, 2, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"url":"http:\\/\\/localhost\\/jp\\/joorgportal30\\/classes\\/showtab.php?menu=erlgrp","scrolling":"auto","width":"100%","height":"700","height_auto":"0","add_scheme":"1","frameborder":"0","menu-anchor_title":"","menu-anchor_css":"meinmenu","menu_image":"","menu_text":1,"page_title":"","show_page_heading":1,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 45, 46, 0, '*', 0),
(533, 'mainmenu', 'Status', 'status', '', 'privat/erledigungen/status', 'index.php?option=com_wrapper&view=wrapper', 'component', 1, 473, 3, 2, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"url":"http:\\/\\/localhost\\/jp\\/joorgportal30\\/classes\\/showtab.php?menu=status","scrolling":"auto","width":"100%","height":"700","height_auto":"0","add_scheme":"1","frameborder":"0","menu-anchor_title":"","menu-anchor_css":"meinmenu","menu_image":"","menu_text":1,"page_title":"","show_page_heading":1,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 47, 48, 0, '*', 0),
(543, 'mainmenu', 'Buchführung', 'buchfuehrung', '', 'privat/buchfuehrung', 'index.php?option=com_wrapper&view=wrapper', 'component', 1, 113, 2, 2, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"url":"http:\\/\\/localhost\\/jp\\/joorgportal30\\/classes\\/showtab.php?menu=account&idwert=213","scrolling":"auto","width":"100%","height":"700","height_auto":"0","add_scheme":"1","frameborder":"0","menu-anchor_title":"","menu-anchor_css":"meinmenu","menu_image":"images\\/joomtree\\/minus.jpg","menu_text":1,"page_title":"","show_page_heading":1,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 50, 77, 0, '*', 0),
(553, 'mainmenu', 'Kontoinhaber', 'kontoinhaber', '', 'privat/buchfuehrung/kontoinhaber', 'index.php?option=com_wrapper&view=wrapper', 'component', 1, 543, 3, 2, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"url":"http:\\/\\/localhost\\/jp\\/joorgportal30\\/classes\\/showtab.php?menu=kontengruppe","scrolling":"auto","width":"100%","height":"700","height_auto":"0","add_scheme":"1","frameborder":"0","menu-anchor_title":"","menu-anchor_css":"meinmenu","menu_image":"images\\/joomtree\\/minus.jpg","menu_text":1,"page_title":"","show_page_heading":1,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 51, 56, 0, '*', 0),
(563, 'mainmenu', 'Inhabergruppe', 'inhabergruppe', '', 'privat/buchfuehrung/kontoinhaber/inhabergruppe', 'index.php?option=com_wrapper&view=wrapper', 'component', 1, 553, 4, 2, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"url":"http:\\/\\/localhost\\/jp\\/joorgportal30\\/classes\\/showtab.php?menu=ktoinhgrp","scrolling":"auto","width":"100%","height":"700","height_auto":"0","add_scheme":"1","frameborder":"0","menu-anchor_title":"","menu-anchor_css":"meinmenu","menu_image":"","menu_text":1,"page_title":"","show_page_heading":1,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 52, 53, 0, '*', 0),
(573, 'mainmenu', 'Inhaberzuord', 'inhaberzuord', '', 'privat/buchfuehrung/kontoinhaber/inhaberzuord', 'index.php?option=com_wrapper&view=wrapper', 'component', 1, 553, 4, 2, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"url":"http:\\/\\/localhost\\/jp\\/joorgportal30\\/classes\\/showtab.php?menu=ktoinhgrpzuord","scrolling":"auto","width":"100%","height":"700","height_auto":"0","add_scheme":"1","frameborder":"0","menu-anchor_title":"","menu-anchor_css":"meinmenu","menu_image":"","menu_text":1,"page_title":"Inhaberzuordnung","show_page_heading":1,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 54, 55, 0, '*', 0),
(583, 'mainmenu', 'Konten', 'konten', '', 'privat/buchfuehrung/konten', 'index.php?option=com_wrapper&view=wrapper', 'component', 1, 543, 3, 2, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"url":"http:\\/\\/localhost\\/jp\\/joorgportal30\\/classes\\/showtab.php?menu=poll_antworten","scrolling":"auto","width":"100%","height":"700","height_auto":"0","add_scheme":"1","frameborder":"0","menu-anchor_title":"","menu-anchor_css":"meinmenu","menu_image":"","menu_text":1,"page_title":"","show_page_heading":1,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 57, 58, 0, '*', 0),
(593, 'mainmenu', 'Kontensuchkrit', 'kontensuchkrit', '', 'privat/buchfuehrung/kontensuchkrit', 'index.php?option=com_wrapper&view=wrapper', 'component', 1, 543, 3, 2, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"url":"http:\\/\\/localhost\\/jp\\/joorgportal30\\/classes\\/showtab.php?menu=ktozuord","scrolling":"auto","width":"100%","height":"700","height_auto":"0","add_scheme":"1","frameborder":"0","menu-anchor_title":"","menu-anchor_css":"meinmenu","menu_image":"","menu_text":1,"page_title":"Kontensuchkriterium","show_page_heading":1,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 59, 60, 0, '*', 0),
(603, 'mainmenu', 'Oberkonten', 'oberkonten', '', 'privat/buchfuehrung/oberkonten', 'index.php?option=com_wrapper&view=wrapper', 'component', 1, 543, 3, 2, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"url":"http:\\/\\/localhost\\/jp\\/joorgportal30\\/classes\\/showtab.php?menu=upperaccount","scrolling":"auto","width":"100%","height":"700","height_auto":"0","add_scheme":"1","frameborder":"0","menu-anchor_title":"","menu-anchor_css":"meinmenu","menu_image":"images\\/joomtree\\/minus.jpg","menu_text":1,"page_title":"","show_page_heading":1,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 61, 66, 0, '*', 0),
(613, 'mainmenu', 'Kontengruppe', 'kontengruppe', '', 'privat/buchfuehrung/oberkonten/kontengruppe', 'index.php?option=com_wrapper&view=wrapper', 'component', 1, 603, 4, 2, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"url":"http:\\/\\/localhost\\/jp\\/joorgportal30\\/classes\\/showtab.php?menu=ktogrp","scrolling":"auto","width":"100%","height":"700","height_auto":"0","add_scheme":"1","frameborder":"0","menu-anchor_title":"","menu-anchor_css":"meinmenu","menu_image":"","menu_text":1,"page_title":"","show_page_heading":1,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 62, 63, 0, '*', 0),
(623, 'mainmenu', 'Kontenzuordnung', 'kontenzuordnung', '', 'privat/buchfuehrung/oberkonten/kontenzuordnung', 'index.php?option=com_wrapper&view=wrapper', 'component', 1, 603, 4, 2, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"url":"http:\\/\\/localhost\\/jp\\/joorgportal30\\/classes\\/showtab.php?menu=ktogrpzuord","scrolling":"auto","width":"100%","height":"700","height_auto":"0","add_scheme":"1","frameborder":"0","menu-anchor_title":"","menu-anchor_css":"meinmenu","menu_image":"","menu_text":0,"page_title":"","show_page_heading":1,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 64, 65, 0, '*', 0),
(633, 'mainmenu', 'Kontotyp', 'kontotyp', '', 'privat/buchfuehrung/kontotyp', 'index.php?option=com_wrapper&view=wrapper', 'component', 1, 543, 3, 2, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"url":"http:\\/\\/localhost\\/jp\\/joorgportal30\\/classes\\/showtab.php?menu=ktoeatyp","scrolling":"auto","width":"100%","height":"700","height_auto":"0","add_scheme":"1","frameborder":"0","menu-anchor_title":"","menu-anchor_css":"meinmenu","menu_image":"","menu_text":1,"page_title":"","show_page_heading":1,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 67, 68, 0, '*', 0),
(643, 'mainmenu', 'Kontenübersicht', 'kontenuebersicht', '', 'privat/buchfuehrung/kontenuebersicht', 'index.php?option=com_wrapper&view=wrapper', 'component', 1, 543, 3, 2, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"url":"http:\\/\\/localhost\\/jp\\/joorgportal30\\/classes\\/overviewaccount.php","scrolling":"auto","width":"100%","height":"700","height_auto":"0","add_scheme":"1","frameborder":"0","menu-anchor_title":"","menu-anchor_css":"meinmenu","menu_image":"","menu_text":1,"page_title":"","show_page_heading":1,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 69, 70, 0, '*', 0),
(653, 'mainmenu', 'Importtyp', 'importtyp', '', 'privat/buchfuehrung/importtyp', 'index.php?option=com_wrapper&view=wrapper', 'component', 1, 543, 3, 2, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"url":"http:\\/\\/localhost\\/jp\\/joorgportal30\\/classes\\/showtab.php?menu=ktotyp&idwert=1223","scrolling":"auto","width":"100%","height":"700","height_auto":"0","add_scheme":"1","frameborder":"0","menu-anchor_title":"","menu-anchor_css":"meinmenu","menu_image":"","menu_text":1,"page_title":"","show_page_heading":1,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 71, 72, 0, '*', 0),
(663, 'mainmenu', 'Kosten', 'kosten', '', 'privat/buchfuehrung/kosten', 'index.php?option=com_wrapper&view=wrapper', 'component', 1, 543, 3, 2, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"url":"http:\\/\\/localhost\\/jp\\/joorgportal30\\/classes\\/showtab.php?menu=ktodauerauftrag&idwert=1493","scrolling":"auto","width":"100%","height":"700","height_auto":"0","add_scheme":"1","frameborder":"0","menu-anchor_title":"","menu-anchor_css":"meinmenu","menu_image":"images\\/joomtree\\/minus.jpg","menu_text":1,"page_title":"","show_page_heading":1,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 73, 76, 0, '*', 0),
(673, 'mainmenu', 'Dauerauftragtyp', 'dauerauftragtyp', '', 'privat/buchfuehrung/kosten/dauerauftragtyp', 'index.php?option=com_wrapper&view=wrapper', 'component', 1, 663, 4, 2, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"url":"http:\\/\\/localhost\\/jp\\/joorgportal30\\/classes\\/showtab.php?menu=dauerauftragtyp&idwert=1543","scrolling":"auto","width":"100%","height":"700","height_auto":"0","add_scheme":"1","frameborder":"0","menu-anchor_title":"","menu-anchor_css":"meinmenu","menu_image":"","menu_text":1,"page_title":"","show_page_heading":1,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 74, 75, 0, '*', 0),
(683, 'mainmenu', 'Vorrat', 'vorrat', '', 'privat/vorrat', 'index.php?option=com_wrapper&view=wrapper', 'component', 1, 113, 2, 2, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"url":"http:\\/\\/localhost\\/jp\\/joorgportal30\\/classes\\/showtab.php?menu=stock&idwert=293","scrolling":"auto","width":"100%","height":"700","height_auto":"0","add_scheme":"1","frameborder":"0","menu-anchor_title":"","menu-anchor_css":"meinmenu","menu_image":"images\\/joomtree\\/minus.jpg","menu_text":1,"page_title":"","show_page_heading":1,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 78, 101, 0, '*', 0),
(693, 'mainmenu', 'Bilder', 'bilder', '', 'privat/vorrat/bilder', 'index.php?option=com_wrapper&view=wrapper', 'component', 1, 683, 3, 2, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"url":"http:\\/\\/localhost\\/jp\\/joorgportal30\\/classes\\/showtab.php?menu=images&idwert=603","scrolling":"auto","width":"100%","height":"700","height_auto":"0","add_scheme":"1","frameborder":"0","menu-anchor_title":"","menu-anchor_css":"meinmenu","menu_image":"","menu_text":1,"page_title":"","show_page_heading":1,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 79, 80, 0, '*', 0),
(703, 'mainmenu', 'Zimmer', 'zimmer', '', 'privat/vorrat/zimmer', 'index.php?option=com_wrapper&view=wrapper', 'component', 1, 683, 3, 2, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"url":"http:\\/\\/localhost\\/jp\\/joorgportal30\\/classes\\/showtab.php?menu=rooms&idwert=663","scrolling":"auto","width":"100%","height":"700","height_auto":"0","add_scheme":"1","frameborder":"0","menu-anchor_title":"","menu-anchor_css":"meinmenu","menu_image":"","menu_text":1,"page_title":"","show_page_heading":1,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 81, 82, 0, '*', 0),
(713, 'mainmenu', 'Möbel', 'moebel', '', 'privat/vorrat/moebel', 'index.php?option=com_wrapper&view=wrapper', 'component', 1, 683, 3, 2, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"url":"http:\\/\\/localhost\\/jp\\/joorgportal30\\/classes\\/showtab.php?menu=moebel&idwert=673","scrolling":"auto","width":"100%","height":"700","height_auto":"0","add_scheme":"1","frameborder":"0","menu-anchor_title":"","menu-anchor_css":"meinmenu","menu_image":"","menu_text":1,"page_title":"","show_page_heading":1,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 83, 84, 0, '*', 0),
(723, 'mainmenu', 'Fächer', 'faecher', '', 'privat/vorrat/faecher', 'index.php?option=com_wrapper&view=wrapper', 'component', 1, 683, 3, 2, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"url":"http:\\/\\/localhost\\/jp\\/joorgportal30\\/classes\\/showtab.php?menu=faecher&idwert=683","scrolling":"auto","width":"100%","height":"700","height_auto":"0","add_scheme":"1","frameborder":"0","menu-anchor_title":"","menu-anchor_css":"meinmenu","menu_image":"","menu_text":1,"page_title":"","show_page_heading":1,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 85, 86, 0, '*', 0),
(733, 'mainmenu', 'Oberkategorie', 'oberkategorie', '', 'privat/vorrat/oberkategorie', 'index.php?option=com_wrapper&view=wrapper', 'component', 1, 683, 3, 2, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"url":"http:\\/\\/localhost\\/jp\\/joorgportal30\\/classes\\/showtab.php?menu=vo_category&idwert=783","scrolling":"auto","width":"100%","height":"700","height_auto":"0","add_scheme":"1","frameborder":"0","menu-anchor_title":"","menu-anchor_css":"meinmenu","menu_image":"","menu_text":1,"page_title":"","show_page_heading":1,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 87, 88, 0, '*', 0),
(743, 'mainmenu', 'Kategorie', 'kategorie', '', 'privat/vorrat/kategorie', 'index.php?option=com_wrapper&view=wrapper', 'component', 1, 683, 3, 2, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"url":"http:\\/\\/localhost\\/jp\\/joorgportal30\\/classes\\/showtab.php?menu=undercategory&idwert=793","scrolling":"auto","width":"100%","height":"700","height_auto":"0","add_scheme":"1","frameborder":"0","menu-anchor_title":"","menu-anchor_css":"meinmenu","menu_image":"","menu_text":1,"page_title":"","show_page_heading":1,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 89, 90, 0, '*', 0),
(753, 'mainmenu', 'Userkategory', 'userkategory', '', 'privat/vorrat/userkategory', 'index.php?option=com_wrapper&view=wrapper', 'component', 1, 683, 3, 2, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"url":"http:\\/\\/localhost\\/jp\\/joorgportal30\\/classes\\/showtab.php?menu=usercategory&idwert=803","scrolling":"auto","width":"100%","height":"700","height_auto":"0","add_scheme":"1","frameborder":"0","menu-anchor_title":"","menu-anchor_css":"meinmenu","menu_image":"","menu_text":1,"page_title":"","show_page_heading":1,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 91, 92, 0, '*', 0),
(763, 'mainmenu', 'Grundeinheit', 'grundeinheit', '', 'privat/vorrat/grundeinheit', 'index.php?option=com_wrapper&view=wrapper', 'component', 1, 683, 3, 2, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"url":"http:\\/\\/localhost\\/jp\\/joorgportal30\\/classes\\/showtab.php?menu=grundeinheit&idwert=823","scrolling":"auto","width":"100%","height":"700","height_auto":"0","add_scheme":"1","frameborder":"0","menu-anchor_title":"","menu-anchor_css":"meinmenu","menu_image":"","menu_text":1,"page_title":"","show_page_heading":1,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 93, 94, 0, '*', 0),
(773, 'mainmenu', 'Mengeneinheit', 'mengeneinheit', '', 'privat/vorrat/mengeneinheit', 'index.php?option=com_wrapper&view=wrapper', 'component', 1, 683, 3, 2, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"url":"http:\\/\\/localhost\\/jp\\/joorgportal30\\/classes\\/showtab.php?menu=mengein&idwert=833","scrolling":"auto","width":"100%","height":"700","height_auto":"0","add_scheme":"1","frameborder":"0","menu-anchor_title":"","menu-anchor_css":"meinmenu","menu_image":"","menu_text":1,"page_title":"","show_page_heading":1,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 95, 96, 0, '*', 0),
(783, 'mainmenu', 'Grundartikel', 'grundartikel', '', 'privat/vorrat/grundartikel', 'index.php?option=com_wrapper&view=wrapper', 'component', 1, 683, 3, 2, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"url":"http:\\/\\/localhost\\/jp\\/joorgportal30\\/classes\\/showtab.php?menu=grundartikel&idwert=853","scrolling":"auto","width":"100%","height":"700","height_auto":"0","add_scheme":"1","frameborder":"0","menu-anchor_title":"","menu-anchor_css":"meinmenu","menu_image":"","menu_text":1,"page_title":"","show_page_heading":1,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 97, 98, 0, '*', 0),
(793, 'mainmenu', 'Etagen', 'etagen', '', 'privat/vorrat/etagen', 'index.php?option=com_wrapper&view=wrapper', 'component', 1, 683, 3, 2, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"url":"http:\\/\\/localhost\\/jp\\/joorgportal30\\/classes\\/showtab.php?menu=etagen&idwert=1303","scrolling":"auto","width":"100%","height":"700","height_auto":"0","add_scheme":"1","frameborder":"0","menu-anchor_title":"","menu-anchor_css":"meinmenu","menu_image":"","menu_text":1,"page_title":"","show_page_heading":1,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 99, 100, 0, '*', 0),
(803, 'mainmenu', 'Fahrtenbuch', 'fahrtenbuch', '', 'privat/fahrtenbuch', 'index.php?option=com_wrapper&view=wrapper', 'component', 1, 113, 2, 2, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"url":"http:\\/\\/localhost\\/jp\\/joorgportal30\\/classes\\/showtab.php?menu=drive&idwert=363","scrolling":"auto","width":"100%","height":"700","height_auto":"0","add_scheme":"1","frameborder":"0","menu-anchor_title":"","menu-anchor_css":"meinmenu","menu_image":"images\\/joomtree\\/minus.jpg","menu_text":1,"page_title":"","show_page_heading":1,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 102, 105, 0, '*', 0),
(813, 'mainmenu', 'RechDatum', 'rechdatum', '', 'privat/fahrtenbuch/rechdatum', 'index.php?option=com_wrapper&view=wrapper', 'component', 1, 803, 3, 2, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"url":"http:\\/\\/localhost\\/jp\\/joorgportal30\\/classes\\/showtab.php?menu=rechdat&idwert=693","scrolling":"auto","width":"100%","height":"700","height_auto":"0","add_scheme":"1","frameborder":"0","menu-anchor_title":"","menu-anchor_css":"meinmenu","menu_image":"","menu_text":1,"page_title":"Rechnungsdatum","show_page_heading":1,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 103, 104, 0, '*', 0),
(823, 'mainmenu', 'Gruppe', 'gruppe', '', 'notizen/gruppe', 'index.php?option=com_wrapper&view=wrapper', 'component', 1, 303, 2, 2, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"url":"http:\\/\\/localhost\\/jp\\/joorgportal30\\/classes\\/showtab.php?menu=erlgrp&idwert=763","scrolling":"auto","width":"100%","height":"700","height_auto":"0","add_scheme":"1","frameborder":"0","menu-anchor_title":"","menu-anchor_css":"meinmenu","menu_image":"","menu_text":1,"page_title":"","show_page_heading":1,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 108, 109, 0, '*', 0),
(833, 'mainmenu', 'Aufgabenplan', 'aufgabenplan', '', 'familie/aufgabenplan', 'index.php?option=com_wrapper&view=wrapper', 'component', 1, 263, 2, 2, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"url":"http:\\/\\/localhost\\/jp\\/joorgportal30\\/classes\\/showtab.php?menu=aufgabenplan&idwert=1403","scrolling":"auto","width":"100%","height":"700","height_auto":"0","add_scheme":"1","frameborder":"0","menu-anchor_title":"","menu-anchor_css":"meinmenu","menu_image":"images\\/joomtree\\/minus.jpg","menu_text":1,"page_title":"","show_page_heading":1,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 112, 117, 0, '*', 0),
(843, 'mainmenu', 'Benutzerwechsel', 'benujtzerwechsel', '', 'familie/aufgabenplan/benujtzerwechsel', 'index.php?option=com_wrapper&view=wrapper', 'component', 1, 833, 3, 2, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"url":"http:\\/\\/localhost\\/jp\\/joorgportal30\\/classes\\/showtab.php?menu=userrotate&idwert=1413","scrolling":"auto","width":"100%","height":"700","height_auto":"0","add_scheme":"1","frameborder":"0","menu-anchor_title":"","menu-anchor_css":"meinmenu","menu_image":"","menu_text":1,"page_title":"","show_page_heading":1,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 113, 114, 0, '*', 0),
(853, 'mainmenu', 'Aufgabenbenutzer', 'aufgabenbenutzer', '', 'familie/aufgabenplan/aufgabenbenutzer', 'index.php?option=com_wrapper&view=wrapper', 'component', 1, 833, 3, 2, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"url":"http:\\/\\/localhost\\/jp\\/joorgportal30\\/classes\\/showtab.php?menu=aufgabenbenutzer&idwert=1443","scrolling":"auto","width":"100%","height":"700","height_auto":"0","add_scheme":"1","frameborder":"0","menu-anchor_title":"","menu-anchor_css":"meinmenu","menu_image":"","menu_text":1,"page_title":"","show_page_heading":1,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 115, 116, 0, '*', 0);
INSERT INTO `jp_menu` (`id`, `menutype`, `title`, `alias`, `note`, `path`, `link`, `type`, `published`, `parent_id`, `level`, `component_id`, `checked_out`, `checked_out_time`, `browserNav`, `access`, `img`, `template_style_id`, `params`, `lft`, `rgt`, `home`, `language`, `client_id`) VALUES
(863, 'mainmenu', 'Musik', 'musik', '', 'familie/musik', 'index.php?option=com_wrapper&view=wrapper', 'component', 1, 263, 2, 2, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"url":"http:\\/\\/localhost\\/jp\\/joorgportal30\\/classes\\/showtab.php?menu=music&idwert=1463","scrolling":"auto","width":"100%","height":"200","height_auto":"0","add_scheme":"1","frameborder":"0","menu-anchor_title":"","menu-anchor_css":"meinmenu","menu_image":"","menu_text":1,"page_title":"","show_page_heading":1,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 118, 119, 0, '*', 0),
(873, 'mainmenu', 'Geschenke', 'geschenke', '', 'familie/geschenke', 'index.php?option=com_wrapper&view=wrapper', 'component', 1, 263, 2, 2, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"url":"http:\\/\\/localhost\\/jp\\/joorgportal30\\/classes\\/showtab.php?menu=present&idwert=203","scrolling":"auto","width":"100%","height":"700","height_auto":"0","add_scheme":"1","frameborder":"0","menu-anchor_title":"","menu-anchor_css":"meinmenu","menu_image":"images\\/joomtree\\/minus.jpg","menu_text":1,"page_title":"","show_page_heading":1,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 120, 123, 0, '*', 0),
(883, 'mainmenu', 'Administration', 'admin', '', 'admin', 'index.php?option=com_wrapper&view=wrapper', 'component', 1, 1, 1, 2, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"url":"http:\\/\\/localhost\\/jp\\/joorgportal30\\/classes\\/showtab.php?menu=admin&idwert=193","scrolling":"auto","width":"100%","height":"700","height_auto":"0","add_scheme":"1","frameborder":"0","menu-anchor_title":"","menu-anchor_css":"meinmenu","menu_image":"","menu_text":1,"page_title":"","show_page_heading":1,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 253, 280, 0, '*', 0),
(893, 'mainmenu', 'Geburtstage', 'geburtstage', '', 'familie/geburtstage', 'index.php?option=com_wrapper&view=wrapper', 'component', 1, 263, 2, 2, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"url":"http:\\/\\/localhost\\/jp\\/joorgportal30\\/classes\\/showtab.php?menu=birthday&idwert=223","scrolling":"auto","width":"100%","height":"700","height_auto":"0","add_scheme":"1","frameborder":"0","menu-anchor_title":"","menu-anchor_css":"meinmenu","menu_image":"","menu_text":1,"page_title":"","show_page_heading":1,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 124, 125, 0, '*', 0),
(903, 'mainmenu', 'Elternstunden', 'elternstunden', '', 'familie/elternstunden', 'index.php?option=com_wrapper&view=wrapper', 'component', 1, 263, 2, 2, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"url":"http:\\/\\/localhost\\/jp\\/joorgportal30\\/classes\\/showtab.php?menu=hours&idwert=323","scrolling":"auto","width":"100%","height":"700","height_auto":"0","add_scheme":"1","frameborder":"0","menu-anchor_title":"","menu-anchor_css":"meinmenu","menu_image":"images\\/joomtree\\/minus.jpg","menu_text":1,"page_title":"","show_page_heading":1,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 126, 131, 0, '*', 0),
(913, 'mainmenu', 'Briefverkehr', 'briefverkehr', '', 'docman/briefverkehr', 'index.php?option=com_wrapper&view=wrapper', 'component', 1, 313, 2, 2, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"url":"http:\\/\\/localhost\\/jp\\/joorgportal30\\/classes\\/showtab.php?menu=brfverkehr&idwert=653","scrolling":"auto","width":"100%","height":"700","height_auto":"0","add_scheme":"1","frameborder":"0","menu-anchor_title":"","menu-anchor_css":"meinmenu","menu_image":"","menu_text":1,"page_title":"","show_page_heading":1,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 144, 145, 0, '*', 0),
(923, 'mainmenu', 'Rechnungen', 'rechnungen', '', 'docman/rechnungen', 'index.php?option=com_wrapper&view=wrapper', 'component', 1, 313, 2, 2, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"url":"http:\\/\\/localhost\\/jp\\/joorgportal30\\/classes\\/showtab.php?menu=rechnung&idwert=1053","scrolling":"auto","width":"100%","height":"700","height_auto":"0","add_scheme":"1","frameborder":"0","menu-anchor_title":"","menu-anchor_css":"meinmenu","menu_image":"","menu_text":1,"page_title":"","show_page_heading":1,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 146, 147, 0, '*', 0),
(933, 'mainmenu', 'Adressgruppe', 'adressgruppe', '', 'adressliste/adressgruppe', 'index.php?option=com_wrapper&view=wrapper', 'component', 1, 323, 2, 2, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"url":"http:\\/\\/localhost\\/jp\\/joorgportal30\\/classes\\/showtab.php?menu=adrgrp&idwert=563","scrolling":"auto","width":"100%","height":"700","height_auto":"0","add_scheme":"1","frameborder":"0","menu-anchor_title":"","menu-anchor_css":"meinmenu","menu_image":"","menu_text":1,"page_title":"","show_page_heading":1,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 150, 151, 0, '*', 0),
(943, 'mainmenu', 'Adresszuordnung', 'adresszuordnung', '', 'adressliste/adresszuordnung', 'index.php?option=com_wrapper&view=wrapper', 'component', 1, 323, 2, 2, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"url":"http:\\/\\/localhost\\/jp\\/joorgportal30\\/classes\\/showtab.php?menu=adrzuordnung&idwert=583","scrolling":"auto","width":"100%","height":"700","height_auto":"0","add_scheme":"1","frameborder":"0","menu-anchor_title":"","menu-anchor_css":"meinmenu","menu_image":"","menu_text":1,"page_title":"","show_page_heading":1,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 152, 153, 0, '*', 0),
(953, 'mainmenu', 'Kalender', 'kalender', '', 'termine/kalender', 'index.php?option=com_wrapper&view=wrapper', 'component', 1, 333, 2, 2, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"url":"http:\\/\\/localhost\\/jp\\/joorgportal30\\/classes\\/calendar.php?menu=Kalender&idwert=183","scrolling":"auto","width":"100%","height":"700","height_auto":"0","add_scheme":"1","frameborder":"0","menu-anchor_title":"","menu-anchor_css":"meinmenu","menu_image":"","menu_text":1,"page_title":"","show_page_heading":1,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 156, 157, 0, '*', 0),
(963, 'mainmenu', 'Stundenplan', 'stundenplan', '', 'termine/stundenplan', 'index.php?option=com_wrapper&view=wrapper', 'component', 1, 333, 2, 2, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"url":"http:\\/\\/localhost\\/jp\\/joorgportal30\\/classes\\/showtab.php?menu=stdplan&idwert=1193","scrolling":"auto","width":"100%","height":"700","height_auto":"0","add_scheme":"1","frameborder":"0","menu-anchor_title":"","menu-anchor_css":"meinmenu","menu_image":"images\\/joomtree\\/minus.jpg","menu_text":1,"page_title":"","show_page_heading":1,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 158, 165, 0, '*', 0),
(973, 'mainmenu', 'Termingruppen', 'termingruppen', '', 'termine/termingruppen', 'index.php?option=com_wrapper&view=wrapper', 'component', 1, 333, 2, 2, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"url":"http:\\/\\/localhost\\/jp\\/joorgportal30\\/classes\\/showtab.php?menu=terminegrp&idwert=1453","scrolling":"auto","width":"100%","height":"700","height_auto":"0","add_scheme":"1","frameborder":"0","menu-anchor_title":"","menu-anchor_css":"meinmenu","menu_image":"","menu_text":1,"page_title":"","show_page_heading":1,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 166, 167, 0, '*', 0),
(983, 'mainmenu', 'Terminserie', 'terminserie', '', 'termine/terminserie', 'index.php?option=com_wrapper&view=wrapper', 'component', 1, 333, 2, 2, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"url":"http:\\/\\/localhost\\/jp\\/joorgportal30\\/classes\\/showtab.php?menu=terminserie&idwert=1473","scrolling":"auto","width":"100%","height":"700","height_auto":"0","add_scheme":"1","frameborder":"0","menu-anchor_title":"","menu-anchor_css":"meinmenu","menu_image":"","menu_text":1,"page_title":"","show_page_heading":1,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 168, 169, 0, '*', 0),
(993, 'mainmenu', 'Status', 'status', '', 'einkaufsliste/status', 'index.php?option=com_wrapper&view=wrapper', 'component', 1, 343, 2, 2, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"url":"http:\\/\\/localhost\\/jp\\/joorgportal30\\/classes\\/showtab.php?menu=status&idwert=383","scrolling":"auto","width":"100%","height":"700","height_auto":"0","add_scheme":"1","frameborder":"0","menu-anchor_title":"","menu-anchor_css":"meinmenu","menu_image":"","menu_text":1,"page_title":"","show_page_heading":1,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 174, 175, 0, '*', 0),
(1003, 'mainmenu', ' Stammdaten', 'stammdaten', '', 'einkaufsliste/stammdaten', 'index.php?option=com_wrapper&view=wrapper', 'component', 1, 343, 2, 2, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"url":"http:\\/\\/localhost\\/jp\\/joorgportal30\\/classes\\/showtab.php?menu=stamm&idwert=433","scrolling":"auto","width":"100%","height":"700","height_auto":"0","add_scheme":"1","frameborder":"0","menu-anchor_title":"","menu-anchor_css":"meinmenu","menu_image":"images\\/joomtree\\/minus.jpg","menu_text":1,"page_title":"","show_page_heading":1,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 176, 179, 0, '*', 0),
(1013, 'mainmenu', 'Abteilungen', 'abteilungen', '', 'einkaufsliste/abteilungen', 'index.php?option=com_wrapper&view=wrapper', 'component', 1, 343, 2, 2, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"url":"http:\\/\\/localhost\\/jp\\/joorgportal30\\/classes\\/showtab.php?menu=poll_antworten","scrolling":"auto","width":"100%","height":"700","height_auto":"0","add_scheme":"1","frameborder":"0","menu-anchor_title":"","menu-anchor_css":"meinmenu","menu_image":"","menu_text":1,"page_title":"","show_page_heading":1,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 180, 181, 0, '*', 0),
(1023, 'mainmenu', 'Kontenart', 'kontenart', '', 'einkaufsliste/kontenart', 'index.php?option=com_wrapper&view=wrapper', 'component', 1, 343, 2, 2, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"url":"http:\\/\\/localhost\\/jp\\/joorgportal30\\/classes\\/showtab.php?menu=ktoart&idwert=573","scrolling":"auto","width":"100%","height":"700","height_auto":"0","add_scheme":"1","frameborder":"0","menu-anchor_title":"","menu-anchor_css":"meinmenu","menu_image":"","menu_text":1,"page_title":"","show_page_heading":1,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 182, 183, 0, '*', 0),
(1033, 'mainmenu', 'Barcode', 'barcode', '', 'einkaufsliste/barcode', 'index.php?option=com_wrapper&view=wrapper', 'component', 1, 343, 2, 2, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"url":"http:\\/\\/localhost\\/jp\\/joorgportal30\\/classes\\/showtab.php?menu=barcode&idwert=943","scrolling":"auto","width":"100%","height":"700","height_auto":"0","add_scheme":"1","frameborder":"0","menu-anchor_title":"","menu-anchor_css":"meinmenu","menu_image":"","menu_text":1,"page_title":"","show_page_heading":1,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 184, 185, 0, '*', 0),
(1043, 'mainmenu', 'Kaufort', 'kaufort', '', 'einkaufsliste/kaufort', 'index.php?option=com_wrapper&view=wrapper', 'component', 1, 343, 2, 2, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"url":"http:\\/\\/localhost\\/jp\\/joorgportal30\\/classes\\/showtab.php?menu=station&idwert=373","scrolling":"auto","width":"100%","height":"700","height_auto":"0","add_scheme":"1","frameborder":"0","menu-anchor_title":"","menu-anchor_css":"meinmenu","menu_image":"","menu_text":1,"page_title":"","show_page_heading":1,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 186, 187, 0, '*', 0),
(1053, 'mainmenu', 'Rezepte', 'rezepte', '', 'essensplan/rezepte', 'index.php?option=com_wrapper&view=wrapper', 'component', 1, 353, 2, 2, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"url":"http:\\/\\/localhost\\/jp\\/joorgportal30\\/classes\\/showtab.php?menu=rezepte&idwert=753","scrolling":"auto","width":"100%","height":"700","height_auto":"0","add_scheme":"1","frameborder":"0","menu-anchor_title":"","menu-anchor_css":"meinmenu","menu_image":"","menu_text":1,"page_title":"","show_page_heading":1,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 190, 191, 0, '*', 0),
(1063, 'mainmenu', 'Zutaten', 'zutaten', '', 'essensplan/zutaten', 'index.php?option=com_wrapper&view=wrapper', 'component', 1, 353, 2, 2, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"url":"http:\\/\\/localhost\\/jp\\/joorgportal30\\/classes\\/showtab.php?menu=zutaten&idwert=843","scrolling":"auto","width":"100%","height":"700","height_auto":"0","add_scheme":"1","frameborder":"0","menu-anchor_title":"","menu-anchor_css":"meinmenu","menu_image":"","menu_text":1,"page_title":"","show_page_heading":1,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 192, 193, 0, '*', 0),
(1073, 'mainmenu', 'Prgtyp', 'prgtyp', '', 'prgupdate/prgtyp', 'index.php?option=com_wrapper&view=wrapper', 'component', 1, 363, 2, 2, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"url":"http:\\/\\/localhost\\/jp\\/joorgportal30\\/classes\\/showtab.php?menu=prgtyp&idwert=1043","scrolling":"auto","width":"100%","height":"700","height_auto":"0","add_scheme":"1","frameborder":"0","menu-anchor_title":"","menu-anchor_css":"meinmenu","menu_image":"","menu_text":1,"page_title":"","show_page_heading":1,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 196, 197, 0, '*', 0),
(1083, 'mainmenu', ' Prgstatus', 'prgstatus', '', 'prgupdate/prgstatus', 'index.php?option=com_wrapper&view=wrapper', 'component', 1, 363, 2, 2, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"url":"http:\\/\\/localhost\\/jp\\/joorgportal30\\/classes\\/showtab.php?menu=status&idwert=1143","scrolling":"auto","width":"100%","height":"700","height_auto":"0","add_scheme":"1","frameborder":"0","menu-anchor_title":"","menu-anchor_css":"meinmenu","menu_image":"images\\/joomtree\\/minus.jpg","menu_text":1,"page_title":"","show_page_heading":1,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 198, 201, 0, '*', 0),
(1093, 'mainmenu', 'Statusgruppe', 'statusgruppe', '', 'prgupdate/prgstatus/statusgruppe', 'index.php?option=com_wrapper&view=wrapper', 'component', 1, 1083, 3, 2, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"url":"http:\\/\\/localhost\\/jp\\/joorgportal30\\/classes\\/showtab.php?menu=statusgrp&idwert=1143","scrolling":"auto","width":"100%","height":"700","height_auto":"0","add_scheme":"1","frameborder":"0","menu-anchor_title":"","menu-anchor_css":"meinmenu","menu_image":"","menu_text":1,"page_title":"","show_page_heading":1,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 199, 200, 0, '*', 0),
(1103, 'mainmenu', 'Module', 'module', '', 'admin/module', 'index.php?option=com_wrapper&view=wrapper', 'component', 1, 883, 2, 2, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"url":"http:\\/\\/localhost\\/jp\\/joorgportal30\\/classes\\/showtab.php?menu=modul&idwert=453","scrolling":"auto","width":"100%","height":"700","height_auto":"0","add_scheme":"1","frameborder":"0","menu-anchor_title":"","menu-anchor_css":"meinmenu","menu_image":"","menu_text":1,"page_title":"","show_page_heading":1,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 256, 257, 0, '*', 0),
(1113, 'mainmenu', 'Computer', 'computer', '', 'admin/computer', 'index.php?option=com_wrapper&view=wrapper', 'component', 1, 883, 2, 2, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"url":"http:\\/\\/localhost\\/jp\\/joorgportal30\\/classes\\/showtab.php?menu=computer&idwert=483","scrolling":"auto","width":"100%","height":"700","height_auto":"0","add_scheme":"1","frameborder":"0","menu-anchor_title":"","menu-anchor_css":"meinmenu","menu_image":"","menu_text":1,"page_title":"","show_page_heading":1,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 258, 259, 0, '*', 0),
(1123, 'mainmenu', ' dbsync', 'dbsync', '', 'admin/dbsync', 'index.php?option=com_wrapper&view=wrapper', 'component', 1, 883, 2, 2, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"url":"http:\\/\\/localhost\\/jp\\/joorgportal30\\/classes\\/showtab.php?menu=dbsync&idwert=493","scrolling":"auto","width":"100%","height":"700","height_auto":"0","add_scheme":"1","frameborder":"0","menu-anchor_title":"","menu-anchor_css":"meinmenu","menu_image":"images\\/joomtree\\/minus.jpg","menu_text":1,"page_title":"","show_page_heading":1,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 260, 263, 0, '*', 0),
(1133, 'mainmenu', 'synctyp', 'synctyp', '', 'admin/dbsync/synctyp', 'index.php?option=com_wrapper&view=wrapper', 'component', 1, 1123, 3, 2, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"url":"http:\\/\\/localhost\\/jp\\/joorgportal30\\/classes\\/showtab.php?menu=synctyp&idwert=1083","scrolling":"auto","width":"100%","height":"700","height_auto":"0","add_scheme":"1","frameborder":"0","menu-anchor_title":"","menu-anchor_css":"meinmenu","menu_image":"","menu_text":1,"page_title":"","show_page_heading":1,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 261, 262, 0, '*', 0),
(1143, 'mainmenu', ' Trigger', 'trigger', '', 'admin/trigger', 'index.php?option=com_wrapper&view=wrapper', 'component', 1, 883, 2, 2, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"url":"http:\\/\\/localhost\\/jp\\/joorgportal30\\/classes\\/showtab.php?menu=trigger&idwert=503","scrolling":"auto","width":"100%","height":"700","height_auto":"0","add_scheme":"1","frameborder":"0","menu-anchor_title":"","menu-anchor_css":"meinmenu","menu_image":"images\\/joomtree\\/minus.jpg","menu_text":1,"page_title":"","show_page_heading":1,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 264, 267, 0, '*', 0),
(1153, 'mainmenu', 'Settrigger', 'settrigger', '', 'admin/trigger/settrigger', 'index.php?option=com_wrapper&view=wrapper', 'component', 1, 1143, 3, 2, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"url":"http:\\/\\/localhost\\/jp\\/joorgportal30\\/classes\\/showtab.php?menu=settrigger&idwert=1373","scrolling":"auto","width":"100%","height":"700","height_auto":"0","add_scheme":"1","frameborder":"0","menu-anchor_title":"","menu-anchor_css":"meinmenu","menu_image":"","menu_text":1,"page_title":"","show_page_heading":1,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 265, 266, 0, '*', 0),
(1163, 'mainmenu', 'Funktionen', 'funktionen', '', 'admin/funktionen', 'index.php?option=com_wrapper&view=wrapper', 'component', 1, 883, 2, 2, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"url":"http:\\/\\/localhost\\/jp\\/joorgportal30\\/classes\\/showtab.php?menu=func&idwert=533","scrolling":"auto","width":"100%","height":"700","height_auto":"0","add_scheme":"1","frameborder":"0","menu-anchor_title":"","menu-anchor_css":"meinmenu","menu_image":"","menu_text":1,"page_title":"","show_page_heading":1,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 268, 269, 0, '*', 0),
(1173, 'mainmenu', 'Sprache', 'sprache', '', 'admin/sprache', 'index.php?option=com_wrapper&view=wrapper', 'component', 1, 883, 2, 2, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"url":"http:\\/\\/localhost\\/jp\\/joorgportal30\\/classes\\/showtab.php?menu=translate&idwert=713","scrolling":"auto","width":"100%","height":"700","height_auto":"0","add_scheme":"1","frameborder":"0","menu-anchor_title":"","menu-anchor_css":"meinmenu","menu_image":"","menu_text":1,"page_title":"","show_page_heading":1,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 270, 271, 0, '*', 0),
(1183, 'mainmenu', 'Menutyp', 'menutyp', '', 'admin/menutyp', 'index.php?option=com_wrapper&view=wrapper', 'component', 1, 883, 2, 2, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"url":"http:\\/\\/localhost\\/jp\\/joorgportal30\\/classes\\/showtab.php?menu=menutyp&idwert=773","scrolling":"auto","width":"100%","height":"700","height_auto":"0","add_scheme":"1","frameborder":"0","menu-anchor_title":"","menu-anchor_css":"meinmenu","menu_image":"","menu_text":1,"page_title":"","show_page_heading":1,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 272, 273, 0, '*', 0),
(1193, 'mainmenu', 'Versionen', 'versionen', '', 'admin/versionen', 'index.php?option=com_wrapper&view=wrapper', 'component', 1, 883, 2, 2, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"url":"http:\\/\\/localhost\\/jp\\/joorgportal30\\/classes\\/showtab.php?menu=version&idwert=1023","scrolling":"auto","width":"100%","height":"700","height_auto":"0","add_scheme":"1","frameborder":"0","menu-anchor_title":"","menu-anchor_css":"meinmenu","menu_image":"","menu_text":1,"page_title":"","show_page_heading":1,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 274, 275, 0, '*', 0),
(1203, 'mainmenu', 'Publictyp', 'publictyp', '', 'admin/publictyp', 'index.php?option=com_wrapper&view=wrapper', 'component', 1, 883, 2, 2, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"url":"http:\\/\\/localhost\\/jp\\/joorgportal30\\/classes\\/showtab.php?menu=publictyp&idwert=1123","scrolling":"auto","width":"100%","height":"700","height_auto":"0","add_scheme":"1","frameborder":"0","menu-anchor_title":"","menu-anchor_css":"meinmenu","menu_image":"","menu_text":1,"page_title":"","show_page_heading":1,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 276, 277, 0, '*', 0),
(1213, 'mainmenu', 'Resyncalltyp', 'resyncalltyp', '', 'admin/resyncalltyp', 'index.php?option=com_wrapper&view=wrapper', 'component', 1, 883, 2, 2, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"url":"http:\\/\\/localhost\\/jp\\/joorgportal30\\/classes\\/showtab.php?menu=resyncalltyp&idwert=1383","scrolling":"auto","width":"100%","height":"700","height_auto":"0","add_scheme":"1","frameborder":"0","menu-anchor_title":"","menu-anchor_css":"meinmenu","menu_image":"","menu_text":1,"page_title":"","show_page_heading":1,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 278, 279, 0, '*', 0),
(1223, 'mainmenu', 'Beschenkte', 'beschenkte', '', 'familie/geschenke/beschenkte', 'index.php?option=com_wrapper&view=wrapper', 'component', 1, 873, 3, 2, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"url":"http:\\/\\/localhost\\/jp\\/joorgportal30\\/classes\\/showtab.php?menu=beschenkte&idwert=873","scrolling":"auto","width":"100%","height":"700","height_auto":"0","add_scheme":"1","frameborder":"0","menu-anchor_title":"","menu-anchor_css":"meinmenu","menu_image":"","menu_text":1,"page_title":"","show_page_heading":1,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 121, 122, 0, '*', 0),
(1233, 'mainmenu', 'Kitajahr', 'kitajahr', '', 'familie/elternstunden/kitajahr', 'index.php?option=com_wrapper&view=wrapper', 'component', 1, 903, 3, 2, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"url":"http:\\/\\/localhost\\/jp\\/joorgportal30\\/classes\\/showtab.php?menu=kitajahr&idwert=1173","scrolling":"auto","width":"100%","height":"700","height_auto":"0","add_scheme":"1","frameborder":"0","menu-anchor_title":"","menu-anchor_css":"meinmenu","menu_image":"","menu_text":1,"page_title":"","show_page_heading":1,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 127, 128, 0, '*', 0),
(1243, 'main', 'COM_PHOCAINSTALL', 'com-phocainstall', '', 'com-phocainstall', 'index.php?option=com_phocainstall', 'component', 0, 1, 1, 753, 0, '0000-00-00 00:00:00', 0, 1, 'media/com_phocainstall/images/administrator/icon-16-pi-menu.png', 0, '', 281, 282, 0, '', 1),
(1253, 'mainmenu', 'Kind', 'kind', '', 'familie/elternstunden/kind', 'index.php?option=com_wrapper&view=wrapper', 'component', 1, 903, 3, 2, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"url":"http:\\/\\/localhost\\/jp\\/joorgportal30\\/classes\\/showtab.php?menu=kitauser&idwert=1173","scrolling":"auto","width":"100%","height":"700","height_auto":"0","add_scheme":"1","frameborder":"0","menu-anchor_title":"","menu-anchor_css":"meinmenu","menu_image":"","menu_text":1,"page_title":"","show_page_heading":1,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 129, 130, 0, '*', 0),
(1263, 'mainmenu', 'Reisegrund', 'reisegrund', '', 'familie/reiseliste/reisegrund', 'index.php?option=com_wrapper&view=wrapper', 'component', 1, 273, 3, 2, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"url":"http:\\/\\/localhost\\/jp\\/joorgportal30\\/classes\\/showtab.php?menu=tc_reason&idwert=623","scrolling":"auto","width":"100%","height":"700","height_auto":"0","add_scheme":"1","frameborder":"0","menu-anchor_title":"","menu-anchor_css":"meinmenu","menu_image":"","menu_text":1,"page_title":"","show_page_heading":1,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 133, 134, 0, '*', 0),
(1273, 'mainmenu', 'Gepäckstück', 'gepaeckstueck', '', 'familie/reiseliste/gepaeckstueck', 'index.php?option=com_wrapper&view=wrapper', 'component', 1, 273, 3, 2, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"url":"http:\\/\\/localhost\\/jp\\/joorgportal30\\/classes\\/showtab.php?menu=tc_gepaeckstueck&idwert=643","scrolling":"auto","width":"100%","height":"700","height_auto":"0","add_scheme":"1","frameborder":"0","menu-anchor_title":"","menu-anchor_css":"meinmenu","menu_image":"","menu_text":1,"page_title":"","show_page_heading":1,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 137, 138, 0, '*', 0),
(1283, 'mainmenu', 'Reisekosten', 'reisekosten', '', 'familie/reiseliste/reisekosten', 'index.php?option=com_wrapper&view=wrapper', 'component', 1, 273, 3, 2, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"url":"http:\\/\\/localhost\\/jp\\/joorgportal30\\/classes\\/showtab.php?menu=reisekosten&idwert=913","scrolling":"auto","width":"100%","height":"700","height_auto":"0","add_scheme":"1","frameborder":"0","menu-anchor_title":"","menu-anchor_css":"meinmenu","menu_image":"","menu_text":1,"page_title":"","show_page_heading":1,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 139, 140, 0, '*', 0),
(1293, 'mainmenu', 'Stammdatentyp', 'stammdatentyp', '', 'einkaufsliste/stammdaten/stammdatentyp', 'index.php?option=com_wrapper&view=wrapper', 'component', 1, 1003, 3, 2, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"url":"http:\\/\\/localhost\\/jp\\/joorgportal30\\/classes\\/showtab.php?menu=stammtyp&idwert=1073","scrolling":"auto","width":"100%","height":"700","height_auto":"0","add_scheme":"1","frameborder":"0","menu-anchor_title":"","menu-anchor_css":"meinmenu","menu_image":"","menu_text":1,"page_title":"","show_page_heading":1,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 177, 178, 0, '*', 0),
(1303, 'mainmenu', 'Zeiten', 'zeiten', '', 'termine/stundenplan/zeiten', 'index.php?option=com_wrapper&view=wrapper', 'component', 1, 963, 3, 2, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"url":"http:\\/\\/localhost\\/jp\\/joorgportal30\\/classes\\/showtab.php?menu=stdzeit","scrolling":"auto","width":"100%","height":"700","height_auto":"0","add_scheme":"1","frameborder":"0","menu-anchor_title":"","menu-anchor_css":"meinmenu","menu_image":"","menu_text":1,"page_title":"","show_page_heading":1,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 159, 160, 0, '*', 0),
(1313, 'mainmenu', 'Wotag', 'wotag', '', 'termine/stundenplan/wotag', 'index.php?option=com_wrapper&view=wrapper', 'component', 1, 963, 3, 2, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"url":"http:\\/\\/localhost\\/jp\\/joorgportal30\\/classes\\/showtab.php?menu=stdwotag","scrolling":"auto","width":"100%","height":"700","height_auto":"0","add_scheme":"1","frameborder":"0","menu-anchor_title":"","menu-anchor_css":"meinmenu","menu_image":"","menu_text":1,"page_title":"Wochentag","show_page_heading":1,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 161, 162, 0, '*', 0),
(1323, 'mainmenu', 'Benutzer', 'benutzer', '', 'termine/stundenplan/benutzer', 'index.php?option=com_wrapper&view=wrapper', 'component', 1, 963, 3, 2, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"url":"http:\\/\\/localhost\\/jp\\/joorgportal30\\/classes\\/showtab.php?menu=user","scrolling":"auto","width":"100%","height":"700","height_auto":"0","add_scheme":"1","frameborder":"0","menu-anchor_title":"","menu-anchor_css":"meinmenu","menu_image":"","menu_text":1,"page_title":"","show_page_heading":1,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 163, 164, 0, '*', 0),
(1333, 'mainmenu', 'Multiselect', 'multiselect', '', 'termine/multiselect', 'index.php?option=com_wrapper&view=wrapper', 'component', 0, 333, 2, 2, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"url":"http:\\/\\/localhost\\/jp\\/joorgportal30\\/classes\\/multiselect.php","scrolling":"auto","width":"100%","height":"700","height_auto":"0","add_scheme":"1","frameborder":"0","menu-anchor_title":"","menu-anchor_css":"meinmenu","menu_image":"","menu_text":1,"page_title":"","show_page_heading":1,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 170, 171, 0, '*', 0);

--
-- Daten für Tabelle `jp_menu_types`
--

INSERT INTO `jp_menu_types` (`id`, `menutype`, `title`, `description`) VALUES
(1, 'mainmenu', 'Main Menu', 'The main menu for the site');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
