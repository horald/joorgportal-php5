CREATE TABLE `temp` (
  `nidentid` int(11) NOT NULL,
  `nlfdevent` int(11) NOT NULL,
  `szelle` varchar(15) NOT NULL,
  `nanzbelegt` int(11) NOT NULL,
  `ndatum` varchar(8) NOT NULL,
  `nbelegt` float NOT NULL,
  `nanzspalten` int(11) NOT NULL default '0',
  `nposbelegt` int(11) NOT NULL default '0'
);

CREATE TABLE `event` (
  `nlfdevent` int(11) NOT NULL auto_increment,
  `seventbez` varchar(255) NOT NULL,
  `seventbeschreibung` longtext,
  `scolor` varchar(15) NOT NULL default '3300ff',
  `dtvon` timestamp NOT NULL default '0000-00-00 00:00:00' on update CURRENT_TIMESTAMP,
  `dtbis` timestamp NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`nlfdevent`)
);