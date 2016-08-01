-- Adminer 4.1.0 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `tblabteilung`;
CREATE TABLE `tblabteilung` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldAbteilung` varchar(80) CHARACTER SET latin1 COLLATE latin1_german1_ci NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `tbladrantw`;
CREATE TABLE `tbladrantw` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldadrind` bigint(20) NOT NULL,
  `fldadrbez` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fldstatus` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fldeingdat` date NOT NULL,
  `fldantwdat` date NOT NULL,
  `fldbemerk` varchar(250) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `tbladr_group`;
CREATE TABLE `tbladr_group` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldbez` varchar(250) COLLATE utf8_bin NOT NULL,
  `fldtyp` varchar(20) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


DROP TABLE IF EXISTS `tbladr_grpdetail`;
CREATE TABLE `tbladr_grpdetail` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldgrp_ind` bigint(20) NOT NULL,
  `fldbez` varchar(250) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


DROP TABLE IF EXISTS `tbladr_liste`;
CREATE TABLE `tbladr_liste` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldid_group` bigint(20) NOT NULL,
  `fldid_typ` bigint(20) NOT NULL,
  `fldfirstname` varchar(255) COLLATE utf8_bin NOT NULL,
  `fldlastname` varchar(255) COLLATE utf8_bin NOT NULL,
  `fldcompany` varchar(255) COLLATE utf8_bin NOT NULL,
  `fldbriefanrede` varchar(50) COLLATE utf8_bin NOT NULL,
  `fldanrede` varchar(20) COLLATE utf8_bin NOT NULL,
  `fldstreet` varchar(250) COLLATE utf8_bin NOT NULL,
  `fldplz` varchar(10) COLLATE utf8_bin NOT NULL,
  `fldtown` varchar(250) COLLATE utf8_bin NOT NULL,
  `fldtelefon` varchar(250) COLLATE utf8_bin NOT NULL,
  `fldhandy` varchar(250) COLLATE utf8_bin NOT NULL,
  `fldemail` varchar(250) COLLATE utf8_bin NOT NULL,
  `fldbemerk` varchar(250) COLLATE utf8_bin NOT NULL,
  `fldoeffnungszeiten` varchar(250) COLLATE utf8_bin NOT NULL,
  `fldstatus` varchar(20) COLLATE utf8_bin NOT NULL,
  `flderfdatum` date NOT NULL,
  `flddbsyncstatus` varchar(10) COLLATE utf8_bin NOT NULL DEFAULT 'SYNC',
  PRIMARY KEY (`fldindex`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


DELIMITER ;;

CREATE TRIGGER `tbladr_liste_ai` AFTER INSERT ON `tbladr_liste` FOR EACH ROW
insert into tbldbsync(fldtblindex,flddbname,fldtblname,fldstatus) values (new.fldIndex,'dbWebportal','tbladr_liste','INS');;

CREATE TRIGGER `tbladr_liste_au` AFTER UPDATE ON `tbladr_liste` FOR EACH ROW
insert into tbldbsync(fldtblindex,flddbname,fldtblname,fldstatus) values (new.fldIndex,'dbWebportal','tbladr_liste','UPD');;

CREATE TRIGGER `tbladr_liste_ad` AFTER DELETE ON `tbladr_liste` FOR EACH ROW
insert into tbldbsync(fldtblindex,flddbname,fldtblname,fldstatus) values (old.fldIndex,'dbWebportal','tbladr_liste','DEL');;

DELIMITER ;

DROP TABLE IF EXISTS `tbladr_lstgrp`;
CREATE TABLE `tbladr_lstgrp` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldid_liste` bigint(20) NOT NULL,
  `fldid_group` bigint(20) NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


DROP TABLE IF EXISTS `tbladr_typ`;
CREATE TABLE `tbladr_typ` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldbez` varchar(250) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


DROP TABLE IF EXISTS `tblanlass`;
CREATE TABLE `tblanlass` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldbez` varchar(250) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


DROP TABLE IF EXISTS `tblartikel`;
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
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `tblaufgabenbenutzer`;
CREATE TABLE `tblaufgabenbenutzer` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldid_benutzer` bigint(20) NOT NULL,
  `fldfarbe` varchar(10) COLLATE utf8_bin NOT NULL,
  `fldfarbeWE` varchar(10) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


DROP TABLE IF EXISTS `tblaufgabenliste`;
CREATE TABLE `tblaufgabenliste` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldbez` varchar(100) NOT NULL,
  `fldtext` varchar(500) NOT NULL,
  `fldid_haeufigkeit` bigint(20) NOT NULL,
  `fldid_benutzer` bigint(20) NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `tblaufgabenplan`;
CREATE TABLE `tblaufgabenplan` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldbez` varchar(50) COLLATE utf8_bin NOT NULL,
  `fldtext` varchar(500) COLLATE utf8_bin NOT NULL,
  `flddatum` date NOT NULL,
  `fldid_benutzer` bigint(20) NOT NULL,
  `fldrotate` varchar(1) COLLATE utf8_bin NOT NULL,
  `fldid_aufgabe` bigint(20) NOT NULL,
  `fldsort` varchar(10) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


DROP TABLE IF EXISTS `tblautosyncstatus`;
CREATE TABLE `tblautosyncstatus` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `flddbname` varchar(50) NOT NULL,
  `fldtblname` varchar(50) NOT NULL,
  `fldtimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`fldindex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `tblbarcode`;
CREATE TABLE `tblbarcode` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldbez` varchar(250) NOT NULL,
  `fldbarcode` varchar(20) NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `tblbenutzer`;
CREATE TABLE `tblbenutzer` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldbez` varchar(200) COLLATE utf8_bin NOT NULL,
  `fldtimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fldbackgroundfilename` char(250) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


DROP TABLE IF EXISTS `tblbeschenkte`;
CREATE TABLE `tblbeschenkte` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldname` varchar(250) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


DROP TABLE IF EXISTS `tblbildart`;
CREATE TABLE `tblbildart` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldbez` varchar(100) NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `tblbilder`;
CREATE TABLE `tblbilder` (
  `fldIndex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldb01bez` varchar(200) NOT NULL,
  `fldb01bild` blob NOT NULL,
  `fldb01filetype` varchar(10) NOT NULL,
  `fldid_art` bigint(20) NOT NULL,
  PRIMARY KEY (`fldIndex`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `tblblutdruck`;
CREATE TABLE `tblblutdruck` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldblutdruck` varchar(10) COLLATE utf8_bin NOT NULL,
  `fldblutdia` varchar(10) COLLATE utf8_bin NOT NULL,
  `fldpuls` int(11) NOT NULL,
  `fldid_zeitpunkt` bigint(20) NOT NULL,
  `flddatum` date NOT NULL,
  `fldid_benutzer` bigint(20) NOT NULL,
  `flduhrzeit` time NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


DROP TABLE IF EXISTS `tblcomputer`;
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
  `fldremotepfad` varchar(250) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldIndex`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


DROP TABLE IF EXISTS `tblconfig`;
CREATE TABLE `tblconfig` (
  `fldindex` bigint(20) NOT NULL,
  `fldfeld` varchar(50) NOT NULL,
  `fldwert` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `tbldauerauftragtyp`;
CREATE TABLE `tbldauerauftragtyp` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldbez` varchar(250) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


DROP TABLE IF EXISTS `tbldbsync`;
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


DROP TABLE IF EXISTS `tbldocman`;
CREATE TABLE `tbldocman` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldindkat` bigint(20) NOT NULL,
  `fldbez` varchar(250) COLLATE utf8_bin NOT NULL,
  `flddatum` date NOT NULL,
  `fldregal` varchar(250) COLLATE utf8_bin NOT NULL,
  `fldlink` varchar(250) COLLATE utf8_bin NOT NULL,
  `fldind_zimmer` bigint(20) NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


DROP TABLE IF EXISTS `tbldocman_brfdetail`;
CREATE TABLE `tbldocman_brfdetail` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `flddocman_ind` bigint(20) NOT NULL,
  `fldbez` varchar(250) COLLATE utf8_bin NOT NULL,
  `flddatum` date NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


DROP TABLE IF EXISTS `tbldocman_brfverkehr`;
CREATE TABLE `tbldocman_brfverkehr` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldbez` varchar(250) COLLATE utf8_bin NOT NULL,
  `fldversendet` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fldantwdat` date NOT NULL,
  `fldan_ind` bigint(20) NOT NULL,
  `fldstatus` varchar(10) COLLATE utf8_bin NOT NULL,
  `fldfilename` varchar(512) COLLATE utf8_bin DEFAULT NULL,
  `fldparent` bigint(20) NOT NULL DEFAULT '0',
  `fldsort` varchar(10) COLLATE utf8_bin NOT NULL,
  `fldeingetragen` date NOT NULL,
  `fldpdffilename` varchar(250) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


DROP TABLE IF EXISTS `tbldocman_detail`;
CREATE TABLE `tbldocman_detail` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `flddocman_ind` bigint(20) NOT NULL,
  `fldsort` varchar(3) COLLATE utf8_bin NOT NULL,
  `fldbez` varchar(250) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


DROP TABLE IF EXISTS `tbldocman_doc`;
CREATE TABLE `tbldocman_doc` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fld_detail` bigint(20) NOT NULL,
  `fldbez` varchar(250) COLLATE utf8_bin NOT NULL,
  `fldlink` varchar(250) COLLATE utf8_bin NOT NULL,
  `flddocvon` datetime NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


DROP TABLE IF EXISTS `tbldocman_liste`;
CREATE TABLE `tbldocman_liste` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldindkat` bigint(20) NOT NULL,
  `fldbez` varchar(250) COLLATE utf8_bin NOT NULL,
  `flddatum` date NOT NULL,
  `fldregal` varchar(250) COLLATE utf8_bin NOT NULL,
  `fldlink` varchar(250) COLLATE utf8_bin NOT NULL,
  `fldind_zimmer` bigint(20) NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


DROP TABLE IF EXISTS `tblEinkauf_kopf`;
CREATE TABLE `tblEinkauf_kopf` (
  `fldIndex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldDatum` datetime NOT NULL,
  PRIMARY KEY (`fldIndex`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `tblEinkauf_liste`;
CREATE TABLE `tblEinkauf_liste` (
  `fldIndex` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `fldReihenfolge` int(11) NOT NULL,
  `fldBez` char(80) DEFAULT '0',
  `fldArtikelnr` varchar(20) NOT NULL,
  `fldTyp` varchar(5) NOT NULL,
  `fldSort` varchar(20) NOT NULL,
  `fldAbteilung` varchar(30) NOT NULL,
  `fldOrt` varchar(25) NOT NULL,
  `fldPreis` decimal(10,2) NOT NULL,
  `fldAnz` decimal(10,3) NOT NULL,
  `fldArchivDat` char(10) NOT NULL,
  `fldKonto` varchar(20) NOT NULL,
  `fldBarcode` varchar(20) NOT NULL,
  `flde01vorrat` bigint(20) NOT NULL,
  `fldStatus` varchar(10) NOT NULL DEFAULT 'offen',
  `fldEinkaufDatum` varchar(10) NOT NULL,
  `fldid_kopf` bigint(20) NOT NULL,
  `fldtimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`fldIndex`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `tblelternconfig`;
CREATE TABLE `tblelternconfig` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldsollstd` int(11) NOT NULL,
  `fldbez` varchar(250) COLLATE utf8_bin NOT NULL,
  `fldvondatum` date NOT NULL,
  `fldbisdatum` date NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


DROP TABLE IF EXISTS `tblelternstunden`;
CREATE TABLE `tblelternstunden` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `flddatum` date NOT NULL,
  `fldbez` varchar(250) COLLATE utf8_bin NOT NULL,
  `fldstunden` decimal(10,1) NOT NULL,
  `fldarchivdat` date NOT NULL DEFAULT '1900-01-01',
  `fldAnwender` varchar(20) COLLATE utf8_bin NOT NULL,
  `fldRang` varchar(2) COLLATE utf8_bin NOT NULL DEFAULT '00',
  PRIMARY KEY (`fldindex`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


DELIMITER ;;

CREATE TRIGGER `tblelternstunden_ai` AFTER INSERT ON `tblelternstunden` FOR EACH ROW
insert into tbldbsync(fldtblindex,flddbname,fldtblname,fldstatus) values (new.fldIndex,'dbWebportal','tblelternstunden','INS');;

CREATE TRIGGER `tblelternstunden_au` AFTER UPDATE ON `tblelternstunden` FOR EACH ROW
insert into tbldbsync(fldtblindex,flddbname,fldtblname,fldstatus) values (new.fldIndex,'dbWebportal','tblelternstunden','UPD');;

CREATE TRIGGER `tblelternstunden_ad` AFTER DELETE ON `tblelternstunden` FOR EACH ROW
insert into tbldbsync(fldtblindex,flddbname,fldtblname,fldstatus) values (old.fldIndex,'dbWebportal','tblelternstunden','DEL');;

DELIMITER ;

DROP TABLE IF EXISTS `tblerledigung`;
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
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `tblerl_dauer`;
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


DROP TABLE IF EXISTS `tblessensplan`;
CREATE TABLE `tblessensplan` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `flddatum` date NOT NULL,
  `fldbez` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `fldid_rezepte` bigint(20) NOT NULL,
  `fldzeit` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DELIMITER ;;

CREATE TRIGGER `tblessensplan_ai` AFTER INSERT ON `tblessensplan` FOR EACH ROW
insert into dbsync.tbldbsync(fldtblindex,flddbname,fldtblname,fldstatus) values (new.fldIndex,'dbWebportal','tblessensplan','INS');;

CREATE TRIGGER `tblessensplan_au` AFTER UPDATE ON `tblessensplan` FOR EACH ROW
insert into dbsync.tbldbsync(fldtblindex,flddbname,fldtblname,fldstatus) values (new.fldIndex,'dbWebportal','tblessensplan','UPD');;

CREATE TRIGGER `tblessensplan_ad` AFTER DELETE ON `tblessensplan` FOR EACH ROW
insert into dbsync.tbldbsync(fldtblindex,flddbname,fldtblname,fldstatus) values (old.fldIndex,'dbWebportal','tblessensplan','DEL');;

DELIMITER ;

DROP TABLE IF EXISTS `tbletagen`;
CREATE TABLE `tbletagen` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldbez` varchar(250) COLLATE utf8_bin NOT NULL,
  `fldbildid` bigint(20) NOT NULL,
  `fldwidth` int(11) NOT NULL,
  `fldheight` int(11) NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


