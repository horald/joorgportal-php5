DROP TABLE IF EXISTS #__joorgportal;
 
CREATE TABLE #__joorgportal (
  id int(11) NOT NULL AUTO_INCREMENT,
  bemvindo varchar(25) NOT NULL,
  fldbez varchar(25) NOT NULL,
  fldlink varchar(250) NOT NULL,
  catid int(11) NOT NULL DEFAULT '0',
  params TEXT NOT NULL DEFAULT '',
   PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;
 
INSERT INTO `#__joorgportal` (bemvindo,fldlink) VALUES
        ('Erledigung','http://localhost:8080/wp/joorgportal30/classes/showtab.php?menu=tasks');
INSERT INTO `#__joorgportal` (bemvindo,fldlink) VALUES
        ('Einkaufsliste','');
