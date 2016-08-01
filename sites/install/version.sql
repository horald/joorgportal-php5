-- Adminer 4.1.0 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

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

-- 2016-07-16 14:13:43
