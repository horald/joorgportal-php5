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


DROP TABLE IF EXISTS `tblbilder`;
CREATE TABLE `tblbilder` (
  `fldIndex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldb01bez` varchar(200) NOT NULL,
  `fldb01bild` blob NOT NULL,
  `fldb01filetype` varchar(10) NOT NULL,
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
  PRIMARY KEY (`fldIndex`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


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


DROP TABLE IF EXISTS `tblhelp`;
CREATE TABLE `tblhelp` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldbez` varchar(50) NOT NULL,
  `fldtyp` varchar(20) NOT NULL,
  `fldsort` varchar(10) NOT NULL,
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
  `fldIndex` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `fldDatum` date NOT NULL,
  `fldUhrzeit` time NOT NULL,
  `fldPos` int(11) NOT NULL,
  `fldBez` varchar(250) CHARACTER SET latin1 NOT NULL,
  `fldArt` varchar(1) CHARACTER SET latin1 NOT NULL,
  `fldKonto` varchar(20) CHARACTER SET latin1 NOT NULL,
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
  PRIMARY KEY (`fldIndex`)
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
  PRIMARY KEY (`fldIndex`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


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


DROP TABLE IF EXISTS `tblsynctyp`;
CREATE TABLE `tblsynctyp` (
  `fldIndex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldBez` varchar(100) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldIndex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


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


DROP TABLE IF EXISTS `tblzwiegespraech`;
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


-- 2015-07-30 15:50:37