DROP TABLE IF EXISTS `tblfahrtenbuch`;
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
  `fldKmpreis` varchar(10) COLLATE utf8_bin NOT NULL,
  `fldtimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `flddbsyncnr` int(11) NOT NULL DEFAULT '1',
  `flddbsyncstatus` varchar(10) COLLATE utf8_bin NOT NULL DEFAULT 'SYNC',
  PRIMARY KEY (`fldIndex`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


DROP TABLE IF EXISTS `tblfilemanager`;
CREATE TABLE `tblfilemanager` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldBez` varchar(50) NOT NULL,
  `fldPfad` varchar(250) NOT NULL,
  `fldWildcard` varchar(20) NOT NULL,
  `flddbsyncstatus` varchar(10) NOT NULL DEFAULT 'SYNC',
  PRIMARY KEY (`fldindex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `tblfilly`;
CREATE TABLE `tblfilly` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldbez` varchar(250) NOT NULL,
  `fldid_art` bigint(20) NOT NULL,
  `fldanz` int(11) NOT NULL,
  `fldb01bild` bigint(20) NOT NULL,
  `fldb01filetype` varchar(50) NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `tblfillyart`;
CREATE TABLE `tblfillyart` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldbez` varchar(100) NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `tblfilter`;
CREATE TABLE `tblfilter` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldfeld` varchar(80) COLLATE utf8_bin NOT NULL,
  `fldwert` varchar(80) COLLATE utf8_bin NOT NULL,
  `fldmaske` varchar(80) COLLATE utf8_bin NOT NULL,
  `fldName` varchar(80) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


DROP TABLE IF EXISTS `tblfunc`;
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
  `fldversion` varchar(5) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldIndex`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


DROP TABLE IF EXISTS `tblgeburtstage`;
CREATE TABLE `tblgeburtstage` (
  `fldIndex` int(3) NOT NULL AUTO_INCREMENT,
  `fldVorname` varchar(30) NOT NULL,
  `fldNachname` varchar(30) NOT NULL,
  `fldGebDatum` date NOT NULL,
  `fldSort` varchar(5) NOT NULL,
  `fldBemerk` varchar(80) NOT NULL,
  `fldid_user` bigint(20) NOT NULL,
  `fldid_status` bigint(20) NOT NULL,
  `flddbsyncstatus` varchar(10) NOT NULL DEFAULT 'SYNC',
  PRIMARY KEY (`fldIndex`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


DELIMITER ;;

CREATE TRIGGER `tblgeburtstage_ai` AFTER INSERT ON `tblgeburtstage` FOR EACH ROW
insert into tbldbsync(fldtblindex,flddbname,fldtblname,fldstatus) values (new.fldIndex,'dbWebportal','tblgeburtstage','INS');;

CREATE TRIGGER `tblgeburtstage_au` AFTER UPDATE ON `tblgeburtstage` FOR EACH ROW
insert into tbldbsync(fldtblindex,flddbname,fldtblname,fldstatus) values (new.fldIndex,'dbWebportal','tblgeburtstage','UPD');;

CREATE TRIGGER `tblgeburtstage_ad` AFTER DELETE ON `tblgeburtstage` FOR EACH ROW
insert into tbldbsync(fldtblindex,flddbname,fldtblname,fldstatus) values (old.fldIndex,'dbWebportal','tblgeburtstage','DEL');;

DELIMITER ;

DROP TABLE IF EXISTS `tblgepaeck`;
CREATE TABLE `tblgepaeck` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldbez` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


DROP TABLE IF EXISTS `tblgeraet`;
CREATE TABLE `tblgeraet` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldbez` varchar(255) COLLATE utf8_bin NOT NULL,
  `fldgeraetenr` varchar(10) COLLATE utf8_bin NOT NULL,
  `fldfaktor` varchar(10) COLLATE utf8_bin NOT NULL,
  `fldid_wo` bigint(20) NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


DROP TABLE IF EXISTS `tblgeschenke`;
CREATE TABLE `tblgeschenke` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `flddatum` datetime NOT NULL,
  `fldbez` varchar(250) COLLATE utf8_bin NOT NULL,
  `fldstatus` varchar(20) COLLATE utf8_bin NOT NULL,
  `fldpreis` decimal(10,2) DEFAULT NULL,
  `flduser` varchar(50) COLLATE utf8_bin NOT NULL,
  `fldbeschenkter` varchar(50) COLLATE utf8_bin NOT NULL,
  `fldlink` varchar(250) COLLATE utf8_bin NOT NULL,
  `fldanlass` varchar(250) COLLATE utf8_bin NOT NULL,
  `fldprior` int(11) NOT NULL,
  `fldvon` varchar(50) COLLATE utf8_bin NOT NULL,
  `fldimage` varchar(250) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


DROP TABLE IF EXISTS `tblgrperl`;
CREATE TABLE `tblgrperl` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldbez` varchar(200) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


DROP TABLE IF EXISTS `tblgrundartikel`;
CREATE TABLE `tblgrundartikel` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldbez` varchar(250) NOT NULL,
  `fldbezmz` varchar(250) NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `tblgrundeinheit`;
CREATE TABLE `tblgrundeinheit` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldkurz` varchar(50) NOT NULL,
  `fldbez` varchar(200) NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `tblheizung`;
CREATE TABLE `tblheizung` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldbez` varchar(250) NOT NULL,
  `fldid_ort` bigint(20) NOT NULL,
  `fldPreis` varchar(10) NOT NULL,
  `fldAnz` varchar(10) NOT NULL,
  `fldGespreis` varchar(10) NOT NULL,
  `fldAbrjahr` year(4) NOT NULL,
  `fldArchivDat` varchar(10) NOT NULL,
  `fldgeraetenr` varchar(10) NOT NULL,
  `fldid_geraet` bigint(20) NOT NULL,
  `fldAblesedat` date NOT NULL,
  `fldok` varchar(5) NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `tblhelpindex`;
CREATE TABLE `tblhelpindex` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldbez` varchar(50) NOT NULL,
  `fldtyp` varchar(20) NOT NULL,
  `fldsort` varchar(10) NOT NULL,
  `fldmenu` bigint(20) NOT NULL,
  `fldpageno` bigint(20) NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `tblhelppage`;
CREATE TABLE `tblhelppage` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldpageno` int(11) NOT NULL,
  `fldpagename` varchar(50) NOT NULL,
  `fldhelpurl` varchar(250) NOT NULL,
  `fldheadline` varchar(100) NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `tbljahr`;
CREATE TABLE `tbljahr` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldjahr` year(4) NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


DROP TABLE IF EXISTS `tblkategorie`;
CREATE TABLE `tblkategorie` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldbez` varchar(100) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


DROP TABLE IF EXISTS `tblktoart`;
CREATE TABLE `tblktoart` (
  `fldIndex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldBez` varchar(200) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldIndex`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


DROP TABLE IF EXISTS `tblktobanken`;
CREATE TABLE `tblktobanken` (
  `fldIndex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldBez` varchar(50) NOT NULL,
  `fldArt` varchar(20) NOT NULL,
  `fldcalc` varchar(4) NOT NULL,
  `fldaktiv` varchar(1) NOT NULL DEFAULT 'N',
  `fldid_benutzer` bigint(20) NOT NULL,
  PRIMARY KEY (`fldIndex`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `tblktodauerauftrag`;
CREATE TABLE `tblktodauerauftrag` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldbez` varchar(250) COLLATE utf8_bin NOT NULL,
  `fldbetrag` decimal(10,2) NOT NULL,
  `fldgesamtbetrag` decimal(10,2) NOT NULL,
  `fldid_ktogrp` bigint(20) NOT NULL,
  `fldid_kto` bigint(20) NOT NULL,
  `fldid_dauerauftragtyp` bigint(20) NOT NULL,
  `fldid_ktoeatyp` bigint(20) NOT NULL,
  `fldaktiv` varchar(1) COLLATE utf8_bin NOT NULL,
  `fldfaelligdatum` date NOT NULL,
  `fldanzmon` varchar(5) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


DROP TABLE IF EXISTS `tblktoEATyp`;
CREATE TABLE `tblktoEATyp` (
  `fldIndex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldBez` varchar(250) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldIndex`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


DROP TABLE IF EXISTS `tblktogrpzuord`;
CREATE TABLE `tblktogrpzuord` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldid_kto` bigint(20) NOT NULL,
  `fldid_ktogrp` bigint(20) NOT NULL,
  `fldid_oberkonto` bigint(20) NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


DROP TABLE IF EXISTS `tblktogrp_liste`;
CREATE TABLE `tblktogrp_liste` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldbez` varchar(250) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


DROP TABLE IF EXISTS `tblktoinhgrpzuord`;
CREATE TABLE `tblktoinhgrpzuord` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldid_ktoinhaber` bigint(20) NOT NULL,
  `fldid_ktoinhgrp` bigint(20) NOT NULL,
  `fldinhaber` varchar(50) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


DROP TABLE IF EXISTS `tblktoinhgrp_liste`;
CREATE TABLE `tblktoinhgrp_liste` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldbez` varchar(250) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


DROP TABLE IF EXISTS `tblktokonten`;
CREATE TABLE `tblktokonten` (
  `fldIndex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldKurz` varchar(20) CHARACTER SET latin1 NOT NULL,
  `fldBez` varchar(100) CHARACTER SET latin1 NOT NULL,
  `fldTyp` varchar(10) CHARACTER SET latin1 NOT NULL,
  `fldid_oberkonto` bigint(20) NOT NULL,
  `fldfarbe` varchar(7) NOT NULL,
  `fldParent` bigint(20) NOT NULL,
  `fldKtoTyp` varchar(20) NOT NULL,
  PRIMARY KEY (`fldIndex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `tblktooberkonten`;
CREATE TABLE `tblktooberkonten` (
  `fldIndex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldBez` varchar(100) COLLATE utf8_bin NOT NULL,
  `fldKurz` varchar(100) COLLATE utf8_bin NOT NULL,
  `fldTyp` varchar(50) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldIndex`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


DROP TABLE IF EXISTS `tblktosal`;
CREATE TABLE `tblktosal` (
  `fldindex` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `fldDatum` date NOT NULL,
  `fldUhrzeit` time NOT NULL,
  `fldPos` int(11) NOT NULL,
  `fldBez` varchar(250) CHARACTER SET latin1 NOT NULL,
  `fldArt` varchar(1) CHARACTER SET latin1 NOT NULL,
  `fldKonto` varchar(50) CHARACTER SET latin1 NOT NULL,
  `fldBetrag` decimal(10,2) NOT NULL,
  `fldInhaber` char(20) CHARACTER SET latin1 NOT NULL,
  `fldKtoart` varchar(3) CHARACTER SET latin1 NOT NULL,
  `fldFix` decimal(10,2) NOT NULL,
  `fldorgdatum` date NOT NULL,
  `fldfremdbetrag` decimal(10,2) NOT NULL,
  `fldwaehrung` varchar(10) CHARACTER SET latin1 NOT NULL,
  `fldDetailind` bigint(20) NOT NULL DEFAULT '0',
  `fldUmbuchinhaber` varchar(20) NOT NULL,
  `fldsel` varchar(1) NOT NULL DEFAULT 'N',
  `fldid_ort` bigint(20) NOT NULL,
  `fldtyp` varchar(20) NOT NULL,
  `fldfilename` varchar(250) NOT NULL,
  `fldcomputer` varchar(50) NOT NULL,
  `fldtimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `flddbsyncnr` int(11) NOT NULL DEFAULT '1',
  `flddbsyncstatus` varchar(10) NOT NULL DEFAULT 'SYNC',
  `flddel` varchar(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`fldindex`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DELIMITER ;;

CREATE TRIGGER `tblktosal_ai` AFTER INSERT ON `tblktosal` FOR EACH ROW
insert into tbldbsync(fldtblindex,flddbname,fldtblname,fldstatus) values (new.fldIndex,'dbWebportal','tblktosal','INS');;

CREATE TRIGGER `tblktosal_au` AFTER UPDATE ON `tblktosal` FOR EACH ROW
insert into tbldbsync(fldtblindex,flddbname,fldtblname,fldstatus) values (new.fldIndex,'dbWebportal','tblktosal','UPD');;

CREATE TRIGGER `tblktosal_ad` AFTER DELETE ON `tblktosal` FOR EACH ROW
insert into tbldbsync(fldtblindex,flddbname,fldtblname,fldstatus) values (old.fldIndex,'dbWebportal','tblktosal','DEL');;

DELIMITER ;

DROP TABLE IF EXISTS `tblktotyp`;
CREATE TABLE `tblktotyp` (
  `fldIndex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldTyp` varchar(50) COLLATE utf8_bin NOT NULL,
  `fldBez` varchar(200) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldIndex`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


DROP TABLE IF EXISTS `tblktozuord`;
CREATE TABLE `tblktozuord` (
  `fldIndex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldKurz` varchar(20) COLLATE utf8_bin NOT NULL,
  `fldSuch` varchar(250) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldIndex`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


DROP TABLE IF EXISTS `tbllanguage`;
CREATE TABLE `tbllanguage` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldkurz` varchar(4) COLLATE utf8_bin NOT NULL,
  `fldbez` varchar(250) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


DROP TABLE IF EXISTS `tblmengein`;
CREATE TABLE `tblmengein` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldkurz` varchar(50) NOT NULL,
  `fldbez` varchar(200) NOT NULL,
  `fldid_grundeinheit` bigint(20) NOT NULL,
  `fldcalc` varchar(1) NOT NULL,
  `fldfaktor` varchar(10) NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `tblmenu_liste`;
CREATE TABLE `tblmenu_liste` (
  `fldMenu` char(250) CHARACTER SET latin1 DEFAULT '0',
  `fldIndex` double NOT NULL AUTO_INCREMENT,
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
  `fldhelplink` varchar(500) COLLATE utf8_bin NOT NULL,
  `fldtarget` varchar(10) COLLATE utf8_bin NOT NULL,
  `fldid_menuprojekt` bigint(20) NOT NULL,
  `fldart` varchar(10) COLLATE utf8_bin NOT NULL,
  `flddbsyncstatus` varchar(10) COLLATE utf8_bin NOT NULL DEFAULT 'SYNC',
  PRIMARY KEY (`fldIndex`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

INSERT INTO `tblmenu_liste` (`fldMenu`, `fldIndex`, `fldtblwebadr`, `fldSort`, `fldGroup`, `fldview`, `fldid_modul`, `fldparent`, `fldversion`, `fldTyp`, `fldName`, `fldtimestamp`, `fldid_publictyp`, `fldhelplink`, `fldtarget`, `fldid_menuprojekt`, `fldart`, `flddbsyncstatus`) VALUES
('Gruppen bearbeiten',	93,	NULL,	'00000',	NULL,	'J',	93,	'18',	'0302',	'',	'',	'0000-00-00 00:00:00',	0,	'',	'',	13,	'',	'SYNC'),
('Adressliste',	83,	'\"http://localhost/webportal/adressliste/index.php\"',	'00008',	NULL,	'J',	73,	'0',	'0302',	'',	'',	'0000-00-00 00:00:00',	0,	'',	'',	13,	'',	'SYNC'),
('Addressliste-neu',	73,	'\"sites/views/wp_adress/index.php\"',	'00007',	'MAIN',	'N',	3,	'0',	'0302',	'',	'',	'0000-00-00 00:00:00',	0,	'',	'',	13,	'',	'SYNC'),
('Notizen',	63,	'\"http://localhost/webportal/zwiegespraech/index.php\"',	'00003',	NULL,	'J',	33,	'0',	'0302',	'',	'',	'0000-00-00 00:00:00',	0,	'',	'',	13,	'',	'SYNC'),
('Erledigungen',	53,	'\"http://localhost/webportal/erledigung/index.php\"',	'00002',	NULL,	'J',	13,	'0',	'0302',	'',	'',	'0000-00-00 00:00:00',	0,	'',	'',	13,	'',	'SYNC'),
('Geburtstage',	43,	'\"http://localhost/webportal/geburtstage/index.php\"',	'00006',	NULL,	'J',	63,	'0',	'0302',	'',	'',	'0000-00-00 00:00:00',	0,	'',	'',	13,	'',	'SYNC'),
('Konto',	33,	'\"http://localhost/webportal/konto/ktosal.php\"',	'00003',	NULL,	'J',	23,	'0',	'0302',	'',	'',	'0000-00-00 00:00:00',	0,	'',	'',	13,	'',	'SYNC'),
('Geschenkeliste',	23,	'\"http://localhost/webportal/geschenke/index.php\"',	'00006',	NULL,	'J',	53,	'0',	'0302',	'',	'',	'0000-00-00 00:00:00',	0,	'',	'',	13,	'',	'SYNC'),
('Administration',	13,	'\"admin/index.php\"',	'00100',	'MAIN',	'J',	3,	'0',	'0302',	'',	'',	'0000-00-00 00:00:00',	0,	'',	'',	13,	'',	'SYNC'),
('Einkaufsliste',	3,	'\"sites/views/wp_shopping/index.php\"',	'00010',	'MAIN',	'J',	43,	'0',	'0302',	'',	'',	'0000-00-00 00:00:00',	0,	'',	'',	13,	'',	'SYNC'),
('Status bearbeiten',	103,	NULL,	'00000',	NULL,	'J',	13,	'Erledigungen',	'0302',	'',	'',	'0000-00-00 00:00:00',	0,	'',	'',	13,	'',	'SYNC'),
('Vorrat',	113,	NULL,	'00004',	NULL,	'J',	93,	'0',	'0302',	'',	'',	'0000-00-00 00:00:00',	0,	'',	'',	13,	'',	'SYNC'),
('Reiseliste',	123,	NULL,	'00005',	NULL,	'J',	93,	'0',	'0302',	'',	'',	'0000-00-00 00:00:00',	0,	'',	'',	13,	'',	'SYNC'),
('Docman',	133,	NULL,	'00006',	NULL,	'J',	93,	'0',	'0302',	'',	'',	'0000-00-00 00:00:00',	0,	'',	'',	13,	'',	'SYNC'),
('Elternstunden',	143,	NULL,	'00009',	NULL,	'J',	113,	'0',	'0302',	'',	'',	'0000-00-00 00:00:00',	0,	'',	'',	13,	'',	'SYNC'),
('Home',	153,	NULL,	'00001',	NULL,	'J',	83,	'0',	'0302',	'',	'',	'0000-00-00 00:00:00',	0,	'',	'',	13,	'',	'SYNC'),
('Verbesserung',	163,	NULL,	'00011',	NULL,	'J',	93,	'0',	'0302',	'',	'',	'0000-00-00 00:00:00',	0,	'',	'',	13,	'',	'SYNC'),
('Essensplan',	173,	NULL,	'00012',	NULL,	'J',	93,	'0',	'0302',	'',	'',	'0000-00-00 00:00:00',	0,	'',	'',	13,	'',	'SYNC'),
('Einkaufsliste',	183,	'',	'00010',	'MAIN',	'J',	173,	'0',	'0303',	'',	'',	'0000-00-00 00:00:00',	0,	'',	'',	13,	'',	'SYNC'),
('Administration',	193,	'',	'00100',	'MAIN',	'J',	133,	'0',	'0303',	'',	'',	'0000-00-00 00:00:00',	0,	'',	'',	13,	'',	'SYNC'),
('Geschenke',	203,	'',	'00006',	NULL,	'J',	183,	'1095',	'0312',	'MODUL',	'',	'0000-00-00 00:00:00',	0,	'',	'',	13,	'',	'SYNC'),
('Konto',	213,	'',	'00004',	NULL,	'J',	153,	'1034',	'0303',	'MODUL',	'ACCOUNT',	'0000-00-00 00:00:00',	0,	'',	'',	13,	'',	'SYNC'),
('Geburtstage',	223,	'',	'00006',	NULL,	'J',	193,	'1095',	'0312',	'MODUL',	'',	'0000-00-00 00:00:00',	0,	'',	'',	13,	'',	'SYNC'),
('Erledigungen',	233,	'',	'00003',	NULL,	'J',	143,	'1034',	'0303',	'MODUL',	'TASK',	'0000-00-00 00:00:00',	0,	'',	'',	13,	'',	'SYNC'),
('Notizen',	243,	'',	'00003',	NULL,	'N',	163,	'0',	'0303',	'MODUL',	'NOTICE',	'0000-00-00 00:00:00',	0,	'',	'',	13,	'',	'SYNC'),
('Prior',	393,	NULL,	'',	NULL,	'J',	303,	'233',	'0303',	'',	'',	'0000-00-00 00:00:00',	0,	'',	'',	13,	'',	'SYNC'),
('Adressliste',	263,	'',	'00008',	NULL,	'J',	203,	'0',	'0303',	'',	'',	'0000-00-00 00:00:00',	0,	'',	'',	13,	'',	'SYNC'),
('Status bearbeiten',	283,	NULL,	'00013',	NULL,	'J',	273,	'233',	'0303',	'',	'',	'0000-00-00 00:00:00',	0,	'',	'',	13,	'',	'SYNC'),
('Vorrat',	293,	NULL,	'00004',	NULL,	'N',	243,	'0',	'0303',	'MODUL',	'',	'0000-00-00 00:00:00',	0,	'',	'',	13,	'',	'SYNC'),
('Checkliste',	303,	NULL,	'00005',	NULL,	'N',	253,	'0',	'0303',	'',	'',	'0000-00-00 00:00:00',	0,	'',	'',	13,	'',	'SYNC'),
('Docman',	313,	NULL,	'00006',	NULL,	'N',	263,	'0',	'0303',	'MODUL',	'',	'0000-00-00 00:00:00',	0,	'',	'',	13,	'',	'SYNC'),
('Elternstunden',	323,	'',	'00009',	NULL,	'J',	233,	'1095',	'0312',	'MODUL',	'',	'0000-00-00 00:00:00',	0,	'',	'',	13,	'',	'SYNC'),
('Home',	333,	NULL,	'00001',	NULL,	'J',	213,	'0',	'0303',	'',	'',	'0000-00-00 00:00:00',	0,	'',	'',	13,	'',	'SYNC'),
('Verbesserung',	343,	NULL,	'00011',	NULL,	'N',	223,	'0',	'0303',	'',	'',	'0000-00-00 00:00:00',	0,	'',	'',	13,	'',	'SYNC'),
('Essensplan',	353,	NULL,	'00012',	NULL,	'N',	223,	'0',	'0303',	'',	'',	'0000-00-00 00:00:00',	0,	'',	'',	13,	'',	'SYNC'),
('Fahrtenbuch',	363,	NULL,	'00013',	NULL,	'N',	283,	'0',	'0303',	'MODUL',	'',	'0000-00-00 00:00:00',	0,	'',	'',	13,	'',	'SYNC'),
('Kaufort',	373,	NULL,	'00014',	NULL,	'J',	293,	'183',	'0303',	'',	'',	'0000-00-00 00:00:00',	0,	'',	'',	13,	'',	'SYNC'),
('Status bearbeiten',	383,	NULL,	NULL,	NULL,	'J',	273,	'183',	'0303',	'',	'',	'0000-00-00 00:00:00',	0,	'',	'',	13,	'',	'SYNC'),
('Benutzer',	403,	NULL,	'',	NULL,	'J',	323,	'233',	'0303',	'MODUL',	'USER',	'0000-00-00 00:00:00',	0,	'',	'',	13,	'',	'SYNC'),
('Kategorie',	413,	NULL,	'',	NULL,	'J',	313,	'233',	'0303',	'MODUL',	'',	'0000-00-00 00:00:00',	0,	'',	'',	13,	'',	'SYNC'),
('Terminkalender',	423,	NULL,	'00015',	NULL,	'N',	333,	'0',	'0303',	'PLUGIN',	'',	'0000-00-00 00:00:00',	0,	'',	'',	13,	'',	'SYNC'),
('Stammdaten',	433,	NULL,	'',	NULL,	'J',	343,	'183',	'0303',	'MODUL',	'',	'0000-00-00 00:00:00',	0,	'',	'',	13,	'',	'SYNC'),
('Kontengruppe',	443,	NULL,	'',	NULL,	'J',	363,	'213',	'0303',	'MODUL',	'',	'0000-00-00 00:00:00',	0,	'',	'',	13,	'',	'SYNC'),
('Module',	453,	NULL,	'',	NULL,	'J',	353,	'193',	'0303',	'MODUL',	'',	'0000-00-00 00:00:00',	0,	'',	'',	13,	'',	'SYNC'),
('Konten',	463,	NULL,	'',	NULL,	'J',	373,	'213',	'0303',	'MODUL',	'',	'0000-00-00 00:00:00',	0,	'',	'',	13,	'',	'SYNC'),
('Kontenzuordnung',	473,	'',	'',	NULL,	'J',	383,	'463',	'0312',	'MODUL',	'',	'0000-00-00 00:00:00',	0,	'',	'',	13,	'',	'SYNC'),
('Sync-Computer',	483,	'',	'',	NULL,	'J',	393,	'193',	'0312',	'MODUL',	'',	'0000-00-00 00:00:00',	0,	'',	'',	13,	'',	'SYNC'),
('dbsync',	493,	'',	'',	NULL,	'J',	403,	'483',	'0312',	'MODUL',	'',	'0000-00-00 00:00:00',	0,	'',	'',	13,	'',	'SYNC'),
('Trigger',	503,	'',	'',	NULL,	'J',	413,	'483',	'0312',	'MODUL',	'',	'0000-00-00 00:00:00',	0,	'',	'',	13,	'',	'SYNC'),
('Erledigungsgruppe',	513,	NULL,	'',	NULL,	'J',	423,	'233',	'0303',	'MODUL',	'',	'0000-00-00 00:00:00',	0,	'',	'',	13,	'',	'SYNC'),
('Programmupdate',	523,	'',	'00090',	NULL,	'J',	433,	'193',	'0312',	'MODUL',	'',	'0000-00-00 00:00:00',	0,	'',	'',	13,	'',	'SYNC'),
('Funktionen',	533,	NULL,	'',	NULL,	'J',	443,	'193',	'0303',	'MODUL',	'',	'0000-00-00 00:00:00',	0,	'',	'',	13,	'',	'SYNC'),
('Oberkonten',	543,	'',	'',	NULL,	'J',	453,	'463',	'0312',	'MODUL',	'',	'0000-00-00 00:00:00',	0,	'',	'',	13,	'',	'SYNC'),
('Abteilungen',	553,	NULL,	'',	NULL,	'J',	463,	'183',	'0303',	'MODUL',	'',	'0000-00-00 00:00:00',	0,	'',	'',	13,	'',	'SYNC'),
('Adressgruppe',	563,	NULL,	'',	NULL,	'J',	473,	'263',	'0303',	'MODUL',	'',	'0000-00-00 00:00:00',	0,	'',	'',	13,	'',	'SYNC'),
('Kontenart',	573,	NULL,	'',	NULL,	'J',	483,	'183',	'0303',	'MODUL',	'',	'0000-00-00 00:00:00',	0,	'',	'',	13,	'',	'SYNC'),
('Adresszuordnung',	583,	NULL,	'',	NULL,	'J',	493,	'263',	'0303',	'MODUL',	'',	'0000-00-00 00:00:00',	0,	'',	'',	13,	'',	'SYNC'),
('Reiseliste',	613,	'',	'00016',	NULL,	'J',	513,	'1095',	'0312',	'MODUL',	'',	'0000-00-00 00:00:00',	0,	'',	'',	13,	'',	'SYNC'),
('Bilder',	603,	NULL,	'',	NULL,	'J',	503,	'293',	'0303',	'MODUL',	'',	'0000-00-00 00:00:00',	0,	'',	'',	13,	'',	'SYNC'),
('Reisegrund',	623,	NULL,	'',	NULL,	'J',	523,	'613',	'0303',	'MODUL',	'',	'0000-00-00 00:00:00',	0,	'',	'',	13,	'',	'SYNC'),
('Gepaeckliste',	633,	NULL,	'',	NULL,	'J',	533,	'613',	'0303',	'MODUL',	'',	'0000-00-00 00:00:00',	0,	'',	'',	13,	'',	'SYNC'),
('Gepaeckstueck',	643,	NULL,	'',	NULL,	'J',	543,	'613',	'0303',	'MODUL',	'',	'0000-00-00 00:00:00',	0,	'',	'',	13,	'',	'SYNC'),
('Briefverkehr',	653,	NULL,	'',	NULL,	'J',	553,	'313',	'0303',	'MODUL',	'',	'0000-00-00 00:00:00',	0,	'',	'',	13,	'',	'SYNC'),
('Zimmer',	663,	NULL,	'',	NULL,	'J',	563,	'293',	'0303',	'MODUL',	'',	'0000-00-00 00:00:00',	0,	'',	'',	13,	'',	'SYNC'),
('Moebel',	673,	NULL,	'',	NULL,	'J',	573,	'293',	'0303',	'MODUL',	'',	'0000-00-00 00:00:00',	0,	'',	'',	13,	'',	'SYNC'),
('Faecher',	683,	NULL,	'',	NULL,	'J',	583,	'293',	'0303',	'MODUL',	'',	'0000-00-00 00:00:00',	0,	'',	'',	13,	'',	'SYNC'),
('RechDatum',	693,	NULL,	'',	NULL,	'J',	593,	'363',	'0303',	'MODUL',	'',	'0000-00-00 00:00:00',	0,	'',	'',	13,	'',	'SYNC'),
('Wiki',	703,	NULL,	'00091',	NULL,	'N',	613,	'0',	'0303',	'PLUGIN',	'',	'0000-00-00 00:00:00',	0,	'',	'',	13,	'',	'SYNC'),
('Sprache',	713,	NULL,	'',	NULL,	'J',	603,	'193',	'0303',	'MODUL',	'',	'0000-00-00 00:00:00',	0,	'',	'',	13,	'',	'SYNC'),
('Dauerauftrag',	723,	NULL,	'',	NULL,	'J',	623,	'233',	'0303',	'MODUL',	'',	'0000-00-00 00:00:00',	0,	'',	'',	13,	'',	'SYNC'),
('Kontotyp',	733,	'',	'',	'',	'J',	633,	'463',	'0312',	'MODUL',	'',	'0000-00-00 00:00:00',	0,	'',	'',	13,	'',	'SYNC'),
('Notizen',	734,	NULL,	'00003',	NULL,	'J',	163,	'0',	'0303',	'MODUL',	'',	'2013-08-29 17:22:44',	0,	'',	'',	13,	'',	'SYNC'),
('Gruppe',	744,	NULL,	'',	NULL,	'J',	423,	'734',	'0303',	'MODUL',	'',	'2013-08-30 16:26:12',	0,	'',	'',	13,	'',	'SYNC'),
('Aufgabenplan',	754,	'',	'00080',	NULL,	'J',	644,	'1095',	'0312',	'MODUL',	'',	'2014-01-16 20:47:43',	0,	'',	'',	13,	'',	'SYNC'),
('Benutzerwechsel',	764,	NULL,	'',	NULL,	'J',	654,	'754',	'0303',	'MODUL',	'',	'2014-01-16 21:48:32',	0,	'',	'',	13,	'',	'SYNC'),
('Termine',	973,	'',	'00009',	'',	'J',	843,	'0',	'0303',	'MODUL',	'DATES',	'2013-08-27 17:43:06',	3,	'Joorgportal/Termine',	'',	13,	'',	'SYNC'),
('Statusgruppe',	974,	'',	'',	NULL,	'N',	0,	'263',	'0312',	'MODUL',	'',	'2014-04-08 21:12:47',	0,	'',	'',	13,	'',	'SYNC'),
('Aufgabenuser',	984,	'',	'',	NULL,	'J',	674,	'754',	'0312',	'MODUL',	'',	'2014-04-28 19:13:56',	0,	'',	'',	13,	'',	'SYNC'),
('Essensplan',	994,	'',	'00011',	NULL,	'J',	684,	'1095',	'0312',	'MODUL',	'',	'2014-07-26 08:57:26',	0,	'',	'',	13,	'',	'SYNC'),
('Stundenplan',	1004,	NULL,	'',	NULL,	'J',	1013,	'973',	'0303',	'MODUL',	'',	'2014-08-22 16:15:28',	0,	'',	'',	13,	'',	'SYNC'),
('Zeiten',	1014,	NULL,	'',	NULL,	'J',	1344,	'1004',	'0303',	'MODUL',	'',	'2014-08-22 16:18:12',	0,	'',	'',	13,	'',	'SYNC'),
('Wotag',	1024,	NULL,	'',	NULL,	'J',	1345,	'1004',	'0303',	'MODUL',	'',	'2014-08-22 16:19:44',	0,	'',	'',	13,	'',	'SYNC'),
('Privat',	1034,	NULL,	'00002',	NULL,	'J',	783,	'0',	'0303',	'MODUL',	'',	'2014-08-22 17:58:12',	0,	'',	'',	13,	'',	'SYNC'),
('Heizung',	1044,	NULL,	'',	NULL,	'J',	803,	'1034',	'0303',	'MODUL',	'',	'2014-08-22 18:01:51',	0,	'',	'',	13,	'',	'SYNC'),
('Blutdruck',	1054,	NULL,	'',	NULL,	'J',	973,	'1034',	'0303',	'MODUL',	'',	'2014-08-22 18:02:53',	0,	'',	'',	13,	'',	'SYNC'),
('Umfragen',	1064,	NULL,	'',	NULL,	'J',	1073,	'1034',	'0303',	'MODUL',	'',	'2014-08-22 18:04:17',	0,	'',	'',	13,	'',	'SYNC'),
('Tabletten',	1074,	NULL,	'',	NULL,	'J',	1153,	'1034',	'0303',	'MODUL',	'',	'2014-08-22 20:44:58',	0,	'',	'',	13,	'',	'SYNC'),
('Bildverz',	1084,	NULL,	'',	NULL,	'J',	1233,	'1034',	'0303',	'MODUL',	'',	'2014-08-22 20:57:12',	0,	'',	'',	13,	'',	'SYNC'),
('Vorrat',	1094,	NULL,	'00005',	NULL,	'J',	123,	'1034',	'0303',	'MODUL',	'',	'2014-08-22 20:59:20',	0,	'',	'',	13,	'',	'SYNC'),
('Familie',	1095,	'',	'00003',	NULL,	'J',	0,	'0',	'0312',	'MODUL',	'',	'2014-11-03 06:31:39',	0,	'',	'',	0,	'',	'SYNC'),
('Rezepte',	1096,	'',	'',	NULL,	'J',	703,	'994',	'0312',	'MODUL',	'',	'2014-11-03 06:42:22',	0,	'',	'',	0,	'',	'SYNC'),
('Docman',	1097,	'',	'00004',	NULL,	'J',	0,	'0',	'0312',	'MODUL',	'',	'2014-11-03 06:44:23',	0,	'',	'',	0,	'',	'SYNC'),
('Briefverkehr',	1098,	'',	'',	NULL,	'J',	553,	'1097',	'0312',	'MODUL',	'',	'2014-11-03 06:45:33',	0,	'',	'',	0,	'',	'SYNC'),
('Test',	1099,	'app/index.php?r=site/index',	'',	NULL,	'N',	0,	'0',	'0312',	'WEBLINK',	'',	'2014-11-03 17:19:44',	0,	'',	'',	0,	'',	'SYNC'),
('Importtyp',	1100,	'',	'',	NULL,	'J',	1043,	'213',	'0312',	'MODUL',	'',	'2014-11-05 17:36:02',	0,	'',	'',	0,	'',	'SYNC'),
('Jahr',	1101,	'',	'',	NULL,	'J',	1023,	'1044',	'0312',	'MODUL',	'',	'2014-11-14 17:21:02',	0,	'',	'',	0,	'',	'SYNC'),
('Geraet',	1102,	'',	'',	NULL,	'J',	1033,	'1044',	'0312',	'MODUL',	'',	'2014-11-14 17:24:15',	0,	'',	'',	0,	'',	'SYNC'),
('Zimmer',	1103,	'',	'',	NULL,	'J',	563,	'1094',	'0312',	'MODUL',	'',	'2014-11-19 17:38:29',	0,	'',	'',	0,	'',	'SYNC'),
('Moebel',	1104,	'',	'',	NULL,	'J',	573,	'1094',	'0312',	'MODUL',	'',	'2014-11-19 17:47:37',	0,	'',	'',	0,	'',	'SYNC'),
('Faecher',	1105,	'',	'',	NULL,	'J',	583,	'1094',	'0312',	'MODUL',	'',	'2014-11-20 06:14:27',	0,	'',	'',	0,	'',	'SYNC'),
('Status',	1106,	'',	'',	NULL,	'J',	273,	'1094',	'0312',	'MODUL',	'',	'2014-11-20 06:46:16',	0,	'',	'',	0,	'',	'SYNC'),
('Statusgrp',	1107,	'',	'',	NULL,	'J',	664,	'1106',	'0312',	'MODUL',	'',	'2014-11-20 06:47:38',	0,	'',	'',	0,	'',	'SYNC'),
('Statuszuord',	1108,	'',	'',	NULL,	'J',	1323,	'1106',	'0312',	'MODUL',	'',	'2014-11-20 06:49:09',	0,	'',	'',	0,	'',	'SYNC'),
('Bilder',	1109,	'',	'',	NULL,	'J',	503,	'1094',	'0312',	'MODUL',	'',	'2014-11-20 16:55:47',	0,	'',	'',	0,	'',	'SYNC'),
('Fahrtenbuch',	1110,	'',	'',	NULL,	'J',	283,	'1034',	'0312',	'MODUL',	'',	'2014-11-21 07:00:22',	0,	'',	'',	0,	'',	'SYNC'),
('RechDatum',	1111,	'',	'',	NULL,	'J',	593,	'1110',	'0312',	'MODUL',	'',	'2014-11-21 17:05:47',	0,	'',	'',	0,	'',	'SYNC'),
('sqlite',	1112,	'',	'',	NULL,	'J',	1346,	'1110',	'0312',	'MODUL',	'',	'2014-11-21 17:35:53',	0,	'',	'',	0,	'',	'SYNC'),
('mynetmon',	1113,	'',	'',	NULL,	'J',	1347,	'483',	'0312',	'MODUL',	'',	'2014-12-31 15:57:01',	0,	'',	'',	0,	'',	'SYNC'),
('Inhabergruppe',	1115,	'',	'',	NULL,	'J',	1133,	'443',	'0312',	'MODUL',	'',	'2015-01-05 21:14:49',	0,	'',	'',	0,	'',	'SYNC'),
('Inhaberzuordnung',	1116,	'',	'',	NULL,	'J',	1143,	'443',	'0312',	'MODUL',	'',	'2015-01-05 21:17:54',	0,	'',	'',	0,	'',	'SYNC'),
('Konten&uumlbersicht',	1117,	'',	'',	NULL,	'J',	893,	'213',	'0312',	'MODUL',	'',	'2015-01-05 21:38:48',	0,	'',	'',	0,	'',	'SYNC'),
('Versionen',	1118,	'',	'',	NULL,	'J',	863,	'193',	'0312',	'MODUL',	'',	'2015-01-06 06:09:05',	0,	'',	'',	0,	'',	'SYNC'),
('Benutzer',	1119,	'',	'',	NULL,	'J',	323,	'1004',	'0312',	'MODUL',	'',	'2015-02-02 06:03:43',	0,	'',	'',	0,	'',	'SYNC'),
('Adressstatus',	1444,	'',	'',	'',	'J',	1353,	'263',	'0312',	'MODUL',	'',	'2015-03-17 16:54:43',	0,	'',	'',	0,	'',	'SYNC'),
('Statusgruppe',	1445,	'',	'',	'',	'J',	963,	'1444',	'0312',	'MODUL',	'',	'2015-03-17 17:01:04',	0,	'',	'',	0,	'',	'SYNC'),
('Statuszuord',	1446,	'',	'',	'',	'J',	1323,	'1444',	'0312',	'MODUL',	'',	'2015-03-17 17:02:15',	0,	'',	'',	0,	'',	'SYNC'),
('Statusgruppe',	1447,	'',	'',	NULL,	'J',	963,	'283',	'0312',	'MODUL',	'',	'2015-04-20 05:21:08',	0,	'',	'',	0,	'',	'SYNC'),
('Statuszuord',	1448,	'',	'',	NULL,	'J',	1323,	'283',	'0312',	'MODUL',	'',	'2015-04-20 05:22:18',	0,	'',	'',	0,	'',	'SYNC'),
('Verbrauch',	1449,	'',	'',	NULL,	'J',	1354,	'1034',	'0315',	'MODUL',	'',	'2015-04-22 05:13:29',	0,	'',	'',	0,	'',	'SYNC'),
('Zeitpunkt',	1452,	'',	'',	NULL,	'J',	983,	'1054',	'0315',	'MODUL',	'',	'2015-04-30 15:22:31',	0,	'',	'',	0,	'',	'SYNC'),
('Reports',	1451,	'',	'',	NULL,	'J',	1356,	'213',	'0315',	'MODUL',	'',	'2015-04-23 16:07:02',	0,	'',	'',	0,	'',	'SYNC'),
('Oberkategorie',	1453,	'',	'',	NULL,	'J',	1357,	'1094',	'0315',	'MODUL',	'',	'2015-05-04 05:49:30',	0,	'',	'',	0,	'',	'SYNC'),
('Grundeinheit',	1454,	'',	'',	NULL,	'J',	713,	'1094',	'0315',	'MODUL',	'',	'2015-05-04 05:51:45',	0,	'',	'',	0,	'',	'SYNC'),
('Mengeneinheit',	1455,	'',	'',	NULL,	'J',	723,	'1094',	'0315',	'MODUL',	'',	'2015-05-04 05:53:25',	0,	'',	'',	0,	'',	'SYNC'),
('Kosten',	1456,	'',	'',	NULL,	'J',	1293,	'213',	'0315',	'MODUL',	'',	'2015-05-08 16:04:08',	0,	'',	'',	0,	'',	'SYNC'),
('Dauerauftragtyp',	1457,	'',	'',	NULL,	'J',	1313,	'1456',	'0315',	'MODUL',	'',	'2015-05-08 16:11:13',	0,	'',	'',	0,	'',	'SYNC'),
('Termingruppen',	1458,	'',	'',	NULL,	'J',	1263,	'973',	'0315',	'MODUL',	'',	'2015-05-11 17:10:57',	0,	'',	'',	0,	'',	'SYNC'),
('Teminserie',	1459,	'',	'',	NULL,	'J',	1283,	'973',	'0315',	'MODUL',	'',	'2015-05-11 17:14:53',	0,	'',	'',	0,	'',	'SYNC'),
('Kalender',	1460,	'classes/calendar.php',	'',	NULL,	'J',	0,	'973',	'0315',	'WEBLINK',	'',	'2015-05-11 17:18:38',	0,	'',	'',	0,	'',	'SYNC'),
('Aufgabenliste',	1461,	'',	'',	NULL,	'J',	1358,	'754',	'0315',	'MODUL',	'',	'2015-05-11 19:24:05',	0,	'',	'',	0,	'',	'SYNC'),
('Etagen',	1462,	'',	'',	NULL,	'J',	1123,	'1094',	'0312',	'MODUL',	'',	'2015-06-27 19:14:32',	0,	'',	'',	0,	'',	'SYNC'),
('Hilfe',	1463,	'',	'',	NULL,	'J',	1359,	'1521',	'0312',	'MODUL',	'',	'2015-07-01 15:59:41',	0,	'',	'',	0,	'',	'SYNC'),
('Häufigkeit',	1464,	'',	'',	NULL,	'J',	1360,	'1461',	'0312',	'MODUL',	'',	'2015-08-09 12:02:13',	0,	'',	'',	0,	'',	'SYNC'),
('Treegrid',	1465,	'',	'',	NULL,	'J',	753,	'1097',	'0312',	'MODUL',	'',	'2015-08-18 15:59:23',	0,	'',	'',	0,	'',	'SYNC'),
('Make Sql-Struc',	1466,	'classes/mksqlstruc.php',	'',	NULL,	'J',	0,	'483',	'0312',	'WEBLINK',	'',	'2015-08-21 05:13:51',	0,	'',	'',	0,	'',	'SYNC'),
('Tools',	1467,	'sites/html/tools.php?idwert=1467',	'00099',	NULL,	'J',	0,	'0',	'0312',	'WEBLINK',	'',	'2015-09-15 05:32:01',	0,	'',	'',	0,	'',	'SYNC'),
('Joorgsqlite',	1468,	'http://localhost/android/own/joorgsqlite/index.php',	'',	NULL,	'J',	0,	'1467',	'0312',	'WEBLINK',	'',	'2015-09-15 05:36:24',	0,	'',	'_blank',	0,	'',	'SYNC'),
('Benutzer',	1469,	'',	'',	NULL,	'J',	323,	'984',	'0312',	'MODUL',	'',	'2015-09-19 11:19:46',	0,	'',	'',	0,	'',	'SYNC'),
('Rechnungen',	1470,	'',	'',	NULL,	'J',	883,	'1110',	'0312',	'MODUL',	'',	'2015-10-02 16:15:24',	0,	'',	'',	0,	'',	'SYNC'),
('Rechnungen',	1471,	'',	'',	NULL,	'J',	883,	'1097',	'0312',	'MODUL',	'',	'2015-10-02 16:20:32',	0,	'',	'',	0,	'',	'SYNC'),
('Computer',	1481,	'',	'',	NULL,	'J',	1361,	'193',	'0312',	'MODUL',	'',	'2015-12-31 13:43:46',	0,	'',	'',	0,	'',	'SYNC'),
('Tables',	1491,	'',	'',	NULL,	'J',	1303,	'193',	'0312',	'MODUL',	'',	'2015-12-31 14:17:58',	0,	'',	'',	0,	'',	'SYNC'),
('Filly',	1501,	'',	'',	NULL,	'J',	1371,	'1511',	'0312',	'MODUL',	'',	'2016-01-06 17:03:10',	0,	'',	'',	0,	'',	'SYNC'),
('Fillys',	1511,	'',	'',	NULL,	'J',	1381,	'1034',	'0312',	'MODUL',	'',	'2016-01-07 07:02:58',	0,	'',	'',	0,	'',	'SYNC'),
('Hilfe',	1521,	'',	'',	NULL,	'J',	1391,	'193',	'0312',	'MODUL',	'',	'2016-01-07 17:05:59',	0,	'',	'',	0,	'',	'SYNC'),
('Hilfeindex',	1531,	'',	'',	NULL,	'J',	1401,	'1521',	'0312',	'MODUL',	'',	'2016-01-07 17:09:27',	0,	'',	'',	0,	'',	'SYNC'),
('Fillyart',	1541,	'',	'',	NULL,	'J',	1411,	'1511',	'0312',	'MODUL',	'',	'2016-01-11 07:04:08',	0,	'',	'',	0,	'',	'SYNC'),
('Bilder',	1551,	'',	'',	NULL,	'J',	503,	'1511',	'0312',	'MODUL',	'',	'2016-01-11 07:23:59',	0,	'',	'',	0,	'',	'SYNC'),
('Bildart',	1561,	'',	'',	NULL,	'J',	1421,	'1094',	'0312',	'MODUL',	'',	'2016-01-11 07:33:15',	0,	'',	'',	0,	'',	'SYNC'),
('FengOffice',	1571,	'http://localhost/app/fengoffice',	'',	NULL,	'J',	0,	'1097',	'0312',	'WEBLINK',	'',	'2016-01-12 16:50:59',	0,	'',	'_blank',	0,	'',	'SYNC'),
('Rückwärts',	1581,	'',	'',	NULL,	'J',	1431,	'1095',	'0312',	'MODUL',	'',	'2016-05-17 15:50:21',	0,	'',	'',	0,	'',	'SYNC'),
('sms',	1591,	'',	'',	NULL,	'J',	1441,	'734',	'0312',	'MODUL',	'',	'2016-07-04 16:20:04',	0,	'',	'',	0,	'',	'SYNC'),
('Dateimanager',	1601,	'',	'',	NULL,	'J',	1451,	'1097',	'0312',	'MODUL',	'',	'2016-07-06 05:09:54',	0,	'',	'',	0,	'',	'SYNC');

DROP TABLE IF EXISTS `tblmenu_modul`;
CREATE TABLE `tblmenu_modul` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldbez` varchar(250) COLLATE utf8_bin NOT NULL,
  `fldwebadr` varchar(250) COLLATE utf8_bin NOT NULL,
  `fldlang` varchar(4) COLLATE utf8_bin NOT NULL,
  `fldversion` varchar(5) COLLATE utf8_bin NOT NULL,
  `fldtimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fldsource` varchar(2048) COLLATE utf8_bin NOT NULL,
  `fldid_publictyp` bigint(20) NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

INSERT INTO `tblmenu_modul` (`fldindex`, `fldbez`, `fldwebadr`, `fldlang`, `fldversion`, `fldtimestamp`, `fldsource`, `fldid_publictyp`) VALUES
(73,	'Adressliste',	'sites/views/wp_adress/index.php',	'de',	'0302',	'0000-00-00 00:00:00',	'',	0),
(63,	'Geburtstage',	'sites/views/wp_birthday/index.php',	'de',	'0302',	'0000-00-00 00:00:00',	'',	0),
(53,	'Geschenkliste',	'sites/views/wp_present/index.php',	'de',	'0302',	'0000-00-00 00:00:00',	'',	0),
(43,	'Einkaufsliste',	'sites/views/wp_shopping/index.php',	'de',	'0302',	'0000-00-00 00:00:00',	'',	0),
(33,	'Notizen',	'sites/views/wp_notice/index.php',	'de',	'0302',	'0000-00-00 00:00:00',	'',	0),
(23,	'Konto',	'sites/views/wp_account/index.php',	'de',	'0302',	'0000-00-00 00:00:00',	'',	0),
(13,	'Erledigungen',	'sites/views/wp_tasks/index.php',	'de',	'0302',	'0000-00-00 00:00:00',	'',	0),
(3,	'Administration',	'admin/index.php',	'de',	'0302',	'0000-00-00 00:00:00',	'',	0),
(83,	'Home',	'welcome.php',	'de',	'0302',	'0000-00-00 00:00:00',	'',	0),
(93,	'Dummy',	'sites/views/wp_dummy/index.php',	'de',	'0302',	'0000-00-00 00:00:00',	'',	0),
(113,	'Elternstunden',	'sites/views/wp_parenthours/index.php',	'de',	'0302',	'0000-00-00 00:00:00',	'',	0),
(123,	'Vorrat',	'classes/showtab.php?menu=stock',	'de',	'0302',	'0000-00-00 00:00:00',	'',	0),
(133,	'Administration',	'classes/showtab.php?menu=admin',	'de',	'0303',	'0000-00-00 00:00:00',	'',	0),
(143,	'Erledigungen',	'classes/showtab.php?menu=tasks',	'de',	'0303',	'0000-00-00 00:00:00',	'',	0),
(153,	'Konto',	'classes/showtab.php?menu=account',	'de',	'0303',	'0000-00-00 00:00:00',	'',	0),
(163,	'Notizen',	'classes/showtab.php?menu=notice',	'de',	'0303',	'0000-00-00 00:00:00',	'',	0),
(173,	'Einkaufsliste',	'classes/showtab.php?menu=shopping',	'de',	'0303',	'0000-00-00 00:00:00',	'',	0),
(183,	'Geschenkliste',	'classes/showtab.php?menu=present',	'de',	'0303',	'0000-00-00 00:00:00',	'',	0),
(193,	'Geburtstage',	'classes/showtab.php?menu=birthday',	'de',	'0303',	'0000-00-00 00:00:00',	'',	0),
(203,	'Adressliste',	'classes/showtab.php?menu=address',	'de',	'0303',	'0000-00-00 00:00:00',	'',	0),
(213,	'Home',	'welcome.php',	'de',	'0303',	'0000-00-00 00:00:00',	'',	0),
(223,	'Dummy',	'classes/showtab.php?menu=dummy',	'de',	'0303',	'0000-00-00 00:00:00',	'',	0),
(233,	'Elternstunden',	'classes/showtab.php?menu=hours',	'de',	'0303',	'0000-00-00 00:00:00',	'',	0),
(243,	'Vorrat',	'classes/showtab.php?menu=stock',	'de',	'0303',	'0000-00-00 00:00:00',	'',	0),
(253,	'Checkliste',	'classes/showtab.php?menu=checklist',	'de',	'0303',	'0000-00-00 00:00:00',	'',	0),
(263,	'Docman',	'classes/showtab.php?menu=docman',	'de',	'0303',	'0000-00-00 00:00:00',	'',	0),
(273,	'Status',	'classes/showtab.php?menu=status',	'de',	'0303',	'0000-00-00 00:00:00',	'',	0),
(283,	'Fahrtenbuch',	'classes/showtab.php?menu=drive',	'de',	'0303',	'0000-00-00 00:00:00',	'',	0),
(293,	'Kaufort',	'classes/showtab.php?menu=station',	'de',	'0303',	'0000-00-00 00:00:00',	'',	0),
(643,	'Menutyp',	'classes/showtab.php?menu=menutyp',	'de',	'0303',	'0000-00-00 00:00:00',	'',	0),
(303,	'Prior',	'classes/showtab.php?menu=prior',	'de',	'0303',	'0000-00-00 00:00:00',	'',	0),
(313,	'Kategoire',	'classes/showtab.php?menu=category',	'de',	'0303',	'0000-00-00 00:00:00',	'',	0),
(323,	'User',	'classes/showtab.php?menu=user',	'de',	'0303',	'0000-00-00 00:00:00',	'',	0),
(333,	'Terminkalender',	'http://localhost/luxcal/',	'de',	'0303',	'0000-00-00 00:00:00',	'',	0),
(343,	'Stammdaten',	'classes/showtab.php?menu=stamm',	'de',	'0303',	'0000-00-00 00:00:00',	'',	0),
(353,	'Modul',	'classes/showtab.php?menu=modul',	'de',	'0303',	'0000-00-00 00:00:00',	'',	0),
(363,	'Kontengruppe',	'classes/showtab.php?menu=kontengruppe',	'de',	'0303',	'0000-00-00 00:00:00',	'',	0),
(373,	'Konten',	'classes/showtab.php?menu=konten',	'de',	'0303',	'0000-00-00 00:00:00',	'',	0),
(383,	'Kontozuordnung',	'classes/showtab.php?menu=ktozuord',	'de',	'0303',	'0000-00-00 00:00:00',	'',	0),
(393,	'SyncComputer',	'classes/showtab.php?menu=synccomp',	'de',	'0312',	'0000-00-00 00:00:00',	'',	0),
(403,	'dbsync',	'classes/showtab.php?menu=dbsync',	'de',	'0303',	'0000-00-00 00:00:00',	'',	0),
(413,	'Trigger',	'classes/showtab.php?menu=trigger',	'de',	'0308',	'0000-00-00 00:00:00',	'',	0),
(423,	'Erledigungsgruppe',	'classes/showtab.php?menu=erlgrp',	'de',	'0303',	'0000-00-00 00:00:00',	'',	0),
(433,	'Programmupdate',	'classes/showtab.php?menu=prgupdate',	'de',	'0303',	'0000-00-00 00:00:00',	'',	0),
(443,	'Funktion',	'classes/showtab.php?menu=func',	'de',	'0303',	'0000-00-00 00:00:00',	'',	0),
(453,	'Oberkonten',	'classes/showtab.php?menu=upperaccount',	'de',	'0303',	'0000-00-00 00:00:00',	'',	0),
(463,	'Abteilungen',	'classes/showtab.php?menu=abteilung',	'de',	'0303',	'0000-00-00 00:00:00',	'',	0),
(473,	'Adressgruppe',	'classes/showtab.php?menu=adrgrp',	'de',	'0303',	'0000-00-00 00:00:00',	'',	0),
(483,	'Kontenart',	'classes/showtab.php?menu=ktoart',	'de',	'0303',	'0000-00-00 00:00:00',	'',	0),
(493,	'Adresszuordnung',	'classes/showtab.php?menu=adrzuordnung',	'de',	'0303',	'0000-00-00 00:00:00',	'',	0),
(503,	'Bilder',	'classes/showtab.php?menu=images',	'de',	'0303',	'0000-00-00 00:00:00',	'',	0),
(513,	'Reise',	'classes/showtab.php?menu=travel',	'de',	'0303',	'0000-00-00 00:00:00',	'',	0),
(523,	'Reisegrund',	'classes/showtab.php?menu=tc_reason',	'de',	'0303',	'0000-00-00 00:00:00',	'',	0),
(533,	'GepÃ¤ckliste',	'classes/showtab.php?menu=tc_gepaeck',	'de',	'0303',	'0000-00-00 00:00:00',	'',	0),
(543,	'Gepaeckstueck',	'classes/showtab.php?menu=tc_gepaeckstueck',	'de',	'0303',	'0000-00-00 00:00:00',	'',	0),
(553,	'Briefverkehr',	'classes/showtab.php?menu=brfverkehr',	'de',	'0303',	'0000-00-00 00:00:00',	'',	0),
(563,	'Zimmer',	'classes/showtab.php?menu=rooms',	'de',	'0303',	'0000-00-00 00:00:00',	'',	0),
(573,	'MÃ¶bel',	'classes/showtab.php?menu=moebel',	'de',	'0303',	'0000-00-00 00:00:00',	'',	0),
(583,	'Faecher',	'classes/showtab.php?menu=faecher',	'de',	'0303',	'0000-00-00 00:00:00',	'',	0),
(593,	'RechDatum',	'classes/showtab.php?menu=rechdat',	'de',	'0303',	'0000-00-00 00:00:00',	'',	0),
(603,	'Sprache',	'classes/showtab.php?menu=translate',	'de',	'0303',	'0000-00-00 00:00:00',	'',	0),
(613,	'Wiki',	'http://localhost/tools/mediawiki/index.php',	'de',	'0309',	'0000-00-00 00:00:00',	'',	0),
(623,	'Dauerauftrag',	'classes/showtab.php?menu=dauerauftrag',	'de',	'0303',	'0000-00-00 00:00:00',	'',	0),
(633,	'ktoeatyp',	'classes/showtab.php?menu=ktoeatyp',	'de',	'0303',	'0000-00-00 00:00:00',	'',	0),
(644,	'Aufgabenplan',	'classes/showtab.php?menu=aufgabenplan',	'de',	'0303',	'2014-01-16 20:46:36',	'',	0),
(654,	'Benutzerwechsel',	'classes/showtab.php?menu=userrotate',	'de',	'0303',	'2014-01-16 21:48:07',	'',	0),
(1353,	'Adressstatus',	'classes/showtab.php?menu=adrstatus',	'de',	'0312',	'2015-03-17 16:55:30',	'',	0),
(674,	'Aufgabenbenutzer',	'classes/showtab.php?menu=aufgabenbenutzer',	'de',	'0311',	'2014-04-28 19:13:09',	'',	0),
(684,	'Essensplan',	'classes/showtab.php?menu=essensplan',	'de',	'0312',	'2014-07-26 08:56:18',	'',	0),
(653,	'Kategorie (AufrÃ¤umen)',	'classes/showtab.php?menu=vo_category',	'de',	'0303',	'0000-00-00 00:00:00',	'',	0),
(663,	'Unterkategorie',	'classes/showtab.php?menu=undercategory',	'de',	'0303',	'0000-00-00 00:00:00',	'',	0),
(673,	'Userkategory',	'classes/showtab.php?menu=usercategory',	'de',	'0303',	'0000-00-00 00:00:00',	'',	0),
(693,	'Essensplan',	'classes/showtab.php?menu=essensplan',	'de',	'0303',	'0000-00-00 00:00:00',	'',	0),
(703,	'Rezepte',	'classes/showtab.php?menu=rezepte',	'de',	'0303',	'0000-00-00 00:00:00',	'',	0),
(713,	'Grundeinheit',	'classes/showtab.php?menu=grundeinheit',	'de',	'0303',	'0000-00-00 00:00:00',	'',	0),
(723,	'Mengeneinheit',	'classes/showtab.php?menu=mengein',	'de',	'0303',	'0000-00-00 00:00:00',	'',	0),
(733,	'Zutaten',	'classes/showtab.php?menu=zutaten',	'de',	'0303',	'0000-00-00 00:00:00',	'',	0),
(743,	'Grundartikel',	'classes/showtab.php?menu=grundartikel',	'de',	'0303',	'0000-00-00 00:00:00',	'',	0),
(753,	'treegrid',	'classes/showtab.php?menu=treegrid',	'de',	'0303',	'0000-00-00 00:00:00',	'',	0),
(763,	'Beschenkte',	'classes/showtab.php?menu=beschenkte',	'de',	'0303',	'0000-00-00 00:00:00',	'',	0),
(773,	'Familie',	'classes/submenushow.php?menu=family',	'de',	'0303',	'0000-00-00 00:00:00',	'',	0),
(783,	'Privat',	'classes/submenushow.php?menu=privat',	'de',	'0303',	'0000-00-00 00:00:00',	'',	0),
(793,	'Reisekosten',	'classes/showtab.php?menu=reisekosten',	'de',	'0303',	'0000-00-00 00:00:00',	'',	0),
(803,	'Heizung',	'classes/showtab.php?menu=heizung',	'de',	'0303',	'0000-00-00 00:00:00',	'',	0),
(813,	'Barcode',	'classes/showtab.php?menu=barcode',	'de',	'0303',	'2013-07-26 05:27:46',	'',	0),
(823,	'Update erzeugen',	'classes/updateerzeugen.php?idwert=953',	'de',	'0309',	'2013-08-16 17:30:25',	'',	0),
(833,	'gcal',	'classes/plugin/google/calendar.php?menu=gcal',	'de',	'0307',	'2013-08-27 17:38:10',	'<iframe src=\"https://www.google.com/calendar/embed?height=500&wkst=1&bgcolor=%23FFFFFF&src=meh8bg5v4qo65dfl4v6as701fs%40group.calendar.google.com&color=%23B1365F&src=7lie3jn3a26mct92vlnifu0mmo%40group.calendar.google.com&color=%2328754E&src=bu0hs6s4bkprpkr24bqt113fbo%40group.calendar.google.com&color=%235229A3&src=de.german%23holiday%40group.v.calendar.google.com&color=%23875509&ctz=Europe%2FBerlin\" style=\" border-width:0 \" width=\"800\" height=\"500\" frameborder=\"0\" scrolling=\"no\"></iframe>',	13),
(843,	'Termine',	'classes/showtab.php?menu=termine',	'de',	'0307',	'2013-08-28 05:34:10',	'',	0),
(853,	'(ohne)',	'',	'de',	'0308',	'2013-08-29 05:25:44',	'',	0),
(863,	'Version',	'classes/showtab.php?menu=version',	'de',	'0308',	'2013-08-30 14:10:16',	'',	0),
(873,	'Prgtyp',	'classes/showtab.php?menu=prgtyp',	'de',	'0308',	'2013-08-30 14:36:59',	'',	0),
(883,	'Rechnung',	'classes/showtab.php?menu=rechnung',	'de',	'0308',	'2013-08-30 18:31:41',	'',	0),
(893,	'KontenÃ¼bersicht',	'classes/overviewaccount.php',	'de',	'0308',	'2013-09-04 15:15:19',	'',	0),
(903,	'Stammdatentyp',	'classes/showtab.php?menu=stammtyp',	'de',	'0308',	'2013-09-07 19:16:56',	'',	0),
(913,	'synctyp',	'classes/showtab.php?menu=synctyp',	'de',	'0308',	'2013-09-10 05:07:44',	'',	0),
(923,	'dbsync-Remote',	'classes/showtab.php?menu=dbsyncremote',	'de',	'0308',	'2013-09-11 05:07:57',	'',	0),
(933,	'Funktion-Remote',	'classes/showtab.php?menu=funcremote',	'de',	'0308',	'2013-09-11 18:27:21',	'',	0),
(943,	'Erledigung-Remote',	'classes/showtab.php?menu=tasksremote',	'de',	'0308',	'2013-09-11 17:20:29',	'',	0),
(953,	'Publictyp',	'classes/showtab.php?menu=publictyp',	'de',	'0309',	'2013-10-06 13:55:44',	'',	0),
(963,	'Statusgruppe',	'classes/showtab.php?menu=statusgrp',	'de',	'0309',	'2013-10-06 14:16:53',	'',	0),
(973,	'Blutdruck',	'classes/showtab.php?menu=blutdruck',	'de',	'0309',	'2013-10-25 13:18:25',	'',	0),
(983,	'Zeitpunkt',	'classes/showtab.php?menu=zeitpunkt',	'de',	'0309',	'2013-10-25 13:30:00',	'',	0),
(993,	'Kitajahr',	'classes/showtab.php?menu=kitajahr',	'de',	'0309',	'2013-10-25 19:41:06',	'',	0),
(1003,	'Kitauser',	'classes/showtab.php?menu=kitauser',	'de',	'0309',	'2013-10-25 20:17:05',	'',	0),
(1013,	'Stundenplan',	'classes/showtab.php?menu=stdplan',	'de',	'0309',	'2013-10-26 06:37:41',	'',	0),
(1023,	'Jahr',	'classes/showtab.php?menu=jahr',	'de',	'0310',	'2013-11-09 22:41:49',	'',	0),
(1033,	'GerÃ¤te',	'classes/showtab.php?menu=geraet',	'de',	'0310',	'2013-12-01 14:44:10',	'',	0),
(1043,	'Kontotyp',	'classes/showtab.php?menu=ktotyp',	'de',	'0310',	'2013-12-05 06:20:02',	'',	0),
(1053,	'Kontengruppe',	'classes/showtab.php?menu=ktogrp',	'de',	'0310',	'2013-12-12 06:21:57',	'',	0),
(1063,	'Kontenzuordnung',	'classes/showtab.php?menu=ktogrpzuord',	'de',	'0310',	'2013-12-12 06:40:07',	'',	0),
(1073,	'Umfragen',	'classes/showtab.php?menu=poll_umfragen',	'de',	'0310',	'2013-12-12 21:52:40',	'',	0),
(1083,	'Antworten',	'classes/showtab.php?menu=poll_antworten',	'de',	'0310',	'2013-12-12 22:01:40',	'',	0),
(1093,	'Login',	'includes/SimpleMember/inc/login.php',	'de',	'0310',	'2013-12-13 16:57:46',	'',	0),
(1103,	'Installerzeugen',	'classes/installerzeugen.php',	'de',	'0310',	'2013-12-17 17:43:04',	'',	0),
(1113,	'logout',	'includes/SimpleMember/logout.php',	'de',	'0310',	'2013-12-20 21:14:13',	'',	0),
(1123,	'Etagen',	'classes/showtab.php?menu=etagen',	'de',	'0310',	'2014-01-02 20:05:25',	'',	0),
(1133,	'Kontoinhabergruppe',	'classes/showtab.php?menu=ktoinhgrp',	'de',	'0310',	'2014-01-07 07:13:58',	'',	0),
(1143,	'Inhaberzuord',	'classes/showtab.php?menu=ktoinhgrpzuord',	'de',	'0310',	'2014-01-07 07:22:26',	'',	0),
(1153,	'Tabletten',	'classes/showtab.php?menu=tabletten',	'de',	'0310',	'2014-01-08 07:10:01',	'',	0),
(1163,	'Mysqldumper',	'http://localhost/mysqldumper',	'de',	'0310',	'2014-01-08 17:07:55',	'',	0),
(1173,	'Settrigger',	'classes/showtab.php?menu=settrigger',	'de',	'0310',	'2014-01-13 07:49:52',	'',	0),
(1183,	'Resyncalltyp',	'classes/showtab.php?menu=resyncalltyp',	'de',	'0310',	'2014-01-13 17:00:56',	'',	0),
(1203,	'Aufgabenplan',	'classes/showtab.php?menu=aufgabenplan',	'de',	'0310',	'2014-01-15 06:23:50',	'',	0),
(1223,	'Benutzerwechsel',	'classes/showtab.php?menu=userrotate',	'de',	'0310',	'2014-01-16 21:28:47',	'',	0),
(1233,	'Bildverz',	'classes/showtab.php?menu=bildverz',	'de',	'0310',	'2014-01-27 06:33:43',	'',	0),
(309,	'Raum',	'classes/showtab.php?menu=raum',	'de',	'0309',	'2014-02-06 17:43:40',	'',	0),
(1253,	'Aufgabenbenutzer',	'classes/showtab.php?menu=aufgabenbenutzer',	'de',	'0311',	'2014-02-18 17:13:21',	'',	0),
(1263,	'Termingruppen',	'classes/showtab.php?menu=terminegrp',	'de',	'0311',	'2014-02-24 06:32:18',	'',	0),
(1273,	'Musik',	'classes/showtab.php?menu=music',	'de',	'0311',	'2014-03-06 21:39:55',	'',	0),
(1283,	'Terminserie',	'classes/showtab.php?menu=terminserie',	'de',	'0311',	'2014-03-07 06:33:53',	'',	0),
(1293,	'Dauerauftragkto',	'classes/showtab.php?menu=ktodauerauftrag',	'de',	'0312',	'2014-03-31 16:20:34',	'',	0),
(1303,	'Tables',	'classes/showtab.php?menu=tables',	'de',	'0312',	'2014-05-05 05:24:34',	'',	0),
(1313,	'Dauerauftragtyp',	'classes/showtab.php?menu=dauerauftragtyp',	'de',	'0312',	'2014-05-08 05:52:07',	'',	0),
(1323,	'Statuszuord',	'classes/showtab.php?menu=statuszuord',	'de',	'0312',	'2014-06-20 08:51:38',	'',	3),
(1333,	'Etiketten',	'classes/showtab.php?menu=etiketten',	'de',	'0312',	'2014-06-24 15:54:26',	'',	0),
(1343,	'Artikelnr',	'classes/showtab.php?menu=artikelnr',	'de',	'0312',	'2014-06-26 05:51:31',	'',	0),
(1344,	'Zeiten',	'classes/showtab.php?menu=stdzeit',	'de',	'0312',	'2014-08-22 09:34:51',	'',	0),
(1345,	'Wotag',	'classes/showtab.php?menu=stdwotag',	'de',	'0312',	'2014-08-22 09:38:36',	'',	0),
(1346,	'showsqlite',	'classes/showsqlite.php',	'de',	'0312',	'2014-11-21 17:34:55',	'',	0),
(1347,	'netmon',	'../mynetmon/index.php',	'de',	'0312',	'2014-12-31 15:56:23',	'',	0),
(1354,	'verbrauch',	'classes/verbrauch.php',	'de',	'0315',	'2015-04-22 05:12:39',	'',	0),
(1355,	'datapass',	'http://datapass.de/',	'de',	'0315',	'2015-04-23 15:52:46',	'',	0),
(1356,	'report',	'classes/showtab.php?menu=report',	'de',	'0315',	'2015-04-23 16:05:57',	'',	0),
(1357,	'Oberkategorie',	'classes/showtab.php?menu=vo_category',	'de',	'0315',	'2015-05-04 05:48:43',	'',	0),
(1358,	'Aufgabenliste',	'classes/showtab.php?menu=aufgabenliste',	'de',	'0315',	'2015-05-11 18:21:45',	'',	0),
(1359,	'help',	'classes/showtab.php?menu=help',	'de',	'0312',	'2015-07-01 15:58:56',	'',	0),
(1360,	'Häufigkeit',	'classes/showtab.php?menu=haeufigkeit',	'de',	'0312',	'2015-08-09 12:02:50',	'',	0),
(1361,	'Computer',	'classes/showtab.php?menu=computer',	'de',	'0312',	'2015-12-31 13:42:52',	'',	0),
(1371,	'Filly',	'classes/showtab.php?menu=filly',	'de',	'0312',	'2016-01-06 17:02:32',	'',	0),
(1381,	'FillySubmenu',	'	classes/submenushow.php?menu=fillys',	'de',	'0312',	'2016-01-07 07:02:27',	'',	0),
(1391,	'HilfeSubmenu',	'	classes/submenushow.php?menu=hilfe',	'de',	'0312',	'2016-01-07 17:05:06',	'',	0),
(1401,	'Hilfeindex',	'classes/showtab.php?menu=helpindex',	'de',	'0312',	'2016-01-07 17:08:55',	'',	0),
(1411,	'Fillyart',	'classes/showtab.php?menu=fillyart',	'de',	'0312',	'2016-01-11 07:03:18',	'',	0),
(1421,	'Bildart',	'classes/showtab.php?menu=bildart',	'de',	'0312',	'2016-01-11 07:32:10',	'',	0),
(1431,	'Rueckwaerts',	'classes/rueckwaerts.php',	'de',	'0312',	'2016-05-17 15:49:41',	'',	0),
(1441,	'showxml',	'classes/showxml.php',	'de',	'0312',	'2016-07-04 16:19:05',	'',	0),
(1451,	'filemanager',	'classes/showtab.php?menu=filemanager',	'de',	'0312',	'2016-07-06 05:08:50',	'',	0);

DROP TABLE IF EXISTS `tblmenu_projekt`;
CREATE TABLE `tblmenu_projekt` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldbez` varchar(250) NOT NULL,
  `fldaktiv` varchar(1) NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `tblmenu_typ`;
CREATE TABLE `tblmenu_typ` (
  `fldIndex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldBez` varchar(50) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldIndex`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

INSERT INTO `tblmenu_typ` (`fldIndex`, `fldBez`) VALUES
(3,	'MODUL'),
(13,	'PLUGIN'),
(23,	'WEBLINK'),
(24,	'YIIMODUL');

DROP TABLE IF EXISTS `tblnotiz`;
CREATE TABLE `tblnotiz` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `flddatum` datetime NOT NULL,
  `fldnr` varchar(5) COLLATE utf8_bin NOT NULL,
  `fldbez` varchar(500) COLLATE utf8_bin NOT NULL,
  `fldbemerk` varchar(500) COLLATE utf8_bin NOT NULL,
  `fldarchivdat` date NOT NULL,
  `fldstatus` varchar(20) COLLATE utf8_bin NOT NULL,
  `fldart` varchar(20) COLLATE utf8_bin NOT NULL,
  `fldbenutzer` varchar(20) COLLATE utf8_bin NOT NULL,
  `fldid_gruppe` bigint(20) NOT NULL,
  `fldlink` varchar(250) COLLATE utf8_bin NOT NULL,
  `fldTarget` varchar(20) COLLATE utf8_bin NOT NULL,
  `fldfilename` varchar(250) COLLATE utf8_bin NOT NULL,
  `fldid_status` bigint(20) NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


DROP TABLE IF EXISTS `tblorte`;
CREATE TABLE `tblorte` (
  `fldIndex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldKurz` varchar(30) CHARACTER SET latin1 NOT NULL,
  `fldBez` varchar(100) CHARACTER SET latin1 NOT NULL,
  `fldo01typ` text CHARACTER SET latin1 NOT NULL,
  `fldo01pos` int(11) NOT NULL,
  `fldo01parent` bigint(20) NOT NULL,
  `fldzimmer` varchar(100) COLLATE utf8_bin NOT NULL,
  `fldetage` varchar(20) COLLATE utf8_bin NOT NULL,
  `fldsort` varchar(20) COLLATE utf8_bin NOT NULL,
  `fldmoebel` varchar(100) COLLATE utf8_bin NOT NULL,
  `fldstatus` varchar(10) COLLATE utf8_bin NOT NULL,
  `fldproz` int(11) NOT NULL DEFAULT '0',
  `fldind_zimmer` bigint(20) NOT NULL,
  `fldind_moebel` bigint(20) NOT NULL,
  `fldbildid` bigint(20) NOT NULL,
  `fldnummer` varchar(20) COLLATE utf8_bin NOT NULL,
  `fldmaxanz` int(11) NOT NULL,
  `fldid_etagen` bigint(20) NOT NULL,
  `fldid_benutzer` bigint(20) NOT NULL,
  `fldprior` int(11) NOT NULL,
  `fldid_status` bigint(20) NOT NULL,
  `fldbemerk` varchar(250) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldIndex`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


DROP TABLE IF EXISTS `tblorttyp`;
CREATE TABLE `tblorttyp` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldbez` varchar(20) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


DROP TABLE IF EXISTS `tblpoll_umfragen`;
CREATE TABLE `tblpoll_umfragen` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldkurz` varchar(20) COLLATE utf8_bin NOT NULL,
  `fldbez` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


DROP TABLE IF EXISTS `tblprgupdate`;
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


DROP TABLE IF EXISTS `tblprior`;
CREATE TABLE `tblprior` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldprior` int(11) NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


DROP TABLE IF EXISTS `tblpublictyp`;
CREATE TABLE `tblpublictyp` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldbez` varchar(250) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


DROP TABLE IF EXISTS `tblrechdat`;
CREATE TABLE `tblrechdat` (
  `fldIndex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldBez` varchar(200) COLLATE utf8_bin NOT NULL,
  `fldLink` varchar(250) COLLATE utf8_bin NOT NULL,
  `fldBemerkung` varchar(250) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldIndex`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


DROP TABLE IF EXISTS `tblrechnungen`;
CREATE TABLE `tblrechnungen` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldbez` varchar(250) COLLATE utf8_bin NOT NULL,
  `flddatum` date NOT NULL,
  `fldfilename` varchar(250) COLLATE utf8_bin NOT NULL,
  `fldid_adr` bigint(20) NOT NULL,
  `fldbetrag` decimal(10,2) NOT NULL,
  `flddbsyncstatus` varchar(10) COLLATE utf8_bin NOT NULL DEFAULT 'SYNC',
  PRIMARY KEY (`fldindex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


DROP TABLE IF EXISTS `tblreisegrp`;
CREATE TABLE `tblreisegrp` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldbez` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


DROP TABLE IF EXISTS `tblreports`;
CREATE TABLE `tblreports` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldbez` varchar(50) COLLATE utf8_bin NOT NULL,
  `fldkurz` varchar(20) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


DROP TABLE IF EXISTS `tblresyncalltyp`;
CREATE TABLE `tblresyncalltyp` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldbez` varchar(250) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


DROP TABLE IF EXISTS `tblrezepte`;
CREATE TABLE `tblrezepte` (
  `fldIndex` int(11) NOT NULL AUTO_INCREMENT,
  `fldBez` varchar(250) NOT NULL,
  `fldLink` varchar(250) NOT NULL,
  `fldid_status` bigint(20) NOT NULL,
  `fldfilename` varchar(250) NOT NULL,
  PRIMARY KEY (`fldIndex`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `tblsel`;
CREATE TABLE `tblsel` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldbez` varchar(1) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


DROP TABLE IF EXISTS `tblstamm_typ`;
CREATE TABLE `tblstamm_typ` (
  `fldIndex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldBez` varchar(200) COLLATE utf8_bin NOT NULL,
  `fldTyp` varchar(20) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldIndex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


DROP TABLE IF EXISTS `tblstatus`;
CREATE TABLE `tblstatus` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldbez` varchar(20) COLLATE utf8_bin NOT NULL,
  `fldtyp` varchar(10) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

INSERT INTO `tblstatus` (`fldindex`, `fldbez`, `fldtyp`) VALUES
(1,	'(ohne)',	''),
(2,	'offen',	''),
(3,	'erledigt',	''),
(4,	'zurueckges',	''),
(6,	'klaeren',	''),
(7,	'in Arbeit',	''),
(8,	'spaeter',	''),
(9,	'Aufgabe',	''),
(14,	'zugesagt',	''),
(24,	'OK',	''),
(25,	'geantwortet',	''),
(26,	'Retour',	''),
(27,	'Neu',	''),
(31,	'verschickt',	''),
(41,	'Fehler',	''),
(51,	'Zusage',	'');

DROP TABLE IF EXISTS `tblstat_grp`;
CREATE TABLE `tblstat_grp` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldbezgrp` varchar(250) NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `tblstat_zuord`;
CREATE TABLE `tblstat_zuord` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldid_grp` bigint(20) NOT NULL,
  `fldid_status` bigint(20) NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `tblstdplan`;
CREATE TABLE `tblstdplan` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldid_std` bigint(20) NOT NULL,
  `fldid_wotag` bigint(20) NOT NULL,
  `fldbez` varchar(250) NOT NULL,
  `fldid_user` bigint(20) NOT NULL,
  `fldnr` varchar(3) NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `tblstdwotag`;
CREATE TABLE `tblstdwotag` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldspalte` varchar(5) NOT NULL,
  `fldbez` varchar(250) NOT NULL,
  `fldfarbe` varchar(8) NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `tblstdzeit`;
CREATE TABLE `tblstdzeit` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldbez` varchar(20) NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `tblsynccomp`;
CREATE TABLE `tblsynccomp` (
  `fldIndex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldHost` varchar(80) COLLATE utf8_bin NOT NULL,
  `fldIPAddr` varchar(15) COLLATE utf8_bin NOT NULL,
  `fldSyncart` varchar(10) COLLATE utf8_bin NOT NULL,
  `fldaktiv` varchar(1) COLLATE utf8_bin NOT NULL,
  `flddbname` varchar(100) COLLATE utf8_bin NOT NULL,
  `fldusername` varchar(50) COLLATE utf8_bin NOT NULL,
  `fldpassword` varchar(50) COLLATE utf8_bin NOT NULL,
  `fldcloud` varchar(1) COLLATE utf8_bin NOT NULL,
  `fldlocal` varchar(1) COLLATE utf8_bin NOT NULL,
  `fldremotepfad` varchar(250) COLLATE utf8_bin NOT NULL,
  `flddbtyp` varchar(50) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldIndex`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


DROP TABLE IF EXISTS `tblsynctyp`;
CREATE TABLE `tblsynctyp` (
  `fldIndex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldBez` varchar(100) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldIndex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


DROP TABLE IF EXISTS `tbltables`;
CREATE TABLE `tbltables` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldbez` varchar(250) NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `tbltabletten`;
CREATE TABLE `tbltabletten` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldbez` varchar(250) COLLATE utf8_bin NOT NULL,
  `fldvondatum` date NOT NULL,
  `fldanztage` int(11) NOT NULL,
  `fldbisdatum` date NOT NULL,
  `fldAnztab` int(11) NOT NULL,
  `fldDosierung` decimal(10,2) NOT NULL,
  `flddosmorgens` decimal(10,2) NOT NULL,
  `flddosmittags` decimal(10,2) NOT NULL,
  `flddosabends` decimal(10,2) NOT NULL,
  `flddosnachts` decimal(10,2) NOT NULL,
  `fldid_user` bigint(20) NOT NULL,
  `fldme` varchar(200) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


DROP TABLE IF EXISTS `tbltc_gepaeck`;
CREATE TABLE `tbltc_gepaeck` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldbez` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


DROP TABLE IF EXISTS `tbltc_grund`;
CREATE TABLE `tbltc_grund` (
  `fldIndex` int(11) NOT NULL AUTO_INCREMENT,
  `fldBez` varchar(250) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldIndex`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


DROP TABLE IF EXISTS `tbltc_kosten`;
CREATE TABLE `tbltc_kosten` (
  `fldIndex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldid_reise` bigint(20) NOT NULL,
  `fldBez` varchar(250) NOT NULL,
  `fldPreis` decimal(18,2) NOT NULL,
  `fldLink` varchar(250) NOT NULL,
  PRIMARY KEY (`fldIndex`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `tbltc_liste`;
CREATE TABLE `tbltc_liste` (
  `fldIndex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldBez` varchar(250) COLLATE utf8_bin NOT NULL,
  `fldVondatum` date NOT NULL,
  `fldBisdatum` date NOT NULL,
  `fldid_grund` bigint(20) NOT NULL,
  PRIMARY KEY (`fldIndex`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


DROP TABLE IF EXISTS `tbltc_reiseliste`;
CREATE TABLE `tbltc_reiseliste` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldbez` varchar(255) COLLATE utf8_bin NOT NULL,
  `fldgepaeck` varchar(50) COLLATE utf8_bin NOT NULL,
  `fldreisegrp` varchar(100) COLLATE utf8_bin NOT NULL,
  `fldstatus` varchar(20) COLLATE utf8_bin NOT NULL,
  `fldid_benutzer` bigint(20) NOT NULL,
  `fldid_gepaeck` bigint(20) NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


DROP TABLE IF EXISTS `tbltc_status`;
CREATE TABLE `tbltc_status` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldbez` varchar(20) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


DROP TABLE IF EXISTS `tbltermine_grp`;
CREATE TABLE `tbltermine_grp` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldbez` varchar(250) COLLATE utf8_bin NOT NULL,
  `fldfarbe` varchar(10) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


DROP TABLE IF EXISTS `tbltermine_liste`;
CREATE TABLE `tbltermine_liste` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldbez` varchar(250) COLLATE utf8_bin NOT NULL,
  `fldkurz` varchar(100) COLLATE utf8_bin NOT NULL,
  `fldvondatum` date NOT NULL,
  `fldvonuhrzeit` time NOT NULL,
  `fldbisdatum` date NOT NULL,
  `fldbisuhrzeit` time NOT NULL,
  `fldid_terminegrp` bigint(20) NOT NULL,
  `fldfarbe` varchar(10) COLLATE utf8_bin NOT NULL,
  `fldid_terminserie` bigint(20) NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


DROP TABLE IF EXISTS `tbltermine_serie`;
CREATE TABLE `tbltermine_serie` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldbez` varchar(250) COLLATE utf8_bin NOT NULL,
  `fldfarbe` varchar(10) COLLATE utf8_bin NOT NULL,
  `fldimagepfad` varchar(250) COLLATE utf8_bin NOT NULL,
  `fldsel` varchar(1) COLLATE utf8_bin NOT NULL DEFAULT 'J',
  PRIMARY KEY (`fldindex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


DROP TABLE IF EXISTS `tbltranslate`;
CREATE TABLE `tbltranslate` (
  `fldIndex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldLang` varchar(5) COLLATE utf8_bin NOT NULL,
  `fldBez` varchar(250) COLLATE utf8_bin NOT NULL,
  `fldName` varchar(200) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldIndex`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


DROP TABLE IF EXISTS `tbltrigger`;
CREATE TABLE `tbltrigger` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldbez` varchar(100) COLLATE utf8_bin NOT NULL,
  `fldid_computer` bigint(20) NOT NULL,
  `fldsettrigger` varchar(1) COLLATE utf8_bin NOT NULL,
  `fldtxttrigger` varchar(4096) COLLATE utf8_bin NOT NULL,
  `fldAnz` int(11) NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


DROP TABLE IF EXISTS `tbluserrotate`;
CREATE TABLE `tbluserrotate` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldid_vonuser` bigint(20) NOT NULL,
  `fldid_nachuser` bigint(20) NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


DROP TABLE IF EXISTS `tblverbesserung`;
CREATE TABLE `tblverbesserung` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `flddatum` datetime NOT NULL,
  `flduser` varchar(50) COLLATE utf8_bin NOT NULL,
  `fldbez` varchar(512) COLLATE utf8_bin NOT NULL,
  `fldstatus` varchar(20) COLLATE utf8_bin NOT NULL,
  `flddsstatus` varchar(20) COLLATE utf8_bin NOT NULL DEFAULT 'NEW',
  `flddelete` varchar(1) COLLATE utf8_bin NOT NULL DEFAULT 'N',
  `fldvorschlag` varchar(250) COLLATE utf8_bin NOT NULL,
  `fldprior` tinyint(4) NOT NULL DEFAULT '0',
  `fldloesung` varchar(250) COLLATE utf8_bin NOT NULL,
  `flderldat` date NOT NULL DEFAULT '1900-01-01',
  `fldarchivdat` date NOT NULL DEFAULT '1900-01-01',
  PRIMARY KEY (`fldindex`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


DELIMITER ;;

CREATE TRIGGER `tblverbesserung_ai` AFTER INSERT ON `tblverbesserung` FOR EACH ROW
insert into dbsync.tbldbsync(fldtblindex,flddbname,fldtblname,fldstatus) values (new.fldIndex,'dbWebportal','tblverbesserung','INS');;

CREATE TRIGGER `tblverbesserung_au` AFTER UPDATE ON `tblverbesserung` FOR EACH ROW
insert into dbsync.tbldbsync(fldtblindex,flddbname,fldtblname,fldstatus) values (new.fldIndex,'dbWebportal','tblverbesserung','UPD');;

CREATE TRIGGER `tblverbesserung_ad` AFTER DELETE ON `tblverbesserung` FOR EACH ROW
insert into dbsync.tbldbsync(fldtblindex,flddbname,fldtblname,fldstatus) values (old.fldIndex,'dbWebportal','tblverbesserung','DEL');;

DELIMITER ;

DROP TABLE IF EXISTS `tblverpack`;
CREATE TABLE `tblverpack` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldbez` varchar(250) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


DROP TABLE IF EXISTS `tblversion`;
CREATE TABLE `tblversion` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldbez` varchar(250) COLLATE utf8_bin NOT NULL,
  `fldkurz` varchar(5) COLLATE utf8_bin NOT NULL,
  `flddatum` date NOT NULL,
  `fldversion` varchar(10) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

INSERT INTO `tblversion` (`fldindex`, `fldbez`, `fldkurz`, `flddatum`, `fldversion`) VALUES
(1,	'Version 3.12',	'0312',	'2014-10-20',	'0.312'),
(2,	'Version 3.15',	'0315',	'2015-01-06',	'0.315');

DROP TABLE IF EXISTS `tblvorrat`;
CREATE TABLE `tblvorrat` (
  `fldIndex` bigint(20) NOT NULL AUTO_INCREMENT,
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
  `fldartikelnr` int(11) NOT NULL,
  `fldid_anzme` bigint(20) NOT NULL,
  PRIMARY KEY (`fldIndex`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


DROP TABLE IF EXISTS `tblvorschlaege`;
CREATE TABLE `tblvorschlaege` (
  `fldIndex` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `fldBez` char(80) DEFAULT '0',
  `fldBenutzer` char(20) DEFAULT NULL,
  `fldDatum` char(16) DEFAULT NULL,
  `fldStatus` char(10) DEFAULT 'Neu',
  PRIMARY KEY (`fldIndex`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `tblvo_category`;
CREATE TABLE `tblvo_category` (
  `fldIndex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldBez` varchar(250) NOT NULL,
  `fldSort` varchar(20) NOT NULL,
  `fldProz` int(11) NOT NULL,
  `fldid_obercat` bigint(20) NOT NULL,
  PRIMARY KEY (`fldIndex`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `tblvo_obercategory`;
CREATE TABLE `tblvo_obercategory` (
  `fldIndex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldBez` varchar(250) NOT NULL,
  `fldSort` varchar(20) NOT NULL,
  `fldProz` int(11) NOT NULL,
  PRIMARY KEY (`fldIndex`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `tblvo_usercategory`;
CREATE TABLE `tblvo_usercategory` (
  `fldIndex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldid_user` bigint(20) NOT NULL,
  `fldid_category` bigint(20) NOT NULL,
  `fldProz` int(11) NOT NULL,
  `fldid_zimmer` bigint(20) NOT NULL,
  PRIMARY KEY (`fldIndex`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `tblwaehrungen`;
CREATE TABLE `tblwaehrungen` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldwaehrung` varchar(10) COLLATE utf8_bin NOT NULL,
  `fldbez` varchar(250) COLLATE utf8_bin NOT NULL,
  `fldkurs` decimal(10,2) NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


DROP TABLE IF EXISTS `tblwunschliste`;
CREATE TABLE `tblwunschliste` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldbez` varchar(250) COLLATE utf8_bin NOT NULL,
  `fldlink` varchar(250) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


DROP TABLE IF EXISTS `tblzeitpunkt`;
CREATE TABLE `tblzeitpunkt` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldbez` varchar(100) COLLATE utf8_bin NOT NULL,
  `fldvonuhrzeit` time NOT NULL,
  `fldbisuhrzeit` time NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


DROP TABLE IF EXISTS `tblzeitraum`;
CREATE TABLE `tblzeitraum` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldbez` varchar(10) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


DROP TABLE IF EXISTS `tblzutaten`;
CREATE TABLE `tblzutaten` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldid_rezepte` bigint(20) NOT NULL,
  `fldid_grundartikel` bigint(20) NOT NULL,
  `fldmenge` varchar(50) NOT NULL,
  `fldid_me` bigint(20) NOT NULL,
  `fldbez` varchar(250) NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `tblzwieart`;
CREATE TABLE `tblzwieart` (
  `fldart` varchar(20) COLLATE utf8_bin NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


-- 2016-07-16 14:45:15
