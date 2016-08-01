-- Adminer 4.1.0 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

CREATE TABLE `tblabteilung` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldAbteilung` varchar(80) CHARACTER SET latin1 COLLATE latin1_german1_ci NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `tblabteilung` (`fldindex`, `fldAbteilung`) VALUES
(1,	'Brotwaren'),
(2,	'Milchprodukte'),
(3,	'Getraenke'),
(4,	'Obst / Gemuese'),
(5,	'Gewuerze'),
(6,	'(ohne)'),
(7,	'Mehl / Zucker'),
(8,	'Kaffee / Tee'),
(9,	'Konserven'),
(10,	'TiefkÃƒÂ¼hlkost'),
(11,	'002 Marmelade / Muesli');

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


CREATE TABLE `tbladr_group` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldbez` varchar(250) COLLATE utf8_bin NOT NULL,
  `fldtyp` varchar(20) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

INSERT INTO `tbladr_group` (`fldindex`, `fldbez`, `fldtyp`) VALUES
(3,	'Privat',	''),
(13,	'Rechtsschutz',	''),
(23,	'Beschenkte',	''),
(33,	'(ohne)',	''),
(43,	'Bekannte Christiane',	''),
(53,	'Bekannte Horst',	''),
(63,	'Folkband Ohrensausen',	''),
(73,	'Quasselstrippe',	''),
(83,	'Familie Dreger',	''),
(93,	'Familie Meyer KÃ¶ln',	''),
(103,	'Kindergarten',	''),
(113,	'Arbeit',	''),
(123,	'Bekannte Frieda',	''),
(133,	'Krankenhaus',	''),
(143,	'UnvollstÃ¤ndig',	''),
(144,	'Geburtstagsfeier Horst',	''),
(223,	'Geburtstagsfeier Horst',	''),
(153,	'Firmen',	''),
(163,	'Auto',	'AUTO'),
(173,	'Friend',	''),
(183,	'Rechnungen',	'RECH'),
(193,	'Adressliste Reise',	''),
(203,	'Krankenkasse',	''),
(213,	'Familiencafe',	''),
(224,	'Lohnsteuerverein',	'LOHNSTEUER'),
(225,	'Arm trotz Arbeit',	''),
(226,	'FlÃ¼chtlingsarbeit',	''),
(231,	'FlÃ¼chtlingeInternetAG',	'');

CREATE TABLE `tbladr_grpdetail` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldgrp_ind` bigint(20) NOT NULL,
  `fldbez` varchar(250) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


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

INSERT INTO `tbladr_liste` (`fldindex`, `fldid_group`, `fldid_typ`, `fldfirstname`, `fldlastname`, `fldcompany`, `fldbriefanrede`, `fldanrede`, `fldstreet`, `fldplz`, `fldtown`, `fldtelefon`, `fldhandy`, `fldemail`, `fldbemerk`, `fldoeffnungszeiten`, `fldstatus`, `flderfdatum`) VALUES
(3,	0,	3,	'Horst',	'Meyer',	'Mauser Werke',	'Sehr geehrter',	'Herr',	'Merkenicher Hauptstr. 160',	'50769',	'KÃ¶ln',	'0221/5302037',	'',	'',	'',	'',	'offen',	'0000-00-00'),
(443,	0,	13,	'',	'Krankenhaus',	'',	'',	'',	'Am Knappschaftskrankenhaus 1',	'44309',	'Dortmund',	'',	'',	'',	'ehem.Wieckesweg 27',	'',	'',	'0000-00-00'),
(13,	0,	3,	'Ralf',	'Beckers',	'Schule',	'Sehr geehrter',	'Herr',	'Moselstr. 10-12',	'50354',	'HÃ¼rth-Efferen',	'02233/6279892',	'0151 25570242',	'milkabaer@yahoo.de',	'Weizenbier',	'',	'offen',	'0000-00-00'),
(23,	0,	3,	'Christiane',	'Meyer',	'Kliniken der Stadt KÃ¶ln Krankenhaus Merheim',	'',	'',	'Merkenicher Hauptstr. 160',	'50769',	'KÃ¶ln',	'',	'',	'',	'',	'',	'offen',	'0000-00-00'),
(33,	0,	3,	'Hadwig',	'Fonfara',	'',	'',	'',	'Schulstr.29',	'51103',	'KÃ¶ln',	'0221/872901',	'',	'',	'.',	'',	'offen',	'0000-00-00'),
(43,	0,	3,	'Edgar',	'Meyer',	'',	'',	'',	'Siegenerstr.55',	'65936',	'Frankfurt',	'',	'',	'',	'',	'',	'',	'0000-00-00'),
(53,	0,	3,	'Erna',	'Meyer',	'',	'',	'',	'Auf dem Dreieck 4',	'53567',	'Asbach / Ww',	'02683/4715',	'0160 4157005',	'',	'.',	'',	'zugesagt',	'0000-00-00'),
(73,	0,	3,	'Hartmut',	'Schulte',	'',	'',	'',	'MÃƒÂ¼hlentorweg 4a',	'59174',	'Kamen',	'02307/72613',	'',	'',	'',	'',	'',	'0000-00-00'),
(83,	0,	3,	'Brigitte',	'Schulte',	'',	'',	'',	'MÃƒÂ¼hlentorweg 4a',	'59174',	'Kamen',	'02307/72613',	'',	'',	'',	'',	'',	'0000-00-00'),
(93,	0,	3,	'Rahel',	'Gessat',	'',	'',	'',	'Maria-Hilf-Str. 19',	'50669',	'KÃ¶ln',	'0221/2704330',	'',	'',	'.',	'',	'offen',	'0000-00-00'),
(103,	0,	3,	'Dagmar',	'LiÃƒÅ¸ke',	'',	'',	'',	'MachabÃƒÂ¤erstr. 73',	'50668',	'KÃƒÂ¶ln',	'0221/131806',	'',	'',	'.',	'',	'zugesagt',	'0000-00-00'),
(113,	0,	3,	'Sabine',	'Dreger',	'',	'Liebe',	'',	'Bertold-Brecht-StraÃŸe 1/1',	'71093',	'Weil im SchÃ¶nbuch',	'07157/523879',	'0160 7868172',	'sabine@dregers.de',	'',	'',	'offen',	'0000-00-00'),
(123,	0,	3,	'Manfred',	'Losse',	'',	'',	'',	'Tilsiter Str. 37',	'50259',	'Pulheim Brauweiler',	'02234/484784',	'',	'',	'.',	'',	'zugesagt',	'0000-00-00'),
(133,	0,	3,	'Horst',	'Jewanski',	'',	'',	'Herr',	'HochstraÃŸe 86',	'41372',	'NiederkrÃ¼chten',	'',	'',	'',	'.',	'',	'offen',	'0000-00-00'),
(143,	0,	3,	'Angelika',	'Weber',	'',	'',	'',	'Moselstr. 2',	'50859',	'KÃ¶ln Frechen',	'02234/70894',	'',	'',	'.',	'',	'offen',	'1970-01-01'),
(153,	0,	3,	'Frieda Lina',	'Meyer',	'',	'',	'',	'Merkenicher Hauptstr. 160',	'50769',	'KÃƒÂ¶ln',	'',	'0172',	'frieda.meyer@horald.de',	'',	'',	'',	'0000-00-00'),
(163,	0,	3,	'Ruth',	'Krabbe',	'',	'',	'',	'Clevischer Ring 93-95',	'51063',	'KÃƒÂ¶ln',	'0221/4200060',	'',	'',	'',	'',	'',	'0000-00-00'),
(173,	0,	3,	'Harry',	'Dreger',	'',	'',	'',	'Bertold-Brecht-StraÃƒÅ¸e 1/1',	'71093',	'Weil im SchÃƒÂ¶nbuch',	'07157/523879',	'',	'',	'',	'',	'',	'0000-00-00'),
(183,	0,	3,	'Antonia',	'Dreger',	'',	'',	'',	'',	'',	'KÃ¶ln',	'',	'',	'',	'',	'',	'offen',	'2015-08-19'),
(193,	0,	3,	'Damaris',	'Dreger',	'',	'',	'',	'Bertold-Brecht-StraÃƒÅ¸e 1/1',	'71093',	'Weil im SchÃƒÂ¶nbuch',	'07157/523879',	'',	'',	'',	'',	'',	'0000-00-00'),
(203,	0,	3,	'Louis',	'Dreger',	'',	'',	'',	'Bertold-Brecht-StraÃƒÅ¸e 1/1',	'71093',	'Weil im SchÃƒÂ¶nbuch',	'07157/523879',	'',	'',	'',	'',	'',	'0000-00-00'),
(213,	0,	3,	'Orell',	'Schulte',	'',	'',	'',	'Ostkamp 40',	'59174',	'Kamen',	'02307/970275',	'',	'',	'',	'',	'',	'0000-00-00'),
(223,	0,	3,	'Sylvia',	'Schulte',	'',	'',	'',	'Ostkamp 40',	'59174',	'Kamen',	'02307/970275',	'',	'',	'',	'',	'',	'0000-00-00'),
(233,	0,	3,	'Gerrit',	'Schulte',	'',	'',	'',	'Ostkamp 40',	'59174',	'Kamen',	'02307/970275',	'',	'',	'',	'',	'',	'0000-00-00'),
(243,	0,	3,	'Martin',	'LiÃƒÅ¸ke',	'',	'',	'',	'MachabÃƒÂ¤erstr. 73',	'50668',	'KÃƒÂ¶ln',	'0221/131806',	'',	'',	'.',	'',	'zugesagt',	'0000-00-00'),
(253,	0,	3,	'Anja',	'Sauerland',	'',	'',	'Frau',	'',	'',	'KÃƒÂ¶ln',	'',	'0177-2782243',	'',	'',	'',	'',	'0000-00-00'),
(263,	0,	3,	'Joy',	'Ralfs Freundin',	'',	'',	'',	'Moselstr. 10-12',	'50354',	'HÃƒÂ¼rth-Efferen',	'02233/6279892',	'',	'',	'Limo',	'',	'zugesagt',	'0000-00-00'),
(273,	0,	3,	'Eva',	'Esche',	'',	'',	'',	'Merheimerstr. 210',	'50733',	'KÃƒÂ¶ln',	'0221/733573',	'',	'',	'',	'',	'',	'0000-00-00'),
(283,	0,	3,	'Hans',	'von Orth',	'',	'',	'',	'',	'',	'KÃƒÂ¶ln',	'',	'0172 2989359',	'',	'.',	'',	'abgesagt',	'0000-00-00'),
(293,	0,	3,	'Nina',	'RÃƒÂ¶thlein',	'',	'',	'',	'Merkenicher Hauptstr. 150d',	'50769',	'KÃƒÂ¶ln',	'0221/9228721',	'',	'',	'',	'',	'',	'0000-00-00'),
(303,	0,	3,	'Lili-Sue',	'Engel',	'',	'',	'',	'Dantestrasse 23',	'',	'Dormagen-Nievenheim',	'',	'',	'',	'',	'',	'',	'0000-00-00'),
(313,	0,	3,	'Andrea',	'Dahmann',	'',	'',	'',	'GÃƒÂ¶theallee 14b',	'01309',	'Dresden',	'03513/125026',	'',	'',	'',	'',	'',	'0000-00-00'),
(323,	0,	3,	'Hildegard',	'Daut',	'',	'',	'',	'Merkenicher Hauptstr. 205',	'50769',	'KÃƒÂ¶ln',	'',	'',	'',	'',	'',	'',	'0000-00-00'),
(333,	0,	3,	'Gudrun',	'Schauer',	'',	'',	'',	'Hundsdorf 51',	'94136',	'Thyrnau',	'08501495',	'',	'',	'',	'',	'',	'0000-00-00'),
(343,	0,	3,	'Iris',	'Burmeister',	'',	'',	'',	'Wormersdorferstr. 71',	'53359',	'Rheinbach',	'0222/57099844',	'',	'',	'',	'',	'',	'0000-00-00'),
(353,	0,	3,	'Klaus',	'Pannier',	'',	'',	'',	'In der Pietsch 13a',	'21224',	'Rosengarten',	'04108490698',	'',	'',	'',	'',	'',	'0000-00-00'),
(363,	0,	3,	'Mareike',	'Hoffmann',	'',	'',	'',	'SÃƒÂ¼danlage 7a',	'35390',	'Giessen',	'0641/41501',	'',	'',	'',	'',	'',	'0000-00-00'),
(373,	0,	3,	'Sandra',	'Witzig',	'',	'',	'',	'St. TÃƒÂ¶nnis StraÃƒÅ¸e 95',	'50769',	'KÃƒÂ¶ln',	'0221/7127673',	'',	'',	'',	'',	'',	'0000-00-00'),
(383,	0,	3,	'Siggy',	'PlÃƒÂ¼ckhan',	'',	'',	'',	'Martinstr. 30',	'53332',	'Bornheim-Merten',	'02227923060',	'',	'',	'',	'',	'',	'0000-00-00'),
(393,	0,	3,	'Anette',	'Heidkam',	'',	'',	'',	'Am Weingardsberg 1',	'51143',	'Porz-Langel',	'02203/86219',	'',	'',	'',	'',	'',	'0000-00-00'),
(403,	0,	3,	'Frederike',	'Pannier',	'',	'',	'',	'In der Pietsch 13a',	'21224',	'Rosengarten',	'04108490698',	'',	'',	'',	'',	'',	'0000-00-00'),
(413,	0,	3,	'Sabine',	'Becker',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'0000-00-00'),
(433,	0,	3,	'Firma',	'Mauser-Werke GmbH',	'Mauser-Werke GmbH',	'',	'',	'SchildgesstraÃƒÅ¸e 71-163',	'',	'50321 BrÃƒÂ¼hl',	'',	'',	'',	' ',	'',	'',	'0000-00-00'),
(863,	0,	0,	'Deborah',	'Wolf',	'',	'',	'',	'Vogelsangerweg 25',	'50354',	'HÃƒÂ¼rth',	'02233/7130847',	'',	'',	'.',	'',	'zugesagt',	'0000-00-00'),
(853,	0,	0,	'Andreas',	'Wolf',	'',	'',	'',	'Vogelsangerweg 25',	'50354',	'HÃƒÂ¼rth',	'02233/7130847',	'01733263545',	'andi-wolf@gmx.de',	'.',	'',	'zugesagt',	'0000-00-00'),
(763,	0,	0,	'Pong',	'Sohn von Ralf',	'',	'',	'',	'Moselstr. 10-12',	'50354',	'HÃƒÂ¼rth-Efferen',	'02233/6279892',	'',	'',	'Cola',	'',	'zugesagt',	'0000-00-00'),
(923,	0,	0,	'Ruben',	'Baucks',	'',	'',	'',	'',	'50769',	'KÃƒÂ¶ln',	'0221/4719263',	'',	'',	'.',	'',	'abgesagt',	'0000-00-00'),
(913,	0,	0,	'Noel',	'Baucks',	'',	'',	'',	'',	'50769',	'KÃƒÂ¶ln',	'0221/4719263',	'',	'',	'.',	'',	'abgesagt',	'0000-00-00'),
(903,	0,	0,	'Xaver',	'Baucks',	'',	'',	'',	'',	'50769',	'KÃƒÂ¶ln',	'0221/4719263',	'',	'',	'.',	'',	'abgesagt',	'0000-00-00'),
(893,	0,	0,	'Gundolf',	'Baucks',	'',	'',	'',	'',	'50769',	'KÃƒÂ¶ln',	'0221/4719263',	'',	'',	'.',	'',	'abgesagt',	'0000-00-00'),
(883,	0,	0,	'Miriam',	'Baucks',	'',	'',	'',	'',	'50769',	'KÃƒÂ¶ln',	'0221/4719263',	'',	'',	'.',	'',	'abgesagt',	'0000-00-00'),
(793,	0,	0,	'Lewin',	'Gessat',	'',	'',	'',	'Maria-Hilf-Str. 19',	'50669',	'KÃƒÂ¶ln',	'0221/2704330',	'',	'',	'.',	'',	'zugesagt',	'0000-00-00'),
(843,	0,	0,	'Wiebke',	'Mandt',	'',	'',	'',	'Aegidienbergerstr.9',	'50939',	'KÃƒÂ¶ln',	'0221/2780695',	'',	'',	'.',	'',	'versendet',	'0000-00-00'),
(803,	0,	0,	'Markus',	'Schulz',	'',	'',	'',	'Am HÃƒÂ¶fenweg 41',	'50769',	'KÃƒÂ¶ln',	'0221/7001519',	'',	'',	'Bier',	'',	'zugesagt',	'0000-00-00'),
(873,	0,	0,	'Christa',	'aus der Wieschen',	'',	'',	'',	'Diesterwegstr. 6',	'51109',	'KÃƒÂ¶ln',	'0221/98931874',	'',	'',	'.',	'',	'zugesagt',	'0000-00-00'),
(783,	0,	0,	'JÃƒÂ¼rgen',	'Weber',	'',	'',	'',	'Moselstr. 2',	'50859',	'KÃƒÂ¶ln Frechen',	'02234/70894',	'',	'',	'.',	'',	'zugesagt',	'0000-00-00'),
(733,	0,	0,	'Werner',	'Hippmann',	'',	'',	'',	'',	'50259',	'Pulheim Brauweiler',	'',	'',	'',	'.',	'',	'abgesagt',	'0000-00-00'),
(833,	0,	0,	'Birgit',	'Losse',	'',	'',	'',	'Tilsiter Str. 37',	'50259',	'Pulheim Brauweiler',	'02234/484784',	'',	'',	'.',	'',	'zugesagt',	'0000-00-00'),
(63,	0,	3,	'Heinz',	'Meyer',	'',	'',	'',	'Auf dem Dreieck 4',	'53567',	'Asbach / Ww',	'02683/4715',	'0162 6025335',	'',	'Teilchen',	'',	'zugesagt',	'0000-00-00'),
(943,	0,	0,	'Beate',	'',	'',	'',	'',	'',	'',	'KÃƒÂ¶ln',	'',	'',	'',	'Quiche',	'',	'zugesagt',	'0000-00-00'),
(963,	0,	0,	'Olaf',	'Bach',	'',	'',	'',	'Cleverstr. 28',	'',	'KÃƒÂ¶ln',	'0221/1396933',	'',	'',	'',	'',	'zugesagt',	'0000-00-00'),
(953,	0,	0,	'Meike',	'Bach',	'',	'',	'',	'Cleverstr. 28',	'',	'KÃƒÂ¶ln',	'0221/1396933',	'',	'',	'',	'',	'zugesagt',	'0000-00-00'),
(813,	0,	0,	'Dorothea',	'Schulz',	'',	'',	'',	'Am HÃƒÂ¶fenweg 41',	'50769',	'KÃƒÂ¶ln',	'0221/7001519',	'',	'',	'Limo',	'',	'zugesagt',	'0000-00-00'),
(773,	0,	0,	'Renate',	'Schulz',	'',	'',	'',	'Am HÃƒÂ¶fenweg 41',	'50769',	'KÃƒÂ¶ln',	'0221/7001519',	'',	'',	'Wasser, Kartoffelsalat',	'',	'zugesagt',	'0000-00-00'),
(823,	0,	0,	'Katharina',	'Schulz',	'',	'',	'',	'Am HÃƒÂ¶fenweg 41',	'50769',	'KÃƒÂ¶ln',	'0221/7001519',	'',	'',	'Limo',	'',	'zugesagt',	'0000-00-00'),
(964,	0,	0,	'',	'Lohnsteuerhilfeverein e.V.',	'Lohnsteuerhilfeverein e.V.',	'',	'',	'',	'',	'KÃƒÂ¶ln',	'',	'',	'',	'',	'',	'',	'0000-00-00'),
(965,	0,	0,	'',	'Rechtsschutz',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'0000-00-00'),
(966,	0,	0,	'Nina',	'HÃƒÂ¤mmerli',	'',	'',	'',	'',	'',	'',	'',	'',	'n.haemmerli@gmx.de',	'',	'',	'',	'2015-03-25'),
(976,	0,	0,	'',	'ALV E.V.',	'',	'',	'',	'Neusser StraÃŸe 594',	'50737',	'KÃ¶ln',	'',	'',	'',	'',	'',	'offen',	'0000-00-00'),
(983,	0,	0,	'',	'Aktuell Lohnsteuerhilfeverein',	'',	'',	'',	'Bonner Wall 6',	'50677',	'KÃ¶ln',	'',	'',	'',	'',	'',	'offen',	'0000-00-00'),
(981,	0,	0,	'',	'Aktuell e.V.',	'',	'',	'',	'Belvederestr. 53',	'50933',	'KÃ¶ln',	'',	'',	'',	'',	'',	'offen',	'0000-00-00'),
(984,	0,	0,	'',	'Bergische Lohnsteurhilfe',	'',	'',	'',	'Neusser Str. 457',	'50733',	'KÃ¶ln',	'',	'',	'',	'',	'',	'offen',	'0000-00-00'),
(985,	0,	0,	'',	'Deniz e.V.',	'',	'',	'',	'Auguststr. 52',	'50733',	'KÃ¶ln',	'',	'',	'',	'',	'',	'offen',	'0000-00-00'),
(980,	0,	0,	'',	'ISAR E.V.',	'',	'',	'',	'Krefelder StraÃŸe 7',	'50670',	'KÃ¶ln',	'',	'',	'',	'',	'',	'offen',	'0000-00-00'),
(978,	0,	0,	'',	'KÃ¶lner Lohnsteuerberatung ',	'',	'',	'',	'Hansaring 25 - 27',	'50670',	'KÃ¶ln',	'',	'',	'',	'',	'',	'offen',	'0000-00-00'),
(986,	0,	0,	'',	'Ledia Lohnsteuerhilfeverein e.V.',	'',	'',	'',	'Eintrachtstr. 2',	'50668',	'KÃ¶ln',	'',	'',	'',	'',	'',	'offen',	'0000-00-00'),
(979,	0,	0,	'',	'Lohn- und Einkommensteuer Hilfe-Ring Deutschland e.V.',	'',	'',	'',	'Hansaring 80',	'50670',	'KÃ¶ln',	'',	'',	'',	'',	'',	'offen',	'0000-00-00'),
(982,	0,	0,	'',	'Lohnsteuerhilfe Bayern e.V.',	'',	'',	'',	'Friesenwall 5-7',	'50672',	'KÃ¶ln',	'',	'',	'',	'',	'',	'geantwortet',	'0000-00-00'),
(987,	0,	0,	'',	'Lohnsteuerhilfe Rheinland e.V.',	'',	'',	'',	'DellbrÃ¼cker Hauptstr. 156',	'51069',	'KÃ¶ln',	'',	'',	'',	'',	'',	'offen',	'0000-00-00'),
(988,	0,	0,	'',	'Lohnsteuerhilfe-IDL',	'',	'',	'',	'Eythstr. 10a',	'51103',	'KÃ¶ln',	'',	'',	'',	'',	'',	'offen',	'0000-00-00'),
(989,	0,	0,	'',	'Lohnsteuerhilfeverein',	'',	'',	'',	'DÃ¼nnwalder Str. 45',	'51063',	'KÃ¶ln',	'',	'',	'',	'',	'',	'offen',	'0000-00-00'),
(975,	0,	0,	'',	'Noris e.V. Lohnsteuerhilfe',	'',	'',	'',	'Hansaring 30',	'50670',	'KÃ¶ln',	'',	'',	'',	'',	'',	'offen',	'0000-00-00'),
(990,	0,	0,	'',	'Rheingeld e.V.',	'',	'',	'',	'Merheimer Str. 377',	'50739',	'KÃ¶ln',	'',	'',	'',	'',	'',	'offen',	'0000-00-00'),
(977,	0,	0,	'',	'STEUEREULE - DIE LOHNSTEUERBERATER',	'',	'',	'',	'LindenstraÃŸe 14',	'50674',	'KÃ¶ln',	'',	'',	'',	'',	'',	'offen',	'0000-00-00'),
(991,	0,	0,	'',	'Vereinigte Lohnsteuerhilfe',	'',	'',	'',	'Tarnowitzer Str. 6-8',	'51065',	'KÃ¶ln',	'',	'',	'',	'',	'',	'offen',	'0000-00-00'),
(993,	0,	0,	'',	'HUK24 AG',	'',	'',	'',	'Willi-Hussong-StraÃŸe 2',	'96440',	'Coburg',	'',	'',	'',	'',	'',	'offen',	'0000-00-00'),
(999,	0,	0,	'',	'Allrecht Rechtsschutzversicherungen',	'',	'',	'',	'Liesegangstr. 15',	'40211',	'DÃ¼sseldorf',	'',	'',	'',	'',	'',	'offen',	'0000-00-00'),
(1000,	0,	0,	'',	'Arag Rechtsschutz',	'',	'',	'',	'ARAG Platz 1',	'40472',	'DÃ¼sseldorf',	'',	'',	'',	'',	'',	'offen',	'0000-00-00'),
(1006,	0,	0,	'',	'DFV Deutsche Familienversicherung AG',	'',	'',	'',	'Reuterweg 47',	'60323',	'Frankfurt am Main',	'',	'',	'',	'',	'',	'offen',	'0000-00-00'),
(992,	0,	0,	'',	'ADVOCARD Rechtsschutzversicherung AG',	'',	'',	'',	'Besenbinderhof 43',	'20097',	'Hamburg',	'',	'',	'',	'',	'',	'offen',	'0000-00-00'),
(1003,	0,	0,	'',	'Concordia Rechtsschutz-Versicherungs-AG',	'',	'',	'',	'Karl-Wiechert-Allee 55',	'30625',	'Hannover',	'',	'',	'',	'',	'',	'offen',	'0000-00-00'),
(1002,	0,	0,	'',	'BGV Badische Versicherungen',	'',	'',	'',	'Durlacher Allee 56',	'76131',	'Karlsruhe',	'',	'',	'',	'',	'',	'offen',	'0000-00-00'),
(1005,	0,	0,	'',	'Debeka Allgemeine Versicherung AG',	'',	'',	'',	'',	'56058',	'Koblenz',	'',	'',	'',	'',	'',	'offen',	'0000-00-00'),
(996,	0,	0,	'',	'DEURAG Deutsche Rechtsschutz-Versicherung AG',	'',	'',	'',	'Bonner Wall 118',	'50677',	'KÃ¶ln',	'',	'',	'',	'',	'',	'offen',	'0000-00-00'),
(453,	0,	0,	'',	'DEVK Rechtsschutz',	'DEVK',	'',	'',	'Riehler Str. 190',	'50735',	'KÃ¶ln',	'',	'',	'',	'',	'',	'offen',	'0000-00-00'),
(997,	0,	0,	'',	'DGB Rechtsschutz GmbH',	'',	'',	'',	'Gottesweg 54',	'50969',	'KÃ¶ln',	'',	'',	'',	'',	'',	'offen',	'0000-00-00'),
(994,	0,	0,	'',	'Jurpartner Rechtsschutz- Versicherung AG',	'',	'',	'',	'Eumeniusstr. 15 -17',	'50679',	'KÃ¶ln',	'',	'',	'',	'',	'',	'offen',	'0000-00-00'),
(995,	0,	0,	'',	'ROLAND Rechtsschutz-Versicherungs-AG',	'',	'',	'',	'Deutz-Kalker Str. 46',	'50679',	'KÃ¶ln',	'',	'',	'',	'',	'',	'offen',	'0000-00-00'),
(998,	0,	0,	'',	'Allianz Deutschland AG',	'',	'',	'',	'KÃ¶niginstr.  28',	'80802',	'MÃ¼nchen',	'',	'',	'',	'',	'',	'offen',	'0000-00-00'),
(1001,	0,	0,	'',	'Auxilia Rechtsschutz- Versicherungs-AG',	'',	'',	'',	'Uhlandstr. 7',	'80336',	'MÃ¼nchen',	'',	'',	'',	'',	'',	'offen',	'0000-00-00'),
(1008,	0,	0,	'',	'LVM- Rechtsschutzversicherungs-AG',	'',	'',	'',	'Kolde-Ring 21',	'48126',	'MÃ¼nster',	'',	'',	'',	'',	'',	'offen',	'0000-00-00'),
(1004,	0,	0,	'',	'DA Deutsche Allgemeine Versicherung AG',	'',	'',	'',	'Oberstedter Strasse 14',	'61440',	'Oberursel',	'',	'',	'',	'',	'',	'offen',	'0000-00-00'),
(1010,	0,	0,	'',	'WÃ¼rttembergische Versicherung AG',	'',	'',	'',	'Gutenbergstr. 30',	'70176',	'Stuttgart',	'',	'',	'',	'',	'',	'offen',	'0000-00-00'),
(1007,	0,	0,	'',	'Direct Line Versicherung AG',	'',	'',	'',	'Rheinstr.  7a',	'14513',	'Teltow',	'',	'',	'',	'',	'',	'offen',	'0000-00-00'),
(1009,	0,	0,	'',	'R+V Rechtsschutzversicherung AG',	'',	'',	'',	'Raiffeisenplatz 1',	'65189',	'Wiesbaden',	'',	'',	'',	'',	'',	'offen',	'0000-00-00'),
(1011,	0,	0,	'',	'Flinkster',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'offen',	'0000-00-00'),
(1012,	0,	0,	'Christoph',	'RollbÃ¼hler',	'',	'',	'',	'',	'',	'KÃ¶ln',	'',	'',	'christoph.rollbuehler@thomaschristuskirche-koeln.de',	'',	'',	'offen',	'0000-00-00'),
(1013,	0,	0,	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'kontakt@wi-lo.de',	'Willkommen in Longerich',	'',	'offen',	'0000-00-00'),
(1014,	0,	0,	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'wiko@lebenswert-kirche.de',	'Willkommen in BilderstÃ¶ckchen (Lebenswert Kirche)',	'',	'offen',	'0000-00-00'),
(1015,	0,	0,	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'willkommeninagnes@gmx.de',	'Willkommen in Agnes',	'',	'offen',	'0000-00-00'),
(1016,	0,	0,	'',	'Otto',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'offen',	'0000-00-00'),
(1017,	0,	0,	'',	'Amazon',	'Philips',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'offen',	'2015-10-05'),
(1018,	0,	0,	'Markus',	'Schulz',	'',	'',	'',	'',	'KÃ¶ln',	'',	'',	'',	'schulzmarkus@gmx.net',	'',	'',	'offen',	'0000-00-00'),
(1021,	0,	0,	'Simon',	'Unbekannt',	'',	'',	'',	'',	'',	'',	'',	'',	'web@svdanwitz.de',	'',	'',	'offen',	'0000-00-00');

CREATE TABLE `tbladr_lstgrp` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldid_liste` bigint(20) NOT NULL,
  `fldid_group` bigint(20) NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

INSERT INTO `tbladr_lstgrp` (`fldindex`, `fldid_liste`, `fldid_group`) VALUES
(3,	3,	23),
(13,	23,	23),
(23,	23,	3),
(43,	73,	43),
(53,	83,	43),
(73,	13,	3),
(83,	33,	3),
(93,	43,	3),
(103,	53,	3),
(113,	63,	3),
(123,	73,	3),
(133,	83,	3),
(143,	93,	3),
(153,	13,	53),
(163,	33,	53),
(173,	43,	53),
(183,	53,	53),
(193,	63,	53),
(203,	93,	53),
(213,	103,	53),
(233,	3,	3),
(243,	3,	63),
(253,	123,	63),
(263,	133,	63),
(273,	143,	63),
(283,	183,	43),
(293,	193,	43),
(303,	173,	43),
(313,	203,	43),
(323,	113,	43),
(333,	163,	43),
(343,	233,	43),
(353,	213,	43),
(363,	223,	43),
(373,	23,	73),
(383,	3,	73),
(393,	253,	73),
(403,	343,	43),
(413,	313,	43),
(423,	323,	43),
(433,	303,	43),
(443,	393,	43),
(453,	363,	43),
(463,	353,	43),
(473,	383,	43),
(483,	293,	43),
(493,	333,	43),
(503,	373,	43),
(513,	273,	53),
(523,	243,	53),
(533,	403,	43),
(543,	263,	53),
(553,	283,	53),
(563,	183,	83),
(573,	193,	83),
(583,	173,	83),
(593,	203,	83),
(603,	113,	83),
(613,	23,	93),
(623,	153,	93),
(633,	3,	93),
(643,	413,	73),
(653,	413,	103),
(663,	3,	103),
(673,	433,	113),
(683,	303,	123),
(703,	443,	133),
(713,	33,	143),
(723,	133,	143),
(733,	253,	143),
(743,	283,	143),
(753,	303,	143),
(763,	413,	143),
(773,	423,	143),
(793,	443,	143),
(794,	53,	144),
(804,	63,	144),
(814,	863,	144),
(824,	853,	144),
(834,	13,	144),
(844,	263,	144),
(854,	763,	144),
(864,	923,	144),
(874,	913,	144),
(884,	903,	144),
(894,	893,	144),
(904,	883,	144),
(914,	33,	144),
(924,	93,	144),
(934,	793,	144),
(944,	103,	144),
(954,	243,	144),
(964,	843,	144),
(974,	773,	144),
(984,	823,	144),
(994,	813,	144),
(1004,	803,	144),
(1014,	873,	144),
(1024,	283,	144),
(1034,	143,	144),
(1044,	783,	144),
(1054,	133,	144),
(1064,	733,	144),
(1074,	123,	144),
(1084,	833,	144),
(1094,	14,	53),
(1104,	14,	53),
(803,	453,	13),
(813,	453,	143),
(823,	463,	153),
(833,	483,	113),
(843,	493,	163),
(853,	503,	163),
(863,	523,	173),
(1885,	0,	226),
(883,	1011,	183),
(893,	553,	203),
(903,	553,	193),
(913,	433,	193),
(923,	63,	193),
(933,	483,	193),
(943,	313,	193),
(953,	43,	193),
(963,	363,	193),
(973,	13,	193),
(983,	73,	193),
(993,	233,	193),
(1003,	323,	193),
(1013,	273,	193),
(1113,	563,	193),
(1033,	93,	193),
(1043,	163,	193),
(1053,	103,	193),
(1063,	143,	193),
(1123,	573,	193),
(1083,	123,	193),
(1093,	343,	193),
(1103,	113,	193),
(1133,	583,	193),
(1143,	603,	213),
(1153,	643,	213),
(1163,	653,	213),
(1173,	663,	213),
(1183,	673,	213),
(1193,	683,	213),
(1203,	693,	213),
(1213,	703,	213),
(1223,	713,	213),
(1882,	0,	3),
(1243,	733,	63),
(1253,	743,	153),
(1263,	753,	3),
(1273,	733,	223),
(1283,	53,	223),
(1293,	63,	223),
(1303,	13,	223),
(1313,	263,	223),
(1323,	33,	223),
(1333,	93,	223),
(1343,	103,	223),
(1353,	243,	223),
(1363,	283,	223),
(1373,	143,	223),
(1383,	133,	223),
(1393,	123,	223),
(1403,	763,	223),
(1413,	773,	223),
(1423,	783,	223),
(1433,	793,	223),
(1443,	803,	223),
(1453,	813,	223),
(1463,	823,	223),
(1473,	833,	223),
(1483,	843,	223),
(1493,	853,	223),
(1503,	863,	223),
(1513,	873,	223),
(1523,	883,	223),
(1533,	893,	223),
(1543,	903,	223),
(1553,	913,	223),
(1563,	923,	223),
(1573,	263,	143),
(1583,	763,	143),
(1593,	903,	143),
(1603,	893,	143),
(1613,	923,	143),
(1623,	883,	143),
(1633,	913,	143),
(1673,	803,	143),
(1683,	823,	143),
(1693,	813,	143),
(1703,	773,	143),
(1713,	863,	143),
(1723,	853,	143),
(1733,	873,	143),
(1753,	783,	143),
(1773,	733,	143),
(1793,	933,	3),
(1803,	933,	53),
(1813,	943,	223),
(1823,	953,	223),
(1833,	963,	223),
(1834,	943,	144),
(1844,	974,	224),
(1854,	984,	224),
(1855,	985,	224),
(1856,	986,	224),
(1857,	987,	224),
(1858,	988,	224),
(1845,	975,	224),
(1846,	976,	224),
(1847,	977,	224),
(1848,	978,	224),
(1849,	979,	224),
(1850,	980,	224),
(1851,	981,	224),
(1852,	982,	224),
(1853,	983,	224),
(1859,	989,	224),
(1860,	990,	224),
(1861,	991,	224),
(1881,	0,	163),
(1862,	992,	13),
(1863,	993,	13),
(1864,	994,	13),
(1865,	995,	13),
(1866,	996,	13),
(1867,	997,	13),
(1868,	998,	13),
(1869,	999,	13),
(1870,	1000,	13),
(1871,	1001,	13),
(1872,	1002,	13),
(1873,	1003,	13),
(1874,	1004,	13),
(1875,	1005,	13),
(1876,	1006,	13),
(1877,	1007,	13),
(1878,	1008,	13),
(1879,	1009,	13),
(1880,	1010,	13),
(1884,	1012,	226),
(1886,	0,	226),
(1887,	1013,	226),
(1888,	0,	226),
(1889,	1014,	226),
(1890,	0,	3),
(1891,	1015,	226),
(1892,	0,	183),
(1893,	1016,	183),
(1894,	0,	183),
(1895,	1017,	183),
(1896,	0,	3),
(1897,	1018,	3),
(1901,	1021,	231);

CREATE TABLE `tbladr_typ` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldbez` varchar(250) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


CREATE TABLE `tblanlass` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldbez` varchar(250) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

INSERT INTO `tblanlass` (`fldindex`, `fldbez`) VALUES
(3,	'Weihnachten'),
(13,	'Geburtstag'),
(23,	'(ohne)');

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

INSERT INTO `tblartikel` (`fldIndex`, `fldBez`, `fldArtikelnr`, `fldTyp`, `fldSort`, `fldAbteilung`, `fldOrt`, `fldPreis`, `fldAnz`, `fldKonto`, `flda01barcode`, `fldReihenfolge`, `fldBarcode`) VALUES
(21,	'Milch (Frischmilch)',	'FRIMILCH',	'STAMM',	'0004MILCH',	'Milchprodukte',	'Aldi',	0.65,	1,	'LEBEN',	'22130112',	0,	'22130112'),
(22,	'gelbe MÃƒÂ¼llsÃƒÂ¤cke',	'GELBMUELLSACK',	'STAMM',	'004',	'Haushalt / Putzmittel',	'Kaufland',	2.49,	1,	'HAUSHALT',	'',	0,	''),
(23,	'KÃƒÂ¤seaufschnitt',	'KAESE',	'STAMM',	'0004MILCH',	'Milchprodukte',	'Aldi',	0.99,	1,	'LEBEN',	'',	0,	''),
(24,	'Bananen',	'BANANEN',	'STAMM',	'0006OBST',	'Obst / Gemuese',	'Aldi',	0.89,	1,	'LEBEN',	'',	0,	''),
(26,	'Bauernschnitt',	'KLBROT',	'STAMM',	'0001BROT',	'Brotwaren',	'Aldi',	0.59,	1,	'LEBEN',	'',	0,	'29705108'),
(28,	'Toastbrot',	'TOAST',	'STAMM',	'0001BROT',	'Brotwaren',	'Aldi',	0.55,	1,	'LEBEN',	'22136084',	0,	'22136084'),
(29,	'Traubenschorle',	'APFELSCHORLE',	'STAMM',	'00035GETRAENKE',	'Getraenke',	'Aldi',	0.89,	6,	'LEBEN',	'001',	0,	'42141167'),
(30,	'Stilles Wasser',	'STILLESWA',	'STAMM',	'00035GETRAENKE',	'GetrÃƒÂ¤nke',	'Aldi',	2.64,	1,	'LEBEN',	'',	0,	''),
(32,	'Calciumbrause',	'CALCIUMBR',	'STAMM',	'0003WINDELN',	'Windeln',	'Aldi',	0.69,	1,	'',	'',	0,	''),
(33,	'Magnesiumbrause',	'MAGNESIUMBR',	'STAMM',	'0003WINDELN',	'Windeln',	'Aldi',	0.69,	1,	'LEBEN',	'',	0,	''),
(34,	'Butter',	'BUTTER',	'STAMM',	'0004MILCH',	'Milchprodukte',	'Aldi',	1.19,	1,	'LEBEN',	'22116505',	0,	'22116505'),
(35,	'Joghurt Natur',	'NATURJOGHURT',	'STAMM',	'0004MILCH',	'Milchprodukte',	'Aldi',	0.55,	1,	'LEBEN',	'',	0,	''),
(38,	'Magerquark',	'MAGQUARK',	'STAMM',	'0004MILCH',	'Milchprodukte',	'Aldi',	0.55,	1,	'LEBEN',	'',	0,	''),
(39,	'ReibekÃƒÂ¤se',	'REIBEKAESE',	'STAMM',	'0004MILCH',	'Milchprodukte',	'Aldi',	1.19,	1,	'LEBEN',	'',	0,	'22126542'),
(40,	'Margarine',	'MAGARINE',	'STAMM',	'0005EIER',	'Eierwaren',	'Aldi',	0.75,	3,	'LEBEN',	'',	0,	''),
(41,	'Rahmspinat',	'RAHMSPINAT',	'STAMM',	'0005ZTKKOST',	'Tiefkuehlkost',	'Aldi',	0.39,	1,	'LEBEN',	'22113566',	0,	''),
(42,	'Clementinen',	'CLEMENTINEN',	'STAMM',	'0006OBST',	'Obst / GemÃƒÂ¼se',	'Aldi',	1.99,	1,	'HAUSHALT',	'',	0,	''),
(44,	'Kiwi',	'KIWI',	'STAMM',	'0006OBST',	'Obst / Gemuese',	'Aldi',	1.29,	1,	'LEBEN',	'',	0,	''),
(45,	'Paprikaschoten rot',	'PAPSCHOTROT',	'STAMM',	'0006OBST',	'Obst / Gemuese',	'Aldi',	1.69,	1,	'LEBEN',	'',	0,	''),
(47,	'Zwiebeln',	'ZWIEBELN',	'STAMM',	'0006OBST',	'Obst / Gemuese',	'Aldi',	0.69,	1,	'LEBEN',	'',	0,	''),
(48,	'Ãƒâ€pfel Braeburn',	'AEPFEL',	'STAMM',	'0006OBST',	'Obst / Gemuese',	'Aldi',	1.55,	1,	'LEBEN',	'4020959000001',	0,	''),
(49,	'Amaranth Erdbeer MÃƒÂ¼sli',	'AMERDMUESLI',	'STAMM',	'',	'(ohne)',	'DM',	2.25,	1,	'LEBEN',	'',	0,	''),
(51,	'KrÃƒÂ¤utersalz',	'KRAEUTERSALZ',	'STAMM',	'',	'Salz / Mehl',	'Kaufland',	1.00,	1,	'LEBEN',	'',	0,	''),
(52,	'Baguette-BrÃƒÂ¶tchen',	'BAGUETTEBROETCH',	'STAMM',	'',	'Brotwaren',	'Aldi',	0.35,	1,	'LEBEN',	'',	0,	'22115904'),
(53,	'Bio Kartoffeln',	'BIOKARTOFFELN',	'STAMM',	'',	'Obst / Gemuese',	'Aldi',	1.79,	1,	'LEBEN',	'',	0,	'4050373133986'),
(54,	'Buttermilch',	'BUTTERMIL',	'STAMM',	'',	'Milchprodukte',	'Aldi',	0.29,	1,	'LEBEN',	'',	0,	''),
(56,	'RapsÃƒÂ¶l',	'RABSOEL',	'STAMM',	'',	'Konserven',	'Aldi',	0.95,	1,	'LEBEN',	'',	0,	''),
(57,	'Spiralinudeln',	'SPIRALINUDELN',	'STAMM',	'',	'Brotwaren',	'Aldi',	0.49,	1,	'LEBEN',	'',	0,	'22111326'),
(59,	'Weintrauben kernlos',	'WEINTRAUBEN',	'STAMM',	'',	'Obst / Gemuese',	'Aldi',	1.49,	1,	'LEBEN',	'',	0,	''),
(60,	'Tomaten',	'TOMATEN',	'STAMM',	'',	'Obst / Gemuese',	'Aldi',	1.00,	1,	'LEBEN',	'',	0,	''),
(61,	'O-Saft',	'OSAFT',	'STAMM',	'',	'Getraenke',	'Aldi',	0.95,	6,	'LEBEN',	'22131201',	0,	'22131201'),
(62,	'scharfer KÃƒÂ¤se',	'scharferkaese',	'STAMM',	'',	'Milchprodukte',	'Aldi',	1.59,	1,	'LEBEN',	'',	0,	''),
(63,	'Sofix fÃƒÂ¼r alle BÃƒÂ¶den',	'SOFIX',	'STAMM',	'',	'Haushalt / Putzmittel',	'Kaufland',	4.45,	1,	'HAUSHALT',	'',	0,	'4015000019927'),
(64,	'Kakao Tropengold',	'KAKAO',	'STAMM',	'',	'Kaffee / Tee',	'Aldi',	1.00,	1,	'LEBEN',	'',	0,	'4000550426004'),
(65,	'losen zucker',	'ZUCKER',	'STAMM',	'',	'Mehl / Zucker',	'Aldi',	0.00,	1,	'LEBEN',	'',	0,	''),
(66,	'parmesan kÃƒÂ¤se',	'PARMKAESE',	'STAMM',	'',	'Milchprodukte',	'Aldi',	1.00,	1,	'LEBEN',	'',	0,	''),
(67,	'passierte tomaten',	'PASSTOMATEN',	'STAMM',	'',	'Konserven',	'Aldi',	0.35,	1,	'LEBEN',	'',	0,	'22114235'),
(68,	'Duschdas Palmoliv absolute relax',	'DUSCHDASCHRIS',	'STAMM',	'',	'Koerperpflege',	'Kaufland',	1.00,	1,	'PFLEG',	'',	0,	''),
(69,	'Shampoo Herbal fÃƒÂ¼r feines Haar',	'SHAMPOOCHRIS',	'STAMM',	'',	'Koerperpflege',	'Kaufland',	1.00,	1,	'PFLEG',	'',	0,	''),
(70,	'GemÃƒÂ¼sebrÃƒÂ¼he',	'GEMUESEBRUEHE',	'STAMM',	'',	'Gewuerze',	'Aldi',	0.59,	1,	'LEBEN',	'22113139',	0,	''),
(72,	'Sojaschnitzel',	'SOJASCHNITZEL',	'STAMM',	'',	'KÃƒÂ¼hltheke',	'Aldi',	1.79,	2,	'LEBEN',	'22130259',	0,	''),
(73,	'Broccoli',	'BROCCOLI',	'STAMM',	'',	'Obst / Gemuese',	'Aldi',	0.95,	1,	'LEBEN',	'',	0,	''),
(75,	'Schokolade Orange',	'SCHOKOORANGE',	'STAMM',	'',	'SÃƒÂ¼ssigkeiten',	'Aldi',	0.95,	1,	'GENUSS',	'',	0,	''),
(76,	'Schlangengurke',	'SCHLGURK',	'STAMM',	'0006Obst',	'Obst / Gemuese',	'Aldi',	0.30,	1,	'LEBEN',	'',	0,	''),
(78,	'KnÃƒÂ¤ckebrot',	'KNAECKEBROT',	'STAMM',	'',	'Brotwaren',	'Aldi',	1.00,	1,	'LEBEN',	'',	0,	''),
(79,	'HÃƒÂ¼ttenkÃƒÂ¤se',	'HUETTENKAESE',	'STAMM',	'',	'Milchprodukte',	'Kaufland',	2.00,	1,	'LEBEN',	'',	0,	''),
(80,	'koffeinfreie cola',	'KOFFEINFREIECOLA',	'STAMM',	'',	'GetrÃƒÂ¤nke',	'Kaufland',	3.00,	1,	'LEBEN',	'5449000017901',	0,	''),
(81,	'Naschtomaten ( Mini )',	'NASCHTOMATEN',	'STAMM',	'',	'Obst / Gemuese',	'Aldi',	2.49,	1,	'LEBEN',	'',	0,	'4049929247550'),
(123,	'H-Milch',	'',	'STAMM',	'',	'Milchprodukte',	'Aldi',	0.59,	1,	'LEBEN',	'',	0,	'22116413'),
(753,	'Joghurt Natur',	'',	'STAMM',	'',	'Milchprodukte',	'Aldi',	0.45,	1,	'LEBEN',	'',	0,	'22121738'),
(463,	'KÃƒÂ¤seaufschnitt',	'',	'STAMM',	'',	'Milchprodukte',	'Aldi',	1.39,	1,	'LEBEN',	'',	0,	'22144225'),
(453,	'Margarine',	'',	'STAMM',	'',	'(ohne)',	'Aldi',	0.69,	1,	'LEBEN',	'',	0,	'22112446'),
(113,	'Multivitaminsaft',	'',	'STAMM',	'',	'Getraenke',	'Aldi',	0.95,	6,	'LEBEN',	'',	0,	'22131218'),
(443,	'scharfer KÃƒÂ¤se',	'',	'STAMM',	'',	'Milchprodukte',	'Aldi',	1.79,	1,	'LEBEN',	'',	0,	'22125811'),
(763,	'Sojaschnitzel',	'',	'STAMM',	'',	'Kuehltheke',	'Aldi',	1.79,	2,	'LEBEN',	'',	0,	'22130259'),
(103,	'Tofuaufschnitt',	'TOFUAUFSCHNITT',	'STAMM',	'',	'Milchprodukte',	'Aldi',	1.79,	1,	'LEBEN',	'',	0,	'22144515'),
(433,	'Orangenwasser',	'',	'STAMM',	'',	'Getraenke',	'Kaufland',	0.49,	6,	'LEBEN',	'',	0,	'4300175374170');

CREATE TABLE `tblaufgabenbenutzer` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldid_benutzer` bigint(20) NOT NULL,
  `fldfarbe` varchar(10) COLLATE utf8_bin NOT NULL,
  `fldfarbeWE` varchar(10) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

INSERT INTO `tblaufgabenbenutzer` (`fldindex`, `fldid_benutzer`, `fldfarbe`, `fldfarbeWE`) VALUES
(3,	1,	'#FFFF00',	''),
(13,	2,	'#00FFFF',	''),
(23,	3,	'#FF00FF',	''),
(24,	50002,	'',	''),
(25,	50003,	'',	''),
(26,	50004,	'',	'');

CREATE TABLE `tblaufgabenliste` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldbez` varchar(100) NOT NULL,
  `fldtext` varchar(500) NOT NULL,
  `fldid_haeufigkeit` bigint(20) NOT NULL,
  `fldid_benutzer` bigint(20) NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `tblaufgabenliste` (`fldindex`, `fldbez`, `fldtext`, `fldid_haeufigkeit`, `fldid_benutzer`) VALUES
(2,	'Bad reinigen',	'Waschbecken putzen, Badewanne putzen, Duschtasse putzen, HandtÃ¼cher wechseln.',	3,	50006),
(3,	'WÃ¤sche aufhÃ¤ngen',	'WÃ¤sche aufhÃ¤ngen.',	1,	50006),
(4,	'Klorollen auffÃ¼llen',	'Klorollen auffÃ¼llen im unteren und im oberen Bad.',	3,	3),
(5,	'MÃ¼lleimer leeren',	'MÃ¼lleimer leeren in der KÃ¼che, im Wohnzimmer, im unteren Bad, im Arbeitszimmer, im Vorkeller, im Keller, im oberen Bad, im Kinderzimmer u. im Schlafzimmer.',	3,	1),
(6,	'Tisch decken',	'Tisch decken, GetrÃ¤nke hochholen, ggfs. Kaffee kochen.',	1,	50006),
(7,	'SpÃ¼lmaschine ausrÃ¤umen',	'SpÃ¼lmaschine ausrÃ¤umen.',	1,	50005),
(8,	'Tisch abrÃ¤umen',	'Tisch abrÃ¤umen und anschliessend abwischen.',	1,	50006),
(9,	'KÃ¼che wischen',	'KÃ¼che wischen.',	1,	3),
(10,	'WÃ¤sche i d Keller',	'WÃ¤sche in den Waschkeller bringen, WÃ¤schekorb oberes Bad und WÃ¤schekorb unteres Bad.',	1,	50007),
(11,	'Brotdose richten',	'Brote schmieren und Trinkflasche befÃ¼llen',	1,	3),
(12,	'SpÃ¼lmaschine einrÃ¤umen',	'SpÃ¼lmaschine einrÃ¤umen',	1,	50005),
(13,	'Betten machen',	'Betten machen',	1,	2),
(14,	'Toiletten putzen',	'Toiletten putzen',	1,	2),
(15,	'WÃ¤sche waschen',	'WÃ¤sche in die Waschmaschine stecken und laufen lassen.',	1,	50007),
(16,	'Staubsaugen',	'Staubsaugen alle RÃ¤ume',	1,	2),
(17,	'Staub wischen',	'Staub wischen',	1,	2),
(18,	'BÃ¶den wischen',	'BÃ¶den wischen alle RÃ¤ume',	3,	50007),
(19,	'Altglas wegbringen',	'Altglas wegbringen',	3,	50005),
(20,	'Altpapier rausbringen',	'Altpapier in die blaue Tonne bringen ',	3,	50005),
(21,	'Blumen gieÃŸen drinnen',	'Blumen gieÃŸen im Wohnzimmer, KÃ¼che',	1,	2),
(22,	'Blumen gieÃŸen drauÃŸen',	'Blumen auf der Terrasse gieÃŸen ',	1,	2),
(23,	'WÃ¤sche bÃ¼geln',	'WÃ¤sche bÃ¼geln',	1,	50007),
(24,	'Fenster putzen',	'Fenster putzen',	5,	50002),
(25,	'Betten beziehen ',	'Bettzeug neu beziehen',	4,	3),
(26,	'WÃ¤sche einrÃ¤umen',	'WÃ¤sche einrÃ¤umen',	1,	50003),
(27,	'Kaffeemaschine entkalken',	'Kaffeemaschine entkalken',	5,	1),
(28,	'Waschmaschine reinigen',	'Waschmaschine reinigen',	4,	50002),
(29,	'SpÃ¼lmaschine reinigen',	'SpÃ¼lmaschine reinigen',	4,	50002),
(30,	'Backofen reinigen',	'Backofen reinigen',	3,	50006),
(31,	'KÃ¼che reinigen',	'Arbeitsplatte, SpÃ¼le und Ceranfeld reinigen.',	1,	50005),
(32,	'KÃ¼hlschrank reinigen',	'KÃ¼hlschrank reinigen',	3,	50007),
(33,	'GlÃ¼hbirnen wechseln',	'GlÃ¼hbirnen wechseln',	5,	1),
(34,	'Feuermelder Batterien tauschen',	'Feuermelder Batterien tauschen',	4,	1),
(35,	'Briefe Ã¶ffnen und klÃ¤ren',	'Briefe Ã¶ffnen und klÃ¤ren\r\njeder seinen eigenen ohne dabei allein zu sein.',	1,	50003),
(36,	'Rechnungen Ã¼berweisen',	'Rechnungen, Telefon, Ã¼berweisen.',	4,	1),
(37,	'FamilieneinkÃ¤ufe',	'wÃ¶chentliche GroÃŸeinkauf i.d.R. samstags ',	3,	1),
(38,	'kleine Besorgungen',	'kleinere Besorgungen wie z.B. ToastbrÃ¶tchen',	6,	50002),
(39,	'SteuererklÃ¤rung',	'SteuererklÃ¤rung abgeben und auf Fragen vom SteuerbÃ¼ro reagieren',	7,	1),
(40,	'Ausmisten und AufrÃ¤umen',	'Jeder rÃ¤umt in seinem Bereich auf, damit wieder mehr Ordnung herrscht',	3,	50003),
(41,	'Ranzenkontrolle',	'',	1,	3),
(42,	'Hausaufgaben',	'',	1,	3);

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

INSERT INTO `tblaufgabenplan` (`fldindex`, `fldbez`, `fldtext`, `flddatum`, `fldid_benutzer`, `fldrotate`, `fldid_aufgabe`, `fldsort`) VALUES
(1008,	'Klorollen auffÃƒÂ¼llen',	'Klorollen auffÃ¼llen',	'2015-05-12',	1,	'J',	4,	''),
(1022,	'Tisch abrÃƒÂ¤umen',	'Tisch abrÃ¤umen',	'2015-05-16',	1,	'J',	8,	''),
(1046,	'',	'',	'2015-05-16',	1,	'N',	6,	''),
(1048,	'',	'',	'2015-05-13',	1,	'J',	5,	''),
(1053,	'',	'',	'2015-05-11',	3,	'J',	6,	''),
(1054,	'',	'',	'2015-05-12',	3,	'J',	6,	''),
(1055,	'',	'',	'2015-05-13',	3,	'J',	6,	''),
(1056,	'',	'',	'2015-05-14',	3,	'J',	6,	''),
(1057,	'',	'',	'2015-05-15',	3,	'J',	6,	''),
(1058,	'',	'',	'2015-05-11',	3,	'J',	2,	''),
(1059,	'',	'',	'2015-05-11',	2,	'J',	3,	''),
(1060,	'',	'',	'2015-05-11',	2,	'J',	9,	''),
(1061,	'',	'',	'2015-05-11',	2,	'J',	10,	''),
(1062,	'',	'',	'2015-05-11',	1,	'J',	8,	''),
(1063,	'',	'',	'2015-05-11',	2,	'J',	7,	''),
(1064,	'',	'',	'2015-05-12',	1,	'J',	8,	''),
(1065,	'',	'',	'2015-05-13',	1,	'J',	8,	''),
(1066,	'',	'',	'2015-05-14',	1,	'J',	8,	''),
(1067,	'',	'',	'2015-05-15',	1,	'J',	8,	''),
(1068,	'',	'',	'2015-05-17',	2,	'N',	6,	''),
(1069,	'',	'',	'2015-05-17',	2,	'N',	8,	''),
(1070,	'',	'',	'2015-05-12',	2,	'J',	3,	''),
(1071,	'',	'',	'2015-05-13',	2,	'J',	3,	''),
(1072,	'',	'',	'2015-05-14',	2,	'J',	3,	''),
(1073,	'',	'',	'2015-05-15',	2,	'J',	3,	''),
(1074,	'',	'',	'2015-05-12',	2,	'J',	7,	''),
(1075,	'',	'',	'2015-05-13',	2,	'J',	7,	''),
(1076,	'',	'',	'2015-05-14',	2,	'J',	7,	''),
(1077,	'',	'',	'2015-05-15',	2,	'J',	7,	''),
(1078,	'',	'',	'2015-05-12',	2,	'J',	9,	''),
(1079,	'',	'',	'2015-05-13',	2,	'J',	9,	''),
(1080,	'',	'',	'2015-05-14',	2,	'J',	9,	''),
(1081,	'',	'',	'2015-05-15',	2,	'J',	9,	''),
(1082,	'',	'',	'2015-05-12',	2,	'J',	10,	''),
(1083,	'',	'',	'2015-05-13',	2,	'J',	10,	''),
(1084,	'',	'',	'2015-05-14',	2,	'J',	10,	''),
(1085,	'',	'',	'2015-05-15',	2,	'J',	10,	''),
(1086,	'',	'',	'2015-05-12',	3,	'J',	2,	''),
(1087,	'',	'',	'2015-05-13',	3,	'J',	2,	''),
(1088,	'',	'',	'2015-05-14',	3,	'J',	2,	''),
(1089,	'',	'',	'2015-05-15',	3,	'J',	2,	''),
(1091,	'',	'',	'2015-05-18',	1,	'J',	6,	''),
(1092,	'',	'',	'2015-05-18',	1,	'J',	2,	''),
(1093,	'',	'',	'2015-05-18',	3,	'J',	3,	''),
(1094,	'',	'',	'2015-05-18',	3,	'J',	9,	''),
(1095,	'',	'',	'2015-05-18',	3,	'J',	10,	''),
(1096,	'',	'',	'2015-05-18',	2,	'J',	8,	''),
(1097,	'',	'',	'2015-05-18',	3,	'J',	7,	''),
(1105,	'Klorollen auffÃƒÂ¼llen',	'Klorollen auffÃ¼llen',	'2015-05-19',	2,	'J',	4,	''),
(1107,	'',	'',	'2015-05-19',	1,	'J',	6,	''),
(1108,	'',	'',	'2015-05-19',	2,	'J',	8,	''),
(1109,	'',	'',	'2015-05-19',	3,	'J',	3,	''),
(1110,	'',	'',	'2015-05-19',	3,	'J',	7,	''),
(1111,	'',	'',	'2015-05-19',	3,	'J',	9,	''),
(1112,	'',	'',	'2015-05-19',	3,	'J',	10,	''),
(1113,	'',	'',	'2015-05-19',	1,	'J',	2,	''),
(1120,	'',	'',	'2015-05-20',	2,	'J',	5,	''),
(1122,	'',	'',	'2015-05-20',	1,	'J',	6,	''),
(1123,	'',	'',	'2015-05-20',	2,	'J',	8,	''),
(1124,	'',	'',	'2015-05-20',	3,	'J',	3,	''),
(1125,	'',	'',	'2015-05-20',	3,	'J',	7,	''),
(1126,	'',	'',	'2015-05-20',	3,	'J',	9,	''),
(1127,	'',	'',	'2015-05-20',	3,	'J',	10,	''),
(1128,	'',	'',	'2015-05-20',	1,	'J',	2,	''),
(1136,	'',	'',	'2015-05-21',	1,	'J',	6,	''),
(1137,	'',	'',	'2015-05-21',	2,	'J',	8,	''),
(1138,	'',	'',	'2015-05-21',	3,	'J',	3,	''),
(1139,	'',	'',	'2015-05-21',	3,	'J',	7,	''),
(1140,	'',	'',	'2015-05-21',	3,	'J',	9,	''),
(1141,	'',	'',	'2015-05-21',	3,	'J',	10,	''),
(1142,	'',	'',	'2015-05-21',	1,	'J',	2,	''),
(1151,	'',	'',	'2015-05-22',	1,	'J',	6,	''),
(1152,	'',	'',	'2015-05-22',	2,	'J',	8,	''),
(1153,	'',	'',	'2015-05-22',	3,	'J',	3,	''),
(1154,	'',	'',	'2015-05-22',	3,	'J',	7,	''),
(1155,	'',	'',	'2015-05-22',	3,	'J',	9,	''),
(1156,	'',	'',	'2015-05-22',	3,	'J',	10,	''),
(1157,	'',	'',	'2015-05-22',	1,	'J',	2,	''),
(1165,	'Tisch abrÃƒÂ¤umen',	'Tisch abrÃ¤umen',	'2015-05-23',	2,	'J',	8,	''),
(1166,	'',	'',	'2015-05-23',	1,	'N',	6,	''),
(1168,	'',	'',	'2015-05-24',	2,	'N',	6,	''),
(1169,	'',	'',	'2015-05-24',	2,	'N',	8,	''),
(1171,	'',	'',	'2015-05-25',	1,	'J',	6,	''),
(1172,	'',	'',	'2015-05-25',	1,	'J',	2,	''),
(1173,	'',	'',	'2015-05-25',	3,	'J',	3,	''),
(1174,	'',	'',	'2015-05-25',	3,	'J',	9,	''),
(1175,	'',	'',	'2015-05-25',	3,	'J',	10,	''),
(1176,	'',	'',	'2015-05-25',	2,	'J',	8,	''),
(1177,	'',	'',	'2015-05-25',	3,	'J',	7,	''),
(1185,	'Klorollen auffÃƒÂ¼llen',	'Klorollen auffÃ¼llen',	'2015-05-26',	2,	'J',	4,	''),
(1187,	'',	'',	'2015-05-26',	1,	'J',	6,	''),
(1188,	'',	'',	'2015-05-26',	2,	'J',	8,	''),
(1189,	'',	'',	'2015-05-26',	3,	'J',	3,	''),
(1190,	'',	'',	'2015-05-26',	3,	'J',	7,	''),
(1191,	'',	'',	'2015-05-26',	3,	'J',	9,	''),
(1192,	'',	'',	'2015-05-26',	3,	'J',	10,	''),
(1193,	'',	'',	'2015-05-26',	1,	'J',	2,	''),
(1200,	'',	'',	'2015-05-27',	2,	'J',	5,	''),
(1202,	'',	'',	'2015-05-27',	1,	'J',	6,	''),
(1203,	'',	'',	'2015-05-27',	2,	'J',	8,	''),
(1204,	'',	'',	'2015-05-27',	3,	'J',	3,	''),
(1205,	'',	'',	'2015-05-27',	3,	'J',	7,	''),
(1206,	'',	'',	'2015-05-27',	3,	'J',	9,	''),
(1207,	'',	'',	'2015-05-27',	3,	'J',	10,	''),
(1208,	'',	'',	'2015-05-27',	1,	'J',	2,	''),
(1216,	'',	'',	'2015-05-28',	1,	'J',	6,	''),
(1217,	'',	'',	'2015-05-28',	2,	'J',	8,	''),
(1218,	'',	'',	'2015-05-28',	3,	'J',	3,	''),
(1219,	'',	'',	'2015-05-28',	3,	'J',	7,	''),
(1220,	'',	'',	'2015-05-28',	3,	'J',	9,	''),
(1221,	'',	'',	'2015-05-28',	3,	'J',	10,	''),
(1222,	'',	'',	'2015-05-28',	1,	'J',	2,	''),
(1231,	'',	'',	'2015-05-29',	1,	'J',	6,	''),
(1232,	'',	'',	'2015-05-29',	2,	'J',	8,	''),
(1233,	'',	'',	'2015-05-29',	3,	'J',	3,	''),
(1234,	'',	'',	'2015-05-29',	3,	'J',	7,	''),
(1235,	'',	'',	'2015-05-29',	3,	'J',	9,	''),
(1236,	'',	'',	'2015-05-29',	3,	'J',	10,	''),
(1237,	'',	'',	'2015-05-29',	1,	'J',	2,	''),
(1245,	'Tisch abrÃƒÂ¤umen',	'Tisch abrÃ¤umen',	'2015-05-30',	2,	'J',	8,	''),
(1246,	'',	'',	'2015-05-30',	1,	'N',	6,	''),
(1248,	'',	'',	'2015-05-31',	2,	'N',	6,	''),
(1249,	'',	'',	'2015-05-31',	2,	'N',	8,	''),
(1820,	'',	'',	'2015-06-08',	1,	'J',	6,	''),
(1821,	'',	'',	'2015-06-08',	1,	'J',	2,	''),
(1822,	'',	'',	'2015-06-08',	3,	'J',	3,	''),
(1823,	'',	'',	'2015-06-08',	3,	'J',	9,	''),
(1824,	'',	'',	'2015-06-08',	3,	'J',	10,	''),
(1825,	'',	'',	'2015-06-08',	2,	'J',	8,	''),
(1826,	'',	'',	'2015-06-08',	3,	'J',	7,	''),
(1827,	'Klorollen auffÃƒÂ¼llen',	'Klorollen auffÃ¼llen',	'2015-06-09',	2,	'J',	4,	''),
(1828,	'',	'',	'2015-06-09',	1,	'J',	6,	''),
(1829,	'',	'',	'2015-06-09',	2,	'J',	8,	''),
(1830,	'',	'',	'2015-06-09',	3,	'J',	3,	''),
(1831,	'',	'',	'2015-06-09',	3,	'J',	7,	''),
(1832,	'',	'',	'2015-06-09',	3,	'J',	9,	''),
(1833,	'',	'',	'2015-06-09',	3,	'J',	10,	''),
(1834,	'',	'',	'2015-06-09',	1,	'J',	2,	''),
(1842,	'',	'',	'2015-06-10',	2,	'J',	5,	''),
(1843,	'',	'',	'2015-06-10',	1,	'J',	6,	''),
(1844,	'',	'',	'2015-06-10',	2,	'J',	8,	''),
(1845,	'',	'',	'2015-06-10',	3,	'J',	3,	''),
(1846,	'',	'',	'2015-06-10',	3,	'J',	7,	''),
(1847,	'',	'',	'2015-06-10',	3,	'J',	9,	''),
(1848,	'',	'',	'2015-06-10',	3,	'J',	10,	''),
(1849,	'',	'',	'2015-06-10',	1,	'J',	2,	''),
(1857,	'',	'',	'2015-06-11',	1,	'J',	6,	''),
(1858,	'',	'',	'2015-06-11',	2,	'J',	8,	''),
(1859,	'',	'',	'2015-06-11',	3,	'J',	3,	''),
(1860,	'',	'',	'2015-06-11',	3,	'J',	7,	''),
(1861,	'',	'',	'2015-06-11',	3,	'J',	9,	''),
(1862,	'',	'',	'2015-06-11',	3,	'J',	10,	''),
(1863,	'',	'',	'2015-06-11',	1,	'J',	2,	''),
(1864,	'',	'',	'2015-06-12',	1,	'J',	6,	''),
(1865,	'',	'',	'2015-06-12',	2,	'J',	8,	''),
(1866,	'',	'',	'2015-06-12',	3,	'J',	3,	''),
(1867,	'',	'',	'2015-06-12',	3,	'J',	7,	''),
(1868,	'',	'',	'2015-06-12',	3,	'J',	9,	''),
(1869,	'',	'',	'2015-06-12',	3,	'J',	10,	''),
(1870,	'',	'',	'2015-06-12',	1,	'J',	2,	''),
(1871,	'Tisch abrÃƒÂ¤umen',	'Tisch abrÃ¤umen',	'2015-06-13',	2,	'J',	8,	''),
(1872,	'',	'',	'2015-06-13',	1,	'N',	6,	''),
(1874,	'',	'',	'2015-06-14',	2,	'N',	6,	''),
(1875,	'',	'',	'2015-06-14',	2,	'N',	8,	''),
(1877,	'',	'',	'2015-06-15',	2,	'J',	6,	''),
(1878,	'',	'',	'2015-06-15',	2,	'J',	2,	''),
(1879,	'',	'',	'2015-06-15',	1,	'J',	3,	''),
(1880,	'',	'',	'2015-06-15',	1,	'J',	9,	''),
(1881,	'',	'',	'2015-06-15',	1,	'J',	10,	''),
(1882,	'',	'',	'2015-06-15',	3,	'J',	8,	''),
(1883,	'',	'',	'2015-06-15',	1,	'J',	7,	''),
(1884,	'Klorollen auffÃƒÂ¼llen',	'Klorollen auffÃ¼llen',	'2015-06-16',	3,	'J',	4,	''),
(1885,	'',	'',	'2015-06-16',	2,	'J',	6,	''),
(1886,	'',	'',	'2015-06-16',	3,	'J',	8,	''),
(1887,	'',	'',	'2015-06-16',	1,	'J',	3,	''),
(1888,	'',	'',	'2015-06-16',	1,	'J',	7,	''),
(1889,	'',	'',	'2015-06-16',	1,	'J',	9,	''),
(1890,	'',	'',	'2015-06-16',	1,	'J',	10,	''),
(1891,	'',	'',	'2015-06-16',	2,	'J',	2,	''),
(1899,	'',	'',	'2015-06-17',	3,	'J',	5,	''),
(1900,	'',	'',	'2015-06-17',	2,	'J',	6,	''),
(1901,	'',	'',	'2015-06-17',	3,	'J',	8,	''),
(1902,	'',	'',	'2015-06-17',	1,	'J',	3,	''),
(1903,	'',	'',	'2015-06-17',	1,	'J',	7,	''),
(1904,	'',	'',	'2015-06-17',	1,	'J',	9,	''),
(1905,	'',	'',	'2015-06-17',	1,	'J',	10,	''),
(1906,	'',	'',	'2015-06-17',	2,	'J',	2,	''),
(1914,	'',	'',	'2015-06-18',	2,	'J',	6,	''),
(1915,	'',	'',	'2015-06-18',	3,	'J',	8,	''),
(1916,	'',	'',	'2015-06-18',	1,	'J',	3,	''),
(1917,	'',	'',	'2015-06-18',	1,	'J',	7,	''),
(1918,	'',	'',	'2015-06-18',	1,	'J',	9,	''),
(1919,	'',	'',	'2015-06-18',	1,	'J',	10,	''),
(1920,	'',	'',	'2015-06-18',	2,	'J',	2,	''),
(1921,	'',	'',	'2015-06-19',	2,	'J',	6,	''),
(1922,	'',	'',	'2015-06-19',	3,	'J',	8,	''),
(1923,	'',	'',	'2015-06-19',	1,	'J',	3,	''),
(1924,	'',	'',	'2015-06-19',	1,	'J',	7,	''),
(1925,	'',	'',	'2015-06-19',	1,	'J',	9,	''),
(1926,	'',	'',	'2015-06-19',	1,	'J',	10,	''),
(1927,	'',	'',	'2015-06-19',	2,	'J',	2,	''),
(1928,	'Tisch abrÃƒÂ¤umen',	'Tisch abrÃ¤umen',	'2015-06-20',	3,	'J',	8,	''),
(1929,	'',	'',	'2015-06-20',	1,	'N',	6,	''),
(1931,	'',	'',	'2015-06-21',	2,	'N',	6,	''),
(1932,	'',	'',	'2015-06-21',	2,	'N',	8,	''),
(1985,	'',	'',	'2015-06-22',	3,	'J',	6,	''),
(1986,	'',	'',	'2015-06-22',	3,	'J',	2,	''),
(1987,	'',	'',	'2015-06-22',	2,	'J',	3,	''),
(1988,	'',	'',	'2015-06-22',	2,	'J',	9,	''),
(1989,	'',	'',	'2015-06-22',	2,	'J',	10,	''),
(1990,	'',	'',	'2015-06-22',	1,	'J',	8,	''),
(1991,	'',	'',	'2015-06-22',	2,	'J',	7,	''),
(1992,	'Klorollen auffÃƒÂ¼llen',	'Klorollen auffÃ¼llen',	'2015-06-23',	1,	'J',	4,	''),
(1993,	'',	'',	'2015-06-23',	3,	'J',	6,	''),
(1994,	'',	'',	'2015-06-23',	1,	'J',	8,	''),
(1995,	'',	'',	'2015-06-23',	2,	'J',	3,	''),
(1996,	'',	'',	'2015-06-23',	2,	'J',	7,	''),
(1997,	'',	'',	'2015-06-23',	2,	'J',	9,	''),
(1998,	'',	'',	'2015-06-23',	2,	'J',	10,	''),
(1999,	'',	'',	'2015-06-23',	3,	'J',	2,	''),
(2007,	'',	'',	'2015-06-24',	1,	'J',	5,	''),
(2008,	'',	'',	'2015-06-24',	3,	'J',	6,	''),
(2009,	'',	'',	'2015-06-24',	1,	'J',	8,	''),
(2010,	'',	'',	'2015-06-24',	2,	'J',	3,	''),
(2011,	'',	'',	'2015-06-24',	2,	'J',	7,	''),
(2012,	'',	'',	'2015-06-24',	2,	'J',	9,	''),
(2013,	'',	'',	'2015-06-24',	2,	'J',	10,	''),
(2014,	'',	'',	'2015-06-24',	3,	'J',	2,	''),
(2022,	'',	'',	'2015-06-25',	3,	'J',	6,	''),
(2023,	'',	'',	'2015-06-25',	1,	'J',	8,	''),
(2024,	'',	'',	'2015-06-25',	2,	'J',	3,	''),
(2025,	'',	'',	'2015-06-25',	2,	'J',	7,	''),
(2026,	'',	'',	'2015-06-25',	2,	'J',	9,	''),
(2027,	'',	'',	'2015-06-25',	2,	'J',	10,	''),
(2028,	'',	'',	'2015-06-25',	3,	'J',	2,	''),
(2029,	'',	'',	'2015-06-26',	3,	'J',	6,	''),
(2030,	'',	'',	'2015-06-26',	1,	'J',	8,	''),
(2031,	'',	'',	'2015-06-26',	2,	'J',	3,	''),
(2032,	'',	'',	'2015-06-26',	2,	'J',	7,	''),
(2033,	'',	'',	'2015-06-26',	2,	'J',	9,	''),
(2034,	'',	'',	'2015-06-26',	2,	'J',	10,	''),
(2035,	'',	'',	'2015-06-26',	3,	'J',	2,	''),
(2036,	'Tisch abrÃƒÂ¤umen',	'Tisch abrÃ¤umen',	'2015-06-27',	1,	'J',	8,	''),
(2037,	'',	'',	'2015-06-27',	1,	'N',	6,	''),
(2039,	'',	'',	'2015-06-28',	2,	'N',	6,	''),
(2040,	'',	'',	'2015-06-28',	2,	'N',	8,	'');

CREATE TABLE `tblautosyncstatus` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `flddbname` varchar(50) NOT NULL,
  `fldtblname` varchar(50) NOT NULL,
  `fldtimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`fldindex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `tblautosyncstatus` (`fldindex`, `flddbname`, `fldtblname`, `fldtimestamp`) VALUES
(12,	'dbjoorgportal',	'tblktosal',	'2014-11-05 07:52:35'),
(13,	'dbjoorgportal',	'tblktosal',	'2014-11-05 07:53:13'),
(14,	'dbjoorgportal',	'tblktosal',	'2014-11-05 21:15:55'),
(15,	'dbjoorgportal',	'tblktosal',	'2014-11-06 06:57:17'),
(16,	'dbjoorgportal',	'tblktosal',	'2014-11-06 18:29:15');

CREATE TABLE `tblbarcode` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldbez` varchar(250) NOT NULL,
  `fldbarcode` varchar(20) NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


CREATE TABLE `tblbenutzer` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldbez` varchar(200) COLLATE utf8_bin NOT NULL,
  `fldtimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fldbackgroundfilename` char(250) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

INSERT INTO `tblbenutzer` (`fldindex`, `fldbez`, `fldtimestamp`, `fldbackgroundfilename`) VALUES
(1,	'Horst',	'0000-00-00 00:00:00',	''),
(2,	'Christiane',	'0000-00-00 00:00:00',	''),
(3,	'Frieda',	'2015-02-02 06:20:07',	'../images/tk005.jpg'),
(50005,	'Block 1',	'2015-10-18 19:23:14',	''),
(50000,	'Felix',	'0000-00-00 00:00:00',	''),
(50001,	'Willi',	'0000-00-00 00:00:00',	''),
(50002,	'(wechseln)',	'2015-09-19 11:05:56',	''),
(50003,	'(jeder)',	'2015-09-19 11:20:04',	''),
(50004,	'[_______________]',	'2015-09-19 11:23:57',	''),
(50006,	'Block 2',	'2015-10-18 19:23:24',	''),
(50007,	'Block 3',	'2015-10-18 19:23:35',	''),
(50008,	'Erna',	'2015-11-17 06:24:05',	''),
(50009,	'Heinz',	'2015-11-17 06:24:17',	'');

CREATE TABLE `tblbeschenkte` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldname` varchar(250) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

INSERT INTO `tblbeschenkte` (`fldindex`, `fldname`) VALUES
(3,	'Horst'),
(13,	'Christiane'),
(23,	'Frieda'),
(33,	'Orell'),
(43,	'Opa Heinz'),
(53,	'Oma Erna'),
(63,	'Opa Hartmut'),
(73,	'Oma Brigitte'),
(83,	'Tante Sylvia'),
(93,	'Onkel Gerrit'),
(103,	'(ohne)');

CREATE TABLE `tblbildart` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldbez` varchar(100) NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `tblbildart` (`fldindex`, `fldbez`) VALUES
(1,	'Fillys');

CREATE TABLE `tblbilder` (
  `fldIndex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldb01bez` varchar(200) NOT NULL,
  `fldb01bild` blob NOT NULL,
  `fldb01filetype` varchar(10) NOT NULL,
  `fldid_art` bigint(20) NOT NULL,
  PRIMARY KEY (`fldIndex`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

INSERT INTO `tblbilder` (`fldIndex`, `fldb01bez`, `fldb01bild`, `fldb01filetype`, `fldid_art`) VALUES
(24,	'Schere',	'ÿØÿà\0JFIF\0\0H\0H\0\0ÿá\r[Exif\0\0MM\0*\0\0\0\0\0\0\0\0\0\0\0b\0\0\0\0\0\0\0j\Z\0\0\0\0\0\0\0p\0\0\0\0\0\0\0x(\0\0\0\0\0\0\0\0\0\0\0\0\0\0‡i\0\0\0\0\0\0\0€\0\0LHUAWEI\0\0U8650\0\0\0\0H\0\0\0\0\0\0H\0\0\0\0\n\0\0\0\0\00220\0\0\0\0\0\0\0ş\0\0\0\0\0\0‘\0\0\0\0\0’\n\0\0\0\0\0\0& \0\0\0\0\00100 \0\0\0\0\0\0\0 \0\0\0\0\0\0\0ú \0\0\0\0\0\0\0¼ \0\0\0\0\0\0.\0\0\0\02014:12:27 13:36:19\02002:12:08 12:00:00\0\0\0¯\0\0\0d\0\0\0\0\0\0R98\0\0\0\0\0\00100\0\0\0\0\0\0\0\0\0\0\0\0\Z\0\0\0\0\0\0š\0\0\0\0\0\0¢(\0\0\0\0\0\0\0\0\0\0\0\0\0ª\0\0\0\0\0\0©\0\0\0\0\0\0\0H\0\0\0\0\0\0H\0\0\0ÿØÿà\0JFIF\0\0\0\0\0\0ÿÛ\0C\0		\n\r\Z\Z $.\' \",#(7),01444\'9=82<.342ÿÛ\0C			\r\r2!!22222222222222222222222222222222222222222222222222ÿÀ\0\0\0¼\"\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0	\nÿÄ\0µ\0\0\0}\0!1AQa\"q2‘¡#B±ÁRÑğ$3br‚	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyzƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹ºÂÃÄÅÆÇÈÉÊÒÓÔÕÖ×ØÙÚáâãäåæçèéêñòóôõö÷øùúÿÄ\0\0\0\0\0\0\0\0	\nÿÄ\0µ\0\0w\0!1AQaq\"2B‘¡±Á	#3RğbrÑ\n$4á%ñ\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz‚ƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹ºÂÃÄÅÆÇÈÉÊÒÓÔÕÖ×ØÙÚâãäåæçèéêòóôõö÷øùúÿÚ\0\0\0?\0«‚ŞÂ”(ìRSb„—ìPì@¥4ìqNU¢À4-\0sRb‚¾Ô\0Ğ´ìb€­NnêMYVç*an´ñ¨¡E<-*®*@¼ÓÕZxJr­<\n¤KB*`rjAŒ`riÈ™ëR„µhŒ˜ÄŒc\'š~)İ;PyflfsKš)	â˜°EVxj±ši\0šŒ\r¹˜Áâ¤—erXî¸ÑœÒàÓÂsŒSÂS•<g¡©‚àc»N0E9Gï@\r”\n-;m Ú—i©ñN@Æ(Í8\nv0iq“í@†í£®\r?o¡1\0Zx\\âduæ¥\\š¤&*ŒT€SGZ~kDdÂĞM!<U\"Òi†šcgµQ,3Fi½hÜ=h”8\n\0À§(Ír€<\n@1Ní@\0»sF}éw¨h\ZqOÇ	‘Tç4õ™ê)\n	Ú=ê?=@Îi¢e9$Ğ4‰€-É©\0ªùàw¦5â¬ãI0h»‘H\\\nÃ¸ñ%¼Í3–^¥W\" ÿ\0„–ÈŸ¾ßŠš9—suƒ¬â¤¢ìüŒJ(ó€®q¼IişF¨]ø•™\nÚ¡ÿ\0õü>tº•\ry»rÛ×Cµ7q\"åäU¤â£şÔ²cw	>Î+Í¥’æs¹Ùİv4ß²^²P˜ôÍ_3JìÆT¨§ËÌÛò_ğOP[˜Üe\\¥;Í¡ü+ÊEÕõ™Î$\\wSZ–>/Iˆ‘Úàşuq©c,:¾ı?à‡¸L&±ì5›kào¶Oî7ZÓY}x­R¾¨åœei+\ZM´gŠa”Æ„IG \n¯q¨Ah¥p ôã“VvqÖ³o´ÿ\0´0cÔt\"¹ÄW“Ä\0ÿ\0©‚GúŒT-¬_?Üıãšci3“òÜ…ÿ\0¶ızaÑnÏKÒ>‰ÿ\0×¢ğóH—í:ƒıé£_ ¥&b3%şßÈUVğıÃšõÏÔñ¦\rIÿ\0? ÿ\0ÀúôsÅt³—ròÍm\"MG9ëóÓ\rö–ÍÔë‚ßáU†dÿ\0Ÿ…ÿ\0¾h>—ş{¯ıòi{T¶E*]Ùiµm,p\Zvü\rC6µh`u‰%ÜT€OcQ\rL?å²~F“şÛƒÒDü©:Ï±JŠîf‡|—‘±&\"½A8È\"´Ã·CËPI£İD¤`sÔ×;¨“ÕĞPäjÚÿ\0_‘šÍ¹K‚*9{\Z±&Èr¡K8à±íPnÀj‹w¹íeÔ±4àî´è˜	O­H’sƒÒ«´Q“ò’¦£1Êœ«(^Lë•ki85ø]“ÚË\"«ÍŞ´VhşFSîšáöxxÀ#Üf¦U˜°?ìŒ*êö©¯y9<º.¹¨½Õ\\@1éõsc¤î\\ï--¾»(dmÃÑùıjç›ov3òßĞ\rK‚–°zœÕpõ¨ÿ\0:w0›í.1dÇjë4?	Õ`¹löW=sèkâ6+\"ñëÚ²_6—“î\ZÒœäç;åk•ê¿/CÕÖV\'â§\nÎ+Ã÷ÆöÇrññŸQÚ·â? ÖµW8\'Ir`Q´P:SÅsC|µ=@£É CRNÈ|¥î´¦Çİ1Æ0iQqœ\nC¹˜äR‹Pİ[HÀè*@´¬†¤Êkdƒ·4ádqWvÓ€¥ÊŠçe/°ÇÜUkË8Ä$*Õ¯·Š‰ÓwZ™SM\Z3‡¾Ñâ—%“\rê+ãGš7ùe¯J¸³WX·v%I!k†te\rb{lÎpÒçÉÆØ`E,dZë.¬£‘‘{u®vâÔÛH;¡èj!%}Oj25•­©§Ê0$Àt¤ Pâ\'\n{ŠØK!woæ Ï®;Q\r»¢ìaÓ¥wÍr+Å1õÚò›æ•Ÿc\nO*ë©!ÇB85–{6Îä=VİŞŸ ’0İˆ¬´R ˜g¨©Œ”šx©¹rÏw×üÑ¡o~³Å²C¸{õŸqm+ÌU?Õç95u4nE!\0ò3[:w‡f™ÓÎ›ä=@Ğ¹ºêqÖ†W’|½Õ‹¾¶u†Y?„áG½u©Tv¶±[B±F0ª0*s]QVV<ŠÓS¨ÚØ¢)â€1ÚœzzW9Ğ qœw©OJj(S’:ÔÀbˆ‰İ¹©`ûP)Ø¤‚Ö˜§Ö¤€QNš)ø \0ô¦´ìñM\'h&€Åwj¤Ñï8\0\Z›œœrx§*<“E‚ö1n´İà’1í\\íıåhÈÇ¡ô®í×vx¬»ËlœW5\\:–±:èb¥MÜàmneÓ®\n0;{ŠŞ »MÑO§qK{£$àŒàö5Œúmı›æ5,t5tjJ+–héÄS¥‹ıä,úöe«ğ±)-òã½sø3^4€dc\0úÖœ‚öçäx¥ob\rmh^’I–{•	\Zò¹­\"åxœÊœé{Õš²óÜ»§i ÚA¿†Ú3ÅnAÀ\0¬,J¼(§Åu¨®‡—R£œœŸR1ÔÒI§cš3VŒnTÆ9ÍH‰¹M5ãì*lv®S´CƒÅ;$PÔ˜$õÀ cÃ{R‚GjUP8u É#O\r\r4ç8çi“xğâ¢\n;Ó¶ñ@o¨‰g<t¦´dç¤\\*Š,+Š­æŒÑÖ‰lN9¨7f¥Å&8ª°¹ŒÙ­7­TkG¥m¤“Ò—\"cöpØ–o˜qZĞÄ#LJN\nÒ1±”æØÒ\0æ£#5#œRŠÕ60)•!éQ3\0iˆ`isM kîÚœ)£Ö”SAKL£“Å¸õÁ$Ó©ª1N¢Ã¸f”u¦çšPh°\\qéE1¤\npzQ¸A§b[špéQƒš7SH–ÉIi¼SKfš2xªH†Å?7ÒÒ“ ¤ÎsUb[<ÑÀ¤â¶j’!±{Ñšh<Sw|Õd$b cÏJ®î½)	Ç¥\0ˆs@4Œx¡xÆáâL)Ã¥1š`=©{S°‡ƒJ\r0t¥¦!ù£\'4ÁHç\"€)ùúÒ¡ÛÒ¡Ï\'Ş¤^•D“n¤Ü*ÄS¦‘-’«f‚Û{Ô`üÄSÿ\0\niÇd·N´£¥5Xô¦†9¦Hö8¨·JXšnpÂ©ÅÜBæFM-? ª€ñÍ1ŸšG$\nªÒÔÑ:ŸÿÙÿáÄhttp://ns.adobe.com/xap/1.0/\0<?xpacket begin=\'ï»¿\' id=\'W5M0MpCehiHzreSzNTczkc9d\'?>\n<x:xmpmeta xmlns:x=\'adobe:ns:meta/\'>\n<rdf:RDF xmlns:rdf=\'http://www.w3.org/1999/02/22-rdf-syntax-ns#\'>\n\n <rdf:Description xmlns:exif=\'http://ns.adobe.com/exif/1.0/\'>\n  <exif:Make>HUAWEI</exif:Make>\n  <exif:Model>U8650</exif:Model>\n  <exif:XResolution>72</exif:XResolution>\n  <exif:YResolution>72</exif:YResolution>\n  <exif:ResolutionUnit>Zoll</exif:ResolutionUnit>\n  <exif:YCbCrPositioning>Zentriert</exif:YCbCrPositioning>\n  <exif:Compression>JPEG-Kompression</exif:Compression>\n  <exif:XResolution>72</exif:XResolution>\n  <exif:YResolution>72</exif:YResolution>\n  <exif:ResolutionUnit>Zoll</exif:ResolutionUnit>\n  <exif:ExifVersion>Exif-Version 2.2</exif:ExifVersion>\n  <exif:DateTimeOriginal>2014:12:27 13:36:19</exif:DateTimeOriginal>\n  <exif:DateTimeDigitized>2002:12:08 12:00:00</exif:DateTimeDigitized>\n  <exif:ComponentsConfiguration>\n   <rdf:Seq>\n    <rdf:li>Y Cb Cr -</rdf:li>\n   </rdf:Seq>\n  </exif:ComponentsConfiguration>\n  <exif:FocalLength>4,3 mm</exif:FocalLength>\n  <exif:FlashPixVersion>FlashPix-Version 1.0</exif:FlashPixVersion>\n  <exif:ColorSpace>sRGB</exif:ColorSpace>\n  <exif:PixelXDimension>2048</exif:PixelXDimension>\n  <exif:PixelYDimension>1536</exif:PixelYDimension>\n  <exif:InteroperabilityIndex>R98</exif:InteroperabilityIndex>\n  <exif:InteroperabilityVersion>0100</exif:InteroperabilityVersion>\n </rdf:Description>\n\n</rdf:RDF>\n</x:xmpmeta>\n<?xpacket end=\'r\'?>\nÿÛ\0C\0\n\n\n\r\rÿÛ\0C		\r\rÿÂ\0\0¼\0ú\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÚ\0\0\0\0ÁŠËe…E……ŒË °§¦¥ÄÍXåé=E·TµÅÉJ•Š\"’qe~“× A©Iq…Æj\"2#C—XÂ±«)=ãz‹nm¬dJ¨ĞH.ü¿;©ì# D¹ÉL…X\0­i‡e&©²±ßpî\r(ä4¢FAym šŞ“4Á ’ËA°¨ ËÊVTYSeKÖ6r)#U‰\\¨DK~g›Ó`ƒa;\nXQ&ÀDÂŒqF±«®^¥êÀ©•(%\nªk&UùşEĞA‚Äàì\0 „\0´ÂŒ XÔ­¨²àTG\"¥I\0®jh!r>?;¤È`p``dÈÀZ6MU]Q…M+Xß)î¥aß›W³——}`²hH4(ãóúd,†6ah–i2:rGs!²o\n¥ÄË«6¼«ëeÄ©2lú¼Óí6¸ı;Ô¶(!çht`êO˜ŒL¦¦T5­³$³”WZ~OC¡^….hŠ«SèóÇqŞéüï¹›‡n®Æ|Ül8»:õmgúFÎ¿¦Øâ[\rÊÁ£ÒËüFÎ*š,UEV²UéŒ´¦Ñq¨²>³Ş\nŞ†hõ);”M¹²ñv7<æüÜí™9#¿Kw›QÌİ¨lãôÛmêùÚ%—’2T™LŒ&4ĞšY¤–USƒ7?[7“=—/\'nTTeåU›F‚n[ÏFüÜ®æ×•Å‡¾®m°ô<ŞÉË‹ŸÑ# ã	²d2©‡jl‚©ƒ›­³æù_9‹¹ÀÉØå×A³âÓ»ä³ly†Å°†şuº³—Ñnpyx=•Ôúş÷•Ö³st:6c¡“t\0#¼W&àÃqD×?_c‰¥½ÅĞŞä/³é:}ÏœÕ‹Gw3o®üß]wµ×Wô]ÿ\0)è2råW7G¢ààãi İá`a°2+s|mMÎ;¡ÁÅÖáô¶ı‡kç4ëdÉÍßóvY¹Óö[ŞkÓ¬]lúB]àçô]2ÅO@Z‹FBÔ80È˜\0@ÌÕi¢y1åòÜ®§—ÃŞæõ\'Ôu¼y#«¹ê³u¾¹åtÊ—ŒŠUaçôœ`,Nö™6MĞYj @@ÊR(¬9ñ|-mÎ.§ºUìèõ+Ò·ü®ÛÕ.j©‚\ráçõ\nz\Z##td8â.c!C;.r@9V©+W22Ğ·³³©ÑÍ®•9‚F€bçõ­CPÃˆ!r Ù…•†¡+H4¶«\nÅeFŒ˜¢ª€Ği]9½m\0XB€ãˆƒ ÂdÈF€š¦rÍƒ•en]¦q*eEu\rI‰çu9½P\rA	†á á\0ŠÆ•Ìhˆ´ÍJ…¥—*&r2B¹-*U;¹ÌêÆ8 ˜ªÆ: ° Ô&4Z.CHPX	1ªê¤`%S/.~gL4AØDZp\" Ì 5–çJˆÑiZ±Ê	Ú5ÒA3*¸,EtòúªÇ¤Ì, É%„\nA•5Xì¬lB•‚cN\"Òµ¢ä4ÃCš)ÎGenl0¸,4¨¢)5’¦5riS/\ZµJ¶IV–ÔsY7‚3!9r?ÿÄ\0)\0\0\0\0\0\0\0 !10A\"#$@ÿÚ\0\0;}+šâŠ+‹*İQE	ÄaÊæq³³Ú¸KŠæÊ±»Q(¢„¸í±@H¯jâıº(í;NÁ*(¢Š®(®\"…èıØ„QVE{PŠæ¨EP½Ÿ7ÅQÚ~ì¢Š(¢…Å¥PŸ+Ù—ì—4~…ëb·é|)PŸYgï‹áú¯Jôl\\w9çyå3u<ZÄ¿Èà…şHŒ}{Ì{pÌ¼‡}ÿ\0ÈrDrD<©\"D<Ô=˜£c®C_/çàÅ×q®@ÏÖräŠNG‚rréù,yñİ–)iõüˆÖŞÅ´”ÄÆèòqdóÇ\ZÉÕpÀ—Z‰ù<Ó>NÔûr1ãÏ±`Š#Z+cjRÍrd‡ÿ\0\"³¸ïÍ$¦-jrÅFLFl‘—MÀÃ¹<Sé½ag<”E÷¼et²aûòâ‰ó`ÉQù,£ê{›”ç>h¡I¢sú92Pt±´\\Ñæ!´‘£Dz´ˆîáÊdÂÚŸÑ±…d1dxgÒw¾D#ûâJÇ®|q`GÆ>:>:>2>4O‹áÁŸã±é˜Ì½.16±dƒ.óµHzçÆ™\ri“œµÍ}şÒ9±ì°¼FÅItœïUíØP‘ÚQÛbÂ\Z<Hñ#Ä¨w,ºÆÇMŒŒº3„Z¢?Bú÷ÉÊ^H2dõŒ;/ÏtsëÊy:n§~xD¡{4$äF	Åq³.½™µéOôã8äÄñK_—õœ%ÚÍ©ƒOş*ØkK,\r\rœ‡Mé«R\\¯K;H‹ÙğâdÆŒºé™°3c[¾2=|±ìÙ‡Çí2Ã´Ş¯‚¼°Ôw¯­Gë‹â˜ÿ\0Q¶ûE\Zãûö|K\'ûNVx2àMlkÓÜÕ³Äµå‹weµ$–Nìï¢éù3Ã\\×¢úõ_^òúKö‘ö5fl6e×FÇKR};cáÎÍ^‘›bZšpÕÅ^ÔÛJ†Ye–XY|7E¶ÔGÇôÕ™1Y,Lñ²8lÁƒ°k‡Ãæ*¸Hl_e~‹\\6w\\’öhí<h:®_|Ğ½+×û¿à¯EËæı×ğ®/†ÅÅûIú!z¥ët\'|Ye–_­ñc;Kş+ô›ú±zş‹/ìe–Ybø2KéYeˆbûá1¾(—é/ª¡ÈîáÅÊâ<·ô_&şÆMÑgÿÄ\01\0\0\0\0\0\0\0\0! 012\"@AQ#3B¡Ca‘ÁÿÚ\0?ö¶èî½]{óQG.ŞÊı\"­×º>Àômú‡«oudQGıQº9YZëJ¶qRË?€_ÒıÇ€†·öÊğÊ†îÛ$rCæ,®¯ÉaÎ39İ]j•G†š¸õ‡„pIşÁjÈCŸì(0ˆã7êXi€ğ!Ùj/>¤#ºFx”ÚÙ\0´›§AISãè*zIiÏ©]_-ó²²ÙjŠĞ¸­\\aô¸¥qÒÔÿ\0€­\'Òc6Ü&CgM®¥€1‚F›‚©§u3õµSNÊ¨õµhZjÆ\"tuCØ­i²u`Btvì£©t~—nÕQF×·OÛéZÈæ>‘â^Ë‡!\\ëğße\nv®>‰¿H0ÊÈd‚X¸SínÅO$z0øåZûCGWu´Ù\ZªÈQ—MÅ£>BÉµpIØ©¡Š¡¶vêL3âŸÈ<\\¦¤¨§òjd¥ÜnœÛ¨¥t.Ôl-°>Ç+Œõ+…p®Ën`…“t¹PCHÖş_’² ))!—ÉªL1Ÿ´Ù\Z	[âW±½œ¢ã´~aO•­ıEQ‡ÁSêoµQI5!õ\r“dN±Tÿ\0˜×Â~BwSQWZ–¢µ­İ2k*|EìòİG]†ÈFÈ›¬StàÃİ~.¥ÇÌ¦ÖUÇû“1[úfj\rk‡”ÿ\0¥í¨ô?º«Ã\\Ó®ø¡¶“u?\r§“ºî}…Ğ6M–É’¦ÉuSÛØ¨elÌô¬Q®±Ú¾S^ƒ®œĞTR¾™úšªìæŠ¨Ô8›H´ŠJØ¬ªuIÿ\0Îè>Ê9Ó%TÕ\']btm®‹S;Èêc´»ºlÖM&âê˜ê¢x(½>DNWöwM’Ê9•%^ŸK»*ü9•ƒ[6rš	)İ¦@šû çJCİU<RRğGs™ÊçÚ‡Y6R¡ÄÇpe5@Òÿ\0å:“;ÿ\0êuM-#m\0İO+§~·¢‰Èû;çu©kZ‘z{®¯Ëmu©k(¹¯Éoe|%Ñ(û›ôO%Ç²¿1çî¶é_’ÿ\0\nü·Wéİvë™G©utrøG1ºøE|f×Úç1Ïñ‘ÌÕ—ÿÄ\0,\0\0\0\0\0\0\0\01 !@\"0AQPa#2`bqÿÚ\0?(][yÄBı{Wş~Mu×u¸²#š¾…’U-Š+Â¢˜“%5LY`s`s`K#ø1cÕêeROàæÅ·DrÉnFJEuß\rXÙÉg%‹\n9Q4AnÏé}“}û\Z¾ÉGYté–&&aw\Zlp%\\ G5îÂ~$oÃ¿ËÜæãGê!ğ?ÈşÔHçÏìygöje–_©;Eı–JP–æˆ=™ÊÓ%ğG#‰Éûä&\\&Oì<M3¨»1Káôé4”QE2¸¾•ätsœ·/†¶…Ôvf•ğS[Ìã¹‹±,d-^®/Ú¢(Ò(Ë\'‹åâFWÂ;±jõ1¨#V9Cÿ\0bœ;Ê¤©Š?ÉıÏJğš²XÌ˜G,R¢,ÅêÇØœ~ÉÇI’‰)¢é%…ü\n,„tíâ8¦dÀ™,:;›l~6m,¤Ñ<*FLm-2½I”(ø•ÆP³&\Z}…é0fq\"ã5Ø”]ÈâPõcªZ‡Ñ^\rt5d±!b­„¥eÈ(Ê{‘ì©tß‹C‰¤Ò(‘‰]OÆ£J+‚òWJò«İ¥ï×²¸WWn‹ı­xL®;•Ò‡Åíí/cÿÄ\02\0\0\0\0\0\0\0\0\0!1\"2Q Aaq‘3@P¡#B`’0RpráÿÚ\0\0?óşåéØİ=8˜lÜî«vJŸrj¬ê†#úylÈ-Õ4S#£»wbøiîFªB0$ò‘8µyø‰Î¦OE®ü\\¨LÑèak”ÃdQÎˆEÖ‘\'ló³“«‰Û§æxÉù»h·c)Ÿ»H¡Ïvï›`æ‘³_±8¢§j³àíwVÖ±UÕJ{T•Ÿ¹$D3Ã¢+û˜œåê»¼ÅUª‘ÊœÊ¯S\nË™M²·wÜù^„ğ)­ä49êAKX¹)Í7de(e2™PÈŒ‰ØÈŞÇ†ŞÆDìxhdB7IåÛ9•8é7!ˆ’Àƒ¤º‘JJ Çh¿¡®õ\n(@¡,$k¶òD\'fCÙHÙÉt ¤haÊ2Í5Ÿ–ÑH)\r¦ÊORë¨JN%3,:š¹xùIí‡$ISg8–|Ê	)öŞJì\"BrBÿ\0Êß9%º¤’÷õ<7vöæ#[êúFŸKOÑ“wÿÄ\0&\0\0\0\0\0\0\0\0!1AQaq‘¡Ñ ÁğáñÿÚ\0\0?!·HQ²B†‘(„à‚h•Ø¢b ‚-bOg`eo¢IÂBXX„˜àHvl©ô‹,£ #ÁŠ\\\\:×Á\n^\rsG•Ã®$„k\'è\\¸¸$472Q*„Ñ€A\"rg_àH„¯%Ob~Ã¯¾>½	`e:á=ˆZ…¡` —|©x%“#ò\"†zMf´(à¸•ú#b´üØ‘×\r\r–ào‡fòA> ‘D2%„Ğ‘2$!¢ùĞ%9ÀM3É.&9h±‡–%ôdH‚‚D4 ãĞˆ\"X[	®U£.\r,·à®£ãÈÿ\0 ù\Z™Céÿ\0uÑ`›ØIn‰ì7x†…h´Q*f!¥´#¶‡äl²·ÂGt¾Mâ>ÅÒd›Ä_è3ÿ\0şÇ;>ŸØĞ´îÓ¿¢›¦ïä\nT3Ä>²*<Ú2ˆ_Y/w†Ä¾ÀJˆÂùh¦Ôƒı)ßg–L}\rßÿ\0x£è´o~‚ÕeâFjÂïÿ\0¡ä¾¦eÛX5´ª1NI­¡Ÿ¡ØÙzc9q:§Df Æ‚ª¨ÌBclÀ¥L´ÃBd×ğüŒ¸™Ï{L§m1PôçË¢g±èüpn“÷ÒÌğÇ èoˆ3ß*1&GÈÎ ÖæşgPı\r³Øì{·ğ)Ú„Œàn¡zSYºöÔb8¯ø‰?ûŒš4ÜGdèõö+yÄğA	Å¢îŠ[Gô5¥ü#Ãğõ¿ø„\"ÿ\0Òoå!ÿ\0P¾ÌÙı#ÔtÛò7Ëğš\Z¦ç§ÃÉm~\\4…¯áöG¬>ö†5ıøbD”ÿ\0¡İu­È©Ü_çbu±X¸‚D\Z>„ëb£ÀJ–`º×ÙáVz‚wNrÆº‹o?­\Z,¤=ò§¤t¼’eoÊ5—¡[}?€ïû¼_Á8Úb>™{Gó b¥´ŞŠ´ùD$A(#zz½‹‰°²RlˆVÑsš±ìƒçĞüŠò‚²ˆna—ìø\r¾}3$Şß&(úV(ûbñ¸ó/Ñ^‹ô¸§j¾…ş	LÄ˜Rì2\"ˆ±é‰ÚG”<Ô½ı!YBµt\rS¼”-Y4Lø,ğaOk¤*Ø®œ-\"QYà†)+DDl€4$‡·]§İy1V×¡b×ğŒß &\n.üS¬8†ø\Z!PF›bèA!`ŸÆ5\nÏø\"¬Ï„F^ µĞËuŸ±\ZX×mK ğHû[o±[\Z\Z¯Ñ£èIŠ*xVğFD¤üšÍ	î$)0ÌBÏb\ZáVètòEƒ\0Ôà‘˜/é›äi¶v‰ù3\nLÈ‹ñ¢Ÿb©\rH¥\"Œyâc£3èGN-ÁğˆnlBáw06!åÎI–ñ‹…6øœ4Jà¤³EÈÙøb¾2Mp˜†ò:»/(EFÇûÜBd¦Ü6.áv¼¹nŒ—1â\"ğáDÛ,\n]!Bö%>FæˆxE\\åğ¼!2”Nšáx¦X™Óy5ÃbïÁÜpÃÈcS<•ƒw%C.D.oøX&7‘\n6ØÎº!e†Â\Z¨…i‚„\rºd JÀÉLBå¾º4o„!ğÔzÇ‘`ØÃ\Z”lw¡†K«ÍÍ‚ÿÚ\0\0\0\0\0\0&CóĞ³“ğó¼Ã¶Íz­‘;Ñ1°>âöèİ…õ g\nïŠ|›ú`.æèãS¥bÎØOI´à•œã6‡¦ëm$LPÆ¼ğu@ùçP™e&,¦¦6. Ç€8øÀºÕ’ÿ\0¥P!òX¹kÁìâ¸Ì>\n¼á+èR¶}´¤T)W.Adh—Úè˜ÅJgãØÌªÏzÛX„»¥AàD1KÄ2G×>„Ø“çëößZlÚt€[ i÷´‡9Écbše÷«·*è„oI”)òTP‡]ˆTõ¾èLœB÷öi¸ÆÆP­Ó¦¹eóäxÓ¶[Ê-I\0DÄË/Î?w¡”HùàQ\r;Ê6ÌˆZ#Àêy›ö©^“˜üQö\rçÔâ1O‘¤<1ÿÄ\0\'\0\0\0\0\0\0\0\0\0!1AQaqÑ ‘¡±Ááğ0ÿÚ\0?{ÉGtZW´ÆßÙZĞÛy,É`êy¹é’¹Wz<è¥¶1²Ç‘ÑTab„G´:XàÇ½tÙèiâ®¦`µHÙénõhƒlHè”Õ2ÙèğÏB=‘‰©£ÀÖbéƒÌ6p6!2”=õ„ë±—ÈĞhycC¼h£ÙŸ&(†²\'¹¡*Äˆcb$èû‘ÊL}XÛÛ\Z(dèüHoWØeÓ%éÇND$\\R™}àccœ\rr^âLã¢^G¶_‚—#$bF™†dŸ\Z	ÈĞbÍ\n=œáàÅÈİ%Ù+Ÿ‡=ÜÑàz=‰Bb\"vèMĞğ‘³µßKæ4+õaŒ1ıê Àø~ğ}êB^p*ĞcŸñÁB‹bhˆ%ä¦Ä½¸ûe³÷±†_9ûÕ|ı…ë¤_±\"e©w»Ü‚Ó&åèá\r%ìÑÌ~‹Ş…²UİhS,\Z¹Ğ¹½Ãi±¯lKô°ŒŒ>>1EYò^ä1.á!í¤”­­ï„8SMe$Ó\\?¸˜ßÙÌ•µÙC–XmFŸL!M“Ét…s·ğ=eåÉz	ØdğŠ‘{\rp\0oÇ÷\ZÕ² UšĞ‰\\_@Š¢ùH-ØË,¥G¨(™ÑºöÏŸ–FÇÔ/‡Ï±Ç®ë$Äö‹d‘V½\ZÜİŸ¹·Zî²„b€…¢}Wq#.Ïös[<™FYbbè.b¿%à(ô$ú/Q?%\\BbbUİwõü\r ÇŠ‹Ü[.ú†÷ë´&1Ï-¿ÀÏ$7âŠªDùı‰áıøéŞ¿=„<#a1^Oú¿‘ØÄ°³ö95„&ú¢‰¢‰Ãä	æÊ!¶`/¡Ñ`ó²ÅÅSQY£Õe¾Ãµ‘ùcKmyÉB|¯feOèùpÄÍFŸ°ô¬sìö*¯1ë±”Hâ!¬¥ø4Q3e˜)J8]\"›8ÁıAQ¶VıF‡a¡U1ISˆ_¥¯#àû¹÷ü3UŸ ‰æ¿ÛÂi$EØ¹½/EñÒ˜(ÙCš¦CK!VÅäßúVÄƒ¶QÂu}şâPÖ°;‘¾ÂnÆ:+ÂüW¦Ÿ\"¤fÿ\0–ŸoÑsù8~¾ã£©ıığk>kò,¬ŒjqŞäK¸±Ò«?Ò¦c}-øä‘èª³Ùü†4Òôı‡Ê{¿l`u“(†Æ\"şB^QxéŸôo‹‘¼(ÓsÒ„7:ìÍº4ZAFğ!÷)Kñèn”ğY±´²^LÆÃàcÔnjlÿ\0§%{#2b¦\\±~X‹Ë(Åƒ46WÀŞFF¨lxÁÁ9…]‡ÜJì^NKM=•.Ö^àÖ\n6e˜¥ƒxîiã£sklò*Y+Ø¦áê¹è_\"pâ¡¶¶Fò-6ÄùEÍ2L±:eƒ·¢£Ye\Z<c}†éJ‡-­£	x\ZÑsÛ[cÎFê+˜†Ñ½h¢§Ê!1²äo“V^Åg¨ğW±ç\"CÇ˜›#±tá\Z›(İÃ\Z˜†ò‹ğ<b”†,›Êc!»n2İ¼²œ—8\'+£m\rClI:0Np.ã²L˜‘R,:!Ş¦ò%Y)•ÆÄ´£Á#±÷;†¢0M\re!,IÿÄ\0&\0\0\0\0\0\0\0\0\0!1AQa q0‘Áğ¡±ñÿÚ\0?‹Æ8z¼ÖÏäIÙ‘`X/ß	Á^o\"y—Ş“E¦{òÄ”ÑöáD8(ô%Ÿ†6v(„z\ZÉ9[(”û	ùôJ^=>0Tkf%6øœ%ğÍ.0¸B‘\n\'EŒ3FEÄø\ZéŠÃ:…„dß	¾)Y|‹”Ä&%‘>¡¡Qs‘¯L7“°`Eœ¡1D\"y1ÑHzë®\rd‚ŸYÆx…3¡;±+Â]“ÆÍ±ŸAü1ñGeó’Ô_p¸3Ä\Z•R	,m0v…ô8ßëˆÇ±xü.Œk4oÑ,í-vÅ©¦&!¥ñF®\rO\"èñö$ÙLH_øh«üÇ±´6x±7¡¾„ŞÄîáÿ\0è–ØôÙ6iû(õ;©˜QW²L‰¤\n×³°^Nˆ‡¦<¢Xb‘\Zpc½Ã˜oƒYÀñ‘çûOCFBX\ršƒf]Ëm¿Ù[½”ÖÆÖÑØ·¡3­²ÿ\0¡GX$Ÿ£Ä¼íe¿f)¡b&-`–Zˆ‘&ĞÇæCôGãş—F±+CjXß¢¤)–c±˜¢\rtÌûb*©–Ø-şEo%›Ğ±Ô„­W’»(³¿ÓŒôoWbo%1šÛ¦#ı¾*1àjó$júànzº ˆm`›ó”%`²ıòµÀ¦´ š˜¤R¡³Àk3ÌA6¿>Fâ¥CJ¶Ïe£GßàœA2º06Æx+Q\rVIM”=¦ƒm*×ƒüê…¬åà]ÁkS%mŠ\nˆï‡¢~(lª*Ë¡³xcTÖh‚¤fR¢¤’u‰A\"1ç|u	L‹%x”BèuĞËŸü0/(¨~0húFÀ°TCM‰Áä¨ÖG’|é½ˆhZF4¬;Õ¬eÄ8¯‚Q’ÀràÊ¾\ZlûøB5Ìò[!W³Ğép4ğ(ÈlCp~8¦ÌI3’\rdgd0o\\a2\\‰Y!—„BvÉ<‚D(˜•àHömàÈÜbö#cÂ†hğÇ’œtc„¼‘ğÔDB\"Q/\"PˆaÁlY:#ë‡¸QqĞ¯Fú#=q	*A)“G°—¡dH£//‰¦*°…å\"È4f“²Q¨à’&\'ÖÉM’­B;á\ZÁ&lH®Äšğg®$|{‚p‰Ş(lˆÂ\'B5‘%¶}É0AR`Ë#Ú\'hŒ\np­6`Œwb3¾%4‰Q&øËÉº&wÆÄ˜½ğ–HäYâäß\ZØŞLù\Z	\Z¢Ã†	Q‹%	™Âq‘aŒ“;á¨¨•ØŸcÃŠÄá%{$hZ?ÿÄ\0%\0\0\0\0\0\0\0!1AQaq‘¡±ÁÑğáÿÚ\0\0?ÇMO:„—Ë\n125lºãÃâ]¦xÕ¬Ã¦\\À•h|Î|ògªXuğC*ˆmcê)w®âP¦š”\0.ÒËÈ,¢¼L\r—×PÒß™gJùŠ. G¸P:”È+1\'Ã)¢Ø	 e9æb@X}¡UWÔo\\ÆŠËxêfP:É™¹—9Â5\r\'/>f\Z¬Jı0V²Á©S!+m¾å’ô€t¦\"[t|MùÆæ?û(ÔFî¢Õª\04>!)Ô9ÊÀq¹E¶·(ª7a…´¤ÉÊ †•9aSTü@p¶[…ÅÑ„&@×‰aDßÜJÛÄæşåá-0Us$,«Ì\rî\ZÓ˜±m]âjã½¿RêÄ¡€ÌzS\\(û‚XoÒ»¨ÆU\rÜ#İñŒRÄ²¶Â#ÅÆ2×(\nf.g¯Ô*`ìîqYê±ñ)¯øè›º–\\PÆUŞckZ÷2·˜ªâX”6Î…|0Çö„”[\\Í‹Ÿ2¯[\"\0ó¸*EüKÑná±Eâ(g0Ã?™f9ıÂøi=ƒL0ÎÌía^á&9ô#Åj®ñîq˜\\¬Ê…‚V·Øˆ%+%¥ÿ\0Àõ?Ë\n«™BLøƒ¾fÀÚÂØ<>Ş&ÆÃ0ÓÀ7vÃémq½=faP(ÌR¥p¹°¤½0‡#¦cçó…Ù9e*ş¡l|ÅŒ:€aÜ¼ÁFQâ94ÂÌÁÆ ğ„_Ä¢ßù–fBıæLËL«­M®9À&^ËvîT”R¦Ÿ÷B¡™ob=¥ÿ\0˜kæ¥cÎà³_†’rÚ6Œ7Ræ€®N ¤¹†§ñ\0­Ÿr¼~¦ê\\\n –“$E?0%Û\n+Lyó\Z\r†aÔy…Ñ}L\'HµqtK\r8æŸqj;b$d¼c3>ôä%CúÀ˜ğ_Ìı+à¿2ïÛ•µX,ñš™LK,Hc˜wşQY{†FÇT½óópå‘QñÉê.s²†b¿Ìó½\"»ÅÅÃó@®˜}ëóšk!ı ¦§SôKj÷³ûYˆ*6i¢û=³I¼P”$\0Ü•¿SxKcú†Ş?B,-|LJØ£ÔE;pPrøK›Œ—eş¢ÆÊlÂã\nù$°¿1.“˜¸™7wâ`ŒW—„ˆˆ;9MzˆM§?¡…\"Z€d@xN‡˜´áÌªUTs÷jæ¬#oKp,æ-Wuxèñ\0•g\"Wì›\0‡îA\\ÿ\0D¯Ú)üÃjİ`ş.eyÿ\0J†}€>ÙäÔ;®÷i~ãnï\náÊAvâè €ÿ\0|°z³ÑÇ¶&ìR.1Å~íqM¹CEïÌh(±•Å(Á÷æuP|cñ¯›ßØş¢\0L‰ƒòJÑê\"@Ì?Ï‰nE¨$CQ•Â¹Šm7$Ô5EhÜÀîX\01±EÙ”ÀßêŸñ\r³ÒZ·²²™—Ø\"æÊ«¿è–#ËıP¨[õş Ùë,kã$e¤Œd$8[eKÆ¿˜Âyˆ«ì‚¤\0yÓ÷öm¤‡y¯*¡~Ø%Àß†\'›¨_§!P¢S„>Á`oıDÒ1q7R—)ßée\r-Ni×P0ñ(†.º™ İBïºÌ>°xÜÎåÌÓÈ);yY€ÑS-NSĞfŒ\nq«¾ËxeñıLü–`pşãÑ¨óÌ\r¬¥–»Ğm@¯E\0TWa°ú‰Í`F×ûÔ|é¿s‰†ETVbŒL€M¶‹(ˆŒËõrüÉ\n1êZª©”F7\05\Zq*ˆs·p±uªÖb÷Jíÿ\0€üÆÔ	‹0.qVá5.â\"%PŞæ-¿Øæeg84<Jp.læf@^¦vuâÉ4ÿ\0ì¶/‚»?¨8\n.0Àº~™¨Åˆ~›©bTª`Ä«ãò„¿pÛîgâ ã4ø…û\"l®\n×=\\CaCÉ¦¡÷º\"ÍÂ—ù˜*`Ö W‰b/\0`ºÈÇû .VáŠAÀêF¿¬N?òğVÿ\0”Ä—rK>ƒUùÂº³)‡ÔFUÆà8:ªaV]EŠP«Xª–7ªâ;“Ò^íÙ¿<E/h\0%e‹›æ†}Şó•\r ¢ê\\Åc¸IƒJŠà*—yê(¢×4Â!ˆ²iÃxõşàüEŠş¿ˆe¤·şWÏÜËJpQ•CÊôÄ¢]ÅçGûÜÈ\Z;ƒ(1‰G=xg¨õ)d9:#1y¹‡¸‰1¨„ÉfÎú€˜÷Üf^î»a„l‰·™¶oWİSP&©³ Šğ)B˜‹÷PpjdYâ]ûvQaõ¸Ö[üBóg.Mz?š‹œ í.æÂëóo-J-—á‘ÖÛ]±t¼ÀBltó.%”ALÚõ³qâå%¼FV±Ìqp4‹˜Æ!|Ôø™\nıF\\[‘3õ\ZªZÖ*)aLW1€¦ûU¦\0\\,0x¨#®àF®åxw8áHVˆàmex˜‚÷˜â§Û¨[‹¨gû”â\\2ÚëPÜ;™N=Á<*d4õ\n4¼b¡Œ´ê,ÌÛãÆğrJœ`çuwémUrÛk>%ğ‚G9>%Ò\Zu‰dgÏ¦ò÷|usÎcwQ”¨  Õ³$Z·(m¹ƒ©ûrÆ®£©gœJĞo¨\0Ô´*êb¼9•„ä#f¯&EÂÃšñğ~ ³³Ä(S737˜œª_şî£e@J\Z”ûŠÍş%;¿1[É‹•\nüF×Á—á™*ë1<±Õ¶]¥³ÿ\0(ŒfQAb[ûˆ÷ê/!/ŠŠ›}D7¨å¹E¿ÜxÅ¯q wêT·P	‡á()çÄ¡;]¬A“p¥«<LÕ»ğCN#¯™`e)âÒ~`]n3šÎîaÿ\0Øaº¢öÀ–¹cuXŞa2íx¯MLÔ»:†ëó\\ÔP Ü]¹‰{©s°—™¯1¨2¹™·•)ºc0,½ó+bş%r.üÏ1qÔ¦·¸ìÃ—²2d]‰C™†¾ª\nÄzÜ©{Ì\r_0GˆP°Ï™Mssk/2Î¢UÀ•ú‰9b®°ÅBÔ©Vÿ\01Ê«3†\"ªğË˜/MêTÈüÃÄ±İh†(«<@ëÌ­ßS	ã–QÛo¡u&åæ˜8Îf›/ÌoJÏ3³©`ø›†^»…ÁÇE?2Ëñ9ºâ_¸¬B±Ã\0ØKhç‰Ju˜¡»ÎØ¨ÙL†ÊÌj•òÌ\04sF¦ÁÊNcÛÔp·^a9q	v&º—\'Ô¥p±©|ByÍE£©™äf9)g©Xì¹·Äz‹|ÔĞó‡‡˜—¹î(>Xnü2È¢[¨²¢æÓWÇQJ¸§<D@âf¬àb±ãÔuûEÏÿÙ',	'image/jpeg',	0),
(25,	'Tesafilm',	'ÿØÿà\0JFIF\0\0H\0H\0\0ÿá:Exif\0\0MM\0*\0\0\0\0\0\0\0\0\0\0\0b\0\0\0\0\0\0\0j\Z\0\0\0\0\0\0\0p\0\0\0\0\0\0\0x(\0\0\0\0\0\0\0\0\0\0\0\0\0\0‡i\0\0\0\0\0\0\0€\0\0LHUAWEI\0\0U8650\0\0\0\0H\0\0\0\0\0\0H\0\0\0\0\n\0\0\0\0\00220\0\0\0\0\0\0\0ş\0\0\0\0\0\0‘\0\0\0\0\0’\n\0\0\0\0\0\0& \0\0\0\0\00100 \0\0\0\0\0\0\0 \0\0\0\0\0\0\0ú \0\0\0\0\0\0\0¼ \0\0\0\0\0\0.\0\0\0\02014:12:27 15:49:07\02002:12:08 12:00:00\0\0\0¯\0\0\0d\0\0\0\0\0\0R98\0\0\0\0\0\00100\0\0\0\0\0\0\0\0\0\0\0\0\Z\0\0\0\0\0\0š\0\0\0\0\0\0¢(\0\0\0\0\0\0\0\0\0\0\0\0\0ª\0\0\0\0\0\0\nˆ\0\0\0\0\0\0\0H\0\0\0\0\0\0H\0\0\0ÿØÿà\0JFIF\0\0\0\0\0\0ÿÛ\0C\0		\n\r\Z\Z $.\' \",#(7),01444\'9=82<.342ÿÛ\0C			\r\r2!!22222222222222222222222222222222222222222222222222ÿÀ\0\0\0¼\"\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0	\nÿÄ\0µ\0\0\0}\0!1AQa\"q2‘¡#B±ÁRÑğ$3br‚	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyzƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹ºÂÃÄÅÆÇÈÉÊÒÓÔÕÖ×ØÙÚáâãäåæçèéêñòóôõö÷øùúÿÄ\0\0\0\0\0\0\0\0	\nÿÄ\0µ\0\0w\0!1AQaq\"2B‘¡±Á	#3RğbrÑ\n$4á%ñ\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz‚ƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹ºÂÃÄÅÆÇÈÉÊÒÓÔÕÖ×ØÙÚâãäåæçèéêòóôõö÷øùúÿÚ\0\0\0?\0€)g“NUç=j@µÆ•÷:ªÓñJ¸&ªÂ\Z4ìRJYqÖ˜—ozMã¦	¥œò0)„Êô$d)©V5ãš~) ±X1^«R.SÚ=ÔÌ2‘ÇH–…+Í8/£Š´KCvÒ…æ)@Åhˆcx„T˜¦‘Z&dĞÌZL\n~*7;jÑ6\ZÀ¥FÀ`Ó·“ô¦2ûÕ CO#“U$OœñV·\0j&Ú[µbÄÇ=jPÙ8¨‚6ìŠ•ccŞ¼´wÇZ3€ÓÒ0)ÛiÜğÄà‘O\0éNÀ”Ó¸ì ZxZUSÂæÆíâ”)áiÁh›x¦‘Î1STg“Å;ŠÄE\nœ¯åJEJPV­ĞĞAéN¤;Ra»Ö¨Í¡Æ£gŞƒîj\'nËVˆ`ÏÖ $ç9§İé¸Íjˆ&˜M?8¦UrlFsëIZRi¤óSqÔb££S€â¼Ó½ò¥úR\n}+•aÓ±éHiëÒ›cH\0æŒP*E®;Šv)x­4åºf‹…„<ŸjR9¨™¾\0=)Z9rÀãÖÃ”G•ÔŸjÏc÷c?2Vq÷V¢by VĞI™ÏBròàSpOŞv?&H\\–>\\×JIîì²8¨§@²	CÖ˜\\I/qÍkuc	&Ÿ1\"£&—w˜Ò¢õ`*¦Âà\n1î£ïgéUùáIªåfnIu,1¦’*“^±è TFæR~ö?\n|Œtt€qKÚR•åØôĞ SñÅ1zÓ™‚¯4XhwZpÇsQ¬ŠÂ‘›-Ç SQ¸ïbÊàĞ[Œ/&¢IèHÍYD\0T5b“\ZKu§±Ú=éø¨f9ÎŞGBiÅ]ƒ#3IÀ9õ¥IÈéÇÒ $c¨ÌÁ\nRj7.1rØµ$É§5Y‚ç*ßT¸›Ìæ+Ur$ycõÆ(¥WSiá]®Í”€F¢«=Â«`çò¨Òv$î Œö)·qB@c×ñ¯J	É\\íXóƒ)b­šŠíßÓğâ¥xĞó{Öª6z¹]n\\ğCUbÙ«RFJ0?Z©VyÜkTmÎ)ì¹¤ÛjˆzS	Á¥sÎ*2	=)\rzÒÒŠ	­xç¬8`TR1cŒfƒ <\0iëyR(@GµZ§ØØãF*şÌ)Åb“³Ì³šº{ÙŠF²JÆUE\\BsÀ8¬èœoˆúÖ¬dw­gh“±\n–=ñPK¿ìò È ‚\\Ü+>òwW88¬oš¤ìV‹*­¸wª×\rÉ\0sSG+É.&$a¤8VUµnÇFòÙ³.`@Ëò})‘‚Ç\'ÚµM¼xùüM4E\ZôQùUĞqŠĞXŠ’¨õz–\'‘À\\íïM½ÓÌ¥H\"´ÔĞĞÄœ×¡\n–ØógîeÛZ4gçÀúU–RsS²äwÆ»77^Ôùîõ%FËB«/×æ©7S•¡0ÄgŞª¬Y>Õ¥7¥Ì*ïdA·4òôëVJ…\\\n¬ı}i·s4ŠÄ35\'§Î1ÔTËÅAqTŸr^çEæPÌ<Rù9èy§ÃÑë^SG¨˜©z”Qš)4RcºV§÷·\n;=níTZØ,²H¼—íD/}\nv¶¤q1kP9$UE¶©¿ ƒ*ï–@[É+“Ô™IÙY÷Ùİõy)÷‡çUç‰÷;ç”V	Jû\ZİğäÉÀUûj´“ÅA!}ª±¾8MÌ}…W#›Ô9”Q-İëB—vÇçYow{3œâ4ê6kV9@	R	õ§yÌÇÏ­tŞ’›˜©N÷3í\"»ºb<ÂŠñU«{Yb$¼¬çÜÖ”v,p\"œ`$€H(Ôæë¡2ºáÀ9§”ÀéR½¡e>[ÓšÒW{Â¶‹O©„´ègI—|‘ò‚“Êv)ü«M,‚8%³øTÌ€+W4´F<­êÌ_²JG<}i¿cU9\'&µ$àUY¹ÛQdDn\n”MuÜqNQ…¡n+\ZÔ¹Å4çu(5ÆuÍ!|SI¨ØÖreÄ6NjE\0šO52ÖI»š²`\0)¹Å!`£¯5™“D§%Ô\"‘d0¥F\\g¢i0)ƒÔšÆS“êj’B‹+g™¦h”“ÜÔ¦(ùcQøSC‘A”\Z‹ÉîÇ¢Ø\\(t\n^ƒŠ„¿4ªsZD–É•ÈÍ#Ò\n\ri39L–Ş§cQEÀ§’+ºš²9&îÆ÷¦5+J‰ä´FLŠRsÖ«9*i°$TùrjíƒéÚ”­8ñHMZDÇ;4âj°5*ñÁ®&¡IæšNE9ºTgõ”\"(lSÃâ¡èiÀf²4¹.âÔÑÇ4 \0)§ŠM\rHQêisMß‘M-XÉ˜òÜQQÉ§çµ	îÔ â˜M!<VÑ‰E€iU¾aP«{ÔŠpk¦œL%\"Òœ\nc¾)7qP»äæºQƒ$-ÅDÃ\'9¤ßš†Úd‡\n*7ZRØëLgx«HLˆi¸4ây¤$\n¢w%R@§g¥79üi{\\\']…-ëL-Mõ¤ÉÉ¨–¬µ ìÓæš;R‘IDdÙÅFÏÍ!&ã5CCCóŠP	<šF8æœk;_R®(ê‰íHŠj\"lši4ÜšUù«XÄ†É¹Í1x5*šéŠ1“Ø…Ç­1Wš$<Š3Åjf5‰â›¿”j9\r4&!9¦Ğ\rªÈb1À¨‹óßó§9àÕ3!š$ÿÙÿáÄhttp://ns.adobe.com/xap/1.0/\0<?xpacket begin=\'ï»¿\' id=\'W5M0MpCehiHzreSzNTczkc9d\'?>\n<x:xmpmeta xmlns:x=\'adobe:ns:meta/\'>\n<rdf:RDF xmlns:rdf=\'http://www.w3.org/1999/02/22-rdf-syntax-ns#\'>\n\n <rdf:Description xmlns:exif=\'http://ns.adobe.com/exif/1.0/\'>\n  <exif:Make>HUAWEI</exif:Make>\n  <exif:Model>U8650</exif:Model>\n  <exif:XResolution>72</exif:XResolution>\n  <exif:YResolution>72</exif:YResolution>\n  <exif:ResolutionUnit>Zoll</exif:ResolutionUnit>\n  <exif:YCbCrPositioning>Zentriert</exif:YCbCrPositioning>\n  <exif:Compression>JPEG-Kompression</exif:Compression>\n  <exif:XResolution>72</exif:XResolution>\n  <exif:YResolution>72</exif:YResolution>\n  <exif:ResolutionUnit>Zoll</exif:ResolutionUnit>\n  <exif:ExifVersion>Exif-Version 2.2</exif:ExifVersion>\n  <exif:DateTimeOriginal>2014:12:27 15:49:07</exif:DateTimeOriginal>\n  <exif:DateTimeDigitized>2002:12:08 12:00:00</exif:DateTimeDigitized>\n  <exif:ComponentsConfiguration>\n   <rdf:Seq>\n    <rdf:li>Y Cb Cr -</rdf:li>\n   </rdf:Seq>\n  </exif:ComponentsConfiguration>\n  <exif:FocalLength>4,3 mm</exif:FocalLength>\n  <exif:FlashPixVersion>FlashPix-Version 1.0</exif:FlashPixVersion>\n  <exif:ColorSpace>sRGB</exif:ColorSpace>\n  <exif:PixelXDimension>2048</exif:PixelXDimension>\n  <exif:PixelYDimension>1536</exif:PixelYDimension>\n  <exif:InteroperabilityIndex>R98</exif:InteroperabilityIndex>\n  <exif:InteroperabilityVersion>0100</exif:InteroperabilityVersion>\n </rdf:Description>\n\n</rdf:RDF>\n</x:xmpmeta>\n<?xpacket end=\'r\'?>\nÿÛ\0C\0\n\n\n\r\rÿÛ\0C		\r\rÿÂ\0\0¼\0ú\0ÿÄ\0\Z\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÄ\0\Z\0\0\0\0\0\0\0\0\0\0\0\0ÿÚ\0\0\0\0Íæu $ëQ\\n8œF#™SªËB€†`X^aJO™QÓ¶«´Ë#iã\\=7îÖİ\\O`ãÜ1c­•\\Hêå£¯]”º¶U¢†@ê»&ÈËèG”|ÿ\0³fRÁ±$€$1ã9Ä‚@\"M˜«²1ÆˆÌ¥”WEd‘lî9‚ƒ•’D÷Ïzúv Ä»-QÈÏ‹q$8•*Œ+0¥&ì¼UH¤h3°WNm1‘B%ÇêÑ˜_N8±.àAq™Û°‰ÅÕ™C¨tVN9Y ë\n/¬¼ÂjfT#m~\'¯]ªœÛ{Ùuj`ä‘‰Ã¶æ^e-92\ZÊ—æÂ—+“d8„É0RŞ—‡ê1/³âAc,bû6Õ‘6bz®kÀÚ.ÊÎ·çÎZ\\½ÙG,À˜Ugö<_L«¾c³Œ[pj)cœ\ZU•–eÛ%“\'O=-\nZQàÌ”êäËÉØ¥aDƒO#K1X: ßmó_DÊK1É œh© 1&»Wï”5F1tÆ=<³é†trB`İ<Ø™1?:™ÓÁU—÷?5ô\r˜bÄT7bÃJŠó¥ƒ]Kì¸j³ZTÏ.œ]îÎÛçÎñ¹´e‚¼ğW˜a,x/\reZıÿ\0Ë{Íq`s0¾=T¾:a[¡Æ‹ç:¼qîÉS\'o$ı?Gw›«—;§³3‰ùõ„ÌÔ„‘¢À–û¯›÷ØK)Î‡…\'.¹j#ÔF¶ÍÑ9WÅôxïäú~\\},ï²zŞ«sS§Õ_KŸ \r¸º9!nb¬³¦]ƒÆ¥¾Óç=ó‰:iN\"Á²íå÷szõ¸z¶MÙ[ÎcåZVó=,ËNd^¾Wéæµ¹ÃÎGK¤ ›Ûç2¯“¬²hÚöß7ïÑÅ³jS@só½Qôz%íyı—çµ‘üË/IïEy}3ÃtÁĞ«Ïr„ØÒlFKBæT2e‚±QE:óú_ªÖ†ä•fS˜?ÍŞ{º#êpvkæ¾¡¼ÇŞ[®°Ëyàõ8ü[JÜ=×9Ğê-\'¤%‹§›BF*ÓVÆÓ€×²ûW¢¡µmÀ²°JMw>”}ªÇšÚÊÛÏæ²çé¼º—RŞBôÃ™%iRÑe7C™NÊ[#NAksìù>À‚U¹i>z0w¬ìÁ±HÒ§K¸Ñ™sÉÑ@Õ+5é†ïC“©9à\nD®6h“L2ócÌï+¸Gœ¨±£wÖÙ‰\Zr˜#RFÇ#$è½U$3¨*İİİÊ¬³*’¶l&ÉÙz”ôüâ‰D“¬Ş¨m`Ãfç³!U<…³”.(ËN¨ó¥oR$R$g9™dL¡Û—èØ\Zr ›¤Ø‡qŠ°Ä!i°Vä!ÁtêÈ×JR}ÑW›Rp+ØGee]‘†gTØ;Ğ ›,é4iEÊ–}l²«ºÌ£pÇuPR}D¥&ı2ÓiñLÄœ8¬ÎWÀŒÌ€\0Ô·“ßVN\rÈó‹*1%ŠØ…\"Ódæ9M\n¥kº^³‘\nrlJ«²©A•	F<Sˆ8¬]QÔÁßQrÌÅSTËÄ3€ÊŒ:ËnˆÒ“£¤I¦X±L%D\\¼Bá²céù³l\0šº€Á÷\rÃ8-PÈ$A ,9Ö–“ŞuefH38Y°\\3º³ Ì¡reÇcÿÄ\0\'\0\0\0\0\0\0\0\0\0! \"12A0#3ÿÚ\0\0>Š\"EfŠ(¢²Š(¢ŠÍQCE,MqGÑ*ğBEcáË™T8¢¹OÊŠ¯,o\\m…aº9eHí•š6ºiøQ^Xº,lÜYCb,³h£Š(¢±Yq9Fï9ŸV9Š-‘Eeb¼Y´¢Š9Åeø¼¤P…šñK5fÒ°ÚCÕŠ;¶{3¶ÚW‡–<Ğ…şo‘ID¥\"›QÁtnURÆYx_à°Ú>’Ò%vl“(t‰13q\'¿NÇ*´Iu1%Õê$Ç9<#çøÊD~™Ü¨ä‰DøKRÇ$)¡ÈŒÍi:rËÍø/æ3¸ Q!òÿ\0¶kjQ¢Lïò¤µôÓ#·*cö$PËäYCtFm·©B¥À¤±¹!®âzŠäKSi=M§q‘ŠFê:½yAiu3f´‡¨¤z’\\çS+6ÂLªên:\noclNÒH¯}²R›5-“Óöi\Zz-Ë_§ßô.0H{GWö(|\"øğrLÚF\'X¯Bıo×OõGÃ_Rœº‰©-§e3±mHC>”=4“àk„†MTrY|>E,ukş‹½%+ÓÒŸ¢™gQû3Iúğ6jõ:zGü„[]y£ÖOUî.É{=Vm¡Œí¶ßNCB)íEó|Æ>Gş:QsÑ­º:<éÇHâÜ—©¸ÖŒ¦ßA´üVÎ—CON=¥i¤å7´ÛmtÒgâ£³5DÄù6´l~Ëµ²1Óô†šQª+HéšÓIÏ«ù[ˆj:²\Z[ÏÅHzgn\'â{ş*?¤Ià‘\"¼l²Ä$Qğúp6kôğ×Pèôt×n,Y¸bû˜c$1¡.(~\r–!a²ÍÆëºË,İá¹²D™ôkÊÇ„)Ç!HrÂÃxOŠÆá²R¡È”mU\'˜Ê‹±æÄÍÅ1eß‚x±\r\\Øù(cå5ŠÄpÇàË,²Åà¾§ˆ±±³vÅ,&7áx±–n(Xx±&NGÜYtYx²Ï‚>à°Øùš\"%È¾Œø7á&YüD±ıˆ‡àÅ›Çô?‘Ëùyf«7ÿÄ\0(\0\0\0\0\0\0\0\0 !10A\"@a2QqBÿÚ\0?å‹‚ö^ú:Å{¶ÆËü\ZÚÊŞñEnk±¼Xÿ\0	­µšËkg8¢¿ïx±ñš¯}´XØæKÈÈ»WìsıÚ³HÆ†^\ZOøÚÎ1Æk}l\\”PÑ$2Š(qÙ;Ã¤9Åª=S[e²ÄŸ²¶G±öXĞâÇ?·g‘Z±¿´”WëT³ÆİI	ìdXù#ìË„OÁ‰xZş\'š.¤TJLÖHŠµCçec‘‹÷–&7B\\[„ñfJÄì‰ôş56?yeã‡ò<ÿ\0Y)ı±á·Ëd¥$)6iRF–%¥Ù?Ñş•g,¦~ÍrÊÂ¬8’t†ÎMB”H4í	ıÄŸIPæGÔı_üÄœÜŸ$‡ÀÔ¤…â¬8Ùåî±BTvK6¢ËDˆX FÏMY¡Ø¦‘9jø$VÊ:VIÛ)eßggÖ8YgÁ\"ƒNZä­UeĞä%¯ø’ñ´­±‰6iÏ’_ò$²”Mš¥µb†ˆ¡¡¡—ôJNš>Ÿ_‹”KÈ×Èø5!±ÊØ Í\"K?x[>7dŠuØ¼‡ªRú?Ñù ¾MzºF†zb/ôzrcñ´M\ZM8bÃı’{,XXp‹4#ÓLôâzQè—O±xáğŠ_CÄ‡µK½¶-Ëeæñf¢É=Ë³²–:Â³ceí¢Æ<ZVë/}–XØŞÛÅì¼!l²ğ±e–Ycc,±û5CÂÄ-·›ğñyccÅš¶!:/Ø¼<±ã±——–t}ÂğŞ+jC;%Øö<<1ğ<ÿ\0ÿÄ\0(\0\0\0\0\0\0\0!1 A0Qaq\"2ÿÚ\0?n˜ê\\	pW¼¬W¯Å—â¸ŸQG\"Tp?À±ï=xp<zç¯vÃ±áxzËÇç)—J¼,àVXŸ•ı+ñX¯9¡xßÔ^,u‹/Æü[¬ßEá&lb€ GN$Ö×ô?©î†~|,çË¢ÈˆVV5ô_g8Fßfï¸¥dZÆâÄÅı£E›X Ù°øÑµ,Kaá¯$IpG£h™%Ù.G\Z+“Múe-ÂUáÎ_|‰YXPm\r5ád—\'Dõ>Â|Üˆê2:‰öˆ?³*Å8	ãœ{ñ³³ô,\"‘î%öCˆàÊ¡E³rÓ{GÙ\"n»#É¥\"\ZIvFˆF2(ÜÓ7¡½ÄrøÍÊ2¢1¾„\r¿aÆF¢j)pOƒUßF•‘[ÅÉû%ª‡+ÄeFŸY|‹Œ¾Êô~.±vAvM‰´=F=KˆõŒ§Ñ·îCúŠDYbÂìİí‹ì6vpq‹extG²ù\"ÍOônÄzTnqº)¶FÙ.Ñ$‰R„pi¯l¼É£y¹œŠÊ±j¾DÆÈH‹d8}Í%Ñü‰ÂFôMÊ]26Í®„(Ùt=Do7<û(~gnW$iÓ¾‰idtZìã¤GGR^oúhù£ÔO™tOY#O]{´µ‘	sgÈÍïÇôQÿ\0|[7b:’>V|Ò]<Ïı%«\'Û#ü‰és_ÈÕ—lß\'Ø­‰BvD^}XùËClbäı”<7Š]egm›HD_B¯a‚+ÙhràoÙÒ?yBü‹‘H¢1¯Â¬Ø¹eYC:.ø,¢½×ƒ‘<¤.È¡}‹e¼z»(¡ÒÃüã—À‘Â°¼¼7^_CüŒEYûàdŠC(«â+‘.D/§ÙÂ&2¾çEaıŞ6¦#†?À—xó^61r¬OšBK2‰¾F½ãµef\"ÊÌEÃÊç?ÿÄ\0(\0\0\0\0\0\0\0\0\0!1 @Q\"02AP`aqR¡ÿÚ\0\0?ö¦İŞÑ½³næÍIè‚»˜]¼ÛêÕ»*ƒZIÑùy´ZvIF…w.U–D2:\rUÕ;ó¦¥ŒGĞ¸c3W*}‰†9´wœZ‘„Ñj‘}RøAï“µE%\"h‘siÉ\Z³ß«ğ¤A4¥ú«C¥S‘‘O&Ío\nh‚NH×Wà–M\n%™L/W¨‰.iÊœ[îßg©Ï\r*q­#æ£ùBF¡GLş0êI”©‰Û\"Ty„#âğ×ÙGÀÿÄ\0$\0\0\0\0\0\0\0\0\0!1AQaq‘±Ñ ¡ÁÿÚ\0\0?!ƒÜ]áÇ	\Z!ü„‰‰Çs)\\6¼ˆ^D7£B~\rÕÂiz7ëÀHKp8*¬1÷¢T]È–vBA\r	€È44\ZxoÑúÏ²7ô%ÇƒBGƒ¥ñÜk¶(G.ô&Uˆ„¢à˜4Qhm¿•À×ô¿Àè¿C0é/À¦«b—É!,ŸOP§<1„2D1#ÜiÄüsz¢`0Ü¹R%HA!,èhéò([ØË9è¡º ıˆ†Ï„¡`ØÃá~…®IÄRÑ[Á¡üÉNğ‡h‡–¯à¾ËûÃDÏÀz„ƒş’Ÿğ(á{;b\\A\"	:%ƒş<ÌÓÇîxÉqåx2•úH0Ãº&\nA…Ø„„‚Pwª…æÏ‘-*>Éô3\r­c»xG§J˜.¨Jk‚ş\"&Æx‰ëŸ¬A!äH”LHKÈ–’éÙë>|!«ñ_C—M=2Šü¡oWäwÌà´˜=£Àáœ{NÍ‡S¯ö2¸¦…Ë|Ñ‹²›Ò—Bƒ(j1‰·üœEÔcÁò±e’ıšÌ_G‡û¥ú1ö(g›bo=¼\Z\rïhRoÑ!.@:˜¹­6}A<\Zşpálö\'ØÒ~Æ!UoGĞ¤~Xñª°¬ú#^×‘Ò±=‹«!ÙKjfØ1¡*xH‰;‹ëƒSØmD‡™c¯C“‰—\'ÛãğbéšHÇŒÅ¤LİBÆbª	 ªFşÉdE:I\rpCD¤C\'>Š%ä©i€™¡åhüÉ“î˜tEL6kĞòIo3ä—Cç>ÅÖHiæÃuæ—nß!±Î…kpH¡—¥Sƒ²Ï§ˆ\'Ÿâ=ˆŸûC¤QŸÂãaÔ\r‡ï	\"İ¼Åè^š7æ–Òh°KN©ò@×±±[Ôz\Z#ÿ\0È“ò	~Lm:Ïö¶&Õ|ŸÎ5ÜÆH~ˆÿ\0¾Sè{üpmD:Qˆ¢\"®‰ÔIx.y¿ÈXxHA_é‰‹}Ä†Bjv>¢¬v\rÁ£‚c¥jÄxÍ6\'©š)™\"C(iäLUu¡á\rX(îöşUÅ%€öÃD•‘v´D\nğ$ùÌN]‘¡ıÎ+u\\y]®ô%GLÃKEŞØœOOÃùÅ	 ×‹!±½á„Uifı“‡ßÒğøV™ìNùĞƒÈİ³ú:Q‘öü\nx¡t1¸0ÜM8£Ö1±‚cˆCÉv2ÄÄü\rºi…p\'¾ø$1Ríò5¸¥ˆè1O8\Z|…ÂŒ*Z&nS\r\rÍ\"cL¼S‡“·ÀºáÒp™9)ÂÏ¹JQµÀœ|¦škÈ™\'ÜƒD‡¦4~¢xFhn\rÖ\'¢1ĞûMªHì1ÃZàŒMb±ÓôòÁA-poÈëpó¢\Z1ºzaÒMìnŒÇ!F´uĞšE4ï˜>Lè#Ç´Ó<ú&24bç¨ô\'Ğ‘pLn0×F6?që‹ƒÃ7¾?‡ÿÚ\0\0\0\0\0\0_–´ï<MGKZÔ¹kx®Ú*›• ‡Ä¡êgÛüm¸á­…9¨í­ã;A˜4˜àšˆKªISçÒã±ˆp»Nô¼×Yß¯ùDqOƒi¤4QB2ç\Z“|’6q«>Êjµv›\"EÂkT·+õëACú¤ğÔÑ“°“—BßZ84mÈÜ	\"æF\ZÍS\\×y¦İ>s0†İMh‰¡Œ\nA_ÈKä)ß}¥ÆG§ZWÌlœoíZè<Š‘re¯È\"áÍÑ§¿2H×BZã²¥¦T±dà€Ñæ´A ç\'ˆŒœäúdßeì\"e‚=}Q\0/D²11(šÚÁv_R€vh$—@Ó÷Û$™?	\nÓÏŸ:ÿÄ\0\"\0\0\0\0\0\0!1AQaq‘¡ÑğáÿÚ\0?Î—ü“¦\\á+ájJe|·õ\ZNîÛúŞİ“\ZØï¼¨ÓÙŸÔì«äšÎnÚN]m|·Mµô\'÷¸hßé·_¤îŞÊ·V?H?v\'K¹fı³õu.úCÎÈå‘ö“øş×öGäªæXÎ²$ƒ©{¶¿Sı_ÜoË¾’vÁ³!µ,wl\'	4³Å“¼œ9·érfAvïÛDt´öĞ»¶ª\\/çËıX»¸X=‹Î³üö,76NÙü¿É;¶$ûsÙ6nIÛË¶	:²T¸³=¾—ìÃš·ğ°{=´\'W¾Z;)öÏ‘‡·œ\'ùa–k&Á—w	õŸí©2gáH2‡“Óg¾YÛË}·úºd»—êƒ¼³İ»›—–m–O<“fÛ;²ØŸÖØ~úYs{±&{ù]q¿cÿ\0¿öâÿ\0.ÁÒó–òãcÈÏ/8Üû2{ì+ş£Z{ ±û”|›3ñ!®Gíş2«È»}}¿kEÒÿ\0pkäåÇKŒ Ù`$ÖÙ/»c\'p–Yœ¾›şzÀ–xÛ²ú\\]‘Ü¹<NùiùrÌììaŞ[iò?=³ä˜Oğµå©3ÏÄ\ZöKn‘äùq#`ÿ\0ÛUìğßXr&uì¯ŸöÂn¹‹\'’Œm;ö_ÔÌ.‚Á\\ŠrY7¯î\0z_™qñ´0½6Û¡´(|“?Ÿ‚Ç³¨ç‘Ç·_dy4ÛÆl‹…oö7nBÛ²[.C‚à±Pğ9¯Sägü$Ó¢cO%qû=‹úM¢³Š`/-x;3¦Ê2¾Ïësä°tŒK·£fœäDßËbÜ‡¿„Áúš¼²3Ö1—­ƒ6g/ÿ\0%w‡—NÑoÁ}Ã¿õswä<… ogw#Iòîk™ O Şsí(óxÄì³ğ¼µ¸Êhù#0\\H4°z6R¼_áiö_V²ıÚxåÃ,\'cË£6òFŸAv=e‘Æüûm^Èã9ñ»¹b#¿o|¼Ô°i(k9mò>­Öt‡mÒâô€é>p¦!ûdìn8îí‘LÙ}¶q1~®Š&ƒØ!™?¯Á0Å×»«ÂÅí£¹Œìá«Ä$!yÔ\r¶y†àù‰fF$!¯-?[~M‘è0æ\r“ÛåÃü»\'êéˆ˜]ı]ôœÜ¸á!Î&7#Ø…vÂşWC’%ıK÷.É—[={2ö^ÊßÅÄ7‹BÒTöëcy,ö{òÔ—œ‡›–ÛçbÒ0r\\òvuøEêwO³ÉÅ¸ÏeÙPİ–u«ÿ\0Æ¾ù?¡=v¸}KFï$.9=„b|ÛÏ’Ë¶èÏétŸÒ&Yoé&¾ÆO]J|ØË·‹HöCÈ\\ÈëÙçËp›øöØó²¾Ææ“Ï.½sgú¶çàòï_ÇAÛIŒ80º÷ìÚ^?²éŒ_²ÇØãÏûòÆv×ä²ßÁ¶ÏÁ3öY$\'«Å«ÛæÏï&Û·’ïdñ€ıÉêÖÁqÆ[Û6ôä©É/’øûÉ_¶²|–ß“ëeÉ’]ò$K\ny,ùÉ/—¤ÉgX?pl½G^Ï_ B÷ÛDÛŸ-•ñ™#Ÿ…ì÷ÉÚÅÏ,OÎd¶zÙ…Álğÿ\0¸èŒ5aAÍÒ\r6ÁÔ³™,Ã`n!V2Æ\rì¦ëÈ,È­ÆŞ¡pÂ.äÈòÿÄ\0$\0\0\0\0\0\0\0!1AQaq‘±ğ¡ÑáÿÚ\0?7şaø,ø€£—ÒÁëŸûî{Æë¯‹çavsß›_?üÛ¼±ï°Çm-´0¯RKó\ZøŞy\"ÖÌÜü à`šöõŸÉ|ŞeÃèÈÃGÛ\\í¸÷Ù×²Şwß>àÓ°Äs°XtåÇ—ï¤}ÆÎ]YfLğÀ8Éõ`âKÌn#Ëêp¹şeËS¤\Zı£–ó’g}ŠÛ70ÃòGÛàr3/}¸2âab·‡2ıK®òĞkíòI½´;oÃË_	¶¡í§„ö2646>²7Èß y\Z{/¨Ç½yl¿0«;fŞ»ä8‹[»¥ÄÅµøşøœ\\cƒtc-%´âÆ>ûgÕƒíˆüŒ^ÁØ×aì.aÔ…™“®K¦@C»ŸşÜ>a´_Û\rëañgp`Y>ì¿]¿RãËw°Ã¼¸»\ZòW/y\rìŸpü³9qLí°§–÷²Œ¶ü0ü›_Âôm™¬:ÖÄv<ÖŞÎÙãlS“§–şÙrßÛäÙŸş C¶ÖÍ°Û#êM¶Õ³[?÷üÙ…]-Ç;÷:_êĞäîBå¼ä;ìö3$8\'Bú‹åhìAÂn[ÎüZ<»áÌF_gå‰|Ÿ–7–ük–k¤tŸ¿Ÿá‹Ö}•Šû/Étå£ÈçŞFıX9ïğ¥Ã¶eÏàã\n-‚g¹šF.»qß™f\"‹‘¥ŸfÚËŞ[@åÅIï–nNy?E—l=ähMmo€²ßù®“O{gå“awË_Ä¿§Åş}³!}Xh$Aù—^¤·fÉSÎØì§“à…ç,Õù„+‘Ô€¸´·`p”=Às0½È£WŠò1ƒ²PÙï[	jòwzØû8}Î\\<·\\–3‹å©Æ8a|³‰hÌƒ‡Ë!:–?6¹#½2n—IZ„Ÿ™~å‘zòXìwË?o³¥2ÙtxÙSg÷êè—Ê@zÉ•áÄ]z’±f}µŒxÉ”İ–Lx[¼û°\Zo”—„8C®Ü?€XÈ4¸Xì€‡«İ¦ë`ŠK¬µû’/ñèvhA¸ÂÍ—öûZZf|–£rÉá-ç.¢¶0kùÉ3ØrÑì³Éqïñì²ƒÛw2Á¥¯˜‡bT¨=È)¯ò,5–ƒ³vù~@áoxJ{		jäcñqáuöïÌå¯%„jÀ@‹q·Àÿ\0««ÿ\0Ò2ë­€×MşäKèdËÂ®Êà2øK|KÛ½¸~­l¨Ë­‘AënÚù(—ÄJè@«°Ìİ¹ã’ëÖ~ïå¾ÏÜŞûÂ52\rÛä²†I:|­˜c¶s/ÏæiÖ8ì~¬Èè·¶cÛ.±–CG¼_©eÁ@œö{û·i˜ôä	»\0sÿ\0Ülƒb€lÓò5şysâ°¾\"µ|,1ŒJêCØz-/ÑÙWÔ¸hB§n°É©ƒ-ùÈ4älùğËÑ2,ïnŒl^Kbè’µ5gŞCë­œçğmÜôŞİ6Cşÿ\0Ìòm‚ı¯¶HøÇÌzÁæÁf}¿Q¿Ì¼œöÖ9qË>ïÆCß‹å(2p\\\'Nm`q¶ nûhs“Nú—O5³&B`|Zô`=úf{lõ›7úÛüYØ~a·^’÷-³ñ´¾²uì£Ø\ZÆàÁÆÎğ€»:¸Gƒ.gÍ‚¥k|²7¬5ØuÏ-±|\"ñÛ¯à9ñ›\ZÙ‘§¶,ËıÉ¦iÛ±^²ì…Çd65ç>ì\\V«³¾K5†q`òçíŒ5,\"í–l\0lygğĞÍ‰iw/‘9\n[>dºÄ%\"¾Ëë@jİ$@3î@Ç.<…Èp[uRG˜1È÷ #ùz/œ·¹umã-rLİ—«w¬_ÿÄ\0%\0\0\0\0\0\0\0!1AQaq‘¡±ÁÑáñÿÚ\0\0?¡–¶8‚m·Û¬ 9Vá½J½y–‹[\0. \'w9ƒüINqS‰ôSÇñÇ«Ø|M›æomoq×²j¸ùæ ÿ\0Dº‰¹0+ Ò×` kÿ\0RºšHáÍÁ}¡ŠméówNï™ieŞhšQg´:µÂziqhÜ¡M˜5kîX&5×ˆìPbÎ¥bKGÅä\0W¨¥ù\r%ÂÕ‡—–\\/gId€á¬Ó¦ÿ\0Ä\0÷æ5/òÈIêTeÿ\0gWamx\"{ö+š•ĞCåoõâFÜu\nÖQuÔ¬VÜ3X	ãşåià•™Üs@¯øƒ¥îÊĞ¤”¡ãÔåíƒñW\r#D–ESØËÜ\ná¼³\"²Ø¡c{X×qÃ7ìHø	d_ä\'<J+kÆK÷ıEá\n5³Äôå]+ràVµUWÔ¤äÉnØCx…Ú®füûê3Ï›&õÉæt¯÷Ìnq„ü‘Üî\\^âm1ÄXx€÷aœ‰~c9Š™×˜¨ÒnBĞX£k^£[.\0¼K.ó\Z.?!µË{ˆ›e¾ ÿ\0bX€½:¢…•?ÉêWµ¸CšïäóS6(İÕKN,ñœ³.+Ü\Z§\\S>S7«‚Õ×ØV§eÕm~EÇ©Yx¥¶—åbmÆùª=G£Ãî\"Ûü›ßOrçYO‰î7|Ë£Ü-V•]J™Ã9%ññİs\Zø²àü¨C!zN~Å¿&/|‡R“yp6µmQª·{jØ•ƒº¸. è\\lÁD­<QmHÒ€~KTğKGÌOçˆÚS,ÿ\0ög\\W3o9\ZêQÑ9TçPó“Ì\\\0Ó—Ô¤¾ê­ ØÖ°k[Ã5z&Œ?’°êPıâ\r[ÏP9|D«³ÍOdsNï\\FT/y¢\r©î·à¨õ9*¦jopÌ;bÇ‹÷âiTX…k+5æ~Y„Ğ­eü—ÿ\0éÿ\0È4Sì<Ê¥udæ¯rÆ{†Ÿ2”z€3ÜÃ—6ÀÓÍO\"|EJ<±øKŒ+áS ¿XÊZèæp€÷-~éKsOr İBû¸¥å_ä\0Æ\\¾ÓUÄeQõ:^ôÅPTè&*L»åö%SÁ±¥gP1¤Ø –TßøÇ^„¼ñPp„Mß\'QûË,-e%b‚]Ôl´(~ÀJÓØaÑíÔğaQiÚÃb¸¢¸z›(»7®\ZYañ,m.•¸\rtùî»•ÕóÜ+ç)‹Jjó_°Zyó\rRõ‚ª¸¸Ôÿ\0Ô5eÖ@½÷*°ëıœ„¾\"èsÔWKğÎ‚æm Ø¶-8Ö€!eF¾Kò!¼úø\"[+ÿ\0<\nÓQ½¬šP¨{Œó¨^n%ıÉ¥ÊF–’¸ó(DpbéŠC‚;¼Ë‚cÄs=lC¶=}¥ÊˆQq®\"¸ëÅÇM¯zÁ•ÇˆÄÄ\r±Ù¼\ZÂ“²ò!Q¢¦9PÁ½eÖÇ•†††ß˜¼y‰äg]ù6³Â	•\Zñx—Áv56¸HEÜ\\|Áµşø”·w-ĞP÷\r©öüÆ|«æ[ÑúELæãJ®3“¯²gûJò1é¯…ÍŞÂ5q+˜ÀÚ]6áúÊï˜M•1Ì²QvÆÔ¤A=|^Â\0²Dû0	gÈt›p±Í–ØŠb<Œa›C•F­‡ÂÆWù7Lg‰…-=Á–ÜrùŒa·û­˜Ês}Ï™±ç\"RjòV²Pw\r(ÎwË¿€±âR‹Å0®%îs+¨5*‘âmª]1¨K{Rù¼PæAn“Á(!ğ\" »}Ë°‰İÇ‰\n_û-W*ajÊå‘×0òRâ5_Bråù?¬ š1õè«à–Ò¬R\n”>{€¿„ò¸MÄ¡lö‹\\åËöXyêF§®ù¹Vÿ\0fj§ˆÊEÙÈM¤ş»Šüƒ`Üàf¥’œ„:0½Ø{J/a`\r×’1J³‘ß¼\nîR> F±q~š\n~T9¥HÄ@¡!_¨úûRÈ¦´ÈCJW3\'Øb.%B½Æ\'¨IÍ\ZµÔáÁîX\Z«à†Ê–‚ä£ÁA]àŒü”ˆk@ø +ú¦†Ğ‰„5çÄlzãÌ¨[È\n‹Â¾—fuY6h¥æ7iÉÿ\0‚TeYÜsšYèüK)‘øy€àŒ¾ÌHƒĞ›_°´Ç´ õâ)H>Çäñb&O_÷µ‡¿ä^Èæåî\\ÃW¶Ğ]òäC\n¼»-&«ÌS²û	RÄÕÆİ˜³÷ˆ\nê½Áá~Ò-wá¿LYTAÍõ~Ë`æº‚‘»ûœbpQØ	8@û,c™y8jlv¸(F´*.®á…@ÂÜP·×6uJãì]T³Ä«K~*\0¨·ë9‚²`F®\ZyÓŠmcJÑ¹`%¾º˜:i—(CÚ*Ü?³oX@´Õy¸ófxÿ\0Ö·A,Óãxkî;rúÅ–”å[ê0µ•> Š°æå2á[Ìç,+øfùæ\0ò¹‚ßìä6;¸SS„ÛöoN„oW«‡’Yßì¤Ş\"/‰Aİ–Ppî ¸i^ ¸·ª›ƒÌ<ßÉ¨õÌ#…5ók±Œù€§\\Ë)ı@ÈïÄ;³ÜMâV‹y.AÌÑZË½ò¥ÍY_`\rvO°¨HÖç¦­¹Ãç;™eKUŸº“b‡öPQ±N·[C§®™bSS³L\\±6\r@\Z×>e”x%®9æX—Äµk÷ÔTÊ”wC(wÔ*ßüE\0Ûz—\0ÒÌ}ò2%qùÉåD×K=ËG%G5ö6ê}¿Ø¼«ì‘§„À€êâmmˆòÑ.³/Ì»^o˜å#dß™|·jj<E|%T)ÿ\0¹ÊİìoßÆ†¹\n×ıÊtØ–ïö×}A²[¿2¨…†A\råî\n¦¾&\"ÅÑöjÿ\0¸Pnªc†&Á@%TPê]J÷Rû*b/¨\n+¹’ô”€µİQÌ Kû¡~X$=66›mMg˜¥İÿ\0\"^ß³JïÄ®Yù=`CÊ÷eš·]y€ªñ!åuoEíñ.Àxñ0NüO¢XÖUF°\r*¾ÈÙrŒ¡ËŸ±¢qÅ¯pô·Ù,ñğ{˜j³©`1ı–±=Ê»Û†ç#Ä)€\\>H—ƒe#µÔûDà?a7£ÕBÓ¿ÔWf§lh•]¡85ùîzªæ%n	îUÁz¤\\»Ì8DiÖ,â>U«QWÚ Ãv\rÎ>G§h­=³K<Êÿ\0aÑú‹N—P†Å=.¢«sq ¢Œel]FÇQê\nÿ\0bØ¨¥¬\Z+—„ÿÙ',	'image/jpeg',	0),
(26,	'Backpapier',	'ÿØÿà\0JFIF\0\0H\0H\0\0ÿá’Exif\0\0MM\0*\0\0\0\0\0\0\0\0\0\0\0b\0\0\0\0\0\0\0j\Z\0\0\0\0\0\0\0p\0\0\0\0\0\0\0x(\0\0\0\0\0\0\0\0\0\0\0\0\0\0‡i\0\0\0\0\0\0\0€\0\0LHUAWEI\0\0U8650\0\0\0\0H\0\0\0\0\0\0H\0\0\0\0\n\0\0\0\0\00220\0\0\0\0\0\0\0ş\0\0\0\0\0\0‘\0\0\0\0\0’\n\0\0\0\0\0\0& \0\0\0\0\00100 \0\0\0\0\0\0\0 \0\0\0\0\0\0\0ú \0\0\0\0\0\0\0¼ \0\0\0\0\0\0.\0\0\0\02014:12:27 16:51:04\02002:12:08 12:00:00\0\0\0¯\0\0\0d\0\0\0\0\0\0R98\0\0\0\0\0\00100\0\0\0\0\0\0\0\0\0\0\0\0\Z\0\0\0\0\0\0š\0\0\0\0\0\0¢(\0\0\0\0\0\0\0\0\0\0\0\0\0ª\0\0\0\0\0\0\rà\0\0\0\0\0\0\0H\0\0\0\0\0\0H\0\0\0ÿØÿà\0JFIF\0\0\0\0\0\0ÿÛ\0C\0		\n\r\Z\Z $.\' \",#(7),01444\'9=82<.342ÿÛ\0C			\r\r2!!22222222222222222222222222222222222222222222222222ÿÀ\0\0\0¼\"\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0	\nÿÄ\0µ\0\0\0}\0!1AQa\"q2‘¡#B±ÁRÑğ$3br‚	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyzƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹ºÂÃÄÅÆÇÈÉÊÒÓÔÕÖ×ØÙÚáâãäåæçèéêñòóôõö÷øùúÿÄ\0\0\0\0\0\0\0\0	\nÿÄ\0µ\0\0w\0!1AQaq\"2B‘¡±Á	#3RğbrÑ\n$4á%ñ\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz‚ƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹ºÂÃÄÅÆÇÈÉÊÒÓÔÕÖ×ØÙÚâãäåæçèéêòóôõö÷øùúÿÚ\0\0\0?\0»ÁãNâÌŸ™8ö«ã“ÇJ:pkVŒS16`ôçŞ“hÎq[2[Ç(äsê+2hÌrÇÒ¡«\Z\'r,{S½©Áp)\nç¥I@*Å¼æÏnâ Ú{šQÏ$š\0Ú–|:ıÚ˜-fÙKåJıÓZÀ\n.+\rF*LqK³4î!$1“éHçq?…N#ƒb<R2Ô»i6Ğ\"‚š@©ŠÓ\nÓ\"¢˜F3Ş¦\"˜V˜ŠÏy(^*FÀ&˜ªqé@pÂª¼k»­Z\0.sMeRzP\r¶œµ\\\n\rcE]·º*µRd´_*µå¶ôŞ:­[F Šv20h`ŒRcbò/&cºzT›5¢“úSÀ\0T1Øpõ­[)üÄÚ~ğ¬¡RÅ/”áäQr¹Må\0Ó±PÅ/›uQS)Ü).)§â“ÀŒŒi)äf˜Ëß¥\06šE±ïM2{S†‘QÈÁFM+L\0èj\"¸Í1X@»Îâ0)MHE0ŠbdDQœjsPº©c‘š‘3ëšp|uâ±äñ—Ü€ÊpFZEñ.–Ç9cè¨M)#¢‚èÆ@\'+VÎ¡\0$şUÉ¾¿f‹»eÆ=|£T›ÅšvH-.Ü£˜|§cuwo<cimÃÚ¨3*†“}³æ}“wîñ»pÇZÓ6*’@8÷¬¥4¥Æ‰fÁÍ?Ì•İìh-ìk\'V=ÍU7Ø—xïšrÈ«U·{\Z<ÏcPëG¹j”»\Z–×şN{ƒÚ­ÿ\0kÀ9ÚÁ«ŸóN8SMi¶‚Û[IW[\\=„ŸC£şÛ€Ñı¹÷ó®a®€ÚqŒõ4kæ´§ıõÖ´çş­.ÆëkÑv‰¿:ˆëhN|¶?eÇlÒr)ÿ\0cl}áùRö®öÃIt4¶˜â?\ZckIÿ\0<OçYæĞîÆñŸ¥1¬Ûûÿ\0¥?jÖäûö/>µ0!9úÔ1ë!X“ç Íf]ùvQ4³J\n¥e%İøiVßË€FÁ?AV¦ír;>S£şÜOùä:|:ºM(B›AîMaKŒò[8ÏJ‰$…¹Y¹Î:´ÕA:/±Øš®ÍóæªG{*D¡•IÇRzÔlòaæ´U\"d©É‡¬c¿7W3Ä$ÆHéŸê+rÖâÖÎ0§2ÈN0½3Œâ¹‹85ËX¼¸ uRsÊóÚ¶ ÔõÈD¶&B½zQtiÊÍU½%½œ…FrŒ¹\0÷íÒ£m¥†áÚÈFè-Èn2qŸ¥gK¬ëN\\vföÿ\0ëUu]NU\"C#nê‹®å%#gÀäÚ‹öˆ&»\rBåşË€Í Tt‘şUÇh6óÙ¼.0ØÀ«¢r)S»0yã9®iÍs©JÅYg»‰¢V·f%2Û‚N	¨Œ·h˜)1•ùÈRóé[RÈ÷“öqÓmfæPÜÜ£ma9.Æ±„Š\"îéà.‘nÈ!?—çHg»—z¬y r‘ƒ´¿ZÑG(2dv\0cÀ?ëÏ=x„šìl£\"˜{âÎ¾XPåÏşU¡³Š‹\r·{šfÆÏúù+)3XÆDŞRÿ\0t~Tè±dùSö¨\\–#¹¥ó=ª.î]¤jÀÑÌ¿/v¢.ß YqÜ4.kAgKØJçŠŞ•IFDÊ.JÌbßDßpøSu/µ€9ïT%Ò.QËA&WûŒóª7×¶‘ˆÖÆåÙÍ BF=+±7&rÉr—ït›+ù’Iƒ‡ nãò¨®4µ’O1%rºÌqYi¨_äayÿ\0~[ü*ÀÕnc’ÊéG«BÃúUûÄ)(ê…ŸMiL“0-Œ	ùGµ?Ì\Z}“ ww>£…©aÔŞU[NÀúDÇúTŞh—†¶”}b#úQïÄºÙŠáXOóœWOa©¥Íœr¹UfíU¦Ò-îM·>¥*Ñ$ÏÊ$ÇlT‰“RÜÃ³}^õİñQĞà«(Ïò­;{;§tº°¸Gó­™t¸%}Áš6Îw¯Şüé§F‡Íq)\'œšß•v0ç}Ì—±˜’«ª°o}¤~•Qì5!4zšÈBîÂúWB4[u9HïÅ9t˜PäO.qŒñI¥Ø|ï¹GÃ×òÏdüÏâµgÛÆÁÆ@àTpéVğ¾øä‘[ÔU¯!Y6¼ŒÃŞ±•5}S}Èc¸„\"M»úLia.£?|eN8?ç5!µ\\xö§}’\"\0äÓÚ±•#UQ÷+™ Ãü¼~Æšß‡ÏïÆj×Øàî\rÊ\0p¶+DÕVe?´[ä4drGùúÔÆ,§šŸìpü§šÄ¾­ùÖnƒîh«™FÌààc<óïJ°2ár£æ´ü”õoÎƒ}9üëKVîSÄ÷3R\"¬[×°«–nÑL@òjC\nvëšrAFàO9æœiIÊòÔÎx‹£eB²ƒæ{R¨Wb‡©°Y“aiöb*ÈÓ­x;şû?ã]~É3—ë\r2…ïÛQBÚBÇø™ğd¾›1™d½®ÈìÍˆÇüZé›Nµ;ıôhÀÿ\0«™­#+#\'ZîìÃ,ëKkQx*°Å5VEİ$îèHáƒÍo5½ºœÓ?óÌSöbuÎ{ûA£ y,Üò[¡ö«l˜şxÛÀOú¥ü©LC-*j™²}@)Ø¤¥dŠ4»i)A4™HP´1\n)CSx=ªHŒdœš]Ø§lZS\"³fˆh9§à‘L\nS*e9¨e¡œ{Ò1ô§0ïM3š†UÆóëIÉç4[¨¤±G4¾””œî«D6J¬AàÖÅ…ŞõòÜüÃ¥cOG(Àƒ‚+h™HèŸ Å\';†MAmp\'‰N~aÁ©OZÕ±\0ÎM1¾aÅH:Tc¥Q\rŒŠCŒÑÈlv æš$çC#Ò¥¦Š^ÕÃ©3Iš)1 &šˆğA§Š–PìÓ³L½K)1Ùü¨Í&hŠ†‹LOzi$RÓ\\áI5\rãAùÎ:RÔj1ô§f’@ØğqFi™£<U$Kd€Ó¨¥µFl³í‡­mÇ(•©à×6OvÆìÆÂ3÷I­\"ÌälƒÃ\nfqI¼ÒšÑ6!`Ã æ“u-!ô¡`Î(ÍFäÇZ™9¨¹¸¬rzóNi\0RÒ(CÈ¦ïÛÖMa‘RÆ‰ddS…Au©3HcóI’Ç4ÜÑš–‡qÀ’9àÔr¶8\ZŠSÚ¥¡¦?9šsšâŒÒ°\\3Í4¾8¥¦gE1\\z¸\"—xVl Êš|mòj™39Æ{S‘ÈÇ<ÔY&•O$U¢7í¥óa<ô5>H¬K)9BŒkmA=«Tîa%asKŸz_-cMØßİ5D¦yàñ…ˆ9*Æ‘üccœ„zà	4ÇŠÂçg*=ş[#Ï”ôÂidzDõç~iô Jh¸r£ÑGŒm€°ÏrjVñ2/?f‘‡÷“æ˜¯8\Z–;™cå”û\Z.§r<Wn®I…ÿ\0\Zxñm¹DÕÄÿ\0hİ³9úšk]ÌßzF?!Øîá+„u…‡ÔÓ—Å\nã‹güN+‚¶sŞ¦Iäşñ¤Çc¹>%2Öç¾zSbñ\0¹”ªÆ‡ğ³u®rßyEc!9íŠ³öT`ùO·JÇH5Iü³_Î—ûJcüù×6²ÍÀ”‘èFjôfV‹y}Ğ“†©Ô&êBõ¨†­œ“÷G\0â>Şµ›3\0Afõc?”¶øß’2Ş¦¬5–íå\np}iâGUÀj f`)DÎG&¦ábé¸•Œ~T}²QÑÇåT™Ï­ ?.hæbåFŠjSFÁ‹“x«ÃÅ7ƒ€EsüóÍ0»ñªU\Z³‹:3â›ßQUŸÅ»¾ø¬‚85îw\Z¸Ô½”{ÿÙÿáÄhttp://ns.adobe.com/xap/1.0/\0<?xpacket begin=\'ï»¿\' id=\'W5M0MpCehiHzreSzNTczkc9d\'?>\n<x:xmpmeta xmlns:x=\'adobe:ns:meta/\'>\n<rdf:RDF xmlns:rdf=\'http://www.w3.org/1999/02/22-rdf-syntax-ns#\'>\n\n <rdf:Description xmlns:exif=\'http://ns.adobe.com/exif/1.0/\'>\n  <exif:Make>HUAWEI</exif:Make>\n  <exif:Model>U8650</exif:Model>\n  <exif:XResolution>72</exif:XResolution>\n  <exif:YResolution>72</exif:YResolution>\n  <exif:ResolutionUnit>Zoll</exif:ResolutionUnit>\n  <exif:YCbCrPositioning>Zentriert</exif:YCbCrPositioning>\n  <exif:Compression>JPEG-Kompression</exif:Compression>\n  <exif:XResolution>72</exif:XResolution>\n  <exif:YResolution>72</exif:YResolution>\n  <exif:ResolutionUnit>Zoll</exif:ResolutionUnit>\n  <exif:ExifVersion>Exif-Version 2.2</exif:ExifVersion>\n  <exif:DateTimeOriginal>2014:12:27 16:51:04</exif:DateTimeOriginal>\n  <exif:DateTimeDigitized>2002:12:08 12:00:00</exif:DateTimeDigitized>\n  <exif:ComponentsConfiguration>\n   <rdf:Seq>\n    <rdf:li>Y Cb Cr -</rdf:li>\n   </rdf:Seq>\n  </exif:ComponentsConfiguration>\n  <exif:FocalLength>4,3 mm</exif:FocalLength>\n  <exif:FlashPixVersion>FlashPix-Version 1.0</exif:FlashPixVersion>\n  <exif:ColorSpace>sRGB</exif:ColorSpace>\n  <exif:PixelXDimension>2048</exif:PixelXDimension>\n  <exif:PixelYDimension>1536</exif:PixelYDimension>\n  <exif:InteroperabilityIndex>R98</exif:InteroperabilityIndex>\n  <exif:InteroperabilityVersion>0100</exif:InteroperabilityVersion>\n </rdf:Description>\n\n</rdf:RDF>\n</x:xmpmeta>\n<?xpacket end=\'r\'?>\nÿÛ\0C\0\n\n\n\r\rÿÛ\0C		\r\rÿÂ\0\0¼\0ú\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÚ\0\0\0\0éoË•_&4Ya³!C‡jçR-\r€2h°ˆĞ\0Ò&­enÉªŸOL\ZJÓçÎ¸¢‚k,#ÑTíi€€\Z!Ù@4¢V#\0*–á%´­oAUXˆÓ$Y@N!‘`ô¢©°ÜP \0V\0V•ˆ¥ZZ+eD@H1O#­ghÜuMp2ÕS’äÛª×aÍ¡\0„\0ÊÂ	X¢ZU´©d5ZU·E×9-BëTjW2/“‘h§`<Û‡~òÒ4Á\0l\r+U5@•–9¬H$Fk®jvÁ×¨Öš«ó™iD¶TòÄÓ&Gµ®ıåhXÓ\0i–(VµKY™¥Ì%ZQTŒúéÌ„%°Üv¢¸uMV®¨»&Œ¶§c(”)n	(RŠZªAPj}wG=‚Ë¥øÌİ¹4O˜†Ğ9:\Z+v&×;\nÄ8šÍ&Õ_M==VôñÉ©KÅB¼ôË¿?•êàô|İyÍ)×Á—(Ïtåì\Zí\'jø´}ËÒÏ9§ŸlÓk‹\ZT=¹i¿-+š”ú\Z!/­ÍWG*dë“‹®›c5ç‘ÜSÄ]×/°èâø¶ñêÓÚ‚ùJ>«æôiiÇÈçŞŒëTiñ¤Æâ­1G&5:!ĞÙx¿S¢toÎŠôT[1)eoÎRäÜu8Õ.Ú–úkéyuĞŒŞH¼ùÜÎÄ¹6&—+ÏÙ¡ië!Óq×êœrù¾zÉM°Àòôô\\çcÍÚ­×È{9½\0º©çU‘,ßÓ¹4Í‘¥™^|ìçªguev+¾o7]¨É3_?ªôüı.\'7FN^øìŠŞe%Şòèé^¢‹ Ê\ZYOvw¢j‰§ÎÒT³O-â\\h‚Ô£–Ú{}|İ\r1•ÒR°Djâ±VH£Î­JÊrh¥™ª\"lÍI¦š2â¥J!\\½#¬=çÓÛ>ıg*+sM(æ¡E)¥yˆÜ¡•2\n£$U\\ÕYÑV²[:[.&’Ä°\näÒ-J—×6©ìëŸ^³Z”!©R*‰\"¯WæqŞ\r“)ÄÙ3,*ŠŒXŠH«†ÉÑ\r‡L&´–’âëGHzŸAyl¼ÕÌ¥SšÒ‚[~O›A€ª	ÄÂm,ª“LªK‘Q:ÓV“Ò–J“¤µCh¬sè¯®Kšé5·ärêµ…T4%„Ü$¶TUbj&ˆ¡¹\rJRå´’Ô©ÙQèµÁZT‘i(ó8õÉ#h›*Yv–SŠŠa9VmiAJA„‘C\\—&’‹·¶*ÌÒB¿+—I@SV !UVƒ §İâ¥j1D´¬¤-A\nw^w¤¤²#¯+‡b!†Â(VÄµT¨¹2X²».b¤B32Zö’HjË¾™öo(äÓòœ½„ İ…5IUQ}LN– ÈÉjRÒ¡\\†geÍG&æÁnÒ=˜»šÇœ_Ÿy}@\02-i\Z¢¡ª.šÖš9¹®¾U|¶¥MN}\'~o`šJÛ­\nĞm\Z`©¬»WÍqÑnhjM˜Àò3fY‘ÒÍö¤28Ûyé¡#V“l¥”e­ ögsÏÙÿ\0ÿÄ\0(\0\0\0\0\0\0\0\0 !1A\"0BÿÚ\0\0RÄœÂÓeŠ²…Ù .l¬¬­±ı\nÈ¬U••‘‹¢ßcgµq«løƒÓéˆV@ouí7%O&mÚÛcueo¹DlÙjÁ7öV^ö©‹öŞñ½¦á[kmm­µ¼\nº\r²²ºö¡“ÓVO&¹¸Ÿ*YPñ¶çc»Ÿtdv+“håÄ²L·«‹Öá»J	DñùV_%p³	Îº¾`ökñQÌ³†M{1q6MŞè\\¨dâp{d@Ù\rî‹×ÊôˆE©Î²ÕÕÆÇÂèIeÖ<.²Téœõš/jë%š(Læ®ªBº©WU\"5R.w•ÊåÊåÊåÊäfrÈ®W.b›;šè&1ÿ\0RëÔ°Éş’‘\rv\'§ëA£ı$A3òŞæÑR9£á]\\«¬ŠÈ¬Ê|…­2›²LÃÙfŠpºp;WNÛ\Z`¥dp´TÏ[<t®jx6X\\©œæµÓJW,ª‚]\\Új8*yè‚ê¢qÑÔM4c¹SMv×Îøß%nºræ²¬ºÖÙ¬!unb†WK.+Œ.0¡pX]ÂÎ$ù.\Zæ½Wél®MÂÅ50éU(4ÑMXò(µ2Ã’Òk£¢1jTurpQº9ª´ø58²tÃOÒIiŞúˆé×pÈ!˜qÂö4D$s£\\¸¥5Ù5]SÔYIû² ¾™ì«º’nuÈU¹Zˆk””Íz©Ñùz[©äêªPĞ!±S#¢BÑâi0µSĞÀ\\ËµA´Ş‘Y•È¹K5Ôµ\n†•Ê,Ù•4Ç#Iúc\n¨üjYeŒN¥Ñd§l0TLæé³¡I \"•Ë¡%vÖªz.I™£A¶ˆ#¦ÑH†‹NóJ×iºƒ@pN*câ25Åµº34a¦¢5ÔFÔÙY#‹.¸H$,›!¢ÆÍs	c\0pªrÎÒôÇTFÙ:‰‹!—JXêZ·eÕ±K§¶CÛ%+´8¡¥8!¦=;Kä1Ó> èL€Ò4!OŠéJÕÑ±t(@\Zx×á\\!q!º¦d-Š7ß\Zíñ.†$(ã]<k†4iã]<kŠ?â}U÷½ö*ş²WÚè9AU‰º\'Ö^¯êÈ«ßø[gmut—Ç‡Éñ¥¨Dúø__CÚûóº¾öµX„Ó}ÇçÀl\n§›6m‚vÖY!ã÷åuíd¯gy¶LLR‰ZWüïtş%üi¦Áàİ}+{ñºº(|ÿ\0ŸVWğ¾÷@ªI}]_ÀŠùCb³²ãÃİÓÍ¼.‰²÷u–ÍQ?·ØÚûY5è›ø”ÃîşO>Ç‰<åu}égßãkäKEšA_jêá\\,¿l‚Ì,‚È,ÂÌ.Fß‘«•‹™‹‹•«”\"á~f®v®v!S\Z§©ŒH+©Bî©Ú•2î´Ë»Ô.íR»¥Bîµ+ºÔ.éP¢Õ…Yzäu„k$]t‰•.MšéÎ*€{\\½+e`-•ÙÆ›f¢ä\\³Y\"åšÍ:EËµÖFù‘AË%‘Yu’É©˜˜Ğ‰¤¾0ÅLÎDğØß#Ë”GİÕÍîŠoÊúÚcf¯ÿÄ\0)\0\0\0\0\0\0\0\0 !01Qa\"A@2BqÿÚ\0?æ.~éEéeş³â£Ö¨_¯\\5À¹t_¾¶^”Uh…Ä´k§Z>WI«(®›áµÁE”%­V”bŒLLQ‰‰‰‰‰Š(¢ŠCT-(¢Šzáìİû7FçØ¶>ÍÇ³øşÅøşÏã{â¦êÅø«Øÿ\0\'öGñStìş2_cØDkb¾ÈGg>hÜÄÚ­œo°¶j¾Fæ&–Î&æ(Â>EÍó2^ägËØ¥o°×ÏÌ™™\nb™™››z)3&ddmb¶ÍÜ\nÇúŠr%³LÙ½×bS[Oì8>ñf_F*$á—3-}•Ù˜3»±J	ÚBvÇD¢ŠÑpÖ¾,q9r\Z)œËÑ¢RËì¦_£q&æMÌ<›Ÿ“u²òF5Øø‰DJ%D¨•b„‘Fè{:î>ô4Ö’JKä‡²‹Á¯ênæJNbÚM•´ğ;Eú23bîZ2^‰ñÁÑtf)›ÁmÅ3x-¥ŠM§nŒÓú.>+6“uñ%½—y	J/+³FÒs‘ô^Ïüò/ÊË‡’M“äRO¹ÈøŸâ\\E(ø.&Qğd¼¼z223fñ›ÆoY½‘¼öŒ”ØÛ-™3)ÈÍ™³\'äÉ™~»]è.»·û7Âø™euoKâ|‹\"úW¥—¥—Ğ²\\UÔ½o¦É.etïtßu—†KG¥è¸o©z^—¯3™+*F21‘„ŒJF%QEiËJÖŸGşé\\T>…ñÒeÌ\\Ê=iEh\\õh]ôÿÄ\0)\0\0\0\0\0\0\0\0 !1A0Q@a\"2RqÿÚ\0?cRpF©\'L“â’tF†>ÄkàzgëN—¥“rúŒZß×—©\\“ãZİÒI&&b&æHê$LÄc3hf3«oy116b1¶*™,OØÛ“:Yš½×ğvÆy|”gõşAò\n-UU@é’ ËJvLJÑôU˜êe\n§É…#3xHU>ıŠkhV­™µú¿kú9(®Ïs\nìªÍÊY–e\'»*J•\'é®YŠ®dÌ«¶*Ë•&bâJ«ÅÀÒ)´f91#2†c§„A0bCÑ†GÀœıW±SØÄçbªÊ›âNöÅNÜ“ğ‚†ÕFşÈ†aj‘({è‚š™LÚ—Fe^ŒÆú3+ôfÕè®º»\\ÿ\0F†5w%j;\"\\#âÖ|:ÅüV¶evN—0QVòÌÈe6Ë³6Í‰*º¢(àŠY…{0®Ì#ö´×N*L)˜gĞìØì˜èfÙ•P×ú&7GË©ô|ºÿ\0äùU¡Ú;G,±²ê)VipUU-aœm%\nŠz1OO$R@ä\\ïvÆæææòoĞélÂÇKö`}1ĞıÎ{0r;\Zb“LƒãĞdY™TP©H„A\"„B\"èÖîcÛLÅÑ\'\'ôî÷w$2@„\'ôYA¾„)0ˆ^¼ÆÔİŠè\"ïı®BÕÅÉ\"öˆÑ©hwa‡ãdEüj[ê|ø—wŞw½h[è„?;çD‘iOÁÇ“‘lqWA7Ê‰¤Ø’I$’|‘§ĞİÛŠ“dNã ‹ÕÛö-îŸ\\ÕÍît6Ó\'x\"æÈî’D=·:ÿÄ\08\0	\0\0\0\0\0\0!12\"Q 03Aaq‘’@BPRb#4rá¡`‚ÁÿÚ\0\0?Tº­:7SÎ§En‚•ç[gºÏ2~A\n9ùzhnƒ¿¤§IôUç_§ºÔ¤·æİk+YóZÏšÔ|Ö¢µ¨««««­Jè@®c‹¥½Ëâò[˜X¯ğjı¶7’ê€Nª™Ûm¶VVDå_\r¦êí‚ö·SUÚ‹œ`,œ•»¿[¬¡î‡íV4º»”°Ã{Õ?.…Ñc°‹r|YTgÅ8îâa€i–‹rœñ\'0²FP2Ù	X,Âéœ­ÌSàâ$åXÅ­İdïw¦œ²d2¼V‘˜#Á”e{kU¹‰s¯ÜœÜ¡ ã²ÁYAÙUª‹½WÍğMÃÃÄs\ZŞÀŒ9Ç¶Q;áäêÌ´x#‚5¢vóOnÇ9ú¤E%ğ$™úJxÌeÆü\Zi)Å˜P\\#4/iÅÒ‚hÆfb,WUa„éÃ©¡RZDmt?N‚ÔEşÌ“NË\"<0ÊêÜ¦#lUtñWMš9Õ—æQî4ç…oö«ŠWX|×\\GåuÃÍu£Ínåy°y÷Bğ{‘ÕNå5òRJº–ÆâÖ„\\9\\ÏÖ*¿x=*_ËÚÑü?µ8ÅoÖ0è¤ò–³¸±Gùô®°Utì,G7Å¸½õ˜Q,Ÿä¾Ÿ¸:SCqäºÂ¥ÅŸø¤&ÒsAæZ\rŞ ,ı””OŠô‰²9¸ÂÊÚÒm°\0óÈï:·ZÎËÁZ—i<U\nŒÀ~åŸ/(Åûìn­R7;²ÑgÆ\r{¸5na5©ŞÙiSLßQºÊ&8…Ö ¤bHCõEé\n_ˆ|Z(qv)<Rû•İ¿2¤\ZÄ-KRº¹T%T \r§úÊ»ıe|~²¾/QV>kûVZV´wò§ä=ãş8|†=ÌÏJ=ò7/¸]]]]]]jPZ¶Ï3µUr®¯³Y]a]a]a]a]a_¨\\îğU9V_æ9F¿ì«ŠÏZ®7’£‰UÆ%k>kQpâ.bWï\n†FØhÎîN§}-Òó¯ïvLWˆRªçz–\\¹ÿ\0‘*(Á¢Ûô_ÿÄ\0\'\0\0\0\0\0\0\0\0\0!1AQaq‘¡ÁÑá±ğñ ÿÚ\0\0?!‰	(2 J´½Èy„lF.‰M#4öèG™Ï$1ĞF>‘©®Â”‘,]Í‰}H!Ê÷3àİ7JÑ¼FJğbøHb;„ÙŸ?<H4A5ÑAåCìE–÷dH| ’!*>†A—¡zˆ²<fwèk¡¡† Æ„ÀÙÕË!aé ª7x%îá}¢t†…‘\"Y?J?qtƒ]\rÇ•Õ¾††1‚Lï¡\'¤[KèF£|‰ß^²;†„=UÁq¦l˜Ğ~ì5CİGİ\ZŒAQ¡ŒL9“BÙÉiZmhd×K6Äïƒ‘„Ik\\ŠJ3ÅÑreˆ`ĞG¨©øó—Èé´3_1èZò9ªØÓ›úüˆq”ÆÍM^ùQ]ÄİÎàÒ:÷&˜=Fƒ5	ŸÎóıÄõ÷÷\'ä}èËq‡±µõ1mò_™½{t/ú‹ÁQÇ<½>\"á­wÈÜi×ÌZÚm\nŒ™Zv\r>@ûöê&Q—¬¤o˜%îÚlÍ/¹cI6Ùçb›eÎË&…&&[l_O8Ó‡‘ªøâ×sB†Ô,äz¬:SÒ?´7¢eòÛ‹êÇJZ?¡2Æ¼H´Ujò\\ÚÁOOTj2p—‘éb’LÅE¯Ø\"¦vÑì2{%¤ÌÑÉFÏ‚º^^FÛlkŞi^ù49D†wà0,*Ã˜ëÙª4ì?Óz|áKÌ*8fß°Á<âÑ:Ø ¤A	\'\\h!û±û‰±Hwƒ¦†n}säu/à‹la6„­ò™ Ò¿£<•åÒN_cUi²ÌĞ€PÍš§éMô¥2ƒÑ<NÙ(ûÀ×Ë=˜î)ë‰÷p&ÄõVIpX…ŒòCĞ¥UB|}‡vú†í¸ö>Kl¼1Á„gàD’xc“Fİãí\"¢&~[¸$éDÎN@Mœ³9ûíéf‡w	Ö¿Tò†ƒÚMğõAgÛ”Mä0\'I&\'ÁŒ03cKg‹¤Ø£>GÁ¼Lò+eKnÁr…êÖ¢CàÄVïÿ\0WœŞ¯òüŸÈÖ¸îÂ5Ç0~T‹ÔòS=qÄ­İ„9{Èx¢µˆw2Ö<eø_È±NòıYC+é?ôÕªÍ„¶îòÂşDÅåæC Å¸°h¦5VLîá`V7ÀÔ¶”’b9§M|4K5K4Wkf—¤bÑ®ª=’ÇĞLºö¬™?	‚ZˆA/h„Ocd¦ÆÏ4-Ó^OÒ_‘Áô©ª9²Ô¾U<ê¿á¿vµQ€=ä|È›‚{‰%—X\ré|á=ıNÂ–¡üóÀÔ]ÁqˆôfìİÍÎò-ãh—°ì¨‘.ÖÚnèÍ“cÆ¸`ñØo×‡±(èÛFsiİğzŸK»úØ&LŠ)·tá‚Å® %¿ëüo_ÈbXoíÜı²4½}Cÿ\0hï>•&^™ê0]	TPÆDŸ¹‡IÂBàú`AŒK$!*éZO¬l:¡B\"$†mjĞÜ[à]šof¶\'›„5DÆÔ™<¸à¶‰ñT|šjVºWÕÁš4Ÿíãê ò5ƒ4f½¹5Õ§íĞ‰:&L500+át>ÓAt¥ì\'FÊR‰Ş”< àä}(ŸKY`QkcTQ„1¹Ğ´\"”äg›è…Õh¥¸Ë”¥.ÊQ¼£kPƒ9kô¸\Z\'DrJ}FŒ&&\'6\'×ˆ(¥À…EGw“S\"—\Z!Îl[¢·F@E/DõâÆõ.ÿ\0¥ÓórÇä¼\Z©m§ÔÒ<ä¦ÈŒ:´1jW]¥(Ş6:Qàm2ùD.›F8ù£Ti§F›4UÈmM‘Ü}Ä8m»ƒÌ!â1ŸAöãsâOÈÿ\0p?Ü²tï¡ıa-/KÎ_lîÄ‘<¶6ÏÊy\"+òè?Û_x¼?Ó/ùÊ~A\Z’>Í£kø}Ô;{‚ŸæI{–Ÿ›8½SöGéGGüGñ“/*÷ì#ªï&\"»(ù2‚>Û>WÏ°Úm·\'ıàîkò$BêáÙëg¬Ÿ=7=ˆ¨0MÔ¬¡0Á†LqJôzGò2Â¿ààŸFÚ¾ûŸSàCPµÈäËEE‘†¥ì{t¸F`­ŸÿÚ\0\0\0\0\0\0H‘ö&ÿ\0´ŸípŠLà­ˆîƒ5`ĞÈnûnm€õöÁ½I§rî m™üp”Ø.¸\ròĞOIA­õ©$™a†÷\r:]¡%¢VdI¨ØÂ~×ã*c» ŒBíC	¾ùD§&–¿(\0jİ•ö¢Lº;ˆ1œ¡I%åÃE+Aò\nÏ·l=Üà¯…ÇÚå€ºÆ«qEı›Öëªş_T/œœk”„²)ç¿[YpñQÍıVl|cµ”QşZøúJš°dÂ×í¨€—b‡û½}2k´Z’Â>}7¤œ¤ûìŒÙ™»µÇ-¨2mˆ%øSùYåäVxÆY?xó7kïQJ`H¼6‡ç˜—³!ù…\ni¸‹b¯ï[Ìu\'5et…ƒP*›ÿÄ\0\'\0\0\0\0\0\0\0\0!1AQa q‘¡Ñ±áğñ0ÿÚ\0?0ü’pÃêæ9…ë—2lãˆ1¹ïîlmñcqÓ›=İîFÑ‡mò_[êäïĞ-»óxóhóÓ·NòFv Û›2ïø¾Ş8\'ì¾=®ç6¦HåÉÄ6£N¤óĞÏ‡,“ÇâË\'¢XÜø»Î½›äc™VÒ8æüö®Ü†B±Ì5±Ï=„‹˜y?ù¤<ÁÆ²ënÒ±1d†W\'¦²oP¹Ş ‡©4rK,üI¶,ê´¼IîñnF,ïüK=º>‹Hyèe–=È1Ó¢åeŸ‰rùgŞÅ²í¹æ€½ ÀIa®\r–[á;Yõ|¬ú8’=H{XŸ4‰/d9\'-ç‹™gö,;\\¾`{0,Òa¤•Âëû?İ‡T~Wó‰Z*vQß±ú·?›îú—çğ¹Å’ÆKv<şWgLIÉü ¿ïêK¡ONçóc	V!´:XçØ|Ë’…¸İà7ÒÙ3ì ÷\rè•¢ÊjóeÂ?rË0d°õ*ö÷=œ|o2½@ßcÅÛaùÿ\0«ÒŸ¼véÌI\Z}VEÉådöŒ½£~#Œó˜3ÅğBúï–6;*âá=Î‡8ğ”¾åp†á”À¹İ$ÿ\0£rÿ\0rÃ¿ó ¹Ía±wog£Ì˜(îÇEeààM>Éıpsù—–ü³ÚÜf¿¿J\'çùÿ\0S^Oç)†¢<Éiäš/”7–ãûa{ÿ\0ÏÜş¿¿ó\ZòÉUoº.B`yŠonXNKkß¿÷&qÛ¿÷iÜZµ¾“Üg3Óí¾î_ÂîçúÎ8uïev#úÂyrçü¦æº¸ssy[>ï×,§q¼…ûÉxş`íú »(Ç«ÚĞ¾qëè¨íÉÿ\0sNeËó}£Ù}$<ÊçÛ8ÄüÚöÛâ}ÛÌtc[u†Fæß}ï6å¼É%‡LÙyŸlç‰ïrß’Î‡$G=ƒÈ}İîİ[x¸–vR_S/-İæÄ³Ã8óo=±ìİâ2:CÌe¹	gMâYmŞö	}J<³í˜å²ŞgY|2ç-G½†ÛœClt#›s¼0£Ì9jİ¾­–_2û—y–ö–ÙäËC’ó<6ŒğÎ_’|:qï=Á¼Ç„>#©Êì•{[î^8·m·ÄøÒ_¤qÌº[¼}ƒ›ŸÉ¸†ï\rq‹|[ĞKl¯‹mÖf\\·aîÃ™íÓõƒc‡k¶c‘;0ÙöíĞbm¼pÛ|tïo«3ˆ|É×|y[™“æ_;¶Üög\r¹›ûê[m¼[c9›e·9¾Dòmãg[eçì<³ÛĞ{[/~e	–í‡´°‰ôİâØvÛx—mK·w0éz\\î$éØ¸ğr–ş\'¹—ÎøØŞ\"±–lÙ³¼^Ùg²5âïÀBcÓêC’y°ï}Ë	Ã™æà\'›<IâÃoÒÃ6ÆüĞîÉŒ»/2Ä÷Î…âÎXñ>c¶Á¯6Ìd’ÌMæ°Ng&À`.c€Cq\'7ÿÄ\0&\0\0\0\0\0\0!1AQaq‘¡±ğ ÁÑáÿÚ\0?ïà#êı-ø°]»åñ=yö4{{m¿vÊXêşaÏ-ms¿Ëâw/Òqó{Ùíªv?…Ü½“âÓÉ>–Ş;xÆ{³÷+°§ÅËßÆÍéùõ³àˆËÖÌƒcÃÏewvÓîş/Òõ¶öÎërPö5ÖŞäsñå»yÿ\0€ü~¹dgÄ&È=o‰ïó/<ƒ—œ`6ËE™{,òã¤ƒÛ~¤şwğÃk\r¿ˆÂÛËÂòO›Ó 3ÙÏÃC„}Ny$òİ“|vÙ[æ9ùĞü–Ûøòİ69n»{xÎ¿˜û$Ö3#ö^Ì9·ÒeÆıNtÛS“Ÿ‡°%Í¶Çäí¿gÍüÏîÄÏvSæÔáÙdøN½ŸÚèAôíÆD•œe^JÏa?;(æä¾m†i,ù¸î²¹zÁåÁíÄ´éäGgõZü[÷l\r.ä(vöÇvÃ9vbî›‡nsOgnç“†¥”×öY&7=F™›n1íÛ6u¡²	ÎpÇÃÛÍrG¬ê°¤Ø§[HşĞÂÏ‰y<ù½VEhÃÑää}§/~,Áy÷æ÷¿Ç \ZçóÛsw$²@˜pw-€õ“uâ<cûÜ©ä#Éo¤³ß, ›ı-!ÀkxiÇ—KKO‚ÌİVR>¯”ò\0*Áë$Ï½oÿ\0eÂ×Ã v\ZC¶éöŒ9óc½`ßìåó“òYt@g]ØNKhònÎI±È;Èôs(`ÿ\0µúâK™»D,/`óX<Ü‡Öóÿ\0È`¿ü´M3úÆ¾ŞméıgIÿ\0¾¢^³\rãNigŞÑ‰Ûõèî¹nco¹8|%™üàd|Ùû»+dyÎ×–Ï‘Šç·Jÿ\0g=ş÷pcø…òÂ8wù’9üÛ8ıüÏ¬2\\úÛ†?îú«õ*ø,…Ó gÒ?rXé\0æl2a~¿ÔõœŸ9–yåçãüß7 ú¢8ä7v\\|¿Á+ü//úX?à3d§çô¼Ò.œ÷şÿ\0P…°ÿ\0kå\"\0¿EˆÂÁñÕú£‡%¾#,ËGøŞBööNMŸR|I’îKÌº{¶çvõä™íïnyo5„1ƒáË~È~¿_Åû‡™\ZßÍëk/pµÙw²íƒdËdİB|\\;–|Ÿ‡3BÍcˆ:b½m9¬0ö?€9f{_2AØ9äû3ú¿‰ü,“$¦È>ZÍ?×2O‹¶‡y`ÔëuñkúC°üÎİD?q{|vÍìİ­ËÙ;øIç–¬òøÒæåƒK>¤<¸¾aÏÁ’c¤lõ¶ n?ø¿›Ó³ÎGà{Ö[âs\'“?Rio{wå)uŒ©Á—èzZÛ1ÃÛ÷¹\Z1™ØÏ#êGï‘Ø.>!ø,½1ØåÃ¬»­ËÇ\'¬ç¶‡mÙ³ş`~®Ìa\ryz,cØE™`·8Âdv<…‘yqí†éiõbÏêéccñ9ón¯ÔÂı3ç}°\r³{jøÙ4³9°€òı£VàØÍ±ñòBŒwÑ<±³}üCm>mØò~¿Aœíóa½“|¾=³ê»§,ø¹ãaàÃZÏBøöÜå½óğ-·ú¾-õa\',ç.Ù·æòFHåeØÙ÷ou\'t$5‡–0ıÛıä$w­Âú1Ïa>gÁeêÖß¾_&İ|ÏÉ-HnÜ~§m~åçáÕ¸OŞA %“c$?oş¥dŸ7Ùı§X	}öY—ùGó	ì£›tñ-{ä&Z‹ÒÙ¾~lƒ< íñ îz‡îäh‰ò\0ø•BÉ:ZtµpßˆPG`Š¨r[sÒ\nmÿÄ\0&\0\0\0\0\0\0!1AQaq‘¡±ÁÑğñáÿÚ\0\0?ÈâPr~bµ‘å[åÌ­q¯0MÚş¢éWÖ\'\nÄI“˜}€åÓ1W‡Êmæ#ÒY¼D­{˜*\ZÂWZÜ¦æVˆBİÊ|Ö˜‹NS‘¯™@¼ñq\0 <‡3ÆÔ¼ª~c“‰QC=À­JşnÅ´€JªXÁR¡ÄU·“Ä4^¥ÃiÂ…ÈÈ¦¥4G˜ƒ™æ£ÄC\0­š—4àÔQBf-På,—òÄN£X¦®ài7S\'0¹ªã\\àçRÈÕvÄ­SÔ²Ër®Î`§\'‰Zİ¶G˜”×S\\A\"¯æ4\\©´”)\n¨ûÙù™Ô7¹`vAY‡3âˆˆÇ!0Ş‘ŒÌ L\\Çºt1naÆ ¸Áå°õ7™w™ê\'1MåòÏGÜÈ«K\"uÇÔhiâodßp´LêqÌRœDv	‡S+—(0cP\"„Ü\r(¦÷ 1/M@Ü@7¨( WX”KºjsFêá¢2ædbÅb^İFªSî\n$:*„­ÀÈÜWVjZÖ_IYy–Wo/P†ò|Â– î8¢9@(hCpeŞÒ1Ì,8`¤½·2¸6Mjf&;¶<npMÆ\0†/<q4µ`[ç9™µ0¾æñë˜»n\\î\ZÕ#æüõŠ¦\nxàr„ğD¬Ë°PÅF×âH;LùˆlDÆ®å‚ç J\\Å{2ñâµµJ°ÀlàÚ”î%Ô1WÜÁkøKuh2Ú¬PG#¹\n£c¢æ¼\\V7Ä¿ş /%û”œ£Rpñ¹rhwÄ¨4jŸÔÎ®ã/Ú¨aÍŠ’Ü1aèŠ/O2³:K,ÿ\0hĞõIÆœÂt¨µ?j ù†÷»\\XÖuî6-ÇV¤|ª\\L>ØL®Ûj\\pLR2µŒ¨\Zşö]–[0¦37”ex§í-Ê¦âÍç˜¾Gôà×á©´ª«µÑWyëOy‚\0av-wÂ‚XÁiÑQ*Øá•ä¦×æÇ.±#\Zy‰Ğù¸¥«êàÖì~!„@›)ñ©nµaĞİs-r2«³EKœjµ\nŸã®2Ö5Æí^?ÏÚ3£PÀ•\'nß*x?0Aº7ªø»Ä¶-RÊ-¨œ—1\r¾kZ¯†Z\r%îSÁ¯/Ô`¾(ƒ!4µh¼…‚ëR®¬ô–ë4KZ}¯@ĞÇf7yÅ–-wîRÔ†â¯w*‹IIĞ/á!¾nf<(Ôoâå*àº UZ´È°àÎ; =o•,2e‹FC‘\\šœÇ°\0F\nª»ø–º^\Z*uŒÊáfÏXÚJ5D¥»ŒPÛ¯–Y¦ĞØCçæÂÃs]nq¿hîPÙã+¹a«í×;˜âô•=–0÷}â£hÛinMÒ(\nùä‚©:”Il\Z\"fß”ÄÃ<Ò¬ƒ	]bÂ®cHéLì›Cu¨ûä–Âuaø„nİrÒüB\"ˆ*p¿Kq@k]\r†‚ÆäÎgE\'6?‰–ëÈÄNÃ¸oÕÛËïó™ÈEDfRö¶ëli\"J-88à1-„gıÃl^Ù@ ¼õÔfµ´¼AD†ÄÇØáeöëæ±\\7¿÷ˆ#ÖÅM—™¬ó2H¿<CÁ) Û`…\rêSñƒó\0öBÈ³SVÁMA»zúˆ>3+`ma\"04ú#ÚÌ¸¨4\0\Z‰Ÿ¨B7JH(Ó*\"_¡ÒÑÁ8\"{%Æèî.Ë_˜Ğne×`Š=;€b`ËZ¬ËÕUÅé¶…t¹eÔ¿ÉÌ¹JĞÈü¢!™ZÏ¸¨Y×İ<C3Ä¢°ïºåøî¡‹¢·Ÿïòr¯ŞmáÑıRÌÅ†´¿1ukù&QF‡%úÎ³P{e‘YÛt&w4ê…gí¹HQdíø¯\rr©N*dÖ4ï¨ˆ+~FÇÈÊ‰4*•Yxw4ği›ºƒ»j]”Y,°@.6¬rk¹p©¥t±+Úi*X&cåÊ¨_G°\n—Rµ‹©L4Gê	À@a8`(”# £ˆ‹}ÿ\0HBm-Ï,x\0ˆ²¯Á‚æ+°ˆœ+o~1„Ì…¥ßU^*ùtÙ¨1ëz¡•Á&KŸWƒğø n&Y£Ô§¤¤å@¯¢Q59l¥§æ*m9€ğÜI{Qê‹#~ï—â\'\0£á±x‹ˆWCº±Üb *×g|´nKYHéxg8¶}®²ìĞÎfkW¶èí~ã.t:Ä3h\r\"\ZDÓdn\"“kl)€„³A§5æ7BÛRXl\ZsNº—Q\r$¬†ÍİbPÂIlEä¾æ\nZ(Rˆãş™†lQ­ªH´ÿ\0%}ÒXœ‡ñ¬šş¥¾Å™–Q•ı$ºàÆÁS¼x¤\\É”€Ò+\\¯ó³ün\r½¨~ñ\r\'‰ÿ\0™/Dµos#×©ƒVÔG¹Jî¦TAµ]ù5dà±¹‚´g2¦5qlUÄ˜tŞ*4©P¼èš+æeğ1\0Æ;Œ×1¡³ñ	µß1„mH#J×QÕÛQĞ\\ï;ˆÄÿ\0É³4ı@º| -ªÿ\0Šê^J!-FªU\0oˆ¡mxGr—¶g<S¿Â\r~¢5¶Jc¸HNy‚ï˜FËËvÍOêVŒ¨^äar¯™j\0Ä¸[5\0d &Dø¨ƒ\0-ËQ²~å´B>\"ß³™iÎ îV>`ê¶~âWKæÅ\"–ñ\n5¿2‚ñÈ!¨ßˆˆÌg(p‰r¯0®¬E]ÔQj99!70_©¥á\n2Cv¯˜¼T²à“œøƒeßrÒÀ¢_2õ½²Ôß2Ğ*5¬\\mNQ­/˜ê¦7ûŠÔ¼ˆ¤¦ÁÉj¸ìµFc\02›Nåóƒ$¡³P£¨ë™€á„Œ®“ˆİ§<KeÊU­pe{üÊŞXŸ‰kÆÈ7xŠ´Ôh(ç¨ÚØó­Å{gI•ÌU%ßå719¨JFd**å«$Òmœñ,øEk>áSP¹¬DµJ«LR‚&ŠqGf]Ã1×V_„¶¸‰RÔşå_‡3µ˜eU8Ô¢-âY?¶Ä&\ZÅ‘F¹–(Ùjà…ÑFb^`Sx…ÜoşXw¨e/ˆº•ÑyÜĞk õaÚ‘—L‘Ü®ä0–EJÄaY<°W˜â š¨¡ÈN¹pfÖæ-/Ì| Ûº™‹Èî¼ù”¬å€-•‚â¹!\\>Òñn\nÂ³¢ Ğ©{%tJÎÎî-Î0RQ^!–JEÂ†~æ;ŒL©Ì®\'Â.­D,*¥ØÀˆ¨6B€…11øÿ\0Ë?1Ú÷‰à¼E\"jŠ–k¸VÀÄj-Pî\ZE<â\00UˆQGˆ 9câêx„¿™LÃ¸™w‡p 0.[`¸-qsO¸oîŠ_º`q37W˜Ù¯Ü¬¿É1$¬ú·ŸËÚG€8z¤ş„äı(#Í	±_)E™GÊ4½SQ\nµ>sàk™gxâ†ÏùÆZ@õ	\\Çú\n’¯gÜ&¹~ÿ\0ûfçÊZWÚq_‡ıÄ\n¯åó)È™“\n„yæÇä—\r¾W†ßº#îWÃáÛe½4A”÷ıì‰2~0˜B«b­åøYœE«_‡µì\'µ@ÉvË=Äî©dµØ6+•ĞA­b—=NŞ>Æ¡r%†>‚«s.âh¢Š…ì¦û•7¸¥¬E)û¡L*Ûâ&Ü,U¢©€EÎÔ¿¨Î ë0«pìƒæø…¡e]j5Ü¨g‰jÖ)MJ×ƒ,€ÀÈü3(\\½ï÷Uùeºê¿š°äº®‹à\'âsbâ­(ùm\0@\0“ÔwUÁò#]øˆã®¡Èá¨ry—›¨+y¢2Ù™¸­¹ŸÿÙ',	'image/jpeg',	0),
(31,	'Filly 1',	'ÿØÿà\0JFIF\0\0\0\0\0\0ÿÛ\0„\0	\Z\Z( %$1!&)+...383-7(-.+\n\n\n\r,$ &,,.7,,,7,/,-,,-,,,/,,,,,,27,4,,,,,,,,,,,,,,,,,,,,,ÿÀ\0\0è\0Í\"\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÄ\0F\0\0\0\0!1A\"Qa2q#BRb‘¡±r‚’3¢Á4CSƒ²ÂÑá$Tc”ÒğÿÄ\0\Z\0\0\0\0\0\0\0\0\0\0\0\0ÿÄ\0.\0\0\0\0\0\0\0!1A\"aq‘ğQ¡±Ñ2RñÿÚ\0\0\0?\0î4¥()J^wI4’0D@Y˜œ\0ä“^æªÜÆĞÜ2º¤„€F2¥ÎÙ\\î}•RË#™¶ğ‹Bœî:Öj¹Ø^ d·hßß¶‘¡oP¸hÛ=s&ü³Ÿ*±Õ¢Ô’h5‡†+Öj\'µPÛ[I*€ÒcLJ~ÔtF¿\rDgÓ4o$µ‘\\jY®­òÉ#ÿ\0ÎwºÎ¢ğàÍŸ»,š6\'Ûzì³EqÉ”0ùŒÖTİV`ËÎƒÃ=iJVÅ)JJR€R” ¥()JJR€R” ¥b€1Ú¹¯d€šĞQ‹Í\"ôúòYÇøÍ_xäæ;iÜlR\'añHı«™]ñ#ÃaµÖªñÌªCŒ.OƒNŞ¢¼¯jÕmŠ­tóô:ô®vãwèÊá’æH\\’ê½Ä›sks˜ä?ÅŸ¥tÑ\\ƒHm¯á»ŠP‘Ïˆ4ëŒú{œêùÙ>ÕÃz¤,±4ˆH!x€\nuª“> <FO:ßG|g¾şFwV×¨±ÕWµ“æh“ìÄ;Öø¶R?N–¤ãÒFòª0‰-âYe}:ØêÖBª€2KoÏ‘ªï¼vÒsŞ<Î\Z6EÏyvŠ	U÷Bãì2sÖ²×^¥	Sò|e´ğõ)Ë£Ç…¶»ùî±Æ‘‹vÿ\0š¼vJ|Û„ûP3BÃ9#»8\\üSKcÉ…i?ŠNYµ‰\0~ÀU\']ılÏ¡¤³fE”jÂ÷›Bìcÿ\0X ÁÉÇ„ìq\\º,éïuÍã„ojWaÄë¹ 5Í,¸(so¢Ò]ˆ’$8+)äTùùÔ”ÜbòØ<­soscSÆb16‘ïuv€ßwå‘Î½ÓšÍ<à^©_1¶@#‘ßó¯ª\nR””¥\0¥)@)JP\nR””¥\0­7ÄVÚ	ga‘3‘Ë:FtçÔíó­ê×¼‰d\0£)\"¤ÙôÆj9Õ×€/}|©,ì5K4‡dÏØBO‚5Î\0õ$×1ãëqñÀˆóYñNğ¼~-Àê5#]ˆÉivfâpMmŠV ¢I›AÊD]e!”<Ew©¨^Æaöö\n‚ŞBS€à¶<$ª€êşH\ZşUä*õ\ZxÎÙ½ß‡ƒ¾¹Áâ1Xø’c‡‡[{€­İõ”î¤Â@õ\Zœ~U+Ä8Ì2Úw…„zAx¤ØÙs¥ÇÀ]FGZºâQÉp\ZNê	s¡ƒc/9r÷MCp°Š–åciB‡Ë°Æ¦ñ\rÏ•qé4Ó½å·sõmôtûµ,ñ’ñı·ku2ËdÓË¡IÊädR`c$íµQN7ì72¹µ]\n«wz´wtBp¿XÃÈi­Û7¸£¶V˜éáe\np@,G_*ÚşÕ¾y^ßÙÓ*«&§˜\0ªÌÊ7T;åÕìj%D“’Çë†b¨„Ïîjp^ÔµÕÅ´²³@èë¶>z2Ë ëÒ¢+2é¶^ì:cŞec3x³áË2ƒ±È+jó‚H.ái..ğ±\"Ó‚ˆÛë|ç*Ää<ª Ù@Ríb‚k¹È±¸\r\"*èQŞj÷u.HÛÄt\\ºånè-ËV³—÷Áhbä²¾…¹/Ë0\n¹­ë¾Ï‹…XÃ/1«lzŠ®pş(±D8×°ÿ\0µ{Ûq÷™IËs †AäTò¯a3Ö²­ØQÇ^|–ŞÆd°ˆ¥à–Hc\'EÏ÷šc8À—^T’5à yšº[Î®ªèÁ•€*ÀäFA¨Ås¸/ÛÂ3¾1˜>b§ûr‹Úœ¬4²š‰V_5\0éÊ®™àê´®§’ÓJR‡¥)@)JP\nR””¥\0¥)@*­ôzÊX—--Â˜ãAÍóïEÓœ™õ«MsØq¥7Ó*ÍHš‚îYB¹èF€OšzT3Z+÷“Q5.{I¬b[îå‡Àxÿ\0Ê¡¸µÅ«C\"­Wa·Õ\'=1Ë•\"–êôı\\pÇûRÅÁø\0¯‘ÅoYö>óK4şj¿VŸÒ»ãâÆ¼åìÚÔ²›_«=+mÓÂ;yoä¿’3´]¤³’K|Ú;¶l¡…Wb„\0\0=ìu­Ûn6˜Ì‡‘\nşºZl»	-¬*=QOî\r|]ö(ÁqÆz˜‰Œüô‘Wÿ\0Ï«nÖŞ>lâZ…»8ş?¢‚{WpoQi«»ˆC¥d,ê.rËËn< m½KÙ\\ŞNòL%•‡ŠBT)s¶¢¹İÏJˆ»àq[ï¢º™„¤RçÄwÃt9çŒõ­ŞÚkTPb9,zœü•A5oÁQş1úUÅÅMÍsÏd„œâKÉ=­—İW@±¯Â0NO©&¬×|xB™ğE\Zà\0ä¡G2y\0*¨üv}%ı–`Š*£\0’U˜0\0oÊ¤8Ãw	tÁ}¦v“¸ï†Ú(‡˜¯WÛ==å\0õB*+lVÖQ\\s6iq…)ı¥á	+ò;V8RSs{r9F‹ÏO6 g|ÁnZmR±Ô×3Œg8\0ã¦BƒZ˜àöQŞÈÇQ13†g}ŞåÇ\'oı±¥yl,TuÍŸ±İÍ\Zû¡„±ŒcLêòÖ¬~u2èÓÙ±’»3í§‚÷À8r¢ë$Hçó­8¡~\'f¬ÚT4ƒ œ,Ge9Õ“Ÿ(ÆNDö®”È#SVß`8w´]4í6§\n:™‹à¨äz–é¤dz4ÖU¶¹ÎÇßéô¥*Ç€+S‰qíãyfu4fc€:~dœÔãÎ¶ëW‰<b\'3iîôz½Üˆ ó–(\nÄ?HP\Zá¸Š& 	İT\'‹\ZI‹¨9æÊ1×pSšåmb‘YÍáÓ4†$o³éß§è*ûÙ\r~ÃiŞdÉìñk\'®íudùæ¡3*ìÜÚ&)JTšŠR””¬\ZæG\n	$\0I;\02O•r>Õğ15àÑ\Z6cr\0ÀÆÄ9èZL†jGé[ˆ<ÓCÃ£%VT/1ü9Âƒè4±ÇS£¦j3‚v’)\'hä=ÔÊ‘[¬n1¼)âUnG,ÄÏZœ[H°¨äÀÒ®ü:ØFGÎª93*QWŠ+å€;µõUŞÜñæ³¶-\r4‡»„Zˆ\'Qó\nb:â„¥—„}ñ‹ËMî$Šî6	ødV—ãÜ2åû¸\'…Üò@Ø\'à:üÏÆ¸‹Í1ñ%vñÈÇ,ìvçåĞCåWNÑıÜXÃÀºÖİäaÀRLì²¶£«G•Ê\n/Ë?@Üp¨\'ˆ¨\"²69áôªgÒG\0ï£	î€V$È}õ„ —\0·˜Ú¢~‡/8ë½ÍÔÌĞÇª%_¾ş¶\0\n=I5~íDŠ°êb\0$€™\' ¡™Âx]õÈDwú>åá|±\ZZ1Ë³RÜBû¿¸Wño_\Z•l£¶²AwV\r”2Ü4ÚªÜ;÷Oº3‰7cÂJ¹|ú×Ç\ràĞÉìÃC4ıòDà»jr\n™°9ĞcË%Éª5r›\\qc]//áò9gX“yd!Q\0ÔÇ<Î€r@\'À9#˜ì}—ìêYDQX»;j‘Û\0±Àa°\0\0\0ôêrkg„ğ;{PE¼1Ä=\n=wngsÖ¤jcn¾z—Ï	x3JÆj±Æ{Ru›{$Î·îâóÖÃŞ`>ÀßÌŠ±ÀŞ	+Å#·PÒØáTnÌqœ*õÛAÎ¹ïâ—2eNc…‹°Û“3.~¼ˆ^ffÛ‚˜Ïw)’V÷‰æGE\0lˆ>èøœéÚ)(0ˆ2O*¬™Ëm‘	uÇ=ª&‰P¦¨dŒŒõÁÀÊ• ‡:³ı^¼¶\\–òGË$nU	\'™ÀÆzã5Ê,„—@Ç+Ş»I<½#r|äÑ¤cìõ®™ôX¢(n-—:-æ!2s…•VP£Ğ\"¢9É7½ä»Ò”«‚”¥\0¬\ZÍ`Ğ7ŒËí|Jê`Å9;…(Hsİ\r$ç‹mƒš¬]ğ‰\ZX­ •ææyw¬4â5VVåÚwÔ>ï-Æ,ëhmo®ã}ÃÜ¼ªHÆòbB»şóÒşU«ÇìBŞ¬ë3C\"ÆòÀQ‘I(B	“Ãs#™«4ıG%3’¾H¶ö#‰<±¡—ib‘¡—|øãm-¿®3ó®¡\\/è¢	cYûã¨¼«.¼ä6½A˜¾$;{zWq‰Á\0U¡Ö}\Zâ_N \"åmKÚˆcÃ|ÿ\0®İ\\‹‹Edœrò^#*F¦&F¡$e$+¶ø\\®G™¡hËkÉË»]ÙY-¯m­íãf‘ãBFK>¦Éı>B­³úKº”GeskìÏ‘½Á×¨°Œ‡ÙB€Æyµ{]v†)Ú0·8¹²b!¸‰KêÀ!@ñ]Šô9ó>œ7±7\\Bä]N’ËªD/$ãÙÁD ”HğÏ¸P2@Û—\r¬‡;“Xù{°¼;Ùì-¢ÀFz³øœüØ“UnÓÜ{]Ü‘¶ğZPR¢BÍæ2€<ò|±ÑTb¹Gl$6·w_rUö‘çàUIWü(sø±Ò¡–Ñ¨Êä¤Dö‚vïcÒ52uğDäşgæ*O±÷‰hğÊã½I){Êò¸ÔúO5b@#š…\0g¤:Äcµ–åØwÒ!Òy„û¨£™ß<Éù\nœì·Oj²L D2*õÊ£PRqŒŒ´	*CPORâá-İcşX\Z†ÿ\0úXZSY•”áÙ}Å?tÈvÕøFHÏ*€íÇ$û,LÃVÏİœHÿ\0z4o°7\Zäé#ÄvŒ°;Yg(­\Zî$ğÇú|¹¹ÜïË8©lğ\'8Ár[»Eo$«¥¦î!ûz	Öß„>ÅGÃQUWãÃ¦ÚÕB\0<*»3·!Q×|^ç‰2¬#E»¨=ïÚ$ÿ\0³LoüGoJ³ö²Ù!wçÍ‰İ˜ù³ÉôéUyg$Ü¬|pkXğYe\ZÜé^y?şŞª|UZä¼jÚ!L«ÉxŠ øì[âü®s–\nyu5Hâ×ÆB±gLòæ{Íÿ\0(õaY¶‘Í9B/Ÿ‰¹À/ZÄ@E\02…A…ğ;&@;á´ç>¼êÑôlå¥»o²L`ÿ\0“ÿ\0)Z¤Û¡gKkt)_c`ª6ÖçìÆ<şC$×ZìÇp,Aµ¶í#ã\Z·fÆv\0è\0he¼šéT§76°‰zR•©èŠR”°k4 9n–svÒ³§w\rº/vºäv™£`<×øg;UCˆDÒ[Å<Ğåí·FÕH•yì\nø€óÊ®ßI|1–â+”ÀÔ¡;/{±è$Y$Lô:|ëO]Au\r™ŞuŠåÄ	TŒT¹õªµÉÍd^äÑµÀ\"’äê´ŒE	ÁO­‹à\0‹!Šà\00ô«ı„S.ÒÉùhŒ§ï#V¿q¤ òıªR¬tG¡JW”w\nÚ‚²¶“†ÁÈã‘ô¡\'¥+4 <åp – \02Iä\0Ü’k“v«‰-Ì­rWMºBñ¡nn‚òöW ¹Üõ«·Ò<¸áÓ½¡ğ¼ˆ®?¤š¡^GŞŞEŒÇ†“OBcÓ¤ñlü…C;ô5Å·7àƒ·¶i’ÎÜêUqªB}í)†èOƒ?:³ñ”^[`­,,ÌÁ³„‘«6:ıf »gÀŞ£rÿ\0Ú3h(âDFV-yw`:¹]8™;sØ~-ìã¸µRóI’w$ûÒ;ôæ~CÊ³o“v½G5Ç—×ĞôâGÃ”(-5Ä‡ìÒ;sÀÔ“CzÏì„×®&»Ü•‹š/‘cößô?ÙÃè=ıÉï&q»¾ê²¿©ëWYäXc\'\n9U”|³ÊYõHÖ·¶ŠÙ9Ìóø\n©öŒ‡nºGº<ıkÃ‰qÄ»Ÿ€ÿ\0¥Vo`¸º úˆFÍ\'6lŒâ0vıãù\Z«–xF6[¿ÑÄ8î§ÑÉ*9‘‘Ì*¯‰Èò§1Rœ\'²×ã”û2¶53a¦`9\0£ÁùÃ95£ÂxE´2:ÆÂ”Œ>êêaö—Ìzr©Ë[ÉD(]›Wˆ®£–ĞX÷aVÑŠ®gw³4U]cs…[/•LC6·.«+—IÂ’;²±Âymo¢¨üU¸…áe]H#ĞìEOöNõ¤‡D‡2Û±†C÷Š{²cñ¡Vşc[šŠ=Ô¶“t¥(sŠR””¥«Ä¬c¸‰á•CÇ\"•e=A®Æ8$ ›ubÓZrvu/·÷ªºpÃr}+ô\rP;mÙI‹=Åìä;F0J€i™	8$…Ud8\0Üu†gbmp;-Å}¢(åÎ$\\,ËÕ]vuaĞç5|Gdr5É.8Å¥Ò†ºCaÄ1¥ÁfÛN\nëSÌs¨»Ö™FR{¦ÒChö™XÔ:¶ÄGÏW$»2•Ñ­á¢şş8É4‰\Zlì~fª=œá¾Ñ/îŒ	¤G4i¹–šDÛ ä3¶kšvNÄ%À2\\F†GYe,Äx\n÷Rj$¬ªÍË®7Šöµ×	\Z™Á(™Ç¦¦8ğ <Ïå½[\'SøVls­9øœkÌşUÍdµ¿”“5ùLıˆ\"P¦§ÔOå^ñp6a†æOçÿ\0­I×o8¡ºî…tsyğ®ã×­U/oYoÈ\r0„$ ò^ñy+şTS§lÖÏ°V¸öˆ¬H®ìÌòäŒ‘¨œF4œwç°çñŞ¬k-ÛŒ4Û·Xb5ø‘â>­•I3kmü>Ÿ>[·Ê¬æId$äóf8Õ#Ÿ/?*ÅÙËH¬“[bYßvcçÈ|‡EéUŞÏÚFWšO³÷GÙO€ıI5o³°D:î}‘ÏşÕH³Ã„›yıÍ‘Æn$rCaZ¼BY³éÒ½ø·jIÂòÛ™ªM÷j\"FÒÒ oºOÃ^\"Ëx‹oäOPrÇ,yVŸh.YQQA|ê~ªŠ2Äg¯!š³Ò¡fŞ8¥cĞ²”_[|¯˜lî$•^UY£.‹*†`»ª‚22FIn¤Š„EQmú¸$8GW]0QrxJùéÀ<öcĞ›Ş1I Êšóî–ø|kY¸Àïf¶ñ÷ˆòA€…,Ñ‚		ÁÔ:b½ø‚[u\0)VPw|Œä“ÔóÍ|ŸeìÅ]uâ¾ûm–ŞÉ.¦î+Y¸áµâ³ıAøc`ÄÈ½ç¥U\\úgÒ¾C‹x´ê\'|t~ub°ÉrÃı!Ë¯ğ.?5\\ÿ\05m’÷R®·ÕäìHÙõU?£‹²ÖÆ\"sìí¡vÆ‘”?l©<K á\'àR”¡AJR€V¯»Xb’VÎ˜‘±¹Â)cç[U‚(q7i®o¹vL†!>e¹ï«–UØC^°Î<ê£ÚNöËßD¶»Ç®èßîŒ~<²¤gÖ¾%‰mn½–VIcŞ3>¨†?»|“¤r8/kh.o°wŠÓLäÒ÷kğ\\jøé¬ß,ã›r–Üà}™p\Zâgxf˜Ç`*²¶ØwßvÆÜ‡¬ç	á\n„¬JK9Ë1%™,³Ín¶]°7$íVŞ`\"_ÄyšÑPXDm—gÇ9}HÜ<0!ÖÉ\Z€I,@Øs;ÖõUûqØÈ¸Š!\'»šL2i¤œdm™NŞœèX§Ù¦»%A²Éà>¬±ıL@üÍDñ®œ ğÄzıò÷¿¦¦$†æ™#l+F…G‡Yf9ÉÏ!€*k¡A™•\ZbX»ìm“êq€ş•„“ÉÉí}íŠ1é\"F[å·Û=IòP7\'ĞW‡ws1ğ¨@~Ô§öŒn~ekS†K#ø­-¤”»ù1o÷Œ3§øW*,8†3¢ùwíû÷X¢ƒ8£D±ÖGşKqöéÈê©¦5?ñó59gôy\n5I¤|H’éL›´sÛÉ$sBÊĞ€ÌQÕÆ’2gI+Ïæ©«~Ù6DnÌŒÃ!%„+€Hõlã´o»l}Q#ßp8bÃ7/äûgÏÆÊÛâª¥ZWî}†I±˜ä.nZ2‘D\rÈÈÛÕ;ÅI€L`rÊ‚­èÀî>#õ­N’Ë‡]í¤Ôñwj2®GÖâR­¨Aé¸¢y+	¦²>Ğx¦U\0›7ˆürËèş†$üWÎ½n¸dÖîİÂ÷°³T\r¥ã,rTgf]D‘¸ÆkÃ‚Ü›€‘(ú¾ù®¤<ô†=äQ1w…´’>È\0Uç„ŒÊ½yşÕ1>›A_º§rüŠPá÷^ŒÅ6fäuUUØdm«;g•[¸Ä!-£U\0\0˜\0ymSl‘DKr$òëµWûQx¥@_tŸéWÆÙUÛbÍß¢âH»ØàJ <D¤şõzªï`ìVqê<¤ÊÀç#¼9U ò!4‚<Á«Iãj\'¾ÙKâÅ)JŠR””¥Ií?`ıªnò;–·ÊòªÆ¯©—\0:±#C\0†°ÁÌf,¸¹Uw5ÃáŸ\Zˆ@±ï¤Í!]N¹é€E5ÌCL¥Àô”	3ıLß•\níD÷fíu1söy|jËP]—ieëš¡aJR€‡ãı™·¼ÒgBY2Õ™Œ€ÊAÁÀÚ´,»cXT¸ûoãoêlš³Ò„a\Z#…ÇÔó­[§t%OéR¦@\\îzWİÉûkÙu{›3;2!”C#/2’gJœô2\\ôMtËÎ±÷RÆ’GŒiu6Û‘­nÓğ‘um,;uğ63¥Ç‰\'\0ü«ÃƒqŞöÏ¿q¡ãV#îäŒbDm‡&ğ2#b(IAí	V+Lr‘©ã¬çIÜêRHÀPHÆN*»wÃ/b…•‚ıÑd˜K©Û¼eÂºœ)Û<€êk…Èò8’C™&mry³clù(GP*ÓÚNg‡B64…`Ã}.¬<²7ôÍS=û*¨F-®_&xO4C…EÀòÏÄÕ†ÚÍc9÷ıy\n«ö[‰3Lc•J£ÄÊ°9Ã©ò$r# íêg8İàQ§®Ç??ûUãÑ¼ó)(G¢?´ÍâltQP6Ñ{UÔÃ|ò_HÓ\Z¿©Š§ózV÷ºÔ	ûØ¥Iıp–ò\\’ZK©äı”Ù#Aè0OóTvÍu:4éy|¥š\nT¥)@)JP\nR”¹m˜ÚñHç$®¡Xß~Mù­EùŸ*éÕ^í¿f…ı¹Œ0G]Ğ‘•ÉqÕQœÅÂîLRĞìjÑÄ#†&–Fˆ51>_æOAÖ¸U¿¾·~îH™ÚÓÃ:j\Z»³¸b5i+\"ìÀ@5Ñ{2­~ÑÜL·ˆ†¶‰†ìİ.¿qz{ÜÈÀ^	$ÒæiA_û¸zªóÔÿ\0¼¹(Àçš–¬\nÉ 5ÍÈï4zf¶*‘Û ÑOŠ}É#Cğ÷¡`~UºÜvR1€=h\r[»ö<RÔ ;·®)ù¾”UÒ¹üeŠ[i‘ºHŒ¡!¼.¹—¸ÃâkªØ^¬«‘Ï¨ò 6ª“ô›ÁåkK‰­v˜ÆË*´Ñ•*ÊGßU$«sc‘«µ`Šˆğ©Ã,n1†\0Œó{´\0[¶N—J¨vÃƒ·¸&4/orÅ¢Uÿ\0W)İãôFİÁéâô¯®qpşøK¾,yşBª¸>‘XµUÅ¯ş†ß:¸¤A~Ä_ÓS¡OÏK~U½Ú[Eˆôå[–8\"É.44˜%¹ç\0/ì\0ªç\Z¸>H	?-èWOírü;û–*Np‘¯Şf:Tmêzëœ\nÃÙíá‡9î£TÏ,éP	ÀêHÍR~û+ X®n×1Fw*[ıcy>“¤ƒ=Nİ\n”3_ªWI(ôŒÒ”©8)JJR€R” †¬Ôohx ¶·yq©†4Î5Èä,qçñ9‘ç@W{MÁbâ7qÆPbØfyA Û­®Şò·¼À†6ñäXíítãYà\\?¸…U§$¼÷]¿>^@Ò¤(\nÄ€Ié_UÚ­1éêÔ´“$÷6°I\'v..WÄÏÕ ?yÕWùª3µ½™[[„ïÅÅìˆÆ¶fŒªêe6ë…‘0¥ƒ¨n0p	4ùººä-t­¹Øø¡‘dw\0_ä«÷:¯¸zâWšR1öVŒœôñJ´^ó³1w×r#°Ë¡t#ua°!‡Ÿ1PÂÿ\0ˆX\rgEÜk{©q7*ÇO•v)b0FEsï¤µÎŸöNWâ‘úŠÏÙ®:×\n5ÆÑ?UldcÏI#õ©ÌÕS±“j\0ıäôíÛĞ­¬:\0×4à¤QƒŒí†rßeW9\'à9š¹<\"™Û¾?íS¢ZáÖ\rjò6Bk8.7r0AÆç}Eğëœêi%M?=EÉı+k³\\/Lq¡ÁĞ c8«Í×Ş‘\'â|ê¸ÉôÛ¥ŒaËeJ..è\Z<ê#gÁÙr3âÆ6üñQvv­{:Á\Z—VqíR4,¬Üµ0ğ„çâÏJŠâ|%ÚIõÜwQ#÷¥BìUğÙsœ•ÎWl¦¬|¶SÛ*[ÜZyAvÈ¹:Š%XŒä®;õ43¶Û6IWşøG[E\0r\nú¯;…‘D!‘Ô2°äC‚>F½êÇ„)JP\nR””¥\0¥)@*µzMÇ!ıİš‰äò2I©a_åPïƒæ‡¥X¥*–b¨$“È¹$Ôc“ê¤™³®æV™‹lp±®2qˆÕFÇõ ,\"•ŒÓ4j™ÛKáxı\"˜ÿ\0*–ÿ\0*¹\\Ï·sfÖõ¼á”€ÜĞ6Öº8S¯2cŒæ]ÓS~lMIñîÒÛÛq˜Rá„cÙN‰»ªiH!%P0OrkÑ]˜Ò6¸sdÔ˜L|$éÎ6øÕ—éw†È—æia±á2Dò’Xyê>F§JÓ55	¼díªÀ€AÁ_íÄ@Û>y`#\\®)î,cÕgpğªïİ0ï\"9è·]şé\nöƒéæä­µÌ17{˜õÆÄÆñœçäE\ZhY¤¶¾Ñoì<Æ8­‹uAş‘ZßJV†)á»ç/q!û„¶¨ÛĞ:O©Z“íÍ­ŒQ—fF[áœn+Fç·–[”‘¤9 A#‚9cNj0gL§\\Ôâº!l¯\ni€95%}ÆŠ<n[Ş8§¿!úUqË5Cì½úÈ¤i]*0jB¯°ÊçqÈâ¤câ0][c½T ‡RHÊ2œŒƒäyùŒÕyG½\rD/[¶á¯Éjâv)q¦h¤1H¼ˆÁçÌve>_:„K>á\n–ÎæF*š$²qËÏj\ZÏ´ê]c?x6coPıá;^u»í2Iˆùd‘²®Hñ\0ÍÕî`÷îGFú1”›2‡”SJ‹ü%µò×è[ª±|¬í–7`Ò34’ËSœéŠ0 í9ÀÎ*z¬|å9¶ºË¥(PR” ¥()JŸô£Å6,„àÜ0‹läƒ’à|QXoçQ}¤Õg¤Æà)^~ùU·=—^#n#×İÈŞDøÈ®wR¤ƒñÍPo8Š6ŒÚ	‚EeÛ`Hr¬>Õ£\'n•ÓŒYÙNáármçš8É%Dr:/À 8ÏÊ½Wµ7ã•ôãæ‡÷SZ²pË¥%M¥ß®-å#óU ×ÏömÏş’ïÿ\07ÿ\0J÷øgŞÓu»WÄŞúr?“ü’¡¸M¤œBöŞd–NúUªF÷×&7Àğ+r­™¸]Ñ[K¼¿ÑåºWAúì]ÄÉuu„…Ñ±¼X,äãl×UãÁÍ¨tFŒd³Cô]Ã”©Èt@3HFÇ# ¶ãÒ­÷6É\"”‘UÕ¶*À~ í^ÀVj5É¾ÙÏøïÑ’J¶¸’ØhÃ¾vV!‡A³`c•R¸¯Ño…Å$3Ç†0É#\0s¶­ôÍw\\V1Lš+ìK?0OÅ¤\ZLY]£Ç&TûÌ@elpAyUÇ‡cºM<°1]š÷‡Å0X£”AĞ6>T}pÂIö(2?cVŒ°vWí\r«\'ãìI¼GŸÆ£8g’îNîŞ#<›{«=Yù(õ5úVÏ°Ü:&Ô–pæPø³S–öé\Z„ETQÉTàÕ\rä¥ºç5Â+ıšì”0ZÛÅ,0I,Qª³˜Ô’Ê7ÃÎ3Ê¬J l6B¾ñJƒ„Æ+4¥\0¥)@)JP\nR””¥\0¬R”•šP¬Ò””¥\0¥)@)JP\nR””¥\0¥)@)JP\nR”ÿÙ',	'image/jpeg',	0),
(27,	'Schneekugel',	'ÿØÿà\0JFIF\0\0H\0H\0\0ÿá‰Exif\0\0MM\0*\0\0\0\0\0\0\0\0\0\0\0b\0\0\0\0\0\0\0j\Z\0\0\0\0\0\0\0p\0\0\0\0\0\0\0x(\0\0\0\0\0\0\0\0\0\0\0\0\0\0‡i\0\0\0\0\0\0\0€\0\0LHUAWEI\0\0U8650\0\0\0\0H\0\0\0\0\0\0H\0\0\0\0\n\0\0\0\0\00220\0\0\0\0\0\0\0ş\0\0\0\0\0\0‘\0\0\0\0\0’\n\0\0\0\0\0\0& \0\0\0\0\00100 \0\0\0\0\0\0\0 \0\0\0\0\0\0\0ú \0\0\0\0\0\0M \0\0\0\0\0\0.\0\0\0\02014:12:27 17:24:31\02002:12:08 12:00:00\0\0\0¯\0\0\0d\0\0\0\0\0\0R98\0\0\0\0\0\00100\0\0\0\0\0\0\0\0\0\0\0\0\Z\0\0\0\0\0\0š\0\0\0\0\0\0¢(\0\0\0\0\0\0\0\0\0\0\0\0\0ª\0\0\0\0\0\0×\0\0\0\0\0\0\0H\0\0\0\0\0\0H\0\0\0ÿØÿà\0JFIF\0\0\0\0\0\0ÿÛ\0C\0		\n\r\Z\Z $.\' \",#(7),01444\'9=82<.342ÿÛ\0C			\r\r2!!22222222222222222222222222222222222222222222222222ÿÀ\0\0Ä\0“\"\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0	\nÿÄ\0µ\0\0\0}\0!1AQa\"q2‘¡#B±ÁRÑğ$3br‚	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyzƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹ºÂÃÄÅÆÇÈÉÊÒÓÔÕÖ×ØÙÚáâãäåæçèéêñòóôõö÷øùúÿÄ\0\0\0\0\0\0\0\0	\nÿÄ\0µ\0\0w\0!1AQaq\"2B‘¡±Á	#3RğbrÑ\n$4á%ñ\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz‚ƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹ºÂÃÄÅÆÇÈÉÊÒÓÔÕÖ×ØÙÚâãäåæçèéêòóôõö÷øùúÿÚ\0\0\0?\0ª<-8\'5*­ZFDaO¥HÖœõÛëT€ˆ ¯Jpê*@ªÙ§ãÀÿ\0Å7%G\"§!…!PFSLƒ­;*GQRùkŒ`SxéŠ5™âœ€‡\'=)ã¦¶‚´ı½óH\'‹…ˆÊôÜf§1Ši@(sš1O<qŠaëéRÀ6ÑIE\ZŒP=éÃ4à\0íOÏJ‘*O$q€9ëOU©1Š.1¡Eiß…Gqp–ñîcÉè;š.	\nv %ˆÔÕ¯“;aŒÈ}{T.d»lÈH^Ê*x£T<İŠ±Ni¯\nï’E‰}«*ãP	!F–fa×µYÕ|ù®B\'U}!¦TÎÕ`9aœ·Ö•Ê°ØõØ€f–3êMjE%ÈA$RùŠ{ç5˜ÚXñÀ±şğ«\Z*Oks%¼ÀíÛš.¤z S¶t#ÜVŒOÉº7{U9`e YíÖRïˆ\\ÍnM®o0aÚ£ÆzšŠÊı.~VÂÊ:Z¶Èj´îMˆÍ3rôJ„™¤X8äb€(£É÷4SP*@)\0§Y€ SÀ¤Î)ÀÒÉ¤Xci ¬…İu/\'üz\nşO>QûŠyúÓ¡L\0*[-!U\07^)ìp*<4€Î»¸†•W$1œpENdˆ¢<Jî¦¤»ÒÖùTÁ”ğ@«°X<pªáFh)ÚÅ,™\"9,Ç5*Z2n©%º¶+^ÖÀ¹Æ}ªÍò¬vØÆ3À¦„`…Å1ÓÌHâ¦<\Z1‘LF<öïoŒítåMké÷‚ò\0O8aQKõ#½gZ³YßtùIÁ“³®oºdT`õÍ<È\nåz\Z¬ù\'­jE‰2=h¨è§pIÒ¼yôYõş\0¬÷±É9&™œ÷®g2ÔKÆöR~ùå¼”ÿ\0ª\0Ô±EG3¹j%Ø”³’jØ#\0ÔÃ,vÍ]Åam#`šÒµÓ3óH?\n±aj¨¡˜|Õbòõ-!İ´Ãî!ğ[ÃçÇ	xã.q—8ëX·\ZÜ\"èÇ[”o­bêwÓ\\İmP8QUb‘dİ­.mC•­ärHÑîRÊÛNÓ‘ùÕ¹íÖx°y®*ÒçdùFÃÉÏZêí/ÒH—sıj“¬fİÚ˜c•=\r@·nU\'·m¸%Fx¬Vû¹ ie¬ëÈXH®h“ÇZ‚™EÛa\0õé\"’Ù‹ÇÉéÅJà$Õ§¡,©’;ÑRlsÎÚ)ÜFúÒ…÷4¸æ”q\\¬Õ\0SëÅ=r¯Ü“ĞPàªg­GSHîkéìn¤X‡\rë]\ZYLä×¥Ìßk]¬TõŞØ4ÙÛ)Ğã­k‚´ye¡\"FP`ÕMFÚKˆã¿JÕœùp<»Âõ5›§]É¨‰YãÚàS%A¸¹tGŸŞ	¢¹xå\'rñÍ2\'Œ[”ea&rIéŠêüG§Û³p%éõˆ–‡tÓi$fíÔÍŠhæ”¢‘õè+nÂkˆ’ypŒÀ«•R‘–ÚAù°=êô¼ç®3T¬ŠhômZ}#MôÉÔ¨±ç5çóêòÇs*Ç!Ú¬p9§-ÛŠò|Ô:œpO¼1bá3¸ñ¡»ORÄ^!CÄÉu©›X¶`J–>Ø®RGÁÛ´9Í,OÏ\\Ğy\"õ;\r\Zf¹¸“1[Ëfî766ú\nç|4¥C·á]TRì«[óßB©„‚E®ùrA¢¨ƒ“pF2Ç½O4’Ù¢8òsÚ¹Z4L\Z‘¢gŒ€9íS T\n´›H¥b¹Œ}(2Ş8e#\rz-”›¡^kŒ™6H{\ZÕ\Z£YX‰Ÿ¡à{š¨±ÍójÎ¤ÌpMT–ê8”í\0}+Ä²0Tö¡ªZ–·ug—lqNâW-ëš¬Ww¦İOÍ¹®sPY.f1Ç3	\0°zŠÌ†â[Ë†œœHÇ%ªå¼~\\Æemù÷ç4lÇdCok$S¥¼Î\\ü¯Ú·•2&è[Ìãk?™°p3Êw¯®£”RÊ®Á°GÔgÜĞ÷&RåèVÿ\0TYdÎìò\rTÌ¦è•%CvíS‰ÅÃ4ï˜äc¦iÒH³³÷„š×„Kß/ß<Yk	Š}„äv÷­ˆåÌJÍ‘Ç;©Öºt——‘¿.y=±Mìt:¹ŠÅY¸-Íj†È¦Ç\ZÂŠ‹Ğ\nRqÒ´3c1E&hªZ[U™0x=gÉÂØa[@SŒ+\"á—\"¢Q¹1‘€8æ¥\rÅ]¸Ó˜dÄr=\rP’6ï)Ş±qhÕ4Éw«`\Z‰,æ‡A€\0J´™ÈéÓÖ©n5kíİéífìZ$ù×ØÒO¡V9ûiLQÀÚr=iòßÚÜ;BYˆèİ©·YŠ	6ÏCXPÂÏgÏ_Z,P‘E$2º•eã=\r]³YIá«P/š\n°É_”“Ş¯[Ãƒ‚\0ÇjwÑjd,ã\näv¬\r^ä}¯ìÉ‚|Äz×]\r¹“Ú³dğ½·Ú¾k•Îvô\'`µÊšhÍœY8ùğqÎkVhğ‰•=y¤·ÓÎœÅ¡HÉû§¨«Ğ£È¬Ì¥Xş”ÄfÇ¦>HÊ’O8ï]6™aöXrÃæ=½)ö	öV¹ÉÚçÖ¯°­îL´ĞˆÔgœÔQ¶ê¢Î3ÒŠ3EP\\TÉœT*PqŞ‘ŠdœTo\ZJ\n°z\Z7ƒšz2i\Z&`ê6bÙƒ)ù[ô¨´ùUn\n±Æá[·%ÂqòúúW?6\"_F›ˆx*Æ±”,î ÓÑ•5‹9­g3Ú¨xß—„ôúŠÇÛ9a‰½qù×ixTvàş‰%•ô¥\"™RoOZ-©ÑJP“ûÊVêB¤Oj¹Êã9	ßÖ¡:ütk¼z£JUMR.<¹Çüš9YºÂFZÂi›c…\n«ÀíNçªŒVDk«Èp©?à•¡máıVì8:©îïŠj ğŠ?Ò[˜!8.¿ºœÔö6sêN\ZP`´œujÙ±ğ½µ°\r1? éÿ\0×­C%µ³D™˜á\0şÕj61•ZTô§«îÿ\0C*ÈM!¹ichà¶@„c\0w©[¥h^6o©¬ù1TrJ\\Îä-ÅBç53{TDzÓ$‹\rE;ÖŠ`ÜsJXÔJÕ\"ĞÌô^9§³`S7`TM\'Ò-\"úÔ³Û$ğ”#‡ĞÔî9Á«ªÙ¤ÑW±˜èÍG ù×¯¿½e6‘m-ÒNC+)…8Ít²Æ’ïY¥o†zÒ±¤fâî˜õ@Š_s€pjx.!kQqç°ˆÿ\0¦Ş…sŒŒqHºz3ìBFÛĞ1õÍ1\\ÖDÌ\Z™eŠ7ÎªÄày5˜¶s;†’åı^X‡L¶GI3È¤ìÙ4År[ë‹˜|¦G|¡¨õ§ZX%¢ï‘¼ÉF#îj{ÌÉ ù¯÷Øô¨gœËÀá1\r_1÷vè*³šsMDÜÒŒj&§1\"¢f¦ ÍÜŸCE;„)Ò¦*º¶)êx§cg&˜Ã$cŒx>´¹\n£´¬ZdĞ©Nüš»»hÎk>7\n9#\"¤iKı)Xe0“@Á#5\0jz°¢Å\\”F¹ãŠ‘wB*Ôå|´Xw,¬Œ;\nq™ñÔ¥WŞ3H^€¸ï0ù‡qÉ÷4¨_ïƒC5Ç–ç4Ö~˜¦–Íjß1#*³·ÏÁ¦»¨¨|Ïj)€ÚPÕÊ®R\r80 ÀvìšFp¼ÓZ@ æ«ù¥˜úPQ.ò_5m[åIGNEX\rÆ(Hw,+t§†üj¸jz°ïE†X\rJ İùQ¿(°7v¥ÍB»4Xw!ã>”² šcœ©¨ÒL|¦¢SM­!nx5ãº‹!<U|âCRïQ‘É4]¢Š†h¢Às\"V_ºH§6®öãî>†²ä½åSÍSyI¬…Ës¥·Õc¸ 9ÚÇ×¥]R	×Á­­2üñÇ>†©1J=‚/—\'Ö¦š®„b¤\rV™ÉÃ`Rî¨CqNŞ˜ÉƒcëFî:ÔY§ d¡©Û‡z€zPi…É‹Ô[¾|şt53ŞÉKæ˜Iİšb±<ÓúŠCi­ÖšqJÿ\0v€éÒŠ@ÃP<Å½jMÇ4QY\ZRMZˆ9ER@Î¦ÎF{df98«`š(­QÌ÷´ğh¢¬hRy¥š( c»RŠ( ¦·\0ÑEAJx¢ŠCCAæ‘‰ÅTŒ¤Ò°b¢Š)ÿÙÿáÄhttp://ns.adobe.com/xap/1.0/\0<?xpacket begin=\'ï»¿\' id=\'W5M0MpCehiHzreSzNTczkc9d\'?>\n<x:xmpmeta xmlns:x=\'adobe:ns:meta/\'>\n<rdf:RDF xmlns:rdf=\'http://www.w3.org/1999/02/22-rdf-syntax-ns#\'>\n\n <rdf:Description xmlns:exif=\'http://ns.adobe.com/exif/1.0/\'>\n  <exif:Make>HUAWEI</exif:Make>\n  <exif:Model>U8650</exif:Model>\n  <exif:XResolution>72</exif:XResolution>\n  <exif:YResolution>72</exif:YResolution>\n  <exif:ResolutionUnit>Zoll</exif:ResolutionUnit>\n  <exif:YCbCrPositioning>Zentriert</exif:YCbCrPositioning>\n  <exif:Compression>JPEG-Kompression</exif:Compression>\n  <exif:XResolution>72</exif:XResolution>\n  <exif:YResolution>72</exif:YResolution>\n  <exif:ResolutionUnit>Zoll</exif:ResolutionUnit>\n  <exif:ExifVersion>Exif-Version 2.2</exif:ExifVersion>\n  <exif:DateTimeOriginal>2014:12:27 17:24:31</exif:DateTimeOriginal>\n  <exif:DateTimeDigitized>2002:12:08 12:00:00</exif:DateTimeDigitized>\n  <exif:ComponentsConfiguration>\n   <rdf:Seq>\n    <rdf:li>Y Cb Cr -</rdf:li>\n   </rdf:Seq>\n  </exif:ComponentsConfiguration>\n  <exif:FocalLength>4,3 mm</exif:FocalLength>\n  <exif:FlashPixVersion>FlashPix-Version 1.0</exif:FlashPixVersion>\n  <exif:ColorSpace>sRGB</exif:ColorSpace>\n  <exif:PixelXDimension>1536</exif:PixelXDimension>\n  <exif:PixelYDimension>2048</exif:PixelYDimension>\n  <exif:InteroperabilityIndex>R98</exif:InteroperabilityIndex>\n  <exif:InteroperabilityVersion>0100</exif:InteroperabilityVersion>\n </rdf:Description>\n\n</rdf:RDF>\n</x:xmpmeta>\n<?xpacket end=\'r\'?>\nÿÛ\0C\0\n\n\n\r\rÿÛ\0C		\r\rÿÂ\0M\0ú\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0\0ÿÚ\0\0\0\0¡¿9´º(-&S¢hµ“h	l(–‘™<½D’C0ÜC”[†J·º¾|5‰Š˜†ƒ0ÅE\\Ê$š$$)E™º&8×@Ğ\'L”Ú¯œ–¦IAI¡×T× Hè1ƒLr\n¦hB,˜R‘!!\"Qš4$ô2Š`F¨àê4Î Ò(‘¨³±KI{ym\r.a„„a£I2v¢\ZÎ\"2k\0²Ç7Ä³ë5F¯† ¥­ë;¹Û€UGTÊˆ#£¶÷=\\,“ƒ¢©‚µÑ@Ş/-ÛÑi<Æu™³//êô®=MgáÊ~¸ßé’…24Ö2c,şX=%L#N’¬ŒtÎÔÍ^[íè²ÎŠÖ²ÃÔïjùq9éÛÏ«ôr:[S¦‰Pë=È9*2+FE<Y†²±«èõ[gsésxK›#TÛ÷—Y*ˆ®9&§g®éÊt&Ğ”Âú%Ë˜¨…†‰RkËòŞ³az”Â>WË=×Î–±¤Ø¤-Tq9ëkÑÏsY¬KÖ`¬b8!:‘)!ÂÆÔW´ª1‹]WÒÍl¹äóš*\ZÍå¬ÆöBÈ%¡%Y)IcD%«;\Z¹¢ÈÃ,º‘£Zµ6­R[ÎYŠ:MarŞ·£\Z;Ê¢¸OIs7«ÏCË¤èœmİskY¿ ¤fÕnY¾•NYÜÏ%®ÛºçèµÓB©×›µ^J!YxOyÖë˜*à¹E\\÷ÙÑ\Z<Özš;Å–†¸>“X¶™Cóşj\r7QFçC×9tĞ¬ô#Õ‰Y´ûã¢º&×ñhG³¢´YÑe±Ózıx:\Z»ætº	\ráóÕ::Ê_Ù¹¼é¹Ø_-ĞPäª)c{^Ešº4¼o¨ÑgS2hñ¦ïÓ¥®~“¯“N-št\"¼V \Zo†‹ï¼Ú=sön¼ü^_Ÿqöc´3ÏG\\úÎYÓÖú<º\\æ»xo^Î‰K§,Z¦ëÑôÿ\0}Å±O=¤éW\\şi›(gVKX´£OyAPÏ£Ëg¸ëJuaÅ¼ãé}|.Z{¼‡´Ìåìêe£S^•o×ïú|Jã]3±íòÏÓöWÂó!äw»£´[Ëe†Î’à1ªº¿F­Çé=|z\0IOG‰ùıì	†ŞLçªzS×§è›ùŞ¿\\ìºœµ <&7ç3ÃÊwŞxíMãPçlá¶8ZÚ]zmqú&¹<Bõx¿ë:ãOËhlPÖU¿g×Ÿ¯ß7u¦8ÃòÜnÚ×§k£yÏË…KÖNlåVÌT÷;Ç¯r)4´ñ~]¯)ºVt>Ÿ¦—µèºòó™`)»òš²ª÷=ÙÖ\\/¸lëçc?DsÔ´Tk¹£y«¬ı\'¦n@’ô¬ÎyÆóu9`ÎW£Dµ/;>˜ñ8ŞğHøš¯¬Ş‹¹Ó…±GxÅÕéñ­¹ıpªuŸc¬ïô”¸qÍ8ÖOŠÆ¸Ó(„Ë[©D¼Ö÷0: ıg[.Ç7GÏûà­{>f¦ŠØf´ºãÕôÉĞ\"ªzg>s5³yõÎóìF3¡§eÛë\nî ùmÚFµ²F³£ŠÛ+=</]iç—¤ß-=%É¹×>ƒ¬ç\0eĞèœùÎÓ¤ÍÕ5›ÏY|:Wç¾™Æ;co–\ZèÍĞĞÍn,ÎŠ¯5n§%İú=_NQyùAE «;	–™<hF¼ïŸ®g›¦Ÿ`ºuğ¼¾…x‡\\,©åèDšN÷C__oY7Å¿¯˜˜M.”‰˜“×‰¹Ûi†ÆBÓ¦uãü^ŠÛôûŞ_5ËÓå:}ğ7¢xoMg‹“‹×¢¶½Áz½‡O‰é/Š£¥w’%PºR-¹zòº:ë]2-”M,ïÈğôzÎœó†®;×ëïÌ¾µ,ûƒ[%¶rÛ|^·\'Ò¿%×*Ôu”JeR‘p5Ò:ò0xVhí<¢ÚéöªbAº³äÏ~Î·¿¯—i^êÅ\\±hÕkÎ§ €5N‘@K²±yX02.©vƒMKÙÑÎft›UYõj¨V£k#ª•i§K\nµ”*e@Ğ@BäYoòË4ÔÈ]›ªşQ[¥9FŞjd‹CšĞlJÜ¸s%02¨\\†€\0Xªï‘ ËL4‡j5b4l¼fĞJ—ËÒË8MjT±êL…a¥R­éšÜü­ÒÜ°+µ*©°WJÁ\"ßO)×WAÓTÆ«;&\\,‘\\Ğˆ|¬	u\"ùŒÓLÛ¡4¹:›F…$Í®j¬O¥Ğ´\0ĞÀ-aíÊ|¥eƒ*³L4´fts,dRts3ĞÉš‘ŠäB˜.Ô\0êŒÜËjÒ¨›\\øù˜S@êt§–Öu’4e,bng:-£šg¨¡*E¶+imS	è†ËÕ:\"Ôå@:Xß;-9‹QÚ1æ ™ —\\JP“˜A !ÕTI+ŞyI5É©—Cm9›$¦Fèèr“2&¢@Õv°«…ÉTRdJÎµå<ümïÒ»µä=LKz¤N¦fH&¢eŠ‹/W:®DÓC+&7J‰‰â¼¤hAWÖöwËOX4rØif,ÇÑÌ$×Iå•ìÃJY©eåjÆ%Ñ¹ğ~mVu›l5mïŸ¤×\ZËTÄšZjfjJkµN^£a42Q,¬®®¥Zj|£ÏÑ3Ô5Âû>“¯C®,rTV§I1LÔ´´×„Z‰V^FÚ0X {«ño7gÙ\"œ&ÏkN=—_5½dÊw¦4¡Zì’³$ÜR%£†yèv\r§;ÑS5Â‘¿ÿÄ\0*\0\0\0\0\0\0\0 !1\"A2#$03ÿÚ\0\0òãh5R ‹UÒt«t©V«U¢‡ˆT©R­û¥KŠ-UïÚ²%í?¿:CÀh*Õ+:Í\"ÄUi\rqE\0©R­Z>Õxh¹TƒkÃŠ ¡ø§d1‰Ùìj=P/îV‡Rk“sä×ƒªCGÒµö©Râ«t©Rkku·80KšŞ™|@²Å9©¹ÅC‘ˆãZü¢Qu1CÉU\"lš\\†éRã xÏ’#Nç:ÕK?/óı—º\'!zyâî•’K‹Rã‹Lg>w=qN´} ÕEQİxÖ²²ø¦FƒPGéøİÉ\"ÇmvZ‡¤üXæXøœÛÔ‘‰\",0eœgFñ#Q·e¬ùeäöÛh5R(©Hkâ®ìkãŸssß<h”øù§Åk$ãÈ\rŠNy	_Úgş²4 4uŸŠ^ÎGqm„1rø€5Í¢©R‘–²Yk¦äsj(š\\írĞğµk)üÜÆ¦\0Ÿel‚ñÊ‹ÛJcÅ¯ğ¥‘¨‰FJÂQxCQÊh_1|Åòı¶„:k,Ç‰i˜à.È\râi‘q’BZ«t,H8¿Ú+érO”1? ¹s\\—$\no´Áì\rÅ‘CŒ\Z¸R—)‘¿Ô`tñÌğÿ\0™r —–Ÿ*x{o­Õ¬ˆT-:¤á§?’¿\0£û`Üs0Ä\Z,“œÈFFIPåJÂÄÈ,1ËbíeGÉ‰Û—ØŠC·úV‹•®JÕ ¢?“u|ŒñA<X“Ó¤-.ü»¥ˆ¸ò*”}F”yåâ\'÷ãî1’YÕ®\\]Ì.<ªT¸ªD!èE5¨pËƒqi6>:‘¶º–	knˆwÍ+%{¥o(ãî(ãà¿§±ğbÃÍÍ¹Vqó~K¢QõW5£‘Í¤Éæì0]Ç{Ñ„ÇÊÑw¨ä£‹š×67.6‹h¸´©#ä:Otp(Âş-iå¯bfA!¹²ˆûüÖGOvZü›®tZõ·az‚7R’«’;µH/¥·aÄ%n+x Q2²—ÍùdRêgn7ˆÏ}¼Úfiäæ?ß\'4BâS2Œ.Ì‰Åò+¤Ò±‡åé€¢ÿ\0ÅR>• ‚\np±MÏÓE¦Ğ)ÎµMj|««J!yíäºv¨Xèâ{lÆç9Åøå9G#¤i\r\rÈƒ‰béìç+ïªN(›@{¤ØÉM„§ÃÍ±â¦ÂrşŒ”8	ù+\'+·yÅïÈÌlpãTÂ\\fÎŞ—Ø\rtY3°3št|”Lü6V.<_ÑáĞÜ‘Ó¸ÒhLm+M(\0¥bÆyi9]¦äu’ç÷œàü—Fº‡W{Ôn2.Á{aÿ\078Æ5ø­ˆI6{²*£äõ<€&¸¼’#„É64=˜wjX9‡GE¢´JäíF)ıyü1¡=É wdÎ;£©aöV4	I|RwœøŒOä\nÈ&&@òé$`A¾œQ—&4“ƒÙEZ¥$@øËV¹¬~C¿©±ÜÖ1¥„¿‚—©FÇfÿ\0±G¹!6?N·Ô\'îäÁüÏ/¾?º›†Ğ±ğy=ŒàÔtUªÑŒ<IˆZˆ­ÚŠgDş§˜z#£ârŞÖD#æ`s˜ş\0¦ÆÖ–FcidC,ğ¿¦Nı®V7‹Á=ÙXøÎ‘ÑEÚqÙ(ûØU© l‰øn	ì-*Ö+yŠîåÆSXZ[\\qš{|-2€d}ä?B¥.0‘EÄ¹Í‰aEÚ¨„QÕxÄ$8æ-`Ÿ}K	¹pŒÉ1øf¼D@µ¶¡Ò¼z­U£Lf…Ó:iyÃÈwPÎò:(”W´4<rcîÆöñ&~Ãÿ\0œy8‚e6…ÍsÚ™”%ˆ–Mè—Ê¨õ‚wP’DÜir‡Ò\nøıÕƒ]üŠ>€İ«Mé8¬ŒvÊÏ‹rèÃÜŞ]Èdt½!²\'t™ãNÇ‘‹‰B2S1^õÑ²%X½Š\Z8Aª<–Ë,âúGÀjÕÚ\nÑ(&²Î^/q?¸Ì¨Zã›ÓOK @×<&¸”\0Mbh(+â\"ÍŠv6yg“¸ŒÈz(èŸ\0¯@mÅFÔĞp|Ÿ“)9’Ü¬±ˆ-\'P†‚Fgc²yÙcl²p«Ggw¡«EË÷\Zi@êH=~Â\n,7Ç›ÔqŸ“Û“;Fhéq1‚&¶$Á€’âŠ+éZ½„Õ«¥j{iA‹“â\\KH( ‚d\r]Æê×ì•z¤5h¹Z÷\\l1´£Óœ†­qq¤-r+›‘%91ÊÕ¢}øïCCGè?¡í4§=ZµzµÉZµjÑ@ÑVŠµz)êïÀ\"‰´Óêı´†®æ­Zµ{µÊĞrµhÿ\0+Ñ(\ZW¢åô¯_H+İÒ.÷•«C@îÕ«Ûuìì£÷ö¸øJÑ:f‚Z\nÕ wzwÓ«GV¯Nû\Zµz´]Iïµ~šëA_ˆ+’µjõÉ«âmPÙûı¦d¹©¹¡6v¹:JE÷¦›Q›>¯|•êĞVœ›¾^öujÔ“ğ\rÌ}Áš®ÓSE!»W«ğµk–‰A^©E{\\”“Rs­Zåï7Û}¡»V¯Ê÷zºñ_´ü‹\\Õ«V›é`ä Uè+ó¿&è\"›§\Z<+’½\nc¸ºsŒù9²V}s+ÿÄ\0)\0\0\0\0\0\0\0\0 !01AQ@a\"2qÿÚ\0?+¼gğOé‚—ë8Ê9\'˜qCÆ;aséi@-+J4¨róÀ3+¥º°SŒ¶•Åç0 …¸hbÀ±§ãƒf\08‹ËDá\ng.ï§g‚£lCÁ¿h4dP¬¨2 ªÇ\r-32¥O\0P½åÛB…\n?ã€`(cÂi¤šD«sX‘[× }ÎñŒ%ÂŒÂ¼pşĞr6r3ç|b\\áë\n7UZÔü)Ã²Õ	/\nÕûV…>Ezªùr¥@ş+¾×Û•öÊûeiÒo8†´ˆ‘ˆpˆÂ=¨hZZŠ A[v¥\rØô‹w„ ö»G¤fQo\Zš*ª+^]4SmŒÂ×²¦æ¥ÙËô©0…RŠ¬áSRª±¥Tá\Z‰í‡J«UX¸FáD(ùPÅtä­KZ¨â_¶•*Pİ¿Ç,j©œJ”pİ\r²”\n-\r•\"0½A¹A¤_P¹zÕ^=½u|t¨é»R»G€\nT00ù…*s”ªJÂée+ynšÆe(8Bˆé‚öÅ¡­éÑìˆ„PbQˆ!t¥JÏkDAB\naw—okÇ®÷JştQë‚p—U«Ÿlª¬‹¢hUZª\ZmÕYş!Yú»‹Ëòi·OÙ²¼‹TÙ¶¾ Á¶@©\nÍ¿¹üUCI…jñ¶vV®Ú¾7Uø6êİWôÃİ(øWG¥ÿ\05ß…ÿ\0=Óééô©ú}gµoÀ·Fõ)·d|/#Ï5jUw*¹ı¸	`ƒt½°*İÃAÔ«Q%M5¨+^}ËÛuoê6kïd/Z«ª”Óò¦‘í¶éî¥_ŸbŠ»õ UÜ®æõ(À/õ‹Òw`¬_ìW™rİQ¡¥k?+]_*xËKvÒş”¸8ŸÀ‡ôğÂq™yS™ÆQ9zÂ\Zy\ZQ@Ëö¦Vü3Ã\n2”BÃ™SÁ·$ayb¥¿Æ‰o\\ğYËt½.•*¬zàÎq*¤x\'o(©Ä©9J	P»^ğ§ıeB…ğ‘@JÓ´#IRó‡ÚÒ¡ê¥G$´âPbğTeX`ÓÄ8¥€œa*¡½KéRT\"Û´#±@4.Ô0+Ú†„[ÿÄ\0&\0\0\0\0\0\0\0\0\0!1 A0Qa@q\"2PÿÚ\0??Û¢^‰:É$›I3‹K´»²o7šxE—	â¸Oª8@­®mÙšåùëÇ^xîòy#Ìó“Ìò\\—,~ÅèòéÙÕ H‚(gŸV\\±è›Êu\Z$’gvNI7f¬ªôxO©Õƒ{´Ún¿3vŒŠ¢o3iå1Á¸(Í¥&8DÙUÎl¸É3É`xv\\İ©¨›ìÍ›&îÕŸè´\'qÃÈò<)%ğ~íŒ¥Şlğ:\"dòøST¼ˆ\\ŸÒ`nO^–…7%RÅğdHŠXÒxIS´@Ÿ¡ä\\<†vvhŸ¶\\ì›\'ÏvL\\\Z\'£²q#ÎM23‹Ä\ZµKĞ’èü6D”¯¤|*‚¡G‘2GÆ\'ğx\'íº“ü7w~¢Ò(´CªÑôìB$\\2ÈìkF™#O£õŠÍ”´:RBÂ&ÍÙ›´}5Ç7ˆ5‹S/Z’I«4/„ÈßDÁôN	 ˆ)ˆ\\{?Ní‚äÏ$‰âÆ¥éÑKø~”ÿ\0Ï#_MÕ›ì§BäçDı!£VO²\néøSiø:™äSœ±ì™²šmüuCÕå“f5>™¾25#¤Iå‘±nIƒ{)Ãï%`x:?mHÖH²B™µ+ïY¯\"­Œn	$‘\rdcÁ…‹oáÙ²	‹l‰m‰rÅà¨\ZÎE“ü<¡¯\":²É‚fÍÆÏ5şN­Sø%%4¾PG<GIT´P°ÔO±‰+<˜$Á^\'ùd½ğV¼rAFÊ”‘Ú%öL\rg\Z\Z¼Z…¿CçRš`i¬”ãFòe2HÄ21’àL˜¢ªSÙàĞÌTAvD	U©6D‘?ÒÈıQÅqJ¼¶Çëˆ³#Ûø¬¸­ú»¼_|5wÎ=ß†‹ì‹±\Z´z5Á[¾P<ñDÔî¬ÍİsdÚfË¨öÅ»5n¬ÅeÂlÈáfıI³È™à„¾¸ô»çíô!?¤]_«÷ÉÛl×¢o=Œ”\'Õººô2yhcáä­VOƒô®ƒá$Yš²ÀÍæÌ‹nÏ›xÁúA´,›F`Õ™ÿÄ\02\0	\0\0\0\0\0\0!1 \"02AQa@#3qBPR`‘r¡ÿÚ\0\0?ş•oØîsjå9VŒà³öòÍÅ%ê‚je©’Ô#‘Å–gR*R‹?i¨»×‡ô¢—HèÑtqâåÓ‚Ç§W]V-b4Ÿì•—±ÁMÙ.ïb¯FFCXa‘MÒØğ%W!+2^{)âJ¢õa!²òÊ¢˜§¦Ó¤Á^\\i1=¬k&sn¢x2`yñc¢ÛÃR”nSªú§jIDíç«##-»™jÏ‡]¸©7£ü\'ôğ©«È7J©Ñ6ô]1g±ãi?ev6òØ‡—8ki£}ëîLA»L¾ÆQàtbºÚ2^ÍU+ê–NœödIkWIŸr¯NpIZ¤İ©›Ë3ƒ˜¶B±•µeÀB›2Åµn[•™HÒ¥êÌŞ0ªŞ;•i(«yt\"¢v)Õ<y!­S£W&şuCÌr‰´5”ÉdÒz«¨—MhK†¶lµ,5IU»™.M*DÚ af\n™tc§—R\\LS³™]SĞ©UÕ‘úº×©%jÏJµss®ölÂŞ\"?I„ÄöoÁ½Œ3÷3“;„ìy/™5XÅK†oÒªƒzOJù¬µU62Å‹	lù#¢k3#ºè4*­ê‡WEĞ¶LÜåş\'iÔ$RµDŒÌXcoÉ}¨îÆ…a%U-#ÀñUÑôÁù-ø?&.Å²V)e-“›³Ásvû*ª\\4Sü¨Íwğó3Ü‡‘Ğv™êBÔÖŠÇÛbtßÀ±Ú¥ÜTÓª\n©Ípî‹\\ºÖÇE[µôòdHä—¦v¤…®rdÍÍìû¥vo§b{ß‹ñª¤v­dÏOOF5ÜÜ²!Ylo8#D¯Üÿ\0‘§Ë5%rß¥ON;EÅRùî†š2ù9§òo#3™èæ,DhéÂoMUvZe5t¡S/â†´k1ñİ·ŒX¥gJP;†Ôù&‡…œª¿Á}KàÈÉ–¢§ğ}¸ÿ\0±õkø¤8|êªŠzu°’W2/š³21P¤xİº*Iù/£>Ñö©GDfHİ5ešetQ|Oÿ\0¦şY‡Ùz”|¢v=)¥y)mJn5Ş¯Q4èÕTé&í.‚I{W‡ıl=>9NĞ%FiÍÈû##£´t)U]«É\nÉ\nšwê}$¿{v}:cÏ¾ÏÙÛöy÷ÿ\0b¹Ë÷··ì8j\'İ[k÷ëR~çÿÄ\0%\0\0\0\0\0\0\0\0\0!1AQaq‘¡± ÁğñÿÚ\0\0?!J		HHpĞÆBÙ€DMdÁ:!—ğBËÍ<e\r\ZšèçÎ­‰ÄQA#\n¸[yê\n–Æ³FÊM?¤U•ßloF&<±±¶?ô5œÈ‘„˜ó¿f\ZÀ’†GÃ G©=Á\n•ƒ4a”ÆŒ§Œ˜Èàaãh‘Hk³Æ„ï~ †\Z\ZÀß%4™Â£í†éFãò\nêòdì!di\r>.‡à—‚!P…ş\r	Bz+;;ú¢ş”M÷zcˆƒË>\rRyÇ\"wøMQàP“¦gÀŞóÈ–F+h¾¼dÀI}ğ¡è“ÄÆzë%Ğ¡DJC+ŸĞtW`\"­8}˜ï´0ğ$äZ\n2¨…éè¯¦CãPR&QìAâ£êoÇ!#x%NÔ{bM	ù!NJÛBZ„‡¡Ä’uŒ^ôˆÛlGcBhaL:ŠÂ#ğÈYGµb		F!a‰	\n&kÌöNbX„Çx‘±ÑĞÈßèQ_‰#|­Å{·–ß#‘`ô\nWH¾\nè¡Me1àrj\Z – „„…±Ä›ò¡~9´{óücµYìLg°×¢F\".ÿ\0¦#Ø”ƒpªve<I[¦$ „Qx1öò1·ãj¤4ÅvÌ&æÄÉAl#6ß…‘¡ÑvM@¡Éì{ä°ıx¦É\rUd.İ,»)û3	GÉ!Ş;šfm>ş\rîĞÄŒ”bª~”4(Ûn¼Uåç£\\ãĞÙ¼™‹Åa_ø&„‹!EÂíğ`™­óƒºŞ‘b6ÇB}¬˜hpÓ[1\\´\"”\Z¦(d¨Z\nÃc®|jòÇfD+àé™11¿6&€İ‘ô‡İà£1R·Š6Ó!l>VM‹Ö\n}â‹-‰`„§¶~$ìI	‰‰;2ä‘`Å¡¡HkìzÇXdµ&Ü¶8¤ñp1o¢ÁyP¦¶L•Q´e@Sk;ÃnÊJÆ˜Š\'FèÚhˆÓD½ŠJxİk y#B¡wÀğbaYÃ1	fSlm_Á\r®PÈÜÖJÄícáìÂ®Œ¥*ĞèdÙ4¡< ü‘°å›Ø‹<œ\Zi˜Ã€å„†ûPtÅ ”4tÚğ<Œ›\\{+F7W©¸‹Ñ,¯¸ls“Yø“»vˆ4N\"ÿ\0 ™SæòE:,È5\'Pø1\nbx…y)47¬J/à‘–ã%£ôÆ¯ÛSXr11\Zäèi¹±¦Yt-ªnhDhrğA›è<[±\r©®\n.ó²‰«ô‘˜Œhmáû(½¬mB02¤W˜Wëˆ“6Œ7Ÿ&#_¾Ğ•y¥A¨B·-bˆÈ^oØPíqÀ©]¢Ï\'0ª	û¸ˆİ3Q‰®„J=Ù±”+qĞ®øÉà3ğ@¢Û\"ËĞ›Q{å%Gá\"LQBœğ&ŒËÁÚ0³©şp\\\nc³2şqìrV8–JóS|Ákò8pCÅHñ¦^«ÌˆGXÖt=É2‰ÈkàVÛ69ŒÊ¨Z]WüÉSÿ\0`í§¾iI¶~ÃÄŸ\'0ïCtšNXíè¤¿Xè°½Åô‰·4)PX·µ¡ğ90V«W}ê(¦ú%Åz;oŸ\r\rø*úMsašƒ6ı3èÏ{¡“½½säAnqx‹LA#~Äß8æàöúQô76­—Óái?ìjá©ì¬›W+Cµ6ôÍ=$9Àöm‘:3ÚÎ‡?û\nPµôG!\rB‘#]Š3_aå	L™Z…£\'Ğ‰Î@!©Ÿ±+g6$>B™aD„ûßùB¼Ù”\"K-p5•fj`(MŸBT¨‘±£-{ğ®a\"AEÑ³~\0*hÃ©\0²{èˆ8Ë•¢ ½ú(2kX*rix·ÛúÇYíìl\\ÆáºÇ s\r]1ï\nI’á#ğh}	CÀàBD\"xfUÆx#[=KŞtCg¢>ÄĞJ°oPŠ¤Enıİ´nr\"^„/bÄx“#ÎÂ¤òà›cØ¹jè´İe¼²4º\Z$Ìû£A*D<èy@òíù4_Ú£\nì¯ƒÎ0È²W[( ®Ùw&ÑQ)À\rS·¡tD\'±-ÎÓ‹lÅz	ÕáçÆàÔj±¡‹ÂûĞ²1Gá^Nüàs–\rp\\-çF*ÁEd*É.KŠ\rK\'AÈš½¡Q·ıI.U/§Jşòƒ(+Õbå5Ã,|£vWìº¹1jFÉ\ZÛ2ú&±¬`ŸÄ—±D9B´QšgìŒ¨­”aä‹EÒHb…Zck£4÷ğĞîeø4 t¿-}´¸x	ÊœÆD»|òÙŸ)O¡aÑ´b?Ñ¨=DÇlÂ¸…Æ¹ğIŸĞ‚º@•S\"ÃÌ¶ø’¾ñ¶O°hc‹û=~4[Û1«[GDîCøŒíğÙı\n4Ÿ‘¢‘Éàl{\"÷ã ÌÂÁp_˜Ì‰8şCÿ\0¤¥  ¼xµ:Å\\pgÜY	/£îr+NõáØCgÄùdJ%ŞŞ‘µ¼¶1¡hü}!bú]’¼ä;Nì¯¤Iœ¶\r?¢ŠS®	;Ï.£BWPÕè·Î×f \ZmÃºw†æ6<¶6òÿ\0K’ûC]ù®‰±™·‘­“Êñ1ª–1‡O´)ÍUÚñnoÿ\0]‚	¢÷ËË¯¶`<ø\rJxVOÉ¡b@a¤À Nc`³“,NDã=è~5Ö`àm/ğ&%£á\0ÚüxnsIÙ¡¢”q±Æï³\0î„,3¬á“E°˜¬Ad,…˜½LÄğSAù¡À\rüR±6t2YC‘‘ÈV¥È²62Q	Ñj/ßÅW¢ûOÃ€ßÁC­\rÃ	 1`âå&c^‹M\"~Ç:àì0D<	·:\\¯	ñã}ä¾ÇÏ‚ô1„Óõç,ôEuá±6Êb„9µÁ¯àÓú*±}`ÄÈPÊl{2Còñ2Y\ZŒKCi«Éà¾Ì×…Š¾p&ØxÄ´EÀÄ½.„÷‘gáa\r™²\nçCgg66YWcÿ\0y-%©šj‚9&vNJ20I‰‰ğX!±hÚD&V¼sQ±¼C\rò=‹±±3;	Á±z·ĞÍ,ÄT\Zìà\"Ï‚Èß…HNeğlàe¥Hco>\'‹T_üFbi,¾Æ>E§Ù]“(÷àŠ^	‰ÓFÄÿ\0Bo‚y/CıÇŸ§qiqìyEÉƒCä‡öjj}l\"øtùâA1»¥)¯¥¾4d„¨™43AèÈ—ì|&Š£oåŒªk±Ì<[4/ƒx4.DrR}˜’-ËFOÀğ\'^/ÿÚ\0\0\0\0\0\0ãØ“•-Dˆ\"MìJø<V˜‹QÎêÂBHšÜß™xpsbm‚\nå°9-Ì\Z¶“$üD\'#ÒF÷ºëÅøC‹<Mbpú­¾I2Î­RêwU.æ“²‹°¦ŸŒ¯Fıãğ:ÿ\0Y6®\'¤À-ÂX\'ÓÎ²RÖfzŒŠ<¸N¶$áxçc.vcEc±“c­pN½Ö4Ò|êÍ¦³ËWäJ¢£ÛBÊWJÅIğ¨yÏH(ùAv\'´£v‚3­Vïw µgıñ+a‚êlRI{Õ3Y¥sˆ.ÜX‘™æö¶$a \\7	ÖÅN¯ù³C‘½+C.äZ‚í38e+˜ğL†k	¸DìCEÏï¢?5âƒtåıkBñ-\"E\n[(\rE:İ’Ø/§\0i¬ƒƒÄËot®6cÏÂ2Í´¤H<ş^Âé\0ñ\r¯PS`7(âóI¹\\z¯½i®I\\h-PáÉÄÆç6}|Ó+bw¦ö¬›åTÑHWÓÍ¡[qb2*ŸÚ‚\0—äõâ¬\\c<ãoJ#ü­\Z’Fzñ¿¹ğM†ïùí!¥”1\0¦Ym^MhQ—Oò;ñªm\"bwxø¦İú{D©8E¨Ñ¹L•˜ÿ\0ÛßóÛ˜ÕB”†~h«±Sîè€“¼‡º;HC!xªü_ÿÄ\0#\0\0\0\0\0!1AQaq ‘0¡ÁÿÚ\0?ÀòÜBe…o7#¢\\ä¼Ùmrö9åå»n¸ÙÈ{¬ylrt’Ùÿ\0ÈÖl÷ñİä›u—,†ÌË¯gà¼³šÃ79ûa¼‚ù|êrÉ?³™äŸ©×YŒHçg3‘såÏg ËË`Ãl’g–®ÙGaÉò1—y*9=4³^A?Ü,ìŸg§lC—Ù9xi&¹ #²|•~¤ÆàvzÙ\\ÿ\0gàŸ=À³ÿ\0İşü‚¸ö‹_%ŞÚ|–æÊÚ±{úƒL‘’îO™w;82égÖ8a{d½Âõ¶k·Ä“Ù†ßÛçØ+§ËØ´Ë¿XÂxµmmwevY#9o2ò]‘Róg¼Ìmèe‡·n<½Ûùdé=Öy»ydWÏ ›¼JĞu²~	·»›iìŸmÔ™?²×\'¦’iŸ`>¶/nŠÄVñì~9™ É¥®,¡Â÷ó£Ë~Zä+í¹ÖÆ~<ò1Æ:&†2d\"d,ì.ÃÉÏÔ!<}·ÇÑ{Sƒ}½‰ıÿ\0‡Sœ•·š_\0°uì»%—Û,ûoÛæC7‘²vÈm1Ëî0^Ç¹KáxÏÏ?bAŞò[ñŸ‚îrÍÒ3ì\r‡çÉÑÛıYàÚ“ºÀ§öı Ã—\"…ï±ûügßÇ’®2½[‰×ã5ŸÎ~?IÇ°bØ°zO{\Z1·|Ãğ‹¢^Ù¦~=“-·ÿ\0ÀŸ„¾ÇNù¥ï Ë,cÊÁË,,]vOÀìŸg]½µÀød¯£`sØ_ß<ÿ\0Ÿø12IöË!Z8_\"-ƒ@{°*–>ßv@ì­†r7Éa.÷ğ&\ZXKÉï!ßÏ¨e’gà9&;&_$íŸË$`N¼±–o~Şl«l·í¡ÏÁ¹½·á|Ë\\c¤“¾ËŸ‡ ÂUÜÆÏ&6¤=õ…±ìt†1»’ÀcqvÎìˆ$óÉ”XÀKgA†oş½·Ë|°¨ÁÌŸA\'ù®Ğíø?Oáí–wXì>Ûö&^2$\"ÿ\0™céwE³KQC“»3¡dttâCÛC²¥Ìô³Ã–h¹_Á—­aß’™!=iøÛÙ~O°Ñ$»\"Àåû?Ëï!!Ş[Îã\ZÚ4‘ì8ã=½ü¹ÂÍ?—‘çöÉSÙdÎŞšÍì¼eÆ¤ƒúl®B#¦ĞE†ô¸µ-Ç–íÈŞ\'Q§?/½»tá$ù#íˆÇ&ŒaûÍ·¯ òì{È~ïã1Œi²f³9²Óòö^_âPW¹²§’aøı¬ûöNş\0}yø@0å™?ì¦vP)úzl\Z~İyÈ æ^¦E¯V=·™ù=}·ùrÂÑ»7±¿!Ëw—C<á\"^‰ú#­½Ë7Û4ííäû\Zt°²Â†BmŸ¿±Œ/áZDbìƒ#Kê|`äuÆ¸ß0äûËÎ’¹zätı@o%BÛÜœJeÃŸø÷“ß?D»Ÿö?Kö@—äå—EÒ’î·ÔóŒ³Ëô\\y?¹ù¥È’ÉcîßÇñl‡¿%»7YRSµöHP~Ü²6ù²<[¤zÛ©jØyÛÜoƒ.ìõ–\0íäÏ<ıß\\>¿lşVóËıü+vä(~íXA¤=‡>Ï}´[ÉõøÁ>Ò%w!Î2g#ÉúÜ?l¦“=?åá¯ŠFî§ßùøûƒóº™/ÖJgÌ¿K~ş­ÿ\0êÁÃi{œ´şË}âÃpÜhRıÊC×F¾ß,Ûº`#^gïì¥Ùñ[ŸøÙKŒ<€pK—Lyí¸ì~Öï“‘„ßµm?!Ş7„¦=Féöû‚û„{ÿ\0b=?Ë—û;Õy?ßÎŞÙË9ÈŸbl&FåÇ¶Ã®ËšFšç–?Äñ’]ŸË;÷?<l~§ö%>¿—“Ë{¯áüONKí»nß¥ªO#\'Å¿Yv9°ô/—ç€qØvÛ¶ìhAÈ¹7räç„§Ø{wÛ^¿!Ã_[pNî1‰}ƒ1‘ßØòÀCÿ\0áğ…=‡B-6áŒò3Ûüoàç÷$¾Y“ş]}cõ;jvİ‘Äu¿şC‘¨plÌ[Œ<ŒØCËÌ/9wÏÆé¶á.CÎÀ¶Í\\gØÂ4í äx3G^Ji/Âkm˜væb¯ÖÛùor99¼‹»+ÈÇ!ÖM{lÓmæeÌÊ¤Úv×¦ıX^|‡·éÿ\0%ğ¿©Ëæ¾Bæ7Rfê[òŞ_åÂûÛû/p·]o/õsqa’,\nè˜Ë›™Î½r4ØØwQÛ0Ë{ì-¿ßÂƒ§àgÛ_ËMí©’kË]íÕÑn°:IÛ²«Œvx³îCÂÁ©€ÀAİ1ç|¼ò4ìOÓloê5çãU¿i%ä&İK/¿å½Ûuì .Êµò\\û>áí›\ZË{\ZòÎáì?P~N†@¯oÑg%/»s6ánå¿?RŠ!Ü—\r°p¸î§ö;2òÒmœÄìu³=†é925¬uöå©}Ûoìº–¼‰ñp‰ÃnnI¾=‘æGXÜ-=³rk¬\'·=lÓXİ¶7%…¯ö9Ô½ØtHÿ\0/]…>OrMÖÜq„qo»8Ë“›ÈÍßÕ»Û–÷â¹-ØR\\Œ{/…ßİ÷c±\r“ŒG9Á°eÃaeÏn{/xÇ^Ç|å„£y‘jïêß¶ó’¶ënZqo¹pÈé¥›ì½òc\"<öÎr·õb{oê58vğíªÃÎO#<Œ¾Ş³í½È†û}Òxò×²ŞX-ˆÏ“û´ûlæşYyËÕ‡3dmÎJmß.g!sûîİaøİ{kïã\nÃ‘ÎÚœ½¼é8ØåÀó±Çòã`òÜçãÀ‘„öHÍ½¦’6Æ8hIŞC@şÀ3 õzÉ{Ÿ»\rDe1C>B¥ÿÄ\0\'\0\0\0\0\0!1AQaqğ‘±Á¡ñ ÑáÿÚ\0?×vÜ7êÕytš\ZrÅÃ¤/+&å¥ì/²MBû(ñö9RW6BéÖpşÃ‚Ãr×B]¼rwÆÙW¬¯Ü9Ïİ®§ËøI†~¬ùvèÿ\0ï~HKå½çØà¶şÃ[Ø~ÛÜƒtó9t±‘º6ü‡!5œÛ»ŸË:ÏÃäã¿æÿ\0‰æç¬ñËz.w{’ø›„ÿ\0nŸl&“¸#K5ì»fÀ<„#²\'ÙÅËW–†Ş³ı`×g67g46hµ!ä`É~·7~Z¦KöİCÌ•³êÉ—–º³¶É’‰<å¸Éİ·:·A°ùÇ;\'2Ï:ÙŞ!yösîÛF>Îükäpì¡ÖÆC³dúp“îYW°§Û(ËèÉ¦Àt,qNq™{/¤¸L¿«ió\'4[‘»²ã³Ûs/±HOdÍaäŸ:AeÌØ-Äfd¸ãlNÀ>±â÷üÜ ³æ‘½RÙÅşKñòÓØää¶i„cÈÍˆÁí‡S]º9fñœŠB>Àw.9ùæÆîƒMû.1°ãw’>Î€Èsef6¿$}¿’|“rá‘èK·É‡!š§²ååü(¸{cêP»ir82ùö|Ù.?æòlr}ŒcËA·ù£å¹Ù!{xÛ™‰Ó°Ó·Hß[ä£.¸?æÆ[1ü¸{t·:ù\"c(!^H¦@qgéyÆeìÛë—d¼,ÕúÛ…Ë`´¾ëd?÷ğÊûrR]r<å¿\'aØÑ,õå§ÇFËòxá`qœ4.gdv÷Û‹M—¿±±–ŞËòPsóöÌcdBĞlõ”zØÍ#2X¹ò1’ü¿îBãá´?áé>áåóä?¸Riq/c¹iîñ¸üı¿Í¶ÛöÍäq·¿âÕã=÷ğÁ¯l	ú“¹Ìï·Ğp¹Ü;şÿ\0æÍûG%ìş!¾ìƒ‘&»Å¶4Aİ´½¶İ¶ÓØu·!‹g¬:òLlœ;ûûóöúY^“õ?¢4ÿ\0‹É¶|.Ë]ûmó¬mş[=[:ºé\nd¹ò\rïáÎÆzBvÂh]X“Ç’ı¹ú°÷ï\'ƒ’xºá}¬rSŒ8Ç›#·Ñûj2<¼±ä8ÃFˆÁË/SœbÆØéh%}ß÷“–ÖzXp%ıZÄÉ=_ÒÖRq‚w5e8Aş¿¶¥ıNp¿Xs¤½É<s,î=´8{itàÚ8°&Ïê0L÷¨o¾Ã>F6ØÆ,nï±ël+ñd2³¡åú>Z>!\r!ç~Yöô-Àä\0ICå¸·®äæ™`›={òı şã®ıµ›Å÷/Ÿ‚ÿ\0+uAçÿ\0Ù<ÉË6Í\Zº\Z¶{d´`çetœ?É—8·áñ\'úÿ\03Üı@ñØ2¨>Ú\\èGü¢ı’HxŞZ}½½³-<´°Rrnáÿ\0s°«şm[â%_y`Á…äù‡°dØï ÷·#éãê]Ó ïé<ş–,ıXqú1t-7b=dÒğ²Wc­#\\õz Ó§º\nÀ°\'Iñú»âö_Ô³/_Ë\\–„¯W¿â!’kØş?óOıX,%à!qòÏ„ÊúXø¼çá·|°s/šMïŠ\\ïçúÜ_×ûÿ\0î})ZÖì:]ŸÕ®oùŒêû>Ÿõ·/`p¥¡¢Ë@§VÅ¬µšÚ{ú—ÔôŞäƒ¿€Y;øë/Gÿ\0qá’CN=d\'K®å‡äÂBÃÆ\Z?v\'Ÿ¬gÛÃ0MXôrD;ä ìáÛ9Œ\\ö˜çîä>M¨Á†î~\'œü:ã>ÂLŸ5ÛşIÿ\0Ş@¢)X?÷ş,<½m®)‹ØÆıZëÚ?ğƒ÷hÜDÏ‹&ÁŸä\Zßâèí‡ä›·²ßy!ösı³we¬N·fjßŞßZv\'&—²‡[A”?a	ß··ŒßnîsûeÎÁ×†`~?Ÿ{«m$cËäñÈÈLoıË]Ù3ûŒ‰Rö~–g_9;+ş,#Yv[¿Ï¾~<o9t—vOú‘\'_ÆoáJëËIø%Áşûc3É³´A¤?P8õaëÈå¿ËXŒ?l°<üœ?Û_e{gmVLoí‰ßÆÂÍ®g\0Lİlƒåì¡ÌåÇ™ş2 ä=òı’“Û,üÍŸ¹İ´ûeç[üDŸ«\'œ±úg÷0ç°cû vùç ‡nìnkg6ÏÇöxad÷#û|“ñéÒKÃ/‘§X-ŞØ³“ÖÇ?ü©ú¼“9g.$âM·õ|ü¶ñå¿¸9Ç±Ë°-bgüY-^ÙÍ´“’YöÃÛËÛË¦Ø©tÈl û%Û¾ØnİYÍ{bvxÇ¶¿	†6şáŞ2v\räŸ¢LvKuíŸn›?ØòËy%¡-Æ,œ[ùc©wÈ„ÎC±2Îo{hg%è–ã\'áf?‘ÉaÈï¿‡=“NXøÉø?Ÿ…†ÜBzÚıÉÿ\0ˆw‰í½íÄåŸRwğ3°c¶~àííóòsy$Ÿ{`{[§¤ò\rÉ,ı\\ŞÏí(réf¾ŞöèÆpäÆt9w’A¤ı0~§NGE“’Ïìêyfö_.©7±©6|“8Ø†»>f]İÙ†ƒ}2ï/›ä¯Ë=öÔn3¾²3°m¾_WöáåÉ›: _«®^m¼å¿Û]åŠ„—×,2†ú¬úZgÒLØÀÂÁğ“8ÇNÁËO\'¿Ë‹,ÆéÂÏİ‡­íû…Ã/YóŒö8å¨M€Ã°êÑ7íÂ½±ÈcŒ†²İ²ræİ·ö_gOêO–İç¶=©Ù—ŞŞp³õy.·¿,mò>ò\n‡á;™k¹/İë#g<û}·[ç\'ùc|ËLåŒƒ6Ã2M³»{Ò\rëj°÷-6„IŞ~[Îºw²Î±dë9ÏÂPº=¿õ30ä÷ÉŞ%ŞÎZZ¬¶¶óü]…ğK’?ñcºG¶ó=ow\'¨CË_·¬@ä\0vÌ×êÙœKúµ[ö}·Yó2{	»\n6ëÉ9—HËû&¢ÛŒ:÷äøıC™,9+g9ì¢!Ì—á> Fğì;¾åóŸÜm¡¹)27%ŞØC±¤7èo[g{–k·ƒù˜GËÛ¯!;nû&‡N“.qıÿ\0êİ÷?ø·+ú¼ÿ\0­ï[E·\'!Ä‘LìtlàÁÒü¿È`œ\'‰{ 6ra:şâıXs`×?ß\ZÃDüşÃIÓÛÿÄ\0&\0\0\0\0\0\0\0!1AQaq‘¡±ÁÑáñğÿÚ\0\0?®˜‹Z¬—0äÏD+²;‹š\nCìÉÓ\0áU4†ñ4Î&¡ìÄ=—öVô`]À2òV³¬#l74®P·|DVœÔr£Q8&±Q.¾Ë\rAOú&\\ĞtES|cÌDk%-W½Åªî½w16rDàa§p€nâ1wá-?!õ	Ã¿bğ(ÆAÅ@(/ìD#œÄ¸Ugq„Á}•‘ˆÓnx`\'|”r¨Áªi†‹í„TqªÔ.S´Êj ÊbYNaYˆñ\n˜ÅêYÎ˜6å\rş ª­À×î%{â%^ª\n¢ö\\VÀÄ6Xò\ZVÏb\0üÀµ©(Ø­a¿‘¢Ì‰(¾\Zªù‚X(êaQèÌ”,«|ÆÎ¬ˆb‚ºy]š‚ğÜn±ã¸€`Jo¼ÿ\0ùir€×Ê6¨BÂÁQ7d¬:’qõ`†œ<5¸òÌ½Ò/PdiÇæ+ln_«Ì¶–3n¯p½ª²iâ-VÍÂõKŠÔèdpâÖ%mù”K•L”Tdèög¨ZÚ%L_âY‘kÙğşsV`üMË_ ×°¼ú•Ú~ ±³eL_xÅ_Èl#zı¢À§+>é¢¹øb)Wrª¥fÍÑU©xå# ¾t…ëŠ^HŠ~“a!Õ“†ù%è?j!	•K-—)Ì¶ƒeòD^ËÅ]æ\rN“Øƒ\rı–têÃ‚ …mÕBÂœÖ`Î?¹Š@Çp.¶²¬É#Qå ¥ê†hWâ &M¯,¬j¨ÌTXŠr‡Å^;ÇJ&TşÒ­¨äJ -‹\"³A»ÃÔB|1ØÚ.÷$a›°uI2{Ót×2»¤{*©¾!º-&Äb¥¹×æ)ÍÕqøq)p¿XppUÌw¹D­sr­ŒAk‰”°*´©N\"7·6ñ7[‹~ßâMÔiÜ-Â7ú¥Ì¨ì„	‹\r<‰@>Uâ6“÷˜ËÔÜ òÄb\rÂº€¥.#AÀ®a±¶\n§·Ø….e}‘·5IšÌUa—Â[îRS™jprÆßÄ6¿Ü«mKŒN±Ä~vÚ»€*5P\Zö%w2NkÓ)mæ¹]Ém{Wb®#¶[;|²›-©7™K[<ñ(uŠ‚F×/òY`šVX¯ÅÀÏŒ[FÄ¸y™çõËÌ>ÏR¼c¨4‡Ì“l×ÙfV`{†\r+Ïc¢¯×\rÊä™g“ûG06íu£&Sø&ë¬ÔmFC—”È‰§¹j¦Gw\ZB@±)\'V”¢á½Ë³%vAKuŠã©œ\0urİP¨§ñ\n¨ûpR&Š(Ìå²¨ls8İ°ÈPM i™–fà©gHN¸ÕüÁ.¼–¬ÂZÉ£p@İƒ¨$\nÕÂt2Mª²ğµ0aÌà5¹z®â	@f¦ò¯G5	M„2İJ–j û”õù,\Zp•ì1â¹f¼\'B®cÁû1/êÂiˆ²\\¥«*Ìß$ØÇÈßò)U^`+Ô<]z«íF$:+‹$™m.êÑˆˆµY*dÙ(Oş¨d\Z²·Ş¡fC3ÔˆÌÉTBÀëÙMàÆª9r9”ÿ\0Ùr–BÔàÙ,_6î^Ô¥b!‡1iã;—ƒjîq6ƒ<ñ‡`Zß0-	h„Ôo°Ùòfxv[8ƒ U‘VÎú1©y¯ÄXŠ’—›ü@µC‰*µâ´Á	P‰NH@,Ÿì4½u¥DkSÜ÷À<Az¸V]!*›‰˜…VÍ³7ûŠ¬ÌnUö;níæTÜ&p×*5˜)fb–u\rc$´5pÃŒÒìKÔ´¶ø˜–ëxæQ‹/¢~¿‰ûKšîŸ°_¥€d¥¨Šès)<™¡‘P¼ÆËÃËô¥”ëö˜şe\\J€¶ø”XÇõ*•cÈ„d^jÜ‰	àóTÁ7rAËïÙJ;((O0=ô4ûÓŒ{Ãl!0öjÍî{e.¥äq{\"• Ò¡ô¡\nn\0\\Ô0ñ3|–~ G«¡)—ˆ¦5\0ú?%ˆK©SZ/p0¼1Û>N\"HKÀ™¹¡T°\"\0cäwZÄ=îàtQ9%‘;°´ö0¡k&c¦ßÌ4¤7\nËp~²„S+iïŸ±‡[~8+Šæ;UD\nAƒhŞÍƒ.fämQB´#	.l¸_’W‡€m•T}¶û\n`›©xh÷¸‡ 4Fç8?ŸgÜ\'wşNA8€ğÁK\\–DÎ®£¶ƒö1…,¡™Œ4ol\rr‰÷P9ÀDÜl‚]_ˆñ•fÑçVPL72¾ÈƒehŞ¡Ç:s}³ÔÃù\n%QÅ3Û‹¸?ˆØ\"élLT#rß#¨F+¨º\"`1ï)ÔÚ–%ê+g4ÜàV7,aÛ8±Ö*zµÉ(»Û/Oèä\Z:\n”\\Àr„Õ¤4ÂK€îš®‡1H¨›ƒ.$z†8µåTÆo3n3\n\n¢Y™vKĞ¥m²ÊÁŸPçÁ*Tá\rŞµ0h.X$·¥=‘™s+LOb×¨h(½æ1jËÌÂêÄvK‚÷©Íne×Äº#]K#˜ğK«J¾¥BÅ‹¾§¸lö\\;\ZFÈ¡Ä©hÇ$@”%LS±¶˜¸PI*é.lk#ÄRÁ2Dm3HÚÙµ‘0È2Œ@NQ“iĞÖbV±Õ¹[m×`! vôò\\\n/	`½÷ã~ ¬8(aĞf…¥uM@m§îaÍ¼a¥Ø1éun*hø` \'£ˆ\0ávÊ\\€eño¸¥T®Ø›øÌ2k!½@!\\‹lÕ*Ëî\"$VÄşÏ‡ÈVÃ«Ô	ÑÙ<*‡AÄy®/äÃT.–f…b#q‡Ÿ&.¥_#gWÓ	\0\\/ÍBr¹«ù%•f˜ØfT·S<—\0Ù_òP:€®\"ã‡ÈTrª\Z«µPeus&/(t\'(ù¹Ü(Ã+ÿ\0PQ%•¶£I¦ÎÇp‚‰uO#Ù-Am–‘‘bpQ˜H-Ó†=`ÜbCX¹²p0 $áEÂÀ–.# ¢\rVı3…ûRÇ{cS›#FU¹‚J0u?aoBh­ü%Š»ö>M@­*0×ğ#¦)4ê!!Ú\r—¬F[6ñËàq3-Æÿ\0/³@¨†ĞCÇ’±ØûDØjOïÿ\0iN˜fÿ\0°\'ä¡C±‘ö\"òq`¥î^mÈ+¸1Á„m%ê­\Zq.Ğšk*6èq+}«œMr·¿‘\rX„ô¯%íµ{Ä¸P8ûÔM&˜½S9ñıDÑoR¬ë<Â]F†e]!\0IdÉÔö(¿›j¯a!b@İ/pËØs=¸Š4.\"§»\r6Åk5(+.Ùn#.ÛR^à!Ìëˆİªê4ChLn\\ÁK—\n3G|Àÿ\0ÈÚ½7‚`äs‰¢ZÔo\r‡2Ã8ù­à&<×ÙâıakxÁ1—¸è)üŞÖò\"QU.ø‚àeQs<©ß‘›Ş¥‹h«xl‚Ğ¶ÎÂU–‡ÑDŒÈ Ò\'å3]Æ#Xt‡PĞl«´ÇÙb²¢İì±`ÀºO4Är†M_0\nÚXÙ6M…AA ÁÇ0`$5D4ìå^çmÁ¦ë$M¡ø‰‚.XğˆÑÑÌµfw(í\0¹hîJ½+_ÜnYH0Âœ34“oÂ÷6¿ÈN*T=bô²c°B)xÒÀ!ÚÜjgªc%SÊu\005R±”+(Ü­HüÁ \"Å¯L-â&=\'?a¤b3–DtŸbN‡_Ä\Z¤Ëš™±ŸI«–£›iÇÉÇ³ËûK¨-wì\Z\0~âiœêc®`¶-üŒ\\=¹f2ìz™vÅ\n}æ\\N@&€\r£kÎØó\n«vÀ?˜8ÒŸÔ*4¢Û\ZÂ Ğn\0°ƒ¯`\0¨ˆ2ßŞ-©ê_íux2x>ş¨öC7\\=6µ­Ÿ¨\0‰mš®jh4Dß_!Ù6Àb”‘™Ë\rEºäašîe‘lˆş#jV£ÈN3·Æ©WÔBĞ4¢Î¥ÎOI\n$@ƒc¯ØõÒ]y@Ó–ÓOæåÔ]2_Ì¸\\¼ÓTD‹YBZ…ãúÍCÈ;€æÖÇAïlcÚÇzº}˜û9¸\r+òJßw\ZÈËÉÄ0vf_ğ@Ãs\r\r±£r&qL*8`=c¯fUÛû˜~Lí bˆŸpXxÃÇL¿äŒÀ+\'19ÉhîmŠ«&rìZ†¢?O´Ç¨³vªVĞßSŠ_êÌÅ;x@è…#£õÜ¹i£\'æa	KV_²û§*ø?SiÛræ1.Û‹Í¼ÌkwÜKUı‡¡U7üÃtó^%³N:`²Ú¨`¼s3TØ€n×¾\"¤R_.oˆ¨Æ±¨Ìã²8\n‚ğ)yz”¹°\r»§‚d²’ÃÑêÉMm…ëjëş!e+ŞyŒ¸bŒÄÏ-L²ñË@Àìsa<èë›¸bZ8%üÁ—ıª©{êXşÑØœJ™{YÕÔ!€¿e›Cö\Z3EÃ!¿±­&`¢İqµÔ¥òc÷*ş’›wëG¸xê5S‡fmÎâ*«˜†k¢:<©šT‚…^;Ì%â¹’ù—ø›\"lñ\0Ó¥™ñyØ!²:ò;F%@şà\rÇ8á²­fá9Jâãª]2€@ÿ\03z*÷q«ÈÌ·ü‰*ÉKÄ2Õck€—T,¸Ğùe/Ù‡q4è›¬KUhÑá!æø±2YPŠÏ³Ø,;!ÇÄB`˜ª¹Uá9û!(öÅ…;,Érãª›q¶İßPE¼u©‰	ƒp9TØ3ş‰‰dÀ\"‡àWÀ!àØK—\r›…\0*Èâæ¾ÁZ8Ô.™¥—süXÑ. ¿\"Á²šjP5›î…*j.YŠI4”a`¤¼¡Š„rV]ˆ¿]Ó	xï¡ÔGåäu\0/QRM‰+<5eµMÄ%0õ[¥âeg¹PÛgq˜ö;nóRçE·¾\'Š*\r7+Uç¸³F]â^¢¿ríUn!)’» Ú»LKĞœÄ²œé˜ÛÀ˜WØ?øoÊº	Zqk_Ò!°Nõ	e,ö6\09Ü¿s¥Ã»ÜËCCˆğoÛ[rù¦gŠ¹{xêP¦Î#².	rSxÜ_ü±Dq¼²—ˆ©‚—ÙZ°/¨ä„”G\\Ìˆ´¨`9\'9“w\\Íu+øâ Ã+üDíMÂÁ•Ï“¼Ë_¸ÔrŞXbD\Z«ºâcœ‘™cj¸º§b¹ÔİoO7|ËŸ›€3”âi[˜6v¬IT¤Cq*àı@‚³ ˜.%Uü§ wö£a§†´ÆV\nˆòÆİÃ/iç™WáÎæ ±8/ğw\n\ná”­úšY@ÜPÅóˆU3®å°SÅ“ äï=ñ‰ZqmBó­Ü&·gÕ´ê)‹Åîíş!zF	w0´æ\\–Ìİfêm:¸5c†Aû:¤Á*Íë÷\re¸è(¿l¥û”£Îå‹~É–”Æ1fB eu³€•ˆåB%dİœÂ—üK‡G!˜J)‚TÆ.^ÙÉÓeü•%»s.šº\"¼Ó./˜PBç±ıAKÍâYf\næ›s5F­ŒœâVU;……WiXuŒ±r·g™WµQí‚LôBhÍÜxp\Z¨)V¼Ä°˜„pw(ÎÎ¥6+¯ Ú˜â¦Q¦âÓ\0q©@G<Çc’™rX¤@Ù—4niŸ¹ŒaYƒB¨­§\Z‚pÄ.\"_“á%¶ª\0V`„¥P( ?¸#EÜcm/ñÑÇ°ì¬³½jîVôç¢\Z0£$§Ù+3àXŠk8e±¤J‡2w™‚¦Èè.Ûg6µ!µgå,X.šw–öVÎêëK™P·9®©ˆ¥\rWùş‚0Ã­Ô\0ØğµP$\nê»u§„[¿?xf®*¦Ç¹‰OŸ#·ğqÏXí•Wû1¬àƒ¦«q\n]ñ\0ª»ò:UQ¥•Ú«FåÈ#r­¤,Q+;â)÷,N[Ì3nz9ÕƒÎ#£û—ª¯Ä Y„Z-šÌ¸q;gÀÙ/‘mŒz]Áaƒ“‰oOŒ¸›Åé®ØWU^ÉMŞ{ˆ·§Øn[ê\nĞÇÎ3{—wä­käËÍõ)v»»S<@ ¿’â]¦exàÇi-Ä¬Rï$Kµ_»—«óRË²s1â±š”7{âRÖò3Y<…YÉ©…ÿ\0•Qz”¶î#ÙM½_1‰›(„t±:˜c_cª¸\\iøKØ#Ö®ÃZãqr¼{.•Cå—ªw)v{–<µúoH·ê1B0X @™.V¼ôî#]L^%„·Ö¥ÎşÂèº-oö‹‘Ñopµ]Àóû‚hãÙzâßêd†ÛàŒ\ZøK)š\'=ÕîkâRÅ’œ^àÆøöY¦¦H¸	jwåÁPİAu5QÈ÷ˆÇ7~Ç\"õpº¼g3ôa·‹Ü¾è‚—2÷;—30Îø‚9âÊ®`6óQÄ(ÍAm‡©˜¬çX\ZÁ\ZZi˜\nå;Vü‚d}¸/à¸±N¦ÉÔWEu¥)œqqÖºêáCº ißîB§ñ1ß‘ÃÀñ<üTA×,xE¦H87W?ÿÙ',	'image/jpeg',	0),
(41,	'Filly 2',	'ÿØÿà\0JFIF\0\0H\0H\0\0ÿâXICC_PROFILE\0\0\0HLino\0\0mntrRGB XYZ Î\0\0	\0\01\0\0acspMSFT\0\0\0\0IEC sRGB\0\0\0\0\0\0\0\0\0\0\0\0\0öÖ\0\0\0\0\0Ó-HP  \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0cprt\0\0P\0\0\03desc\0\0„\0\0\0lwtpt\0\0ğ\0\0\0bkpt\0\0\0\0\0rXYZ\0\0\0\0\0gXYZ\0\0,\0\0\0bXYZ\0\0@\0\0\0dmnd\0\0T\0\0\0pdmdd\0\0Ä\0\0\0ˆvued\0\0L\0\0\0†view\0\0Ô\0\0\0$lumi\0\0ø\0\0\0meas\0\0\0\0\0$tech\0\00\0\0\0rTRC\0\0<\0\0gTRC\0\0<\0\0bTRC\0\0<\0\0text\0\0\0\0Copyright (c) 1998 Hewlett-Packard Company\0\0desc\0\0\0\0\0\0\0sRGB IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0sRGB IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0XYZ \0\0\0\0\0\0óQ\0\0\0\0ÌXYZ \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0XYZ \0\0\0\0\0\0o¢\0\08õ\0\0XYZ \0\0\0\0\0\0b™\0\0·…\0\0ÚXYZ \0\0\0\0\0\0$ \0\0„\0\0¶Ïdesc\0\0\0\0\0\0\0IEC http://www.iec.ch\0\0\0\0\0\0\0\0\0\0\0IEC http://www.iec.ch\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0desc\0\0\0\0\0\0\0.IEC 61966-2.1 Default RGB colour space - sRGB\0\0\0\0\0\0\0\0\0\0\0.IEC 61966-2.1 Default RGB colour space - sRGB\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0desc\0\0\0\0\0\0\0,Reference Viewing Condition in IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0,Reference Viewing Condition in IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0view\0\0\0\0\0¤ş\0_.\0Ï\0íÌ\0\0\\\0\0\0XYZ \0\0\0\0\0L	V\0P\0\0\0Wçmeas\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0sig \0\0\0\0CRT curv\0\0\0\0\0\0\0\0\0\0\0\n\0\0\0\0\0#\0(\0-\02\07\0;\0@\0E\0J\0O\0T\0Y\0^\0c\0h\0m\0r\0w\0|\0\0†\0‹\0\0•\0š\0Ÿ\0¤\0©\0®\0²\0·\0¼\0Á\0Æ\0Ë\0Ğ\0Õ\0Û\0à\0å\0ë\0ğ\0ö\0û\r%+28>ELRY`gnu|ƒ‹’š¡©±¹ÁÉÑÙáéòú&/8AKT]gqz„˜¢¬¶ÁËÕàëõ\0!-8COZfr~Š–¢®ºÇÓàìù -;HUcq~Œš¨¶ÄÓáğş\r+:IXgw†–¦µÅÕåö\'7HYj{Œ¯ÀÑãõ+=Oat†™¬¿Òåø2FZn‚–ª¾Òçû		%	:	O	d	y		¤	º	Ï	å	û\n\n\'\n=\nT\nj\n\n˜\n®\nÅ\nÜ\nó\"9Qi€˜°Èáù*C\\u§ÀÙó\r\r\r&\r@\rZ\rt\r\r©\rÃ\rŞ\rø.Id›¶Òî	%A^z–³Ïì	&Ca~›¹×õ1OmŒªÉè&Ed„£Ãã#Ccƒ¤Åå\'Ij‹­Îğ4Vx›½à&Il²ÖúAe‰®Ò÷@eŠ¯Õú Ek‘·İ\Z\Z*\ZQ\Zw\Z\ZÅ\Zì;cŠ²Ú*R{£ÌõGp™Ãì@j”¾é>i”¿ê  A l ˜ Ä ğ!!H!u!¡!Î!û\"\'\"U\"‚\"¯\"İ#\n#8#f#”#Â#ğ$$M$|$«$Ú%	%8%h%—%Ç%÷&\'&W&‡&·&è\'\'I\'z\'«\'Ü(\r(?(q(¢(Ô))8)k))Ğ**5*h*›*Ï++6+i++Ñ,,9,n,¢,×--A-v-«-á..L.‚.·.î/$/Z/‘/Ç/ş050l0¤0Û11J1‚1º1ò2*2c2›2Ô3\r3F33¸3ñ4+4e44Ø55M5‡5Â5ı676r6®6é7$7`7œ7×88P8Œ8È99B99¼9ù:6:t:²:ï;-;k;ª;è<\'<e<¤<ã=\"=a=¡=à> >`> >à?!?a?¢?â@#@d@¦@çA)AjA¬AîB0BrBµB÷C:C}CÀDDGDŠDÎEEUEšEŞF\"FgF«FğG5G{GÀHHKH‘H×IIcI©IğJ7J}JÄKKSKšKâL*LrLºMMJM“MÜN%NnN·O\0OIO“OİP\'PqP»QQPQ›QæR1R|RÇSS_SªSöTBTTÛU(UuUÂVV\\V©V÷WDW’WàX/X}XËY\ZYiY¸ZZVZ¦Zõ[E[•[å\\5\\†\\Ö]\']x]É^\Z^l^½__a_³``W`ª`üaOa¢aõbIbœbğcCc—cëd@d”dée=e’eçf=f’fèg=g“géh?h–hìiCišiñjHjŸj÷kOk§kÿlWl¯mm`m¹nnknÄooxoÑp+p†pàq:q•qğrKr¦ss]s¸ttptÌu(u…uáv>v›vøwVw³xxnxÌy*y‰yçzFz¥{{c{Â|!||á}A}¡~~b~Â#„å€G€¨\nkÍ‚0‚’‚ôƒWƒº„„€„ã…G…«††r†×‡;‡ŸˆˆiˆÎ‰3‰™‰şŠdŠÊ‹0‹–‹üŒcŒÊ1˜ÿfÎ6nÖ‘?‘¨’’z’ã“M“¶” ”Š”ô•_•É–4–Ÿ—\n—u—à˜L˜¸™$™™üšhšÕ›B›¯œœ‰œ÷dÒ@®ŸŸ‹Ÿú i Ø¡G¡¶¢&¢–££v£æ¤V¤Ç¥8¥©¦\Z¦‹¦ı§n§à¨R¨Ä©7©©ªª««u«é¬\\¬Ğ­D­¸®-®¡¯¯‹°\0°u°ê±`±Ö²K²Â³8³®´%´œµµŠ¶¶y¶ğ·h·à¸Y¸Ñ¹J¹Âº;ºµ».»§¼!¼›½½¾\n¾„¾ÿ¿z¿õÀpÀìÁgÁãÂ_ÂÛÃXÃÔÄQÄÎÅKÅÈÆFÆÃÇAÇ¿È=È¼É:É¹Ê8Ê·Ë6Ë¶Ì5ÌµÍ5ÍµÎ6Î¶Ï7Ï¸Ğ9ĞºÑ<Ñ¾Ò?ÒÁÓDÓÆÔIÔËÕNÕÑÖUÖØ×\\×àØdØèÙlÙñÚvÚûÛ€ÜÜŠİİ–ŞŞ¢ß)ß¯à6à½áDáÌâSâÛãcãëäsäüå„æ\ræ–çç©è2è¼éFéĞê[êåëpëûì†ííœî(î´ï@ïÌğXğåñrñÿòŒóó§ô4ôÂõPõŞömöû÷Šøø¨ù8ùÇúWúçûwüü˜ı)ıºşKşÜÿmÿÿÿÛ\0C\0\n\n\n\r\rÿÛ\0C		\r\rÿÂ\0\0ü\0È\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÚ\0\0\0\0õH\0\0\0Ãè\0\0\0\0\0\0\0\0AG>gãîz7«©h¶ \0\0\0\0\0\0ù<‰Åİ‘Ô·³w4§n…¦q\0\0\0\0\0#ñ˜XæÇ(çÈqí[|ßÊÜ²šXÏ^ß×ï}P\0\0\0\0P—œ¹;’×CZoIoêBã>/âoæª{ÒÆæqÔ»•t¹ëÙ±^Ö@\0\0\0ÍÛ‰ƒB©Ãg>ééÔn—æì×y÷XØÑœlĞ”„£Ğ::½?£«³€\0\0ãNüÆ¦tÒ×¾7Nuút®D.¾9ßsS•·7V3lÇ z5üÛÆ†ø\0\0\0Zãïê±‹RÏ–FkÑJKcBİuÓ‡ÙF­§mo»xëjÊlFÅ­+]\01É‰\08‡3o™éÛĞz4CëÊCĞëÌ¡·W/¾Š>½Ş„Ú×èzvêfz°¾é­¯;¯xJÚ)ı.5W¥Èé¾ÕÍkn¡ñvÕoFŞ¡ëy™ö!®ÌnÆ·›{<èK½+M·ŞvìFw¢±¿Òt¹SÔàDìéS»z•§:³S³Ú¼—¾úÈ•jßË8;½3Ûñ÷¯†3¼Æ©Õ”\'µvv¢¨O§«ú¦—6r¬R{z‘Üó:óÖÃ˜~£;O\'Ñõ?ë@›UœÎt-Ş¿›-½Nœ3½†ü£¿†Ö#÷9æÒîMcW¯sô©½¯1LíyÍië|G<mBŞ›æ½µ«ŸÖ\0Xy[Íu,>›BÃ½D$\'·deí®G-ƒŸF67ÙœË-oz!‚t3¸Å[üşÇWó>×ôÈ\0Tá?7ùÎMİÖìİ­>C°‰ÙÆ\r¨kg?ª{Yª–Ktº=\\^eê¾y±ˆ3gŸçw:w›õû•Ü\02óO˜éÈîSlö<{V3\'	`Î([ÚUõ\"ìÓ¼ã‡Üğú[<ß™«n6bÂO—înœ?G~Ô¬\0\0ªÆ^qó}=‰WSõ¼›BÉDäá(YíV,ëÆlóõºÿ\05ÇµÇÏŠ¾ãÏ\r™/?õikº‡7[8\0§â|ÓAæ¿9¿![™ú.}‡£GRÚ¯¥Ñ,Í2ÎÌ_OËÅö<êZÛUËäªÚÆva¹¿Ê÷ÒîçIæëJÃ\Z²†ÄgÆ± ÕêZ¹WIó=	İIò?GÏœÜ§£ïSÖ©Yâs_šzŸœÈUÄêÛ…Ÿ¤>#—Ş†Ö÷7ÚÌS§·^aï¦ËúşU=Ëœª’JŸŸßœæYÈ½G6Wn¾åusõÙ\'±V{iä‹Ãü·E*¶a<6Ğcn2Ë6SıÃcä%9ÏìÕ¼¿³âòÅË2³OÅg¹-ÆØŠôº½ªd±)Kë’Ù®G1ØÓ®ô9qøØ„èy½‹yŸ‹*ûˆìb_¼Kn½¯İ7ßø>²óÉîù¿ã¬\\q+İÑ‰åmäàíõOE¡uÜ£”âX\'‰á»t$l†K!úÂ:Ê¸ïcÎÎîyÜ6Sš8Í·õ÷ft:ısÎzüñ—äáÇ:³=Mqæ÷º/sO­ôõuQ	GÏwÇ>Ìel†ô1ôó$úS}O1jèù=•[ºûw^7£¿ò{»’4£š6†ÅÓr™»`96Q¥œ“…ƒb3û5Éf©c›İÖ£QµûÍSÖô7^ÅX\0\0\0\08¶½”%¡dnr›v™ÙÃ63T³§R—K~[¾§P×Õ\0\0\0\0\r<<ß«³tclÅ¶Q¼t5ç¥\rˆf³gWF¹Xõèézú¿@\0\0\0\0åºörX[¥v#e‹¬¡tèQ9e{1Ì¥‚1œª=W\\\0\0\0\0›õ6+³GI‡8¼İNåS÷S±V7µ3n¶\'Úyú\0\0\0\0ƒ!jl-Äv_¶:\rğ´nU7m{xGcoG7Ø5êèZÔ\0\0\0\0\0ñ^½”ic÷ŒÌç=øİöë¾œò¥{RÚ×^¨£g\0\0\0\0\0\\ÖÃ“Æ\\Gf-š¶ìª:èõÍkzÿ\0?`\0\0\0\0\0\0G-Â»|>ÍhÆ:f½™\0\0\0\0\0\0\0\0\0\0\0\0ÿÄ\0.\0\0\0\0\0\0\0! \"01#24$@PÿÚ\0\0øş¿Ø¹¹GÚîmù´É”ôŸê¹ÈÆßÛ?S]ÕÆcÑYÄ©Óõšš¾Ü¿<ÛõÃMOZì	‡!\ZúñÂ“ ø“È³%uİ¡+²¾k;VC•(“‰CRš…)íOArÇ¡y`•U\r)H¦Q•îÛ\n$Ñ )ì©#\r‘äŠXşMmoÕ²¼ã’¢ÌºrE‘İce¦×zM^`Ü@§\r‚%„¨ƒü_B<s½‰|Í@H±ìC$rã9İ6Ø.dWœªõ4G’ÍB_ÅW9^¡VôåiÈÒ²e\\Š²5»àE³MŞ/,\nV9’ş1À{Ë¨¬«ÔHæ³ÃHp\"2J×ÀhZ$Û\ZîİQ$é¶9ä…0R!AdVwvS…z¾§¬ôëJÏ-0=…¶°‹t(FT¯(Ğ#Û&ê°•×Sõ,å—*ªËNŞ¾CH&›ÔuÚå¦ş§¢LÀÄIš‰Îo>ôêGWøÎ‚ÚM¶0A»b1¬	¾\r™ ´/¸©<€€I¬¬òÕ`oY.Ø7ö¥ş§„ë0@IRd\'Q©…/4ˆ/1!Šz5òŒı¨OåïÙ›(Í‡ƒ\ZcbÒÆ‰ƒF‰–Ä^¸ş©“h9c²«ör“|Wgg¦œRw§U×ùú˜ßÂ€„:Ò#‹ºˆ˜Çïw‚“ƒNU‘.2dôâ^Zõ\\®âİùfø¾äFqÍ=£ÒDk‡ÍE«òîGÄ9²¢´»`ŞF;)‚I3œD\Z&õÑüÌ«ë*ˆ¼Zçc~°ms²®¹f\ZUÏş?_­-”KÒÉrÚ¼¶¿8xò.ÈÇÅ{æíŒr¹ëÃMÖ#Ü÷rÛ:_±!Å$ÇÄŠÈaõ]«OØI+ĞíĞ¹hÏà`0Ì™È´lÉRú¤fÚÉm§}#Qç9™ü\\òÊ¹\\¾»Ëxñ EËêÀ˜¢X–\nÂWËlÈùh´Q5:VÄ¢ò:;}‰ôÄìÄ¨»rPã]Üê‡Ñu©âÓ#õ»t°oq—,“œ(/À=wÒò÷&øop‘To³+Æ¢bwy€Ü`Ñ›òÁª&	wZ·r‡”\'ÎF¦¢Ö»,v,Ã„h6™½AÚã§8qı†GwÒcsÏl|·‹Â0Xç\"3tœ«åH©å†?\0¯tv0èÄi kÉ\\¬.µÔk\"KW›â jb®6”ÄåŸ·.(Qj£¤5İL°ìB€±ßŠe~!6Îª»=û¡x¿}ñ9cHˆˆşKÏe¨ZÃZéÇÅ+Nà\r‚½²Rm2?vFÒ®‹‘)œ×.ìr«Fı‘„í6&1´|pôj¸á’3šíğƒßüSö\Zî‰Ÿy¦â÷ Úfk\rèJŞ`%UªG³²Ò;ÆHŸÇD¿üIõã°ÈD‚V¿lk÷Á“\ZLä‹›&L„Ãf4ÚíÑÊ¨í¹cF©ˆ7m]\\IÅ[Xæ£Û©ô7,XÏºJ	¬¯cñ‹ïE—ŒÜ“rÅk_øÉ&ØÒc$n£\\EÇ/¶Õ[(sºcÚDDÁ1Ät>Bà\0ÈÃôL¤ƒ=Ñã\n ­+Gm:!¢}u<jÏZMì<Â³føÁ;„MÙ2¥,àuIQÛç£®ü|/—U™®´{±ÎÛ!¨0?õ–ë²²7,T@7NSnO–\\–Ã&C¤ë~ùYÙ‘ûc<,Û»ÚÎ£¥C¹dùu•Ø«„]ñrBM°ƒğ•ï1S)íü×R|Å«„vÜh‰‘×|ÖHMG`š®\'Êw¨€É­\"<›ãŞ¹	ß¾ÉwA®\"äßµj;)¡õ¤|ÚŠŠ]¯:æ`­6ÊÙI\"Di=DŠLc±ÒX$öH*ƒ#±…ó¬q;]ù¯êĞ1A!F@êW¦ÕÎ\\|òK“¢¢9åÿ\0Lƒa™mú}Zÿ\0×20?¦}à~ŸÀ†F1¢gşÿÄ\02\0\0\0\0\0\0\0!1 \"0A2Q#@BPaq¡±‘ÑÿÚ\0?şFà§¤Fçôô“hßhÀ–Ú+Ïè-y¤øS[ïuOÇ¾«¨Úhí¦Ö/ˆ6–²ß˜PüN=ÚBÂğµã.±tíêŠ§˜Û­‘´2®Âæ+«ı>àKe}í˜¾£*:¨Ú;k1j2q)×\rÎdéÜÇaPXÊZ“{œ­ÄC¨eo˜ï¡6Œ×‡#³$•\"3–ËŸ2ÀsãI¶´>‘äŞ;ê„Ïë;ªZï/­.%î 9\0LíŸ™Hê>5kS¢/PÚTêz½4îİ·3Y¨‚Ş\0Ûqõìa¹ÈÊ‚âR®0Ä­Aé;ÿ\0iS\Z¬-‡Üÿ\00éÛP£ã,0Ş5¡\'<F.–zÌ­Ô«Õú}#üÎêêaªLÃ\'z IÇ.aÎv†’çay2Öã,%·1Ì<åŒêaOn†çïìnMÌ,Nç%*êêûy!±Ê¢ï-\0‡Ã™I%åSlº:ç±Kşò3Xm>©{Ïˆ«:mİGçÏâUğˆœd¨[a?tv¶Ò£^u<wdviı_ê_hL*â`p÷ß8ÛÉ>©iTzrÔ&¡ñEå*b˜»FiQÀæc1CHÔ<üFrçSrgàÇM&Òšß™†Ã=s¥8”©-Ğ¾kÌø•~™y|ğÊ¥Cm¥F´L@«Q¾Âcñ_Š««àqÒ÷0éâ:FJ=Ú«sxÊÀæ,~#.òÖƒ,3é¨#´ÅÑ.„kÊìø}Xp¼;C8Iæ Ôl&‡áğëLóÉT´d/ˆc\ráŒ§P:Î±Õ?ùTş¯õ¥™É•-ûfÄZ(™F©£Qj/ÄÂu”Ä•v0Ãu&Àä”ïÌ>‘xÆù\'Çç/œŒ«TÓBD¨Z«–3M¥Œ4ÛæhÎHwŞ+J}^šá×Ví?ŠV&öÔİ†%\n„T\0A¶äçOˆeMŒøgT]BÆb°Çûq³ó“1mŒ±¼¾ó¢³\'ZÑZòûÎš«¯ixeå#«ÌÓ-FV µÍ¦ÓSs¼l*ZÖ˜œ#R7KB™j<E‚*Î™GH5•en|-†ZZ= Âc:aDîÓâZ72ÑPÅ¤myƒÂ5f¹â*…TNğÊÙó‘„KgM}ÒuåúD§¤‰Ú”°îÇÒ&§‘½XªXyƒ¤ŞwÌf-Îk™‡#0ït´	yWMÇæ-âàpÊ5i–QôyFÙZsÂ­Ä,>¹Z¥öÿ\0#†Ùc¶£*Tı£ßAfélGOŸ}xğ0çLúbÆ÷ïàaÎ^ÑÛßç+ËÂaÊòƒØÆ·èÄ0™¹œÊcôÚf™ \"ÿÄ\0.\0\0\0\0\0\0\0!1 2A\"0#@QaB3PÿÚ\0?ÿ\0‡)(«²x§9YİâŸÛâëobË)5\Zjâ’—c­tVª ¬M\\µ4wÕóÎJ\nì©^SöÄ£\r^E7NVy7dU“”R9-c*n–äœcäNÿ\0.)·±hÒ¥û(ÕÒîTªê2—b7$UÁÎ>å¹ÁqÈ_²÷òaSrvÜ”eï’´·$Ü„¼\n>İEx¢7ÅL=:½È­•=áº×#•ÊtåUÚ%\nj„lŒEE8ü“ÿ\0e™^*/bÍî9=:L4-pÅ•ŠøZuù?ÆI=ŞÅ*¦¶4•:ÒoœT?’7¨Ê‘…8ØÃÑu§«Áà¬$F,”%NZ8Ü*ZF\"–‰4²½JûJİ0¥:ˆ†ÛÔf‹+.BŠ¨ôô4¤¬Ê´U?r5kšL§Ùeb.æ#ñÑUh?rå?¦Í=x’15}Z®cU{³£‡©_´§‚§íÙ¡šZ^œº±¤v™KxôF´áÁ<LçÈäß9p²«İ–«ßWGk.[<tíNßª‘Õ[HÂÊñYJB}	&ï&`°¶úµ?ğµÎ3lÆÔ×RßºËÜa&´+’©RbÊÅ‹XdˆÜÀá=O«>:[±‰ÄzQıœõOµ“›0R»o‚0ü‘Q#J1EËÜKÉNWJàÒ¢´®3Œ¯¹&W­\ZJòä©QÔ–©uË‚¢ÜÁ?x¢¬8Û$Úà¾½ÆF&)8ÅE\\:ÃRÓçÎ\\\nùbjÊ/LJªûü\rìVî0ÎÓ)ÔÚÂ’’±%¥åfy)ËKÜ…8Éª²9ËÉqìUz¦ØĞú¬Ù(Ù—¸£´È2³\'º¾Hf\n‡©õ%Àœõ4ÖŞÁùÌljêÌ«†kxŒŸvZd•íšB&®ŠëÜC¸‚ØˆûrE$¥$™ucUË£\\MMäÆKå7ø%‚¤Èàar¬Sƒ¹qd†ÌR³%tQN§;ˆ‹³¹Jª­Ø¢£ÆI$l[\'.FZÃ1rÓI–É1<±ˆòa%ìÙ{ÊGt<Sb¬ÊuTòLhÓ“1Õ.ôtp#¶¸Ì#úyp&)	‹+¨Ó(bG¡óÆÇ#ˆT—ì“rw}X•x0OÛŸddE—ÉfQÅÿ\0\Z†¯&¢uTy+cWœß[Z•™ı”$)Æš´s—9Á‹(òI\\R”;XëT|²ss{üÒ~áe9­Ù&^åIøù›²¸²Dy\"<¢6N~ÏQøp#Ÿ‚ÅHyùŞï¢™„Kç]#Ñr¤¾{[¢dK%°ê\rßì™%”lbe¶ŸµàUZ=c×—ƒŸø?ÿÄ\0=\0\0\0\0\0\0\0!1\"AQa 02Bq#R¡Á$3@b±ÑCPcr‘áS¢ğÿÚ\0\0?şFm‡e£Z5qà$Ø\"/övv÷Gî¬î&§1ñ?†.q\rhÌ’öÉöfØxñõV»Q¬½èã¯¼w¨]k÷s×‚èìÓ?ƒ˜EÑ(‰§ŠÊÑÿ\0Rƒãx{x´Ş>ˆ„RKSvä&­¯Î…H×Æ[)ñ6L¹ØKî4æšÆÓcOi®4Á\0éîpËáÛ¾wîĞq)öÛkñw\0¦¤šÚµ:	ê‚Fq9¦­\" «]ª´1ÆK|÷|WI+ß,‡W<Ô©YRşz(Ëj×â8ê/«Çb5s·ÑÃ6íªq\n–§ôrrªÇ‘¼Z{VXZvb^eYş³á}¶ÔCç¦¡ºú,B1-[„¶´Fßixé]@\ZÌ€\nÌOú¡b†â<(‘¾Ö!¼j.–‰\ZEx#Ò5¸Ã±	kTÖB\0u2-5X,LÂÚ>jfä[¡åfnp£Q1¼:¤ó¿W¼•™»Š.:”û^,,d­ˆ7Ş\'5gú=­FÖm»Ş[G*ªÑs[Ñ¼ïjÛa|^øC	Ù;Â»ç4Öı û§õXuqÔ£îáÏ´0Oœm›¼ª­H‰tB„WuEh©LÊl¾ÌÇ™°şjQHVµ»Z,8šQ’Îzë–ˆDaÂ_¬ƒ0²ïïwıÀS®186ºTõE±Ÿw6NääKŞd–R7•fú>ÌÀûukˆw½PŠ¸¤=ç!§¢·–Qàfe}R\'‹xq)\"3—º3BAÕ4J6M4õ´U\Z«ÅÇ«Ydå½8Y£ÃıG¢ç’GxŠŒÉZî¯£à¸£rlğÎ^Ç;÷“¤ÅCÇzo;ŞöÆ$Ì¸ıW³8^2k«LCu\n‰Š®t5|‰¶wS§vÑÃá%T÷_í\r_¹Õlıš>Y¹ßw¼íUœq{ÆŠƒ!Õ²nù\"£<º”|c5ì˜ÖÊÚ,…ÍæùÜb²m;|›‡’.\'‡WªÒì[˜Úõ¤#¿´4PkBU¸.W’¨Y¨Ç*£e€ìé#¾Jƒªd:È~gwHÍ‹$k÷€ª²)äËò»3è¨2gµ½2!¦®_U€ûSŞ#À:¹*»ox @u­˜Zpê8W4í®JÌ\ZÆ[—’Ûx”²ÃHØV­pTtT[â²5w]ë£frÈê:Õ&@sà‹Şq=Æ¤›·]™]\"ŞîFÏóÇ¯moôú £˜\ZaXƒª¨;×axªsFuĞª5ªÏĞûD­\r£	ğ£\'ğ›³åÆìôT •Àx‘ì--éZeÀ@hÌÕT(V6»Ñoßs¸·4+êºR6£E‘ºŒ”msš®ûªOQâ+ÕÀOKhÿ\0‰¿4jşŠ?r<“és“Û¥\n¡E•İs¼–™9t®,Ï$)}eÇ’à/g,®èÄ/à‰&€o)Ö£Ï\'Oû~èÔœõ%\0sx…MéŞJLO¨õ¾IšhZ*…M\\u7d³ÉTœG’È-«¹ª4†·Z°-¯‰º¨ğë‰¤1÷ÈñW¿Í¤ÓCFõŸxŞæœÁ°÷AÙ+;µ\\•¹ßçTû]œ{\rrğ•]’¥o)ÊYámc¡5Ş°½”–›ï¥Ô+3U‘*·T]NGÎ´\'1íc² £i²·Ó{Á`~ë¢”´†Iİ<hŠµ3„µø¥úë·…‚AäíÅõ¼‚–geC‘º·dªUİŞî	±°Q­¸‚* £h±4‘¾1¨òâ¶…k‡ÙÙ›òV9Z(ØÜYAÌ«­‘{Íÿ\0ßæîVâj`Ç‰®7Ğ^TÏÜšÙªÈÕd¨ĞIàu ào»½FÜ-êâÌÇ»ŞĞ¡1¶&E–i2ÑÃqCí,áƒ4]OHì‹Üs7°nk.¦ˆ^BÄ¨È[$„#kôMû×fãÛ·ÂÑ_;ÇRœV•XZ=¡BÑ+vFb»Ïm$Ïî°U>W§\Z›ÛÔ•õ‰…[¸qTÚ;OçÊğêS‚	°¿8‰ åÛÚ_Zí;\nÜ\0Ôœ»iKZMg5‘êÚª„„l³?^ŞVÉú\0vf\rØ#vk)Æjª<9¬³¿iÁ¾knÆGY=“yêƒ üq°ú-«,\'Î0¬¶˜\"c#ˆ–<1´Ö”ı>*¹ú*êFzî@F\0<Ñéd$–%§	\r]â?„,‘¡ìvE®Øä67[LLÿ\0K;Ts\n&I¢i:Ñ¥ß²l’I=\r`\rhĞä?ÿÄ\0*\0\0\0\0\0\0!1AQaq‘¡ 0±ÁÑğ@ñáPÿÚ\0\0?!újZ?Ğ¿‹xÿ\0b%Ü7ªnêû¨³­èG±şcò6T,¼Á›£Ö¼²ûWÙŒÂÔ3âK¯]zÇùâ¼¦{€#âÏ`ÌtÍ{×øŠKépøÔ#[S­z‚bI/lc¬2Zÿ\0dZĞ÷™%u\n­İR½%I®\Z)†ı|—×íÄv?ùh–{tçké:€rrâ¢F(²\'ÔM×Ò}f$]`-ñ	¿D$P0GÓÀ0û4Ö=gBv	O fcä}S×	ÖWö¯V7}G#Éã::<ÄÊt>|CHTÚWİµ¼Z\Z;¤íÙ‹ß4ø”1´pu%’¥Ğ9?«ĞˆÅk4NÌ¶`µ*Ş5ŞQ¹¼e?Ş#Ê`S˜£×óƒ[}5¢ãIJz[*æ©—´”¸¾«°²€Œ[Òï¡0•7¹âËa£Šë«·VŠä+x|¹Öñ3£f#™”Û“÷MÌ7F¯úJ_ªVÔ³µËD•£8°·¡%Á ‚îÏm*Y¼\\xèèÚîC°Fÿ\0—¼Fc*Õ\0C«ÿ\0>vÂÊ°-ùT÷³§ä=™¼H t-ôŒ;–x•mnİ –Ÿ§ÚlC~QØ­!Ïa~ÌÕyk•?yÒ]Ã§¨bêİá³Öf\Z$Ñ€EÛ±mµÏÛñòô{“—cX vúÔk¹R\\pR»,å“C`Ò#b0—V±F–ì×N#T7Ö¨xK¸:Ãô\0?iq|EÔÜ•„é2Bî¢m_˜bò5Ÿø´ñû!PËfÓÚ+à¿ØøŠ¹õNãÏê[AMr¦[k\"ºĞpãh`ß*»Kc”\"£8ŞM.ÚG®öøcÊ£r¿¤t{óÄ$Õ! âæYª˜µ¥§«ùôï,17˜×_T¦23*İ\\~_šÕĞ=@0ôûC}Ÿ‚l\Z€sP‚™}4ÄT”§v£zP†=®g\'¶yÌ\\\ZÁß§óéH9æ\r/´)Ñ1±¹Z*ç†ŸŸš·î—â³(‘•Ö#£RããıÒ¦á±«g˜aÈƒ‹ÛáÍ©mS«‰•a]jÍ‰¢²û#»ƒY`Ì!Ì³6o7ÈßO0Û@mólÈ­8)és>ZL7:¦¦>¯He/‹ÕÆ¾`\Z:³Ó8–fÅiOKô¾e\0›Ù™@4 m]£şÁ«ÿ\0#cvy€É¯1NùF„RñAsø2î\\¿>	µ¯½™šX…×f°ZGVà¶Wf2e§“	Ãbxz¦k¸	ƒÏŞ×\\ÿ\0ëéÄF³ywGÑâ^³$n˜›Æy¬Ùú	^ò\n/1f“Tq4ıÜ–š·½8ÌÜMÊ«ÌY¥ˆz¢šñvƒ‚57%ğaYHşdlo1ªcRr¹ü¦˜V\'vÒÉ´t]YÓ‚a\'‡Ì\Z)×*j¨s:ÏlÀ…¶¢ ®aÄ×lÙuN%+©Ò¶\"‹Æ¹–î±k7ª7\0S´§Á9UŸwÁqÖcZ”jî:ÿ\0]¹–lU¢ÖpÔ5_/Õ*Ùœ\ZtŒzíÂ)s%°m©Æ; …&î9ÀìG+‘fqtŒ§A\rÄ¿UÔ\"+,JAŒªJæâİU7ÇØûø·7Æ’Ìnò±\\gz•¸ì7:JLê–Ì¦îÙ¸`ÒØ$™€ğ ³,J ¬b\"\nWLKÚMN¨Å5g\"…ÌÇâ1¿Æ‡–\0Ãëá‚,é#ª[´üKFl†vîI†¨ ì¡9V{ÄÊıÉœ»ï*Z2¾ÕRÌ£Î·¼•L¡‰v´r£H•N¤GUáğ`‡H#Ñà<»Ã¬”v$·weg¹Ó‡×®âÀÅTd¡j«”\nÌ1HŠcr½cÁŸïÌQZÌ:¿ÛN÷¥£Òb:Ít6\Z@Š–\ZB2Üat_ŠišÒÄ÷C0Q×ĞJ \n>\0Ô(ç/ğ5ïš§Ö#•MurÊ¥\Z¯¢ÁİO°S\'#ÈË$\'…kë5Ş˜œ4f5ušö/:1^3ËØÊ…ôcëzïê@ØùS¿ëK<“@aRF¥¬ê\"G„\rA=Wø‹6°¸àññ]µUSg’^-fV#}æ¬”æäzƒ™¤­Z‘Ú,@jH%¯6×·¬dß×Jšó_y!.ò‘š5‹à\n%¬C-¶Ñ>±Š5ş4ç‚YÁíÕš÷©*ÀÌæsª¸àƒÈ–	ˆƒ-É¿õ\0€õ¹õ¡ìüúLÙ•@ü†;¸¨`T\r‰å|†¿o¯£Çˆ0{£X3\0ŞÆĞ^\"À%Û\0ä4I¤ø;¡§Õ¬V#t4—ÚŞU‚uO„ÃX²ô×á„¢b˜.úA\rÓªçgïë%”é/±7O¡G¤t}p±F[¤½´D!W[K€¤ñÙ–b9P`º.Ï/¸;uWŸ®–f{Âî‚?\'º*k1µÓÂÚá¯.¬+?–éœ’\\:é¤‹ñ~è¿ù\rîa©‹ïÅƒ]\"\\\r`{Ü_‹i­—µe÷†4hüÿÚ\0\0\0\0\0\0’I$’I$’I$’I$’\Z¤’I$’I$’\n«’I$’I\"¾B™I$’I$%,{dÙ$’I$;„ÉÀ\Z¤’I$\nh!ı’I$€Gÿ\0\0’I’\'ğéŒ•rI{2FxJFnNIµ’çí„2âI$€£z¶/’I$ğ:şÜ¿•y$— Iñ )$’0Môcå¬$’LuAh•™v¤“XCâ‚	.QÜJÕe\"³ÆŠì³r­âsßzRı)ëÑ${¡P®ˆ^æõÈï¹\0ß=\'QO­å‰$‚>¤S‰ñé$’I$Ğ€™$’I$”I±i$’I$‘ùû±$’I$’\Z¥ÇÅ’I$’4ÕKı’I$’@kZ25’I$’IÆP’I$’I$’u’I$’I$’I$’I$ÿÄ\0(\0\0\0\0\0\0\0!1AQa q0‘¡Ñ@±ÁğPÿÚ\0?ÿ\0ÃGDy‚˜‹rÅ¡RkŸÀğÄ­õWáf9e¬\Zúä¡0©dÆ!Sè-¨!†™Üâ×(Š§ê“>c3Ñ¨`J‚”ã #ÙdqÄÛl1aqğ°‹Wõ*ÊTåG9T6’l˜˜,Y…Äq)ˆà0ÅvØŸRŞR(¬eå)¸™³|E‚ç›&f+˜0}dÁúM·‰K\r¹¸›*®b¶&,Ñ/1->L2àƒÌÿ\0ÄÈÇq,G^ãñé§íğm™é^ïø~şÑfÖòÍ²¿×†pµD¨–X4Ìˆöv—¾d!vv&êò?ó_\'‘SğZËYg\'ïË˜å¹}¡¥@¥ËÖı›€Êü~à\r:ùãàù‹´åÊÅ,Äa¹ş \0\rz½eÆJ—3ˆğ`NÈÑƒ’[˜í=yÍƒÛ»ç^òÂóË˜í‘{Am°|s÷qûõWÊR=êZwá„u5U	ƒr³PÔv|i÷íŞY+[ª:iK˜\"œş8õÄ½ID3,\"èÊj7D.TMÎy™G-½Ÿ·ğg´©„t¦\\›fçOùó\0\0Ñê­.kr”Å\rÊ#f£0†y£¶h€Ş“6kÏØµ­-|±vƒ3‹uÛRõ¹F+›ÿ\0n\ZÏŸZ£¢([…£7ßpnhí™SËÆ7ÃÄ<w÷wö8ˆ†Ôjkˆë0êZ4@¨ŠÈ-KÔ²Šæ¦I§)ö—Sad{|Õ9ñûû3\rs,—\rÒì˜‚±P3îÁg«IĞK39ÌnU‰\0\ní²BêäŒ¯ÈËÿ\07õwDÖqO7ÌR.ê(ó˜1˜É`‚[³·ÌÓÂÿ\0âmÑ,é± ‘]°i‹\nšô)Úa*¡ŠE«q¡]ÂìJwŒŞW/*Mè®Ğqa¤öÀ¬± ;Jº’<™²\nnÀc¼º2n(¦_– #K½í×ê^2ê.±a0¤«æ,Ş¯’QVaZOcçíÊ‚X™1ÛˆSRâyBo\0Æ„+ˆ—‘XÌ´ğbĞ?i^ïú{ÆŒæ!’¥…¸›B¥FR/(ÁĞÌ\Z‹gE³ bÁ©wã—@ã2-•îù¼ûF¸-æ9ÄRPÛR=(dÒ=L%\\¥¥Ä\Z†8–O=Şß¨³Ióè”&YXß1ÑëpB«Ğ­\"B–:`@EW1ÃÜKtË¨Aãë#iW‰†º/Ò¬™lVµÄ³Åõ‚Ú‚i”‡zf^Ljáúù-âŞ£Ã2A¨³w™9•áõğ»…0ŞcÌÖç¿K«n\"³õ‰¤)šÔ	´Ş¦âœGa`£ëànjÜå*1$8a\\-¶ÿ\0;%¸¸¾	[FµŠ·¸†¿ğÿÄ\0)\0\0\0\0\0\0\0\0!1AQ 0aqÑ@‘±ÁP¡áğÿÚ\0?ş\rĞM	~}=´hüËÈ_¾ßĞ(n\"ÒÁ{ÂÅx!±†FWS%»“(tœZƒe’á™“¨:\ZÚ©l A3Õ¦\0±óQ‰€vËú%÷	„Ú2…©o…şcj’n#ƒRÆT¶Ø@Æˆ¥\nó,€)Ô	™Ùˆà\rt\r-Ÿ›sûˆ­A|B¾v¾°5¿2€ÓqQ\"€¸¸d¨VÔÌ	cˆ5\n{Äz‰…;J]xTIY…Ë\0öJ$£©„£¬Wú-CëN¥†²vñø`ÖˆÚ„¥ÀxY¤îóñÑó\0BiûçÁÆ5±ŞeÃ©Vf„½`ì«®Ğ9™Í¥¾…A£ôElîGÓª˜ã»©›ü#íóö†\0ÁØ”o2óàŠ­¾r’}fî]Ä2×ı¹¶ßº±]K¹³£=œ¾ı¿>Ğ¨T8 p%GSŞ#çÅpMX³838“–A‚XË„x~ş>ı¡e±ª•¸“L\nf¬?¾|N³õ[M(\"2àYÑwP%—/rÍ8èîüåÇyJÛ£Q‡¼,{kæ*­ñ$B^j\"Û4©MG\",™V /ˆ¥1ÛD;ˆå};û¼@A¡‚nRŠ¿¼ ¢[‹àDÉ—Æ-Êœ Œ ¨Ùôvú%– ¤Şr˜ï\0-óîíì|²­€ecœËiXŸ~A\nl•	0‚˜É©…è¯Ex´Ééëñ¼Ñ7”JQ0fzó	 ¥<7,WMÌŠˆ”2‘Š+›‘SÚÚ;ÿ\0¨A«^^öqN ¨<¶Àİ,Ñ¹ .H`¥Ñ!ªé•¢S˜9€²¥‰\r„Å¨áew02‚)¨Õ˜DqBopö‚³FÒî[ê×ãeFÍDT²¢©q]%!IjQ P8—`¢9‰”{¾fãŠs,±ÆÉÅÊªë?Üİ8ûÆÎ%–D¶TË¡(+Ğf E u©zîlğË‚”ÊM®8‹0 ÷z$K‚¬Å.Á6e;D¾§‰–á‰— Ä‹\\=Üªs\nI„p®§á¨£sà–Şa.gMÅµJfJ`ê6‹7–F\rŸ˜-#MÀíÑ‡û—ß¦†.´Ê‘×L%¡ˆ®$×Øªæm=¬¾+ó´zÊ‹5q››B)gQ<àE3mƒQs3‘Œt5%Ì«Ï/C\Z—‰´QÌKƒPYƒTßŸ’ÀÏN ¶m˜ôÖ:s‚ğÇF0ŠóÒ™P&%ùâh“¨¡NÉÉÖb;~†‰$àcs\"á˜ äı&áÙÒ•Á(0¨ª·Àÿ\0ÿÄ\0*\0\0\0\0\0!1AQaq‘¡ 0±@ÁÑğáñPÿÚ\0\0?ı¹äXq.G	p¢yXµĞ\n `–ÕT\"2|v„\0]Ä›ÓèşÙ³PÅQĞUÎ²¤à¯aK§È@ñdÛ âÓi¼Q0©è¼,ŒD0T(PXlAşÂæ©Ú¾\0©Ü5†WIó³œ)üÕ;õıy•g¢·°(S›¨£¢ÖôHbk®r;Ô˜Vá–êÓYİe¨]d©R9ö(pËÏï¶ bãüõ‘¿šhğ}Z«ƒúĞšÙ\n|¦ö`¸JûW:FÕ¥ÅºçÕOHã™dà³îõÊEH_\"ò¿|½Ús;]ıqrñ¢é&š›»¿c*dM•yñ9Êoœ!¶&Õ&5©ë€Ñî“ßƒ\"/IÈúwû´T\"êŒ`ÏR©î|™¦5š.#\"8§wt\0U{Úª¾ 4@ãOé&pdìAJÊS¾w{n8³_s\ZãêÅ²$ywÓ+Úuã\Z=Ë°i«OÄ@P<!£A¦À.‰¬Û+µ‘­Ì5#PÙ)×–ÛmíuGgíĞğ.8µ•»¬=,³ª^~2ÅõYJcB.+¥¤›:ÍÎb;PuÖ©ºÍÊ €Ó@_gF_¸!XA¢|Õ ¡¦{1™‚´ÔFwÆn<å\0uf_\0èƒå¹Db2ìãÉt„š¸9#Oø½„N¬Ï¼ßóûbáÖ2÷ÔLmFËµ0›\0h]è„»¸ÁI¦,±‰›ÆÊ°Ág.W1Wg\Z3¡:Í ±@&ëÖ3LÓyV-½^s…hã	Ù\ZÖ°½&ŞşÙk~Uç(ãv‚ıÈıc(DI¸ËúVHâj>—üÆ1C•-¸=Ü2ÚØa¢ñ‚ DÁõÆ\n(%ó?Şk\\1§y`¢däFÏ®+İ	ÓˆÁ*C¢àQ¶oZëÎ+k›ï‰§Ó¬}È0\"›IõÅ„èóí:a÷ı#h‹Cájú=Š°Øãõ_¦:X¯}¼å&º’µ«ëSô+k˜\0Øˆ?ù„	Š€@\"èšÛ‰ç›»Nw†˜N×´Üb\0Ûÿ\0…•å\r§\r<o´	ŠG‘G\ZB ÉD6ûÚUÄĞÕAñƒó¶?¢émúáÆ@EÇÅ“ñrMêš£\ræPÔõqÕÔ‡äkèÎ/¼Ö{¥ni@q\\\'ÆM­sÒ¶úVğ‚€4é	,äê¤I\n )p€\n\0÷¬ ‰ÅM)ç;JèöÃ5ì¸$ŸŒæ‹m¾¡şr„İ{/+Şh8‡Y¦Waw?û‚ê­Wúãi©§Ìÿ\0TjõˆJ¬ğ‹Ûı±t\rì×—Y|¬QDüêã[ÃáÅ\"úqO²}?S…Ø…¸ü®Ç°wˆkpÖµâ;øÀ““	—hE·¼EM¡ã rı2îI©ªåEo†a\nyõ”äf­‘/HäŠ,Bøó§-ÄÌÿ\0Û&%ô»O—Õ]Ø9Ãš\0Ğå5âèÀxØ¥#h<b/ÃR;Ê¾§êõŠh¯¥ÍĞ8â0£Ö\0Ş½ëX<\"YòÍá-ÄA…‚âE·fÙÉ~˜f:åì\ZüšÅÏ—ûŞ{ñi·ø>S	$±ûSAè¸ğ7”Âç;Â¡Ÿã3gœ8˜È60{©\r¯Cî>…pÈ°ø\0€«rœ@KƒÂ(ŠÖBˆA6ÃòH»Wğ7øÃk¤¸€(_®KGÆjU‡ıq‘QÔ»Å„ \nTÔšÁ¡úUGÔãŒ›oÏåWé‚şp²‚|æª{…²6íWÕÇm†ÅC¢g>£Å¦iíÇNË;Ì|¾¹r`w£oŸgğCõÍ(ÃÈ\'ä1eÒ˜¯®c–Ûå÷È¨&üş29ó5†@’¦Ï‡4ÌÍ>qïU­\'\r{Tª>?íæ»s\"Ó¡z\\»Tö”¯Qü‡´°ı}\0Z¼cÓ‚«“ŞZç:G_A~Ëû&ß`,xfœ :øÂÆ)Û$ˆ.“)¾Şá;cuÖi\r\Zù|šõ“ãQéÊÔç~òBÄ!ÒwK§­~EÜäÓ«†BìÖ1M¡/&-Ä\"§3\nqC¿– \'7&l¤ÇG“zP¿ŸÓm=·‡p}rëSxİlĞ¹ãîÏXŠ;œË›3É¼QMğ…\"¨vl ŠôLSÍ¯Ã|°-gXYi•!ãŒ$Èiÿ\0Œ%(zãÅÑ£ú@ï)hú³p?áp†Õ£ÑşpG›\'®2Ó_r~ú%‘D«NOiÙÉ‰Ú\0*«ÀyÀRJ^SëÅoÀÖ¶“\rj«Û½çâpê*ë>MğÈ7j¿Œ6>N*ÀLÓUjõã\n\nxÖ?`yÆ]¼ (\\EËU/8Á[iÁ¬ŠNÒÄÇdîşà\ZOşfÅ j¯ó•,Ñ=ã_ƒ’‘-#¼VµB¥zó‡¸°C´«>yÈtra¾h~‡ËN_S°»˜E\Z /?SQÚò©ÎĞ«Î8H)uu‹Ä¥=µ†u)2r`PºÁ­->r·Ğ_S.\rÆä9”Mã^Â—Ò½œ|L‡\nÚÉp©wœ^²/ïíp¸]IïÇË”F-=_fZÀ¾°©;ç…GI”ìEÉT\\ÓÁá6<U5\n©¤ 	\'sÇÎs±Ö×å/>pÂ”.½àuDâ®E&âPàiÍ˜AL+õÄÅ\'PQ=Yº»ÆÁ§	¢á pO’õ‘2Ø›Šy½»dÆN2òœXúÆO9¯xfÃ‡\0ÅÜÅä0;¯«„¾òœ™ÊŠúú¸„21nDy1‹F{W…ß‘ñ´p\"Ü‡P.©å’ï\"°x*`Fò-wï X?–swØìò=ğ~A4|7ê!}©ÉöÆH®º™0â;É©HæÄiÆE#xŒalÂöì8}²/ã®ğB º¹^\ZìáÅd^q[Ê“ÿ\0Bôwñ\\F—o•öµ}¿Ñçø¢DDy¬ºûcı^ÈwIk»ÃCB¼=¸5¹^³Q\r@ Àp}²ëls‚u@¯W>ñöş‹©6k¥Ègñ¡Pà ‡ŠFÎw£Œ¶Ó(8*éÅdŞİ`£¾9zp¢:ÀD.ÑŒÚ|83½Ãpr«°ïD‘ø3™&ÿ\0åç~³e79Êò¾ßÓ2±ò”_«œîGËŞŞ\\\"r\\)xN;ïE×Ãatº/€^ÁıI+xaø~Ì4×œpÌz¸ª…›ää Í]d¨ü¸ú¢¦ñ(LN¦ Ó•®6OŒµÈ±0õ^/Àšó|şõz·ôBÏ»¥ŞŠg{~ğ•·Ş\\ìgß§€Şxìó1˜3#$€Û+Êº¶“È;¾@óûÌFÓQ}Ö·ç]TW^7)Nwòôwd˜\rZ7´—§°Çh3‚Np8Ø‡¦Ï§å×N\0€ûÌ:%_Eü£å’o	Æ”°H)|äã™ ¬Á4¼]ª|ä\0ÓyÛİÆ4#xïƒpx>K±ù<?¼2‡Kÿ\0ŒŠ=dĞoxA¨88ØHçÕ<œ¹ncøÁlwšP›}â[”°™y ~p ¡ÏŸİj|É˜Aò“)¶Èm^óU¾L…ÙôÃnƒÔT|°	Só‡{ŠíË«ç\"óBt]v8*+”ã£ôşŸŞ\nˆK\nIU„ˆQS_\\\\;\ZéF.~•Şú†¿”L³=œì`ƒ-s2m€a¨ˆ·Rbëh«×3ìúãÔ7<‹”ù|:G¼üŒÿ\0äË?øœA;i0åäÁX›Q”<;yÀi²nù(;Ä¥¢ô\0ÍÎœP)w±ÙÒfŞ`ÚEéú{şÑÌÔ2ˆ\"zpwÑT[Z¡ôCzA|ñO¾€4iÙ>2®ºª¥£î÷‡…€tÿ\0ƒÿÙ',	'image/jpeg',	0),
(51,	'Ziri',	'ÿØÿà\0JFIF\0\0\0\0\0\0ÿÛ\0„\0	( \Z%!1!%)+...383-7(-.+\n\n\n\r-%%.----------------------------+--5------/+---------ÿÀ\0\0¨,\"\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÄ\07\0\0\0\0\0\0!1AQ\"aq2‘¡ÁBR±Ñğbr#c¢á3ÿÄ\0\Z\0\0\0\0\0\0\0\0\0\0\0\0ÿÄ\0)\0\0\0\0\0\0\0\0!1AQ\"Ba#2áğÿÚ\0\0\0?\0ólF;GÕŸ*+`¹ËD„VIh\r€ŒVÄRDl\rŠØ·$ª°\\[€EPéŒ™Y.!Qce.Z‚uD¶\\bYq‘,@6‚‹ %‡¦R3‘ÑĞ‘#ÎÆA@AC²hd0¨#	1($(F\nDA¡Z‚ÀÄd!£I\nÄR…ŠÉe¡¬i¶I¢#b\\7’ZA¸Pƒ&!Œ	=]F	ë%¦†9ó,Prf˜±¼’QG5<ç²÷ävRá­éš7\\¼ÎªQPn+Ue——·Ì®½\n’’©‘4Ür©^I9+$›mİ5ê™ÂŸÈe“ûZHê}.8R’¶qT¥(»I5¿½º\'¤¡‡•JÏÉCG+«Fvp©/ªi˜xœéÙIZêëÍ^Ç¿G¯k„©Ix÷ûGQ¦pJqæ,©PôÎœOˆ*fÖ`5Â˜ˆd:-ˆÈH–\"‘›A	Éd\"A±ÅD!Ò\0\rˆAÄÈD‚€’4+ŒÖ-†b³3t+B4XÄb,F„eŒI!ŠäVË[%š!¬v+%š!B‰`2J\rÎºXWZÎnKMÕŸ\'cÕvG²ñ”{Úñ»{E­\"¹6¹Ëô=”x$|ô_c‰ò\ZˆI¨§Øéhá(Û®çÍáÁq:Z“çk¸­íÕ—apX¸Nê›‹æÖ^>{Y³è4pnÏUú\r[‡¹TIt8’šn’V¹<Ö,‘¦ï\Zm¹ÖÓVâ–X%—Ğóİ¨”ê:uä²ÆQq‚ÓEMÙëÏY?¡ôÚ”iPJúÔŞı=®×öaâ!<M7ÆåU$µ“²s‹wÓEue»7Ğ¨âÔ)_şÌu;²bp®{£å¨²š(ğ>¶,ùÙ¢ÖÅ@ld7í…C¡¡DtWÄRd40PEY4d;!ĞÉDC!†K\0PCa’KÃ’Áb£$V;B²\rĞŒV‡ˆ´#H±ŠÄR*’+eÍ	$K4E\r\0y XƒD->Ìá#Wÿ\0<Mroğ¯¾ÌÎzı£š%ÿ\0$´c\'÷<º¼¤×£|İ$}ˆQWä_SÔsE_]Yä±XÖ£—£ú¸nĞÉb#BNĞµ¥×Ç¤eè¥kúŸ7ƒõlï4¢¬õóâs¾±EØN!&İ’3+OMK¸lVæ™1¥T!UÉÑ<$åW¼“ºO#jt¨ÕÃÆ_9Æ-òr‹Zùjs7¡ÏÃ1ñ•KEß[iÕhÌ2}‹rSü ­IÆN2Vi´×4Ó³OÜCÓÿ\0¨XumLºfP›_İ(¬ß6¯îy”¦Á“|#/hùœ°Û\'€É¦`ĞÈt¡Ò4D0ÅÅ1,Q4FmŠÖ\ZÁ°Ä*AHe’ HtaÉd	PÉ%‚‘,2CbX6\"1Úƒt+¡Ø\Zh­¡Z,hV‰²Ñ[B´YbX\nG,,_R%ü7‡N¼Õ8-wo’]YœšŠ¶ix3ê-işpÊÕiÉZqÉ}Ş[Ş^ëäwà{+Jœ–yu–«Ú;Ø:İÛ²Ùéû=n¶\"á\'OO§”^é“ánuyZä¡Àã¹ÚîK+ô¾ÆîQU]İ³«]õ¾†ºÀ-Ï6”x:R{Ÿ\'›©Ùƒ§äjÔÀfØºÜ‡6kÉÉV›Ë¦öĞâì†(Ë=¢ãw;è’W»¿Kxš\\¼ÚŞ\"ášŒ%lé)Ûò\'{{´¾LË£Ô¨„²tâäyşÓqêq5+¯…ÊĞÿ\0¥éÊé_ÜãÂpú•>¶¹½—ÍÜ#…:Ò¼´‚İõò_¹ë;¥åŠI-’:RÎ±%x9˜´¯5Î|#ÉÓàm?Òÿ\0~®ÇOìÔèÒUÓ¼s8O¬]ü2ó‹ÓÑèvUO?¹ìøn¾ÃV¡7~ñÔµù_ák¥™šÕäRM¾;I&Q,„Bâöe‰Ü‰Ë“\Z1\ZÄC#C0X6\"CX\0–\rˆ2…°RÄ°ìš\nAH *\"\nAHh¡Ø¨\r‚ÖŒÅhv-‰7B‹aìK¤WaZ-°,\"Š¬åQÊeÜv£Ju¤×¢Š_y3Æe=§d*å…8·áŸyI§u¯š±Ïù+èº=zFºŠÍœEö_?kìUBÌ¢Şkí}ù-9utQZŠ‹]n­ìîp8Æ7äì§|um)Jœ¯tbŒG¯‡ûÆâ¶R×Ñ&z>!FR–Ó‹VvßÉ˜İ¢á™èKª³^m;˜9íi¾ûH^ÚµQä®²ô’ÖÏÍt61|b”#™TÎù(ßæÙó¥…•œÓVÍmÕÓ}cº½ºÑÅŞ:î´f°É»‡ÜôlF§í…o‚œbº·É8z1­>ònM¿‰6µ~½©TyÜ­Í+úùÜÓ^kêÉ-í&)âÇ.\Z7ğ”ÒI%d¶Gti]‡¡¦¥³­nn•I™XÌ=ÍÎÍbÿ\0§§O±‡ãØtõ©­ÒÕı*]®¤ŸM¾Z4¾£’´rrÊ8ò6ÙÆ)%ˆ­²«Qİœè»[¼œªéã”¤íÉÉßîT‘ôxZpM3…9\\˜PÖ\nC$jT†A°R!Ò\"C$\0ƒ`ØxÄbÃX|¡°X¨Kâ2ˆÉÅBX(|£(…ŠŒ&aì+B4À°Ì–HK)eˆL¤°ö\r„&SÒö6¦i¼4£š¼ú8J+âª²öGHìá˜ÉP©\ZĞµãÉìÓÑ§åcF>¦7úÍqdÙ4Ïy\ZuğóRû”ìıWG%ÑJ¬¥â“OÍoÒÄá\\b5Ò©\ZrƒÍ–wiÇk¼¯İr=óh·{sèÏ”Èç„•4w±Õ)EÚe”ë(<Í]t,â5Uj~e}½\'¬Qn¥Ôà÷‹Oæ¿ğÏİ*g§·\'–â|\"òÍ®ÎÜÑ‡ŒÂÅJİäbÛv¾tåäÕ¼6ólúU{K„)Êé+¤í}µßm²â·k¹´fyD££¥-Û³´W“{½õØÚÍ–qä“GBáÓ$!¯)?w·°¼Nš„\Zò3ÁP·!ÊIö2±ı´tÖXÓn~nĞ^û³\Z§Äb?úKÃùax¯İœØ˜]¯6ÛôÙ}‹èÂÉ´´VcØ™óz½l›j,hÁ)ZÖY]¿`\'küWş}‹ãRZCğŞûk­´¿N2ÜMÓpOÔº³ò;%:‘ğôOmz$îÛç«õ/HÌ§\'$›Õh·ÙéúĞÅ[GwæzôZ…ã/%¿gr\"˜ÖPÿ\0S§Uå‚üÓEÃ$QıTz¿“baù,°’+r.°É¬D?2ùâé¯Ä¾£êGØ9/gBC$sañ±”ãN*MÉ¤´êvåäŒ&\nŸaRQÔB‘v:Dl£¨Œ¢**Hd‡Q(ìTyÀ\rbXcB4\r`XC,€ì@¤5ƒ`©‰`¤\0zŞÉÆs£:qjÊ¢vç¬M>ŒÜÃğÙ+¶îß²Hğ<?V„³Ò›‹µÍ5Ñ§£60ı§ÅJ¤/SLñ¼c,ÊêëEÌâk>;&Lqj™ÔÓka(É;=\\p¹V¼µ3)¼µew¼~©¯ÜÔïg9É·h%¤|ú³uYÔ½ÒğÛ¦×8˜Ù#²•³©KRêğvRèqB¶·fÖunVĞôÎ|ğoµ¤pTšµÏ!ÚvgİÇír;øë­\n®Ñjùº+ëc¦ËJwj×ró[İô5\\œ_‘×ôo?·¿_ìÍ¬­²åm®[]eµù%µ›ççĞµà\ZWï\"Òm+Êí/E{k÷5ğ85İºpÉ)TËšrOÁ½¡{5w»è’æÁª>yäO»,áü:¢‚pÈï\'¼šRI=ÒVoÕy à±£’Õ]ä•ÓğİÙßoæ¨ôX.K|ÒË)^mÁitâ‘üZù7‰ãj’¨ùìº%±ìÒàê¿Ò/»¹™‹Àe½¹ëíêpGK¹7ÏOCr2ºË-¹Y+§û9õé<Îß^dj4ï.è³W½ÁüÓRF-+ioBF(Â2*J‚½ı£÷»odîô²æ[„ÂÎ£ËvıŞ¥9“G5Æ£BS’„S”É&Ûö=-.ÏÆSÄO$•­J*2œ—Yr‚õ:)µ–œT#dµ”­ùç¼½6ò7Å‡&OÒöRÃì«‡à£‡‹øgY¦œ–±§¼bïiMõÙr×Tê!QLXÖ5Hİ$•\n 2€ñC¨šØè«(ê#¨Œ¢U”9KTFÊ*<«@±c@q4 K¡ò‚ÀØ)É\0¢¥Š$°\0–\nE™C”\0D_»©\n¶¾Y\'n©nŠ’%‰i5L§g¹—hiV‹†œÔÒÏâQIÛx¬­ë­ı‹kpÛÆRkân^—<6*SH;J.ëîŸ‘ë¸jåZjŒ©Â9“WMî“kG¶ÇYñ”¿‰qäëéuÉ¿ä|•¬>k.†Ş\rwqWkÜÃÄÕ©Ëì®[†ÃjœääüşÇ†xüù:R×G´y;{AÃéâ©:º®ê2škñ$¯%òOÜòXN\n—J¢ùæäº®ºıw¯\Z8z“–Ù\ZK¬¤šŒW§ËOv‡IÕ‹mœ“js‹òmK…SŠÕ9r¾×NéËM4vçÓsK\rŒ¡J¤äçª1QÖÉ-\"’ù_©äÛ!î_ÊG.0§f¯ã.¯‚	ÆšI§)5ù¤–Ûi¶ˆÊt1Æ\n¢nÈ|]Ä¹(x™çÂ²F„Õ™Y¹;Yó¶Ír¿$.Çv#	wx¯mıN	Ğ’İ;IbptÁÎø\ZØôİ‹á•\'9M7á¶T¹»ı>‚”İìì·ı¨v~Œ0˜wV{½Uı4^¬Êiğ’îi¥Jsç²<¦>†J“‹¾üİŞº«¾{•¤5jÎrs{Éİ†(ïÆÔU÷=‘ˆÊ#Æ%‘€ìt\"ˆÊ#¨Œ¢B¨Œ Y2AaEJÈ]”!c£È’Å™C”ÚÌh¦ÄP-Ê¡aE*#(–Xe°¡#ä.„GÈMŠBà_İÀ,TQ`8—åÄvKE#Ò›Œ”–é¦½VÁpCèéñšÖy©Ë™£çkkô-—h¨R_íÆueÖ^zóoä*+<ŸC‰»hÛêf‘ÙÅ¸­\\D”ª=Ãéú.¾oS9–1lzãIpy¤Ü±$Q¤5ˆÉ\0ÒCÅ!Ò%–¶ÅkœSù¯Ğ	#9Â3şÈ{S;pøÅ©Æÿ\0İwô©VÙäİ¶[%è–ˆã‚.Š3pwiCÀè‚)Š: Šfˆ²(º1è„Ie¡B¢_‡»Š”FQ-îÂ \"‰,Z¢XèòHCĞ`‚¢¤ †ãL„åLu‹*‡îÅtÈ@°hG\0e!CEn%n$!h†#B4Bˆb´,ˆB‰b¤K€ Øk\0€4<Pé„²ĞÉ‘ICÅA„²ÑtQ|K-‰|\"BË/ŒKc†PÖREQEq!\0ÿÙ',	'image/jpeg',	1);

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

INSERT INTO `tblblutdruck` (`fldindex`, `fldblutdruck`, `fldblutdia`, `fldpuls`, `fldid_zeitpunkt`, `flddatum`, `fldid_benutzer`, `flduhrzeit`) VALUES
(2,	'147',	'97',	80,	2,	'2015-04-29',	1,	'19:02:00'),
(3,	'123',	'92',	72,	1,	'2015-04-30',	1,	'06:00:00'),
(4,	'135',	'97',	80,	2,	'2015-04-30',	1,	'18:27:00'),
(5,	'123',	'94',	72,	1,	'2015-05-01',	1,	'05:34:00'),
(6,	'140',	'90',	76,	2,	'2015-05-01',	1,	'20:15:00'),
(7,	'134',	'93',	71,	1,	'2015-05-02',	1,	'07:13:00'),
(8,	'140',	'98',	83,	2,	'2015-05-02',	1,	'20:03:00'),
(9,	'117',	'90',	75,	1,	'2015-05-03',	1,	'06:55:00'),
(10,	'134',	'98',	72,	2,	'2015-05-03',	1,	'18:46:00'),
(11,	'135',	'97',	72,	1,	'2015-05-04',	1,	'06:14:00'),
(12,	'134',	'91',	73,	1,	'2015-05-05',	1,	'06:00:00'),
(13,	'136',	'98',	78,	2,	'2015-05-05',	1,	'18:56:00'),
(14,	'128',	'99',	74,	1,	'2015-05-06',	1,	'06:20:00'),
(15,	'150',	'100',	78,	2,	'2015-05-06',	1,	'19:00:00'),
(16,	'133',	'100',	78,	1,	'2015-05-07',	1,	'06:08:00'),
(17,	'153',	'108',	81,	2,	'2015-05-07',	1,	'19:19:00'),
(18,	'142',	'98',	86,	1,	'2015-05-08',	1,	'06:12:00'),
(19,	'156',	'111',	77,	2,	'2015-05-08',	1,	'19:12:00'),
(20,	'135',	'97',	74,	1,	'2015-05-09',	1,	'06:43:00'),
(21,	'144',	'100',	83,	2,	'2015-05-09',	1,	'19:41:00'),
(22,	'136',	'100',	78,	1,	'2015-05-10',	1,	'08:04:00'),
(23,	'144',	'94',	85,	2,	'2015-05-10',	1,	'18:34:00'),
(24,	'144',	'99',	79,	2,	'2015-05-04',	1,	'18:00:00'),
(25,	'123',	'91',	92,	1,	'2015-05-11',	1,	'06:36:00'),
(26,	'141',	'97',	83,	2,	'2015-05-11',	1,	'17:56:00'),
(27,	'128',	'94',	75,	1,	'2015-05-12',	1,	'05:47:00'),
(28,	'135',	'90',	77,	2,	'2015-05-12',	1,	'18:08:00'),
(29,	'134',	'82',	94,	1,	'2015-05-13',	1,	'06:36:00'),
(30,	'134',	'91',	79,	2,	'2015-05-13',	1,	'19:14:00'),
(31,	'131',	'93',	78,	1,	'2015-05-14',	1,	'06:56:00'),
(32,	'130',	'91',	83,	2,	'2015-05-14',	1,	'19:18:00'),
(33,	'147',	'97',	93,	1,	'2015-05-15',	1,	'07:40:00'),
(34,	'136',	'93',	85,	2,	'2015-05-15',	1,	'18:57:00'),
(35,	'117',	'86',	75,	1,	'2015-05-16',	1,	'08:07:00'),
(36,	'123',	'89',	92,	2,	'2015-05-16',	1,	'18:46:00'),
(37,	'118',	'86',	68,	1,	'2015-05-17',	1,	'06:48:00'),
(38,	'133',	'89',	82,	2,	'2015-05-17',	1,	'18:44:00'),
(39,	'121',	'87',	82,	1,	'2015-05-19',	1,	'06:04:00'),
(40,	'136',	'97',	79,	2,	'2015-05-19',	1,	'18:56:00'),
(41,	'123',	'91',	102,	1,	'2015-05-20',	1,	'06:18:00'),
(42,	'134',	'89',	79,	2,	'2015-05-20',	1,	'18:42:00'),
(43,	'120',	'88',	85,	1,	'2015-05-21',	1,	'06:39:00'),
(44,	'127',	'91',	79,	2,	'2015-05-21',	1,	'18:57:00'),
(45,	'129',	'97',	82,	1,	'2015-05-23',	1,	'06:59:00'),
(46,	'142',	'92',	92,	2,	'2015-05-23',	1,	'19:32:00'),
(47,	'123',	'97',	82,	1,	'2015-05-24',	1,	'06:52:00'),
(48,	'132',	'97',	83,	2,	'2015-05-24',	1,	'18:37:00'),
(49,	'131',	'99',	77,	1,	'2015-05-25',	1,	'06:29:00'),
(50,	'126',	'86',	86,	2,	'2015-05-25',	1,	'18:24:00'),
(51,	'129',	'89',	79,	1,	'2015-05-26',	1,	'06:01:00'),
(52,	'134',	'94',	82,	2,	'2015-05-26',	1,	'19:22:00'),
(53,	'123',	'91',	111,	1,	'2015-05-27',	1,	'06:34:00'),
(54,	'141',	'91',	82,	2,	'2015-05-27',	1,	'19:02:00'),
(55,	'130',	'89',	76,	1,	'2015-05-28',	1,	'06:18:00'),
(56,	'138',	'98',	78,	2,	'2015-05-28',	1,	'19:18:00'),
(57,	'138',	'98',	78,	1,	'2015-05-29',	1,	'06:38:00'),
(58,	'157',	'106',	82,	2,	'2015-05-29',	1,	'19:36:00'),
(59,	'126',	'91',	76,	1,	'2015-05-30',	1,	'08:42:00'),
(60,	'123',	'97',	80,	2,	'2015-05-31',	1,	'18:15:00'),
(61,	'133',	'92',	79,	1,	'2015-06-01',	1,	'05:55:00'),
(62,	'132',	'90',	71,	2,	'2015-06-02',	1,	'18:29:00'),
(63,	'119',	'90',	76,	1,	'2015-06-03',	1,	'06:11:00'),
(64,	'129',	'88',	76,	2,	'2015-06-03',	1,	'18:05:00');

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

INSERT INTO `tblcomputer` (`fldIndex`, `fldHost`, `fldIPAddr`, `fldSyncart`, `fldaktiv`, `flddbname`, `fldusername`, `fldpassword`, `fldcloud`, `fldlocal`, `fldremotepfad`) VALUES
(64,	'Laptop (dbjoorgportal)',	'192.168.0.133',	'auto',	'J',	'dbjoorgportal',	'root',	'mysql',	'N',	'N',	''),
(65,	'Internetrechner',	'192.168.0.104',	'auto',	'J',	'dbWebportal',	'root',	'mysql',	'N',	'N',	''),
(72,	'Laptop',	'192.168.0.133',	'auto',	'J',	'dbWebportal',	'root',	'mysql',	'N',	'N',	''),
(82,	'Easynote (dbjoorgportal)',	'192.168.0.154',	'auto',	'J',	'dbjoorgportal',	'root',	'mysql',	'N',	'N',	''),
(91,	'Handy-Horst',	'0.0.0.0',	'auto',	'J',	'joorgsqlite.db',	'',	'',	'N',	'N',	'');

CREATE TABLE `tblconfig` (
  `fldindex` bigint(20) NOT NULL,
  `fldfeld` varchar(50) NOT NULL,
  `fldwert` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `tbldauerauftragtyp` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldbez` varchar(250) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

INSERT INTO `tbldauerauftragtyp` (`fldindex`, `fldbez`) VALUES
(3,	'FremdÃ¼berweisung'),
(13,	'Dauerauftrag'),
(23,	'EinzugsermÃ¤chtigung'),
(33,	'Barzahlung'),
(43,	'Ãœberweisungsauftrag');

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

INSERT INTO `tbldocman` (`fldindex`, `fldindkat`, `fldbez`, `flddatum`, `fldregal`, `fldlink`, `fldind_zimmer`) VALUES
(1,	0,	'ordner 1',	'0000-00-00',	'',	'',	0),
(2,	0,	'ordner 2',	'0000-00-00',	'',	'',	0);

CREATE TABLE `tbldocman_brfdetail` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `flddocman_ind` bigint(20) NOT NULL,
  `fldbez` varchar(250) COLLATE utf8_bin NOT NULL,
  `flddatum` date NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


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

INSERT INTO `tbldocman_brfverkehr` (`fldindex`, `fldbez`, `fldversendet`, `fldantwdat`, `fldan_ind`, `fldstatus`, `fldfilename`, `fldparent`, `fldsort`, `fldeingetragen`, `fldpdffilename`) VALUES
(11,	'FluechtlingeInternetAG',	'0000-00-00 00:00:00',	'0000-00-00',	0,	'',	'',	0,	'',	'0000-00-00',	''),
(21,	'Einladung Januar 2016',	'2016-01-16 23:00:00',	'0000-00-00',	0,	'',	'EinladungTreffen_Jan_2016.txt',	11,	'',	'2016-01-11',	'');

CREATE TABLE `tbldocman_detail` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `flddocman_ind` bigint(20) NOT NULL,
  `fldsort` varchar(3) COLLATE utf8_bin NOT NULL,
  `fldbez` varchar(250) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


CREATE TABLE `tbldocman_doc` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fld_detail` bigint(20) NOT NULL,
  `fldbez` varchar(250) COLLATE utf8_bin NOT NULL,
  `fldlink` varchar(250) COLLATE utf8_bin NOT NULL,
  `flddocvon` datetime NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


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


CREATE TABLE `tblEinkauf_kopf` (
  `fldIndex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldDatum` datetime NOT NULL,
  PRIMARY KEY (`fldIndex`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


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

INSERT INTO `tblEinkauf_liste` (`fldIndex`, `fldReihenfolge`, `fldBez`, `fldArtikelnr`, `fldTyp`, `fldSort`, `fldAbteilung`, `fldOrt`, `fldPreis`, `fldAnz`, `fldArchivDat`, `fldKonto`, `fldBarcode`, `flde01vorrat`, `fldStatus`, `fldEinkaufDatum`, `fldid_kopf`, `fldtimestamp`) VALUES
(20004,	0,	'Apfelschorle',	'',	'',	'',	'GetrÃƒÂ¤nke',	'Aldi',	0.39,	6.000,	'2013-08-24',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(20014,	0,	'Ãƒâ€pfel Braeburn',	'',	'',	'',	'Obst / GemÃƒÂ¼se',	'Aldi',	1.55,	1.000,	'2013-08-24',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(20024,	0,	'Bananen',	'',	'',	'',	'Obst / GemÃƒÂ¼se',	'Aldi',	0.89,	1.000,	'2013-08-24',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(20034,	0,	'Bauernschnitt',	'',	'',	'',	'Brotwaren',	'Aldi',	0.55,	1.000,	'2013-08-24',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(20044,	0,	'Bio Kartoffeln',	'',	'',	'',	'Obst / GemÃƒÂ¼se',	'Aldi',	1.69,	2.000,	'2013-08-24',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(20054,	0,	'Butter',	'',	'',	'',	'Milchprodukte',	'Aldi',	1.05,	1.000,	'2013-08-24',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(20064,	0,	'Joghurt Natur',	'',	'',	'',	'Milchprodukte',	'Aldi',	0.55,	1.000,	'2013-08-24',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(20074,	0,	'KÃƒÂ¤seaufschnitt',	'',	'',	'',	'Milchprodukte',	'Aldi',	0.99,	1.000,	'2013-08-24',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(20084,	0,	'Milch (Frischmilch)',	'',	'',	'',	'Milchprodukte',	'Aldi',	0.50,	1.000,	'2013-08-24',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(20094,	0,	'Naschtomaten ( Mini )',	'',	'',	'',	'Obst / Gemuese',	'Aldi',	1.00,	1.000,	'2013-08-24',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(20104,	0,	'O-Saft',	'',	'',	'',	'GetrÃƒÂ¤nke',	'Aldi',	5.34,	1.000,	'2013-08-24',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(20114,	0,	'Paprikaschoten rot',	'',	'',	'',	'Obst / GemÃƒÂ¼se',	'Aldi',	1.69,	1.000,	'2013-08-24',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(20124,	0,	'parmesan kÃƒÂ¤se',	'',	'',	'',	'',	'Aldi',	0.00,	1.000,	'2013-08-24',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(20134,	0,	'passierte tomaten',	'',	'',	'',	'',	'Aldi',	0.35,	1.000,	'2013-08-24',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(20144,	0,	'RapsÃƒÂ¶l',	'',	'',	'',	'',	'Aldi',	0.95,	1.000,	'2013-08-24',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(20154,	0,	'ReibekÃƒÂ¤se',	'',	'',	'',	'Milchprodukte',	'Aldi',	1.09,	1.000,	'2013-08-24',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(20164,	0,	'Schlangengurke',	'',	'',	'',	'Obst / GemÃƒÂ¼se',	'Aldi',	0.30,	1.000,	'2013-08-24',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(20174,	0,	'Sojaschnitzel',	'',	'',	'',	'KÃƒÂ¼hltheke',	'Aldi',	1.79,	2.000,	'2013-08-24',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(20184,	0,	'Spiralinudeln',	'',	'',	'',	'Nudeln',	'Aldi',	0.39,	2.000,	'2013-08-24',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(20194,	0,	'Tomaten',	'',	'',	'',	'Obst / GemÃƒÂ¼se',	'Aldi',	0.00,	1.000,	'2013-08-24',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(20204,	0,	'HÃƒÂ¼ttenkÃƒÂ¤se',	'',	'',	'',	'Milchprodukte',	'Kaufland',	2.00,	1.000,	'2013-08-24',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(20214,	0,	'KÃƒÂ¼chentÃƒÂ¼cher',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2013-08-24',	'HAUSHALT',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(20224,	0,	'Freilandeier',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	10.000,	'2013-08-24',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(20234,	0,	'veg. Salami',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2013-08-24',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(20244,	0,	'veg. Aufschnitt nach Wahl',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2013-08-24',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(20254,	0,	'Curryketchup',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	1.000,	'2013-08-24',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(20264,	0,	'Griess',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	1.000,	'2013-08-24',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(20274,	0,	'Kaffeemilch',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	1.000,	'2013-08-24',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(20284,	0,	'Shampoo fÃƒÂ¼r Frieda',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2013-08-24',	'PFLEG',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(20294,	0,	'Dove Deo',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2013-08-24',	'PFLEG',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(20304,	0,	'Tofu',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	1.000,	'2013-08-24',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(20314,	0,	'Tofuaufschnitt',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	1.000,	'2013-08-24',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(20324,	0,	'veg. Pasteten',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	4.000,	'2013-08-24',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(20334,	0,	'veg WÃƒÂ¼rstchen',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	1.000,	'2013-08-24',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(20344,	0,	'GemÃƒÂ¼se fÃƒÂ¼r Sonntag',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	1.000,	'2013-08-24',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(20354,	0,	'Gnocchi',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	2.000,	'2013-08-24',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(20364,	0,	'Pilze',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	1.000,	'2013-08-24',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(20374,	0,	'Rama cremefine zum kochen',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	1.000,	'2013-08-24',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(20384,	0,	'H Milch Palette',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	1.000,	'2013-08-24',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(20394,	0,	'Essigessenz',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	1.000,	'2013-08-24',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(20404,	0,	'FrischkÃƒÂ¤se natur',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	1.000,	'2013-08-24',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(20414,	0,	'Orangenwasser',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2013-08-24',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(20424,	0,	'Apfelschorle',	'',	'',	'',	'GetrÃƒÂ¤nke',	'Aldi',	0.39,	6.000,	'2013-09-07',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(20434,	0,	'Ãƒâ€pfel Braeburn',	'',	'',	'',	'Obst / GemÃƒÂ¼se',	'Aldi',	1.55,	1.000,	'2013-09-07',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(20444,	0,	'Baguette-BrÃƒÂ¶tchen',	'',	'',	'',	'Brotwaren',	'Aldi',	0.35,	1.000,	'2013-09-07',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(20454,	0,	'Bananen',	'',	'',	'',	'Obst / GemÃƒÂ¼se',	'Aldi',	0.89,	1.000,	'2013-09-07',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(20464,	0,	'Bauernschnitt',	'',	'',	'',	'Brotwaren',	'Aldi',	0.55,	1.000,	'2013-09-07',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(20474,	0,	'Bio Kartoffeln',	'',	'',	'',	'Obst / GemÃƒÂ¼se',	'Aldi',	1.69,	2.000,	'2013-09-07',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(20484,	0,	'Butter',	'',	'',	'',	'Milchprodukte',	'Aldi',	1.05,	1.000,	'2013-09-07',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(20494,	0,	'Buttermilch',	'',	'',	'',	'Milchprodukte',	'Aldi',	0.29,	1.000,	'2013-09-07',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(20504,	0,	'Joghurt Natur',	'',	'',	'',	'Milchprodukte',	'Aldi',	0.55,	1.000,	'2013-09-07',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(20514,	0,	'KÃƒÂ¤seaufschnitt',	'',	'',	'',	'Milchprodukte',	'Aldi',	0.99,	1.000,	'2013-09-07',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(20524,	0,	'Magerquark',	'',	'',	'',	'Milchprodukte',	'Aldi',	0.55,	1.000,	'2013-09-07',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(20534,	0,	'Milch (Frischmilch)',	'',	'',	'',	'Milchprodukte',	'Aldi',	0.50,	1.000,	'2013-09-07',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(20544,	0,	'O-Saft',	'',	'',	'',	'GetrÃƒÂ¤nke',	'Aldi',	5.34,	1.000,	'2013-09-07',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(20554,	0,	'Paprikaschoten rot',	'',	'',	'',	'Obst / GemÃƒÂ¼se',	'Aldi',	1.69,	1.000,	'2013-09-07',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(20564,	0,	'parmesan kÃƒÂ¤se',	'',	'',	'',	'(ohne)',	'Kaufland',	1.00,	1.000,	'2013-09-07',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(20574,	0,	'passierte tomaten',	'',	'',	'',	'Konserven',	'Aldi',	0.35,	1.000,	'2013-09-07',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(20584,	0,	'ReibekÃƒÂ¤se',	'',	'',	'',	'Milchprodukte',	'Aldi',	1.09,	1.000,	'2013-09-07',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(20594,	0,	'Sojaschnitzel',	'',	'',	'',	'KÃƒÂ¼hltheke',	'Aldi',	1.79,	2.000,	'2013-09-07',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(20604,	0,	'Spiralinudeln',	'',	'',	'',	'Nudeln',	'Aldi',	0.39,	2.000,	'2013-09-07',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(20614,	0,	'Toastbrot',	'',	'',	'',	'Brotwaren',	'Aldi',	0.45,	1.000,	'2013-09-07',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(20624,	0,	'Zwiebeln',	'',	'',	'',	'Obst / GemÃƒÂ¼se',	'Aldi',	0.69,	1.000,	'2013-09-07',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(20634,	0,	'KrÃƒÂ¤utersalz',	'',	'',	'',	'Salz / Mehl',	'Kaufland',	1.00,	1.000,	'2013-09-07',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(20644,	0,	'Orangenwasser',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2013-09-07',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(20654,	0,	'SpÃƒÂ¼lmaschinenTabs',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2013-09-07',	'HAUSHALT',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(20664,	0,	'SEnf',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	1.000,	'2013-09-07',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(20674,	0,	'veg. Aufschnitt nach Wahl',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2013-09-07',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(20684,	0,	'veg. Salami',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2013-09-07',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(20694,	0,	'Tofuaufschnitt',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	1.000,	'2013-09-07',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(20704,	0,	'RÃƒÂ¤uchertofu',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2013-09-07',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(20714,	0,	'MÃƒÂ¼sli ohne Rosinen ( Vollwert )',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2013-09-07',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(20724,	0,	'MÃƒÂ¼sli ohne Kokosflocken fÃƒÂ¼r Frieda und mich',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2013-09-07',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(20734,	0,	'Family Schoko Cappucchino',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	1.000,	'2013-09-07',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(20744,	0,	'Erbsen ( Dose )',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	1.000,	'2013-09-07',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(20754,	0,	'Pommes',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	1.000,	'2013-09-07',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(20764,	0,	'frische Hefe',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	1.000,	'2013-09-07',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(20774,	0,	'Rama cremefine zum kochen',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	1.000,	'2013-09-07',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(20784,	0,	'Toilettenpapier',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	1.000,	'2013-09-07',	'PFLEG',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(20794,	0,	'Butterbrotpapier',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	1.000,	'2013-09-07',	'HAUSHALT',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(20804,	0,	'Freilandeier',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	1.000,	'2013-09-07',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(20814,	0,	'Mehl Typ 405',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	1.000,	'2013-09-07',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(20824,	0,	'Kinderketchup',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	1.000,	'2013-09-07',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(20834,	0,	'Waschmaschinenpflege',	'',	'',	'',	'(ohne)',	'Kaufland',	1.00,	1.000,	'2013-09-07',	'HAUSHALT',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(20844,	0,	'SpÃƒÂ¼lmaschinen-Pflege',	'',	'',	'',	'(ohne)',	'Kaufland',	1.00,	1.000,	'2013-09-07',	'HAUSHALT',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(20854,	0,	'Einschulungspapier junge/mÃƒÂ¤dchen',	'',	'',	'',	'(ohne)',	'Kaufland',	1.00,	1.000,	'2013-09-07',	'GESCH',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(20864,	0,	'Colamix',	'',	'',	'',	'(ohne)',	'Penny',	1.00,	1.000,	'2013-09-07',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(20874,	0,	'H-Milch Palette',	'',	'',	'',	'(ohne)',	'Penny',	0.00,	1.000,	'2013-11-02',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(20884,	0,	'Nachthosen',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2013-11-02',	'KIND',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(20894,	0,	'Pilze',	'',	'',	'',	'(ohne)',	'Penny',	0.00,	1.000,	'2013-11-02',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(20904,	0,	'rote Paprika',	'',	'',	'',	'(ohne)',	'Penny',	0.00,	1.000,	'2013-11-02',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(20914,	0,	'Ãƒâ€pfel Braeburn',	'',	'',	'',	'Obst / GemÃƒÂ¼se',	'Aldi',	1.55,	1.000,	'2013-11-02',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(20924,	0,	'Baguette-BrÃƒÂ¶tchen',	'',	'',	'',	'Brotwaren',	'Aldi',	0.35,	1.000,	'2013-11-02',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(20934,	0,	'Bauernschnitt',	'',	'',	'',	'Brotwaren',	'Aldi',	0.55,	1.000,	'2013-11-02',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(20944,	0,	'Butter',	'',	'',	'',	'Milchprodukte',	'Aldi',	1.05,	1.000,	'2013-11-02',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(20954,	0,	'Buttermilch',	'',	'',	'',	'Milchprodukte',	'Aldi',	0.29,	1.000,	'2013-11-02',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(20964,	0,	'KÃƒÂ¤seaufschnitt',	'',	'',	'',	'Milchprodukte',	'Aldi',	0.99,	1.000,	'2013-11-02',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(20974,	0,	'Margarine',	'',	'',	'',	'Eierwaren',	'Aldi',	0.75,	3.000,	'2013-11-02',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(20984,	0,	'Milch (Frischmilch)',	'',	'',	'',	'Milchprodukte',	'Aldi',	0.50,	1.000,	'2013-11-02',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(20994,	0,	'Naschtomaten ( Mini )',	'',	'',	'',	'Obst / Gemuese',	'Aldi',	1.00,	1.000,	'2013-11-02',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(21004,	0,	'O-Saft',	'',	'',	'',	'GetrÃƒÂ¤nke',	'Aldi',	5.34,	1.000,	'2013-11-02',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(21014,	0,	'ReibekÃƒÂ¤se',	'',	'',	'',	'Milchprodukte',	'Aldi',	1.09,	1.000,	'2013-11-02',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(21024,	0,	'scharfer KÃƒÂ¤se',	'',	'',	'',	'Milchprodukte',	'Aldi',	1.59,	1.000,	'2013-11-02',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(21034,	0,	'Schlangengurke',	'',	'',	'',	'Obst / GemÃƒÂ¼se',	'Aldi',	0.30,	1.000,	'2013-11-02',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(21044,	0,	'Sojaschnitzel',	'',	'',	'',	'KÃƒÂ¼hltheke',	'Aldi',	1.79,	2.000,	'2013-11-02',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(21054,	0,	'Toastbrot',	'',	'',	'',	'Brotwaren',	'Aldi',	0.45,	1.000,	'2013-11-02',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(21064,	0,	'Tomaten',	'',	'',	'',	'Obst / GemÃƒÂ¼se',	'Aldi',	0.00,	1.000,	'2013-11-02',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(21074,	0,	'Kaffee fÃƒÂ¼r Bad Neustadt',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	1.000,	'2013-11-02',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(21084,	0,	'Tofuaufschnitt',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	1.000,	'2013-11-02',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(21094,	0,	'veg. Aufschnitt nach Wahl',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2013-11-02',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(21104,	0,	'veg. Pasteten',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	1.000,	'2013-11-02',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(21114,	0,	'Freilandeier',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	1.000,	'2013-11-02',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(21124,	0,	'HokkaidokÃƒÂ¼rbis',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	1.000,	'2013-11-02',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(21134,	0,	'Malblock ( blanko) fÃƒÂ¼r Frieda',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2013-11-02',	'KIND',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(21144,	0,	'Meridol MundspÃƒÂ¼llÃƒÂ¶sung',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2013-11-02',	'PFLEG',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(21154,	0,	'Kinderzahnpasta',	'',	'',	'',	'(ohne)',	'Penny',	0.00,	1.000,	'2013-11-16',	'PFLEG',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(21164,	0,	'Pilze',	'',	'',	'',	'(ohne)',	'Penny',	0.00,	1.000,	'2013-11-16',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(21174,	0,	'AufbackbrÃƒÂ¶tchen',	'',	'',	'',	'(ohne)',	'Penny',	0.00,	1.000,	'2013-11-16',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(21184,	0,	'Frischmilch',	'',	'',	'',	'(ohne)',	'Penny',	0.00,	1.000,	'2013-11-16',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(21194,	0,	'Toilettenpapier',	'',	'',	'',	'(ohne)',	'Penny',	0.00,	1.000,	'2013-11-16',	'HAUSHALT',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(21204,	0,	'RapsÃƒÂ¶l',	'',	'',	'',	'(ohne)',	'Penny',	0.00,	1.000,	'2013-11-16',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(21214,	0,	'rote Paprika',	'',	'',	'',	'(ohne)',	'Penny',	0.00,	1.000,	'2013-11-16',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(21224,	0,	'Mehl Typ 405',	'',	'',	'',	'(ohne)',	'Penny',	0.00,	1.000,	'2013-11-16',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(21234,	0,	'ganze Mandeln',	'',	'',	'',	'(ohne)',	'Penny',	0.00,	1.000,	'2013-11-16',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(21244,	0,	'Puderzucker',	'',	'',	'',	'(ohne)',	'Penny',	0.00,	1.000,	'2013-11-16',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(21254,	0,	'O Saft',	'',	'',	'',	'(ohne)',	'Penny',	0.00,	1.000,	'2013-11-16',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(21264,	0,	'Toilettenpapier',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	1.000,	'2013-12-06',	'HAUSHALT',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(21274,	0,	'Kaffeebohnen',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	1.000,	'2013-12-06',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(21284,	0,	'Zimt',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2013-12-06',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(21294,	0,	'Anis',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2013-12-06',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(21304,	0,	'Frischhaltefolie',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2013-12-06',	'HAUSHALT',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(21314,	0,	'Butter',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	1.000,	'2013-12-06',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(21324,	0,	'KÃƒÂ¼chentÃƒÂ¼cher',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	1.000,	'2013-12-06',	'HAUSHALT',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(21334,	0,	'SpÃƒÂ¼lmaschinen Tabs',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	1.000,	'2013-12-06',	'HAUSHALT',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(21344,	0,	'Kinderweihnachtsgeschenkpapier',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2013-12-06',	'KIND',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(21354,	0,	'Apfelschorle',	'',	'',	'',	'GetrÃƒÂ¤nke',	'Aldi',	0.39,	6.000,	'2013-12-06',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(21364,	0,	'Ãƒâ€pfel Braeburn',	'',	'',	'',	'Obst / GemÃƒÂ¼se',	'Aldi',	1.55,	1.000,	'2013-12-06',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(21374,	0,	'Baguette-BrÃƒÂ¶tchen',	'',	'',	'',	'Brotwaren',	'Aldi',	0.35,	1.000,	'2013-12-06',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(21384,	0,	'Bananen',	'',	'',	'',	'Obst / GemÃƒÂ¼se',	'Aldi',	0.89,	1.000,	'2013-12-06',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(21394,	0,	'Bauernschnitt',	'',	'',	'',	'Brotwaren',	'Aldi',	0.55,	1.000,	'2013-12-06',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(21404,	0,	'Bio Kartoffeln',	'',	'',	'',	'Obst / GemÃƒÂ¼se',	'Aldi',	1.69,	2.000,	'2013-12-06',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(21414,	0,	'Clementinen',	'',	'',	'',	'Obst / GemÃƒÂ¼se',	'Aldi',	1.99,	1.000,	'2013-12-06',	'HAUSHALT',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(21424,	0,	'GemÃƒÂ¼sebrÃƒÂ¼he',	'',	'',	'',	'GewÃƒÂ¼rze',	'Aldi',	0.59,	1.000,	'2013-12-06',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(21434,	0,	'KÃƒÂ¤seaufschnitt',	'',	'',	'',	'Milchprodukte',	'Aldi',	0.99,	1.000,	'2013-12-06',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(21444,	0,	'Margarine',	'',	'',	'',	'Eierwaren',	'Aldi',	0.75,	3.000,	'2013-12-06',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(21454,	0,	'Milch (Frischmilch)',	'',	'',	'',	'Milchprodukte',	'Aldi',	0.50,	1.000,	'2013-12-06',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(21464,	0,	'Naschtomaten ( Mini )',	'',	'',	'',	'Obst / Gemuese',	'Aldi',	1.00,	1.000,	'2013-12-06',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(21474,	0,	'O-Saft',	'',	'',	'',	'GetrÃƒÂ¤nke',	'Aldi',	5.34,	1.000,	'2013-12-06',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(21484,	0,	'Paprikaschoten rot',	'',	'',	'',	'Obst / GemÃƒÂ¼se',	'Aldi',	1.69,	1.000,	'2013-12-06',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(21494,	0,	'passierte tomaten',	'',	'',	'',	'',	'Aldi',	0.35,	1.000,	'2013-12-06',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(21504,	0,	'ReibekÃƒÂ¤se',	'',	'',	'',	'Milchprodukte',	'Aldi',	1.09,	1.000,	'2013-12-06',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(21514,	0,	'Sojaschnitzel',	'',	'',	'',	'KÃƒÂ¼hltheke',	'Aldi',	1.79,	2.000,	'2013-12-06',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(21524,	0,	'Toastbrot',	'',	'',	'',	'Brotwaren',	'Aldi',	0.45,	1.000,	'2013-12-06',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(21534,	0,	'Tomaten',	'',	'',	'',	'Obst / GemÃƒÂ¼se',	'Aldi',	0.00,	1.000,	'2013-12-06',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(21544,	0,	'HÃƒÂ¼ttenkÃƒÂ¤se',	'',	'',	'',	'Milchprodukte',	'Kaufland',	2.00,	1.000,	'2013-12-06',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(21554,	0,	'Shampoo Herbal fÃƒÂ¼r feines Haar',	'',	'',	'',	'',	'Kaufland',	0.00,	1.000,	'2013-12-06',	'PFLEG',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(21564,	0,	'Tofuaufschnitt',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	2.000,	'2013-12-06',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(21574,	0,	'veg Aufschnitt',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	2.000,	'2013-12-06',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(21584,	0,	'H Milch Palette',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2013-12-06',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(21594,	0,	'Mittagessen fÃƒÂ¼r Sonntag.........',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2013-12-06',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(21604,	0,	'Haferflocken',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	1.000,	'2013-12-06',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(21614,	0,	'Saftorangen',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	1.000,	'2013-12-06',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(21624,	0,	'loses Salz ( kein Streuer! )',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	1.000,	'2013-12-06',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(21634,	0,	'Marzipanrohmasse',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	1.000,	'2013-12-06',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(21644,	0,	'PlÃƒÂ¤tzchenschmuck ( bunte Perlen etc )',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2013-12-06',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(21654,	0,	'Butterbrotpapier zum abreissen',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2013-12-06',	'HAUSHALT',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(21664,	0,	'Tofu',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	1.000,	'2013-12-06',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(21674,	0,	'veg. BockwÃƒÂ¼rstchen',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2013-12-06',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(21684,	0,	'veg. BratwÃƒÂ¼rstchen',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	1.000,	'2013-12-06',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(21694,	0,	'Himbeersirup',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2013-12-06',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(21704,	0,	'Backpinsel',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2013-12-06',	'HAUSHALT',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(21714,	0,	'gute Hausschuhe fÃƒÂ¼r Frieda GrÃƒÂ¶ÃƒÅ¸e 30 ( fÃƒÂ¼r zu Hause )',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2013-12-06',	'KIND',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(21724,	0,	'Kardomon',	'',	'',	'',	'(ohne)',	'Kaufland',	1.00,	1.000,	'2013-12-06',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(21734,	0,	'LebkuchengewÃƒÂ¼rz',	'',	'',	'',	'(ohne)',	'Kaufland',	1.00,	1.000,	'2013-12-06',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(31263,	0,	'Eier 6stk',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	1.000,	'2013-12-07',	'LEBEN',	'',	0,	'offen',	'2013-12-07',	0,	'0000-00-00 00:00:00'),
(31173,	0,	'Honig',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	1.000,	'2013-12-07',	'LEBEN',	'',	0,	'offen',	'2013-12-07',	0,	'0000-00-00 00:00:00'),
(31053,	0,	'Margarine',	'',	'',	'',	'(ohne)',	'Aldi',	0.69,	1.000,	'2013-12-07',	'LEBEN',	'22112446',	0,	'offen',	'2013-12-07',	0,	'0000-00-00 00:00:00'),
(31253,	0,	'Marzipanrohmasse',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	1.000,	'2013-12-07',	'LEBEN',	'',	0,	'offen',	'2013-12-07',	0,	'0000-00-00 00:00:00'),
(31193,	0,	'Puderzucker',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	1.000,	'2013-12-07',	'LEBEN',	'',	0,	'offen',	'2013-12-07',	0,	'0000-00-00 00:00:00'),
(31203,	0,	'Senf',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	1.000,	'2013-12-07',	'LEBEN',	'',	0,	'offen',	'2013-12-07',	0,	'0000-00-00 00:00:00'),
(31223,	0,	'Tomatenmark',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	1.000,	'2013-12-07',	'LEBEN',	'',	0,	'offen',	'2013-12-07',	0,	'0000-00-00 00:00:00'),
(30993,	0,	'Baguette-BrÃƒÂ¶tchen',	'',	'',	'',	'Brotwaren',	'Aldi',	0.35,	1.000,	'2013-12-07',	'LEBEN',	'22115904',	0,	'offen',	'2013-12-07',	0,	'0000-00-00 00:00:00'),
(31003,	0,	'Bauernschnitt',	'',	'',	'',	'Brotwaren',	'Aldi',	0.59,	1.000,	'2013-12-07',	'LEBEN',	'29705108',	0,	'offen',	'2013-12-07',	0,	'0000-00-00 00:00:00'),
(31153,	0,	'Spiralinudeln',	'',	'',	'',	'Brotwaren',	'Aldi',	0.39,	1.000,	'2013-12-07',	'LEBEN',	'',	0,	'offen',	'2013-12-07',	0,	'0000-00-00 00:00:00'),
(31073,	0,	'Multivitaminsaft',	'',	'',	'',	'Getraenke',	'Aldi',	0.95,	0.000,	'2013-12-07',	'LEBEN',	'22131218',	0,	'offen',	'2013-12-07',	0,	'0000-00-00 00:00:00'),
(31093,	0,	'O-Saft',	'',	'',	'',	'Getraenke',	'Aldi',	0.95,	6.000,	'2013-12-07',	'LEBEN',	'22131201',	0,	'offen',	'2013-12-07',	0,	'0000-00-00 00:00:00'),
(31033,	0,	'GemÃƒÂ¼sebrÃƒÂ¼he',	'',	'',	'',	'Gewuerze',	'Aldi',	0.59,	1.000,	'2013-12-07',	'LEBEN',	'',	0,	'offen',	'2013-12-07',	0,	'0000-00-00 00:00:00'),
(31113,	0,	'passierte tomaten',	'',	'',	'',	'Konserven',	'Aldi',	0.35,	1.000,	'2013-12-07',	'LEBEN',	'22114235',	0,	'offen',	'2013-12-07',	0,	'0000-00-00 00:00:00'),
(31123,	0,	'RapsÃƒÂ¶l',	'',	'',	'',	'Konserven',	'Aldi',	0.95,	1.000,	'2013-12-07',	'LEBEN',	'',	0,	'offen',	'2013-12-07',	0,	'0000-00-00 00:00:00'),
(31143,	0,	'Sojaschnitzel',	'',	'',	'',	'Kuehltheke',	'Aldi',	1.79,	2.000,	'2013-12-07',	'LEBEN',	'',	0,	'offen',	'2013-12-07',	0,	'0000-00-00 00:00:00'),
(31043,	0,	'KÃƒÂ¤seaufschnitt',	'',	'',	'',	'Milchprodukte',	'Aldi',	1.15,	1.000,	'2013-12-07',	'LEBEN',	'22144225',	0,	'offen',	'2013-12-07',	0,	'0000-00-00 00:00:00'),
(31063,	0,	'Milch (Frischmilch)',	'',	'',	'',	'Milchprodukte',	'Aldi',	0.59,	1.000,	'2013-12-07',	'LEBEN',	'22130112',	0,	'offen',	'2013-12-07',	0,	'0000-00-00 00:00:00'),
(31133,	0,	'ReibekÃƒÂ¤se',	'',	'',	'',	'Milchprodukte',	'Aldi',	1.19,	1.000,	'2013-12-07',	'LEBEN',	'22126542',	0,	'offen',	'2013-12-07',	0,	'0000-00-00 00:00:00'),
(30983,	0,	'Ãƒâ€pfel Braeburn',	'',	'',	'',	'Obst / Gemuese',	'Aldi',	1.55,	1.000,	'2013-12-07',	'LEBEN',	'',	0,	'offen',	'2013-12-07',	0,	'0000-00-00 00:00:00'),
(31013,	0,	'Bio Kartoffeln',	'',	'',	'',	'Obst / Gemuese',	'Aldi',	1.99,	1.000,	'2013-12-07',	'LEBEN',	'4050373133986',	0,	'offen',	'2013-12-07',	0,	'0000-00-00 00:00:00'),
(31023,	0,	'Broccoli',	'',	'',	'',	'Obst / Gemuese',	'Aldi',	0.95,	1.000,	'2013-12-07',	'LEBEN',	'',	0,	'offen',	'2013-12-07',	0,	'0000-00-00 00:00:00'),
(31083,	0,	'Naschtomaten ( Mini )',	'',	'',	'',	'Obst / Gemuese',	'Aldi',	1.29,	1.000,	'2013-12-07',	'LEBEN',	'4049929247550',	0,	'offen',	'2013-12-07',	0,	'0000-00-00 00:00:00'),
(31103,	0,	'Paprikaschoten rot',	'',	'',	'',	'Obst / Gemuese',	'Aldi',	1.69,	1.000,	'2013-12-07',	'LEBEN',	'',	0,	'offen',	'2013-12-07',	0,	'0000-00-00 00:00:00'),
(31163,	0,	'Weintrauben kernlos',	'',	'',	'',	'Obst / Gemuese',	'Aldi',	1.49,	1.000,	'2013-12-07',	'LEBEN',	'',	0,	'offen',	'2013-12-07',	0,	'0000-00-00 00:00:00'),
(31243,	0,	'GeschenktÃƒÂ¼ten',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2013-12-07',	'GESCH',	'',	0,	'offen',	'2013-12-07',	0,	'0000-00-00 00:00:00'),
(31183,	0,	'KrÃƒÂ¤utersalz',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2013-12-07',	'LEBEN',	'',	0,	'offen',	'2013-12-07',	0,	'0000-00-00 00:00:00'),
(31233,	0,	'PfefferkÃƒÂ¶rner',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2013-12-07',	'LEBEN',	'',	0,	'offen',	'2013-12-07',	0,	'0000-00-00 00:00:00'),
(31213,	0,	'veg. Salami',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2013-12-07',	'LEBEN',	'',	0,	'offen',	'2013-12-07',	0,	'0000-00-00 00:00:00'),
(31274,	0,	'Ãƒâ€pfel Braeburn',	'',	'',	'',	'Obst / GemÃƒÂ¼se',	'Aldi',	1.55,	1.000,	'2013-12-27',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(31284,	0,	'Baguette-BrÃƒÂ¶tchen',	'',	'',	'',	'Brotwaren',	'Aldi',	0.35,	1.000,	'2013-12-27',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(31294,	0,	'Bauernschnitt',	'',	'',	'',	'Brotwaren',	'Aldi',	0.55,	1.000,	'2013-12-27',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(31304,	0,	'Bio Kartoffeln',	'',	'',	'',	'Obst / GemÃƒÂ¼se',	'Aldi',	1.69,	2.000,	'2013-12-27',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(31314,	0,	'Broccoli',	'',	'',	'',	'Obst / GemÃƒÂ¼se',	'Aldi',	0.95,	1.000,	'2013-12-27',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(31324,	0,	'Butter',	'',	'',	'',	'Milchprodukte',	'Aldi',	1.05,	1.000,	'2013-12-27',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(31334,	0,	'Clementinen',	'',	'',	'',	'Obst / GemÃƒÂ¼se',	'Aldi',	1.99,	1.000,	'2013-12-27',	'HAUSHALT',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(31344,	0,	'KÃƒÂ¤seaufschnitt',	'',	'',	'',	'Milchprodukte',	'Aldi',	0.99,	1.000,	'2013-12-27',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(31354,	0,	'Milch (Frischmilch)',	'',	'',	'',	'Milchprodukte',	'Aldi',	0.50,	1.000,	'2013-12-27',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(31364,	0,	'Paprikaschoten rot',	'',	'',	'',	'Obst / GemÃƒÂ¼se',	'Aldi',	1.69,	1.000,	'2013-12-27',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(31374,	0,	'ReibekÃƒÂ¤se',	'',	'',	'',	'Milchprodukte',	'Aldi',	1.09,	1.000,	'2013-12-27',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(31384,	0,	'Schlangengurke',	'',	'',	'',	'Obst / GemÃƒÂ¼se',	'Aldi',	0.30,	1.000,	'2013-12-27',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(31394,	0,	'Sojaschnitzel',	'',	'',	'',	'KÃƒÂ¼hltheke',	'Aldi',	1.79,	2.000,	'2013-12-27',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(31404,	0,	'Toastbrot',	'',	'',	'',	'Brotwaren',	'Aldi',	0.45,	1.000,	'2013-12-27',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(31414,	0,	'HÃƒÂ¼ttenkÃƒÂ¤se',	'',	'',	'',	'Milchprodukte',	'Kaufland',	2.00,	1.000,	'2013-12-27',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(31424,	0,	'Sofix fÃƒÂ¼r alle BÃƒÂ¶den',	'',	'',	'',	'Brotwaren',	'Kaufland',	0.00,	1.000,	'2013-12-27',	'HAUSHALT',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(31444,	0,	'Sojasauce',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2013-12-27',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(31454,	0,	'Freilandeier',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	1.000,	'2013-12-27',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(31464,	0,	'H Milch',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	4.000,	'2013-12-27',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(31474,	0,	'Kaffee',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	1.000,	'2013-12-27',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(31484,	0,	'Toilettenpapier',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	1.000,	'2013-12-27',	'HAUSHALT',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(31494,	0,	'veg. Aufschnitt nach Wahl',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2013-12-27',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(31504,	0,	'SpÃƒÂ¼lmaschinen Tabs',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	1.000,	'2013-12-27',	'HAUSHALT',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(31524,	0,	'Eisensaft',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2013-12-27',	'KIND',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(31534,	0,	'KÃƒÂ¤sepizza',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2013-12-27',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(31544,	0,	'hefe',	'',	'',	'',	'(ohne)',	'Penny',	0.00,	1.000,	'2013-12-28',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(31554,	0,	'kÃƒÂ¤se fÃƒÂ¼r pizza',	'',	'',	'',	'(ohne)',	'Penny',	0.00,	1.000,	'2013-12-28',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(31564,	0,	'ReibekÃƒÂ¤se',	'',	'',	'',	'(ohne)',	'Penny',	0.00,	1.000,	'2013-12-28',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(31574,	0,	'Brot',	'',	'',	'',	'(ohne)',	'Penny',	0.00,	1.000,	'2013-12-28',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(31584,	0,	'Frischmilch',	'',	'',	'',	'(ohne)',	'Penny',	0.00,	1.000,	'2013-12-28',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(31594,	0,	'BrÃƒÂ¶tchen',	'',	'',	'',	'(ohne)',	'Penny',	0.00,	1.000,	'2013-12-28',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(31604,	0,	'Eier',	'',	'',	'',	'(ohne)',	'Penny',	0.00,	1.000,	'2013-12-28',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(31614,	0,	'heller Sossenbinder',	'',	'',	'',	'(ohne)',	'Penny',	0.00,	1.000,	'2013-12-28',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(31624,	0,	'joghurt',	'',	'',	'',	'(ohne)',	'Penny',	0.00,	1.000,	'2013-12-28',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(31634,	0,	'Apfelschorle',	'',	'',	'',	'GetrÃƒÂ¤nke',	'Aldi',	0.39,	6.000,	'2014-01-02',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(31644,	0,	'Ãƒâ€pfel Braeburn',	'',	'',	'',	'Obst / GemÃƒÂ¼se',	'Aldi',	1.55,	1.000,	'2014-01-02',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(31654,	0,	'Baguette-BrÃƒÂ¶tchen',	'',	'',	'',	'Brotwaren',	'Aldi',	0.35,	1.000,	'2014-01-02',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(31664,	0,	'Bananen',	'',	'',	'',	'Obst / GemÃƒÂ¼se',	'Aldi',	0.89,	1.000,	'2014-01-02',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(31674,	0,	'Bio Kartoffeln',	'',	'',	'',	'Obst / GemÃƒÂ¼se',	'Aldi',	1.69,	2.000,	'2014-01-02',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(31684,	0,	'Butter',	'',	'',	'',	'Milchprodukte',	'Aldi',	1.05,	1.000,	'2014-01-02',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(31694,	0,	'Joghurt Natur',	'',	'',	'',	'Milchprodukte',	'Aldi',	0.55,	1.000,	'2014-01-02',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(31704,	0,	'KÃƒÂ¤seaufschnitt',	'',	'',	'',	'Milchprodukte',	'Aldi',	0.99,	1.000,	'2014-01-02',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(31714,	0,	'losen zucker',	'',	'',	'',	'Mehl / Zucker',	'Aldi',	0.00,	1.000,	'2014-01-02',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(31724,	0,	'Milch (Frischmilch)',	'',	'',	'',	'Milchprodukte',	'Aldi',	0.50,	1.000,	'2014-01-02',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(31734,	0,	'passierte tomaten',	'',	'',	'',	'',	'Aldi',	0.35,	1.000,	'2014-01-02',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(31744,	0,	'Miracle Whip Salatcreme',	'',	'',	'',	'(ohne)',	'Penny',	0.00,	1.000,	'2014-01-02',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(31754,	0,	'Senf',	'',	'',	'',	'(ohne)',	'Penny',	0.00,	1.000,	'2014-01-02',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(31764,	0,	'GewÃƒÂ¼rzgurken',	'',	'',	'',	'(ohne)',	'Penny',	0.00,	1.000,	'2014-01-02',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(31774,	0,	'Freilandeier',	'',	'',	'',	'(ohne)',	'Penny',	0.00,	1.000,	'2014-01-02',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(31784,	0,	'Silberreiniger',	'',	'',	'',	'(ohne)',	'Penny',	0.00,	1.000,	'2014-01-02',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(31794,	0,	'Kichererbsen ( Dose)',	'',	'',	'',	'(ohne)',	'Penny',	0.00,	2.000,	'2014-01-02',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(31804,	0,	'Petersilie',	'',	'',	'',	'(ohne)',	'Penny',	0.00,	1.000,	'2014-01-02',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(31814,	0,	'Nachthosen',	'',	'',	'',	'(ohne)',	'Penny',	0.00,	1.000,	'2014-01-02',	'PFLEG',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(31824,	0,	'Toilettenpapier',	'',	'',	'',	'(ohne)',	'Penny',	0.00,	1.000,	'2014-01-02',	'PFLEG',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(31834,	0,	'Tofuaufschnitt',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	1.000,	'2014-01-02',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(31844,	0,	'Mozarella groÃƒÅ¸',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	1.000,	'2014-01-02',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(31854,	0,	'Brot',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	1.000,	'2014-01-02',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(31864,	0,	'Curryketchup',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	1.000,	'2014-01-02',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(31874,	0,	'Apfelschorle',	'',	'',	'',	'GetrÃƒÂ¤nke',	'Aldi',	0.39,	6.000,	'2014-01-24',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(31884,	0,	'Ãƒâ€pfel Braeburn',	'',	'',	'',	'Obst / GemÃƒÂ¼se',	'Aldi',	1.55,	1.000,	'2014-01-24',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(31894,	0,	'Butter',	'',	'',	'',	'Milchprodukte',	'Aldi',	1.05,	1.000,	'2014-01-24',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(31904,	0,	'Paprikaschoten rot',	'',	'',	'',	'Obst / GemÃƒÂ¼se',	'Aldi',	1.69,	1.000,	'2014-01-24',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(31914,	0,	'Rahmspinat',	'',	'',	'',	'TiefkÃƒÂ¼hlkost',	'Aldi',	0.39,	1.000,	'2014-01-24',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(31924,	0,	'ReibekÃƒÂ¤se',	'',	'',	'',	'Milchprodukte',	'Aldi',	1.09,	1.000,	'2014-01-24',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(31934,	0,	'Spiralinudeln',	'',	'',	'',	'Nudeln',	'Aldi',	0.39,	2.000,	'2014-01-24',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(31944,	0,	'Sofix fÃƒÂ¼r alle BÃƒÂ¶den',	'',	'',	'',	'',	'REAL',	0.00,	1.000,	'2014-01-24',	'HAUSHALT',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(31954,	0,	'Tofuaufschnitt',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	2.000,	'2014-01-24',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(31964,	0,	'KnusperstÃƒÂ¤bchen veggi',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	2.000,	'2014-01-24',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(31974,	0,	'Toilettenpapier',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	1.000,	'2014-01-24',	'PFLEG',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(31984,	0,	'Brokkoli',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	1.000,	'2014-01-24',	'PFLEG',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(31994,	0,	'Baguette-BrÃƒÂ¶tchen',	'',	'',	'',	'Brotwaren',	'Aldi',	0.35,	1.000,	'2014-01-24',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(32004,	0,	'Bauernschnitt',	'',	'',	'',	'Brotwaren',	'Aldi',	0.55,	1.000,	'2014-01-24',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(32014,	0,	'passierte tomaten',	'',	'',	'',	'',	'Aldi',	0.35,	1.000,	'2014-01-24',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(32024,	0,	'Zahnpasta',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	1.000,	'2014-01-24',	'PFLEG',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(32034,	0,	'KÃƒÂ¼chentÃƒÂ¼cher',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	1.000,	'2014-02-01',	'HAUSHALT',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(32044,	0,	'Klopapier 3-4lagig',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	1.000,	'2014-02-01',	'HAUSHALT',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(32054,	0,	'Apfelschorle',	'',	'',	'',	'GetrÃƒÂ¤nke',	'Aldi',	0.39,	6.000,	'2014-02-01',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(32064,	0,	'Ãƒâ€pfel Braeburn',	'',	'',	'',	'Obst / GemÃƒÂ¼se',	'Aldi',	1.55,	1.000,	'2014-02-01',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(32074,	0,	'Baguette-BrÃƒÂ¶tchen',	'',	'',	'',	'Brotwaren',	'Aldi',	0.35,	1.000,	'2014-02-01',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(32084,	0,	'Bauernschnitt',	'',	'',	'',	'Brotwaren',	'Aldi',	0.55,	1.000,	'2014-02-01',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(32094,	0,	'Bio Kartoffeln',	'',	'',	'',	'Obst / GemÃƒÂ¼se',	'Aldi',	1.69,	2.000,	'2014-02-01',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(32104,	0,	'GemÃƒÂ¼sebrÃƒÂ¼he',	'',	'',	'',	'GewÃƒÂ¼rze',	'Aldi',	0.59,	1.000,	'2014-02-01',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(32114,	0,	'Joghurt Natur',	'',	'',	'',	'Milchprodukte',	'Aldi',	0.55,	1.000,	'2014-02-01',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(32124,	0,	'KÃƒÂ¤seaufschnitt',	'',	'',	'',	'Milchprodukte',	'Aldi',	0.99,	1.000,	'2014-02-01',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(32134,	0,	'Magerquark',	'',	'',	'',	'Milchprodukte',	'Aldi',	0.55,	1.000,	'2014-02-01',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(32144,	0,	'Milch (Frischmilch)',	'',	'',	'',	'Milchprodukte',	'Aldi',	0.50,	1.000,	'2014-02-01',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(32154,	0,	'O-Saft',	'',	'',	'',	'GetrÃƒÂ¤nke',	'Aldi',	5.34,	1.000,	'2014-02-01',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(32164,	0,	'Paprikaschoten rot',	'',	'',	'',	'Obst / GemÃƒÂ¼se',	'Aldi',	1.69,	1.000,	'2014-02-01',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(32174,	0,	'passierte tomaten',	'',	'',	'',	'',	'Aldi',	0.35,	1.000,	'2014-02-01',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(32184,	0,	'Schlangengurke',	'',	'',	'',	'Obst / GemÃƒÂ¼se',	'Aldi',	0.30,	1.000,	'2014-02-01',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(32194,	0,	'Sojaschnitzel',	'',	'',	'',	'KÃƒÂ¼hltheke',	'Aldi',	1.79,	2.000,	'2014-02-01',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(32204,	0,	'Spiralinudeln',	'',	'',	'',	'Nudeln',	'Aldi',	0.39,	2.000,	'2014-02-01',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(32214,	0,	'Toastbrot',	'',	'',	'',	'Brotwaren',	'Aldi',	0.45,	1.000,	'2014-02-01',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(32224,	0,	'Tomaten',	'',	'',	'',	'Obst / GemÃƒÂ¼se',	'Aldi',	0.00,	1.000,	'2014-02-01',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(32234,	0,	'HÃƒÂ¼ttenkÃƒÂ¤se',	'',	'',	'',	'Milchprodukte',	'Kaufland',	2.00,	1.000,	'2014-02-01',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(32244,	0,	'Sofix fÃƒÂ¼r alle BÃƒÂ¶den',	'',	'',	'',	'Brotwaren',	'Kaufland',	0.00,	1.000,	'2014-02-01',	'HAUSHALT',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(32254,	0,	'H Milch Palette',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	1.000,	'2014-02-01',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(32264,	0,	'Lasagneplatten',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	1.000,	'2014-02-01',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(32274,	0,	'Linsen ( braun - Tellerlinsen )',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2014-02-01',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(32284,	0,	'Sojagranulat',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2014-02-01',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(32294,	0,	'Butterbrotpapier zum abreissen',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2014-02-01',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(32304,	0,	'Butter',	'',	'',	'',	'Milchprodukte',	'Aldi',	1.05,	1.000,	'2014-02-01',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(32314,	0,	'ReibekÃƒÂ¤se',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	1.000,	'2014-02-01',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(32324,	0,	'Orangenwasser',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2014-02-01',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(32334,	0,	'SpÃƒÂ¼lmaschinen Pulver ( statt Tabs )',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2014-02-01',	'HAUSHALT',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(32344,	0,	'Nachthosen',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2014-02-01',	'KIND',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(32354,	0,	'Sojasauce',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2014-02-01',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(32364,	0,	'Taschenlampe fÃƒÂ¼r Frieda',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2014-02-01',	'KIND',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(32374,	0,	'WattestÃƒÂ¤bchen',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2014-02-01',	'PFLEG',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(32384,	0,	'Fruchtjoghurt',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2014-02-01',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(32394,	0,	'Tofuaufschnitt',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	2.000,	'2014-02-01',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(32404,	0,	'veg. Aufschnitte',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2014-02-01',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(32414,	0,	'Ãƒâ€pfel Braeburn',	'',	'',	'',	'Obst / Gemuese',	'Aldi',	1.55,	1.000,	'2014-03-08',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(32424,	0,	'Baguette-BrÃƒÂ¶tchen',	'',	'',	'',	'Brotwaren',	'Aldi',	0.35,	1.000,	'2014-03-08',	'LEBEN',	'22115904',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(32434,	0,	'Bananen',	'',	'',	'',	'Obst / Gemuese',	'Aldi',	0.89,	1.000,	'2014-03-08',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(32444,	0,	'Bauernschnitt',	'',	'',	'',	'Brotwaren',	'Aldi',	0.59,	1.000,	'2014-03-08',	'LEBEN',	'29705108',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(32454,	0,	'Bio Kartoffeln',	'',	'',	'',	'Obst / Gemuese',	'Aldi',	1.79,	1.000,	'2014-03-08',	'LEBEN',	'4050373133986',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(32464,	0,	'Butter',	'',	'',	'',	'Milchprodukte',	'Aldi',	1.19,	1.000,	'2014-03-08',	'LEBEN',	'22116505',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(32474,	0,	'H-Milch',	'',	'',	'',	'Milchprodukte',	'Aldi',	0.59,	1.000,	'2014-03-08',	'LEBEN',	'22116413',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(32484,	0,	'Joghurt Natur',	'',	'',	'',	'Milchprodukte',	'Aldi',	0.55,	1.000,	'2014-03-08',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(32494,	0,	'KÃƒÂ¤seaufschnitt',	'',	'',	'',	'Milchprodukte',	'Aldi',	1.39,	1.000,	'2014-03-08',	'LEBEN',	'22144225',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(32504,	0,	'Kiwi',	'',	'',	'',	'Obst / Gemuese',	'Aldi',	1.29,	1.000,	'2014-03-08',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(32514,	0,	'KnÃƒÂ¤ckebrot',	'',	'',	'',	'Brotwaren',	'Aldi',	1.00,	1.000,	'2014-03-08',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(32524,	0,	'Milch (Frischmilch)',	'',	'',	'',	'Milchprodukte',	'Aldi',	0.65,	1.000,	'2014-03-08',	'LEBEN',	'22130112',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(32534,	0,	'Multivitaminsaft',	'',	'',	'',	'Getraenke',	'Aldi',	0.95,	6.000,	'2014-03-08',	'LEBEN',	'22131218',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(32544,	0,	'Paprikaschoten rot',	'',	'',	'',	'Obst / Gemuese',	'Aldi',	1.69,	1.000,	'2014-03-08',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(32554,	0,	'passierte tomaten',	'',	'',	'',	'Konserven',	'Aldi',	0.35,	1.000,	'2014-03-08',	'LEBEN',	'22114235',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(32564,	0,	'Rahmspinat',	'',	'',	'',	'Tiefkuehlkost',	'Aldi',	0.39,	1.000,	'2014-03-08',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(32574,	0,	'RapsÃƒÂ¶l',	'',	'',	'',	'Konserven',	'Aldi',	0.95,	1.000,	'2014-03-08',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(32584,	0,	'ReibekÃƒÂ¤se',	'',	'',	'',	'Milchprodukte',	'Aldi',	1.19,	1.000,	'2014-03-08',	'LEBEN',	'22126542',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(32594,	0,	'Sojaschnitzel',	'',	'',	'',	'KÃƒÂ¼hltheke',	'Aldi',	1.79,	2.000,	'2014-03-08',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(32604,	0,	'Spiralinudeln',	'',	'',	'',	'Brotwaren',	'Aldi',	0.49,	1.000,	'2014-03-08',	'LEBEN',	'22111326',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(32614,	0,	'Traubenschorle',	'',	'',	'',	'Getraenke',	'Aldi',	0.89,	6.000,	'2014-03-08',	'LEBEN',	'42141167',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(32624,	0,	'Duschdas Palmoliv absolute relax',	'',	'',	'',	'Koerperpflege',	'Kaufland',	1.00,	1.000,	'2014-03-08',	'PFLEG',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(32634,	0,	'HÃƒÂ¼ttenkÃƒÂ¤se',	'',	'',	'',	'Milchprodukte',	'Kaufland',	2.00,	1.000,	'2014-03-08',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(32644,	0,	'Orangenwasser',	'',	'',	'',	'Getraenke',	'Kaufland',	0.49,	6.000,	'2014-03-08',	'LEBEN',	'4300175374170',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(32654,	0,	'H Milch Palette',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	1.000,	'2014-03-08',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(32664,	0,	'Paprika edelsÃƒÂ¼ÃƒÅ¸',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	1.000,	'2014-03-08',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(32674,	0,	'schwarze PfefferkÃƒÂ¶rner',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	1.000,	'2014-03-08',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(32684,	0,	'Veg Aufschnitte',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2014-03-08',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(32694,	0,	'veg. Pasteten',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	4.000,	'2014-03-08',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(32704,	0,	'Selleriesalat',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	1.000,	'2014-03-08',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(32714,	0,	'Erdbeermilchpulver',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2014-03-08',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(32724,	0,	'veg. gefÃƒÂ¼llte Schnitzel',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2014-03-08',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(32734,	0,	'Kohlrabi',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2014-03-08',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(32744,	0,	'Ricola Bonbons Zuckerfrei',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2014-03-08',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(32754,	0,	'RÃƒÂ¤uchertofu',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2014-03-08',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(32764,	0,	'Schupfnudeln',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2014-03-08',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(32774,	0,	'frische Champignons',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2014-03-08',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(32784,	0,	'Sojasauce',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2014-03-08',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(32794,	0,	'Kaffeebohnen',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2014-03-08',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(32804,	0,	'Ãƒâ€pfel Braeburn',	'',	'',	'',	'Obst / Gemuese',	'Aldi',	1.55,	1.000,	'2014-03-15',	'LEBEN',	'',	0,	'offen',	'2014-03-15',	0,	'0000-00-00 00:00:00'),
(32814,	0,	'Baguette-BrÃƒÂ¶tchen',	'',	'',	'',	'Brotwaren',	'Aldi',	0.35,	1.000,	'2014-03-15',	'LEBEN',	'22115904',	0,	'offen',	'2014-03-15',	0,	'0000-00-00 00:00:00'),
(32824,	0,	'Bauernschnitt',	'',	'',	'',	'Brotwaren',	'Aldi',	0.59,	1.000,	'2014-03-15',	'LEBEN',	'29705108',	0,	'offen',	'2014-03-15',	0,	'0000-00-00 00:00:00'),
(32834,	0,	'Butter',	'',	'',	'',	'Milchprodukte',	'Aldi',	1.19,	1.000,	'2014-03-15',	'LEBEN',	'22116505',	0,	'offen',	'2014-03-15',	0,	'0000-00-00 00:00:00'),
(32844,	0,	'Calciumbrause',	'',	'',	'',	'Windeln',	'Aldi',	0.69,	1.000,	'2014-03-15',	'',	'',	0,	'offen',	'2014-03-15',	0,	'0000-00-00 00:00:00'),
(32854,	0,	'GemÃƒÂ¼sebrÃƒÂ¼he',	'',	'',	'',	'Gewuerze',	'Aldi',	0.59,	1.000,	'2014-03-15',	'LEBEN',	'',	0,	'offen',	'2014-03-15',	0,	'0000-00-00 00:00:00'),
(32864,	0,	'H-Milch',	'',	'',	'',	'Milchprodukte',	'Aldi',	0.59,	1.000,	'2014-03-15',	'LEBEN',	'22116413',	0,	'offen',	'2014-03-15',	0,	'0000-00-00 00:00:00'),
(32874,	0,	'KÃƒÂ¤seaufschnitt',	'',	'',	'',	'Milchprodukte',	'Aldi',	1.39,	1.000,	'2014-03-15',	'LEBEN',	'22144225',	0,	'offen',	'2014-03-15',	0,	'0000-00-00 00:00:00'),
(32884,	0,	'KnÃƒÂ¤ckebrot',	'',	'',	'',	'Brotwaren',	'Aldi',	1.00,	1.000,	'2014-03-15',	'LEBEN',	'',	0,	'offen',	'2014-03-15',	0,	'0000-00-00 00:00:00'),
(32894,	0,	'Margarine',	'',	'',	'',	'(ohne)',	'Aldi',	0.69,	1.000,	'2014-03-15',	'LEBEN',	'22112446',	0,	'offen',	'2014-03-15',	0,	'0000-00-00 00:00:00'),
(32904,	0,	'Milch (Frischmilch)',	'',	'',	'',	'Milchprodukte',	'Aldi',	0.65,	1.000,	'2014-03-15',	'LEBEN',	'22130112',	0,	'offen',	'2014-03-15',	0,	'0000-00-00 00:00:00'),
(32914,	0,	'Multivitaminsaft',	'',	'',	'',	'Getraenke',	'Aldi',	0.95,	6.000,	'2014-03-15',	'LEBEN',	'22131218',	0,	'offen',	'2014-03-15',	0,	'0000-00-00 00:00:00'),
(32924,	0,	'Naschtomaten ( Mini )',	'',	'',	'',	'Obst / Gemuese',	'Aldi',	2.49,	1.000,	'2014-03-15',	'LEBEN',	'4049929247550',	0,	'offen',	'2014-03-15',	0,	'0000-00-00 00:00:00'),
(32934,	0,	'passierte tomaten',	'',	'',	'',	'Konserven',	'Aldi',	0.35,	1.000,	'2014-03-15',	'LEBEN',	'22114235',	0,	'offen',	'2014-03-15',	0,	'0000-00-00 00:00:00'),
(32944,	0,	'RapsÃƒÂ¶l',	'',	'',	'',	'Konserven',	'Aldi',	0.95,	1.000,	'2014-03-15',	'LEBEN',	'',	0,	'offen',	'2014-03-15',	0,	'0000-00-00 00:00:00'),
(32954,	0,	'Schlangengurke',	'',	'',	'',	'Obst / Gemuese',	'Aldi',	0.30,	1.000,	'2014-03-15',	'LEBEN',	'',	0,	'offen',	'2014-03-15',	0,	'0000-00-00 00:00:00'),
(32964,	0,	'Sojaschnitzel',	'',	'',	'',	'KÃƒÂ¼hltheke',	'Aldi',	1.79,	2.000,	'2014-03-15',	'LEBEN',	'',	0,	'offen',	'2014-03-15',	0,	'0000-00-00 00:00:00'),
(32974,	0,	'Spiralinudeln',	'',	'',	'',	'Brotwaren',	'Aldi',	0.49,	1.000,	'2014-03-15',	'LEBEN',	'22111326',	0,	'offen',	'2014-03-15',	0,	'0000-00-00 00:00:00'),
(32984,	0,	'Tofuaufschnitt',	'',	'',	'',	'Milchprodukte',	'Aldi',	1.79,	1.000,	'2014-03-15',	'LEBEN',	'22144515',	0,	'offen',	'2014-03-15',	0,	'0000-00-00 00:00:00'),
(32994,	0,	'HÃƒÂ¼ttenkÃƒÂ¤se',	'',	'',	'',	'Milchprodukte',	'Kaufland',	2.00,	1.000,	'2014-03-15',	'LEBEN',	'',	0,	'offen',	'2014-03-15',	0,	'0000-00-00 00:00:00'),
(33004,	0,	'Orangenwasser',	'',	'',	'',	'Getraenke',	'Kaufland',	0.49,	6.000,	'2014-03-15',	'LEBEN',	'4300175374170',	0,	'offen',	'2014-03-15',	0,	'0000-00-00 00:00:00'),
(33014,	0,	'Sofix fÃƒÂ¼r alle BÃƒÂ¶den',	'',	'',	'',	'Haushalt / Putzmittel',	'Kaufland',	4.45,	1.000,	'2014-03-15',	'HAUSHALT',	'4015000019927',	0,	'offen',	'2014-03-15',	0,	'0000-00-00 00:00:00'),
(33024,	0,	'Cappucchino Family Schoko',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	1.000,	'2014-03-15',	'LEBEN',	'',	0,	'offen',	'2014-03-15',	0,	'0000-00-00 00:00:00'),
(33034,	0,	'veg Pasteten',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	4.000,	'2014-03-15',	'LEBEN',	'',	0,	'offen',	'2014-03-15',	0,	'0000-00-00 00:00:00'),
(33044,	0,	'Linsen Curry Pastete',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	1.000,	'2014-03-15',	'LEBEN',	'',	0,	'offen',	'2014-03-15',	0,	'0000-00-00 00:00:00'),
(33054,	0,	'veg. Aufschnitt nach Wahl',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	3.000,	'2014-03-15',	'LEBEN',	'',	0,	'offen',	'2014-03-15',	0,	'0000-00-00 00:00:00'),
(33064,	0,	'FrischkÃƒÂ¤se natur light',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	1.000,	'2014-03-15',	'LEBEN',	'',	0,	'offen',	'2014-03-15',	0,	'0000-00-00 00:00:00'),
(33074,	0,	'Gerolsteiner Moment mit Roibuschtee',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2014-03-15',	'LEBEN',	'',	0,	'offen',	'2014-03-15',	0,	'0000-00-00 00:00:00'),
(33084,	0,	'SÃƒÂ¼ÃƒÅ¸stoff',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2014-03-15',	'LEBEN',	'',	0,	'offen',	'2014-03-15',	0,	'0000-00-00 00:00:00'),
(33094,	0,	'Rote Beete im Glas',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2014-03-15',	'LEBEN',	'',	0,	'offen',	'2014-03-15',	0,	'0000-00-00 00:00:00'),
(33104,	0,	'Selleriesalat',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2014-03-15',	'LEBEN',	'',	0,	'offen',	'2014-03-15',	0,	'0000-00-00 00:00:00'),
(33114,	0,	'Thymian getrocknet',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2014-03-15',	'LEBEN',	'',	0,	'offen',	'2014-03-15',	0,	'0000-00-00 00:00:00'),
(33124,	0,	'destilliertes Wasser',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2014-03-15',	'HAUSHALT',	'',	0,	'offen',	'2014-03-15',	0,	'0000-00-00 00:00:00'),
(33134,	0,	'WC Duftgel',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2014-03-29',	'HAUSHALT',	'',	0,	'offen',	'2014-03-22',	0,	'0000-00-00 00:00:00'),
(33144,	0,	'SpÃƒÂ¼lmaschinen Pulver ( statt Tabs )',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2014-03-29',	'HAUSHALT',	'',	0,	'offen',	'2014-03-22',	0,	'0000-00-00 00:00:00'),
(33154,	0,	'Ãƒâ€pfel Braeburn',	'',	'',	'',	'Obst / Gemuese',	'Aldi',	1.55,	1.000,	'2014-03-29',	'LEBEN',	'',	0,	'offen',	'2014-03-22',	0,	'0000-00-00 00:00:00'),
(33164,	0,	'Bananen',	'',	'',	'',	'Obst / Gemuese',	'Aldi',	0.89,	1.000,	'2014-03-29',	'LEBEN',	'',	0,	'offen',	'2014-03-22',	0,	'0000-00-00 00:00:00'),
(33174,	0,	'Bauernschnitt',	'',	'',	'',	'Brotwaren',	'Aldi',	0.59,	1.000,	'2014-03-29',	'LEBEN',	'29705108',	0,	'offen',	'2014-03-22',	0,	'0000-00-00 00:00:00'),
(33184,	0,	'Bio Kartoffeln',	'',	'',	'',	'Obst / Gemuese',	'Aldi',	1.79,	1.000,	'2014-03-29',	'LEBEN',	'4050373133986',	0,	'offen',	'2014-03-22',	0,	'0000-00-00 00:00:00'),
(33194,	0,	'H-Milch',	'',	'',	'',	'Milchprodukte',	'Aldi',	0.59,	1.000,	'2014-03-29',	'LEBEN',	'22116413',	0,	'offen',	'2014-03-22',	0,	'0000-00-00 00:00:00'),
(33204,	0,	'Joghurt Natur',	'',	'',	'',	'Milchprodukte',	'Aldi',	0.55,	1.000,	'2014-03-29',	'LEBEN',	'',	0,	'offen',	'2014-03-22',	0,	'0000-00-00 00:00:00'),
(33214,	0,	'KÃƒÂ¤seaufschnitt',	'',	'',	'',	'Milchprodukte',	'Aldi',	1.39,	1.000,	'2014-03-29',	'LEBEN',	'22144225',	0,	'offen',	'2014-03-22',	0,	'0000-00-00 00:00:00'),
(33224,	0,	'Magerquark',	'',	'',	'',	'Milchprodukte',	'Aldi',	0.55,	1.000,	'2014-03-29',	'LEBEN',	'',	0,	'offen',	'2014-03-22',	0,	'0000-00-00 00:00:00'),
(33234,	0,	'Margarine',	'',	'',	'',	'(ohne)',	'Aldi',	0.69,	1.000,	'2014-03-29',	'LEBEN',	'22112446',	0,	'offen',	'2014-03-22',	0,	'0000-00-00 00:00:00'),
(33244,	0,	'Milch (Frischmilch)',	'',	'',	'',	'Milchprodukte',	'Aldi',	0.65,	1.000,	'2014-03-29',	'LEBEN',	'22130112',	0,	'offen',	'2014-03-22',	0,	'0000-00-00 00:00:00'),
(33254,	0,	'Multivitaminsaft',	'',	'',	'',	'Getraenke',	'Aldi',	0.95,	6.000,	'2014-03-29',	'LEBEN',	'22131218',	0,	'offen',	'2014-03-22',	0,	'0000-00-00 00:00:00'),
(33264,	0,	'Naschtomaten ( Mini )',	'',	'',	'',	'Obst / Gemuese',	'Aldi',	2.49,	1.000,	'2014-03-29',	'LEBEN',	'4049929247550',	0,	'offen',	'2014-03-22',	0,	'0000-00-00 00:00:00'),
(33274,	0,	'O-Saft',	'',	'',	'',	'Getraenke',	'Aldi',	0.95,	6.000,	'2014-03-29',	'LEBEN',	'22131201',	0,	'offen',	'2014-03-22',	0,	'0000-00-00 00:00:00'),
(33284,	0,	'Paprikaschoten rot',	'',	'',	'',	'Obst / Gemuese',	'Aldi',	1.69,	1.000,	'2014-03-29',	'LEBEN',	'',	0,	'offen',	'2014-03-22',	0,	'0000-00-00 00:00:00'),
(33294,	0,	'passierte tomaten',	'',	'',	'',	'Konserven',	'Aldi',	0.35,	1.000,	'2014-03-29',	'LEBEN',	'22114235',	0,	'offen',	'2014-03-22',	0,	'0000-00-00 00:00:00'),
(33304,	0,	'Rahmspinat',	'',	'',	'',	'Tiefkuehlkost',	'Aldi',	0.39,	1.000,	'2014-03-29',	'LEBEN',	'',	0,	'offen',	'2014-03-22',	0,	'0000-00-00 00:00:00'),
(33314,	0,	'Schlangengurke',	'',	'',	'',	'Obst / Gemuese',	'Aldi',	0.30,	1.000,	'2014-03-29',	'LEBEN',	'',	0,	'offen',	'2014-03-22',	0,	'0000-00-00 00:00:00'),
(33324,	0,	'Sojaschnitzel',	'',	'',	'',	'KÃƒÂ¼hltheke',	'Aldi',	1.79,	2.000,	'2014-03-29',	'LEBEN',	'',	0,	'offen',	'2014-03-22',	0,	'0000-00-00 00:00:00'),
(33334,	0,	'Tofuaufschnitt',	'',	'',	'',	'Milchprodukte',	'Aldi',	1.79,	1.000,	'2014-03-29',	'LEBEN',	'22144515',	0,	'offen',	'2014-03-22',	0,	'0000-00-00 00:00:00'),
(33344,	0,	'Tomaten',	'',	'',	'',	'Obst / Gemuese',	'Aldi',	1.00,	1.000,	'2014-03-29',	'LEBEN',	'',	0,	'offen',	'2014-03-22',	0,	'0000-00-00 00:00:00'),
(33354,	0,	'Traubenschorle',	'',	'',	'',	'Getraenke',	'Aldi',	0.89,	6.000,	'2014-03-29',	'LEBEN',	'42141167',	0,	'offen',	'2014-03-22',	0,	'0000-00-00 00:00:00'),
(33364,	0,	'HÃƒÂ¼ttenkÃƒÂ¤se',	'',	'',	'',	'Milchprodukte',	'Kaufland',	2.00,	1.000,	'2014-03-29',	'LEBEN',	'',	0,	'offen',	'2014-03-22',	0,	'0000-00-00 00:00:00'),
(33374,	0,	'Orangenwasser',	'',	'',	'',	'Getraenke',	'Kaufland',	0.49,	6.000,	'2014-03-29',	'LEBEN',	'4300175374170',	0,	'offen',	'2014-03-22',	0,	'0000-00-00 00:00:00'),
(33384,	0,	'Risottoreis',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2014-03-29',	'LEBEN',	'',	0,	'offen',	'2014-03-22',	0,	'0000-00-00 00:00:00'),
(33394,	0,	'rote Linsen',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2014-03-29',	'LEBEN',	'',	0,	'offen',	'2014-03-22',	0,	'0000-00-00 00:00:00'),
(33404,	0,	'ReibekÃƒÂ¤se',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	1.000,	'2014-03-29',	'LEBEN',	'',	0,	'offen',	'2014-03-22',	0,	'0000-00-00 00:00:00'),
(33414,	0,	'3 rote Paprika groÃƒÅ¸ zum fÃƒÂ¼llen:-)',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2014-03-29',	'LEBEN',	'',	0,	'offen',	'2014-03-22',	0,	'0000-00-00 00:00:00'),
(33424,	0,	'roter Traubensaft',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2014-03-29',	'LEBEN',	'',	0,	'offen',	'2014-03-22',	0,	'0000-00-00 00:00:00'),
(33434,	0,	'Idealreis',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2014-03-29',	'LEBEN',	'',	0,	'offen',	'2014-03-22',	0,	'0000-00-00 00:00:00'),
(33444,	0,	'veg Pasteten',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	2.000,	'2014-03-29',	'LEBEN',	'',	0,	'offen',	'2014-03-22',	0,	'0000-00-00 00:00:00'),
(33454,	0,	'Veg Aufschnitte',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2014-03-29',	'LEBEN',	'',	0,	'offen',	'2014-03-22',	0,	'0000-00-00 00:00:00'),
(33464,	0,	'Kinderschaumbad fÃƒÂ¼r Frieda',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2014-03-29',	'PFLEG',	'',	0,	'offen',	'2014-03-22',	0,	'0000-00-00 00:00:00'),
(33474,	0,	'KÃƒÂ¼chentÃƒÂ¼cher',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2014-03-29',	'HAUSHALT',	'',	0,	'offen',	'2014-03-22',	0,	'0000-00-00 00:00:00'),
(33484,	0,	'Curry',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	1.000,	'2014-03-29',	'LEBEN',	'',	0,	'offen',	'2014-03-22',	0,	'0000-00-00 00:00:00'),
(33494,	0,	'schwarze PfefferkÃƒÂ¶rner',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	1.000,	'2014-03-29',	'LEBEN',	'',	0,	'offen',	'2014-03-22',	0,	'0000-00-00 00:00:00'),
(33504,	0,	'Sojasauce',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	1.000,	'2014-03-29',	'LEBEN',	'',	0,	'offen',	'2014-03-22',	0,	'0000-00-00 00:00:00'),
(33514,	0,	'Fruchtjoghurt',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	1.000,	'2014-03-29',	'LEBEN',	'',	0,	'offen',	'2014-03-22',	0,	'0000-00-00 00:00:00'),
(33524,	0,	'Zucchini',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	1.000,	'2014-03-29',	'LEBEN',	'',	0,	'offen',	'2014-03-22',	0,	'0000-00-00 00:00:00'),
(33534,	0,	'Rote Beete im Glas',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	1.000,	'2014-03-29',	'LEBEN',	'',	0,	'offen',	'2014-03-22',	0,	'0000-00-00 00:00:00'),
(33544,	0,	'Puztasalat im Glas',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	1.000,	'2014-03-29',	'LEBEN',	'',	0,	'offen',	'2014-03-22',	0,	'0000-00-00 00:00:00'),
(33554,	0,	'Ãƒâ€pfel Braeburn',	'',	'',	'',	'Obst / Gemuese',	'Aldi',	1.55,	1.000,	'2014-04-05',	'LEBEN',	'',	0,	'offen',	'2014-04-05',	0,	'0000-00-00 00:00:00'),
(33564,	0,	'Baguette-BrÃƒÂ¶tchen',	'',	'',	'',	'Brotwaren',	'Aldi',	0.35,	1.000,	'2014-04-05',	'LEBEN',	'22115904',	0,	'offen',	'2014-04-05',	0,	'0000-00-00 00:00:00'),
(33574,	0,	'Bananen',	'',	'',	'',	'Obst / Gemuese',	'Aldi',	0.89,	1.000,	'2014-04-05',	'LEBEN',	'',	0,	'offen',	'2014-04-05',	0,	'0000-00-00 00:00:00'),
(33584,	0,	'Butter',	'',	'',	'',	'Milchprodukte',	'Aldi',	1.19,	1.000,	'2014-04-05',	'LEBEN',	'22116505',	0,	'offen',	'2014-04-05',	0,	'0000-00-00 00:00:00'),
(33594,	0,	'Calciumbrause',	'',	'',	'',	'Windeln',	'Aldi',	0.69,	1.000,	'2014-04-05',	'',	'',	0,	'offen',	'2014-04-05',	0,	'0000-00-00 00:00:00'),
(33604,	0,	'H-Milch',	'',	'',	'',	'Milchprodukte',	'Aldi',	0.59,	1.000,	'2014-04-05',	'LEBEN',	'22116413',	0,	'offen',	'2014-04-05',	0,	'0000-00-00 00:00:00'),
(33614,	0,	'KÃƒÂ¤seaufschnitt',	'',	'',	'',	'Milchprodukte',	'Aldi',	1.39,	1.000,	'2014-04-05',	'LEBEN',	'22144225',	0,	'offen',	'2014-04-05',	0,	'0000-00-00 00:00:00'),
(33624,	0,	'Kiwi',	'',	'',	'',	'Obst / Gemuese',	'Aldi',	1.29,	1.000,	'2014-04-05',	'LEBEN',	'',	0,	'offen',	'2014-04-05',	0,	'0000-00-00 00:00:00'),
(33634,	0,	'KnÃƒÂ¤ckebrot',	'',	'',	'',	'Brotwaren',	'Aldi',	1.00,	1.000,	'2014-04-05',	'LEBEN',	'',	0,	'offen',	'2014-04-05',	0,	'0000-00-00 00:00:00'),
(33644,	0,	'Milch (Frischmilch)',	'',	'',	'',	'Milchprodukte',	'Aldi',	0.65,	1.000,	'2014-04-05',	'LEBEN',	'22130112',	0,	'offen',	'2014-04-05',	0,	'0000-00-00 00:00:00'),
(33654,	0,	'Multivitaminsaft',	'',	'',	'',	'Getraenke',	'Aldi',	0.95,	6.000,	'2014-04-05',	'LEBEN',	'22131218',	0,	'offen',	'2014-04-05',	0,	'0000-00-00 00:00:00'),
(33664,	0,	'Naschtomaten ( Mini )',	'',	'',	'',	'Obst / Gemuese',	'Aldi',	2.49,	1.000,	'2014-04-05',	'LEBEN',	'4049929247550',	0,	'offen',	'2014-04-05',	0,	'0000-00-00 00:00:00'),
(33674,	0,	'O-Saft',	'',	'',	'',	'Getraenke',	'Aldi',	0.95,	6.000,	'2014-04-05',	'LEBEN',	'22131201',	0,	'offen',	'2014-04-05',	0,	'0000-00-00 00:00:00'),
(33684,	0,	'passierte tomaten',	'',	'',	'',	'Konserven',	'Aldi',	0.35,	1.000,	'2014-04-05',	'LEBEN',	'22114235',	0,	'offen',	'2014-04-05',	0,	'0000-00-00 00:00:00'),
(33694,	0,	'Rahmspinat',	'',	'',	'',	'Tiefkuehlkost',	'Aldi',	0.39,	1.000,	'2014-04-05',	'LEBEN',	'',	0,	'offen',	'2014-04-05',	0,	'0000-00-00 00:00:00'),
(33704,	0,	'RapsÃƒÂ¶l',	'',	'',	'',	'Konserven',	'Aldi',	0.95,	1.000,	'2014-04-05',	'LEBEN',	'',	0,	'offen',	'2014-04-05',	0,	'0000-00-00 00:00:00'),
(33714,	0,	'ReibekÃƒÂ¤se',	'',	'',	'',	'Milchprodukte',	'Aldi',	1.19,	1.000,	'2014-04-05',	'LEBEN',	'22126542',	0,	'offen',	'2014-04-05',	0,	'0000-00-00 00:00:00'),
(33724,	0,	'Schlangengurke',	'',	'',	'',	'Obst / Gemuese',	'Aldi',	0.30,	1.000,	'2014-04-05',	'LEBEN',	'',	0,	'offen',	'2014-04-05',	0,	'0000-00-00 00:00:00'),
(33734,	0,	'Sojaschnitzel',	'',	'',	'',	'KÃƒÂ¼hltheke',	'Aldi',	1.79,	2.000,	'2014-04-05',	'LEBEN',	'',	0,	'offen',	'2014-04-05',	0,	'0000-00-00 00:00:00'),
(33744,	0,	'Spiralinudeln',	'',	'',	'',	'Brotwaren',	'Aldi',	0.49,	1.000,	'2014-04-05',	'LEBEN',	'22111326',	0,	'offen',	'2014-04-05',	0,	'0000-00-00 00:00:00'),
(33754,	0,	'Tofuaufschnitt',	'',	'',	'',	'Milchprodukte',	'Aldi',	1.79,	1.000,	'2014-04-05',	'LEBEN',	'22144515',	0,	'offen',	'2014-04-05',	0,	'0000-00-00 00:00:00'),
(33764,	0,	'Tomaten',	'',	'',	'',	'Obst / Gemuese',	'Aldi',	1.00,	1.000,	'2014-04-05',	'LEBEN',	'',	0,	'offen',	'2014-04-05',	0,	'0000-00-00 00:00:00'),
(33774,	0,	'Traubenschorle',	'',	'',	'',	'Getraenke',	'Aldi',	0.89,	6.000,	'2014-04-05',	'LEBEN',	'42141167',	0,	'offen',	'2014-04-05',	0,	'0000-00-00 00:00:00'),
(33784,	0,	'HÃƒÂ¼ttenkÃƒÂ¤se',	'',	'',	'',	'Milchprodukte',	'Kaufland',	2.00,	1.000,	'2014-04-05',	'LEBEN',	'',	0,	'offen',	'2014-04-05',	0,	'0000-00-00 00:00:00'),
(33794,	0,	'Orangenwasser',	'',	'',	'',	'Getraenke',	'Kaufland',	0.49,	6.000,	'2014-04-05',	'LEBEN',	'4300175374170',	0,	'offen',	'2014-04-05',	0,	'0000-00-00 00:00:00'),
(33804,	0,	'Shampoo Herbal fÃƒÂ¼r feines Haar',	'',	'',	'',	'Koerperpflege',	'Kaufland',	1.00,	1.000,	'2014-04-05',	'PFLEG',	'',	0,	'offen',	'2014-04-05',	0,	'0000-00-00 00:00:00'),
(33814,	0,	'veg Pasteten',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	2.000,	'2014-04-05',	'LEBEN',	'',	0,	'offen',	'2014-04-05',	0,	'0000-00-00 00:00:00'),
(33824,	0,	'veg. Aufschnitte',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2014-04-05',	'LEBEN',	'',	0,	'offen',	'2014-04-05',	0,	'0000-00-00 00:00:00'),
(33834,	0,	'FrischkÃƒÂ¤se natur light',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	1.000,	'2014-04-05',	'LEBEN',	'',	0,	'offen',	'2014-04-05',	0,	'0000-00-00 00:00:00'),
(33844,	0,	'Light KÃƒÂ¤se',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	1.000,	'2014-04-05',	'LEBEN',	'',	0,	'offen',	'2014-04-05',	0,	'0000-00-00 00:00:00'),
(33854,	0,	'Rote Beete im Glas',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	1.000,	'2014-04-05',	'LEBEN',	'',	0,	'offen',	'2014-04-05',	0,	'0000-00-00 00:00:00'),
(33864,	0,	'GewÃƒÂ¼rzgurken',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	1.000,	'2014-04-05',	'LEBEN',	'',	0,	'offen',	'2014-04-05',	0,	'0000-00-00 00:00:00'),
(33874,	0,	'FrÃƒÂ¼hlingszweige fÃƒÂ¼r OsterstrauÃƒÅ¸',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2014-04-05',	'PRIVAT',	'',	0,	'offen',	'2014-04-05',	0,	'0000-00-00 00:00:00'),
(33884,	0,	'Die EiskÃƒÂ¶nigin DVD ;-)',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2014-04-05',	'KIND',	'',	0,	'offen',	'2014-04-05',	0,	'0000-00-00 00:00:00'),
(33894,	0,	'Kalkstopp Pulver fÃƒÂ¼r sie Waschmaschine',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2014-04-05',	'HAUSHALT',	'',	0,	'offen',	'2014-04-05',	0,	'0000-00-00 00:00:00'),
(33904,	0,	'KÃƒÂ¤sepizza fÃƒÂ¼r Sonntag',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	2.000,	'2014-04-05',	'LEBEN',	'',	0,	'offen',	'2014-04-05',	0,	'0000-00-00 00:00:00'),
(33914,	0,	'Fruchtjoghurt',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	1.000,	'2014-04-05',	'LEBEN',	'',	0,	'offen',	'2014-04-05',	0,	'0000-00-00 00:00:00'),
(33924,	0,	'Toilettenpapier',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	1.000,	'2014-04-05',	'HAUSHALT',	'',	0,	'offen',	'2014-04-05',	0,	'0000-00-00 00:00:00'),
(33934,	0,	'Kaffeefilter GrÃƒÂ¶ÃƒÅ¸e 4',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	1.000,	'2014-04-05',	'HAUSHALT',	'',	0,	'offen',	'2014-04-05',	0,	'0000-00-00 00:00:00'),
(33944,	0,	'Sommerleggins GrÃƒÂ¶ÃƒÅ¸e 122',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	1.000,	'2014-04-05',	'KIND',	'',	0,	'offen',	'2014-04-05',	0,	'0000-00-00 00:00:00'),
(33954,	0,	'Frische MÃƒÂ¶hren',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	1.000,	'2014-04-05',	'LEBEN',	'',	0,	'offen',	'2014-04-05',	0,	'0000-00-00 00:00:00'),
(33964,	0,	'veg. Wiener WÃƒÂ¼rstchen',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	1.000,	'2014-04-05',	'LEBEN',	'',	0,	'offen',	'2014-04-05',	0,	'0000-00-00 00:00:00'),
(33974,	0,	'Nachthosen',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2014-04-19',	'KIND',	'',	0,	'offen',	'2014-04-12',	0,	'0000-00-00 00:00:00'),
(33984,	0,	'Ãƒâ€pfel Braeburn',	'',	'',	'',	'Obst / Gemuese',	'Aldi',	1.55,	1.000,	'2014-04-19',	'LEBEN',	'',	0,	'offen',	'2014-04-12',	0,	'0000-00-00 00:00:00'),
(33994,	0,	'Baguette-BrÃƒÂ¶tchen',	'',	'',	'',	'Brotwaren',	'Aldi',	0.35,	1.000,	'2014-04-19',	'LEBEN',	'22115904',	0,	'offen',	'2014-04-12',	0,	'0000-00-00 00:00:00'),
(34004,	0,	'Bauernschnitt',	'',	'',	'',	'Brotwaren',	'Aldi',	0.59,	1.000,	'2014-04-19',	'LEBEN',	'29705108',	0,	'offen',	'2014-04-12',	0,	'0000-00-00 00:00:00'),
(34014,	0,	'Bio Kartoffeln',	'',	'',	'',	'Obst / Gemuese',	'Aldi',	1.79,	1.000,	'2014-04-19',	'LEBEN',	'4050373133986',	0,	'offen',	'2014-04-12',	0,	'0000-00-00 00:00:00'),
(34024,	0,	'Butter',	'',	'',	'',	'Milchprodukte',	'Aldi',	1.19,	1.000,	'2014-04-19',	'LEBEN',	'22116505',	0,	'offen',	'2014-04-12',	0,	'0000-00-00 00:00:00'),
(34034,	0,	'Calciumbrause',	'',	'',	'',	'(ohne)',	'Aldi',	0.69,	1.000,	'2014-04-19',	'LEBEN',	'',	0,	'offen',	'2014-04-12',	0,	'0000-00-00 00:00:00'),
(34044,	0,	'H-Milch',	'',	'',	'',	'Milchprodukte',	'Aldi',	0.59,	1.000,	'2014-04-19',	'LEBEN',	'22116413',	0,	'offen',	'2014-04-12',	0,	'0000-00-00 00:00:00'),
(34054,	0,	'KÃƒÂ¤seaufschnitt',	'',	'',	'',	'Milchprodukte',	'Aldi',	1.39,	1.000,	'2014-04-19',	'LEBEN',	'22144225',	0,	'offen',	'2014-04-12',	0,	'0000-00-00 00:00:00'),
(34064,	0,	'KnÃƒÂ¤ckebrot',	'',	'',	'',	'Brotwaren',	'Aldi',	1.00,	1.000,	'2014-04-19',	'LEBEN',	'',	0,	'offen',	'2014-04-12',	0,	'0000-00-00 00:00:00'),
(34074,	0,	'Magerquark',	'',	'',	'',	'Milchprodukte',	'Aldi',	0.55,	1.000,	'2014-04-19',	'LEBEN',	'',	0,	'offen',	'2014-04-12',	0,	'0000-00-00 00:00:00'),
(34084,	0,	'Milch (Frischmilch)',	'',	'',	'',	'Milchprodukte',	'Aldi',	0.65,	1.000,	'2014-04-19',	'LEBEN',	'22130112',	0,	'offen',	'2014-04-12',	0,	'0000-00-00 00:00:00'),
(34094,	0,	'Multivitaminsaft',	'',	'',	'',	'Getraenke',	'Aldi',	0.95,	6.000,	'2014-04-19',	'LEBEN',	'22131218',	0,	'offen',	'2014-04-12',	0,	'0000-00-00 00:00:00'),
(34104,	0,	'Naschtomaten ( Mini )',	'',	'',	'',	'Obst / Gemuese',	'Aldi',	2.49,	1.000,	'2014-04-19',	'LEBEN',	'4049929247550',	0,	'offen',	'2014-04-12',	0,	'0000-00-00 00:00:00'),
(34114,	0,	'O-Saft',	'',	'',	'',	'Getraenke',	'Aldi',	0.95,	6.000,	'2014-04-19',	'LEBEN',	'22131201',	0,	'offen',	'2014-04-12',	0,	'0000-00-00 00:00:00'),
(34124,	0,	'Paprikaschoten rot',	'',	'',	'',	'Obst / Gemuese',	'Aldi',	1.69,	1.000,	'2014-04-19',	'LEBEN',	'',	0,	'offen',	'2014-04-12',	0,	'0000-00-00 00:00:00'),
(34134,	0,	'passierte tomaten',	'',	'',	'',	'Konserven',	'Aldi',	0.35,	1.000,	'2014-04-19',	'LEBEN',	'22114235',	0,	'offen',	'2014-04-12',	0,	'0000-00-00 00:00:00'),
(34144,	0,	'Rahmspinat',	'',	'',	'',	'Tiefkuehlkost',	'Aldi',	0.39,	1.000,	'2014-04-19',	'LEBEN',	'',	0,	'offen',	'2014-04-12',	0,	'0000-00-00 00:00:00'),
(34154,	0,	'Schlangengurke',	'',	'',	'',	'Obst / Gemuese',	'Aldi',	0.30,	1.000,	'2014-04-19',	'LEBEN',	'',	0,	'offen',	'2014-04-12',	0,	'0000-00-00 00:00:00'),
(34164,	0,	'Sojaschnitzel',	'',	'',	'',	'KÃƒÂ¼hltheke',	'Aldi',	1.79,	2.000,	'2014-04-19',	'LEBEN',	'',	0,	'offen',	'2014-04-12',	0,	'0000-00-00 00:00:00'),
(34174,	0,	'Tofuaufschnitt',	'',	'',	'',	'Milchprodukte',	'Aldi',	1.79,	1.000,	'2014-04-19',	'LEBEN',	'22144515',	0,	'offen',	'2014-04-12',	0,	'0000-00-00 00:00:00'),
(34184,	0,	'Tomaten',	'',	'',	'',	'Obst / Gemuese',	'Aldi',	1.00,	1.000,	'2014-04-19',	'LEBEN',	'',	0,	'offen',	'2014-04-12',	0,	'0000-00-00 00:00:00'),
(34194,	0,	'Traubenschorle',	'',	'',	'',	'Getraenke',	'Aldi',	0.89,	6.000,	'2014-04-19',	'LEBEN',	'42141167',	0,	'offen',	'2014-04-12',	0,	'0000-00-00 00:00:00'),
(34204,	0,	'HÃƒÂ¼ttenkÃƒÂ¤se',	'',	'',	'',	'Milchprodukte',	'Kaufland',	2.00,	1.000,	'2014-04-19',	'LEBEN',	'',	0,	'offen',	'2014-04-12',	0,	'0000-00-00 00:00:00'),
(34214,	0,	'Orangenwasser',	'',	'',	'',	'Getraenke',	'Kaufland',	0.49,	6.000,	'2014-04-19',	'LEBEN',	'4300175374170',	0,	'offen',	'2014-04-12',	0,	'0000-00-00 00:00:00'),
(34224,	0,	'10 weiÃƒÅ¸e Freilandeier fÃƒÂ¼r Ostern',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	1.000,	'2014-04-19',	'LEBEN',	'',	0,	'offen',	'2014-04-12',	0,	'0000-00-00 00:00:00'),
(34234,	0,	'Veg Aufschnitte',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2014-04-19',	'LEBEN',	'',	0,	'offen',	'2014-04-12',	0,	'0000-00-00 00:00:00'),
(34244,	0,	'Sojawurst',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2014-04-19',	'LEBEN',	'',	0,	'offen',	'2014-04-12',	0,	'0000-00-00 00:00:00'),
(34254,	0,	'veg Pasteten',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	2.000,	'2014-04-19',	'LEBEN',	'',	0,	'offen',	'2014-04-12',	0,	'0000-00-00 00:00:00'),
(34264,	0,	'GewÃƒÂ¼rzgurken',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	1.000,	'2014-04-19',	'LEBEN',	'',	0,	'offen',	'2014-04-12',	0,	'0000-00-00 00:00:00'),
(34274,	0,	'Rote Beete im Glas',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	1.000,	'2014-04-19',	'LEBEN',	'',	0,	'offen',	'2014-04-12',	0,	'0000-00-00 00:00:00'),
(34284,	0,	'Brokkoli',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	1.000,	'2014-04-19',	'LEBEN',	'',	0,	'offen',	'2014-04-12',	0,	'0000-00-00 00:00:00'),
(34294,	0,	'veg BratwÃƒÂ¼rste',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	1.000,	'2014-04-19',	'LEBEN',	'',	0,	'offen',	'2014-04-12',	0,	'0000-00-00 00:00:00'),
(34304,	0,	'Kaffeemilch',	'',	'',	'',	'(ohne)',	'Aldi',	1.00,	1.000,	'2014-04-19',	'LEBEN',	'',	0,	'offen',	'2014-04-12',	0,	'0000-00-00 00:00:00'),
(34314,	0,	'Fleckenteufel Teer',	'',	'',	'',	'(ohne)',	'Kaufland',	2.00,	1.000,	'2014-04-19',	'HAUSHALT',	'',	0,	'offen',	'2014-04-12',	0,	'0000-00-00 00:00:00'),
(34324,	0,	'Fleckenteufel Speisefett',	'',	'',	'',	'(ohne)',	'Kaufland',	2.00,	1.000,	'2014-04-19',	'HAUSHALT',	'',	0,	'offen',	'2014-04-12',	0,	'0000-00-00 00:00:00'),
(34334,	0,	'FrÃƒÂ¼hlingszweige fÃƒÂ¼r Osterstrauss ( bitte unbedingt )',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2014-04-19',	'HAUSHALT',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(34344,	0,	'Die EiskÃƒÂ¶nigin DVD ;-)',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2014-04-19',	'KIND',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(34354,	0,	'WC Reiniger',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2014-04-19',	'HAUSHALT',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(34364,	0,	'WÃƒÂ¼rfelzucker fÃƒÂ¼r die Arbeit',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2014-04-19',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(34374,	0,	'4-5 Pkg. H-Milch fÃƒÂ¼r die Arbeit',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2014-04-19',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(34384,	0,	'bitte viiiiiele Ãƒâ€pfel',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2014-04-19',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(34394,	0,	'Oxy Action Waschpulver gegen Flecken ( fÃƒÂ¼r hartnÃƒÂ¤ckiges )',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2014-04-26',	'HAUSHALT',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(34404,	0,	'Ãƒâ€pfel Braeburn',	'',	'',	'',	'Obst / Gemuese',	'Aldi',	1.55,	1.000,	'2014-04-26',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(34414,	0,	'Baguette-BrÃƒÂ¶tchen',	'',	'',	'',	'Brotwaren',	'Aldi',	0.35,	1.000,	'2014-04-26',	'LEBEN',	'22115904',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(34424,	0,	'Bauernschnitt',	'',	'',	'',	'Brotwaren',	'Aldi',	0.59,	1.000,	'2014-04-26',	'LEBEN',	'29705108',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(34434,	0,	'Bio Kartoffeln',	'',	'',	'',	'Obst / Gemuese',	'Aldi',	1.79,	1.000,	'2014-04-26',	'LEBEN',	'4050373133986',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(34444,	0,	'Butter',	'',	'',	'',	'Milchprodukte',	'Aldi',	1.19,	1.000,	'2014-04-26',	'LEBEN',	'22116505',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(34454,	0,	'H-Milch',	'',	'',	'',	'Milchprodukte',	'Aldi',	0.59,	1.000,	'2014-04-26',	'LEBEN',	'22116413',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(34464,	0,	'KÃƒÂ¤seaufschnitt',	'',	'',	'',	'Milchprodukte',	'Aldi',	1.39,	1.000,	'2014-04-26',	'LEBEN',	'22144225',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(34474,	0,	'KnÃƒÂ¤ckebrot',	'',	'',	'',	'Brotwaren',	'Aldi',	1.00,	1.000,	'2014-04-26',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(34484,	0,	'Milch (Frischmilch)',	'',	'',	'',	'Milchprodukte',	'Aldi',	0.65,	1.000,	'2014-04-26',	'LEBEN',	'22130112',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(34494,	0,	'Multivitaminsaft',	'',	'',	'',	'Getraenke',	'Aldi',	0.95,	6.000,	'2014-04-26',	'LEBEN',	'22131218',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(34504,	0,	'Naschtomaten ( Mini )',	'',	'',	'',	'Obst / Gemuese',	'Aldi',	2.49,	1.000,	'2014-04-26',	'LEBEN',	'4049929247550',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(34514,	0,	'O-Saft',	'',	'',	'',	'Getraenke',	'Aldi',	0.95,	6.000,	'2014-04-26',	'LEBEN',	'22131201',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(34524,	0,	'passierte tomaten',	'',	'',	'',	'Konserven',	'Aldi',	0.35,	1.000,	'2014-04-26',	'LEBEN',	'22114235',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(34534,	0,	'ReibekÃƒÂ¤se',	'',	'',	'',	'Milchprodukte',	'Aldi',	1.19,	1.000,	'2014-04-26',	'LEBEN',	'22126542',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(34544,	0,	'Sojaschnitzel',	'',	'',	'',	'KÃƒÂ¼hltheke',	'Aldi',	1.79,	2.000,	'2014-04-26',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(34554,	0,	'Stilles Wasser',	'',	'',	'',	'GetrÃƒÂ¤nke',	'Aldi',	2.64,	1.000,	'2014-04-26',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(34564,	0,	'Tofuaufschnitt',	'',	'',	'',	'Milchprodukte',	'Aldi',	1.79,	1.000,	'2014-04-26',	'LEBEN',	'22144515',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(34574,	0,	'Tomaten',	'',	'',	'',	'Obst / Gemuese',	'Aldi',	1.00,	1.000,	'2014-04-26',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(34584,	0,	'Traubenschorle',	'',	'',	'',	'Getraenke',	'Aldi',	0.89,	6.000,	'2014-04-26',	'LEBEN',	'42141167',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(34594,	0,	'Zwiebeln',	'',	'',	'',	'Obst / Gemuese',	'Aldi',	0.69,	1.000,	'2014-04-26',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(34604,	0,	'gelbe MÃƒÂ¼llsÃƒÂ¤cke',	'',	'',	'',	'Haushalt / Putzmittel',	'Kaufland',	2.49,	1.000,	'2014-04-26',	'HAUSHALT',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(34614,	0,	'HÃƒÂ¼ttenkÃƒÂ¤se',	'',	'',	'',	'Milchprodukte',	'Kaufland',	2.00,	1.000,	'2014-04-26',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(34624,	0,	'Orangenwasser',	'',	'',	'',	'Getraenke',	'Kaufland',	0.49,	6.000,	'2014-04-26',	'LEBEN',	'4300175374170',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(34634,	0,	'deutsche Erdbeeren',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2014-04-26',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(34644,	0,	'frische Champignons ( schÃƒÂ¶n weiÃƒÅ¸, ansonsten braune Champignons )',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2014-04-26',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(34654,	0,	'Rama cremefine zum kochen',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	1.000,	'2014-04-26',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(34664,	0,	'Freilandeier',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	1.000,	'2014-04-26',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(34674,	0,	'Erdbeermarmelade',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	1.000,	'2014-04-26',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(34684,	0,	'Wollwaschmittel',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	1.000,	'2014-04-26',	'HAUSHALT',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(34694,	0,	'Ãƒâ€pfel Braeburn',	'',	'',	'',	'Obst / Gemuese',	'Aldi',	1.55,	1.000,	'2014-05-17',	'LEBEN',	'',	0,	'offen',	'2014-05-03',	0,	'0000-00-00 00:00:00'),
(34704,	0,	'Baguette-BrÃƒÂ¶tchen',	'',	'',	'',	'Brotwaren',	'Aldi',	0.35,	1.000,	'2014-05-17',	'LEBEN',	'22115904',	0,	'offen',	'2014-05-03',	0,	'0000-00-00 00:00:00'),
(34714,	0,	'Bauernschnitt',	'',	'',	'',	'Brotwaren',	'Aldi',	0.59,	1.000,	'2014-05-17',	'LEBEN',	'29705108',	0,	'offen',	'2014-05-03',	0,	'0000-00-00 00:00:00'),
(34724,	0,	'Broccoli',	'',	'',	'',	'Obst / Gemuese',	'Aldi',	0.95,	1.000,	'2014-05-17',	'LEBEN',	'',	0,	'offen',	'2014-05-03',	0,	'0000-00-00 00:00:00'),
(34734,	0,	'Butter',	'',	'',	'',	'Milchprodukte',	'Aldi',	1.19,	1.000,	'2014-05-17',	'LEBEN',	'22116505',	0,	'offen',	'2014-05-03',	0,	'0000-00-00 00:00:00'),
(34744,	0,	'H-Milch',	'',	'',	'',	'Milchprodukte',	'Aldi',	0.59,	1.000,	'2014-05-17',	'LEBEN',	'22116413',	0,	'offen',	'2014-05-03',	0,	'0000-00-00 00:00:00'),
(34754,	0,	'Joghurt Natur',	'',	'',	'',	'Milchprodukte',	'Aldi',	0.55,	1.000,	'2014-05-17',	'LEBEN',	'',	0,	'offen',	'2014-05-03',	0,	'0000-00-00 00:00:00'),
(34764,	0,	'KÃƒÂ¤seaufschnitt',	'',	'',	'',	'Milchprodukte',	'Aldi',	1.39,	1.000,	'2014-05-17',	'LEBEN',	'22144225',	0,	'offen',	'2014-05-03',	0,	'0000-00-00 00:00:00'),
(34774,	0,	'KnÃƒÂ¤ckebrot',	'',	'',	'',	'Brotwaren',	'Aldi',	1.00,	1.000,	'2014-05-17',	'LEBEN',	'',	0,	'offen',	'2014-05-03',	0,	'0000-00-00 00:00:00'),
(34784,	0,	'Margarine',	'',	'',	'',	'(ohne)',	'Aldi',	0.69,	1.000,	'2014-05-17',	'LEBEN',	'22112446',	0,	'offen',	'2014-05-03',	0,	'0000-00-00 00:00:00'),
(34794,	0,	'Milch (Frischmilch)',	'',	'',	'',	'Milchprodukte',	'Aldi',	0.65,	1.000,	'2014-05-17',	'LEBEN',	'22130112',	0,	'offen',	'2014-05-03',	0,	'0000-00-00 00:00:00'),
(34804,	0,	'Multivitaminsaft',	'',	'',	'',	'Getraenke',	'Aldi',	0.95,	6.000,	'2014-05-17',	'LEBEN',	'22131218',	0,	'offen',	'2014-05-03',	0,	'0000-00-00 00:00:00'),
(34814,	0,	'Naschtomaten ( Mini )',	'',	'',	'',	'Obst / Gemuese',	'Aldi',	2.49,	1.000,	'2014-05-17',	'LEBEN',	'4049929247550',	0,	'offen',	'2014-05-03',	0,	'0000-00-00 00:00:00'),
(34824,	0,	'O-Saft',	'',	'',	'',	'Getraenke',	'Aldi',	0.95,	6.000,	'2014-05-17',	'LEBEN',	'22131201',	0,	'offen',	'2014-05-03',	0,	'0000-00-00 00:00:00'),
(34834,	0,	'passierte tomaten',	'',	'',	'',	'Konserven',	'Aldi',	0.35,	1.000,	'2014-05-17',	'LEBEN',	'22114235',	0,	'offen',	'2014-05-03',	0,	'0000-00-00 00:00:00'),
(34844,	0,	'Schlangengurke',	'',	'',	'',	'Obst / Gemuese',	'Aldi',	0.30,	1.000,	'2014-05-17',	'LEBEN',	'',	0,	'offen',	'2014-05-03',	0,	'0000-00-00 00:00:00'),
(34854,	0,	'Tofuaufschnitt',	'',	'',	'',	'Milchprodukte',	'Aldi',	1.79,	1.000,	'2014-05-17',	'LEBEN',	'22144515',	0,	'offen',	'2014-05-03',	0,	'0000-00-00 00:00:00'),
(34864,	0,	'Tomaten',	'',	'',	'',	'Obst / Gemuese',	'Aldi',	1.00,	1.000,	'2014-05-17',	'LEBEN',	'',	0,	'offen',	'2014-05-03',	0,	'0000-00-00 00:00:00'),
(34874,	0,	'Traubenschorle',	'',	'',	'',	'Getraenke',	'Aldi',	0.89,	6.000,	'2014-05-17',	'LEBEN',	'42141167',	0,	'offen',	'2014-05-03',	0,	'0000-00-00 00:00:00'),
(34884,	0,	'HÃƒÂ¼ttenkÃƒÂ¤se',	'',	'',	'',	'Milchprodukte',	'Kaufland',	2.00,	1.000,	'2014-05-17',	'LEBEN',	'',	0,	'offen',	'2014-05-03',	0,	'0000-00-00 00:00:00'),
(34894,	0,	'KrÃƒÂ¤utersalz',	'',	'',	'',	'Salz / Mehl',	'Kaufland',	1.00,	1.000,	'2014-05-17',	'LEBEN',	'',	0,	'offen',	'2014-05-03',	0,	'0000-00-00 00:00:00'),
(34904,	0,	'Orangenwasser',	'',	'',	'',	'Getraenke',	'Kaufland',	0.49,	6.000,	'2014-05-17',	'LEBEN',	'4300175374170',	0,	'offen',	'2014-05-03',	0,	'0000-00-00 00:00:00'),
(34914,	0,	'Sofix fÃƒÂ¼r alle BÃƒÂ¶den',	'',	'',	'',	'Haushalt / Putzmittel',	'Kaufland',	4.45,	1.000,	'2014-05-17',	'HAUSHALT',	'4015000019927',	0,	'offen',	'2014-05-03',	0,	'0000-00-00 00:00:00'),
(34924,	0,	'deutsche Erdbeeren',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2014-05-17',	'LEBEN',	'',	0,	'offen',	'2014-05-03',	0,	'0000-00-00 00:00:00'),
(34934,	0,	'Mozarella groÃƒÅ¸',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	1.000,	'2014-05-17',	'LEBEN',	'',	0,	'offen',	'2014-05-03',	0,	'0000-00-00 00:00:00'),
(34944,	0,	'Kohlrabi',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	1.000,	'2014-05-17',	'LEBEN',	'',	0,	'offen',	'2014-05-03',	0,	'0000-00-00 00:00:00'),
(34954,	0,	'veg Pasteten',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	4.000,	'2014-05-17',	'LEBEN',	'',	0,	'offen',	'2014-05-03',	0,	'0000-00-00 00:00:00'),
(34964,	0,	'veg. Aufschnitte',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	100.000,	'2014-05-17',	'LEBEN',	'',	0,	'offen',	'2014-05-03',	0,	'0000-00-00 00:00:00'),
(34974,	0,	'Kaffeebohnen',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2014-05-17',	'LEBEN',	'',	0,	'offen',	'2014-05-03',	0,	'0000-00-00 00:00:00'),
(34984,	0,	'dÃƒÂ¤n. Gurkensalat',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2014-05-17',	'LEBEN',	'',	0,	'offen',	'2014-05-03',	0,	'0000-00-00 00:00:00'),
(34994,	0,	'LightkÃƒÂ¤se',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	1.000,	'2014-05-17',	'LEBEN',	'',	0,	'offen',	'2014-05-03',	0,	'0000-00-00 00:00:00'),
(35004,	0,	'Zwieback',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	1.000,	'2014-05-17',	'LEBEN',	'',	0,	'offen',	'2014-05-03',	0,	'0000-00-00 00:00:00'),
(35014,	0,	'Tandil Color Waschpulver',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	1.000,	'2014-05-17',	'HAUSHALT',	'',	0,	'offen',	'2014-05-03',	0,	'0000-00-00 00:00:00'),
(35024,	0,	'KÃƒÂ¼chentÃƒÂ¼cher',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2014-05-17',	'HAUSHALT',	'',	0,	'offen',	'2014-05-03',	0,	'0000-00-00 00:00:00'),
(35034,	0,	'GanzkÃƒÂ¶rperschÃƒÂ¼rze fÃƒÂ¼r Mama, die super KÃƒÂ¶chin ;-)',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2014-05-17',	'HAUSHALT',	'',	0,	'offen',	'2014-05-03',	0,	'0000-00-00 00:00:00'),
(35044,	0,	'Butterbrotpapier zum abreissen',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2014-05-17',	'HAUSHALT',	'',	0,	'offen',	'2014-05-03',	0,	'0000-00-00 00:00:00'),
(35054,	0,	'saure Gurken',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	1.000,	'2014-05-17',	'LEBEN',	'',	0,	'offen',	'2014-05-03',	0,	'0000-00-00 00:00:00'),
(35064,	0,	'frische Hefe',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	1.000,	'2014-05-17',	'LEBEN',	'',	0,	'offen',	'2014-05-03',	0,	'0000-00-00 00:00:00'),
(35074,	0,	'Onkel Alvin und das Sams von Paul Maar ( Buch Nr. 6 )',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2014-05-17',	'KIND',	'',	0,	'offen',	'2014-05-03',	0,	'0000-00-00 00:00:00'),
(35084,	0,	'Mittagessen fÃƒÂ¼r Sonntag.........',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2014-05-17',	'LEBEN',	'',	0,	'offen',	'2014-05-03',	0,	'0000-00-00 00:00:00'),
(35094,	0,	'Nudeln',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2014-05-17',	'LEBEN',	'',	0,	'offen',	'2014-05-03',	0,	'0000-00-00 00:00:00'),
(35104,	0,	'Schupfnudeln',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2014-05-17',	'LEBEN',	'',	0,	'offen',	'2014-05-03',	0,	'0000-00-00 00:00:00'),
(35114,	0,	'braune Champignons',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2014-05-17',	'LEBEN',	'',	0,	'offen',	'2014-05-03',	0,	'0000-00-00 00:00:00'),
(35124,	0,	'Mehl Typ 405',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	1.000,	'2014-05-17',	'LEBEN',	'',	0,	'offen',	'2014-05-03',	0,	'0000-00-00 00:00:00'),
(35134,	0,	'Mehl Typ 1050',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2014-05-17',	'LEBEN',	'',	0,	'offen',	'2014-05-03',	0,	'0000-00-00 00:00:00'),
(35144,	0,	'Ãƒâ€pfel Braeburn',	'',	'',	'',	'Obst / Gemuese',	'Aldi',	1.55,	1.000,	'2014-06-07',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(35154,	0,	'Baguette-BrÃƒÂ¶tchen',	'',	'',	'',	'Brotwaren',	'Aldi',	0.35,	1.000,	'2014-06-07',	'LEBEN',	'22115904',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(35164,	0,	'Bauernschnitt',	'',	'',	'',	'Brotwaren',	'Aldi',	0.59,	1.000,	'2014-06-07',	'LEBEN',	'29705108',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(35174,	0,	'Bio Kartoffeln',	'',	'',	'',	'Obst / Gemuese',	'Aldi',	1.79,	1.000,	'2014-06-07',	'LEBEN',	'4050373133986',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(35184,	0,	'Broccoli',	'',	'',	'',	'Obst / Gemuese',	'Aldi',	0.95,	1.000,	'2014-06-07',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(35194,	0,	'Butter',	'',	'',	'',	'Milchprodukte',	'Aldi',	1.19,	1.000,	'2014-06-07',	'LEBEN',	'22116505',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(35204,	0,	'Calciumbrause',	'',	'',	'',	'Windeln',	'Aldi',	0.69,	1.000,	'2014-06-07',	'',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(35214,	0,	'H-Milch',	'',	'',	'',	'Milchprodukte',	'Aldi',	0.59,	1.000,	'2014-06-07',	'LEBEN',	'22116413',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(35224,	0,	'KÃƒÂ¤seaufschnitt',	'',	'',	'',	'Milchprodukte',	'Aldi',	1.39,	1.000,	'2014-06-07',	'LEBEN',	'22144225',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(35234,	0,	'Kiwi',	'',	'',	'',	'Obst / Gemuese',	'Aldi',	1.29,	1.000,	'2014-06-07',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(35244,	0,	'KnÃƒÂ¤ckebrot',	'',	'',	'',	'Brotwaren',	'Aldi',	1.00,	1.000,	'2014-06-07',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(35254,	0,	'Milch (Frischmilch)',	'',	'',	'',	'Milchprodukte',	'Aldi',	0.65,	1.000,	'2014-06-07',	'LEBEN',	'22130112',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(35264,	0,	'Multivitaminsaft',	'',	'',	'',	'Getraenke',	'Aldi',	0.95,	6.000,	'2014-06-07',	'LEBEN',	'22131218',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(35274,	0,	'Naschtomaten ( Mini )',	'',	'',	'',	'Obst / Gemuese',	'Aldi',	2.49,	1.000,	'2014-06-07',	'LEBEN',	'4049929247550',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(35284,	0,	'O-Saft',	'',	'',	'',	'Getraenke',	'Aldi',	0.95,	6.000,	'2014-06-07',	'LEBEN',	'22131201',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(35294,	0,	'passierte tomaten',	'',	'',	'',	'Konserven',	'Aldi',	0.35,	1.000,	'2014-06-07',	'LEBEN',	'22114235',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(35304,	0,	'Sojaschnitzel',	'',	'',	'',	'KÃƒÂ¼hltheke',	'Aldi',	1.79,	2.000,	'2014-06-07',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(35314,	0,	'Spiralinudeln',	'',	'',	'',	'Brotwaren',	'Aldi',	0.49,	1.000,	'2014-06-07',	'LEBEN',	'22111326',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(35324,	0,	'Tofuaufschnitt',	'',	'',	'',	'Milchprodukte',	'Aldi',	1.79,	1.000,	'2014-06-07',	'LEBEN',	'22144515',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(35334,	0,	'Tomaten',	'',	'',	'',	'Obst / Gemuese',	'Aldi',	1.00,	1.000,	'2014-06-07',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(35344,	0,	'Traubenschorle',	'',	'',	'',	'Getraenke',	'Aldi',	0.89,	6.000,	'2014-06-07',	'LEBEN',	'42141167',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(35354,	0,	'gelbe MÃƒÂ¼llsÃƒÂ¤cke',	'',	'',	'',	'Haushalt / Putzmittel',	'Kaufland',	2.49,	1.000,	'2014-06-07',	'HAUSHALT',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(35364,	0,	'HÃƒÂ¼ttenkÃƒÂ¤se',	'',	'',	'',	'Milchprodukte',	'Kaufland',	2.00,	1.000,	'2014-06-07',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(35374,	0,	'Orangenwasser',	'',	'',	'',	'Getraenke',	'Kaufland',	0.49,	6.000,	'2014-06-07',	'LEBEN',	'4300175374170',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(35384,	0,	'HandspÃƒÂ¼lmittel',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	1.000,	'2014-06-07',	'HAUSHALT',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(35394,	0,	'Freilandeier',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	1.000,	'2014-06-07',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(35404,	0,	'GewÃƒÂ¼rzgurken',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	1.000,	'2014-06-07',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(35414,	0,	'veg. WÃƒÂ¼rstchen',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	1.000,	'2014-06-07',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(35424,	0,	'veg Pasteten',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	4.000,	'2014-06-07',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(35434,	0,	'Veg Aufschnitte',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	2.000,	'2014-06-07',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(35444,	0,	'RotbÃƒÂ¤ckchensaft',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2014-06-07',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(35454,	0,	'Gerste ( volles Korn )',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2014-06-07',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(35464,	0,	'Gnocchi',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2014-06-07',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(35474,	0,	'RÃƒÂ¤uchertofu',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2014-06-07',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(35484,	0,	'KÃƒÂ¼chentÃƒÂ¼cher',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2014-06-07',	'HAUSHALT',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(35494,	0,	'Akkus',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2014-06-07',	'HAUSHALT',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(35504,	0,	'Kaffeebohnen',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2014-06-07',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(35514,	0,	'Erdbeeren 1,5kg',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2014-06-07',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(35524,	0,	'Aprikosen',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2014-06-07',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(35534,	0,	'Birnen',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	1.000,	'2014-06-07',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(35544,	0,	'MÃƒÂ¤dchen T-Shirt GrÃƒÂ¶ÃƒÅ¸e 128 (KurzÃƒÂ¤rmelig )',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	1.000,	'2014-06-07',	'KIND',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(35554,	0,	'Sommerleggins GrÃƒÂ¶ÃƒÅ¸e 128',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	1.000,	'2014-06-07',	'KIND',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(35564,	0,	'Vollkornmehl',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2014-06-07',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(35574,	0,	'rote Paprika',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	2.000,	'2014-06-07',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(35584,	0,	'Sojasauce',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2014-06-07',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(35594,	0,	'Mini Mozarella',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	2.000,	'2014-06-07',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(35604,	0,	'Naschtomaten',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	2.000,	'2014-06-07',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(35614,	0,	'Butterbrotpapier zum abreissen',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2014-06-07',	'HAUSHALT',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(35624,	0,	'Ãƒâ€pfel Braeburn',	'',	'',	'',	'Obst / Gemuese',	'Aldi',	1.55,	1.000,	'2014-06-21',	'LEBEN',	'',	0,	'offen',	'2014-06-14',	0,	'0000-00-00 00:00:00'),
(35634,	0,	'Baguette-BrÃƒÂ¶tchen',	'',	'',	'',	'Brotwaren',	'Aldi',	0.35,	1.000,	'2014-06-21',	'LEBEN',	'22115904',	0,	'offen',	'2014-06-14',	0,	'0000-00-00 00:00:00'),
(35644,	0,	'Bauernschnitt',	'',	'',	'',	'Brotwaren',	'Aldi',	0.59,	1.000,	'2014-06-21',	'LEBEN',	'29705108',	0,	'offen',	'2014-06-14',	0,	'0000-00-00 00:00:00'),
(35654,	0,	'Broccoli',	'',	'',	'',	'Obst / Gemuese',	'Aldi',	0.95,	1.000,	'2014-06-21',	'LEBEN',	'',	0,	'offen',	'2014-06-14',	0,	'0000-00-00 00:00:00'),
(35664,	0,	'Butter',	'',	'',	'',	'Milchprodukte',	'Aldi',	1.19,	1.000,	'2014-06-21',	'LEBEN',	'22116505',	0,	'offen',	'2014-06-14',	0,	'0000-00-00 00:00:00'),
(35674,	0,	'H-Milch',	'',	'',	'',	'Milchprodukte',	'Aldi',	0.59,	1.000,	'2014-06-21',	'LEBEN',	'22116413',	0,	'offen',	'2014-06-14',	0,	'0000-00-00 00:00:00'),
(35684,	0,	'KÃƒÂ¤seaufschnitt',	'',	'',	'',	'Milchprodukte',	'Aldi',	1.39,	1.000,	'2014-06-21',	'LEBEN',	'22144225',	0,	'offen',	'2014-06-14',	0,	'0000-00-00 00:00:00'),
(35694,	0,	'Kiwi',	'',	'',	'',	'Obst / Gemuese',	'Aldi',	1.29,	1.000,	'2014-06-21',	'LEBEN',	'',	0,	'offen',	'2014-06-14',	0,	'0000-00-00 00:00:00'),
(35704,	0,	'KnÃƒÂ¤ckebrot',	'',	'',	'',	'Brotwaren',	'Aldi',	1.00,	1.000,	'2014-06-21',	'LEBEN',	'',	0,	'offen',	'2014-06-14',	0,	'0000-00-00 00:00:00'),
(35714,	0,	'Milch (Frischmilch)',	'',	'',	'',	'Milchprodukte',	'Aldi',	0.65,	1.000,	'2014-06-21',	'LEBEN',	'22130112',	0,	'offen',	'2014-06-14',	0,	'0000-00-00 00:00:00'),
(35724,	0,	'Multivitaminsaft',	'',	'',	'',	'Getraenke',	'Aldi',	0.95,	6.000,	'2014-06-21',	'LEBEN',	'22131218',	0,	'offen',	'2014-06-14',	0,	'0000-00-00 00:00:00'),
(35734,	0,	'O-Saft',	'',	'',	'',	'Getraenke',	'Aldi',	0.95,	6.000,	'2014-06-21',	'LEBEN',	'22131201',	0,	'offen',	'2014-06-14',	0,	'0000-00-00 00:00:00'),
(35744,	0,	'passierte tomaten',	'',	'',	'',	'Konserven',	'Aldi',	0.35,	1.000,	'2014-06-21',	'LEBEN',	'22114235',	0,	'offen',	'2014-06-14',	0,	'0000-00-00 00:00:00'),
(35754,	0,	'Sojaschnitzel',	'',	'',	'',	'KÃƒÂ¼hltheke',	'Aldi',	1.79,	2.000,	'2014-06-21',	'LEBEN',	'',	0,	'offen',	'2014-06-14',	0,	'0000-00-00 00:00:00'),
(35764,	0,	'Stilles Wasser',	'',	'',	'',	'GetrÃƒÂ¤nke',	'Aldi',	2.64,	1.000,	'2014-06-21',	'LEBEN',	'',	0,	'offen',	'2014-06-14',	0,	'0000-00-00 00:00:00'),
(35774,	0,	'Tofuaufschnitt',	'',	'',	'',	'Milchprodukte',	'Aldi',	1.79,	1.000,	'2014-06-21',	'LEBEN',	'22144515',	0,	'offen',	'2014-06-14',	0,	'0000-00-00 00:00:00'),
(35784,	0,	'Tomaten',	'',	'',	'',	'Obst / Gemuese',	'Aldi',	1.00,	1.000,	'2014-06-21',	'LEBEN',	'',	0,	'offen',	'2014-06-14',	0,	'0000-00-00 00:00:00'),
(35794,	0,	'Traubenschorle',	'',	'',	'',	'Getraenke',	'Aldi',	0.89,	6.000,	'2014-06-21',	'LEBEN',	'42141167',	0,	'offen',	'2014-06-14',	0,	'0000-00-00 00:00:00'),
(35804,	0,	'HÃƒÂ¼ttenkÃƒÂ¤se',	'',	'',	'',	'Milchprodukte',	'Kaufland',	2.00,	1.000,	'2014-06-21',	'LEBEN',	'',	0,	'offen',	'2014-06-14',	0,	'0000-00-00 00:00:00'),
(35814,	0,	'Orangenwasser',	'',	'',	'',	'Getraenke',	'Kaufland',	0.49,	6.000,	'2014-06-21',	'LEBEN',	'4300175374170',	0,	'offen',	'2014-06-14',	0,	'0000-00-00 00:00:00'),
(35824,	0,	'SesamÃƒÂ¶l',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2014-06-21',	'LEBEN',	'',	0,	'offen',	'2014-06-14',	0,	'0000-00-00 00:00:00'),
(35834,	0,	'FrÃƒÂ¼chtetee ( Beutel ) mit Erdbeer',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2014-06-21',	'LEBEN',	'',	0,	'offen',	'2014-06-14',	0,	'0000-00-00 00:00:00'),
(35844,	0,	'Malblock fÃƒÂ¼r Frieda',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2014-06-21',	'KIND',	'',	0,	'offen',	'2014-06-14',	0,	'0000-00-00 00:00:00'),
(35854,	0,	'lange Kinderleggins Gr. 122/128',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	1.000,	'2014-06-21',	'KIND',	'',	0,	'offen',	'2014-06-14',	0,	'0000-00-00 00:00:00'),
(35864,	0,	'GewÃƒÂ¼rzgurken',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	1.000,	'2014-06-21',	'LEBEN',	'',	0,	'offen',	'2014-06-14',	0,	'0000-00-00 00:00:00'),
(35874,	0,	'veg. Pasteten',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	3.000,	'2014-06-21',	'LEBEN',	'',	0,	'offen',	'2014-06-14',	0,	'0000-00-00 00:00:00'),
(35884,	0,	'Knusper BÃƒÂ¤r MÃƒÂ¼sli von Alnatura',	'',	'',	'',	'(ohne)',	'DM',	0.00,	1.000,	'2014-06-21',	'LEBEN',	'',	0,	'offen',	'2014-06-14',	0,	'0000-00-00 00:00:00'),
(35894,	0,	'Gelierzucker 2:1',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	4.000,	'2014-06-21',	'LEBEN',	'',	0,	'offen',	'2014-06-14',	0,	'0000-00-00 00:00:00'),
(35904,	0,	'veg. gefÃƒÂ¼llte Schnitzel',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2014-06-21',	'LEBEN',	'',	0,	'offen',	'2014-06-14',	0,	'0000-00-00 00:00:00'),
(35914,	0,	'Curry GeflÃƒÂ¼gelwurst ( veg. )',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2014-06-21',	'LEBEN',	'',	0,	'offen',	'2014-06-14',	0,	'0000-00-00 00:00:00'),
(35924,	0,	'veg. BockwÃƒÂ¼rstchen ( Wienerle )',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2014-06-21',	'LEBEN',	'',	0,	'offen',	'2014-06-14',	0,	'0000-00-00 00:00:00'),
(35934,	0,	'Senf',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	1.000,	'2014-06-21',	'LEBEN',	'',	0,	'offen',	'2014-06-14',	0,	'0000-00-00 00:00:00'),
(35944,	0,	'RotbÃƒÂ¤ckchensaft',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2014-06-21',	'LEBEN',	'',	0,	'offen',	'2014-06-14',	0,	'0000-00-00 00:00:00'),
(35954,	0,	'Oxy Action Waschpulver gegen Flecken ( fÃƒÂ¼r hartnÃƒÂ¤ckiges )',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2014-06-21',	'HAUSHALT',	'',	0,	'offen',	'2014-06-14',	0,	'0000-00-00 00:00:00'),
(35964,	0,	'Dove Deo',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2014-06-21',	'HAUSHALT',	'',	0,	'offen',	'2014-06-14',	0,	'0000-00-00 00:00:00'),
(35974,	0,	'Butterbrotpapier zum abreissen',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2014-06-21',	'HAUSHALT',	'',	0,	'offen',	'2014-06-14',	0,	'0000-00-00 00:00:00'),
(35984,	0,	'Kinderpflaster',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2014-06-21',	'KIND',	'',	0,	'offen',	'2014-06-14',	0,	'0000-00-00 00:00:00'),
(35994,	0,	'Tesa Film',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2014-06-21',	'HAUSHALT',	'',	0,	'offen',	'2014-06-14',	0,	'0000-00-00 00:00:00'),
(36004,	0,	'Volvic kleine Flaschen',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	6.000,	'2014-06-21',	'LEBEN',	'',	0,	'offen',	'2014-06-14',	0,	'0000-00-00 00:00:00'),
(36014,	0,	'Ãƒâ€pfel Braeburn',	'',	'',	'',	'Obst / Gemuese',	'Aldi',	1.55,	1.000,	'2014-06-28',	'LEBEN',	'',	0,	'offen',	'2014-06-28',	0,	'0000-00-00 00:00:00'),
(36024,	0,	'Baguette-BrÃƒÂ¶tchen',	'',	'',	'',	'Brotwaren',	'Aldi',	0.35,	1.000,	'2014-06-28',	'LEBEN',	'22115904',	0,	'offen',	'2014-06-28',	0,	'0000-00-00 00:00:00'),
(36034,	0,	'Bananen',	'',	'',	'',	'Obst / Gemuese',	'Aldi',	0.89,	1.000,	'2014-06-28',	'LEBEN',	'',	0,	'offen',	'2014-06-28',	0,	'0000-00-00 00:00:00'),
(36044,	0,	'Bio Kartoffeln',	'',	'',	'',	'Obst / Gemuese',	'Aldi',	1.79,	1.000,	'2014-06-28',	'LEBEN',	'4050373133986',	0,	'offen',	'2014-06-28',	0,	'0000-00-00 00:00:00'),
(36054,	0,	'Broccoli',	'',	'',	'',	'Obst / Gemuese',	'Aldi',	0.95,	1.000,	'2014-06-28',	'LEBEN',	'',	0,	'offen',	'2014-06-28',	0,	'0000-00-00 00:00:00'),
(36064,	0,	'H-Milch',	'',	'',	'',	'Milchprodukte',	'Aldi',	0.59,	1.000,	'2014-06-28',	'LEBEN',	'22116413',	0,	'offen',	'2014-06-28',	0,	'0000-00-00 00:00:00'),
(36074,	0,	'KÃƒÂ¤seaufschnitt',	'',	'',	'',	'Milchprodukte',	'Aldi',	1.39,	1.000,	'2014-06-28',	'LEBEN',	'22144225',	0,	'offen',	'2014-06-28',	0,	'0000-00-00 00:00:00'),
(36084,	0,	'Kiwi',	'',	'',	'',	'Obst / Gemuese',	'Aldi',	1.29,	1.000,	'2014-06-28',	'LEBEN',	'',	0,	'offen',	'2014-06-28',	0,	'0000-00-00 00:00:00'),
(36094,	0,	'Margarine',	'',	'',	'',	'(ohne)',	'Aldi',	0.69,	1.000,	'2014-06-28',	'LEBEN',	'22112446',	0,	'offen',	'2014-06-28',	0,	'0000-00-00 00:00:00'),
(36104,	0,	'Multivitaminsaft',	'',	'',	'',	'Getraenke',	'Aldi',	0.95,	6.000,	'2014-06-28',	'LEBEN',	'22131218',	0,	'offen',	'2014-06-28',	0,	'0000-00-00 00:00:00'),
(36114,	0,	'Naschtomaten ( Mini )',	'',	'',	'',	'Obst / Gemuese',	'Aldi',	2.49,	1.000,	'2014-06-28',	'LEBEN',	'4049929247550',	0,	'offen',	'2014-06-28',	0,	'0000-00-00 00:00:00'),
(36124,	0,	'O-Saft',	'',	'',	'',	'Getraenke',	'Aldi',	0.95,	6.000,	'2014-06-28',	'LEBEN',	'22131201',	0,	'offen',	'2014-06-28',	0,	'0000-00-00 00:00:00'),
(36134,	0,	'Paprikaschoten rot',	'',	'',	'',	'Obst / Gemuese',	'Aldi',	1.69,	1.000,	'2014-06-28',	'LEBEN',	'',	0,	'offen',	'2014-06-28',	0,	'0000-00-00 00:00:00'),
(36144,	0,	'passierte tomaten',	'',	'',	'',	'Konserven',	'Aldi',	0.35,	1.000,	'2014-06-28',	'LEBEN',	'22114235',	0,	'offen',	'2014-06-28',	0,	'0000-00-00 00:00:00'),
(36154,	0,	'Tofuaufschnitt',	'',	'',	'',	'Milchprodukte',	'Aldi',	1.79,	1.000,	'2014-06-28',	'LEBEN',	'22144515',	0,	'offen',	'2014-06-28',	0,	'0000-00-00 00:00:00'),
(36164,	0,	'Tomaten',	'',	'',	'',	'Obst / Gemuese',	'Aldi',	1.00,	1.000,	'2014-06-28',	'LEBEN',	'',	0,	'offen',	'2014-06-28',	0,	'0000-00-00 00:00:00'),
(36174,	0,	'Traubenschorle',	'',	'',	'',	'Getraenke',	'Aldi',	0.89,	6.000,	'2014-06-28',	'LEBEN',	'42141167',	0,	'offen',	'2014-06-28',	0,	'0000-00-00 00:00:00'),
(36184,	0,	'HÃƒÂ¼ttenkÃƒÂ¤se',	'',	'',	'',	'Milchprodukte',	'Kaufland',	2.00,	1.000,	'2014-06-28',	'LEBEN',	'',	0,	'offen',	'2014-06-28',	0,	'0000-00-00 00:00:00'),
(36194,	0,	'Orangenwasser',	'',	'',	'',	'Getraenke',	'Kaufland',	0.49,	6.000,	'2014-06-28',	'LEBEN',	'4300175374170',	0,	'offen',	'2014-06-28',	0,	'0000-00-00 00:00:00'),
(36204,	0,	'Vollkornnudeln',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2014-06-28',	'LEBEN',	'',	0,	'offen',	'2014-06-28',	0,	'0000-00-00 00:00:00'),
(36214,	0,	'Abrazo Reinigungspad',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2014-06-28',	'HAUSHALT',	'',	0,	'offen',	'2014-06-28',	0,	'0000-00-00 00:00:00'),
(36224,	0,	'Hafermilch Probepackung',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2014-06-28',	'LEBEN',	'',	0,	'offen',	'2014-06-28',	0,	'0000-00-00 00:00:00'),
(36234,	0,	'Wassermelone',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2014-06-28',	'LEBEN',	'',	0,	'offen',	'2014-06-28',	0,	'0000-00-00 00:00:00'),
(36244,	0,	'veg. Aufschnitt',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	2.000,	'2014-06-28',	'LEBEN',	'',	0,	'offen',	'2014-06-28',	0,	'0000-00-00 00:00:00'),
(36254,	0,	'veg. Pasteten',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	2.000,	'2014-06-28',	'LEBEN',	'',	0,	'offen',	'2014-06-28',	0,	'0000-00-00 00:00:00'),
(36264,	0,	'HandspÃƒÂ¼lmittel',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	1.000,	'2014-06-28',	'HAUSHALT',	'',	0,	'offen',	'2014-06-28',	0,	'0000-00-00 00:00:00'),
(36274,	0,	'Kalkstoppulver fÃƒÂ¼r die Waschmaschine',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2014-06-28',	'HAUSHALT',	'',	0,	'offen',	'2014-06-28',	0,	'0000-00-00 00:00:00'),
(36284,	0,	'Tomaten Mozarella Salz',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2014-06-28',	'LEBEN',	'',	0,	'offen',	'2014-06-28',	0,	'0000-00-00 00:00:00'),
(36294,	0,	'Kaffeefilter GrÃƒÂ¶ÃƒÅ¸e 4',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	1.000,	'2014-06-28',	'HAUSHALT',	'',	0,	'offen',	'2014-06-28',	0,	'0000-00-00 00:00:00'),
(36304,	0,	'Kaffee',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	1.000,	'2014-06-28',	'LEBEN',	'',	0,	'offen',	'2014-06-28',	0,	'0000-00-00 00:00:00'),
(36314,	0,	'Marzipandecke',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2014-06-28',	'LEBEN',	'',	0,	'offen',	'2014-06-28',	0,	'0000-00-00 00:00:00'),
(36324,	0,	'Selleriesalat',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2014-06-28',	'LEBEN',	'',	0,	'offen',	'2014-06-28',	0,	'0000-00-00 00:00:00'),
(36334,	0,	'Peperonie Pikant im Glas',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2014-06-28',	'LEBEN',	'',	0,	'offen',	'2014-06-28',	0,	'0000-00-00 00:00:00'),
(36344,	0,	'Mittagessen fÃƒÂ¼r Sonntag.........',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2014-06-28',	'LEBEN',	'',	0,	'offen',	'2014-06-28',	0,	'0000-00-00 00:00:00'),
(36354,	0,	'Marzipandecke',	'',	'',	'',	'',	'Kaufland',	1.00,	1.000,	'2013-07-27',	'LEBEN',	'',	0,	'offen',	'2014-07-04',	0,	'0000-00-00 00:00:00'),
(36364,	0,	'Zuckerrosen',	'',	'',	'',	'',	'Kaufland',	1.00,	2.000,	'2013-07-27',	'LEBEN',	'',	0,	'offen',	'2014-07-04',	0,	'0000-00-00 00:00:00'),
(36374,	0,	'Geburtstagskerzen',	'',	'',	'',	'',	'Kaufland',	1.00,	1.000,	'2013-07-27',	'HAUSHALT',	'',	0,	'offen',	'2014-07-04',	0,	'0000-00-00 00:00:00'),
(36384,	0,	'rosa Glitzerstreusel',	'',	'',	'',	'',	'Kaufland',	1.00,	1.000,	'2013-07-27',	'LEBEN',	'',	0,	'offen',	'2014-07-04',	0,	'0000-00-00 00:00:00'),
(36394,	0,	'weiÃŸe Schokolade',	'',	'',	'',	'',	'Kaufland',	1.00,	5.000,	'2013-07-27',	'LEBEN',	'',	0,	'offen',	'2014-07-04',	0,	'0000-00-00 00:00:00'),
(36404,	0,	'Sahne 200ml',	'',	'',	'',	'',	'Aldi',	1.00,	1.000,	'2013-07-27',	'LEBEN',	'',	0,	'offen',	'2014-07-04',	0,	'0000-00-00 00:00:00'),
(36414,	0,	'Butter 150g',	'',	'',	'',	'',	'Aldi',	1.00,	1.000,	'2013-07-27',	'LEBEN',	'',	0,	'offen',	'2014-07-04',	0,	'0000-00-00 00:00:00'),
(36424,	0,	'Rosinen',	'',	'',	'',	'',	'Aldi',	1.00,	2.000,	'2013-07-27',	'LEBEN',	'',	0,	'offen',	'2014-07-04',	0,	'0000-00-00 00:00:00'),
(36434,	0,	'Malzbier',	'',	'',	'',	'',	'Aldi',	1.00,	1.000,	'2013-07-27',	'LEBEN',	'',	0,	'offen',	'2014-07-04',	0,	'0000-00-00 00:00:00'),
(36444,	0,	'Mehl Typ 405',	'',	'',	'',	'',	'Aldi',	0.45,	2.000,	'2013-07-27',	'LEBEN',	'',	0,	'offen',	'2014-07-04',	0,	'0000-00-00 00:00:00'),
(36454,	0,	'Kokusmilch 200ml',	'',	'',	'',	'',	'Kaufland',	1.00,	1.000,	'2013-07-27',	'LEBEN',	'',	0,	'offen',	'2014-07-04',	0,	'0000-00-00 00:00:00'),
(36464,	0,	'Mandeln blanchiert',	'',	'',	'',	'',	'Kaufland',	1.00,	1.000,	'2013-07-27',	'LEBEN',	'',	0,	'offen',	'2014-07-04',	0,	'0000-00-00 00:00:00'),
(36474,	0,	'NÃ¼sse',	'',	'',	'',	'',	'Kaufland',	1.00,	1.000,	'2013-07-27',	'LEBEN',	'',	0,	'offen',	'2014-07-04',	0,	'0000-00-00 00:00:00'),
(36484,	0,	'Ananas',	'',	'',	'',	'',	'Aldi',	1.00,	1.000,	'2013-07-27',	'LEBEN',	'',	0,	'offen',	'2014-07-04',	0,	'0000-00-00 00:00:00'),
(36494,	0,	'Minitomaten',	'',	'',	'',	'',	'Aldi',	1.00,	3.000,	'2013-07-27',	'LEBEN',	'',	0,	'offen',	'2014-07-04',	0,	'0000-00-00 00:00:00'),
(36504,	0,	'Mini-Mozarella',	'',	'',	'',	'',	'Aldi',	1.00,	3.000,	'2013-07-27',	'LEBEN',	'',	0,	'offen',	'2014-07-04',	0,	'0000-00-00 00:00:00'),
(36514,	0,	'Tomaten',	'',	'',	'',	'',	'Aldi',	1.00,	1.000,	'2013-07-27',	'LEBEN',	'',	0,	'offen',	'2014-07-04',	0,	'0000-00-00 00:00:00'),
(36524,	0,	'frischer Basilikum',	'',	'',	'',	'',	'Aldi',	1.00,	1.000,	'2013-07-27',	'LEBEN',	'',	0,	'offen',	'2014-07-04',	0,	'0000-00-00 00:00:00'),
(36534,	0,	'Wassermelone',	'',	'',	'',	'',	'Aldi',	1.00,	1.000,	'2013-07-27',	'LEBEN',	'',	0,	'offen',	'2014-07-04',	0,	'0000-00-00 00:00:00'),
(36544,	0,	'SÃ¼ssigkeiten in kleinen Beutel',	'',	'',	'',	'',	'Aldi',	1.00,	1.000,	'2013-07-27',	'LEBEN',	'',	0,	'offen',	'2014-07-04',	0,	'0000-00-00 00:00:00'),
(36554,	0,	'passierte Tomaten',	'',	'',	'',	'',	'Aldi',	0.35,	5.000,	'2013-07-27',	'LEBEN',	'',	0,	'offen',	'2014-07-04',	0,	'0000-00-00 00:00:00'),
(36564,	0,	'Dosenmais',	'',	'',	'',	'',	'Aldi',	0.00,	3.000,	'2013-07-27',	'LEBEN',	'',	0,	'offen',	'2014-07-04',	0,	'0000-00-00 00:00:00'),
(36574,	0,	'Schlangengurken gerade',	'',	'',	'',	'',	'Aldi',	1.00,	2.000,	'2013-07-27',	'LEBEN',	'',	0,	'offen',	'2014-07-04',	0,	'0000-00-00 00:00:00'),
(36584,	0,	'Paprikaschoten gelb grÃ¼n',	'',	'',	'',	'',	'Aldi',	1.00,	3.000,	'2013-07-27',	'LEBEN',	'',	0,	'offen',	'2014-07-04',	0,	'0000-00-00 00:00:00'),
(36594,	0,	'Holzspiesse',	'',	'',	'',	'',	'Kaufland',	1.00,	1.000,	'2013-07-27',	'LEBEN',	'',	0,	'offen',	'2014-07-04',	0,	'0000-00-00 00:00:00'),
(36604,	0,	'Papiertischdecke',	'',	'',	'',	'',	'Kaufland',	1.00,	1.000,	'2013-07-27',	'HAUSHALT',	'',	0,	'offen',	'2014-07-04',	0,	'0000-00-00 00:00:00'),
(36614,	0,	'TontÃ¶pfe',	'',	'',	'',	'',	'Kaufland',	1.00,	7.000,	'2013-07-27',	'HAUSHALT',	'',	0,	'offen',	'2014-07-04',	0,	'0000-00-00 00:00:00'),
(36624,	0,	'Sonnenblumensamen',	'',	'',	'',	'',	'Kaufland',	1.00,	1.000,	'2013-07-27',	'GESCH',	'',	0,	'offen',	'2014-07-04',	0,	'0000-00-00 00:00:00'),
(36634,	0,	'bunte Luftballons',	'',	'',	'',	'',	'Kaufland',	1.00,	1.000,	'2013-07-27',	'GESCH',	'',	0,	'offen',	'2014-07-04',	0,	'0000-00-00 00:00:00'),
(36644,	0,	'Luftschlangen',	'',	'',	'',	'',	'Kaufland',	1.00,	1.000,	'2013-07-27',	'GESCH',	'',	0,	'offen',	'2014-07-04',	0,	'0000-00-00 00:00:00'),
(36654,	0,	'Kreppapier',	'',	'',	'',	'',	'Kaufland',	1.00,	1.000,	'2013-07-27',	'GESCH',	'',	0,	'offen',	'2014-07-04',	0,	'0000-00-00 00:00:00'),
(36664,	0,	'Strohhalme',	'',	'',	'',	'',	'Kaufland',	1.00,	1.000,	'2013-07-27',	'GESCH',	'',	0,	'offen',	'2014-07-04',	0,	'0000-00-00 00:00:00'),
(36674,	0,	'WattebÃ¤llchen',	'',	'',	'',	'',	'Kaufland',	1.00,	1.000,	'2013-07-27',	'PFLEG',	'',	0,	'offen',	'2014-07-04',	0,	'0000-00-00 00:00:00'),
(36684,	0,	'Kartoffeln',	'',	'',	'',	'',	'Aldi',	1.00,	1.000,	'2013-07-27',	'LEBEN',	'',	0,	'offen',	'2014-07-04',	0,	'0000-00-00 00:00:00'),
(36694,	0,	'Ã„pfel Braeburn',	'',	'',	'',	'Obst / Gemuese',	'Aldi',	1.55,	1.000,	'2013-07-27',	'LEBEN',	'',	0,	'offen',	'2014-07-04',	0,	'0000-00-00 00:00:00'),
(36704,	0,	'Bauernschnitt',	'',	'',	'',	'Brotwaren',	'Aldi',	0.59,	1.000,	'2013-07-27',	'LEBEN',	'29705108',	0,	'offen',	'2014-07-04',	0,	'0000-00-00 00:00:00'),
(36714,	0,	'KÃ¤seaufschnitt',	'',	'',	'',	'Milchprodukte',	'Aldi',	1.39,	1.000,	'2013-07-27',	'LEBEN',	'22144225',	0,	'offen',	'2014-07-04',	0,	'0000-00-00 00:00:00'),
(36724,	0,	'KnÃ¤ckebrot',	'',	'',	'',	'Brotwaren',	'Aldi',	1.00,	1.000,	'2013-07-27',	'LEBEN',	'',	0,	'offen',	'2014-07-04',	0,	'0000-00-00 00:00:00'),
(36734,	0,	'Tofuaufschnitt',	'',	'',	'',	'Milchprodukte',	'Aldi',	1.79,	1.000,	'2013-07-27',	'LEBEN',	'22144515',	0,	'offen',	'2014-07-04',	0,	'0000-00-00 00:00:00'),
(36744,	0,	'Traubenschorle',	'',	'',	'',	'Getraenke',	'Aldi',	0.79,	6.000,	'2013-07-27',	'LEBEN',	'42141167',	0,	'offen',	'2014-07-04',	0,	'0000-00-00 00:00:00'),
(36754,	0,	'Apfelsaft',	'',	'',	'',	'',	'Aldi',	1.00,	5.000,	'2013-07-27',	'LEBEN',	'',	0,	'offen',	'2014-07-04',	0,	'0000-00-00 00:00:00'),
(36764,	0,	'Stilles Wasser',	'',	'',	'',	'',	'Aldi',	1.00,	6.000,	'2013-07-27',	'LEBEN',	'',	0,	'offen',	'2014-07-04',	0,	'0000-00-00 00:00:00'),
(36774,	0,	'Plastikkannen',	'',	'',	'',	'',	'Aldi',	2.00,	2.000,	'2013-07-27',	'HAUSHALT',	'',	0,	'offen',	'2014-07-04',	0,	'0000-00-00 00:00:00'),
(36784,	0,	'O-Saft',	'',	'',	'',	'Getraenke',	'Aldi',	0.95,	6.000,	'2013-07-27',	'LEBEN',	'22131201',	0,	'offen',	'2014-07-04',	0,	'0000-00-00 00:00:00'),
(36794,	0,	'Dinkelmilch',	'',	'',	'',	'',	'Kaufland',	1.00,	1.000,	'2013-07-27',	'LEBEN',	'',	0,	'offen',	'2014-07-04',	0,	'0000-00-00 00:00:00'),
(36804,	0,	'veg. Aufschnitt',	'',	'',	'',	'',	'Aldi',	1.00,	2.000,	'2013-07-27',	'LEBEN',	'',	0,	'offen',	'2014-07-04',	0,	'0000-00-00 00:00:00'),
(36814,	0,	'veg Pastete Linsencurry',	'',	'',	'',	'',	'Aldi',	1.00,	2.000,	'2013-07-27',	'LEBEN',	'',	0,	'offen',	'2014-07-04',	0,	'0000-00-00 00:00:00'),
(36824,	0,	'Klopapier',	'',	'',	'',	'',	'Aldi',	1.00,	1.000,	'2013-07-27',	'HAUSHALT',	'',	0,	'offen',	'2014-07-04',	0,	'0000-00-00 00:00:00'),
(36834,	0,	'Tortenspitze',	'',	'',	'',	'',	'Kaufland',	1.00,	1.000,	'2013-07-27',	'HAUSHALT',	'',	0,	'offen',	'2014-07-04',	0,	'0000-00-00 00:00:00'),
(36844,	0,	'Ãƒâ€pfel Braeburn',	'',	'',	'',	'Obst / Gemuese',	'Aldi',	1.55,	1.000,	'2014-09-13',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(36854,	0,	'Baguette-BrÃƒÂ¶tchen',	'',	'',	'',	'Brotwaren',	'Aldi',	0.35,	1.000,	'2014-09-13',	'LEBEN',	'22115904',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(36864,	0,	'Bauernschnitt',	'',	'',	'',	'Brotwaren',	'Aldi',	0.59,	1.000,	'2014-09-13',	'LEBEN',	'29705108',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(36874,	0,	'KÃƒÂ¤seaufschnitt',	'',	'',	'',	'Milchprodukte',	'Aldi',	1.39,	1.000,	'2014-09-13',	'LEBEN',	'22144225',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(36884,	0,	'Margarine',	'',	'',	'',	'(ohne)',	'Aldi',	0.69,	1.000,	'2014-09-13',	'LEBEN',	'22112446',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(36894,	0,	'Naschtomaten ( Mini )',	'',	'',	'',	'Obst / Gemuese',	'Aldi',	2.49,	1.000,	'2014-09-13',	'LEBEN',	'4049929247550',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(36904,	0,	'Schlangengurke',	'',	'',	'',	'Obst / Gemuese',	'Aldi',	0.30,	1.000,	'2014-09-13',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(36914,	0,	'Traubenschorle',	'',	'',	'',	'Getraenke',	'Aldi',	0.89,	6.000,	'2014-09-13',	'LEBEN',	'42141167',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(36924,	0,	'Orangenwasser',	'',	'',	'',	'Getraenke',	'Kaufland',	0.49,	6.000,	'2014-09-13',	'LEBEN',	'4300175374170',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(36934,	0,	'kaesepizza',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2014-09-13',	'LEBEN',	'',	0,	'OK',	'2014-08-02',	0,	'0000-00-00 00:00:00'),
(36944,	0,	'veganer aufschnitt',	'',	'',	'',	'(ohne)',	'Kaufland',	2.00,	1.000,	'2014-09-13',	'LEBEN',	'',	0,	'OK',	'2014-08-02',	0,	'0000-00-00 00:00:00'),
(36954,	0,	'dinkelmilch',	'',	'',	'',	'(ohne)',	'Kaufland',	2.00,	2.000,	'2014-09-13',	'LEBEN',	'',	0,	'OK',	'2014-08-02',	0,	'0000-00-00 00:00:00'),
(36964,	0,	'pasteten',	'',	'',	'',	'(ohne)',	'Aldi',	2.00,	2.000,	'2014-09-13',	'LEBEN',	'',	0,	'OK',	'2014-08-02',	0,	'0000-00-00 00:00:00'),
(36974,	0,	'tomaten',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	1.000,	'2014-09-13',	'LEBEN',	'',	0,	'OK',	'2014-08-02',	0,	'0000-00-00 00:00:00'),
(36984,	0,	'karottensalat',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	1.000,	'2014-09-13',	'LEBEN',	'',	0,	'OK',	'2014-08-02',	0,	'0000-00-00 00:00:00'),
(36994,	0,	'brokkoli',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	1.000,	'2014-09-13',	'LEBEN',	'',	0,	'OK',	'2014-08-02',	0,	'0000-00-00 00:00:00'),
(37004,	0,	'gewuerygurken',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	1.000,	'2014-09-13',	'LEBEN',	'',	0,	'OK',	'2014-08-02',	0,	'0000-00-00 00:00:00'),
(37014,	0,	'wc/stein',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	1.000,	'2014-09-13',	'HAUSHALT',	'',	0,	'OK',	'2014-08-02',	0,	'0000-00-00 00:00:00'),
(37024,	0,	'klopapier',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	1.000,	'2014-09-13',	'HAUSHALT',	'',	0,	'OK',	'2014-08-02',	0,	'0000-00-00 00:00:00'),
(37034,	0,	'kuechentuecher',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	1.000,	'2014-09-13',	'HAUSHALT',	'',	0,	'OK',	'2014-08-02',	0,	'0000-00-00 00:00:00'),
(37044,	0,	'hafermilch',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2014-09-13',	'LEBEN',	'',	0,	'OK',	'2014-08-02',	0,	'0000-00-00 00:00:00'),
(37054,	0,	'wassermelone',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2014-09-13',	'LEBEN',	'',	0,	'OK',	'2014-08-02',	0,	'0000-00-00 00:00:00'),
(37064,	0,	'erdbeermilchpulver',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2014-09-13',	'LEBEN',	'',	0,	'OK',	'2014-08-02',	0,	'0000-00-00 00:00:00'),
(37074,	0,	'Pfand',	'',	'',	'',	'(ohne)',	'Aldi',	0.25,	6.000,	'2014-09-13',	'PFAND',	'',	0,	'OK',	'2014-08-02',	0,	'0000-00-00 00:00:00'),
(37084,	0,	'Pfand',	'',	'',	'',	'(ohne)',	'Kaufland',	0.25,	6.000,	'2014-09-13',	'PFAND',	'',	0,	'OK',	'2014-08-02',	0,	'0000-00-00 00:00:00'),
(37094,	0,	'Ãƒâ€pfel Braeburn',	'',	'',	'',	'Obst / Gemuese',	'Penny',	1.55,	1.000,	'2014-09-26',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(37104,	0,	'Baguette-BrÃƒÂ¶tchen',	'',	'',	'',	'Brotwaren',	'Penny',	0.35,	1.000,	'2014-09-26',	'LEBEN',	'22115904',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(37114,	0,	'GemÃƒÂ¼sebrÃƒÂ¼he',	'',	'',	'',	'Gewuerze',	'Penny',	0.59,	1.000,	'2014-09-26',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(37124,	0,	'Kiwi',	'',	'',	'',	'Obst / Gemuese',	'Penny',	1.29,	1.000,	'2014-09-26',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(37134,	0,	'KnÃƒÂ¤ckebrot',	'',	'',	'',	'Brotwaren',	'Penny',	1.00,	1.000,	'2014-09-26',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(37144,	0,	'Paprikaschoten rot',	'',	'',	'',	'Obst / Gemuese',	'Penny',	1.69,	1.000,	'2014-09-26',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(37154,	0,	'passierte tomaten',	'',	'',	'',	'Konserven',	'Penny',	0.35,	1.000,	'2014-09-26',	'LEBEN',	'22114235',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(37164,	0,	'RapsÃƒÂ¶l',	'',	'',	'',	'Konserven',	'Penny',	0.95,	1.000,	'2014-09-26',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(37174,	0,	'Schlangengurke',	'',	'',	'',	'Obst / Gemuese',	'Penny',	0.30,	1.000,	'2014-09-26',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(37184,	0,	'Sojaschnitzel',	'',	'',	'',	'KÃƒÂ¼hltheke',	'Penny',	1.79,	2.000,	'2014-09-26',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(37194,	0,	'Spiralinudeln',	'',	'',	'',	'Brotwaren',	'Penny',	0.49,	1.000,	'2014-09-26',	'LEBEN',	'22111326',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(37204,	0,	'Stilles Wasser',	'',	'',	'',	'GetrÃƒÂ¤nke',	'Penny',	2.64,	1.000,	'2014-09-26',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(37214,	0,	'Tofuaufschnitt',	'',	'',	'',	'Milchprodukte',	'Penny',	1.79,	1.000,	'2014-09-26',	'LEBEN',	'22144515',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(37224,	0,	'Tomaten',	'',	'',	'',	'Obst / Gemuese',	'Penny',	1.00,	1.000,	'2014-09-26',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(37234,	0,	'Traubenschorle',	'',	'',	'',	'Getraenke',	'Penny',	0.89,	6.000,	'2014-09-26',	'LEBEN',	'42141167',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(37244,	0,	'KrÃƒÂ¤utersalz',	'',	'',	'',	'Salz / Mehl',	'Penny',	1.00,	1.000,	'2014-09-26',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(37254,	0,	'Orangenwasser',	'',	'',	'',	'Getraenke',	'Penny',	0.49,	6.000,	'2014-09-26',	'LEBEN',	'4300175374170',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(37264,	0,	'Sofix fÃƒÂ¼r alle BÃƒÂ¶den',	'',	'',	'',	'Haushalt / Putzmittel',	'Penny',	4.45,	1.000,	'2014-09-26',	'HAUSHALT',	'4015000019927',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(37274,	0,	'vegane Pasteten Aldi',	'',	'',	'',	'(ohne)',	'Penny',	0.00,	4.000,	'2014-09-26',	'LEBEN',	'',	0,	'OK',	'2014-09-19',	0,	'0000-00-00 00:00:00'),
(37284,	0,	'vegane Salami wenn mÃƒÂ¶glich',	'',	'',	'',	'(ohne)',	'Penny',	0.00,	1.000,	'2014-09-26',	'LEBEN',	'',	0,	'OK',	'2014-09-19',	0,	'0000-00-00 00:00:00'),
(37294,	0,	'vegetarischen Aufschnitt fÃƒÂ¼r Horst',	'',	'',	'',	'(ohne)',	'Penny',	0.00,	1.000,	'2014-09-26',	'LEBEN',	'',	0,	'OK',	'2014-09-19',	0,	'0000-00-00 00:00:00'),
(37304,	0,	'HandspÃƒÂ¼lmittel',	'',	'',	'',	'(ohne)',	'Penny',	0.00,	1.000,	'2014-09-26',	'HAUSHALT',	'',	0,	'OK',	'2014-09-19',	0,	'0000-00-00 00:00:00'),
(37314,	0,	'groÃƒÅ¸es KÃƒÂ¶rnerbrot',	'',	'',	'',	'(ohne)',	'Penny',	0.00,	1.000,	'2014-09-26',	'LEBEN',	'',	0,	'OK',	'2014-09-19',	0,	'0000-00-00 00:00:00'),
(37324,	0,	'Kaffeebohnen',	'',	'',	'',	'(ohne)',	'Penny',	0.00,	1.000,	'2014-09-26',	'LEBEN',	'',	0,	'OK',	'2014-09-19',	0,	'0000-00-00 00:00:00'),
(37334,	0,	'GewÃƒÂ¼rzgurken',	'',	'',	'',	'(ohne)',	'Penny',	0.00,	1.000,	'2014-09-26',	'LEBEN',	'',	0,	'OK',	'2014-09-19',	0,	'0000-00-00 00:00:00'),
(37344,	0,	'weiÃƒÅ¸er Traubensaft fÃƒÂ¼r KÃƒÂ¼rbissuppe',	'',	'',	'',	'(ohne)',	'Penny',	0.00,	1.000,	'2014-09-26',	'LEBEN',	'',	0,	'OK',	'2014-09-19',	0,	'0000-00-00 00:00:00'),
(37354,	0,	'Frische MÃƒÂ¶hren',	'',	'',	'',	'(ohne)',	'Penny',	0.00,	1.000,	'2014-09-26',	'LEBEN',	'',	0,	'OK',	'2014-09-19',	0,	'0000-00-00 00:00:00'),
(37364,	0,	'Fladenbrot',	'',	'',	'',	'(ohne)',	'Penny',	0.00,	1.000,	'2014-09-26',	'LEBEN',	'',	0,	'OK',	'2014-09-19',	0,	'0000-00-00 00:00:00'),
(37374,	0,	'Malzbier',	'',	'',	'',	'(ohne)',	'Penny',	0.00,	1.000,	'2014-09-26',	'LEBEN',	'',	0,	'OK',	'2014-09-20',	0,	'0000-00-00 00:00:00'),
(37384,	0,	'Ãƒâ€pfel Braeburn',	'',	'',	'',	'Obst / Gemuese',	'Penny',	1.55,	1.000,	'2014-09-27',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(37394,	0,	'Baguette-BrÃƒÂ¶tchen',	'',	'',	'',	'Brotwaren',	'Penny',	0.35,	1.000,	'2014-09-27',	'LEBEN',	'22115904',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(37404,	0,	'Bio Kartoffeln',	'',	'',	'',	'Obst / Gemuese',	'Penny',	1.79,	1.000,	'2014-09-27',	'LEBEN',	'4050373133986',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(37414,	0,	'KÃƒÂ¤seaufschnitt',	'',	'',	'',	'Milchprodukte',	'Penny',	1.39,	1.000,	'2014-09-27',	'LEBEN',	'22144225',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(37424,	0,	'Kiwi',	'',	'',	'',	'Obst / Gemuese',	'Penny',	1.29,	1.000,	'2014-09-27',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(37434,	0,	'O-Saft',	'',	'',	'',	'Getraenke',	'Penny',	0.95,	6.000,	'2014-09-27',	'LEBEN',	'22131201',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(37444,	0,	'Paprikaschoten rot',	'',	'',	'',	'Obst / Gemuese',	'Penny',	1.69,	1.000,	'2014-09-27',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(37454,	0,	'passierte tomaten',	'',	'',	'',	'Konserven',	'Penny',	0.35,	1.000,	'2014-09-27',	'LEBEN',	'22114235',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(37464,	0,	'RapsÃƒÂ¶l',	'',	'',	'',	'Konserven',	'Penny',	0.95,	1.000,	'2014-09-27',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(37474,	0,	'Schlangengurke',	'',	'',	'',	'Obst / Gemuese',	'Penny',	0.30,	1.000,	'2014-09-27',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(37484,	0,	'Spiralinudeln',	'',	'',	'',	'Brotwaren',	'Penny',	0.49,	1.000,	'2014-09-27',	'LEBEN',	'22111326',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(37494,	0,	'Tomaten',	'',	'',	'',	'Obst / Gemuese',	'Penny',	1.00,	1.000,	'2014-09-27',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(37504,	0,	'Zwiebeln',	'',	'',	'',	'Obst / Gemuese',	'Penny',	0.69,	1.000,	'2014-09-27',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(37514,	0,	'Orangenwasser',	'',	'',	'',	'Getraenke',	'Kaufland',	0.49,	6.000,	'2014-09-27',	'LEBEN',	'4300175374170',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(37524,	0,	'chinakohl',	'',	'',	'',	'(ohne)',	'Penny',	0.00,	1.000,	'2014-09-27',	'LEBEN',	'',	0,	'OK',	'2014-09-27',	0,	'0000-00-00 00:00:00'),
(37534,	0,	'RÃƒÂ¤uchertofu',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	2.000,	'2014-09-27',	'LEBEN',	'',	0,	'OK',	'2014-09-27',	0,	'0000-00-00 00:00:00'),
(37544,	0,	'Sojasauce',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2014-09-27',	'LEBEN',	'',	0,	'OK',	'2014-09-27',	0,	'0000-00-00 00:00:00'),
(37554,	0,	'Sesamsamen',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2014-09-27',	'LEBEN',	'',	0,	'OK',	'2014-09-27',	0,	'0000-00-00 00:00:00'),
(37564,	0,	'SojafrischkÃƒÂ¤se',	'',	'',	'',	'(ohne)',	'Alnatura',	0.00,	1.000,	'2014-09-27',	'LEBEN',	'',	0,	'offen',	'2014-09-27',	0,	'0000-00-00 00:00:00'),
(37574,	0,	'SÃƒÂ¼sskartoffeln',	'',	'',	'',	'(ohne)',	'Alnatura',	0.00,	1.000,	'2014-09-27',	'LEBEN',	'',	0,	'offen',	'2014-09-27',	0,	'0000-00-00 00:00:00'),
(37584,	0,	'veg. MÃƒÂ¼sli',	'',	'',	'',	'(ohne)',	'Alnatura',	0.00,	1.000,	'2014-09-27',	'LEBEN',	'',	0,	'offen',	'2014-09-27',	0,	'0000-00-00 00:00:00'),
(37594,	0,	'veg. WÃƒÂ¼rstchen',	'',	'',	'',	'(ohne)',	'Alnatura',	0.00,	1.000,	'2014-09-27',	'LEBEN',	'',	0,	'offen',	'2014-09-27',	0,	'0000-00-00 00:00:00'),
(37604,	0,	'veg. Lyoner',	'',	'',	'',	'(ohne)',	'Alnatura',	0.00,	1.000,	'2014-09-27',	'LEBEN',	'',	0,	'offen',	'2014-09-27',	0,	'0000-00-00 00:00:00'),
(37614,	0,	'Dinkelmilch',	'',	'',	'',	'(ohne)',	'Alnatura',	0.00,	1.000,	'2014-09-27',	'LEBEN',	'',	0,	'offen',	'2014-09-27',	0,	'0000-00-00 00:00:00'),
(37624,	0,	'Hafermilch',	'',	'',	'',	'(ohne)',	'Alnatura',	0.00,	1.000,	'2014-09-27',	'LEBEN',	'',	0,	'offen',	'2014-09-27',	0,	'0000-00-00 00:00:00'),
(37634,	0,	'Frosch WC Reiniger',	'',	'',	'',	'(ohne)',	'DM',	0.00,	1.000,	'2014-09-27',	'HAUSHALT',	'',	0,	'offen',	'2014-09-27',	0,	'0000-00-00 00:00:00'),
(37644,	0,	'NaturtrÃƒÂ¼ben Apfelsaft',	'',	'',	'',	'(ohne)',	'Penny',	0.00,	1.000,	'2014-09-27',	'LEBEN',	'',	0,	'OK',	'2014-09-27',	0,	'0000-00-00 00:00:00'),
(37654,	0,	'Kaffeemilch',	'',	'',	'',	'(ohne)',	'Penny',	0.00,	1.000,	'2014-09-27',	'LEBEN',	'',	0,	'OK',	'2014-09-27',	0,	'0000-00-00 00:00:00'),
(37664,	0,	'KÃƒÂ¶rnerbrot',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2014-09-27',	'LEBEN',	'',	0,	'OK',	'2014-09-27',	0,	'0000-00-00 00:00:00'),
(37674,	0,	'veg. BÃƒÂ¤llchen',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2014-09-27',	'LEBEN',	'',	0,	'OK',	'2014-09-27',	0,	'0000-00-00 00:00:00'),
(37684,	0,	'Saftorangen',	'',	'',	'',	'(ohne)',	'Penny',	0.00,	1.000,	'2014-09-27',	'LEBEN',	'',	0,	'OK',	'2014-09-27',	0,	'0000-00-00 00:00:00'),
(37694,	0,	'Tofuaufschnitt',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	1.000,	'2014-09-27',	'LEBEN',	'',	0,	'offen',	'2014-09-27',	0,	'0000-00-00 00:00:00'),
(37704,	0,	'Weintrauben kernlos',	'',	'',	'',	'(ohne)',	'Penny',	0.00,	1.000,	'2014-09-27',	'LEBEN',	'',	0,	'OK',	'2014-09-27',	0,	'0000-00-00 00:00:00'),
(37714,	0,	'Kaffeefilter Gr 4',	'',	'',	'',	'(ohne)',	'Penny',	0.00,	1.000,	'2014-09-27',	'HAUSHALT',	'',	0,	'OK',	'2014-09-27',	0,	'0000-00-00 00:00:00'),
(37724,	0,	'Sojacuisine',	'',	'',	'',	'(ohne)',	'Alnatura',	0.00,	1.000,	'2014-09-27',	'LEBEN',	'',	0,	'offen',	'2014-09-27',	0,	'0000-00-00 00:00:00'),
(37734,	0,	'FlÃƒÂ¼ssig Seife',	'',	'',	'',	'(ohne)',	'DM',	0.00,	1.000,	'2014-09-27',	'LEBEN',	'',	0,	'offen',	'2014-09-27',	0,	'0000-00-00 00:00:00'),
(37744,	0,	'Duschzeug',	'',	'',	'',	'(ohne)',	'DM',	0.00,	1.000,	'2014-09-27',	'PFLEG',	'',	0,	'offen',	'2014-09-27',	0,	'0000-00-00 00:00:00'),
(37754,	0,	'Haarshampoo',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2014-09-27',	'KIND',	'',	0,	'OK',	'2014-09-27',	0,	'0000-00-00 00:00:00'),
(37764,	0,	'Limonade',	'',	'',	'',	'(ohne)',	'Penny',	0.00,	1.000,	'2014-09-27',	'LEBEN',	'',	0,	'OK',	'2014-09-27',	0,	'0000-00-00 00:00:00'),
(37774,	0,	'schwarze pfefferkÃƒÂ¶rner',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2014-09-27',	'LEBEN',	'',	0,	'OK',	'2014-09-27',	0,	'0000-00-00 00:00:00'),
(38594,	0,	'Alverde Haarshampoo von DM',	'',	'',	'',	'(ohne)',	'DM',	0.00,	1.000,	'2014-11-28',	'PFLEG',	'',	0,	'offen',	'2014-11-28',	0,	'0000-00-00 00:00:00'),
(38664,	0,	'Zahnpasta vegan',	'',	'',	'',	'(ohne)',	'DM',	0.00,	1.000,	'2014-11-28',	'PFLEG',	'',	0,	'offen',	'2014-11-28',	0,	'0000-00-00 00:00:00'),
(38704,	0,	'grÃƒÂ¼ne SmoothiewÃƒÂ¼rfel ( bei Raw Food )',	'',	'',	'',	'(ohne)',	'Alnatura',	0.00,	1.000,	'2014-11-28',	'LEBEN',	'',	0,	'offen',	'2014-11-28',	0,	'0000-00-00 00:00:00'),
(38624,	0,	'Lavera Deo Orange ( bitte bitte )',	'',	'',	'',	'(ohne)',	'Alnatura',	0.00,	1.000,	'2014-11-28',	'PFLEG',	'',	0,	'offen',	'2014-11-28',	0,	'0000-00-00 00:00:00'),
(38384,	0,	'Vegan Plus MÃƒÂ¼sli Beeren und FrÃƒÂ¼chte',	'',	'',	'',	'(ohne)',	'Alnatura',	0.00,	1.000,	'2014-11-28',	'LEBEN',	'',	0,	'offen',	'2014-11-28',	0,	'0000-00-00 00:00:00'),
(39184,	0,	'vegane WÃƒÂ¼rstchen',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	1.000,	'2014-11-28',	'LEBEN',	'',	0,	'offen',	'2014-11-28',	0,	'0000-00-00 00:00:00'),
(38744,	0,	'Baguette-BrÃƒÂ¶tchen',	'',	'',	'',	'Brotwaren',	'Aldi',	0.35,	1.000,	'2014-11-28',	'LEBEN',	'22115904',	0,	'offen',	'2014-11-28',	0,	'0000-00-00 00:00:00'),
(38764,	0,	'Clementinen',	'',	'',	'',	'Brotwaren',	'Aldi',	1.99,	1.000,	'2014-11-28',	'LEBEN',	'',	0,	'offen',	'2014-11-28',	0,	'0000-00-00 00:00:00'),
(38804,	0,	'Multivitaminsaft',	'',	'',	'',	'Getraenke',	'Aldi',	0.95,	6.000,	'2014-11-28',	'LEBEN',	'22131218',	0,	'offen',	'2014-11-28',	0,	'0000-00-00 00:00:00'),
(38994,	0,	'O-Saft',	'',	'',	'',	'Getraenke',	'Aldi',	0.95,	6.000,	'2014-11-28',	'LEBEN',	'22131201',	0,	'offen',	'2014-11-28',	0,	'0000-00-00 00:00:00'),
(38874,	0,	'Traubenschorle',	'',	'',	'',	'Getraenke',	'Aldi',	0.89,	6.000,	'2014-11-28',	'LEBEN',	'42141167',	0,	'offen',	'2014-11-28',	0,	'0000-00-00 00:00:00'),
(38954,	0,	'GemÃƒÂ¼sebrÃƒÂ¼he',	'',	'',	'',	'Gewuerze',	'Kaufland',	0.59,	1.000,	'2014-11-28',	'LEBEN',	'',	0,	'offen',	'2014-11-28',	0,	'0000-00-00 00:00:00'),
(39024,	0,	'Sojaschnitzel',	'',	'',	'',	'KÃƒÂ¼hltheke',	'Aldi',	1.79,	2.000,	'2014-11-28',	'LEBEN',	'',	0,	'offen',	'2014-11-28',	0,	'0000-00-00 00:00:00'),
(39004,	0,	'passierte tomaten',	'',	'',	'',	'Konserven',	'Aldi',	0.35,	1.000,	'2014-11-28',	'LEBEN',	'22114235',	0,	'offen',	'2014-11-28',	0,	'0000-00-00 00:00:00'),
(38784,	0,	'KÃƒÂ¤seaufschnitt',	'',	'',	'',	'Milchprodukte',	'Aldi',	1.39,	1.000,	'2014-11-28',	'LEBEN',	'22144225',	0,	'offen',	'2014-11-28',	0,	'0000-00-00 00:00:00'),
(38854,	0,	'Tofuaufschnitt',	'',	'',	'',	'Milchprodukte',	'Aldi',	1.79,	1.000,	'2014-11-28',	'LEBEN',	'22144515',	0,	'offen',	'2014-11-28',	0,	'0000-00-00 00:00:00'),
(38914,	0,	'Ãƒâ€pfel Braeburn',	'',	'',	'',	'Obst / Gemuese',	'Aldi',	1.55,	1.000,	'2014-11-28',	'LEBEN',	'',	0,	'offen',	'2014-11-28',	0,	'0000-00-00 00:00:00'),
(38934,	0,	'Bananen',	'',	'',	'',	'Obst / Gemuese',	'Aldi',	0.89,	1.000,	'2014-11-28',	'LEBEN',	'',	0,	'offen',	'2014-11-28',	0,	'0000-00-00 00:00:00'),
(38974,	0,	'Kiwi',	'',	'',	'',	'Obst / Gemuese',	'Aldi',	1.29,	1.000,	'2014-11-28',	'LEBEN',	'',	0,	'offen',	'2014-11-28',	0,	'0000-00-00 00:00:00'),
(39014,	0,	'Schlangengurke',	'',	'',	'',	'Obst / Gemuese',	'Aldi',	0.30,	1.000,	'2014-11-28',	'LEBEN',	'',	0,	'offen',	'2014-11-28',	0,	'0000-00-00 00:00:00'),
(38864,	0,	'Tomaten',	'',	'',	'',	'Obst / Gemuese',	'Aldi',	1.00,	1.000,	'2014-11-28',	'LEBEN',	'',	0,	'offen',	'2014-11-28',	0,	'0000-00-00 00:00:00'),
(38884,	0,	'Weintrauben kernlos',	'',	'',	'',	'Obst / Gemuese',	'Aldi',	1.49,	1.000,	'2014-11-28',	'LEBEN',	'',	0,	'offen',	'2014-11-28',	0,	'0000-00-00 00:00:00'),
(39214,	0,	'Agavendicksaft groÃƒÅ¸',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2014-11-28',	'LEBEN',	'',	0,	'offen',	'2014-11-28',	0,	'0000-00-00 00:00:00'),
(39194,	0,	'Alsan',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	2.000,	'2014-11-28',	'LEBEN',	'',	0,	'offen',	'2014-11-28',	0,	'0000-00-00 00:00:00'),
(39264,	0,	'Datteln ohne Stein',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2014-11-28',	'LEBEN',	'',	0,	'offen',	'2014-11-28',	0,	'0000-00-00 00:00:00'),
(39164,	0,	'Dinkelmilch',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	4.000,	'2014-11-28',	'LEBEN',	'',	0,	'offen',	'2014-11-28',	0,	'0000-00-00 00:00:00'),
(39334,	0,	'dunkle vegane KuvertÃƒÂ¼re',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2014-11-28',	'LEBEN',	'',	0,	'offen',	'2014-11-28',	0,	'0000-00-00 00:00:00'),
(39204,	0,	'Feinkristallzucker',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2014-11-28',	'LEBEN',	'',	0,	'offen',	'2014-11-28',	0,	'0000-00-00 00:00:00'),
(39254,	0,	'ganze Mandeln blanchiert',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2014-11-28',	'LEBEN',	'',	0,	'offen',	'2014-11-28',	0,	'0000-00-00 00:00:00'),
(39134,	0,	'GebÃƒÂ¤ckschmuck',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2014-11-28',	'LEBEN',	'',	0,	'offen',	'2014-11-28',	0,	'0000-00-00 00:00:00'),
(39114,	0,	'gemahlene HaselnÃƒÂ¼sse 400g',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	2.000,	'2014-11-28',	'LEBEN',	'',	0,	'offen',	'2014-11-28',	0,	'0000-00-00 00:00:00'),
(39104,	0,	'gemahlene Mandeln 800g',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	4.000,	'2014-11-28',	'LEBEN',	'',	0,	'offen',	'2014-11-28',	0,	'0000-00-00 00:00:00'),
(39174,	0,	'Hafermilch',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	2.000,	'2014-11-28',	'LEBEN',	'',	0,	'offen',	'2014-11-28',	0,	'0000-00-00 00:00:00'),
(39244,	0,	'Ingwersirup',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2014-11-28',	'LEBEN',	'',	0,	'offen',	'2014-11-28',	0,	'0000-00-00 00:00:00'),
(39344,	0,	'KÃƒÂ¶rnerbrot',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2014-11-28',	'LEBEN',	'',	0,	'offen',	'2014-11-28',	0,	'0000-00-00 00:00:00'),
(39094,	0,	'LebkuchengewÃƒÂ¼rz 100g',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2014-11-28',	'LEBEN',	'',	0,	'offen',	'2014-11-28',	0,	'0000-00-00 00:00:00'),
(39124,	0,	'Orangeat',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	2.000,	'2014-11-28',	'LEBEN',	'',	0,	'offen',	'2014-11-28',	0,	'0000-00-00 00:00:00'),
(39274,	0,	'Rosinen',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2014-11-28',	'LEBEN',	'',	0,	'offen',	'2014-11-28',	0,	'0000-00-00 00:00:00'),
(39234,	0,	'Sojacuisine',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2014-11-28',	'LEBEN',	'',	0,	'offen',	'2014-11-28',	0,	'0000-00-00 00:00:00'),
(39294,	0,	'Sojagranulat',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2014-11-28',	'LEBEN',	'',	0,	'offen',	'2014-11-28',	0,	'0000-00-00 00:00:00'),
(39304,	0,	'Sojasauce',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2014-11-28',	'LEBEN',	'',	0,	'offen',	'2014-11-28',	0,	'0000-00-00 00:00:00'),
(39284,	0,	'SpÃƒÂ¼li',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2014-11-28',	'LEBEN',	'',	0,	'offen',	'2014-11-28',	0,	'0000-00-00 00:00:00'),
(39224,	0,	'SpekulatiusgewÃƒÂ¼rz',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2014-11-28',	'LEBEN',	'',	0,	'offen',	'2014-11-28',	0,	'0000-00-00 00:00:00'),
(39144,	0,	'veganer Aufschnitt',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2014-11-28',	'LEBEN',	'',	0,	'offen',	'2014-11-28',	0,	'0000-00-00 00:00:00'),
(39154,	0,	'veganer KÃƒÂ¤se',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2014-11-28',	'LEBEN',	'',	0,	'offen',	'2014-11-28',	0,	'0000-00-00 00:00:00'),
(39074,	0,	'Orangenwasser',	'',	'',	'',	'Getraenke',	'Kaufland',	0.49,	6.000,	'2014-11-28',	'LEBEN',	'4300175374170',	0,	'offen',	'2014-11-28',	0,	'0000-00-00 00:00:00'),
(39084,	0,	'Sofix fÃƒÂ¼r alle BÃƒÂ¶den',	'',	'',	'',	'Brotwaren',	'Kaufland',	4.45,	1.000,	'2014-11-28',	'HAUSHALT',	'4015000019927',	0,	'offen',	'2014-11-28',	0,	'0000-00-00 00:00:00'),
(39345,	0,	'Ãƒâ€pfel Braeburn',	'',	'',	'',	'Obst / Gemuese',	'Aldi',	1.55,	1.000,	'2014-12-06',	'LEBEN',	'',	0,	'offen',	'2014-12-06',	0,	'0000-00-00 00:00:00'),
(39346,	0,	'Baguette-BrÃƒÂ¶tchen',	'',	'',	'',	'Brotwaren',	'Aldi',	0.35,	1.000,	'2014-12-06',	'LEBEN',	'22115904',	0,	'offen',	'2014-12-06',	0,	'0000-00-00 00:00:00'),
(39347,	0,	'Bio Kartoffeln',	'',	'',	'',	'Obst / Gemuese',	'Aldi',	1.79,	1.000,	'2014-12-06',	'LEBEN',	'4050373133986',	0,	'offen',	'2014-12-06',	0,	'0000-00-00 00:00:00'),
(39348,	0,	'Clementinen',	'',	'',	'',	'Obst / GemÃƒÂ¼se',	'Aldi',	1.99,	1.000,	'2014-12-06',	'HAUSHALT',	'',	0,	'offen',	'2014-12-06',	0,	'0000-00-00 00:00:00'),
(39349,	0,	'GemÃƒÂ¼sebrÃƒÂ¼he',	'',	'',	'',	'Gewuerze',	'Aldi',	0.59,	1.000,	'2014-12-06',	'LEBEN',	'',	0,	'offen',	'2014-12-06',	0,	'0000-00-00 00:00:00'),
(39350,	0,	'KÃƒÂ¤seaufschnitt',	'',	'',	'',	'Milchprodukte',	'Aldi',	1.39,	1.000,	'2014-12-06',	'LEBEN',	'22144225',	0,	'offen',	'2014-12-06',	0,	'0000-00-00 00:00:00'),
(39351,	0,	'Margarine',	'',	'',	'',	'(ohne)',	'Aldi',	0.69,	1.000,	'2014-12-06',	'LEBEN',	'22112446',	0,	'offen',	'2014-12-06',	0,	'0000-00-00 00:00:00'),
(39352,	0,	'Paprikaschoten gemischt',	'',	'',	'',	'Obst / Gemuese',	'Aldi',	1.69,	1.000,	'2014-12-06',	'LEBEN',	'',	0,	'offen',	'2014-12-06',	0,	'0000-00-00 00:00:00'),
(39353,	0,	'passierte tomaten',	'',	'',	'',	'Konserven',	'Aldi',	0.35,	1.000,	'2014-12-06',	'LEBEN',	'22114235',	0,	'offen',	'2014-12-06',	0,	'0000-00-00 00:00:00'),
(40021,	0,	'chetty',	'',	'',	'',	'',	'Kaufland',	1.24,	1.000,	'2015-06-27',	'LEBEN',	'',	0,	'OK',	'2015-06-27',	0,	'0000-00-00 00:00:00'),
(39355,	0,	'Sojaschnitzel',	'',	'',	'',	'KÃƒÂ¼hltheke',	'Aldi',	1.79,	2.000,	'2014-12-06',	'LEBEN',	'',	0,	'offen',	'2014-12-06',	0,	'0000-00-00 00:00:00'),
(39356,	0,	'Spiralinudeln',	'',	'',	'',	'Brotwaren',	'Aldi',	0.49,	1.000,	'2014-12-06',	'LEBEN',	'22111326',	0,	'offen',	'2014-12-06',	0,	'0000-00-00 00:00:00'),
(39357,	0,	'Tofuaufschnitt',	'',	'',	'',	'Milchprodukte',	'Aldi',	1.79,	1.000,	'2014-12-06',	'LEBEN',	'22144515',	0,	'offen',	'2014-12-06',	0,	'0000-00-00 00:00:00'),
(39358,	0,	'Tomaten',	'',	'',	'',	'Obst / Gemuese',	'Aldi',	1.00,	1.000,	'2014-12-06',	'LEBEN',	'',	0,	'offen',	'2014-12-06',	0,	'0000-00-00 00:00:00'),
(39359,	0,	'Traubenschorle',	'',	'',	'',	'Getraenke',	'Aldi',	0.89,	6.000,	'2014-12-06',	'LEBEN',	'42141167',	0,	'offen',	'2014-12-06',	0,	'0000-00-00 00:00:00'),
(39360,	0,	'gelbe MÃƒÂ¼llsÃƒÂ¤cke',	'',	'',	'',	'Haushalt / Putzmittel',	'Kaufland',	2.49,	1.000,	'2014-12-06',	'HAUSHALT',	'',	0,	'offen',	'2014-12-06',	0,	'0000-00-00 00:00:00'),
(39361,	0,	'KrÃƒÂ¤utersalz',	'',	'',	'',	'Salz / Mehl',	'Kaufland',	1.00,	1.000,	'2014-12-06',	'LEBEN',	'',	0,	'offen',	'2014-12-06',	0,	'0000-00-00 00:00:00'),
(39362,	0,	'Orangenwasser',	'',	'',	'',	'Getraenke',	'Kaufland',	0.49,	6.000,	'2014-12-06',	'LEBEN',	'4300175374170',	0,	'offen',	'2014-12-06',	0,	'0000-00-00 00:00:00'),
(39363,	0,	'GlÃƒÂ¼ckwunschkarte',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	1.000,	'2014-12-06',	'GESCH',	'',	0,	'offen',	'2014-12-06',	0,	'0000-00-00 00:00:00'),
(40020,	0,	'salsmi',	'',	'',	'',	'',	'Kaufland',	1.99,	1.000,	'2015-06-27',	'LEBEN',	'',	0,	'OK',	'2015-06-27',	0,	'0000-00-00 00:00:00'),
(39365,	0,	'Vollkornmehl',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	1.000,	'2014-12-06',	'LEBEN',	'',	0,	'offen',	'2014-12-06',	0,	'0000-00-00 00:00:00'),
(39366,	0,	'Agavendicksaft',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	1.000,	'2014-12-06',	'LEBEN',	'',	0,	'offen',	'2014-12-06',	0,	'0000-00-00 00:00:00'),
(39367,	0,	'TaschentÃƒÂ¼cherboxe',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	1.000,	'2014-12-06',	'HAUSHALT',	'',	0,	'offen',	'2014-12-06',	0,	'0000-00-00 00:00:00'),
(39368,	0,	'Willmerburger kÃƒÂ¤se',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2014-12-06',	'LEBEN',	'',	0,	'offen',	'2014-12-06',	0,	'0000-00-00 00:00:00'),
(39369,	0,	'KÃƒÂ¶rnerbrot',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2014-12-06',	'LEBEN',	'',	0,	'offen',	'2014-12-06',	0,	'0000-00-00 00:00:00'),
(39370,	0,	'VanillesoÃƒÅ¸e',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2014-12-06',	'LEBEN',	'',	0,	'offen',	'2014-12-06',	0,	'0000-00-00 00:00:00'),
(39371,	0,	'Koffer',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'2014-12-06',	'KIND',	'',	0,	'offen',	'2014-12-06',	0,	'0000-00-00 00:00:00'),
(39372,	0,	'Apfelmus im Glas',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	1.000,	'2014-12-06',	'LEBEN',	'',	0,	'offen',	'2014-12-06',	0,	'0000-00-00 00:00:00'),
(39373,	0,	'Tofu',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	1.000,	'2014-12-06',	'LEBEN',	'',	0,	'offen',	'2014-12-06',	0,	'0000-00-00 00:00:00'),
(40019,	0,	'filly',	'',	'',	'',	'',	'Kaufland',	2.99,	1.000,	'2015-06-27',	'KIND',	'',	0,	'OK',	'2015-06-27',	0,	'0000-00-00 00:00:00'),
(39375,	0,	'Paprika edelsÃƒÂ¼ÃƒÅ¸',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	1.000,	'2014-12-06',	'LEBEN',	'',	0,	'offen',	'2014-12-06',	0,	'0000-00-00 00:00:00'),
(39376,	0,	'rosmarin',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	1.000,	'2014-12-06',	'LEBEN',	'',	0,	'offen',	'2014-12-06',	0,	'0000-00-00 00:00:00'),
(39377,	0,	'thymian',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	1.000,	'2014-12-06',	'LEBEN',	'',	0,	'offen',	'2014-12-06',	0,	'0000-00-00 00:00:00'),
(39378,	0,	'dinkelmilch',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	4.000,	'2014-12-06',	'LEBEN',	'',	0,	'offen',	'2014-12-06',	0,	'0000-00-00 00:00:00'),
(39379,	0,	'hafermilch',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	2.000,	'2014-12-06',	'LEBEN',	'',	0,	'offen',	'2014-12-06',	0,	'0000-00-00 00:00:00'),
(39380,	0,	'kokusmilch',	'',	'',	'',	'(ohne)',	'Aldi',	0.00,	1.000,	'2014-12-06',	'LEBEN',	'',	0,	'offen',	'2014-12-06',	0,	'0000-00-00 00:00:00'),
(39381,	0,	'EntlÃƒÂ¼ftungsschlÃƒÂ¼ssel',	'',	'',	'',	'(ohne)',	'Baumarkt',	0.59,	1.000,	'2015-01-05',	'HAUSHALT',	'',	0,	'offen',	'2015-01-05',	0,	'0000-00-00 00:00:00'),
(39382,	0,	'Saft',	'',	'',	'',	'(ohne)',	'Baumarkt',	1.89,	1.000,	'2015-01-05',	'LEBENHORST',	'',	0,	'offen',	'2015-01-05',	0,	'0000-00-00 00:00:00'),
(39383,	0,	'Smoothie',	'',	'',	'',	'(ohne)',	'Kiosk',	3.50,	1.000,	'2015-01-02',	'LEBEN',	'',	0,	'offen',	'2015-01-02',	0,	'0000-00-00 00:00:00'),
(40018,	0,	'tv',	'',	'',	'',	'',	'Kaufland',	1.00,	1.000,	'2015-06-27',	'HAUSHALT',	'',	0,	'OK',	'2015-06-27',	0,	'0000-00-00 00:00:00'),
(39386,	0,	'Veg. Aufschnitt',	'',	'',	'',	'(ohne)',	'Aldi',	1.59,	1.000,	'2015-01-10',	'LEBEN',	'',	0,	'offen',	'2015-01-10',	0,	'0000-00-00 00:00:00'),
(39387,	0,	'Spiralinudeln',	'',	'',	'',	'(ohne)',	'Aldi',	0.49,	2.000,	'2015-01-10',	'LEBEN',	'',	0,	'offen',	'2015-01-10',	0,	'0000-00-00 00:00:00'),
(39388,	0,	'Kaffeebohnen',	'',	'',	'',	'(ohne)',	'Aldi',	8.49,	1.000,	'2015-01-10',	'LEBEN',	'',	0,	'offen',	'2015-01-10',	0,	'0000-00-00 00:00:00'),
(39389,	0,	'Baguette BrÃƒÂ¶tchen',	'',	'',	'',	'(ohne)',	'Aldi',	0.35,	1.000,	'2015-01-10',	'LEBEN',	'',	0,	'offen',	'2015-01-10',	0,	'0000-00-00 00:00:00'),
(39390,	0,	'Kaffeemilch',	'',	'',	'',	'(ohne)',	'Aldi',	0.35,	6.000,	'2015-01-10',	'LEBEN',	'',	0,	'offen',	'2015-01-10',	0,	'0000-00-00 00:00:00'),
(39391,	0,	'Bananen',	'',	'',	'',	'(ohne)',	'Aldi',	1.14,	1.000,	'2015-01-10',	'LEBEN',	'',	0,	'offen',	'2015-01-10',	0,	'0000-00-00 00:00:00'),
(39392,	0,	'Multisaft',	'',	'',	'',	'(ohne)',	'Aldi',	0.89,	6.000,	'2015-01-10',	'LEBEN',	'',	0,	'offen',	'2015-01-10',	0,	'0000-00-00 00:00:00'),
(39393,	0,	'Orangensaft',	'',	'',	'',	'(ohne)',	'Aldi',	0.89,	6.000,	'2015-01-10',	'LEBEN',	'',	0,	'offen',	'2015-01-10',	0,	'0000-00-00 00:00:00'),
(40017,	0,	'smoothie',	'',	'',	'',	'',	'Aldi',	0.85,	1.000,	'2015-06-27',	'LEBEN',	'',	0,	'OK',	'2015-06-27',	0,	'0000-00-00 00:00:00'),
(39395,	0,	'SpÃƒÂ¼lmaschinensalz',	'',	'',	'',	'(ohne)',	'Kaufland',	0.75,	1.000,	'2015-01-10',	'HAUSHALT',	'',	0,	'offen',	'2015-01-10',	0,	'0000-00-00 00:00:00'),
(39396,	0,	'KÃƒÂ¤sepizza',	'',	'',	'',	'(ohne)',	'Kaufland',	2.45,	1.000,	'2015-01-10',	'LEBEN',	'',	0,	'offen',	'2015-01-10',	0,	'0000-00-00 00:00:00'),
(39397,	0,	'Veganer aufschnitt',	'',	'',	'',	'(ohne)',	'Kaufland',	1.85,	1.000,	'2015-01-10',	'LEBEN',	'',	0,	'OK',	'2015-01-10',	0,	'0000-00-00 00:00:00'),
(39398,	0,	'Mandelmilch',	'',	'',	'',	'(ohne)',	'Kaufland',	2.69,	1.000,	'2015-01-10',	'LEBEN',	'',	0,	'offen',	'2015-01-10',	0,	'0000-00-00 00:00:00'),
(39399,	0,	'Mozarella',	'',	'',	'',	'(ohne)',	'Kaufland',	0.55,	2.000,	'2015-01-10',	'LEBEN',	'',	0,	'offen',	'2015-01-10',	0,	'0000-00-00 00:00:00'),
(39400,	0,	'Piccolini',	'',	'',	'',	'(ohne)',	'Kaufland',	2.49,	1.000,	'2015-01-10',	'LEBEN',	'',	0,	'offen',	'2015-01-10',	0,	'0000-00-00 00:00:00'),
(39401,	0,	'Sojajoghurt',	'',	'',	'',	'(ohne)',	'Kaufland',	1.99,	1.000,	'2015-01-10',	'LEBEN',	'',	0,	'offen',	'2015-01-10',	0,	'0000-00-00 00:00:00'),
(39402,	0,	'Nachthosen',	'',	'',	'',	'(ohne)',	'Kaufland',	8.25,	1.000,	'2015-01-10',	'KIND',	'',	0,	'OK',	'2015-01-10',	0,	'0000-00-00 00:00:00'),
(39403,	0,	'KÃƒÂ¶rnerbrot',	'',	'',	'',	'(ohne)',	'Kaufland',	1.39,	1.000,	'2015-01-10',	'LEBEN',	'',	0,	'OK',	'2015-01-10',	0,	'0000-00-00 00:00:00'),
(40016,	0,	'veggihack',	'',	'',	'',	'',	'Aldi',	1.59,	1.000,	'2015-06-27',	'LEBEN',	'',	0,	'OK',	'2015-06-27',	0,	'0000-00-00 00:00:00'),
(39405,	0,	'Orangenwasser',	'',	'',	'',	'(ohne)',	'Kaufland',	4.44,	2.000,	'2015-01-10',	'LEBEN',	'',	0,	'OK',	'2015-01-10',	0,	'0000-00-00 00:00:00'),
(39406,	0,	'SpÃƒÂ¼lmaschinen Tabs',	'',	'',	'',	'(ohne)',	'Kaufland',	2.85,	1.000,	'2015-01-10',	'LEBEN',	'',	0,	'offen',	'2015-01-10',	0,	'0000-00-00 00:00:00'),
(39407,	0,	'Filly',	'',	'',	'',	'(ohne)',	'Kaufland',	1.99,	2.000,	'2015-01-10',	'KIND',	'',	0,	'offen',	'2015-01-10',	0,	'0000-00-00 00:00:00'),
(39586,	0,	'filly',	'',	'',	'',	'',	'Kaufland',	1.99,	1.000,	'2015-02-28',	'KIND',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(39585,	0,	'rucksack',	'',	'',	'',	'',	'Aldi',	6.99,	1.000,	'2015-02-28',	'KIND',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39583,	0,	'esrom',	'',	'',	'',	'',	'Aldi',	1.59,	1.000,	'2015-02-28',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(39582,	0,	'spezialsalz spÃƒÂ¼lmaschine',	'',	'',	'',	'',	'Kaufland',	0.75,	2.000,	'2015-02-28',	'HAUSHALT',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(39581,	0,	'grÃƒÂ¼nkernschrot',	'',	'',	'',	'',	'Kaufland',	2.79,	1.000,	'2015-02-28',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(39580,	0,	'milden senf',	'',	'',	'',	'',	'Kaufland',	1.49,	1.000,	'2015-02-28',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(39575,	0,	'veg wÃƒÂ¼rstchen',	'',	'',	'',	'',	'Aldi',	1.85,	2.000,	'2015-02-28',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(39576,	0,	'sojajoghurt natur',	'',	'',	'',	'',	'Kaufland',	1.59,	1.000,	'2015-02-28',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(39577,	0,	'sojamilch',	'',	'',	'',	'',	'Kaufland',	1.89,	1.000,	'2015-02-28',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(39578,	0,	'champingons',	'',	'',	'',	'',	'Aldi',	1.59,	1.000,	'2015-02-28',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39565,	0,	'Wilmersburger kÃƒÂ¤se',	'',	'',	'',	'',	'Kaufland',	2.89,	1.000,	'2015-02-28',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39566,	0,	'sojaschnetzel',	'',	'',	'',	'',	'Kaufland',	1.65,	1.000,	'2015-02-28',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(39567,	0,	'sojagranulat',	'',	'',	'',	'',	'Kaufland',	2.49,	1.000,	'2015-02-28',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(39568,	0,	'tofu',	'',	'',	'',	'',	'Kaufland',	1.85,	1.000,	'2015-02-28',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39569,	0,	'cornflakes ungesÃƒÂ¼ÃƒÅ¸t',	'',	'',	'',	'',	'Kaufland',	1.19,	1.000,	'2015-02-28',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(39570,	0,	'rÃƒÂ¤uchertofu',	'',	'',	'',	'',	'Kaufland',	1.99,	1.000,	'2015-02-28',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39571,	0,	'gewÃƒÂ¼rzgurken',	'',	'',	'',	'',	'Aldi',	0.99,	1.000,	'2015-02-28',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(39572,	0,	'scharze pfefferkÃƒÂ¶rner',	'',	'',	'',	'',	'Kaufland',	0.69,	1.000,	'2015-02-28',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(39573,	0,	'cashewkerne',	'',	'',	'',	'',	'Kaufland',	3.85,	1.000,	'2015-02-28',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(40015,	0,	'aufschnitt',	'',	'',	'',	'',	'Aldi',	1.39,	1.000,	'2015-06-27',	'LEBEN',	'',	0,	'OK',	'2015-06-27',	0,	'0000-00-00 00:00:00'),
(39515,	0,	'ZÃƒÂ¼ndhÃƒÂ¶lzer',	'',	'',	'',	'',	'Kaufland',	0.39,	1.000,	'2015-02-14',	'HAUSHALT',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39512,	0,	'Tofuaufschnitt',	'',	'',	'',	'',	'Aldi',	1.85,	1.000,	'2015-02-14',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(39513,	0,	'Sojajoghurt',	'',	'',	'',	'',	'Kaufland',	1.99,	2.000,	'2015-02-14',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39510,	0,	'chilischote',	'',	'',	'',	'',	'Kaufland',	1.99,	1.000,	'2015-02-14',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39509,	0,	'Klopapier',	'',	'',	'',	'',	'Aldi',	1.95,	1.000,	'2015-02-14',	'HAUSHALT',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39508,	0,	'Traubenschorle',	'',	'',	'',	'',	'Aldi',	6.00,	1.000,	'2015-02-14',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39507,	0,	'Orangenwasser',	'',	'',	'',	'',	'Kaufland',	4.44,	1.000,	'2015-02-14',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39506,	0,	'Badeschaum',	'',	'',	'',	'',	'Kaufland',	1.99,	1.000,	'2015-02-14',	'KIND',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(40014,	0,	'apfeltasche',	'',	'',	'',	'Brotwaren',	'Aldi',	0.69,	1.000,	'2015-06-27',	'LEBEN',	'',	0,	'(ohne)',	'2015-06-27',	0,	'0000-00-00 00:00:00'),
(39505,	0,	'SpÃƒÂ¼ltabs',	'',	'',	'',	'',	'Kaufland',	4.95,	1.000,	'2015-02-14',	'HAUSHALT',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39502,	0,	'Weintrauben',	'',	'',	'',	'',	'Aldi',	1.65,	1.000,	'2015-02-14',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39500,	0,	'Orangen',	'',	'',	'',	'',	'Aldi',	1.35,	1.000,	'2015-02-14',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39497,	0,	'BurgerbrÃƒÂ¶tchen',	'',	'',	'',	'',	'Aldi',	0.69,	1.000,	'2015-02-14',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(39496,	0,	'pommessalz',	'',	'',	'',	'',	'Kaufland',	1.89,	1.000,	'2015-02-14',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(40012,	0,	'Willmersburger KÃƒÂ¤se',	'',	'',	'',	'',	'Kaufland',	2.89,	1.000,	'2015-06-27',	'LEBEN',	'',	0,	'OK',	'2015-06-27',	0,	'0000-00-00 00:00:00'),
(39492,	0,	'OlivenÃƒÂ¶l',	'',	'',	'',	'',	'Aldi',	3.19,	1.000,	'2015-02-14',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39491,	0,	'barbecu sosse',	'',	'',	'',	'',	'Kaufland',	1.69,	1.000,	'2015-02-14',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39485,	0,	'KosmetiktÃƒÂ¼chet',	'',	'',	'',	'',	'Aldi',	0.59,	2.000,	'2015-02-14',	'HAUSHALT',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(40013,	0,	'alsan',	'',	'',	'',	'',	'Kaufland',	0.75,	1.000,	'2015-06-27',	'LEBEN',	'',	0,	'OK',	'2015-06-27',	0,	'0000-00-00 00:00:00'),
(39481,	0,	'Sojasosse',	'',	'',	'',	'',	'Aldi',	1.19,	1.000,	'2015-02-14',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(39501,	0,	'Ãƒâ€pfel',	'',	'',	'',	'',	'Aldi',	1.15,	1.000,	'2015-02-14',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(39493,	0,	'paprika bunt',	'',	'',	'',	'',	'Aldi',	1.29,	2.000,	'2015-02-14',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(39489,	0,	'Wilmersburger kÃƒÂ¤se',	'',	'',	'',	'',	'Kaufland',	2.89,	1.000,	'2015-02-14',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39498,	0,	'berliner',	'',	'',	'',	'',	'Kaufland',	1.59,	1.000,	'2015-02-14',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39487,	0,	'KÃƒÂ¶rnerbrot',	'',	'',	'',	'',	'Kaufland',	1.39,	1.000,	'2015-02-14',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39486,	0,	'Erdbeerpulver',	'',	'',	'',	'',	'Kaufland',	1.99,	2.000,	'2015-02-14',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39488,	0,	'AufbackbrÃƒÂ¶tchen',	'',	'',	'',	'',	'Aldi',	0.35,	1.000,	'2015-02-14',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(39499,	0,	'jodsalz',	'',	'',	'',	'',	'Kaufland',	0.89,	1.000,	'2015-02-14',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39480,	0,	'StreichhÃƒÂ¶lzer lang',	'',	'',	'',	'',	'Kaufland',	1.15,	1.000,	'2015-02-14',	'HAUSHALT',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39482,	0,	'Dinkelmilch',	'',	'',	'',	'',	'Kaufland',	1.85,	1.000,	'2015-02-14',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39511,	0,	'Kartoffeln',	'',	'',	'',	'',	'Aldi',	1.15,	1.000,	'2015-02-14',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39503,	0,	'cashewkerne',	'',	'',	'',	'',	'Kaufland',	3.85,	1.000,	'2015-02-14',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39490,	0,	'pilzpastete',	'',	'',	'',	'',	'Aldi',	1.19,	2.000,	'2015-02-14',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(39495,	0,	'blattsalat',	'',	'',	'',	'',	'Aldi',	0.69,	1.000,	'2015-02-14',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(39483,	0,	'Hafermilch',	'',	'',	'',	'',	'Kaufland',	1.49,	1.000,	'2015-02-14',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39579,	0,	'spinat frisch',	'',	'',	'',	'',	'Aldi',	1.65,	1.000,	'2015-02-28',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(40011,	0,	'veganer Aufschnitt',	'',	'',	'',	'',	'Kaufland',	1.85,	1.000,	'2015-06-27',	'LEBEN',	'',	0,	'OK',	'2015-06-27',	0,	'0000-00-00 00:00:00'),
(39563,	0,	'Orangenwasser',	'',	'',	'',	'',	'Kaufland',	4.44,	2.000,	'2015-02-28',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(39562,	0,	'Nachthosen',	'',	'',	'',	'',	'Kaufland',	8.25,	1.000,	'2015-02-28',	'KIND',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(39561,	0,	'Hafermilch',	'',	'',	'',	'',	'Kaufland',	1.89,	2.000,	'2015-02-28',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(39560,	0,	'Alsan',	'',	'',	'',	'',	'Kaufland',	0.75,	2.000,	'2015-02-28',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(39559,	0,	'Ãƒâ€pfel',	'',	'',	'',	'',	'Aldi',	2.15,	1.000,	'2015-02-28',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(39558,	0,	'paprika bunt',	'',	'',	'',	'',	'Aldi',	1.35,	1.000,	'2015-02-28',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(39557,	0,	'Tofuaufschnitt',	'',	'',	'',	'',	'Aldi',	1.85,	1.000,	'2015-02-28',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(39556,	0,	'Sojasosse',	'',	'',	'',	'',	'Aldi',	1.19,	1.000,	'2015-02-28',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(39555,	0,	'Salatgurke',	'',	'',	'',	'',	'Aldi',	0.99,	1.000,	'2015-02-28',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(39553,	0,	'Malzbier',	'',	'',	'',	'',	'Aldi',	3.09,	1.000,	'2015-02-28',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(39552,	0,	'AufbackbrÃƒÂ¶tchen',	'',	'',	'',	'',	'Aldi',	0.35,	1.000,	'2015-02-28',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(39587,	0,	'bounty',	'',	'',	'',	'',	'Kaufland',	2.99,	1.000,	'2015-02-28',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(40010,	0,	'Sojajoghurt',	'',	'',	'',	'',	'Kaufland',	1.99,	2.000,	'2015-06-27',	'LEBEN',	'',	0,	'OK',	'2015-06-27',	0,	'0000-00-00 00:00:00'),
(39588,	0,	'AufbackbrÃƒÂ¶tchen',	'',	'',	'',	'',	'Aldi',	0.35,	1.000,	'2015-03-21',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39589,	0,	'Kartoffeln',	'',	'',	'',	'',	'Aldi',	1.15,	1.000,	'2015-03-21',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39590,	0,	'KosmetiktÃƒÂ¼chet',	'',	'',	'',	'',	'Aldi',	0.59,	3.000,	'2015-03-21',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(39591,	0,	'Salatgurke',	'',	'',	'',	'',	'Aldi',	0.65,	1.000,	'2015-03-21',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39592,	0,	'Tofuaufschnitt',	'',	'',	'',	'',	'Aldi',	1.85,	2.000,	'2015-03-21',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(39593,	0,	'paprika bunt',	'',	'',	'',	'',	'Aldi',	1.49,	1.000,	'2015-03-21',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(39595,	0,	'Hafermilch',	'',	'',	'',	'',	'Kaufland',	1.49,	2.000,	'2015-03-21',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(39596,	0,	'KÃƒÂ¶rnerbrot',	'',	'',	'',	'',	'Kaufland',	1.19,	1.000,	'2015-03-21',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(39597,	0,	'SpÃƒÂ¼ltabs',	'',	'',	'',	'',	'Kaufland',	4.95,	1.000,	'2015-03-21',	'HAUSHALT',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(39598,	0,	'Veganer Aufschnitt',	'',	'',	'',	'',	'Kaufland',	1.85,	1.000,	'2015-03-21',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(39599,	0,	'Wilmersburger kÃƒÂ¤se',	'',	'',	'',	'',	'Kaufland',	2.89,	1.000,	'2015-03-21',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(39600,	0,	'rosmarin',	'',	'',	'',	'',	'Kaufland',	2.69,	1.000,	'2015-03-21',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(39601,	0,	'Bananen',	'',	'',	'',	'',	'Aldi',	1.48,	1.000,	'2015-03-21',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(39602,	0,	'knusperstÃƒÂ¤pchen',	'',	'',	'',	'',	'Aldi',	1.85,	2.000,	'2015-03-21',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(39603,	0,	'sojamilch',	'',	'',	'',	'',	'Kaufland',	1.89,	1.000,	'2015-03-21',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39605,	0,	'esrom',	'',	'',	'',	'',	'Aldi',	1.59,	1.000,	'2015-03-21',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39606,	0,	'weisse schokoladencreme',	'',	'',	'',	'',	'Alnatura',	3.99,	1.000,	'2015-03-21',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39607,	0,	'lavera duschgel',	'',	'',	'',	'',	'Alnatura',	3.95,	1.000,	'2015-03-21',	'PFLEGE',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39608,	0,	'lavera deo',	'',	'',	'',	'',	'Alnatura',	7.95,	1.000,	'2015-03-21',	'PFLEGE',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39609,	0,	'frischer spinat 400g',	'',	'',	'',	'',	'Kaufland',	2.29,	1.000,	'2015-03-21',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(39610,	0,	'deli margarine',	'',	'',	'',	'',	'Kaufland',	1.39,	1.000,	'2015-03-21',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(39611,	0,	'fencheltee',	'',	'',	'',	'',	'Kaufland',	1.69,	1.000,	'2015-03-21',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(39612,	0,	'mÃƒÂ¼lltÃƒÂ¼ten',	'',	'',	'',	'',	'Aldi',	1.55,	2.000,	'2015-03-21',	'HAUSHALT',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39613,	0,	'osaft',	'',	'',	'',	'',	'Aldi',	0.89,	6.000,	'2015-03-21',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(39615,	0,	'salzstangen',	'',	'',	'',	'',	'Aldi',	0.39,	1.000,	'2015-03-21',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39616,	0,	'pfefferminztee',	'',	'',	'',	'',	'Aldi',	0.49,	1.000,	'2015-03-21',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39617,	0,	'malzbier',	'',	'',	'',	'',	'Aldi',	3.09,	1.000,	'2015-03-21',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(39618,	0,	'gelee',	'',	'',	'',	'',	'Aldi',	0.59,	1.000,	'2015-03-21',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39619,	0,	'schlamge',	'',	'',	'',	'',	'Kaufland',	1.49,	1.000,	'2015-03-21',	'KIND',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39620,	0,	'ketchup',	'',	'',	'',	'',	'Kaufland',	2.39,	1.000,	'2015-03-21',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(39621,	0,	'klÃƒÂ¶sschen',	'',	'',	'',	'',	'Kaufland',	1.85,	1.000,	'2015-03-21',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(39622,	0,	'chips',	'',	'',	'',	'',	'Kaufland',	0.99,	1.000,	'2015-03-21',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(40009,	0,	'Tomaten',	'',	'',	'',	'',	'Aldi',	1.15,	1.000,	'2015-06-27',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(40007,	0,	'Spiralinudeln',	'',	'',	'',	'',	'Aldi',	0.49,	1.000,	'2015-06-27',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(40008,	0,	'Paprikaschoten rot',	'',	'',	'',	'',	'Aldi',	1.29,	2.000,	'2015-06-27',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39623,	0,	'Bananen',	'',	'',	'',	'',	'Penny',	1.30,	1.000,	'2015-03-28',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(40006,	0,	'Margarine',	'',	'',	'',	'',	'Kaufland',	1.39,	2.000,	'2015-06-27',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39625,	0,	'Ãƒâ€pfel',	'',	'',	'',	'',	'Penny',	0.99,	1.000,	'2015-03-28',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39626,	0,	'Dinkelmilch',	'',	'',	'',	'',	'Kaufland',	1.85,	3.000,	'2015-03-28',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(39627,	0,	'KÃƒÂ¶rnerbrot',	'',	'',	'',	'',	'Kaufland',	1.39,	1.000,	'2015-03-28',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(39628,	0,	'Sojajoghurt',	'',	'',	'',	'',	'Kaufland',	1.99,	2.000,	'2015-03-28',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(39629,	0,	'Alsan',	'',	'',	'',	'',	'Kaufland',	0.75,	1.000,	'2015-03-28',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(39630,	0,	'BrÃƒÂ¶tchen',	'',	'',	'',	'',	'Penny',	0.35,	1.000,	'2015-03-28',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39631,	0,	'kÃƒÂ¤se',	'',	'',	'',	'',	'Penny',	1.99,	1.000,	'2015-03-28',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39632,	0,	'frische Pilze',	'',	'',	'',	'',	'Kaufland',	1.49,	1.000,	'2015-03-28',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39633,	0,	'paprika edelsÃƒÂ¼ss',	'',	'',	'',	'',	'Penny',	0.69,	1.000,	'2015-03-28',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39635,	0,	'tv zeitung',	'',	'',	'',	'',	'Penny',	1.00,	1.000,	'2015-03-28',	'HAUSHALT',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(39636,	0,	'pizza',	'',	'',	'',	'',	'Penny',	2.90,	1.000,	'2015-03-28',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39637,	0,	'curcuma',	'',	'',	'',	'',	'Kaufland',	3.29,	1.000,	'2015-03-28',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(39638,	0,	'camrnbert',	'',	'',	'',	'',	'Kaufland',	2.19,	1.000,	'2015-03-28',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(39639,	0,	'dvd',	'',	'',	'',	'',	'Kaufland',	12.99,	1.000,	'2015-03-28',	'HAUSHALT',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39640,	0,	'chipd',	'',	'',	'',	'',	'Kaufland',	0.99,	2.000,	'2015-03-28',	'LEBEN_HORST',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39641,	0,	'bier',	'',	'',	'',	'',	'Kaufland',	4.92,	1.000,	'2015-03-28',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(39642,	0,	'malzbier',	'',	'',	'',	'',	'Kaufland',	0.62,	2.000,	'2015-03-28',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(39643,	0,	'Bananen',	'',	'',	'',	'',	'Aldi',	1.98,	1.000,	'2015-04-04',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(40005,	0,	'Sojaschnitzel',	'',	'',	'',	'',	'Aldi',	1.85,	2.000,	'2015-06-27',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39645,	0,	'Tofuaufschnitt',	'',	'',	'',	'',	'Aldi',	1.85,	2.000,	'2015-04-04',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39646,	0,	'Ãƒâ€pfel',	'',	'',	'',	'',	'Aldi',	1.15,	1.000,	'2015-04-04',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39647,	0,	'Dinkelmilch',	'',	'',	'',	'Brotwaren',	'Kaufland',	1.85,	3.000,	'2015-04-04',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39648,	0,	'Hafermilch',	'',	'',	'',	'Brotwaren',	'Kaufland',	1.49,	2.000,	'2015-04-04',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39649,	0,	'Orangenwasser',	'',	'',	'',	'Brotwaren',	'Kaufland',	4.44,	1.000,	'2015-04-04',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39650,	0,	'Veganer Aufschnitt',	'',	'',	'',	'Brotwaren',	'Kaufland',	1.85,	1.000,	'2015-04-04',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39651,	0,	'Wilmersburger kÃƒÂ¤se',	'',	'',	'',	'Brotwaren',	'Kaufland',	2.22,	1.000,	'2015-04-04',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39652,	0,	'Toilettenpapier',	'',	'',	'',	'',	'Aldi',	1.95,	1.000,	'2015-04-04',	'HAUSHALT',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39653,	0,	'Kaffeefilter',	'',	'',	'',	'',	'Aldi',	0.45,	1.000,	'2015-04-04',	'HAUSHALT',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(40004,	0,	'passierte tomaten',	'',	'',	'',	'',	'Aldi',	0.39,	2.000,	'2015-06-27',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39655,	0,	'Marzipanostersachen fÃƒÂ¼r Orell',	'',	'',	'',	'',	'Kaufland',	0.69,	3.000,	'2015-04-04',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39656,	0,	'Orangensaft',	'',	'',	'',	'',	'Aldi',	0.89,	6.000,	'2015-04-04',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39657,	0,	'KrÃƒÂ¤utersalz',	'',	'',	'',	'',	'Kaufland',	0.99,	1.000,	'2015-04-04',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39658,	0,	'Osterblumen fÃƒÂ¼r Erna und Heinz',	'',	'',	'',	'',	'Kaufland',	2.99,	1.000,	'2015-04-04',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39659,	0,	'Pizza',	'',	'',	'',	'',	'Aldi',	2.49,	1.000,	'2015-04-04',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39660,	0,	'SonntagsbrÃƒÂ¶tchen',	'',	'',	'',	'',	'Aldi',	0.35,	2.000,	'2015-04-04',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39661,	0,	'Zitronencreme',	'',	'',	'',	'',	'Kaufland',	0.98,	1.000,	'2015-04-04',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39662,	0,	'Milch 1/2l',	'',	'',	'',	'',	'Kaufland',	0.59,	1.000,	'2015-04-04',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39663,	0,	'akaziensirup',	'',	'',	'',	'',	'Kaufland',	2.65,	1.000,	'2015-04-04',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39665,	0,	'puderzucket',	'',	'',	'',	'',	'Aldi',	0.29,	1.000,	'2015-04-04',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39666,	0,	'bananensaft',	'',	'',	'',	'',	'Aldi',	0.79,	1.000,	'2015-04-04',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39667,	0,	'spirali',	'',	'',	'',	'',	'Aldi',	0.49,	1.000,	'2015-04-04',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39668,	0,	'trauben',	'',	'',	'',	'',	'Aldi',	1.85,	1.000,	'2015-04-04',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39669,	0,	'passirte tomaten',	'',	'',	'',	'',	'Aldi',	0.39,	2.000,	'2015-04-04',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39670,	0,	'haferlocken',	'',	'',	'',	'',	'Kaufland',	0.39,	1.000,	'2015-04-04',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39671,	0,	'badeente',	'',	'',	'',	'',	'Kaufland',	2.49,	1.000,	'2015-04-04',	'KIND',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39672,	0,	'camenbert',	'',	'',	'',	'',	'Kaufland',	1.59,	1.000,	'2015-04-04',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39673,	0,	'kÃƒÂ¤se',	'',	'',	'',	'',	'Kaufland',	1.89,	1.000,	'2015-04-04',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39675,	0,	'getrÃƒÂ¤nk',	'',	'',	'',	'',	'Kaufland',	1.24,	1.000,	'2015-04-04',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39676,	0,	'getrÃƒÂ¤nk',	'',	'',	'',	'',	'Kaufland',	1.34,	1.000,	'2015-04-04',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39677,	0,	'brot',	'',	'',	'',	'',	'Kaufland',	1.39,	1.000,	'2015-04-04',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(40002,	0,	'Ahoi Brausepulver',	'',	'',	'',	'',	'Kaufland',	0.65,	2.000,	'2015-06-27',	'LEBEN',	'',	0,	'OK',	'2015-06-27',	0,	'0000-00-00 00:00:00'),
(39848,	0,	'bananensaft',	'',	'',	'',	'',	'Aldi',	0.79,	1.000,	'2015-05-23',	'KIND',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39847,	0,	'apfeltasche',	'',	'',	'',	'',	'Aldi',	0.69,	1.000,	'2015-05-23',	'KIND',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39846,	0,	'Sojajoghurt',	'',	'',	'',	'',	'Kaufland',	1.99,	2.000,	'2015-05-23',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39845,	0,	'Karfoffeln',	'',	'',	'',	'',	'Aldi',	2.39,	1.000,	'2015-05-23',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39844,	0,	'Chilischoten',	'',	'',	'',	'',	'Kaufland',	1.69,	1.000,	'2015-05-23',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39843,	0,	'Tomaten aus der dose',	'',	'',	'',	'',	'Aldi',	0.39,	1.000,	'2015-05-23',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39842,	0,	'Salatgurke',	'',	'',	'',	'',	'Aldi',	0.49,	1.000,	'2015-05-23',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39841,	0,	'Paprika',	'',	'',	'',	'',	'Aldi',	2.29,	1.000,	'2015-05-23',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39840,	0,	'Sojageschnetzeltes',	'',	'',	'',	'',	'Kaufland',	1.65,	1.000,	'2015-05-23',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39839,	0,	'GewÃƒÂ¼rzgurken',	'',	'',	'',	'',	'Aldi',	0.65,	1.000,	'2015-05-23',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39838,	0,	'Puderzucker 200g',	'',	'',	'',	'',	'Aldi',	0.29,	1.000,	'2015-05-23',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39837,	0,	'Plastikzitronen',	'',	'',	'',	'',	'Aldi',	0.49,	1.000,	'2015-05-23',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39836,	0,	'Vanillepuddingpulver',	'',	'',	'',	'',	'Kaufland',	0.79,	1.000,	'2015-05-23',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39835,	0,	'Apfelmus',	'',	'',	'',	'',	'Aldi',	0.49,	2.000,	'2015-05-23',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39834,	0,	'zartbitte schokolade vegan 400g',	'',	'',	'',	'',	'Kaufland',	1.39,	5.000,	'2015-05-23',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39833,	0,	'200g gemahlene HaselnÃƒÂ¼sse',	'',	'',	'',	'',	'Kaufland',	3.19,	1.000,	'2015-05-23',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39832,	0,	'gehobelte Mandeln',	'',	'',	'',	'',	'Kaufland',	0.99,	2.000,	'2015-05-23',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39831,	0,	'AprikosenkonfitÃƒÂ¼re',	'',	'',	'',	'',	'Aldi',	1.49,	1.000,	'2015-05-23',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39830,	0,	'Cola',	'',	'',	'',	'',	'Aldi',	0.64,	6.000,	'2015-05-23',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39829,	0,	'o-saft',	'',	'',	'',	'',	'Aldi',	0.89,	6.000,	'2015-05-23',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39828,	0,	'Multisaft',	'',	'',	'',	'',	'Aldi',	0.89,	6.000,	'2015-05-23',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39827,	0,	'Orangenwasser',	'',	'',	'',	'',	'Kaufland',	4.44,	1.000,	'2015-05-23',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39826,	0,	'RÃƒÂ¤uchertofu',	'',	'',	'',	'',	'Kaufland',	1.99,	1.000,	'2015-05-23',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(39825,	0,	'Blumenkohl',	'',	'',	'',	'',	'Aldi',	1.15,	1.000,	'2015-05-23',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39824,	0,	'Kroketten',	'',	'',	'',	'',	'Aldi',	0.99,	1.000,	'2015-05-23',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39823,	0,	'Nudeln penne',	'',	'',	'',	'',	'Aldi',	0.49,	1.000,	'2015-05-23',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39822,	0,	'Tomatenmark',	'',	'',	'',	'',	'Aldi',	0.55,	1.000,	'2015-05-23',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39821,	0,	'Aufschnitt',	'',	'',	'',	'',	'Kaufland',	1.99,	2.000,	'2015-05-23',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39820,	0,	'Kalkstopppulver',	'',	'',	'',	'',	'Kaufland',	2.55,	1.000,	'2015-05-23',	'HAUSHALT',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39852,	0,	'ei',	'',	'',	'',	'',	'Kaufland',	0.98,	1.000,	'2015-05-23',	'KIND',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39850,	0,	'tv',	'',	'',	'',	'',	'Kaufland',	1.00,	1.000,	'2015-05-23',	'HAUSHALT',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39851,	0,	'gemÃƒÂ¼sebrÃƒÂ¼he',	'',	'',	'',	'',	'Kaufland',	1.45,	1.000,	'2015-05-23',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39849,	0,	'pony',	'',	'',	'',	'',	'Kaufland',	2.99,	1.000,	'2015-05-23',	'KIND',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39717,	0,	'Bananen',	'',	'',	'',	'',	'Aldi',	2.05,	1.000,	'2015-04-25',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39718,	0,	'mango',	'',	'',	'',	'',	'Aldi',	1.79,	1.000,	'2015-04-25',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39719,	0,	'Salatgurke',	'',	'',	'',	'Obst / Gemuese',	'Aldi',	0.49,	1.000,	'2015-04-25',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39720,	0,	'Tofuaufschnitt',	'',	'',	'',	'',	'Aldi',	1.85,	1.000,	'2015-04-25',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39721,	0,	'Traubenschorle',	'',	'',	'',	'',	'Aldi',	6.00,	1.000,	'2015-04-25',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39722,	0,	'Dinkelmilch',	'',	'',	'',	'',	'Kaufland',	1.85,	4.000,	'2015-04-25',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39723,	0,	'Hafermilch',	'',	'',	'',	'',	'Kaufland',	2.69,	1.000,	'2015-04-25',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39724,	0,	'Nachthosen',	'',	'',	'',	'',	'Kaufland',	8.25,	1.000,	'2015-04-25',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39725,	0,	'Orangenwasser',	'',	'',	'',	'',	'Kaufland',	4.44,	2.000,	'2015-04-25',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39726,	0,	'Sojajoghurt',	'',	'',	'',	'',	'Kaufland',	1.99,	2.000,	'2015-04-25',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39727,	0,	'Veganer Aufschnitt',	'',	'',	'',	'',	'Kaufland',	1.85,	1.000,	'2015-04-25',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39728,	0,	'Wilmersburger kÃƒÂ¤se',	'',	'',	'',	'',	'Kaufland',	2.89,	1.000,	'2015-04-25',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39729,	0,	'GemÃƒÂ¼sebrÃƒÂ¼he',	'',	'',	'',	'',	'Kaufland',	1.45,	1.000,	'2015-04-25',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39730,	0,	'Sofix',	'',	'',	'',	'',	'Kaufland',	3.59,	1.000,	'2015-04-25',	'HAUSHALT',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39731,	0,	'BratwÃƒÂ¼rste vegan',	'',	'',	'',	'',	'Aldi',	1.85,	2.000,	'2015-04-25',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39732,	0,	'Tofu',	'',	'',	'',	'',	'Aldi',	1.85,	1.000,	'2015-04-25',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39733,	0,	'Sojamilch',	'',	'',	'',	'',	'Kaufland',	1.89,	1.000,	'2015-04-25',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39734,	0,	'Mais',	'',	'',	'',	'',	'Kaufland',	1.75,	2.000,	'2015-04-25',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39735,	0,	'Paprika',	'',	'',	'',	'',	'Aldi',	1.25,	1.000,	'2015-04-25',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39736,	0,	'Gnocchi',	'',	'',	'',	'',	'Kaufland',	0.75,	2.000,	'2015-04-25',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39737,	0,	'Mehl',	'',	'',	'',	'',	'Aldi',	0.32,	1.000,	'2015-04-25',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39738,	0,	'Alsan',	'',	'',	'',	'',	'Kaufland',	0.75,	1.000,	'2015-04-25',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39739,	0,	'SonntagsbrÃƒÂ¶tchen',	'',	'',	'',	'',	'Aldi',	0.35,	1.000,	'2015-04-25',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39740,	0,	'Nudeln',	'',	'',	'',	'',	'Aldi',	0.49,	1.000,	'2015-04-25',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39742,	0,	'KÃƒÂ¼chentÃƒÂ¼cher',	'',	'',	'',	'Brotwaren',	'Kaufland',	1.75,	1.000,	'2015-04-25',	'HAUSHALT',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39743,	0,	'Calciumbrause',	'',	'',	'',	'',	'Aldi',	0.45,	1.000,	'2015-04-25',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39744,	0,	'Tampons',	'',	'',	'',	'',	'Kaufland',	4.95,	1.000,	'2015-04-25',	'HAUSHALT',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39745,	0,	'Kaffee',	'',	'',	'',	'',	'Aldi',	8.49,	1.000,	'2015-04-25',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39746,	0,	'o-saft',	'',	'',	'',	'',	'Aldi',	0.89,	6.000,	'2015-04-25',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39747,	0,	'deo',	'',	'',	'',	'',	'Kaufland',	2.95,	1.000,	'2015-04-25',	'PFLEGE',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39748,	0,	'kÃƒÂ¼sse',	'',	'',	'',	'',	'Aldi',	0.99,	1.000,	'2015-04-25',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39749,	0,	'aufschnitt',	'',	'',	'',	'',	'Aldi',	1.59,	1.000,	'2015-04-25',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39750,	0,	'hose',	'',	'',	'',	'',	'Aldi',	6.99,	1.000,	'2015-04-25',	'KIND',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39751,	0,	'cola',	'',	'',	'',	'',	'Aldi',	0.64,	6.000,	'2015-04-25',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39752,	0,	'filly',	'',	'',	'',	'Brotwaren',	'Kaufland',	2.99,	1.000,	'2015-04-25',	'KIND',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39753,	0,	'kÃƒÂ¤se',	'',	'',	'',	'',	'Kaufland',	1.99,	1.000,	'2015-04-25',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39754,	0,	'chips',	'',	'',	'',	'',	'Kaufland',	0.99,	2.000,	'2015-04-25',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39755,	0,	'Malzbier',	'',	'',	'',	'(ohne)',	'Aldi',	3.09,	1.000,	'2015-04-25',	'LEBEN',	'',	0,	'OK',	'2015-04-27',	0,	'0000-00-00 00:00:00'),
(39818,	0,	'KÃƒÂ¶rnerbrot',	'',	'',	'',	'',	'Kaufland',	1.39,	1.000,	'2015-05-23',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(39819,	0,	'Klopapier',	'',	'',	'',	'',	'Aldi',	1.95,	1.000,	'2015-05-23',	'HAUSHALT',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39817,	0,	'Tofuaufschnitt',	'',	'',	'',	'',	'Aldi',	1.85,	0.000,	'2015-05-23',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39816,	0,	'Haferflocken',	'',	'',	'',	'',	'Aldi',	0.39,	1.000,	'2015-05-23',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39815,	0,	'Ãƒâ€pfel',	'',	'',	'',	'',	'Aldi',	2.25,	1.000,	'2015-05-23',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39814,	0,	'Erdbeeren',	'',	'',	'',	'',	'Aldi',	2.99,	2.000,	'2015-05-23',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39813,	0,	'Bananen',	'',	'',	'',	'',	'Aldi',	1.52,	1.000,	'2015-05-23',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39812,	0,	'SonntagsbrÃƒÂ¶tchen',	'',	'',	'',	'',	'Aldi',	0.35,	1.000,	'2015-05-23',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39811,	0,	'Kaffee',	'',	'',	'',	'',	'Aldi',	8.49,	1.000,	'2015-05-23',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39810,	0,	'Dinkelmilch',	'',	'',	'',	'',	'Kaufland',	1.85,	2.000,	'2015-05-23',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39809,	0,	'Hafermilch',	'',	'',	'',	'',	'Kaufland',	1.49,	3.000,	'2015-05-23',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39808,	0,	'Agavendicksaft',	'',	'',	'',	'',	'REWE',	0.00,	2.000,	'2015-05-23',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(39807,	0,	'GepÃƒÂ¤ckschmuck',	'',	'',	'',	'',	'Kaufland',	1.99,	2.000,	'2015-05-23',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39806,	0,	'Marzipandecke',	'',	'',	'',	'',	'Kaufland',	3.65,	1.000,	'2015-05-23',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39805,	0,	'Erdbeerkonfiture',	'',	'',	'',	'',	'Aldi',	0.89,	1.000,	'2015-05-23',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39804,	0,	'Alsan',	'',	'',	'',	'',	'Kaufland',	0.75,	2.000,	'2015-05-23',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39803,	0,	'Apfelessig',	'',	'',	'',	'',	'Kaufland',	1.29,	1.000,	'2015-05-23',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39802,	0,	'Sojamilch',	'',	'',	'',	'',	'Kaufland',	1.79,	1.000,	'2015-05-23',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39801,	0,	'Backpulver',	'',	'',	'',	'',	'Aldi',	0.29,	1.000,	'2015-05-23',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39800,	0,	'Vanillezucker',	'',	'',	'',	'',	'Kaufland',	0.17,	1.000,	'2015-05-23',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39799,	0,	'Zucker fein',	'',	'',	'',	'',	'Aldi',	0.65,	1.000,	'2015-05-23',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39798,	0,	'Mehl',	'',	'',	'',	'',	'Aldi',	0.32,	1.000,	'2015-05-23',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39797,	0,	'Zwiebeln',	'',	'',	'',	'',	'Aldi',	1.19,	1.000,	'2015-05-23',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39796,	0,	'ErdnussÃƒÂ¶l',	'',	'',	'',	'',	'Kaufland',	2.79,	1.000,	'2015-05-23',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39795,	0,	'Toastbrot klein',	'',	'',	'',	'',	'Kaufland',	0.79,	1.000,	'2015-05-23',	'LEBEN',	'',	0,	'offen',	'',	0,	'0000-00-00 00:00:00'),
(39794,	0,	'Kichererbsen',	'',	'',	'',	'',	'Kaufland',	2.19,	1.000,	'2015-05-23',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39853,	0,	'Orangen',	'',	'',	'',	'',	'Aldi',	1.59,	1.000,	'2015-05-30',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39854,	0,	'paprika bunt',	'',	'',	'',	'',	'Aldi',	1.55,	1.000,	'2015-05-30',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39855,	0,	'Ãƒâ€pfel',	'',	'',	'',	'',	'Aldi',	1.69,	1.000,	'2015-05-30',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39856,	0,	'Klopapier',	'',	'',	'',	'',	'Aldi',	1.95,	1.000,	'2015-05-30',	'HAUSHALT',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39857,	0,	'KosmetiktÃƒÂ¼cher',	'',	'',	'',	'',	'Aldi',	0.59,	2.000,	'2015-05-30',	'HAUSHALT',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39858,	0,	'AufbackbrÃƒÂ¶tchen',	'',	'',	'',	'',	'Aldi',	0.35,	1.000,	'2015-05-30',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39859,	0,	'Kartoffeln',	'',	'',	'',	'',	'Aldi',	2.59,	1.000,	'2015-05-30',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39860,	0,	'Dinkelmilch',	'',	'',	'',	'',	'Kaufland',	1.85,	3.000,	'2015-05-30',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39861,	0,	'Hafermilch',	'',	'',	'',	'',	'Kaufland',	1.49,	3.000,	'2015-05-30',	'(ohne)',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39862,	0,	'KÃ¶rnerbrot',	'',	'',	'',	'Brotwaren',	'Kaufland',	1.19,	1.000,	'2015-05-30',	'LEBEN',	'',	0,	'OK',	'2015-05-30',	0,	'0000-00-00 00:00:00'),
(39863,	0,	'Orangenwasser',	'',	'',	'',	'Brotwaren',	'Kaufland',	4.44,	1.000,	'2015-05-30',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39864,	0,	'Sojajoghurt',	'',	'',	'',	'Brotwaren',	'Kaufland',	1.99,	1.000,	'2015-05-30',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39865,	0,	'Wilmersburger kÃƒÂ¤se',	'',	'',	'',	'Brotwaren',	'Kaufland',	2.89,	1.000,	'2015-05-30',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39866,	0,	'pommessalz',	'',	'',	'',	'Brotwaren',	'Kaufland',	1.89,	1.000,	'2015-05-30',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39867,	0,	'agavendicksaft',	'',	'',	'',	'',	'Kaufland',	2.65,	1.000,	'2015-05-30',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39868,	0,	'mÃƒÂ¼sli horst',	'',	'',	'',	'',	'Aldi',	1.75,	1.000,	'2015-05-30',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39869,	0,	'alsan',	'',	'',	'',	'',	'Kaufland',	0.75,	2.000,	'2015-05-30',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39871,	0,	'vitam b12',	'',	'',	'',	'',	'Kaufland',	2.95,	1.000,	'2015-05-30',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39872,	0,	'kaffee',	'',	'',	'',	'',	'Aldi',	6.99,	1.000,	'2015-05-30',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39873,	0,	'bananen',	'',	'',	'',	'',	'Aldi',	1.29,	1.000,	'2015-05-30',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39874,	0,	'schnitzel',	'',	'',	'',	'',	'Aldi',	1.85,	2.000,	'2015-05-30',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39875,	0,	'wÃƒÂ¤scheklammern',	'',	'',	'',	'',	'Kaufland',	1.49,	1.000,	'2015-05-30',	'HAUSHALT',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39876,	0,	'clips',	'',	'',	'',	'',	'Kaufland',	2.99,	1.000,	'2015-05-30',	'HAUSHALT',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39877,	0,	'o-saft',	'',	'',	'',	'',	'Aldi',	0.89,	6.000,	'2015-05-30',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39878,	0,	'shampoo vegan',	'',	'',	'',	'',	'Kaufland',	0.00,	1.000,	'2015-05-30',	'PFLEGE',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39879,	0,	'kÃƒÂ¤sepizza',	'',	'',	'',	'',	'Kaufland',	2.45,	1.000,	'2015-05-30',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39880,	0,	'picco pizza',	'',	'',	'',	'',	'Kaufland',	2.49,	1.000,	'2015-05-30',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39881,	0,	'passierte tomaten',	'',	'',	'',	'',	'Aldi',	0.39,	2.000,	'2015-05-30',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39882,	0,	'granulat',	'',	'',	'',	'',	'Kaufland',	2.49,	1.000,	'2015-05-30',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39883,	0,	'penne',	'',	'',	'',	'',	'Aldi',	0.49,	1.000,	'2015-05-30',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39884,	0,	'nachthosen',	'',	'',	'',	'',	'Kaufland',	8.25,	1.000,	'2015-05-30',	'KIND',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39885,	0,	'schwip schwap',	'',	'',	'',	'',	'Penny',	5.34,	1.000,	'2015-05-30',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39886,	0,	'pfand',	'',	'',	'',	'',	'Penny',	1.50,	1.000,	'2015-05-30',	'PFAND',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39887,	0,	'tv zeitschrift',	'',	'',	'',	'',	'Penny',	1.00,	1.000,	'2015-05-30',	'HAUSHALT',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39888,	0,	'Salatgurke',	'',	'',	'',	'',	'Aldi',	0.45,	1.000,	'2015-06-13',	'LEBEN',	'',	0,	'OK',	'2015-06-13',	0,	'0000-00-00 00:00:00'),
(39889,	0,	'Traubenschorle',	'',	'',	'',	'',	'Aldi',	6.00,	1.000,	'2015-06-13',	'LEBEN',	'',	0,	'offen',	'2015-06-13',	0,	'0000-00-00 00:00:00'),
(39890,	0,	'Ãƒâ€pfel',	'',	'',	'',	'',	'Aldi',	2.69,	1.000,	'2015-06-13',	'LEBEN',	'',	0,	'OK',	'2015-06-13',	0,	'0000-00-00 00:00:00'),
(39891,	0,	'AufbackbrÃƒÂ¶tchen',	'',	'',	'',	'',	'Aldi',	0.35,	1.000,	'2015-06-13',	'LEBEN',	'',	0,	'OK',	'2015-06-13',	0,	'0000-00-00 00:00:00'),
(39892,	0,	'Kartoffeln',	'',	'',	'',	'',	'Aldi',	2.59,	1.000,	'2015-06-13',	'LEBEN',	'',	0,	'offen',	'2015-06-13',	0,	'0000-00-00 00:00:00'),
(39893,	0,	'Hafermilch',	'',	'',	'',	'Brotwaren',	'Kaufland',	1.29,	2.000,	'2015-06-13',	'LEBEN',	'',	0,	'OK',	'2015-06-13',	0,	'0000-00-00 00:00:00'),
(39894,	0,	'KÃƒÂ¶rnerbrot',	'',	'',	'',	'Brotwaren',	'Kaufland',	1.39,	1.000,	'2015-06-13',	'LEBEN',	'',	0,	'offen',	'2015-06-13',	0,	'0000-00-00 00:00:00'),
(39895,	0,	'Orangenwasser',	'',	'',	'',	'Brotwaren',	'Kaufland',	4.44,	2.000,	'2015-06-13',	'LEBEN',	'',	0,	'offen',	'2015-06-13',	0,	'0000-00-00 00:00:00'),
(39896,	0,	'SpÃƒÂ¼ltabs',	'',	'',	'',	'',	'Kaufland',	3.79,	1.000,	'2015-06-13',	'HAUSHALT',	'',	0,	'OK',	'2015-06-13',	0,	'0000-00-00 00:00:00'),
(39897,	0,	'Veganer Aufschnitt',	'',	'',	'',	'Brotwaren',	'Kaufland',	1.85,	1.000,	'2015-06-13',	'LEBEN',	'',	0,	'offen',	'2015-06-13',	0,	'0000-00-00 00:00:00'),
(39898,	0,	'Wilmersburger kÃƒÂ¤se',	'',	'',	'',	'Brotwaren',	'Kaufland',	2.89,	1.000,	'2015-06-13',	'LEBEN',	'',	0,	'offen',	'2015-06-13',	0,	'0000-00-00 00:00:00'),
(39899,	0,	'alsan',	'',	'',	'',	'',	'Kaufland',	0.75,	1.000,	'2015-06-13',	'LEBEN',	'',	0,	'OK',	'2015-06-13',	0,	'0000-00-00 00:00:00'),
(39900,	0,	'mandel blÃƒÂ¤tter',	'',	'',	'',	'',	'Kaufland',	1.29,	1.000,	'2015-06-13',	'LEBEN',	'',	0,	'OK',	'2015-06-13',	0,	'0000-00-00 00:00:00'),
(39901,	0,	'tampons',	'',	'',	'',	'',	'Kaufland',	4.45,	1.000,	'2015-06-13',	'PFLEGE',	'',	0,	'offen',	'2015-06-13',	0,	'0000-00-00 00:00:00'),
(39902,	0,	'sojamilch',	'',	'',	'',	'',	'Kaufland',	1.89,	1.000,	'2015-06-13',	'LEBEN',	'',	0,	'OK',	'2015-06-13',	0,	'0000-00-00 00:00:00'),
(39903,	0,	'penne',	'',	'',	'',	'',	'Aldi',	0.49,	1.000,	'2015-06-13',	'LEBEN',	'',	0,	'offen',	'2015-06-13',	0,	'0000-00-00 00:00:00'),
(39904,	0,	'ketchup',	'',	'',	'',	'',	'Aldi',	0.99,	1.000,	'2015-06-13',	'LEBEN',	'',	0,	'offen',	'2015-06-13',	0,	'0000-00-00 00:00:00'),
(39905,	0,	'gnocci',	'',	'',	'',	'',	'Aldi',	0.75,	1.000,	'2015-06-13',	'LEBEN',	'',	0,	'offen',	'2015-06-13',	0,	'0000-00-00 00:00:00'),
(39906,	0,	'handspuÃƒÂ¼lmittel',	'',	'',	'',	'',	'Kaufland',	0.99,	1.000,	'2015-06-13',	'HAUSHALT',	'',	0,	'OK',	'2015-06-13',	0,	'0000-00-00 00:00:00'),
(39907,	0,	'kÃƒÂ¼chentÃƒÂ¼cher',	'',	'',	'',	'',	'Kaufland',	2.45,	1.000,	'2015-06-13',	'HAUSHALT',	'',	0,	'offen',	'2015-06-13',	0,	'0000-00-00 00:00:00'),
(39908,	0,	'multidaft',	'',	'',	'',	'',	'Aldi',	0.89,	6.000,	'2015-06-13',	'LEBEN',	'',	0,	'offen',	'2015-06-13',	0,	'0000-00-00 00:00:00'),
(39909,	0,	'osaft',	'',	'',	'',	'',	'Aldi',	0.89,	6.000,	'2015-06-13',	'LEBEN',	'',	0,	'offen',	'2015-06-13',	0,	'0000-00-00 00:00:00'),
(39910,	0,	'btezel',	'',	'',	'',	'',	'Aldi',	0.29,	1.000,	'2015-06-13',	'KIND',	'',	0,	'offen',	'2015-06-13',	0,	'0000-00-00 00:00:00'),
(39911,	0,	'kirschen',	'',	'',	'',	'',	'Aldi',	2.99,	1.000,	'2015-06-13',	'LEBEN',	'',	0,	'offen',	'2015-06-13',	0,	'0000-00-00 00:00:00'),
(39912,	0,	'rosinen',	'',	'',	'',	'',	'Aldi',	0.79,	1.000,	'2015-06-13',	'LEBEN',	'',	0,	'offen',	'2015-06-13',	0,	'0000-00-00 00:00:00'),
(39913,	0,	'cashrw',	'',	'',	'',	'',	'Aldi',	2.29,	1.000,	'2015-06-13',	'LEBEN',	'',	0,	'offen',	'2015-06-13',	0,	'0000-00-00 00:00:00'),
(39914,	0,	'seepferd',	'',	'',	'',	'',	'Kaufland',	3.49,	1.000,	'2015-06-13',	'KIND',	'',	0,	'OK',	'2015-06-13',	0,	'0000-00-00 00:00:00'),
(39915,	0,	'tv',	'',	'',	'',	'',	'Kaufland',	1.00,	1.000,	'2015-06-13',	'HAUSHALT',	'',	0,	'OK',	'2015-06-13',	0,	'0000-00-00 00:00:00'),
(39916,	0,	'aufschnitt',	'',	'',	'',	'',	'Kaufland',	1.99,	1.000,	'2015-06-13',	'LEBEN',	'',	0,	'offen',	'2015-06-13',	0,	'0000-00-00 00:00:00'),
(39917,	0,	'kaktuseid',	'',	'',	'',	'',	'Kaufland',	2.89,	1.000,	'2015-06-13',	'LEBEN',	'',	0,	'OK',	'2015-06-13',	0,	'0000-00-00 00:00:00'),
(39918,	0,	'Bananen',	'',	'',	'',	'',	'Aldi',	0.81,	1.000,	'2015-06-13',	'LEBEN',	'',	0,	'offen',	'2015-06-13',	0,	'0000-00-00 00:00:00'),
(39919,	0,	'Traubenschorle',	'',	'',	'',	'',	'Aldi',	6.00,	1.000,	'2015-06-20',	'LEBEN',	'',	0,	'offen',	'2015-06-20',	0,	'0000-00-00 00:00:00'),
(39920,	0,	'Weintrauben',	'',	'',	'',	'',	'Aldi',	2.55,	1.000,	'2015-06-20',	'LEBEN',	'',	0,	'offen',	'2015-06-20',	0,	'0000-00-00 00:00:00'),
(39921,	0,	'paprika bunt',	'',	'',	'',	'',	'Aldi',	1.35,	1.000,	'2015-06-20',	'LEBEN',	'',	0,	'OK',	'2015-06-20',	0,	'0000-00-00 00:00:00'),
(39922,	0,	'Ãƒâ€pfel',	'',	'',	'',	'',	'Aldi',	2.69,	1.000,	'2015-06-20',	'LEBEN',	'',	0,	'offen',	'2015-06-20',	0,	'0000-00-00 00:00:00'),
(39923,	0,	'AufbackbrÃƒÂ¶tchen',	'',	'',	'',	'',	'Aldi',	0.35,	1.000,	'2015-06-20',	'LEBEN',	'',	0,	'offen',	'2015-06-20',	0,	'0000-00-00 00:00:00'),
(39924,	0,	'Kartoffeln',	'',	'',	'',	'',	'Aldi',	2.59,	1.000,	'2015-06-20',	'LEBEN',	'',	0,	'offen',	'2015-06-20',	0,	'0000-00-00 00:00:00'),
(39925,	0,	'Malzbier',	'',	'',	'',	'',	'Aldi',	3.09,	1.000,	'2015-06-20',	'LEBEN',	'',	0,	'offen',	'2015-06-20',	0,	'0000-00-00 00:00:00'),
(39926,	0,	'Dinkelmilch',	'',	'',	'',	'',	'Kaufland',	1.85,	3.000,	'2015-06-20',	'LEBEN',	'',	0,	'OK',	'2015-06-20',	0,	'0000-00-00 00:00:00'),
(39927,	0,	'Hafermilch',	'',	'',	'',	'',	'Kaufland',	1.49,	2.000,	'2015-06-20',	'LEBEN',	'',	0,	'OK',	'2015-06-20',	0,	'0000-00-00 00:00:00'),
(39928,	0,	'KÃƒÂ¶rnerbrot',	'',	'',	'',	'',	'Kaufland',	1.39,	1.000,	'2015-06-20',	'LEBEN',	'',	0,	'offen',	'2015-06-20',	0,	'0000-00-00 00:00:00'),
(39929,	0,	'Nachthosen',	'',	'',	'',	'',	'Kaufland',	8.25,	1.000,	'2015-06-20',	'KIND',	'',	0,	'OK',	'2015-06-20',	0,	'0000-00-00 00:00:00'),
(39930,	0,	'Orangenwasser',	'',	'',	'',	'',	'Kaufland',	4.44,	1.000,	'2015-06-20',	'LEBEN',	'',	0,	'OK',	'2015-06-20',	0,	'0000-00-00 00:00:00'),
(39931,	0,	'Sojajoghurt',	'',	'',	'',	'',	'Kaufland',	1.99,	2.000,	'2015-06-20',	'LEBEN',	'',	0,	'OK',	'2015-06-20',	0,	'0000-00-00 00:00:00'),
(39932,	0,	'Veganer Aufschnitt',	'',	'',	'',	'',	'Kaufland',	1.85,	1.000,	'2015-06-20',	'LEBEN',	'',	0,	'OK',	'2015-06-20',	0,	'0000-00-00 00:00:00'),
(39933,	0,	'Wilmersburger kÃƒÂ¤se',	'',	'',	'',	'',	'Kaufland',	2.89,	1.000,	'2015-06-20',	'LEBEN',	'',	0,	'OK',	'2015-06-20',	0,	'0000-00-00 00:00:00'),
(39934,	0,	'jodsalz',	'',	'',	'',	'',	'Kaufland',	0.99,	1.000,	'2015-06-20',	'LEBEN',	'',	0,	'OK',	'2015-06-20',	0,	'0000-00-00 00:00:00'),
(39935,	0,	'alsan',	'',	'',	'',	'',	'Kaufland',	0.75,	2.000,	'2015-06-20',	'LEBEN',	'',	0,	'OK',	'2015-06-20',	0,	'0000-00-00 00:00:00'),
(39936,	0,	'soja cuisine',	'',	'',	'',	'',	'Kaufland',	0.99,	2.000,	'2015-06-20',	'LEBEN',	'',	0,	'OK',	'2015-06-20',	0,	'0000-00-00 00:00:00'),
(39937,	0,	'sojamilch',	'',	'',	'',	'',	'Kaufland',	1.89,	1.000,	'2015-06-20',	'LEBEN',	'',	0,	'OK',	'2015-06-20',	0,	'0000-00-00 00:00:00'),
(39938,	0,	'agavendicksaft',	'',	'',	'',	'',	'Kaufland',	2.65,	1.000,	'2015-06-20',	'LEBEN',	'',	0,	'OK',	'2015-06-20',	0,	'0000-00-00 00:00:00'),
(39939,	0,	'rÃƒÂ¤uchertofu',	'',	'',	'',	'',	'Kaufland',	1.99,	1.000,	'2015-06-20',	'LEBEN',	'',	0,	'offen',	'2015-06-20',	0,	'0000-00-00 00:00:00'),
(39940,	0,	'spÃƒÂ¼lmascinensalz',	'',	'',	'',	'',	'Kaufland',	0.75,	1.000,	'2015-06-20',	'LEBEN',	'',	0,	'OK',	'2015-06-20',	0,	'0000-00-00 00:00:00'),
(39941,	0,	'rosinen',	'',	'',	'',	'',	'Aldi',	0.79,	1.000,	'2015-06-20',	'LEBEN',	'',	0,	'offen',	'2015-06-20',	0,	'0000-00-00 00:00:00'),
(39942,	0,	'haferflocken',	'',	'',	'',	'',	'Aldi',	0.39,	1.000,	'2015-06-20',	'LEBEN',	'',	0,	'offen',	'2015-06-20',	0,	'0000-00-00 00:00:00'),
(39943,	0,	'maisdose',	'',	'',	'',	'',	'Aldi',	0.49,	1.000,	'2015-06-20',	'LEBEN',	'',	0,	'OK',	'2015-06-20',	0,	'0000-00-00 00:00:00'),
(39944,	0,	'kidneybohnen',	'',	'',	'',	'',	'Aldi',	0.45,	1.000,	'2015-06-20',	'LEBEN',	'',	0,	'OK',	'2015-06-20',	0,	'0000-00-00 00:00:00'),
(39945,	0,	'kapern',	'',	'',	'',	'',	'Kaufland',	0.98,	1.000,	'2015-06-20',	'LEBEN',	'',	0,	'OK',	'2015-06-20',	0,	'0000-00-00 00:00:00'),
(39946,	0,	'kokosmilch',	'',	'',	'',	'',	'Kaufland',	1.89,	1.000,	'2015-06-20',	'LEBEN',	'',	0,	'OK',	'2015-06-20',	0,	'0000-00-00 00:00:00'),
(39947,	0,	'gemÃƒÂ¼sebrÃƒÂ¼he',	'',	'',	'',	'',	'Kaufland',	1.45,	1.000,	'2015-06-20',	'LEBEN',	'',	0,	'OK',	'2015-06-20',	0,	'0000-00-00 00:00:00'),
(39948,	0,	'bier',	'',	'',	'',	'',	'Aldi',	3.49,	1.000,	'2015-06-20',	'LEBEN',	'',	0,	'offen',	'2015-06-20',	0,	'0000-00-00 00:00:00'),
(39949,	0,	'speisestÃƒÂ¤rke',	'',	'',	'',	'',	'Kaufland',	0.55,	1.000,	'2015-06-20',	'LEBEN',	'',	0,	'OK',	'2015-06-20',	0,	'0000-00-00 00:00:00'),
(39950,	0,	'bananen',	'',	'',	'',	'',	'Aldi',	1.30,	1.000,	'2015-06-20',	'LEBEN',	'',	0,	'offen',	'2015-06-20',	0,	'0000-00-00 00:00:00'),
(39951,	0,	'mars',	'',	'',	'',	'Brotwaren',	'Kaufland',	2.99,	1.000,	'2015-06-20',	'GESCH',	'',	0,	'OK',	'2015-06-20',	0,	'0000-00-00 00:00:00'),
(39952,	0,	'sojasosse',	'',	'',	'',	'',	'Kaufland',	1.54,	1.000,	'2015-06-20',	'LEBEN',	'',	0,	'OK',	'2015-06-20',	0,	'0000-00-00 00:00:00'),
(39953,	0,	'paprika edel',	'',	'',	'',	'',	'Kaufland',	3.79,	1.000,	'2015-06-20',	'LEBEN',	'',	0,	'OK',	'2015-06-20',	0,	'0000-00-00 00:00:00'),
(39954,	0,	'dino',	'',	'',	'',	'',	'Kaufland',	2.50,	1.000,	'2015-06-20',	'KIND',	'',	0,	'OK',	'2015-06-20',	0,	'0000-00-00 00:00:00'),
(39955,	0,	'frikafell',	'',	'',	'',	'',	'Kaufland',	2.49,	1.000,	'2015-06-20',	'LEBEN',	'',	0,	'offen',	'2015-06-20',	0,	'0000-00-00 00:00:00'),
(39956,	0,	'csmentbert',	'',	'',	'',	'',	'Kaufland',	1.59,	1.000,	'2015-06-20',	'LEBEN',	'',	0,	'OK',	'2015-06-20',	0,	'0000-00-00 00:00:00'),
(39957,	0,	'cola',	'',	'',	'',	'',	'Kaufland',	14.70,	1.000,	'2015-06-20',	'LEBEN',	'',	0,	'OK',	'2015-06-20',	0,	'0000-00-00 00:00:00'),
(40000,	0,	'Agavendicksaft',	'',	'',	'',	'',	'Kaufland',	2.65,	1.000,	'2015-06-27',	'LEBEN',	'',	0,	'OK',	'2015-06-27',	0,	'0000-00-00 00:00:00'),
(39998,	0,	'GemÃƒÂ¼se fÃƒÂ¼r Sonntag',	'',	'',	'',	'',	'Aldi',	0.69,	1.000,	'2015-06-27',	'LEBEN',	'',	0,	'OK',	'2015-06-27',	0,	'0000-00-00 00:00:00'),
(39999,	0,	'Kalkstopp fÃƒÂ¼r die Waschmaschine',	'',	'',	'',	'',	'Kaufland',	2.25,	1.000,	'2015-06-27',	'HAUSHALT',	'',	0,	'OK',	'2015-06-27',	0,	'0000-00-00 00:00:00'),
(39997,	0,	'TiefkÃƒÂ¼hlpommes',	'',	'',	'',	'',	'Aldi',	0.79,	1.000,	'2015-06-27',	'LEBEN',	'',	0,	'OK',	'2015-06-27',	0,	'0000-00-00 00:00:00'),
(39993,	0,	'Traubenschorle',	'',	'',	'',	'',	'Aldi',	1.00,	6.000,	'2015-06-27',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39994,	0,	'Orangenwasser',	'',	'',	'',	'',	'Kaufland',	4.44,	1.000,	'2015-06-27',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39995,	0,	'Hafermilch',	'',	'',	'',	'',	'Kaufland',	1.49,	4.000,	'2015-06-27',	'LEBEN',	'',	0,	'OK',	'2015-06-27',	0,	'0000-00-00 00:00:00'),
(39996,	0,	'Sojamilch Alpro',	'',	'',	'',	'',	'Kaufland',	1.89,	1.000,	'2015-06-27',	'LEBEN',	'',	0,	'OK',	'2015-06-27',	0,	'0000-00-00 00:00:00'),
(40001,	0,	'KÃƒÂ¼chentÃƒÂ¼cher',	'',	'',	'',	'',	'Kaufland',	2.45,	1.000,	'2015-06-27',	'HAUSHALT',	'',	0,	'OK',	'2015-06-27',	0,	'0000-00-00 00:00:00'),
(39992,	0,	'Butterbrotpapier',	'',	'',	'',	'',	'Kaufland',	0.75,	2.000,	'2015-06-27',	'HAUSHALT',	'',	0,	'OK',	'2015-06-27',	0,	'0000-00-00 00:00:00'),
(39990,	0,	'vegane knusper',	'',	'',	'',	'',	'Aldi',	1.85,	2.000,	'2015-06-27',	'LEBEN',	'',	0,	'OK',	'2015-06-27',	0,	'0000-00-00 00:00:00'),
(39991,	0,	'KÃƒÂ¶rnerbrot',	'',	'',	'',	'',	'Kaufland',	1.39,	1.000,	'2015-06-27',	'LEBEN',	'',	0,	'OK',	'2015-06-27',	0,	'0000-00-00 00:00:00'),
(40003,	0,	'Tofuaufschnitt',	'',	'',	'',	'',	'Aldi',	1.85,	3.000,	'2015-06-27',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39989,	0,	'KÃƒÂ¤seaufschnitt',	'',	'',	'',	'',	'Aldi',	1.59,	1.000,	'2015-06-27',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39987,	0,	'Bio Kartoffeln',	'',	'',	'',	'',	'Aldi',	2.49,	1.000,	'2015-06-27',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39988,	0,	'Calciumbrause',	'',	'',	'',	'',	'Aldi',	0.45,	1.000,	'2015-06-27',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39986,	0,	'Bananen',	'',	'',	'',	'',	'Aldi',	1.37,	1.000,	'2015-06-27',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39984,	0,	'Ãƒâ€pfel Braeburn',	'',	'',	'',	'',	'Aldi',	2.25,	1.000,	'2015-06-27',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(39985,	0,	'Baguette-BrÃƒÂ¶tchen',	'',	'',	'',	'',	'Aldi',	0.35,	1.000,	'2015-06-27',	'LEBEN',	'',	0,	'OK',	'',	0,	'0000-00-00 00:00:00'),
(40023,	0,	'osaft frisch',	'',	'',	'',	'',	'Penny',	1.45,	1.000,	'2015-08-04',	'LEBEN',	'',	0,	'OK',	'2015-08-04',	0,	'0000-00-00 00:00:00'),
(40024,	0,	'osaft',	'',	'',	'',	'',	'Penny',	0.79,	2.000,	'2015-08-04',	'LEBEN',	'',	0,	'OK',	'2015-08-04',	0,	'0000-00-00 00:00:00'),
(40025,	0,	'apfelmus',	'',	'',	'',	'',	'Penny',	0.49,	1.000,	'2015-08-04',	'LEBEN',	'',	0,	'OK',	'2015-08-04',	0,	'0000-00-00 00:00:00'),
(40026,	0,	'spÃƒÂ¤tzle',	'',	'',	'',	'',	'Penny',	0.69,	1.000,	'2015-08-04',	'LEBEN',	'',	0,	'OK',	'2015-08-04',	0,	'0000-00-00 00:00:00'),
(40027,	0,	'pilze',	'',	'',	'',	'',	'Penny',	1.29,	1.000,	'2015-08-04',	'LEBEN',	'',	0,	'OK',	'2015-08-04',	0,	'0000-00-00 00:00:00'),
(40028,	0,	'kugelschreiber',	'',	'',	'',	'',	'Penny',	0.00,	1.000,	'2015-08-04',	'HAUSHALT',	'',	0,	'OK',	'2015-08-04',	0,	'0000-00-00 00:00:00'),
(40029,	0,	'Malzbier',	'',	'',	'',	'',	'Penny',	0.50,	10.000,	'2015-08-04',	'LEBEN',	'',	0,	'OK',	'2015-08-04',	0,	'0000-00-00 00:00:00'),
(40030,	0,	'camenbert',	'',	'',	'',	'',	'Penny',	1.05,	1.000,	'2015-08-04',	'LEBEN',	'',	0,	'OK',	'2015-08-04',	0,	'0000-00-00 00:00:00'),
(40031,	0,	'esrom',	'',	'',	'',	'',	'Penny',	1.59,	1.000,	'2015-08-04',	'LEBEN',	'',	0,	'OK',	'2015-08-04',	0,	'0000-00-00 00:00:00'),
(40032,	0,	'pizza',	'',	'',	'',	'',	'Penny',	1.99,	1.000,	'2015-08-04',	'LEBEN',	'',	0,	'OK',	'2015-08-04',	0,	'0000-00-00 00:00:00'),
(40104,	0,	'Butterbrotspapier',	'',	'',	'',	'',	'Kaufland',	0.69,	2.000,	'2015-08-08',	'HAUSHALT',	'',	0,	'OK',	'2015-08-08',	0,	'0000-00-00 00:00:00'),
(40103,	0,	'Weltmeister Brot',	'',	'',	'',	'',	'Kaufland',	1.39,	1.000,	'2015-08-08',	'LEBEN',	'',	0,	'OK',	'2015-08-08',	0,	'0000-00-00 00:00:00'),
(40102,	0,	'Agatine',	'',	'',	'',	'',	'Kaufland',	0.95,	1.000,	'2015-08-08',	'LEBEN',	'',	0,	'OK',	'2015-08-08',	0,	'0000-00-00 00:00:00'),
(40101,	0,	'Sojamilch',	'',	'',	'',	'',	'Kaufland',	1.79,	1.000,	'2015-08-08',	'LEBEN',	'',	0,	'OK',	'2015-08-08',	0,	'0000-00-00 00:00:00'),
(40100,	0,	'Agavendicksaft',	'',	'',	'',	'',	'Kaufland',	2.65,	1.000,	'2015-08-08',	'LEBEN',	'',	0,	'OK',	'2015-08-08',	0,	'0000-00-00 00:00:00'),
(40099,	0,	'Pastete',	'',	'',	'',	'',	'Aldi',	1.19,	3.000,	'2015-08-08',	'LEBEN',	'',	0,	'offen',	'2015-08-08',	0,	'0000-00-00 00:00:00'),
(40098,	0,	'Plattpfirsiche',	'',	'',	'',	'',	'Aldi',	1.15,	1.000,	'2015-08-08',	'LEBEN',	'',	0,	'offen',	'2015-08-08',	0,	'0000-00-00 00:00:00'),
(40097,	0,	'Alsan',	'',	'',	'',	'',	'Kaufland',	1.09,	1.000,	'2015-08-08',	'LEBEN',	'',	0,	'OK',	'2015-08-08',	0,	'0000-00-00 00:00:00'),
(40096,	0,	'Stilles Wasser',	'',	'',	'',	'',	'Aldi',	0.44,	6.000,	'2015-08-08',	'LEBEN',	'',	0,	'offen',	'2015-08-08',	0,	'0000-00-00 00:00:00'),
(40095,	0,	'O-Saft',	'',	'',	'',	'',	'Aldi',	0.89,	6.000,	'2015-08-08',	'LEBEN',	'',	0,	'offen',	'2015-08-08',	0,	'0000-00-00 00:00:00'),
(40094,	0,	'Multivitaminsaft',	'',	'',	'',	'',	'Aldi',	0.89,	6.000,	'2015-08-08',	'LEBEN',	'',	0,	'offen',	'2015-08-08',	0,	'0000-00-00 00:00:00'),
(40093,	0,	'ÃƒÆ’Ã‚â€pfel Braeburn',	'',	'',	'',	'',	'Aldi',	2.09,	1.000,	'2015-08-08',	'LEBEN',	'',	0,	'offen',	'2015-08-08',	0,	'0000-00-00 00:00:00'),
(40092,	0,	'Haferflocken',	'',	'',	'',	'',	'Aldi',	0.39,	1.000,	'2015-08-08',	'LEBEN',	'',	0,	'offen',	'2015-08-08',	0,	'0000-00-00 00:00:00'),
(40091,	0,	'Aufschnitt',	'',	'',	'',	'',	'Alnatura',	2.49,	1.000,	'2015-08-08',	'LEBEN',	'',	0,	'OK',	'2015-08-08',	0,	'0000-00-00 00:00:00'),
(40090,	0,	'AufbackbrÃƒÂ¶tchen',	'',	'',	'',	'',	'Aldi',	0.35,	1.000,	'2015-08-08',	'LEBEN',	'',	0,	'offen',	'2015-08-08',	0,	'0000-00-00 00:00:00'),
(40089,	0,	'Hanfsamen',	'',	'',	'',	'',	'Alnatura',	2.69,	1.000,	'2015-08-08',	'LEBEN',	'',	0,	'OK',	'2015-08-08',	0,	'0000-00-00 00:00:00'),
(40088,	0,	'Pennenudeln',	'',	'',	'',	'',	'Aldi',	0.49,	1.000,	'2015-08-08',	'LEBEN',	'',	0,	'offen',	'2015-08-08',	0,	'0000-00-00 00:00:00'),
(40087,	0,	'Sojagranulat',	'',	'',	'',	'',	'Kaufland',	2.49,	1.000,	'2015-08-08',	'LEBEN',	'',	0,	'OK',	'2015-08-08',	0,	'0000-00-00 00:00:00'),
(40086,	0,	'OlivenÃƒÂ¶l',	'',	'',	'',	'',	'Aldi',	3.19,	1.000,	'2015-08-08',	'LEBEN',	'',	0,	'offen',	'2015-08-08',	0,	'0000-00-00 00:00:00'),
(40085,	0,	'schwarze Oliven',	'',	'',	'',	'',	'Kaufland',	1.99,	1.000,	'2015-08-08',	'LEBEN',	'',	0,	'OK',	'2015-08-08',	0,	'0000-00-00 00:00:00'),
(40084,	0,	'Wassermelone',	'',	'',	'',	'',	'Kaufland',	0.79,	3.026,	'2015-08-08',	'LEBEN',	'',	0,	'OK',	'2015-08-08',	0,	'0000-00-00 00:00:00'),
(40083,	0,	'Schlangengurke',	'',	'',	'',	'',	'Kaufland',	0.69,	1.000,	'2015-08-08',	'LEBEN',	'',	0,	'OK',	'2015-08-08',	0,	'0000-00-00 00:00:00'),
(40082,	0,	'Tomaten',	'',	'',	'',	'',	'Aldi',	1.45,	1.000,	'2015-08-08',	'LEBEN',	'',	0,	'offen',	'2015-08-08',	0,	'0000-00-00 00:00:00'),
(40081,	0,	'Chicoree',	'',	'',	'',	'',	'Kaufland',	1.29,	1.000,	'2015-08-08',	'LEBEN',	'',	0,	'OK',	'2015-08-08',	0,	'0000-00-00 00:00:00'),
(40080,	0,	'Zitronenschale gerieben',	'',	'',	'',	'',	'Kaufland',	0.49,	1.000,	'2015-08-08',	'LEBEN',	'',	0,	'OK',	'2015-08-08',	0,	'0000-00-00 00:00:00'),
(40079,	0,	'Tofu',	'',	'',	'',	'',	'Aldi',	1.85,	1.000,	'2015-08-08',	'LEBEN',	'',	0,	'offen',	'2015-08-08',	0,	'0000-00-00 00:00:00'),
(40078,	0,	'Schnittlauch',	'',	'',	'',	'',	'Kaufland',	1.19,	1.000,	'2015-08-08',	'LEBEN',	'',	0,	'OK',	'2015-08-08',	0,	'0000-00-00 00:00:00'),
(40077,	0,	'weisse Bohnen Dose',	'',	'',	'',	'',	'Kaufland',	1.29,	1.000,	'2015-08-08',	'LEBEN',	'',	0,	'OK',	'2015-08-08',	0,	'0000-00-00 00:00:00'),
(40076,	0,	'KrÃƒÂ¤uterbutter',	'',	'',	'',	'',	'Aldi',	0.85,	1.000,	'2015-08-08',	'LEBEN',	'',	0,	'offen',	'2015-08-08',	0,	'0000-00-00 00:00:00'),
(40075,	0,	'Fladenbrot',	'',	'',	'',	'',	'Kaufland',	0.85,	1.000,	'2015-08-08',	'LEBEN',	'',	0,	'OK',	'2015-08-08',	0,	'0000-00-00 00:00:00'),
(40074,	0,	'Sofix fÃƒÂ¼r alle BÃƒÂ¶den',	'',	'',	'',	'',	'Kaufland',	3.59,	1.000,	'2015-08-08',	'HAUSHALT',	'',	0,	'offen',	'2015-08-08',	0,	'0000-00-00 00:00:00'),
(40073,	0,	'Ceraclean',	'',	'',	'',	'',	'Kaufland',	2.75,	1.000,	'2015-08-08',	'HAUSHALT',	'',	0,	'offen',	'2015-08-08',	0,	'0000-00-00 00:00:00'),
(40072,	0,	'Ceranfeldklingen',	'',	'',	'',	'',	'Kaufland',	1.89,	1.000,	'2015-08-08',	'HAUSHALT',	'',	0,	'offen',	'2015-08-08',	0,	'0000-00-00 00:00:00'),
(40071,	0,	'Dinkelmilch',	'',	'',	'',	'',	'Alnatura',	1.85,	5.000,	'2015-08-08',	'LEBEN',	'',	0,	'OK',	'2015-08-08',	0,	'0000-00-00 00:00:00'),
(40070,	0,	'KÃƒÂ¼chenrollen',	'',	'',	'',	'',	'Kaufland',	2.25,	1.000,	'2015-08-08',	'HAUSHALT',	'',	0,	'OK',	'2015-08-08',	0,	'0000-00-00 00:00:00'),
(40105,	0,	'Mini-Chorizo',	'',	'',	'',	'',	'Alnatura',	1.19,	2.000,	'2015-08-08',	'LEBEN',	'',	0,	'OK',	'2015-08-08',	0,	'0000-00-00 00:00:00'),
(40106,	0,	'Ginger Ale',	'',	'',	'',	'',	'Aldi',	2.89,	2.000,	'2015-08-08',	'LEBEN',	'',	0,	'offen',	'2015-08-09',	0,	'0000-00-00 00:00:00'),
(40107,	0,	'Fassbrause',	'',	'',	'',	'',	'Aldi',	3.49,	1.000,	'2015-08-08',	'LEBEN',	'',	0,	'offen',	'2015-08-09',	0,	'0000-00-00 00:00:00'),
(40108,	0,	'MÃƒÂ¼llbeutel',	'',	'',	'',	'',	'Aldi',	0.55,	2.000,	'2015-08-08',	'HAUSHALT',	'',	0,	'offen',	'2015-08-08',	0,	'0000-00-00 00:00:00'),
(40109,	0,	'Moselwein',	'',	'',	'',	'',	'Aldi',	2.39,	1.000,	'2015-08-08',	'LEBEN',	'',	0,	'offen',	'2015-08-08',	0,	'0000-00-00 00:00:00'),
(40110,	0,	'Laugenbrezel',	'',	'',	'',	'',	'Aldi',	0.29,	1.000,	'2015-08-08',	'LEBEN',	'',	0,	'offen',	'2015-08-08',	0,	'0000-00-00 00:00:00'),
(40111,	0,	'Bananensaft',	'',	'',	'',	'',	'Aldi',	0.79,	1.000,	'2015-08-08',	'LEBEN',	'',	0,	'offen',	'2015-08-08',	0,	'0000-00-00 00:00:00'),
(40112,	0,	'Colorwaschmittel',	'',	'',	'',	'',	'Aldi',	3.59,	1.000,	'2015-08-08',	'HAUSHALT',	'',	0,	'offen',	'2015-08-08',	0,	'0000-00-00 00:00:00'),
(40113,	0,	'Toilettenpapier',	'',	'',	'',	'',	'Aldi',	1.95,	1.000,	'2015-08-08',	'HAUSHALT',	'',	0,	'offen',	'2015-08-08',	0,	'0000-00-00 00:00:00'),
(40114,	0,	'Batterien 4er-Set',	'',	'',	'',	'',	'Aldi',	1.59,	2.000,	'2015-08-08',	'HAUSHALT',	'',	0,	'offen',	'2015-08-08',	0,	'0000-00-00 00:00:00'),
(40115,	0,	'Veganer Paprika Aufschnitt',	'',	'',	'',	'',	'Kaufland',	1.85,	1.000,	'2015-08-08',	'LEBEN',	'',	0,	'OK',	'2015-08-08',	0,	'0000-00-00 00:00:00'),
(40116,	0,	'Wilmersburger KÃƒÂ¤se',	'',	'',	'',	'',	'Kaufland',	2.89,	2.000,	'2015-08-08',	'LEBEN',	'',	0,	'OK',	'2015-08-08',	0,	'0000-00-00 00:00:00'),
(40117,	0,	'Treteimer 5 Liter',	'',	'',	'',	'',	'Kaufland',	7.99,	1.000,	'2015-08-08',	'HAUSHALT',	'',	0,	'OK',	'2015-08-08',	0,	'0000-00-00 00:00:00'),
(40118,	0,	'Sojajoghurt',	'',	'',	'',	'',	'Kaufland',	1.99,	2.000,	'2015-08-08',	'LEBEN',	'',	0,	'OK',	'2015-08-08',	0,	'0000-00-00 00:00:00'),
(40119,	0,	'Leergut',	'',	'',	'',	'',	'Kaufland',	-5.35,	1.000,	'2015-08-08',	'PFAND',	'',	0,	'offen',	'2015-08-08',	0,	'0000-00-00 00:00:00'),
(40120,	0,	'Batterien 9 Volt',	'',	'',	'',	'',	'Kaufland',	0.80,	2.000,	'2015-08-08',	'HAUSHALT',	'',	0,	'offen',	'2015-08-08',	0,	'0000-00-00 00:00:00'),
(40121,	0,	'Filly',	'',	'',	'',	'',	'Kaufland',	1.99,	1.000,	'2015-08-08',	'KIND',	'',	0,	'offen',	'2015-08-08',	0,	'0000-00-00 00:00:00'),
(40122,	0,	'Zahnseide',	'',	'',	'',	'',	'Kaufland',	1.35,	1.000,	'2015-08-29',	'KIND',	'',	0,	'OK',	'2015-08-29',	0,	'0000-00-00 00:00:00'),
(40123,	0,	'Pasta u. SpÃ¤tzlemehl',	'',	'',	'',	'',	'Kaufland',	0.99,	1.000,	'2015-08-29',	'LEBEN',	'',	0,	'OK',	'2015-08-29',	0,	'0000-00-00 00:00:00'),
(40124,	0,	'Schinkenwurst',	'',	'',	'',	'',	'Kaufland',	1.99,	2.000,	'2015-08-29',	'LEBEN',	'',	0,	'OK',	'2015-08-29',	0,	'0000-00-00 00:00:00'),
(40125,	0,	'Ã„pfel',	'',	'',	'',	'',	'Aldi',	1.79,	1.000,	'2015-08-29',	'LEBEN',	'',	0,	'OK',	'2015-08-29',	0,	'0000-00-00 00:00:00'),
(40126,	0,	'SonntagsbrÃ¶tchen',	'',	'',	'',	'',	'Aldi',	0.79,	1.000,	'2015-08-29',	'LEBEN',	'',	0,	'OK',	'2015-08-29',	0,	'0000-00-00 00:00:00'),
(40127,	0,	'Ginger Ale',	'',	'',	'',	'',	'Aldi',	2.89,	1.000,	'2015-08-29',	'LEBEN',	'',	0,	'OK',	'2015-08-29',	0,	'0000-00-00 00:00:00'),
(40128,	0,	'Pennenudeln',	'',	'',	'',	'',	'Aldi',	0.49,	1.000,	'2015-08-29',	'LEBEN',	'',	0,	'OK',	'2015-08-29',	0,	'0000-00-00 00:00:00'),
(40129,	0,	'KÃ¶rnerbrot',	'',	'',	'',	'',	'Kaufland',	1.39,	1.000,	'2015-08-29',	'LEBEN',	'',	0,	'OK',	'2015-08-29',	0,	'0000-00-00 00:00:00'),
(40130,	0,	'Hafermilch',	'',	'',	'',	'',	'REWE',	1.39,	2.000,	'2015-08-29',	'LEBEN',	'',	0,	'offen',	'2015-08-29',	0,	'0000-00-00 00:00:00'),
(40131,	0,	'Smacks',	'',	'',	'',	'',	'Aldi',	1.89,	1.000,	'2015-08-29',	'LEBEN',	'',	0,	'OK',	'2015-08-29',	0,	'0000-00-00 00:00:00'),
(40132,	0,	'Alsan',	'',	'',	'',	'',	'Kaufland',	0.75,	1.000,	'2015-08-29',	'LEBEN',	'',	0,	'OK',	'2015-08-29',	0,	'0000-00-00 00:00:00'),
(40133,	0,	'Esrom',	'',	'',	'',	'',	'Aldi',	1.59,	1.000,	'2015-08-29',	'LEBEN',	'',	0,	'OK',	'2015-08-29',	0,	'0000-00-00 00:00:00'),
(40134,	0,	'passierte Tomaten',	'',	'',	'',	'',	'Aldi',	0.39,	3.000,	'2015-08-29',	'LEBEN',	'',	0,	'OK',	'2015-08-29',	0,	'0000-00-00 00:00:00'),
(40135,	0,	'Bananen',	'',	'',	'',	'',	'Aldi',	1.16,	1.000,	'2015-08-29',	'LEBEN',	'',	0,	'OK',	'2015-08-29',	0,	'0000-00-00 00:00:00'),
(40136,	0,	'Malzbier',	'',	'',	'',	'',	'Aldi',	3.09,	1.000,	'2015-08-29',	'LEBEN',	'',	0,	'OK',	'2015-08-29',	0,	'0000-00-00 00:00:00'),
(40137,	0,	'Chips',	'',	'',	'',	'',	'Kaufland',	0.99,	1.000,	'2015-08-29',	'LEBEN',	'',	0,	'OK',	'2015-08-29',	0,	'0000-00-00 00:00:00'),
(40138,	0,	'Dip',	'',	'',	'',	'',	'Kaufland',	0.99,	1.000,	'2015-08-29',	'LEBEN',	'',	0,	'OK',	'2015-08-29',	0,	'0000-00-00 00:00:00'),
(40139,	0,	'reibekÃ¤se',	'',	'',	'',	'',	'Aldi',	1.29,	1.000,	'2015-08-29',	'LEBEN',	'',	0,	'OK',	'2015-08-29',	0,	'0000-00-00 00:00:00'),
(40140,	0,	'pizza',	'',	'',	'',	'',	'Aldi',	0.69,	1.000,	'2015-08-29',	'KIND',	'',	0,	'OK',	'2015-08-29',	0,	'0000-00-00 00:00:00'),
(40141,	0,	'smoothie',	'',	'',	'',	'',	'Aldi',	0.85,	1.000,	'2015-08-29',	'KIND',	'',	0,	'OK',	'2015-08-29',	0,	'0000-00-00 00:00:00'),
(40142,	0,	'filly',	'',	'',	'',	'',	'Kaufland',	1.99,	1.000,	'2015-08-29',	'KIND',	'',	0,	'OK',	'2015-08-29',	0,	'0000-00-00 00:00:00'),
(40143,	0,	'Orangenwasser',	'',	'',	'',	'',	'Kaufland',	4.44,	1.000,	'2015-08-29',	'LEBEN',	'',	0,	'OK',	'2015-08-29',	0,	'0000-00-00 00:00:00'),
(40144,	0,	'Pfand',	'',	'',	'',	'',	'REWE',	0.25,	1.000,	'2015-08-29',	'PFAND',	'',	0,	'offen',	'2015-08-29',	0,	'0000-00-00 00:00:00'),
(40145,	0,	'Limo',	'',	'',	'',	'',	'REWE',	1.39,	1.000,	'2015-08-29',	'LEBEN',	'',	0,	'offen',	'2015-08-29',	0,	'0000-00-00 00:00:00'),
(40146,	0,	'Bilderrahmen 13x18',	'',	'',	'',	'',	'Kaufland',	3.19,	2.000,	'2015-10-10',	'HAUSHALT',	'',	0,	'offen',	'2015-10-10',	0,	'0000-00-00 00:00:00'),
(40147,	0,	'WC-Reiniger Frosch',	'',	'',	'',	'',	'Kaufland',	1.65,	2.000,	'2015-10-10',	'HAUSHALT',	'',	0,	'offen',	'2015-10-10',	0,	'0000-00-00 00:00:00'),
(40148,	0,	'AufbackbrÃ¶tchen',	'',	'',	'',	'',	'Aldi',	0.35,	1.000,	'2015-10-10',	'LEBEN',	'',	0,	'offen',	'2015-10-10',	0,	'0000-00-00 00:00:00'),
(40149,	0,	'Klopapier',	'',	'',	'',	'',	'Aldi',	1.95,	1.000,	'2015-10-10',	'HAUSHALT',	'',	0,	'offen',	'2015-10-10',	0,	'0000-00-00 00:00:00'),
(40150,	0,	'Malzbier',	'',	'',	'',	'',	'Aldi',	3.09,	1.000,	'2015-10-10',	'LEBEN',	'',	0,	'offen',	'2015-10-10',	0,	'0000-00-00 00:00:00'),
(40151,	0,	'Orangen',	'',	'',	'',	'',	'Aldi',	2.15,	1.000,	'2015-10-10',	'LEBEN',	'',	0,	'offen',	'2015-10-10',	0,	'0000-00-00 00:00:00'),
(40152,	0,	'Sojaschnitzel',	'',	'',	'',	'',	'Aldi',	1.85,	2.000,	'2015-10-10',	'LEBEN',	'',	0,	'offen',	'2015-10-10',	0,	'0000-00-00 00:00:00'),
(40153,	0,	'Strauchtomaten',	'',	'',	'',	'',	'Aldi',	2.45,	1.000,	'2015-10-10',	'LEBEN',	'',	0,	'offen',	'2015-10-10',	0,	'0000-00-00 00:00:00'),
(40154,	0,	'Traubenschorle',	'',	'',	'',	'',	'Aldi',	6.00,	1.000,	'2015-10-10',	'LEBEN',	'',	0,	'offen',	'2015-10-10',	0,	'0000-00-00 00:00:00'),
(40155,	0,	'Weintrauben',	'',	'',	'',	'',	'Aldi',	1.65,	1.000,	'2015-10-10',	'LEBEN',	'',	0,	'offen',	'2015-10-10',	0,	'0000-00-00 00:00:00'),
(40156,	0,	'paprika bunt',	'',	'',	'',	'',	'Aldi',	1.49,	1.000,	'2015-10-10',	'LEBEN',	'',	0,	'offen',	'2015-10-10',	0,	'0000-00-00 00:00:00'),
(40157,	0,	'Ã„pfel Modi',	'',	'',	'',	'',	'Aldi',	1.35,	1.000,	'2015-10-10',	'LEBEN',	'',	0,	'offen',	'2015-10-10',	0,	'0000-00-00 00:00:00'),
(40158,	0,	'Dinkelmilch',	'',	'',	'',	'',	'Kaufland',	1.65,	3.000,	'2015-10-10',	'LEBEN',	'',	0,	'offen',	'2015-10-10',	0,	'0000-00-00 00:00:00'),
(40159,	0,	'KÃ¶rnerbrot',	'',	'',	'',	'',	'Kaufland',	1.39,	1.000,	'2015-10-10',	'LEBEN',	'',	0,	'offen',	'2015-10-10',	0,	'0000-00-00 00:00:00'),
(40160,	0,	'Orangenwasser',	'',	'',	'',	'',	'Kaufland',	4.44,	1.000,	'2015-10-10',	'LEBEN',	'',	0,	'offen',	'2015-10-10',	0,	'0000-00-00 00:00:00'),
(40161,	0,	'cashewkerne',	'',	'',	'',	'',	'Kaufland',	3.85,	1.000,	'2015-10-10',	'LEBEN',	'',	0,	'offen',	'2015-10-10',	0,	'0000-00-00 00:00:00'),
(40162,	0,	'Agavendicksaft',	'',	'',	'',	'',	'Kaufland',	2.65,	2.000,	'2015-10-10',	'LEBEN',	'',	0,	'offen',	'2015-10-10',	0,	'0000-00-00 00:00:00'),
(40163,	0,	'Tellerlinsen (braun)',	'',	'',	'',	'',	'Kaufland',	1.79,	1.000,	'2015-10-10',	'LEBEN',	'',	0,	'offen',	'2015-10-10',	0,	'0000-00-00 00:00:00'),
(40164,	0,	'Lasagneplatten vegan',	'',	'',	'',	'',	'Kaufland',	1.29,	1.000,	'2015-10-10',	'LEBEN',	'',	0,	'offen',	'2015-10-10',	0,	'0000-00-00 00:00:00'),
(40165,	0,	'Tomatenmark',	'',	'',	'',	'',	'Aldi',	0.55,	1.000,	'2015-10-10',	'LEBEN',	'',	0,	'offen',	'2015-10-10',	0,	'0000-00-00 00:00:00'),
(40166,	0,	'passierte Tomaten',	'',	'',	'',	'',	'Aldi',	0.39,	2.000,	'2015-10-10',	'LEBEN',	'',	0,	'offen',	'2015-10-10',	0,	'0000-00-00 00:00:00'),
(40167,	0,	'Alsan',	'',	'',	'',	'',	'Kaufland',	0.75,	1.000,	'2015-10-10',	'LEBEN',	'',	0,	'offen',	'2015-10-10',	0,	'0000-00-00 00:00:00'),
(40168,	0,	'Sojagranulat',	'',	'',	'',	'',	'Kaufland',	2.49,	1.000,	'2015-10-10',	'LEBEN',	'',	0,	'offen',	'2015-10-10',	0,	'0000-00-00 00:00:00'),
(40169,	0,	'Sojamilch',	'',	'',	'',	'',	'Kaufland',	1.79,	1.000,	'2015-10-10',	'LEBEN',	'',	0,	'offen',	'2015-10-10',	0,	'0000-00-00 00:00:00'),
(40170,	0,	'Nudeln penne',	'',	'',	'',	'',	'Aldi',	0.49,	1.000,	'2015-10-10',	'LEBEN',	'',	0,	'offen',	'2015-10-10',	0,	'0000-00-00 00:00:00'),
(40171,	0,	'ReibekÃ¤se',	'',	'',	'',	'',	'Aldi',	1.29,	1.000,	'2015-10-10',	'LEBEN',	'',	0,	'offen',	'2015-10-10',	0,	'0000-00-00 00:00:00'),
(40172,	0,	'GemÃ¼sebrÃ¼he',	'',	'',	'',	'',	'Kaufland',	1.59,	1.000,	'2015-10-10',	'LEBEN',	'',	0,	'offen',	'2015-10-10',	0,	'0000-00-00 00:00:00'),
(40173,	0,	'Mangos',	'',	'',	'',	'',	'Aldi',	1.99,	2.000,	'2015-10-10',	'LEBEN',	'',	0,	'offen',	'2015-10-10',	0,	'0000-00-00 00:00:00'),
(40174,	0,	'Bananen',	'',	'',	'',	'',	'Aldi',	0.90,	1.000,	'2015-10-10',	'LEBEN',	'',	0,	'offen',	'2015-10-10',	0,	'0000-00-00 00:00:00'),
(40175,	0,	'Kalkstopppulver',	'',	'',	'',	'',	'Kaufland',	2.55,	1.000,	'2015-10-10',	'HAUSHALT',	'',	0,	'offen',	'2015-10-10',	0,	'0000-00-00 00:00:00'),
(40176,	0,	'Kaffeefilter Gr4',	'',	'',	'',	'',	'Aldi',	0.45,	1.000,	'2015-10-10',	'HAUSHALT',	'',	0,	'offen',	'2015-10-10',	0,	'0000-00-00 00:00:00'),
(40177,	0,	'Destiliertes Wasser',	'',	'',	'',	'',	'Kaufland',	1.65,	1.000,	'2015-10-10',	'HAUSHALT',	'',	0,	'offen',	'2015-10-10',	0,	'0000-00-00 00:00:00'),
(40178,	0,	'Pasta u. SpÃ¤tzlemehl',	'',	'',	'',	'',	'Kaufland',	0.99,	1.000,	'2015-10-10',	'LEBEN',	'',	0,	'offen',	'2015-10-10',	0,	'0000-00-00 00:00:00'),
(40179,	0,	'Ginger Ale',	'',	'',	'',	'',	'Aldi',	2.89,	1.000,	'2015-10-10',	'LEBEN',	'',	0,	'offen',	'2015-10-10',	0,	'0000-00-00 00:00:00'),
(40180,	0,	'Rohrzucker',	'',	'',	'',	'',	'Kaufland',	1.99,	1.000,	'2015-10-10',	'LEBEN',	'',	0,	'offen',	'2015-10-10',	0,	'0000-00-00 00:00:00'),
(40181,	0,	'Radler alkoholfrei',	'',	'',	'',	'',	'Aldi',	3.09,	1.000,	'2015-10-10',	'LEBEN',	'',	0,	'offen',	'2015-10-10',	0,	'0000-00-00 00:00:00'),
(40182,	0,	'Colorwaschmittel',	'',	'',	'',	'',	'Aldi',	3.59,	1.000,	'2015-10-10',	'HAUSHALT',	'',	0,	'offen',	'2015-10-10',	0,	'0000-00-00 00:00:00'),
(40183,	0,	'Curry',	'',	'',	'',	'',	'Aldi',	0.69,	1.000,	'2015-10-10',	'LEBEN',	'',	0,	'offen',	'2015-10-10',	0,	'0000-00-00 00:00:00'),
(40184,	0,	'Blumenerde',	'',	'',	'',	'',	'Kaufland',	2.99,	1.000,	'2015-10-10',	'HAUSHALT',	'',	0,	'offen',	'2015-10-10',	0,	'0000-00-00 00:00:00'),
(40185,	0,	'Familienkalender',	'',	'',	'',	'',	'Kaufland',	2.00,	1.000,	'2015-10-10',	'FAMILIE',	'',	0,	'offen',	'2015-10-10',	0,	'0000-00-00 00:00:00'),
(40186,	0,	'Fillyheft',	'',	'',	'',	'',	'Kaufland',	3.99,	1.000,	'2015-10-10',	'KIND',	'',	0,	'offen',	'2015-10-10',	0,	'0000-00-00 00:00:00'),
(40187,	0,	'Fernsehzeitschrift',	'',	'',	'',	'',	'Kaufland',	1.00,	1.000,	'2015-10-10',	'HAUSHALT',	'',	0,	'offen',	'2015-10-10',	0,	'0000-00-00 00:00:00'),
(40188,	0,	'Tortilla Chips',	'',	'',	'',	'',	'Kaufland',	0.99,	1.000,	'2015-10-10',	'LEBEN',	'',	0,	'offen',	'2015-10-10',	0,	'0000-00-00 00:00:00'),
(40189,	0,	'Salsa Dip',	'',	'',	'',	'',	'Kaufland',	0.99,	2.000,	'2015-10-10',	'LEBEN',	'',	0,	'offen',	'2015-10-10',	0,	'0000-00-00 00:00:00'),
(40191,	0,	'Ãƒâ€pfel Braeburn',	'',	'',	'',	'Obst / Gemuese',	'Aldi',	1.55,	1.000,	'',	'LEBEN',	'',	0,	'offen',	'2016-01-16',	0,	'2016-01-16 09:09:37'),
(40201,	0,	'Baguette-BrÃ¶tchen',	'',	'',	'',	'Brotwaren',	'Aldi',	0.35,	1.000,	'',	'LEBEN',	'22115904',	0,	'offen',	'2016-01-16',	0,	'2016-01-16 09:09:37'),
(40211,	0,	'Bananen',	'',	'',	'',	'Obst / Gemuese',	'Aldi',	0.89,	1.000,	'',	'LEBEN',	'',	0,	'offen',	'2016-01-16',	0,	'2016-01-16 09:09:37'),
(40221,	0,	'GemÃƒÂ¼sebrÃƒÂ¼he',	'',	'',	'',	'Gewuerze',	'Aldi',	0.59,	1.000,	'',	'LEBEN',	'',	0,	'offen',	'2016-01-16',	0,	'2016-01-16 09:09:37'),
(40231,	0,	'Kiwi',	'',	'',	'',	'Obst / Gemuese',	'Aldi',	1.29,	1.000,	'',	'LEBEN',	'',	0,	'offen',	'2016-01-16',	0,	'2016-01-16 09:09:37'),
(40241,	0,	'Margarine',	'',	'',	'',	'(ohne)',	'Aldi',	0.69,	1.000,	'',	'LEBEN',	'22112446',	0,	'offen',	'2016-01-16',	0,	'2016-01-16 09:09:37'),
(40251,	0,	'Naschtomaten ( Mini )',	'',	'',	'',	'Obst / Gemuese',	'Aldi',	2.49,	1.000,	'',	'LEBEN',	'4049929247550',	0,	'offen',	'2016-01-16',	0,	'2016-01-16 09:09:37'),
(40261,	0,	'passierte tomaten',	'',	'',	'',	'Konserven',	'Aldi',	0.35,	1.000,	'',	'LEBEN',	'22114235',	0,	'offen',	'2016-01-16',	0,	'2016-01-16 09:09:37'),
(40271,	0,	'RapsÃ¶l',	'',	'',	'',	'Konserven',	'Aldi',	0.95,	2.000,	'',	'LEBEN',	'',	0,	'offen',	'2016-01-16',	0,	'2016-01-16 09:09:37'),
(40281,	0,	'Schlangengurke',	'',	'',	'',	'Obst / Gemuese',	'Aldi',	0.30,	1.000,	'',	'LEBEN',	'',	0,	'offen',	'2016-01-16',	0,	'2016-01-16 09:09:37'),
(40291,	0,	'Sojaschnitzel',	'',	'',	'',	'KÃƒÂ¼hltheke',	'Aldi',	1.79,	2.000,	'',	'LEBEN',	'',	0,	'offen',	'2016-01-16',	0,	'2016-01-16 09:09:37'),
(40301,	0,	'Spiralinudeln',	'',	'',	'',	'Brotwaren',	'Aldi',	0.49,	1.000,	'',	'LEBEN',	'22111326',	0,	'offen',	'2016-01-16',	0,	'2016-01-16 09:09:37'),
(40311,	0,	'Tofuaufschnitt',	'',	'',	'',	'Milchprodukte',	'Aldi',	1.79,	1.000,	'',	'LEBEN',	'22144515',	0,	'offen',	'2016-01-16',	0,	'2016-01-16 09:09:37'),
(40321,	0,	'Tomaten',	'',	'',	'',	'Obst / Gemuese',	'Aldi',	1.00,	1.000,	'',	'LEBEN',	'',	0,	'offen',	'2016-01-16',	0,	'2016-01-16 09:09:37'),
(40331,	0,	'Traubenschorle',	'',	'',	'',	'Getraenke',	'Aldi',	0.89,	6.000,	'',	'LEBEN',	'42141167',	0,	'offen',	'2016-01-16',	0,	'2016-01-16 09:09:37'),
(40341,	0,	'Orangenwasser',	'',	'',	'',	'Getraenke',	'Kaufland',	0.49,	6.000,	'',	'LEBEN',	'4300175374170',	0,	'offen',	'2016-01-16',	0,	'2016-01-16 09:09:37'),
(40351,	0,	'Kichererbsen aus der Dose',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	2.000,	'',	'LEBEN',	'',	0,	'offen',	'2016-01-16',	0,	'0000-00-00 00:00:00'),
(40361,	0,	'vegane Rigatoni Nudeln',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'',	'LEBEN',	'',	0,	'offen',	'2016-01-16',	0,	'0000-00-00 00:00:00'),
(40371,	0,	'Curcuma GewÃ¼rz',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'',	'LEBEN',	'',	0,	'offen',	'2016-01-16',	0,	'0000-00-00 00:00:00'),
(40381,	0,	'Sojamilch ohne Zucker',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	2.000,	'',	'LEBEN',	'',	0,	'offen',	'2016-01-16',	0,	'0000-00-00 00:00:00'),
(40391,	0,	'vegane BockwÃ¼rstchen ( Wienerle )',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	2.000,	'',	'LEBEN',	'',	0,	'offen',	'2016-01-16',	0,	'0000-00-00 00:00:00'),
(40401,	0,	'Kokosmilch',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'',	'LEBEN',	'',	0,	'offen',	'2016-01-16',	0,	'0000-00-00 00:00:00'),
(40411,	0,	'Mais Dose',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'',	'LEBEN',	'',	0,	'offen',	'2016-01-16',	0,	'0000-00-00 00:00:00'),
(40421,	0,	'Kidneybohnen',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'',	'LEBEN',	'',	0,	'offen',	'2016-01-16',	0,	'0000-00-00 00:00:00'),
(40431,	0,	'Rote Beete',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'',	'LEBEN',	'',	0,	'offen',	'2016-01-16',	0,	'0000-00-00 00:00:00'),
(40441,	0,	'deutsche MÃ¶hren (frisch)',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'',	'LEBEN',	'',	0,	'offen',	'2016-01-16',	0,	'0000-00-00 00:00:00'),
(40451,	0,	'RÃ¤uchertofu',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'',	'LEBEN',	'',	0,	'offen',	'2016-01-16',	0,	'0000-00-00 00:00:00'),
(40461,	0,	'vegane Gnocchi',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'',	'LEBEN',	'',	0,	'offen',	'2016-01-16',	0,	'0000-00-00 00:00:00'),
(40471,	0,	'Dinkelmilch',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	3.000,	'',	'LEBEN',	'',	0,	'offen',	'2016-01-16',	0,	'0000-00-00 00:00:00'),
(40481,	0,	'Paprika edelsÃ¼ÃŸ Pulver',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'',	'LEBEN',	'',	0,	'offen',	'2016-01-16',	0,	'0000-00-00 00:00:00'),
(40491,	0,	'Sojagranulat',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'',	'LEBEN',	'',	0,	'offen',	'2016-01-16',	0,	'0000-00-00 00:00:00'),
(40501,	0,	'Chorizo vegan',	'',	'',	'',	'(ohne)',	'Alnatura',	0.00,	1.000,	'',	'LEBEN',	'',	0,	'offen',	'2016-01-16',	0,	'0000-00-00 00:00:00'),
(40511,	0,	'WattestÃ¤bchen',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'',	'HAUSHALT',	'',	0,	'offen',	'2016-01-16',	0,	'0000-00-00 00:00:00'),
(40521,	0,	'Ceranfeldschaber',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'',	'HAUSHALT',	'',	0,	'offen',	'2016-01-16',	0,	'0000-00-00 00:00:00'),
(40531,	0,	'GewÃ¼rzgurken',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'',	'LEBEN',	'',	0,	'offen',	'2016-01-16',	0,	'0000-00-00 00:00:00'),
(40541,	0,	'RotbÃ¤ckchensaft',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'',	'LEBEN',	'',	0,	'offen',	'2016-01-16',	0,	'0000-00-00 00:00:00'),
(40551,	0,	'vegane Vleischwurst ( am StÃ¼ck und in >Scheiben )',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	2.000,	'',	'LEBEN',	'',	0,	'offen',	'2016-01-16',	0,	'0000-00-00 00:00:00'),
(40561,	0,	'Agavendicksaft',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	2.000,	'',	'LEBEN',	'',	0,	'offen',	'2016-01-16',	0,	'0000-00-00 00:00:00'),
(40571,	0,	'KÃ¶rnerbrot',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'',	'LEBEN',	'',	0,	'offen',	'2016-01-16',	0,	'0000-00-00 00:00:00'),
(40581,	0,	'Zahnseide',	'',	'',	'',	'(ohne)',	'Kaufland',	0.00,	1.000,	'',	'KIND',	'',	0,	'offen',	'2016-01-16',	0,	'0000-00-00 00:00:00');

CREATE TABLE `tblelternconfig` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldsollstd` int(11) NOT NULL,
  `fldbez` varchar(250) COLLATE utf8_bin NOT NULL,
  `fldvondatum` date NOT NULL,
  `fldbisdatum` date NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

INSERT INTO `tblelternconfig` (`fldindex`, `fldsollstd`, `fldbez`, `fldvondatum`, `fldbisdatum`) VALUES
(1,	24,	'Kindergartenjahr 2011 / 2012',	'2011-08-31',	'2012-08-31'),
(3,	24,	'Kindergartenjahr 2012 / 2013',	'2012-08-31',	'2013-08-31');

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

INSERT INTO `tblelternstunden` (`fldindex`, `flddatum`, `fldbez`, `fldstunden`, `fldarchivdat`, `fldAnwender`, `fldRang`) VALUES
(1,	'2011-09-10',	'Gartenarbeit (Zaun)  (Datum nachgetragen)',	2.0,	'2012-08-31',	'',	'00'),
(6,	'2011-11-03',	'Gartenarbeit (Zaun)',	1.5,	'2012-08-31',	'',	'00'),
(7,	'2012-01-14',	'Arbeit AuÃƒÅ¸engelÃƒÂ¤nde',	2.5,	'2012-08-31',	'',	'00'),
(8,	'2012-01-14',	'Arbeit AuÃƒÅ¸engelÃƒÂ¤nde',	2.5,	'2012-08-31',	'',	'00'),
(133,	'2012-09-05',	'Aushang Quasselstrippe gestaltet',	0.5,	'1900-01-01',	'Horst',	'00'),
(153,	'2012-11-13',	'Artikel verfasst fÃƒÂ¼r Quasselstrippe',	2.5,	'1900-01-01',	'Christiane',	'00'),
(143,	'2012-11-15',	'Redaktionssitzung Quasselstrippe',	3.0,	'1900-01-01',	'Horst',	'00'),
(163,	'2013-02-01',	'GrÃƒÂ¼ne Gruppe ausgerÃƒÂ¤umt',	1.0,	'1900-01-01',	'Christiane',	'00'),
(203,	'2013-02-16',	'Arktikel Editorial und Anzeige erstellt Quasselstrippe',	2.0,	'1900-01-01',	'Horst',	'00'),
(213,	'2013-02-15',	'Artikel fÃƒÂ¼r Quasselstrippe erstellt',	3.5,	'1900-01-01',	'Christiane',	'00'),
(223,	'2013-02-17',	'Quasselstrippe in Scribus zusammengefÃƒÂ¼gt',	2.0,	'1900-01-01',	'Horst',	'00'),
(233,	'2013-02-19',	'Quasselstrippe Kindermund zusammengestellt und skizziert',	1.0,	'1900-01-01',	'Christiane',	'00'),
(243,	'2013-03-05',	'Quasselstrippe Probeexemplar gedruckt',	1.0,	'1900-01-01',	'Horst',	'00');

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

INSERT INTO `tblerledigung` (`fldIndex`, `fldDetailInd`, `fldRang`, `fldBezeichnung`, `fldStatus`, `fldBenutzer`, `fldDatum`, `fldErledigDat`, `fldArchivDat`, `fldbemerkung`, `fldtimestamp`, `fldArt`, `fldPrior`, `fldGruppe`, `fldurl`, `fldcategory`) VALUES
(204,	0,	'99',	'Kindergartenformulare fertig machen',	'erledigt',	'Horst',	'2010-03-24',	'',	'2010-03-24',	'',	'2011-12-21 20:00:45',	'',	1,	'leer',	'',	''),
(2,	0,	'99',	'KÃƒÂ¶lner Stadtanzeiger Kontonummer mitteilen',	'erledigt',	'Horst',	'2010-03-24',	'',	'2010-03-24',	'',	'2011-12-21 20:00:45',	'',	1,	'leer',	'',	''),
(4,	0,	'99',	'KontoauszÃƒÂ¼ge von Vodafone an Rechtsanwalt schicken',	'erledigt',	'Horst',	'2010-03-24',	'',	'2010-03-24',	'',	'2011-12-21 20:00:45',	'',	1,	'leer',	'',	''),
(6,	0,	'99',	'Kleintransporter fÃƒÂ¼r Dienst gemieten (06.04.2010)',	'erledigt',	'Horst',	'2010-03-24',	'',	'2010-03-24',	'',	'2011-12-21 20:00:45',	'',	1,	'leer',	'',	''),
(12,	0,	'99',	'Kiste mit Wechselsachen etc fÃƒÂ¼r Kindergarten fertig machen',	'erledigt',	'Horst',	'2010-04-07',	'',	'2010-04-14',	'',	'2011-12-21 20:00:45',	'',	1,	'leer',	'',	''),
(8,	0,	'99',	'Osterkarten schreiben',	'erledigt',	'Horst',	'2010-03-26',	'',	'2010-04-14',	'',	'2011-12-21 20:00:45',	'',	1,	'leer',	'',	''),
(9,	0,	'99',	'BuÃƒÅ¸geld Kamen bezahlen',	'erledigt',	'Horst',	'2010-03-30',	'',	'2010-04-14',	'',	'2011-12-21 20:00:45',	'',	1,	'leer',	'',	''),
(11,	0,	'99',	'Weihnachtssachen wegrÃƒÂ¤umen',	'erledigt',	'Christiane',	'2010-04-02',	'',	'2010-04-14',	'',	'2011-12-21 20:00:45',	'',	1,	'leer',	'',	''),
(13,	0,	'99',	'DB Forderung Bahnkarte widersprechen!',	'erledigt',	'Horst',	'2010-04-14',	'',	'2010-04-14',	'',	'2011-12-21 20:00:45',	'',	1,	'leer',	'',	''),
(14,	0,	'01',	'Finanzielles (Bank, Provinzial, Offene Rechnung)',	'erledigt',	'Horst',	'2011-01-25',	'2011-04-28',	'',	'',	'2011-12-21 20:00:45',	'',	1,	'leer',	'',	''),
(15,	33,	'05',	'Kleiderschrank (Ausmisten, AufrÃƒÂ¤umen)',	'offen',	'Chris',	'2011-01-25',	'',	'',	'',	'2011-12-21 20:00:45',	'',	1,	'leer',	'',	''),
(16,	0,	'07',	'Finanzverein grÃƒÂ¼nden (Betroffene suchen)',	'zurueckges',	'Horst',	'2011-01-25',	'',	'',	'',	'2012-02-27 22:29:37',	'',	1,	'Finanzen',	'',	''),
(17,	33,	'08',	'Vorkeller ordnen',	'offen',	'Chris',	'2011-01-25',	'',	'',	'',	'2011-12-21 20:00:45',	'',	1,	'leer',	'',	''),
(18,	0,	'04',	'Familienpartei beitreten (Gleichgesinnte finden, aktiv mitwirken)',	'zurueckges',	'Horst',	'2011-01-25',	'',	'',	'',	'2011-12-21 20:00:45',	'',	1,	'leer',	'',	''),
(19,	33,	'07',	'Abstellkammer ausmisten',	'offen',	'Chris',	'2011-01-25',	'',	'',	'',	'2011-12-21 20:00:45',	'',	1,	'leer',	'',	''),
(20,	0,	'05',	'Stromanbieter wechseln (123-Energie)',	'offen',	'Horst',	'2011-01-25',	'',	'',	'',	'2011-12-21 20:08:21',	'',	1,	'Haushalt',	'',	''),
(21,	0,	'06',	'Socken sortieren (Socken zusammen in die WÃƒÂ¤sche geben)',	'erledigt',	'Christiane',	'2011-01-25',	'2011-12-03',	'',	'haben sockenklammer',	'2011-12-21 20:00:45',	'',	1,	'leer',	'',	''),
(22,	14,	'99',	'GEZ ummelden',	'erledigt',	'Horst',	'2011-02-07',	'2011-02-24',	'',	'',	'2011-12-21 20:00:45',	'',	1,	'leer',	'',	''),
(23,	14,	'99',	'Netcologne bezahlen Nov / Dez 2010',	'erledigt',	'Horst',	'2011-02-07',	'2011-02-24',	'',	'',	'2011-12-21 20:00:45',	'',	1,	'leer',	'',	''),
(24,	14,	'99',	'HDI Auto bezahlen',	'erledigt',	'Horst',	'2011-02-07',	'2011-04-28',	'',	'',	'2011-12-21 20:00:45',	'',	1,	'leer',	'',	''),
(31,	0,	'99',	'KarnevalskostÃƒÂ¼me fÃƒÂ¼r Frieda',	'erledigt',	'Horst',	'2011-02-18',	'2011-02-24',	'',	'',	'2011-12-21 20:00:45',	'',	1,	'leer',	'',	''),
(32,	0,	'',	'Vorrat / Lebensmittel erfassen fÃ¼r Rezeptdatenbank',	'offen',	'Horst',	'2011-02-18',	'',	'',	'',	'2015-04-20 05:27:47',	'',	1,	'PrgEntw',	'',	'Erledigung'),
(33,	0,	'99',	'Ordnung schaffen',	'zurueckges',	'Horst',	'2011-02-24',	'',	'',	'',	'2012-01-02 17:50:13',	'',	1,	'(ohne)',	'',	''),
(34,	0,	'02',	'Finanzen 01/2011',	'erledigt',	'Horst',	'2011-02-24',	'2011-02-28',	'',	'',	'2011-12-21 20:00:45',	'',	1,	'leer',	'',	''),
(35,	34,	'99',	'Netcologne bezahlen 01/2011',	'erledigt',	'Horst',	'2011-02-24',	'2011-02-28',	'',	'',	'2011-12-21 20:00:45',	'',	1,	'leer',	'',	''),
(36,	14,	'99',	'Provinzial antworten',	'erledigt',	'Horst',	'2011-02-24',	'2011-02-28',	'',	'',	'2011-12-21 20:00:45',	'',	1,	'leer',	'',	''),
(37,	14,	'99',	'Bank anschreiben wg Kreditraten',	'erledigt',	'Horst',	'2011-02-24',	'2011-04-28',	'',	'wurde an Inkasso weitergeben und wird von der Schuldnerberatung geklÃ¤rt',	'2011-12-21 20:00:45',	'',	1,	'leer',	'',	''),
(38,	0,	'99',	'GEZ GebÃƒÂ¼hren RÃƒÂ¼ckforderung Horst',	'zurueckges',	'Horst',	'2011-02-24',	'',	'',	'',	'2011-12-21 20:00:45',	'',	1,	'leer',	'',	''),
(39,	14,	'99',	'Rheinenergie Strom ÃƒÂ¼berweisen (DA)',	'erledigt',	'Horst',	'2011-02-24',	'2011-02-28',	'',	'',	'2011-12-21 20:00:45',	'',	1,	'leer',	'',	''),
(40,	34,	'99',	'Rheinenergie 01/2011',	'erledigt',	'Horst',	'2011-02-28',	'2011-02-28',	'',	'',	'2011-12-21 20:00:45',	'',	1,	'leer',	'',	''),
(41,	34,	'99',	'Rheinenergie Dauerauftrag',	'erledigt',	'Horst',	'2011-02-28',	'2011-02-28',	'',	'',	'2011-12-21 20:00:45',	'',	1,	'leer',	'',	''),
(42,	34,	'99',	'Provinzialbrief Zahlungen ab 01/2011',	'erledigt',	'Horst',	'2011-02-28',	'2011-02-28',	'',	'',	'2011-12-21 20:00:45',	'',	1,	'leer',	'',	''),
(46,	44,	'99',	'Finanzunterlagen fÃƒÂ¼r Finanzberater',	'offen',	'Horst',	'2011-08-22',	'',	'',	'',	'2011-12-21 19:42:02',	'',	4,	'Finanzen',	'',	''),
(47,	44,	'99',	'Blueman installieren fÃƒÂ¼r Bluetooth Handy Internetverbindung',	'erledigt',	'Horst',	'2011-08-22',	'2011-10-11',	'',	'funktioniert mit kabel',	'2011-12-21 20:00:45',	'',	1,	'leer',	'',	''),
(78,	44,	'99',	'unison sync installieren',	'erledigt',	'Horst',	'2011-09-01',	'2011-09-13',	'',	'',	'2011-12-21 20:00:45',	'',	1,	'leer',	'',	''),
(89,	0,	'99',	'Google-Konto einrichten fÃƒÂ¼r Cyberduck-Zugriff',	'erledigt',	'Horst',	'2011-10-11',	'2011-10-17',	'',	'wurde angelegt mit horstmail-google@yahoo.de',	'2011-12-21 20:00:45',	'',	5,	'leer',	'',	''),
(51,	44,	'99',	'Blueman installieren fuer Bluetooth Handy Internetverbindung',	'erledigt',	'Horst',	'2011-08-17',	'2011-10-11',	'',	'verbindung zum Handy schlaegt fehl. Verbindung mit Kabel funktioniert.',	'2011-12-21 20:00:45',	'Laptop',	1,	'leer',	'',	''),
(52,	44,	'99',	'php5 installieren',	'erledigt',	'Horst',	'2011-08-17',	'2011-08-17',	'',	'',	'2011-12-21 20:00:45',	'Laptop',	1,	'leer',	'',	''),
(53,	44,	'99',	'xubuntu 10.10 upgrade klaeren',	'offen',	'Horst',	'2011-08-17',	'',	'',	'',	'2011-12-21 19:53:11',	'Laptop',	2,	'Ubuntu',	'',	''),
(54,	44,	'99',	'joomla 1.7 installieren auf Laptop',	'erledigt',	'Horst',	'2011-08-17',	'2011-10-11',	'',	'bisher nur joomla 1.6.5',	'2011-12-21 20:00:45',	'Laptop',	1,	'leer',	'',	''),
(55,	44,	'99',	'ant installieren fuer java-compilieren',	'offen',	'Horst',	'2011-08-17',	'',	'',	'',	'2012-02-24 17:40:44',	'Laptop',	1,	'PrgEntw',	'',	''),
(56,	44,	'99',	'lightwallet kompilieren',	'offen',	'Horst',	'2011-08-17',	'',	'',	'',	'2011-12-21 20:00:45',	'Laptop',	1,	'leer',	'',	''),
(57,	44,	'99',	'Versicherungen anschreiben wg Homepagerechtsschutz',	'offen',	'Horst',	'2011-08-17',	'',	'',	'vorbereitet',	'2011-12-21 20:00:45',	'Homepage',	4,	'leer',	'',	''),
(58,	44,	'99',	'Scheiben und Schrauben fuer Waschmaschinenschutz besorgen',	'erledigt',	'Horst',	'2011-08-17',	'2011-08-17',	'',	'',	'2011-12-21 20:00:45',	'Haushalt',	1,	'leer',	'',	''),
(59,	44,	'99',	'Sockelschutz fuer Waschmaschine anbringen',	'zurueckges',	'Horst',	'2011-08-17',	'',	'',	'bekomme keine Hilti (Haus der Maschinen? zu teuer)',	'2011-12-21 20:00:45',	'Haushalt',	1,	'leer',	'',	''),
(60,	44,	'99',	'libreoffice neuste Version mit Reportdesigner installieren',	'zurueckges',	'Horst',	'2011-08-17',	'',	'',	'laeuft nur im neusten Upgrade',	'2011-12-21 20:00:45',	'Laptop',	1,	'leer',	'',	''),
(61,	44,	'99',	'Sonnenblume fuer Hochzeitstag',	'erledigt',	'Horst',	'2011-08-17',	'2011-08-26',	'',	'leider keine bekommen',	'2011-12-21 20:00:45',	'Hochzeit',	1,	'leer',	'',	''),
(62,	44,	'99',	'kleines Hochzeitsgeschenk - Karte',	'erledigt',	'Horst',	'2011-08-17',	'2011-08-17',	'',	'',	'2011-12-21 20:00:45',	'Hochzeit',	1,	'leer',	'',	''),
(63,	44,	'99',	'openjdk6 installieren fuer java',	'erledigt',	'Horst',	'2011-08-17',	'2011-08-26',	'',	'',	'2011-12-21 20:00:45',	'Laptop',	1,	'leer',	'',	''),
(64,	44,	'99',	'Hilti ausleihen',	'zurueckges',	'Horst',	'2011-08-17',	'',	'',	'zu teuer',	'2011-12-21 20:00:45',	'Haushalt',	1,	'leer',	'',	''),
(65,	44,	'99',	'svn doku runterladen',	'erledigt',	'Horst',	'2011-08-17',	'2011-08-17',	'',	'',	'2011-12-21 20:00:45',	'Laptop',	1,	'leer',	'',	''),
(66,	44,	'99',	'phpdbsync runterladen',	'erledigt',	'Horst',	'2011-08-17',	'2011-08-17',	'',	'',	'2011-12-21 20:00:45',	'Laptop',	1,	'leer',	'',	''),
(67,	44,	'99',	'svn installieren',	'erledigt',	'Horst',	'2011-08-17',	'2011-08-17',	'',	'',	'2011-12-21 20:00:45',	'Laptop',	1,	'leer',	'',	''),
(68,	44,	'99',	'svn fuer https konfigurieren',	'erledigt',	'Horst',	'2011-08-17',	'2011-08-17',	'',	'',	'2011-12-21 20:00:45',	'Laptop',	1,	'leer',	'',	''),
(69,	44,	'99',	'phpmyadmin installieren',	'erledigt',	'Horst',	'2011-08-17',	'2011-08-22',	'',	'',	'2011-12-21 20:00:45',	'Laptop',	1,	'leer',	'',	''),
(70,	44,	'99',	'mysql installieren',	'erledigt',	'Horst',	'2011-08-17',	'2011-08-22',	'',	'',	'2011-12-21 20:00:45',	'Laptop',	1,	'leer',	'',	''),
(71,	44,	'99',	'webportal erledigungsliste kopieren',	'erledigt',	'Horst',	'2011-08-22',	'2011-08-26',	'',	'',	'2011-12-21 20:00:45',	'Laptop',	1,	'leer',	'',	''),
(72,	44,	'99',	'jwebportal einrichten',	'erledigt',	'Horst',	'2011-08-22',	'2011-10-11',	'',	'',	'2011-12-21 20:00:45',	'Laptop',	1,	'leer',	'',	''),
(73,	44,	'99',	'jwebportal komponente entwickeln',	'offen',	'Horst',	'2011-08-22',	'',	'',	'',	'2011-12-21 19:54:18',	'Laptop',	1,	'Programm',	'',	''),
(74,	44,	'99',	'Termin klaeren siehe Email',	'zurueckges',	'Horst',	'2011-08-22',	'',	'',	'unklar was gemeint ist',	'2011-12-21 20:00:45',	'Ubuntu',	1,	'leer',	'',	''),
(75,	44,	'99',	'openbook joomla 1.5 downloaden',	'erledigt',	'Horst',	'2011-08-22',	'2011-08-26',	'',	'joomla 1.6 buch gibt es noch nicht',	'2011-12-21 20:00:45',	'joomla',	1,	'leer',	'',	''),
(76,	44,	'99',	'chmviewer installieren',	'erledigt',	'Horst',	'2011-08-26',	'2011-09-01',	'',	'',	'2011-12-21 20:00:45',	'Laptop',	1,	'leer',	'',	''),
(77,	44,	'99',	'Selfhtml openbook runterladen',	'erledigt',	'Horst',	'2011-09-01',	'2011-09-01',	'',	'',	'2011-12-21 20:00:45',	'',	1,	'leer',	'',	''),
(79,	44,	'99',	'tbluser anlegen uebernehmen',	'offen',	'Christiane',	'2011-09-02',	'',	'',	'',	'2011-12-21 20:00:45',	'',	1,	'leer',	'',	''),
(80,	44,	'99',	'tomcat 6 installieren',	'erledigt',	'Horst',	'2011-09-13',	'2011-10-11',	'',	'',	'2011-12-21 20:00:45',	'',	1,	'leer',	'',	''),
(81,	0,	'99',	'Netcologne Rechnung bezahlen',	'erledigt',	'Horst',	'2011-10-04',	'2011-10-18',	'',	'8 / 9 2011 ÃƒÂ¼berwiesen',	'2011-12-21 20:00:45',	'',	5,	'leer',	'',	''),
(82,	0,	'99',	'Schulden bezahlen',	'erledigt',	'Christiane',	'2011-10-04',	'2011-10-04',	'',	'per Telefonbanking',	'2011-12-21 20:00:45',	'',	5,	'leer',	'',	''),
(83,	0,	'99',	'Dauerauftrag Schulden',	'erledigt',	'Christiane',	'2011-10-06',	'2012-02-27',	'',	'',	'2012-02-27 22:29:52',	'',	5,	'Finanzen',	'',	''),
(85,	0,	'99',	'e-book Funktion einrichten',	'erledigt',	'Horst',	'2011-10-06',	'2011-12-21',	'',	'calibre installiert',	'2012-02-14 06:42:21',	'',	1,	'Computer',	'',	''),
(86,	0,	'99',	'Baum entsorgen',	'erledigt',	'Horst',	'2011-10-11',	'2011-12-22',	'',	'wurde zerlegt und in die Garage gestellt',	'2012-01-02 17:47:52',	'',	1,	'Haushalt',	'',	''),
(90,	0,	'99',	'Netcologne Zugang XUbuntu',	'erledigt',	'Horst',	'2011-10-11',	'2011-10-27',	'',	'mit pppoeconf eingerichtet und zweite Netzwerkkarte',	'2011-12-21 20:00:45',	'',	5,	'leer',	'',	''),
(91,	0,	'99',	'Backup auf Notebook test (Areca / BackInTime)',	'erledigt',	'Horst',	'2011-10-11',	'2011-10-28',	'',	'Areca ist die beste Wahl!',	'2011-12-21 20:00:45',	'',	5,	'leer',	'',	''),
(92,	0,	'99',	'Wine testen',	'erledigt',	'Horst',	'2011-10-11',	'2011-10-12',	'',	'ist eingerichtet und funktioniert.',	'2011-12-21 20:00:45',	'',	4,	'leer',	'',	''),
(95,	0,	'99',	'save.tv testen',	'erledigt',	'Horst',	'2011-10-11',	'2011-10-11',	'',	'Unklare Preispolitik!',	'2011-12-21 20:00:45',	'',	4,	'leer',	'',	''),
(96,	0,	'99',	'Scan Programm testen',	'offen',	'Horst',	'2011-10-11',	'',	'',	'',	'2012-02-14 06:42:58',	'',	3,	'Computer',	'',	''),
(97,	0,	'99',	'Lifecare Programm mit Java erstellen',	'offen',	'Horst',	'2011-10-12',	'',	'',	'',	'2013-08-22 20:59:27',	'',	3,	'PrgEntw',	'',	''),
(98,	0,	'99',	'Programmierung',	'zurueckges',	'Horst',	'2011-10-12',	'',	'',	'',	'2012-01-02 17:49:59',	'',	1,	'(ohne)',	'',	''),
(99,	98,	'99',	'Erledigungsliste drucken in Din A5 mit leeren Zeilen',	'offen',	'Horst',	'2011-10-12',	'',	'',	'',	'2011-12-21 20:00:45',	'',	3,	'leer',	'',	''),
(100,	98,	'99',	'com_webportal fÃƒÂ¼r joomla 1.7 programmieren',	'offen',	'Horst',	'2011-10-12',	'',	'',	'',	'2011-12-21 19:51:50',	'',	3,	'Programm',	'',	''),
(101,	98,	'99',	'Travelcheck programieren',	'offen',	'Horst',	'2011-10-12',	'',	'',	'',	'2011-12-21 19:52:08',	'',	3,	'Programm',	'',	''),
(103,	0,	'99',	'Chris wg Congstar klÃƒÂ¤ren',	'erledigt',	'Horst',	'2011-10-17',	'2011-10-18',	'',	'mit Chris besprochen, kÃƒÂ¼mmert sich drum.',	'2011-12-21 20:00:45',	'',	5,	'leer',	'',	''),
(104,	0,	'99',	'Headset fÃƒÂ¼r Chris',	'erledigt',	'Horst',	'2011-10-17',	'2011-10-17',	'',	'',	'2011-12-21 20:00:45',	'',	5,	'leer',	'',	''),
(105,	0,	'99',	'KlÃƒÂ¤rung in Erledigungsliste',	'erledigt',	'Horst',	'2011-10-17',	'2011-10-18',	'',	'wurde umgesetzt',	'2011-12-21 20:00:45',	'',	5,	'leer',	'',	''),
(106,	0,	'99',	'Thunderbird fÃƒÂ¼r Chris einrichten',	'erledigt',	'Horst',	'2011-10-18',	'2011-10-30',	'',	'erst Christiane fragen, hat kein intresse, schade!',	'2011-12-21 20:00:45',	'',	4,	'leer',	'',	''),
(107,	0,	'99',	'Kassenbon-Mappe zeigen',	'erledigt',	'Horst',	'2011-10-18',	'2011-10-30',	'',	'hab ich gezeigt',	'2011-12-21 20:00:45',	'',	1,	'leer',	'',	''),
(145,	0,	'99',	'Gutschein fÃƒÂ¼r Louis',	'erledigt',	'Christiane',	'2011-12-03',	'2012-03-13',	'',	'wird wohl erledigt sein.',	'2012-03-13 17:30:09',	'',	4,	'Geschenk',	'',	''),
(109,	0,	'99',	'Homepage horald.de auf Joomla 1.7 umstellen',	'in Arbeit',	'Horst',	'2011-10-18',	'',	'',	'angefangen',	'2012-02-14 06:49:06',	'',	2,	'Computer',	'',	''),
(138,	0,	'99',	'Fotos fÃƒÂ¼r Kalendar gemeinsam aussuchen',	'erledigt',	'Horst',	'2011-12-02',	'2011-12-05',	'',	'',	'2011-12-21 20:00:45',	'',	5,	'leer',	'',	''),
(111,	0,	'99',	'meine iTan beantragen (online) KSK-KÃƒÂ¶ln',	'erledigt',	'Horst',	'2011-10-20',	'2011-10-25',	'',	'habe mich fÃƒÂ¼r chiptan entschieden',	'2011-12-21 20:00:45',	'',	5,	'leer',	'',	''),
(112,	0,	'99',	'iTan von Chris',	'erledigt',	'Horst',	'2011-10-20',	'2011-11-01',	'',	'sind endlich angekommen',	'2011-12-21 20:00:45',	'',	1,	'leer',	'',	''),
(114,	0,	'99',	'NK-Abrechnung einscannen',	'zurueckges',	'Horst',	'2011-10-20',	'',	'',	'',	'2012-02-27 22:29:15',	'',	3,	'Finanzen',	'',	''),
(116,	0,	'99',	'aktuelle phpdbsync version runterladen',	'offen',	'Horst',	'2011-10-20',	'',	'',	'',	'2013-08-22 20:59:42',	'',	2,	'PrgEntw',	'',	''),
(118,	0,	'99',	'Proxy-Server einrichten',	'erledigt',	'Horst',	'2011-10-27',	'2011-10-27',	'',	'mit tinyproxy',	'2011-12-21 20:00:45',	'',	5,	'leer',	'',	''),
(119,	0,	'99',	'Haken an Jacke (rot) machen',	'erledigt',	'Horst',	'2011-10-28',	'2011-12-29',	'',	'mein Schatz genÃƒÂ¤ht',	'2011-12-29 16:19:10',	'',	4,	'Reparatur',	'',	''),
(120,	0,	'99',	'Adressbook Header schmaler machen fÃƒÂ¼r Webportal',	'offen',	'Horst',	'2011-10-28',	'',	'',	'',	'2012-02-24 17:42:10',	'',	3,	'PrgEntw',	'',	''),
(140,	0,	'99',	'Geschenk fÃƒÂ¼r Christiane bestellen',	'erledigt',	'Horst',	'2011-12-02',	'2011-12-06',	'',	'bestellt',	'2011-12-21 20:00:45',	'',	5,	'leer',	'',	''),
(122,	0,	'99',	'ÃƒÅ“berweisung Schulden 150,--',	'erledigt',	'Horst',	'2011-11-02',	'2011-11-04',	'',	'ÃƒÂ¼berwiesen.',	'2011-12-21 20:00:45',	'',	5,	'leer',	'',	''),
(123,	0,	'99',	'Windows 2000 PC aufrÃƒÂ¼sten',	'offen',	'Horst',	'2011-11-02',	'',	'',	'aufrÃƒÂ¼stsatz bestellt.',	'2013-08-22 21:14:22',	'',	4,	'Computer',	'',	''),
(124,	0,	'99',	'Brett fÃƒÂ¼r KÃƒÂ¼chenschrank besorgen',	'erledigt',	'Horst',	'2011-11-02',	'2011-12-21',	'',	'wurde kleingesÃƒÂ¤gt',	'2011-12-21 19:43:13',	'',	4,	'(ohne)',	'',	''),
(125,	0,	'99',	'Wunschliste fÃƒÂ¼r meine Eltern erstellen',	'erledigt',	'Horst',	'2011-11-02',	'2011-12-12',	'',	'Mokkatasse und Massage',	'2011-12-21 20:00:45',	'',	5,	'leer',	'',	''),
(127,	0,	'99',	'Stuhl reparieren, Leiste besorgen',	'erledigt',	'Horst',	'2011-11-02',	'2011-12-21',	'',	'',	'2011-12-21 19:43:31',	'',	4,	'(ohne)',	'',	''),
(128,	0,	'99',	'1500 auf mein konto',	'erledigt',	'Horst',	'2011-11-02',	'2011-12-22',	'',	'wurde von Christianes Konto ÃƒÂ¼berwiesen',	'2011-12-21 23:01:37',	'',	4,	'Finanzen',	'',	''),
(129,	0,	'99',	'google docs fÃƒÂ¼r ubuntu einrichten',	'offen',	'Horst',	'2011-11-02',	'',	'',	'',	'2013-08-22 21:14:30',	'',	3,	'Computer',	'',	''),
(130,	0,	'99',	'Funkarmbanduhr Fehler klÃƒÂ¤ren',	'erledigt',	'Horst',	'2011-11-02',	'2011-12-05',	'',	'Garantietausch',	'2011-12-21 20:00:45',	'',	4,	'leer',	'',	''),
(131,	0,	'99',	'Handy Fehler Lautsprecher klÃƒÂ¤ren',	'zurueckges',	'Horst',	'2011-11-02',	'2011-12-05',	'',	'zu teuer',	'2011-12-21 20:00:45',	'',	4,	'leer',	'',	''),
(132,	0,	'99',	'Laptop Handy Verbindung pruefen',	'erledigt',	'Horst',	'2011-11-03',	'2011-11-28',	'',	'geht prinzipiell, hat aber verbindungsprobleme oder wackelkontakt',	'2011-12-21 20:00:45',	'',	5,	'leer',	'',	''),
(133,	0,	'99',	'ubuntu openbook installieren',	'offen',	'Horst',	'2011-11-03',	'',	'',	'',	'2013-08-22 21:14:15',	'',	2,	'Computer',	'',	''),
(134,	0,	'99',	'DVD lib installieren',	'erledigt',	'Horst',	'2011-11-04',	'2011-12-05',	'',	'',	'2011-12-21 20:00:45',	'',	4,	'leer',	'',	''),
(135,	0,	'99',	'Geld ÃƒÂ¼berweisen wegen Internetsperre Netcologne',	'erledigt',	'Horst',	'2011-12-02',	'2011-12-02',	'',	'wurde ÃƒÂ¼berwiesen',	'2011-12-21 20:00:45',	'',	5,	'leer',	'',	''),
(136,	0,	'99',	'Beschwerdebrief an Netcologne wegen Internetsperre',	'zurueckges',	'Horst',	'2011-12-02',	'',	'',	'keine zeit fÃƒÂ¼r',	'2012-01-02 17:45:03',	'',	3,	'Briefe',	'',	''),
(137,	0,	'99',	'Neuen Telefonanbieter suchen 1u1 o Alice',	'offen',	'Horst',	'2011-12-02',	'',	'',	'',	'2012-02-24 17:39:10',	'',	3,	'Haushalt',	'',	''),
(141,	0,	'99',	'Schwimmen gehen evtl mit Rahel u Lewin',	'erledigt',	'Frieda',	'2011-12-03',	'2012-02-12',	'',	'im Lentbad',	'2012-02-13 06:16:23',	'',	5,	'Freizeit',	'',	''),
(142,	0,	'99',	'Abfluss frei im oberen Bad',	'erledigt',	'Christiane',	'2011-12-03',	'2012-02-06',	'',	'',	'2012-02-06 17:35:19',	'',	1,	'Reparatur',	'',	''),
(144,	0,	'99',	'Neuen Stromanbieter suchen meine-wende.de',	'offen',	'Horst',	'2011-12-03',	'',	'',	'',	'2011-12-21 20:07:33',	'',	5,	'Haushalt',	'',	''),
(146,	0,	'99',	'Fotos in Fotokalendar einkleben',	'erledigt',	'Horst',	'2011-12-05',	'2011-12-20',	'',	'',	'2011-12-21 20:00:45',	'',	5,	'leer',	'',	''),
(147,	0,	'99',	'Briefe sortieren und durchschauen',	'spaeter',	'Horst',	'2011-12-07',	'',	'',	'',	'2012-01-12 20:50:20',	'',	5,	'Ordnung',	'',	''),
(148,	0,	'99',	'November-Rechnung Netcologne bezahlen',	'erledigt',	'Horst',	'2011-12-12',	'2011-12-21',	'',	'',	'2011-12-21 21:43:20',	'',	5,	'Finanzen',	'',	''),
(149,	0,	'99',	'Haare schneiden vor Weihnachten',	'erledigt',	'Horst',	'2011-12-20',	'2011-12-21',	'',	'',	'2011-12-21 20:00:45',	'',	5,	'leer',	'',	''),
(150,	0,	'99',	'Auto waschen und Tanken',	'erledigt',	'Horst',	'2011-12-20',	'2011-12-29',	'',	'von innen gereinigt',	'2011-12-29 15:26:14',	'',	5,	'Auto',	'',	''),
(151,	0,	'99',	'Drucker reparieren oder neu bestellen',	'erledigt',	'Horst',	'2011-12-20',	'2011-12-21',	'',	'neuen bestellt',	'2011-12-21 20:00:45',	'',	5,	'leer',	'',	''),
(152,	0,	'99',	'Arbeitszimmer aufrÃƒÂ¤umen',	'erledigt',	'Horst',	'2011-12-20',	'2011-12-22',	'',	'DauerbeschÃƒÂ¤ftigung, habe aber angefangen',	'2011-12-21 23:03:14',	'',	5,	'Ordnung',	'',	''),
(153,	0,	'99',	'ADAC Rechnung 2011',	'erledigt',	'Horst',	'2011-12-21',	'2011-12-29',	'',	'',	'2011-12-29 15:25:45',	'',	5,	'Finanzen',	'',	''),
(154,	0,	'99',	'Neues Autoradio einbauen lassen',	'erledigt',	'Horst',	'2011-12-21',	'2012-03-08',	'',	'teurer Einbau',	'2012-03-13 17:23:14',	'',	5,	'Auto',	'',	''),
(164,	123,	'99',	'PC AufrÃƒÂ¼stsatz einbauen',	'offen',	'Horst',	'2012-01-04',	'',	'',	'',	'2012-01-04 18:42:29',	'',	4,	'Computer',	'',	''),
(155,	0,	'99',	'Neuen Kindersitz besorgen',	'zurueckges',	'Horst',	'2011-12-21',	'',	'',	'wahrscheinlich noch zu frÃƒÂ¼h',	'2011-12-21 20:41:25',	'',	5,	'Auto',	'',	''),
(156,	0,	'99',	'Dauerauftrag Miete erhÃƒÂ¶hen',	'erledigt',	'Horst',	'2011-12-22',	'2011-12-29',	'',	'auf 950 erhÃƒÂ¶ht',	'2011-12-29 15:25:26',	'',	5,	'Finanzen',	'',	''),
(157,	0,	'99',	'Neue Reifen bestellen und montieren lassen',	'erledigt',	'Horst',	'2011-12-29',	'2012-01-28',	'',	'wurden bestellt, wurden montiert',	'2012-01-30 17:22:16',	'',	5,	'Auto',	'',	''),
(158,	0,	'99',	'Laserdrucker Samsung CLP-300 verschenken',	'offen',	'Horst',	'2011-12-29',	'',	'',	'',	'2011-12-29 16:27:31',	'',	4,	'Computer',	'',	''),
(159,	0,	'99',	'Datensicherung fÃƒÂ¼r Internet-PC einrichten',	'offen',	'Horst',	'2012-01-02',	'',	'',	'',	'2012-02-24 17:38:16',	'',	4,	'Computer',	'',	''),
(160,	123,	'99',	'PC AufrÃƒÂ¼stsatz bei Snogard abholen',	'erledigt',	'Horst',	'2012-01-02',	'2012-01-03',	'',	'',	'2012-01-04 18:40:11',	'',	5,	'Computer',	'',	''),
(161,	0,	'99',	'samba freigabe auf Internet-PC',	'offen',	'Horst',	'2012-01-02',	'',	'',	'',	'2013-08-22 21:14:05',	'',	2,	'Computer',	'',	''),
(162,	0,	'99',	'Libreoffice auf Laptop installieren',	'erledigt',	'Horst',	'2012-01-02',	'2012-01-30',	'',	'',	'2012-02-14 06:52:51',	'',	4,	'Computer',	'',	''),
(163,	0,	'99',	'Serienbriefdruck mit Libreoffice und Mysql einrichten',	'offen',	'Horst',	'2012-01-02',	'',	'',	'',	'2012-01-02 17:42:03',	'',	4,	'',	'',	''),
(165,	0,	'99',	'Joomla Tabellen-Komponente userabhÃƒÂ¤ngig',	'offen',	'Horst',	'2012-01-04',	'',	'',	'',	'2013-08-22 21:13:40',	'',	2,	'PrgEntw',	'',	''),
(166,	0,	'99',	'Netcologne 12/2011 Rechnung',	'erledigt',	'Horst',	'2012-01-12',	'2012-01-27',	'',	'',	'2012-01-30 17:20:25',	'',	5,	'Finanzen',	'',	''),
(167,	0,	'99',	'Cronjob ans laufen bringen',	'offen',	'Horst',	'2012-01-13',	'',	'',	'',	'2013-08-22 21:13:23',	'',	2,	'(ohne)',	'',	''),
(168,	0,	'99',	'Mieterverein 2011 Rechnung',	'erledigt',	'Horst',	'2012-01-19',	'2012-01-27',	'',	'',	'2012-01-30 17:20:07',	'',	5,	'Finanzen',	'',	''),
(169,	0,	'99',	'Austausch Joomla Komponente in Forum eintragen',	'offen',	'Horst',	'2012-01-19',	'',	'',	'',	'2013-08-22 21:13:15',	'',	2,	'PrgEntw',	'',	''),
(170,	0,	'99',	'Telekom Rechnung',	'erledigt',	'Christiane',	'2012-01-21',	'2012-02-27',	'',	'',	'2012-02-27 22:40:20',	'',	5,	'Finanzen',	'',	''),
(171,	0,	'99',	'Kindergarten Vereinsbeitrag 2011',	'erledigt',	'Horst',	'2012-01-21',	'2012-01-27',	'',	'',	'2012-01-30 17:19:47',	'',	5,	'Finanzen',	'',	''),
(172,	0,	'99',	'Zahnarzt Rechnung?',	'offen',	'Horst',	'2012-01-23',	'',	'',	'',	'2012-01-23 17:25:55',	'',	5,	'Finanzen',	'',	''),
(174,	0,	'99',	'Hibiscus installieren',	'erledigt',	'Horst',	'2012-01-26',	'2012-01-30',	'',	'reines Bankprogramm, nicht was ich suche...',	'2012-02-14 06:51:15',	'',	5,	'Computer',	'',	''),
(175,	0,	'99',	'Haftpflichtbeitrag, Zeitraum ?',	'erledigt',	'Horst',	'2012-01-30',	'2013-08-22',	'',	'',	'2013-08-22 21:13:01',	'',	2,	'Finanzen',	'',	''),
(176,	0,	'99',	'Auto wegen Auspuff reparieren',	'erledigt',	'Horst',	'2012-02-03',	'2012-03-07',	'',	'teure Reparatur',	'2012-03-13 17:22:49',	'',	5,	'Auto',	'',	''),
(177,	0,	'99',	'Mehrwertdienste sperren lassen',	'offen',	'Horst',	'2012-02-03',	'',	'',	'',	'2012-02-07 17:51:22',	'',	5,	'Haushalt',	'',	''),
(178,	0,	'99',	'WÃƒÂ¤sche waschen, saubere WÃƒÂ¤sche von schmutziger trenne, wie?',	'erledigt',	'Horst',	'2012-02-03',	'2012-02-05',	'',	'',	'2012-02-06 06:13:17',	'',	1,	'(ohne)',	'',	''),
(179,	0,	'99',	'Kleidung von Frieda aussortieren',	'offen',	'Horst',	'2012-02-04',	'',	'',	'',	'2012-02-06 06:12:54',	'',	3,	'(ohne)',	'',	''),
(180,	0,	'99',	'KÃƒÂ¼hlschrank abtauen',	'erledigt',	'Horst',	'2012-02-04',	'2012-02-05',	'',	'',	'2012-02-06 06:10:36',	'',	1,	'Haushalt',	'',	''),
(181,	0,	'99',	'Wann fahren wir zu Antonia / Fr - So oder Sa - Mo',	'erledigt',	'Horst',	'2012-02-04',	'2012-02-04',	'',	'Samstag bis Montag',	'2012-02-06 06:11:29',	'',	1,	'Besuche',	'',	''),
(182,	0,	'99',	'Oma Opa besuchen einmal im Monat abwechselnd',	'erledigt',	'Horst',	'2012-02-04',	'2012-02-05',	'',	'',	'2012-02-06 06:11:52',	'',	1,	'(ohne)',	'',	''),
(183,	0,	'99',	'Webcam installieren',	'offen',	'Horst',	'2012-02-07',	'',	'',	'',	'2012-02-07 17:49:43',	'',	4,	'Computer',	'',	''),
(184,	0,	'99',	'Mama Papa Betreuung klÃƒÂ¤ren',	'erledigt',	'Horst',	'2012-02-11',	'2012-03-13',	'',	'niemanden gefunden',	'2012-03-13 17:30:45',	'',	4,	'Familie',	'',	''),
(185,	0,	'99',	'LBS Frieda 50 Euro zurÃƒÂ¼ckfordern!',	'klaeren',	'Frieda',	'2012-02-11',	'',	'',	'',	'2013-08-22 20:59:57',	'',	5,	'Finanzen',	'',	''),
(186,	0,	'99',	'Frieda Probeschminken',	'erledigt',	'Christiane',	'2012-02-11',	'2012-02-11',	'',	'',	'2012-02-13 06:16:44',	'',	1,	'Familie',	'',	''),
(187,	0,	'99',	'Weihnachssachen abhÃƒÂ¤ngen',	'erledigt',	'Christiane',	'2012-02-11',	'2012-03-13',	'',	'',	'2012-03-13 17:27:44',	'',	4,	'Ordnung',	'',	''),
(188,	0,	'99',	'Kreuzkette fÃƒÂ¼r Antonia',	'erledigt',	'Christiane',	'2012-02-11',	'2012-03-02',	'',	'musste auf ohringe ausweichen',	'2012-03-02 17:29:04',	'',	5,	'Geschenk',	'',	''),
(189,	0,	'99',	'Wachsdecke Bund und durchsichtig',	'erledigt',	'Horst',	'2012-02-11',	'2012-02-11',	'',	'mit Frieda geholt',	'2012-02-13 06:18:21',	'',	1,	'Haushalt',	'',	''),
(190,	0,	'99',	'HDI Rechnung?',	'erledigt',	'Horst',	'2012-02-13',	'2012-02-27',	'',	'',	'2012-02-27 22:46:24',	'',	1,	'Finanzen',	'',	''),
(191,	0,	'99',	'Netcologne 01/2012 Rechnung',	'erledigt',	'Horst',	'2012-02-13',	'2012-02-27',	'',	'',	'2012-02-27 22:30:28',	'',	5,	'Finanzen',	'',	''),
(192,	0,	'99',	'Antonia Gastquatier per EMail klÃƒÂ¤ren',	'erledigt',	'Horst',	'2012-02-23',	'2012-03-08',	'',	'wurde telefonisch geklÃƒÂ¤rt',	'2012-03-13 17:24:08',	'',	5,	'Besuche',	'',	''),
(193,	0,	'99',	'Urlaub  einreichen fÃƒÂ¼r Sommerferien',	'offen',	'Horst',	'2012-02-24',	'',	'',	'',	'2012-02-24 17:28:13',	'',	4,	'Freizeit',	'',	''),
(194,	0,	'99',	'Urlaubsunterkunft fÃƒÂ¼r An- und Abreise klÃƒÂ¤ren',	'offen',	'Horst',	'2012-02-24',	'',	'',	'',	'2012-02-24 17:28:50',	'',	4,	'Freizeit',	'',	''),
(195,	0,	'99',	'Vermieter wg Rollo klÃƒÂ¤ren',	'erledigt',	'Christiane',	'2012-02-27',	'',	'',	'',	'2013-05-21 20:41:04',	'',	3,	'Reparatur',	'',	'Finanzen'),
(196,	154,	'99',	'Autoradio kaufen',	'erledigt',	'Horst',	'2012-03-02',	'2012-03-02',	'',	'Kennwood',	'2012-03-02 17:30:51',	'',	0,	'',	'',	''),
(197,	154,	'99',	'Autoradio einbauen',	'offen',	'Horst',	'2012-03-02',	'',	'',	'',	'2012-03-02 17:30:26',	'',	0,	'',	'',	''),
(198,	0,	'99',	'Scanner anschliessen',	'offen',	'Horst',	'2012-03-13',	'',	'',	'',	'2012-03-13 17:25:23',	'',	4,	'Computer',	'',	''),
(199,	0,	'99',	'Urlaub Versenden von GepÃƒÂ¤ck klÃƒÂ¤ren',	'offen',	'Horst',	'2012-03-13',	'',	'',	'',	'2012-03-13 17:29:20',	'',	3,	'Freizeit',	'',	''),
(200,	0,	'99',	'homepage horald.de joomla2.5 auf 2.5.3 updaten',	'erledigt',	'Horst',	'2012-03-16',	'2012-03-28',	'',	'',	'2012-03-29 16:50:34',	'',	4,	'Computer',	'',	''),
(203,	0,	'99',	'Netcologne 02/2012 Rechnung',	'erledigt',	'Horst',	'2012-03-23',	'2012-03-26',	'',	'',	'2012-03-27 05:00:27',	'',	5,	'Finanzen',	'',	''),
(213,	0,	'99',	'Libreoffice Umlaute bei Base klÃƒÂ¤ren',	'erledigt',	'Horst',	'2012-03-29',	'2012-04-16',	'',	'mit JDBC-Bridge werden die Umlaute korrekt dargestellt. (nur bei ODBC nicht)',	'2012-04-16 16:48:32',	'',	4,	'Computer',	'',	''),
(223,	0,	'99',	'bindfs testen',	'offen',	'Horst',	'2012-03-30',	'',	'',	'',	'2013-08-22 21:12:34',	'',	2,	'Computer',	'',	''),
(233,	0,	'99',	'Lohnsteuer 2011 klÃƒÂ¤ren',	'offen',	'Horst',	'2012-04-11',	'',	'',	'',	'2012-04-11 17:56:43',	'',	4,	'Finanzen',	'',	''),
(243,	0,	'99',	'GenoStrom Brief ÃƒÂ¶ffnen und antworten',	'erledigt',	'Horst',	'2012-04-12',	'2012-04-24',	'',	'AnmeldebestÃƒÂ¤tigung',	'2012-04-23 23:13:44',	'',	5,	'Finanzen',	'',	''),
(251,	0,	'99',	'AnhÃƒÂ¤nger montieren lassen',	'erledigt',	'Horst',	'2012-04-16',	'2013-03-05',	'',	'Auto verkauft',	'2013-03-05 17:32:28',	'',	4,	'Auto',	'',	''),
(253,	0,	'99',	'Netcologne 03/2012 Rechnung',	'erledigt',	'Horst',	'2012-04-17',	'2012-04-24',	'',	'',	'2012-04-23 23:13:22',	'',	5,	'Finanzen',	'',	''),
(263,	0,	'99',	'Wunschliste webportal programmieren',	'offen',	'Horst',	'2012-04-20',	'',	'',	'',	'2012-04-20 16:19:02',	'',	4,	'PrgEntw',	'',	''),
(273,	0,	'99',	'perl-aufruf mit apache klÃƒÂ¤ren',	'offen',	'Horst',	'2012-04-20',	'',	'',	'',	'2013-08-22 21:12:14',	'',	3,	'PrgEntw',	'',	''),
(283,	0,	'99',	'Projektverwaltung qdpm installieren',	'offen',	'Horst',	'2012-04-23',	'',	'',	'',	'2012-04-23 15:57:24',	'',	5,	'Computer',	'http://localhost/webportal/einkauf/index.php',	''),
(293,	0,	'99',	'Projekt BÃƒÂ¼rgerzentrum eintragen',	'offen',	'Horst',	'2012-04-23',	'',	'',	'',	'2012-04-23 15:50:03',	'',	5,	'(ohne)',	'',	''),
(303,	251,	'99',	'Anfrage auf Preis fÃƒÂ¼r Montage',	'erledigt',	'Horst',	'2012-04-23',	'2012-04-24',	'',	'per Mail erfolgt',	'2012-04-23 23:12:56',	'',	0,	'',	'',	''),
(313,	159,	'99',	'DVD+RW formatieren 10 StÃƒÂ¼ck',	'offen',	'Horst',	'2012-04-23',	'',	'',	'',	'2012-04-23 16:28:31',	'',	0,	'',	'',	''),
(323,	159,	'99',	'DVD+RW Cover drucken',	'offen',	'Horst',	'2012-04-23',	'',	'',	'',	'2012-04-23 16:28:57',	'',	0,	'',	'',	''),
(333,	159,	'99',	'Back-in-time testen (root)',	'offen',	'Horst',	'2012-04-23',	'',	'',	'',	'2012-04-23 16:29:23',	'',	0,	'',	'',	''),
(343,	251,	'99',	'AnhÃƒÂ¤ngerkupplung bestellen',	'offen',	'Horst',	'2012-04-24',	'',	'',	'',	'2012-04-23 23:12:32',	'',	0,	'',	'',	''),
(353,	0,	'99',	'Android Entwicklungsumgebung installieren',	'offen',	'Horst',	'2012-04-24',	'',	'',	'',	'2013-08-22 21:12:05',	'',	3,	'Computer',	'',	''),
(363,	0,	'99',	'Ehe',	'Problem',	'Horst',	'2012-05-02',	'',	'',	'',	'2012-05-02 16:18:36',	'',	5,	'Familie',	'http://localhost/webportal/Erledigung/update.php?idwert=373',	''),
(373,	0,	'99',	'Mut',	'Problem',	'Horst',	'2012-05-02',	'',	'',	'',	'2012-05-02 16:11:42',	'',	1,	'(ohne)',	'',	''),
(383,	0,	'99',	'Rechtsschutz',	'Problem',	'Horst',	'2012-05-02',	'',	'',	'',	'2012-05-02 16:12:35',	'',	1,	'(ohne)',	'',	''),
(393,	0,	'99',	'Finanzen',	'Problem',	'Horst',	'2012-05-02',	'',	'',	'',	'2012-05-02 16:26:17',	'',	1,	'(ohne)',	'http://localhost/webportal/Erledigung/showtab.php?setfilter=1&filter=offen&userfilter=Horst&priorfilter=0&grpfilter=Finanzen',	''),
(403,	0,	'99',	'Lifecare',	'Problem',	'Horst',	'2012-05-02',	'',	'',	'',	'2012-05-02 16:13:21',	'',	1,	'(ohne)',	'',	''),
(413,	0,	'99',	'Report designer finden fÃƒÂ¼r Libre office',	'Problem',	'Horst',	'2012-05-02',	'',	'',	'',	'2012-05-02 16:16:29',	'',	4,	'PrgEntw',	'',	''),
(1753,	0,	'',	'Briefe',	'zurueckges',	'Horst',	'2013-02-12',	'',	'',	'',	'2013-08-22 21:01:46',	'',	5,	'Ordnung',	'',	'Erledigung'),
(1763,	1753,	'',	'test',	'offen',	'Horst',	'2013-02-12',	'',	'',	'',	'2013-02-12 06:46:57',	'',	5,	'Ordnung',	'',	''),
(1773,	0,	'99',	'young-people-portraitphoto 16,50',	'erledigt',	'Horst',	'2013-02-12',	'',	'',	'groÃƒÅ¸es PortrÃƒÂ¤tfoto wurde nicht bezahlt.',	'2013-02-20 06:53:37',	'',	5,	'Finanzen',	'',	'Erledigung'),
(1783,	0,	'99',	'Beitrag Mieterverein',	'erledigt',	'Horst',	'2013-02-12',	'',	'',	'',	'2013-02-20 06:47:28',	'',	5,	'Finanzen',	'',	'Erledigung'),
(1793,	0,	'',	'Netcologne 01/2013 Rechnung',	'erledigt',	'Horst',	'2013-01-05',	'',	'',	'Ratenzahlung von 350 Euro vereinbart.',	'2013-02-20 06:55:33',	'',	5,	'Finanzen',	'',	'Erledigung'),
(1843,	0,	'99',	'Quasselstrippe MÃƒÂ¤rz-Ausgabe fertigmachen',	'erledigt',	'Horst',	'2013-03-05',	'2013-06-12',	'',	'',	'2013-06-12 06:02:56',	'',	5,	'(ohne)',	'',	'Erledigung'),
(1853,	1843,	'99',	'Quasselstrippe ausdrucken',	'offen',	'Horst',	'2013-03-05',	'',	'',	'',	'2013-03-05 16:47:09',	'',	0,	'',	'',	''),
(1863,	1843,	'99',	'Quasselstrippe an Frau Grothaus ÃƒÂ¼bergeben',	'offen',	'Horst',	'2013-03-05',	'',	'',	'',	'2013-03-05 16:47:34',	'',	0,	'',	'',	''),
(1873,	1843,	'99',	'Quasselstrippe per Mail an Frau Grothaus',	'offen',	'Horst',	'2013-03-05',	'',	'',	'',	'2013-03-05 16:48:01',	'',	0,	'',	'',	''),
(1883,	0,	'',	'Handschuhe wegen Umtausch zurÃƒÂ¼ckschicken',	'erledigt',	'Horst',	'2013-03-05',	'2013-04-25',	'',	'',	'2013-04-25 05:28:04',	'',	4,	'privat',	'',	'Erledigung'),
(1893,	0,	'',	'Netcologne 02/2013 Rechnung',	'erledigt',	'Horst',	'2013-02-05',	'2013-04-25',	'',	'',	'2013-04-25 05:02:14',	'',	5,	'Finanzen',	'',	'Erledigung'),
(1923,	0,	'',	'Brief an Verbraucherzentrale',	'erledigt',	'Horst',	'2013-04-26',	'2013-04-30',	'',	'heute termin vor ort',	'2013-04-30 14:03:30',	'',	5,	'Finanzen',	'',	'Erledigung'),
(1993,	0,	'06',	'Netcologne 04/2013 Rechnung',	'in Arbeit',	'Horst',	'2013-04-05',	'',	'',	'in KlÃƒÂ¤rung',	'2013-07-18 08:15:41',	'',	5,	'Finanzen',	'',	'Erledigung'),
(2003,	0,	'04',	'SteuererklÃƒÂ¤rung abgeben, warte auf Christianes SteuererklÃƒÂ¤rung',	'erledigt',	'Horst',	'2013-05-08',	'2013-07-11',	'',	'',	'2013-07-11 09:42:08',	'',	5,	'Finanzen',	'',	'Erledigung'),
(2013,	0,	'',	'Beschwerde bei Bundesnetzagentur',	'in Arbeit',	'Horst',	'2013-05-13',	'',	'',	'',	'2013-06-12 06:00:01',	'',	5,	'Finanzen',	'',	'Erledigung'),
(2023,	0,	'',	'Webportal Werbetext schreiben',	'offen',	'Christiane',	'2013-05-21',	'',	'',	'',	'2013-05-21 20:03:30',	'',	0,	'(ohne)',	'',	'(ohne)'),
(2033,	0,	'',	'Videos brennen',	'zurueckges',	'Horst',	'2013-05-23',	'',	'',	'ÃƒÂ¼bertragung von der Kamera funktioniert nicht',	'2013-08-22 21:08:46',	'',	4,	'Computer',	'',	'Erledigung'),
(2044,	0,	'',	'bÃƒÂ¼geln',	'offen',	'Christiane',	'2013-08-21',	'',	'',	'',	'2013-08-22 20:47:59',	'',	0,	'Haushalt',	'',	'Erledigung'),
(2054,	0,	'',	'Dienstplan fÃƒÂ¼r Oktober machen',	'offen',	'Christiane',	'2013-08-21',	'',	'',	'',	'2013-08-22 20:48:09',	'',	0,	'Finanzen',	'',	'Erledigung'),
(2043,	0,	'05',	'Netcologne Ratenzahlung Dauerauftrag einrichten',	'erledigt',	'Horst',	'2013-06-12',	'2013-07-13',	'',	'',	'2013-07-13 19:58:32',	'',	5,	'Finanzen',	'',	'Erledigung'),
(2053,	0,	'',	'Geschenk fÃƒÂ¼r Mama',	'erledigt',	'Horst',	'2013-06-12',	'2013-06-10',	'',	'',	'2013-07-01 18:29:17',	'',	5,	'Geschenk',	'',	'Erledigung'),
(2063,	0,	'',	'Petition wg Telefonsperre bewerben',	'in Arbeit',	'Horst',	'2013-07-01',	'',	'',	'',	'2013-07-05 20:45:05',	'',	5,	'(ohne)',	'',	'Erledigung'),
(2073,	0,	'',	'joorgportal einrichten und umbenennen',	'erledigt',	'Horst',	'2013-07-01',	'2013-07-31',	'',	'',	'2013-07-31 21:41:08',	'',	4,	'Computer',	'',	'Erledigung'),
(2083,	0,	'03',	'Beitrag fÃƒÂ¼r Lohnsteuerverein klÃƒÂ¤ren',	'erledigt',	'Horst',	'2013-07-01',	'2013-07-11',	'',	'159,-- Euro ÃƒÂ¼berwiesen',	'2013-07-11 09:42:43',	'',	5,	'Finanzen',	'',	'Erledigung'),
(2093,	0,	'09',	'KFZ-Steuer klÃƒÂ¤ren',	'in Arbeit',	'Horst',	'2013-07-01',	'',	'',	'',	'2013-07-18 17:13:48',	'',	5,	'Finanzen',	'',	'Erledigung'),
(2103,	0,	'',	'Warten auf Netzwerk 60 sec beheben',	'erledigt',	'Horst',	'2013-07-05',	'2013-07-09',	'',	'falsch konfiguriert',	'2013-07-09 17:51:16',	'',	1,	'Xubuntu-12.04',	'',	'Themen'),
(2113,	0,	'',	'update-manager lÃƒÂ¤uft nicht',	'erledigt',	'Horst',	'2013-07-05',	'2013-07-12',	'',	'',	'2013-07-12 08:19:46',	'',	1,	'Xubuntu-12.04',	'',	'Themen'),
(2123,	0,	'',	'Touchpad stÃƒÂ¼rzt ab',	'offen',	'Horst',	'2013-07-05',	'',	'',	'',	'2013-07-12 20:15:53',	'',	1,	'Xubuntu-12.04',	'',	'Themen'),
(2133,	0,	'',	'PDF-Plugin in Firefox installieren',	'offen',	'Horst',	'2013-07-05',	'',	'',	'',	'2013-07-05 16:31:02',	'',	1,	'Bugs',	'',	'Themen'),
(2143,	0,	'07',	'Netcologne 05/2013 Rechnung',	'in Arbeit',	'Horst',	'2013-05-05',	'',	'',	'',	'2013-07-18 08:15:49',	'',	5,	'Finanzen',	'',	'Erledigung'),
(2153,	0,	'08',	'Netcologne 06/2013 Rechnung',	'in Arbeit',	'Horst',	'2013-05-05',	'',	'',	'',	'2013-07-18 17:13:27',	'',	5,	'Finanzen',	'',	'Erledigung'),
(2163,	0,	'01',	'Versicherungsschein besorgen',	'erledigt',	'Horst',	'2013-07-10',	'2013-07-18',	'',	'',	'2013-07-18 08:16:21',	'',	5,	'Auto',	'',	'Erledigung'),
(2173,	0,	'02',	'Fahrzeug ummelden',	'in Arbeit',	'Horst',	'2013-07-10',	'',	'',	'',	'2013-07-18 17:13:38',	'',	5,	'Auto',	'',	'Erledigung'),
(2183,	0,	'',	'nm-applet wird beim start nicht angezeigt',	'offen',	'Horst',	'2013-07-12',	'',	'',	'',	'2013-07-12 08:19:28',	'',	1,	'Xubuntu-12.04',	'',	'Themen'),
(2193,	0,	'',	'onboard-tastatur ausblenden beim start',	'offen',	'Horst',	'2013-07-13',	'',	'',	'',	'2013-07-13 10:54:02',	'',	1,	'Xubuntu-12.04',	'',	'Themen'),
(2203,	0,	'',	'Defektes Smartphone einschicken',	'in Arbeit',	'Horst',	'2013-07-18',	'',	'',	'',	'2013-07-18 17:13:13',	'',	5,	'privat',	'',	'Erledigung'),
(2213,	0,	'',	'Krankenkasse wg Anreise Klinik klÃƒÂ¤ren',	'erledigt',	'Horst',	'2013-07-18',	'2013-07-31',	'',	'muÃƒÅ¸ ich selbst tragen',	'2013-07-31 21:40:02',	'',	5,	'privat',	'',	'Erledigung'),
(2223,	0,	'',	'Klinik wg OP-Termin nachfragen',	'erledigt',	'Horst',	'2013-07-18',	'2013-08-22',	'',	'',	'2013-08-22 21:08:35',	'',	5,	'privat',	'',	'Erledigung'),
(1423,	0,	'',	'Adventskalendar aus Spannplatten basteln',	'erledigt',	'Horst',	'2012-11-07',	'2015-11-29',	'',	'provisorisch fertig',	'2015-12-07 17:51:53',	'',	3,	'Familie',	'',	'Erledigung'),
(2233,	0,	'',	'Guthaben handy aufladen',	'erledigt',	'Horst',	'2013-09-09',	'2014-10-27',	'',	'',	'2014-10-27 22:04:41',	'',	4,	'(ohne)',	'',	'Erledigung'),
(2234,	0,	'',	'Alten Fernseher entsorgen',	'in Arbeit',	'Horst',	'2014-10-22',	'',	'',	'',	'2014-10-23 05:24:38',	'',	5,	'(ohne)',	'',	'Erledigung'),
(2235,	0,	'',	'Congstar online Zugang erfragen',	'erledigt',	'Horst',	'2014-10-22',	'2014-10-27',	'',	'',	'2014-10-27 22:54:59',	'',	5,	'(ohne)',	'',	'Erledigung'),
(2236,	0,	'',	'Automatisches Datenbank Backup',	'erledigt',	'Horst',	'2014-10-22',	'',	'',	'',	'2016-01-12 06:59:51',	'',	4,	'(ohne)',	'',	'Erledigung'),
(2237,	0,	'',	'Backup auf USB-Festplatte',	'offen',	'Horst',	'2014-10-22',	'',	'',	'',	'2016-01-12 07:00:55',	'',	1,	'(ohne)',	'',	'Erledigung'),
(2238,	0,	'',	'Haushaltshilfe suchen',	'zurueckges',	'Horst',	'2014-10-22',	'',	'',	'',	'2015-04-20 05:28:28',	'',	4,	'(ohne)',	'',	'Erledigung'),
(2239,	0,	'',	'Telefonrechnung bezahlen',	'erledigt',	'Horst',	'2014-10-22',	'2015-04-20',	'',	'',	'2015-04-20 05:26:20',	'',	5,	'(ohne)',	'',	'Erledigung'),
(2240,	0,	'',	'Kreditkonto aufladen',	'erledigt',	'Horst',	'2014-10-22',	'2014-10-23',	'',	'',	'2014-10-22 22:45:26',	'',	5,	'(ohne)',	'',	'Erledigung'),
(2241,	0,	'',	'Webcam Bestellung wiederholen',	'erledigt',	'Horst',	'2014-10-22',	'',	'',	'',	'2015-02-07 09:51:57',	'',	5,	'(ohne)',	'',	'Erledigung'),
(2242,	0,	'',	'Spardauerauftrag umbuchen',	'erledigt',	'Horst',	'2014-10-22',	'2014-10-27',	'',	'',	'2014-10-27 22:35:39',	'',	5,	'(ohne)',	'',	'Erledigung'),
(2243,	0,	'',	'Passbilder machen',	'erledigt',	'Horst',	'2014-10-22',	'',	'',	'',	'2015-02-07 09:50:29',	'',	5,	'(ohne)',	'',	'Erledigung'),
(2244,	0,	'',	'Perso verlÃƒÂ¤ngern',	'erledigt',	'Horst',	'2014-10-22',	'',	'',	'',	'2015-02-07 09:50:13',	'',	5,	'(ohne)',	'',	'Erledigung'),
(2245,	0,	'',	'Daten vom alten Laptop kopieren',	'offen',	'Horst',	'2014-10-22',	'',	'',	'',	'2016-01-12 07:00:09',	'',	1,	'(ohne)',	'',	'Erledigung'),
(2246,	0,	'',	'Homeplug Power Lan Adapter besorgen',	'erledigt',	'Horst',	'2014-10-23',	'2014-10-27',	'',	'',	'2014-10-27 22:03:46',	'',	5,	'(ohne)',	'',	'Erledigung'),
(2247,	0,	'',	'Kita Konto mitteilen',	'erledigt',	'Horst',	'2014-10-23',	'2014-10-27',	'',	'',	'2014-10-27 22:04:03',	'',	5,	'(ohne)',	'',	'Erledigung'),
(2248,	0,	'',	'Porto 60cent besorgen',	'erledigt',	'Horst',	'2014-10-23',	'2014-10-27',	'',	'',	'2014-10-27 07:10:07',	'',	5,	'(ohne)',	'',	'Erledigung'),
(2249,	0,	'',	'Brief Mittweida einwerfen mit Porto',	'erledigt',	'Horst',	'2014-10-23',	'2014-10-27',	'',	'',	'2014-10-27 07:10:22',	'',	5,	'(ohne)',	'',	'Erledigung'),
(2250,	0,	'',	'Telekom-Schreiben widersprechen',	'erledigt',	'Horst',	'2014-10-27',	'2014-10-27',	'',	'',	'2014-10-27 22:03:12',	'',	5,	'(ohne)',	'',	'Erledigung'),
(2251,	0,	'',	'Nebenkostenabrechnung antworten',	'erledigt',	'Horst',	'2014-10-27',	'',	'',	'',	'2015-02-07 09:51:24',	'',	5,	'(ohne)',	'',	'Erledigung'),
(2252,	0,	'',	'Toner blau u rot bestellen',	'erledigt',	'Horst',	'2014-10-28',	'',	'',	'',	'2015-12-07 17:54:06',	'',	4,	'(ohne)',	'',	'Erledigung'),
(2253,	0,	'',	'Wein als Geschenk besorgen',	'erledigt',	'Horst',	'2014-10-28',	'2014-10-31',	'',	'',	'2014-11-03 06:16:22',	'',	5,	'(ohne)',	'',	'Erledigung'),
(2254,	0,	'',	'Paket Webcam wegschicken',	'erledigt',	'Horst',	'2014-10-28',	'2014-10-30',	'',	'',	'2014-10-30 06:18:59',	'',	5,	'(ohne)',	'',	'Erledigung'),
(2255,	0,	'',	'Nachthosen besorgen',	'erledigt',	'Horst',	'2014-10-28',	'2014-10-30',	'',	'',	'2014-10-30 06:16:20',	'',	5,	'(ohne)',	'',	'Erledigung'),
(2256,	0,	'',	'Daten von Horst2000 Rechner sichern und kopieren',	'offen',	'Horst',	'2014-10-30',	'',	'',	'',	'2016-01-12 06:58:50',	'',	1,	'(ohne)',	'',	'Erledigung'),
(2257,	0,	'',	'alten Fernseher und AltgerÃƒÂ¤te am 6.11. rausstellen',	'erledigt',	'Horst',	'2014-11-03',	'',	'',	'',	'2015-02-07 09:50:45',	'',	5,	'(ohne)',	'',	'Erledigung'),
(2258,	0,	'',	'Konten Bank Horst abrufen',	'offen',	'Horst',	'2014-11-03',	'',	'',	'',	'2015-04-20 05:39:45',	'',	4,	'Finanzen',	'',	'Erledigung'),
(2259,	0,	'',	'Konten Bank Chris abrufen',	'offen',	'Horst',	'2014-11-03',	'',	'',	'',	'2015-04-20 05:40:01',	'',	4,	'Finanzen',	'',	'Erledigung'),
(2260,	0,	'',	'Forderungsmanagement',	'zurueckges',	'Horst',	'2015-02-07',	'',	'',	'',	'2015-04-20 05:24:48',	'',	5,	'(ohne)',	'',	'Erledigung'),
(2261,	0,	'',	'Neuen Rechtsschutz',	'in Arbeit',	'Horst',	'2015-02-07',	'',	'',	'',	'2015-04-20 05:25:13',	'',	5,	'(ohne)',	'',	'Erledigung'),
(2262,	0,	'',	'ADAC KÃ¼ndigung klÃ¤ren',	'erledigt',	'Horst',	'2015-02-07',	'',	'',	'',	'2015-12-07 17:52:22',	'',	3,	'Finanzen',	'',	'Erledigung'),
(2263,	0,	'',	'Krankenkassenbrief ÃƒÂ¶ffnen',	'offen',	'Christiane',	'2015-02-07',	'',	'',	'',	'2015-02-07 09:54:42',	'',	5,	'(ohne)',	'',	'Erledigung'),
(2264,	0,	'',	'CreditForm klÃ¤ren',	'erledigt',	'Horst',	'2015-02-07',	'2015-04-27',	'',	'',	'2015-04-27 15:30:37',	'',	5,	'Finanzen',	'',	'Erledigung'),
(2265,	0,	'',	'Neuen Lohnsteuerverein',	'in Arbeit',	'Horst',	'2015-02-07',	'',	'',	'',	'2015-04-20 05:38:23',	'',	5,	'Finanzen',	'',	'Erledigung'),
(2266,	0,	'',	'Lesebrief Ã¼ber die Ungerechtigkeiten',	'offen',	'Horst',	'2015-02-07',	'',	'',	'',	'2015-04-27 15:30:51',	'',	3,	'Finanzen',	'',	'Erledigung'),
(2267,	0,	'',	'Lohnsteuervereine Retour austragen',	'offen',	'Horst',	'2015-04-20',	'',	'',	'',	'2015-04-20 05:14:42',	'',	3,	'Finanzen',	'',	'Erledigung'),
(2268,	0,	'',	'Rechtsschutz Retour austragen',	'offen',	'Horst',	'2015-04-20',	'',	'',	'',	'2015-04-20 05:29:31',	'',	3,	'Finanzen',	'',	'Erledigung'),
(2269,	0,	'',	'Super Folkband',	'offen',	'Horst',	'2015-07-01',	'',	'',	'',	'2015-07-01 05:07:39',	'',	5,	'LebenstrÃ¤ume',	'',	'Themen'),
(2271,	0,	'',	'Bankbrief Ã¶ffnen',	'offen',	'Horst',	'2016-01-06',	'',	'',	'',	'2016-01-12 07:02:23',	'',	5,	'Briefe',	'',	'Erledigung'),
(2281,	0,	'',	'Austausch von Mainboard bei Snogard anfragen',	'in Arbeit',	'Horst',	'2016-01-06',	'',	'',	'',	'2016-01-12 07:05:50',	'',	5,	'Computer',	'',	'Erledigung'),
(2291,	0,	'',	'Lohi Mitteilung lesen',	'offen',	'Horst',	'2016-01-14',	'',	'',	'',	'2016-01-14 06:31:12',	'',	5,	'Finanzen',	'',	'Erledigung'),
(2301,	0,	'',	'Flinkster Tankquittungen einreichen',	'offen',	'Horst',	'2016-01-04',	'',	'',	'',	'2016-01-14 06:32:42',	'',	5,	'Finanzen',	'',	'Erledigung'),
(2311,	0,	'',	'Thunderbird einrichten',	'offen',	'Horst',	'0000-00-00',	'',	'',	'',	'2016-01-20 06:45:22',	'',	5,	'Ubuntu einrichten',	'',	'Computerarbeiten'),
(2321,	0,	'',	'Privoxy einrichten',	'offen',	'Horst',	'0000-00-00',	'',	'',	'',	'2016-01-20 06:45:35',	'',	5,	'Ubuntu einrichten',	'',	'Computerarbeiten'),
(2331,	0,	'',	'Squid berechtigungen einrichten',	'offen',	'Horst',	'0000-00-00',	'',	'',	'',	'2016-01-20 06:45:53',	'',	5,	'Ubuntu einrichten',	'',	'Computerarbeiten'),
(2341,	0,	'',	'Drucker einrichten',	'offen',	'Horst',	'0000-00-00',	'',	'',	'',	'2016-01-20 06:46:07',	'',	5,	'Ubuntu einrichten',	'',	'Computerarbeiten'),
(2351,	0,	'',	'Prepaid aufladen',	'offen',	'Horst',	'2016-01-20',	'',	'',	'',	'2016-01-20 06:48:15',	'',	5,	'Finanzen',	'',	'Erledigung'),
(2361,	0,	'',	'Netcologne 12/2015 bezahlen',	'offen',	'Horst',	'2016-01-20',	'',	'',	'',	'2016-01-20 06:48:28',	'',	5,	'Finanzen',	'',	'Erledigung'),
(2371,	0,	'',	'Firefox Favoriten',	'offen',	'Horst',	'2016-01-21',	'',	'',	'',	'2016-01-21 05:57:46',	'',	5,	'Ubuntu einrichten',	'',	'Computerarbeiten'),
(2381,	0,	'',	'Apache einrichten',	'offen',	'Horst',	'0000-00-00',	'',	'',	'',	'2016-01-21 05:59:00',	'',	5,	'Ubuntu einrichten',	'',	'Computerarbeiten'),
(2391,	0,	'',	'Joorgportal',	'offen',	'Horst',	'0000-00-00',	'',	'',	'',	'2016-01-21 05:59:27',	'',	5,	'Ubuntu einrichten',	'',	'Computerarbeiten');

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


CREATE TABLE `tblessensplan` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `flddatum` date NOT NULL,
  `fldbez` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `fldid_rezepte` bigint(20) NOT NULL,
  `fldzeit` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `tblessensplan` (`fldindex`, `flddatum`, `fldbez`, `fldid_rezepte`, `fldzeit`) VALUES
(1,	'2011-09-05',	'Spaghetti',	0,	''),
(2,	'2011-09-06',	'Pizza',	0,	''),
(3,	'2011-09-07',	'KnÃƒÂ¶del',	0,	''),
(4,	'2011-09-10',	'Nudeln',	0,	''),
(5,	'2011-09-17',	'Nudeln',	0,	''),
(6,	'2011-09-12',	'Spaghetti',	0,	''),
(7,	'2011-09-13',	'Pizza',	0,	''),
(9,	'2011-09-18',	'sÃƒÂ¼ÃƒÅ¸e speise',	0,	''),
(14,	'2012-04-04',	'Gnocchi mit Gorgonzolasauce',	0,	''),
(24,	'2012-04-05',	'gebackener Camembert mit Preiselbeeren und Reis',	0,	''),
(34,	'2012-04-06',	'Spinat mit Kartoffeln und RÃƒÂ¼hrei',	0,	''),
(44,	'2012-04-07',	'Nudeln mit TomatensoÃƒÅ¸e',	0,	''),
(54,	'2012-04-08',	'Osterbrunch in Kamen',	0,	''),
(64,	'2012-04-09',	'Linsenbraten mit Rotkohl und KlÃƒÂ¶ÃƒÅ¸en Nachtisch Eis',	0,	''),
(74,	'2012-04-10',	'vegetarische WÃƒÂ¼rstchen mit Pommes und GemÃƒÂ¼se',	0,	''),
(84,	'2012-04-11',	'GemÃƒÂ¼seauflauf',	0,	''),
(94,	'2012-04-12',	'Gnocchi a la Spinaci',	0,	''),
(104,	'2012-04-13',	'Reibekuchen mit Apfelmus',	0,	''),
(114,	'2012-04-14',	'Tortellini mit KÃƒÂ¤sesauce',	0,	''),
(93,	'2012-10-01',	'Lasagne (Teil2)',	0,	''),
(103,	'2012-10-02',	'Toast Hawaii (vegetarisch mit Tofuaufschnitt)',	0,	''),
(113,	'2012-10-03',	'Reibekuchen',	0,	''),
(133,	'2012-10-04',	'Rosenkohl Auflauf',	0,	''),
(143,	'2012-10-05',	'Veggi-Burger mit Fritten',	0,	''),
(123,	'2012-10-06',	'Nudeln',	0,	''),
(144,	'2013-07-29',	'',	0,	''),
(154,	'2013-07-29',	'Calyone',	0,	''),
(164,	'2014-07-28',	'Calzone',	0,	''),
(174,	'2014-08-01',	'veggischnitzel mit fritten',	0,	''),
(184,	'2014-07-30',	'spaetzle mit pilzen',	0,	''),
(194,	'2014-07-27',	'Falafeln',	0,	''),
(204,	'2014-08-30',	'Nudeln',	0,	''),
(214,	'2014-07-31',	'Chili con Carne SuperNova',	0,	''),
(224,	'2014-07-29',	'Apfelpfannekuchen',	0,	''),
(225,	'2015-08-24',	'Nudelauflauf',	0,	''),
(226,	'2015-08-25',	'Couscous mit GemÃ¼se',	0,	''),
(227,	'2015-08-26',	'Spinat mit Tofu Nuggets und Kartoffeln',	0,	''),
(228,	'2015-08-27',	'Pizza',	0,	''),
(229,	'2015-08-28',	'Ofenkartoffeln mit WÃ¼rstchen und GemÃ¼se',	0,	''),
(230,	'2015-08-29',	'Nudeln a la Papa',	0,	'');

CREATE TABLE `tbletagen` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldbez` varchar(250) COLLATE utf8_bin NOT NULL,
  `fldbildid` bigint(20) NOT NULL,
  `fldwidth` int(11) NOT NULL,
  `fldheight` int(11) NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

INSERT INTO `tbletagen` (`fldindex`, `fldbez`, `fldbildid`, `fldwidth`, `fldheight`) VALUES
(3,	'Untergeschoss',	0,	0,	0),
(13,	'Erdgeschoss',	0,	0,	0),
(23,	'1. Stock',	203,	360,	440),
(33,	'2. Stock',	0,	0,	0),
(43,	'Dachgeschoss',	0,	0,	0);

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
  PRIMARY KEY (`fldIndex`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

INSERT INTO `tblfahrtenbuch` (`fldIndex`, `fldFahrzeug`, `fldVondatum`, `fldBisdatum`, `fldVonkm`, `fldBiskm`, `fldDauer`, `fldZeittarif`, `fldStatus`, `fldind_datum`, `fldid_adr`, `fldKmpreis`, `fldtimestamp`, `flddbsyncnr`) VALUES
(13,	'Citroen',	'2013-01-19',	'0000-00-00',	0,	86,	'4',	'1.5',	'OK',	43,	493,	'',	'0000-00-00 00:00:00',	1),
(103,	'MonatsgebÃƒÂ¼hr 02',	'2013-01-19',	'0000-00-00',	0,	0,	'10',	'1',	'OK',	43,	493,	'',	'0000-00-00 00:00:00',	1),
(23,	'Alfa Romeo',	'2013-01-21',	'0000-00-00',	0,	42,	'2.5',	'1.5',	'OK',	53,	493,	'',	'0000-00-00 00:00:00',	1),
(33,	'Alfa Romeo',	'2013-01-26',	'0000-00-00',	0,	32,	'6.5',	'1.5',	'OK',	53,	493,	'',	'0000-00-00 00:00:00',	1),
(43,	'Citroen',	'2013-01-28',	'0000-00-00',	0,	59,	'3.5',	'1.5',	'OK',	53,	493,	'',	'0000-00-00 00:00:00',	1),
(53,	'Alfa Romeo',	'2013-02-02',	'0000-00-00',	67216,	67251,	'4',	'1.5',	'OK',	53,	493,	'',	'0000-00-00 00:00:00',	1),
(63,	'Citroen',	'2013-02-04',	'0000-00-00',	15333,	15392,	'3.5',	'1.5',	'OK',	53,	493,	'',	'0000-00-00 00:00:00',	1),
(73,	'Citroen (Storno)',	'2013-02-13',	'0000-00-00',	0,	0,	'2.63',	'1',	'OK',	53,	493,	'',	'0000-00-00 00:00:00',	1),
(83,	'Citroen',	'2013-02-16',	'0000-00-00',	187,	208,	'4.5',	'1.5',	'OK',	63,	493,	'',	'0000-00-00 00:00:00',	1),
(293,	'Storno RÃƒÂ¼ckgabe Ãƒâ€nderung',	'2013-02-16',	'0000-00-00',	0,	0,	'0.75',	'1',	'OK',	63,	493,	'',	'0000-00-00 00:00:00',	1),
(283,	'MonatsgebÃƒÂ¼hr 03',	'2013-02-18',	'0000-00-00',	0,	0,	'10',	'1',	'OK',	63,	493,	'',	'0000-00-00 00:00:00',	1),
(303,	'Storno RÃƒÂ¼ckgabe',	'2013-02-20',	'0000-00-00',	0,	0,	'-0.75',	'1',	'OK',	63,	493,	'',	'0000-00-00 00:00:00',	1),
(93,	'Citroen',	'2013-02-20',	'0000-00-00',	445,	510,	'7',	'1.5',	'OK',	63,	493,	'',	'0000-00-00 00:00:00',	1),
(113,	'Citroen',	'2013-02-23',	'0000-00-00',	567,	590,	'3.5',	'1.5',	'OK',	63,	493,	'',	'0000-00-00 00:00:00',	1),
(313,	'Citroen',	'2013-02-25',	'0000-00-00',	0,	57,	'3.5',	'1.5',	'OK',	63,	493,	'',	'0000-00-00 00:00:00',	1),
(123,	'Opel Corsa',	'2013-03-02',	'0000-00-00',	1172,	1209,	'4.5',	'2',	'OK',	63,	493,	'',	'0000-00-00 00:00:00',	1),
(323,	'Ãƒâ€nderung',	'2013-03-02',	'0000-00-00',	0,	0,	'1',	'1.5',	'OK',	63,	493,	'',	'0000-00-00 00:00:00',	1),
(143,	'Citroen',	'2013-03-04',	'0000-00-00',	17465,	17522,	'3.5',	'1.5',	'OK',	63,	493,	'',	'0000-00-00 00:00:00',	1),
(133,	'Fiesta',	'2013-03-16',	'0000-00-00',	38042,	38066,	'3',	'2',	'OK',	73,	493,	'',	'0000-00-00 00:00:00',	1),
(343,	'Citroen',	'2013-03-18',	'0000-00-00',	0,	66,	'3.5',	'1.5',	'OK',	73,	493,	'',	'0000-00-00 00:00:00',	1),
(333,	'MonatsgebÃƒÂ¼hr 04',	'2013-03-18',	'0000-00-00',	0,	0,	'10',	'1',	'OK',	73,	493,	'',	'0000-00-00 00:00:00',	1),
(363,	'Storno RÃƒÂ¼ckgabe',	'2013-03-23',	'0000-00-00',	0,	0,	'-10.5',	'1',	'OK',	73,	493,	'',	'0000-00-00 00:00:00',	1),
(353,	'Citroen',	'2013-03-23',	'0000-00-00',	0,	31,	'20',	'1.5',	'OK',	73,	493,	'',	'0000-00-00 00:00:00',	1),
(153,	'Citroen',	'2013-04-06',	'0000-00-00',	1899,	1977,	'12',	'1.5',	'OK',	73,	493,	'',	'0000-00-00 00:00:00',	1),
(373,	'Storno RÃƒÂ¼ckgabe',	'2013-04-06',	'0000-00-00',	0,	0,	'-3',	'1',	'OK',	73,	493,	'',	'0000-00-00 00:00:00',	1),
(383,	'MonatsgebÃƒÂ¼hr 05',	'2013-04-18',	'0000-00-00',	0,	0,	'10',	'1',	'OK',	83,	493,	'',	'0000-00-00 00:00:00',	1),
(393,	'Citroen',	'2013-04-20',	'0000-00-00',	0,	20,	'8',	'1.5',	'OK',	83,	493,	'',	'0000-00-00 00:00:00',	1),
(453,	'Storno RÃƒÂ¼ckgabe',	'2013-04-25',	'0000-00-00',	0,	0,	'-0.37',	'1',	'OK',	83,	493,	'',	'0000-00-00 00:00:00',	1),
(403,	'Citroen',	'2013-04-25',	'0000-00-00',	0,	31,	'2',	'1.5',	'OK',	83,	493,	'',	'0000-00-00 00:00:00',	1),
(413,	'Citroen',	'2013-04-27',	'0000-00-00',	0,	28,	'9',	'1.5',	'OK',	83,	493,	'',	'0000-00-00 00:00:00',	1),
(423,	'Storno RÃƒÂ¼ckgabe',	'2013-04-27',	'0000-00-00',	0,	0,	'-1.12',	'1',	'OK',	83,	493,	'',	'0000-00-00 00:00:00',	1),
(433,	'Citroen',	'2013-04-29',	'0000-00-00',	0,	58,	'4.5',	'1.5',	'OK',	83,	493,	'',	'0000-00-00 00:00:00',	1),
(443,	'Storno RÃƒÂ¼ckgabe',	'2013-04-29',	'0000-00-00',	0,	0,	'-0.37',	'1',	'OK',	83,	493,	'',	'0000-00-00 00:00:00',	1),
(163,	'Citroen',	'2013-05-06',	'0000-00-00',	21441,	21500,	'3',	'1.5',	'OK',	83,	493,	'',	'0000-00-00 00:00:00',	1),
(173,	'Citroen',	'2013-05-11',	'0000-00-00',	21745,	21770,	'6',	'1.5',	'OK',	93,	493,	'',	'0000-00-00 00:00:00',	1),
(183,	'Citroen',	'2013-05-15',	'0000-00-00',	22049,	22106,	'3.5',	'1.5',	'OK',	93,	493,	'',	'0000-00-00 00:00:00',	1),
(193,	'Citroen',	'2013-05-17',	'0000-00-00',	3658,	3707,	'10',	'1.5',	'OK',	93,	493,	'',	'0000-00-00 00:00:00',	1),
(473,	'Storno RÃƒÂ¼ckgabe',	'2013-05-17',	'0000-00-00',	0,	0,	'-1.12',	'1',	'OK',	93,	493,	'',	'0000-00-00 00:00:00',	1),
(463,	'MonatsgebÃƒÂ¼hr 06',	'2013-05-18',	'0000-00-00',	0,	0,	'10',	'1',	'OK',	93,	493,	'',	'0000-00-00 00:00:00',	1),
(203,	'Citroen',	'2013-05-27',	'0000-00-00',	5253,	5321,	'7.5',	'1.5',	'OK',	93,	493,	'',	'0000-00-00 00:00:00',	1),
(223,	'Citroen',	'2013-06-16',	'0000-00-00',	8447,	8474,	'2',	'1.5',	'OK',	33,	493,	'',	'0000-00-00 00:00:00',	1),
(263,	'Storno RÃƒÂ¼ckgabe',	'2013-06-16',	'0000-00-00',	0,	0,	'-0.75',	'1',	'OK',	33,	493,	'',	'0000-00-00 00:00:00',	1),
(253,	'MonatsgebÃƒÂ¼hr 07',	'2013-06-19',	'0000-00-00',	0,	0,	'10',	'1',	'OK',	33,	493,	'',	'0000-00-00 00:00:00',	1),
(273,	'Storno RÃƒÂ¼ckgabe',	'2013-06-22',	'0000-00-00',	0,	0,	'-1.12',	'1',	'OK',	33,	493,	'',	'0000-00-00 00:00:00',	1),
(213,	'Citroen',	'2013-06-22',	'0000-00-00',	7105,	7127,	'6',	'1.5',	'OK',	33,	493,	'',	'0000-00-00 00:00:00',	1),
(243,	'Citroen',	'2013-07-06',	'0000-00-00',	39398,	39419,	'10',	'1.5',	'OK',	33,	493,	'',	'0000-00-00 00:00:00',	1),
(233,	'Citroen',	'2013-07-08',	'0000-00-00',	26012,	26038,	'2',	'1.5',	'OK',	113,	493,	'',	'0000-00-00 00:00:00',	1),
(503,	'Storno RÃƒÂ¼ckgabe',	'2013-07-08',	'0000-00-00',	0,	0,	'-0.37',	'1',	'OK',	113,	493,	'',	'0000-00-00 00:00:00',	1),
(523,	'MonatsgebÃƒÂ¼hr 09',	'2013-08-21',	'0000-00-00',	0,	0,	'10',	'1',	'OK',	113,	493,	'',	'0000-00-00 00:00:00',	1),
(513,	'MonatsgebÃƒÂ¼hr 08',	'2013-08-21',	'0000-00-00',	0,	0,	'10',	'1',	'OK',	113,	493,	'',	'0000-00-00 00:00:00',	1),
(533,	'Citroen',	'2013-09-20',	'0000-00-00',	30012,	30054,	'4',	'1.5',	'OK',	123,	493,	'',	'0000-00-00 00:00:00',	1),
(543,	'Ford',	'2013-11-12',	'0000-00-00',	59655,	59687,	'4',	'2',	'OK',	133,	493,	'',	'0000-00-00 00:00:00',	1),
(583,	'Storno RÃƒÂ¼ckgabe',	'2013-11-13',	'0000-00-00',	0,	0,	'-3.50',	'1',	'OK',	133,	493,	'',	'0000-00-00 00:00:00',	1),
(573,	'MonatsgebÃƒÂ¼hr 11',	'2013-11-13',	'0000-00-00',	0,	0,	'10',	'1',	'OK',	133,	493,	'',	'0000-00-00 00:00:00',	1),
(563,	'MonatsgebÃƒÂ¼hr 10',	'2013-11-13',	'0000-00-00',	0,	0,	'10',	'1',	'OK',	123,	493,	'',	'0000-00-00 00:00:00',	1),
(553,	'Ford',	'2013-11-13',	'0000-00-00',	59691,	59757,	'8',	'2',	'OK',	133,	493,	'',	'0000-00-00 00:00:00',	1),
(703,	'MonatsgebÃƒÂ¼hr 2013/12',	'2014-01-22',	'0000-00-00',	0,	0,	'10',	'1',	'offen',	143,	493,	'',	'0000-00-00 00:00:00',	1),
(713,	'MonatsgebÃƒÂ¼hr 2014/01',	'2014-01-22',	'0000-00-00',	0,	0,	'10',	'1',	'offen',	143,	493,	'',	'0000-00-00 00:00:00',	1),
(723,	'MonatsgebÃƒÂ¼hr 2014/02',	'2014-01-22',	'0000-00-00',	0,	0,	'10',	'1',	'offen',	143,	493,	'',	'0000-00-00 00:00:00',	1),
(753,	'MonatsgebÃƒÂ¼hr 2014/05',	'2014-04-23',	'0000-00-00',	0,	0,	'10',	'1',	'offen',	153,	493,	'',	'0000-00-00 00:00:00',	1),
(743,	'MonatsgebÃƒÂ¼hr 2014/04',	'2014-04-23',	'0000-00-00',	0,	0,	'10',	'1',	'offen',	153,	493,	'',	'0000-00-00 00:00:00',	1),
(733,	'MonatsgebÃƒÂ¼hr 2014/03',	'2014-04-23',	'0000-00-00',	0,	0,	'10',	'1',	'offen',	153,	493,	'',	'0000-00-00 00:00:00',	1),
(603,	'Citroen',	'2014-05-28',	'0000-00-00',	1535,	1591,	'3.5',	'1.5',	'offen',	163,	493,	'0.26',	'0000-00-00 00:00:00',	1),
(793,	'Storno RÃƒÂ¼ckgabe',	'2014-05-31',	'0000-00-00',	0,	0,	'-0.5',	'2',	'offen',	163,	493,	'',	'0000-00-00 00:00:00',	1),
(773,	'MonatsgebÃƒÂ¼hr 2014/06',	'2014-05-31',	'0000-00-00',	0,	0,	'10',	'1',	'offen',	163,	493,	'',	'0000-00-00 00:00:00',	1),
(613,	'Ford Fiesta',	'2014-05-31',	'0000-00-00',	160,	176,	'5',	'2',	'offen',	163,	493,	'0.26',	'0000-00-00 00:00:00',	1),
(633,	'Ford Fiesta',	'2014-06-07',	'0000-00-00',	176,	193,	'5',	'2',	'offen',	173,	493,	'',	'0000-00-00 00:00:00',	1),
(803,	'Storno RÃƒÂ¼ckgabe',	'2014-06-07',	'0000-00-00',	0,	0,	'-1',	'1',	'offen',	173,	493,	'',	'0000-00-00 00:00:00',	1),
(643,	'Ford Fiesta',	'2014-06-09',	'0000-00-00',	193,	241,	'4',	'2',	'offen',	173,	493,	'',	'0000-00-00 00:00:00',	1),
(763,	'Storno RÃƒÂ¼ckgabe',	'2014-06-09',	'0000-00-00',	0,	0,	'-4',	'1',	'offen',	173,	493,	'',	'0000-00-00 00:00:00',	1),
(623,	'Ford Fiesta',	'2014-06-10',	'0000-00-00',	241,	288,	'3.5',	'2',	'offen',	173,	493,	'',	'0000-00-00 00:00:00',	1),
(653,	'Ford Fiesta',	'2014-06-14',	'0000-00-00',	288,	466,	'11',	'2',	'offen',	173,	493,	'',	'0000-00-00 00:00:00',	1),
(663,	'Ford Fiesta',	'2014-06-18',	'0000-00-00',	466,	510,	'3.5',	'2',	'offen',	173,	493,	'',	'0000-00-00 00:00:00',	1),
(673,	'Ford Fiesta',	'2014-06-21',	'0000-00-00',	510,	576,	'11',	'2',	'offen',	173,	493,	'',	'0000-00-00 00:00:00',	1),
(683,	'Ford Fiesta',	'2014-06-25',	'0000-00-00',	576,	635,	'3.5',	'2',	'offen',	173,	493,	'',	'0000-00-00 00:00:00',	1),
(693,	'Toyota',	'2014-06-27',	'0000-00-00',	4211,	4369,	'29.5',	'1.5',	'offen',	173,	493,	'',	'0000-00-00 00:00:00',	1),
(783,	'MonatsgebÃƒÂ¼hr 2014/07',	'2014-06-30',	'0000-00-00',	0,	0,	'10',	'1',	'offen',	173,	493,	'',	'0000-00-00 00:00:00',	1),
(813,	'Ford Fiesta',	'2014-07-05',	'0000-00-00',	635,	698,	'10',	'2',	'offen',	174,	493,	'',	'0000-00-00 00:00:00',	1),
(823,	'Ford Fiesta',	'2014-07-08',	'0000-00-00',	698,	726,	'11',	'2',	'offen',	174,	493,	'',	'0000-00-00 00:00:00',	1),
(843,	'Ford Fiesta',	'2014-07-12',	'0000-00-00',	739,	786,	'11',	'2',	'offen',	174,	493,	'',	'0000-00-00 00:00:00',	1),
(833,	'Citroen',	'2014-07-16',	'0000-00-00',	28489,	28548,	'3',	'2',	'offen',	174,	493,	'',	'0000-00-00 00:00:00',	1),
(848,	'MonatsgebÃƒÂ¼hr 2014/08',	'2014-07-18',	'0000-00-00',	0,	0,	'10',	'1',	'offen',	174,	493,	'',	'0000-00-00 00:00:00',	1),
(844,	'Ford',	'2014-07-19',	'0000-00-00',	786,	885,	'10',	'2',	'offen',	174,	493,	'',	'0000-00-00 00:00:00',	1),
(845,	'Ford',	'2014-07-29',	'0000-00-00',	134,	161,	'6',	'2',	'offen',	0,	493,	'',	'0000-00-00 00:00:00',	1),
(846,	'Ford',	'2014-08-02',	'0000-00-00',	161,	215,	'7',	'2',	'offen',	0,	493,	'',	'0000-00-00 00:00:00',	1),
(847,	'Ford',	'2014-08-03',	'0000-00-00',	215,	259,	'5',	'2',	'offen',	0,	493,	'',	'0000-00-00 00:00:00',	1),
(849,	'MonatsgebÃƒÂ¼hr 2014/10',	'2014-10-18',	'0000-00-00',	0,	0,	'10',	'1',	'offen',	175,	0,	'',	'0000-00-00 00:00:00',	1),
(853,	'Ford ',	'2015-01-01',	'0000-00-00',	1788,	1834,	'1',	'2',	'OK',	0,	0,	'',	'0000-00-00 00:00:00',	1),
(854,	'Ford ',	'2015-01-07',	'0000-00-00',	1834,	1875,	'2.5',	'2',	'OK',	0,	0,	'',	'0000-00-00 00:00:00',	1),
(855,	'Ford ',	'2015-01-10',	'0000-00-00',	1875,	1923,	'10.5',	'2',	'OK',	0,	0,	'',	'0000-00-00 00:00:00',	1),
(856,	'Citroen ',	'2015-01-21',	'0000-00-00',	50786,	50841,	'4',	'1.5',	'OK',	0,	0,	'',	'0000-00-00 00:00:00',	1),
(857,	'Citroen ',	'2015-01-28',	'0000-00-00',	51201,	51259,	'5.5',	'1.5',	'OK',	0,	0,	'',	'0000-00-00 00:00:00',	1),
(858,	'Ford ',	'2015-01-31',	'0000-00-00',	2019,	2062,	'4.5',	'2',	'OK',	0,	0,	'',	'0000-00-00 00:00:00',	1),
(859,	'Citroen',	'2015-02-04',	'0000-00-00',	0,	0,	'4',	'1.5',	'OK',	0,	0,	'',	'0000-00-00 00:00:00',	1),
(860,	'Ford',	'2015-02-14',	'0000-00-00',	2196,	2214,	'4',	'2',	'OK',	0,	0,	'',	'0000-00-00 00:00:00',	1),
(861,	'Citroen ',	'2015-02-16',	'0000-00-00',	26751,	26793,	'5',	'1.5',	'OK',	0,	0,	'',	'0000-00-00 00:00:00',	1),
(862,	'Citroen ',	'2015-02-18',	'0000-00-00',	53309,	53363,	'4',	'1.5',	'OK',	0,	0,	'',	'0000-00-00 00:00:00',	1),
(863,	'opel',	'2015-02-20',	'0000-00-00',	27257,	27280,	'3',	'1.5',	'OK',	0,	0,	'',	'0000-00-00 00:00:00',	1),
(864,	'ford',	'2015-02-21',	'0000-00-00',	2246,	2308,	'10.5',	'2',	'OK',	0,	0,	'',	'0000-00-00 00:00:00',	1),
(865,	'Toyota ',	'2015-02-25',	'0000-00-00',	19169,	19225,	'4',	'1.754',	'OK',	0,	0,	'',	'0000-00-00 00:00:00',	1),
(866,	'Ford ',	'2015-04-25',	'0000-00-00',	2697,	2750,	'8.5',	'2.15',	'OK',	0,	0,	'',	'0000-00-00 00:00:00',	1),
(867,	'ford',	'2015-04-29',	'0000-00-00',	2750,	2792,	'2.5',	'2.25',	'OK',	0,	0,	'',	'0000-00-00 00:00:00',	1),
(868,	'ford',	'2015-05-02',	'0000-00-00',	2792,	2822,	'5',	'2.25',	'OK',	0,	0,	'',	'0000-00-00 00:00:00',	1),
(869,	'Citroen ',	'2015-05-06',	'0000-00-00',	63049,	63106,	'4',	'1.75',	'offen',	0,	0,	'',	'0000-00-00 00:00:00',	1),
(870,	'Ford ',	'2015-05-09',	'0000-00-00',	2822,	2877,	'8.5',	'2.25',	'offen',	0,	0,	'',	'0000-00-00 00:00:00',	1),
(871,	'Ford',	'2015-05-14',	'0000-00-00',	2877,	2923,	'4.5',	'2.25',	'offen',	0,	0,	'',	'0000-00-00 00:00:00',	1),
(872,	'Ford ',	'2015-05-16',	'0000-00-00',	2923,	2975,	'10.5',	'2.25',	'offen',	0,	0,	'',	'0000-00-00 00:00:00',	1),
(873,	'Ford ',	'2015-05-20',	'0000-00-00',	2975,	3103,	'15',	'2.25',	'offen',	0,	0,	'',	'0000-00-00 00:00:00',	1),
(874,	'ford',	'2015-05-23',	'0000-00-00',	3103,	3123,	'6',	'2.25',	'offen',	0,	0,	'',	'0000-00-00 00:00:00',	1),
(875,	'Citroen ',	'2015-05-27',	'0000-00-00',	65332,	65392,	'4',	'1.75',	'offen',	0,	0,	'',	'0000-00-00 00:00:00',	1),
(876,	'Citroen',	'2015-06-03',	'0000-00-00',	102433,	102475,	'5',	'1.75',	'offen',	0,	0,	'',	'0000-00-00 00:00:00',	1),
(877,	'Ford',	'2015-05-30',	'0000-00-00',	0,	0,	'',	'2.25',	'offen',	0,	0,	'',	'0000-00-00 00:00:00',	1),
(878,	'Ford',	'2015-06-06',	'0000-00-00',	3175,	3190,	'6',	'2.25',	'offen',	0,	0,	'',	'0000-00-00 00:00:00',	1);

CREATE TABLE `tblfilly` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldbez` varchar(250) NOT NULL,
  `fldid_art` bigint(20) NOT NULL,
  `fldanz` int(11) NOT NULL,
  `fldb01bild` bigint(20) NOT NULL,
  `fldb01filetype` varchar(50) NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `tblfilly` (`fldindex`, `fldbez`, `fldid_art`, `fldanz`, `fldb01bild`, `fldb01filetype`) VALUES
(1,	'Filly 1',	0,	0,	31,	'image/jpeg'),
(11,	'Zauberin Miracle',	0,	0,	41,	'image/jpeg'),
(21,	'Ziri',	1,	1,	51,	'image/jpeg');

CREATE TABLE `tblfillyart` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldbez` varchar(100) NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `tblfillyart` (`fldindex`, `fldbez`) VALUES
(1,	'Mermaid');

CREATE TABLE `tblfilter` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldfeld` varchar(80) COLLATE utf8_bin NOT NULL,
  `fldwert` varchar(80) COLLATE utf8_bin NOT NULL,
  `fldmaske` varchar(80) COLLATE utf8_bin NOT NULL,
  `fldName` varchar(80) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

INSERT INTO `tblfilter` (`fldindex`, `fldfeld`, `fldwert`, `fldmaske`, `fldName`) VALUES
(1,	'STATUS',	'offen',	'ERLEDIGUNG_SHOWTAB',	''),
(2,	'USER',	'Christiane',	'ERLEDIGUNG_SHOWTAB',	''),
(3,	'PRIOR',	'5',	'ERLEDIGUNG_SHOWTAB',	''),
(4,	'PRGLEICH',	'',	'ERLEDIGUNG_SHOWTAB',	''),
(5,	'GRP',	'(ohne)',	'ERLEDIGUNG_SHOWTAB',	''),
(74,	'fldid_group',	'',	'SHOWTAB',	'gruppe'),
(84,	'fldStatus',	'offen',	'SHOWTAB',	'status'),
(94,	'fldOrt',	'(ohne)',	'SHOWTAB',	'kaufort'),
(104,	'fldbeschenkter',	'',	'SHOWTAB',	'fuer'),
(114,	'fldstatus',	'',	'SHOWTAB',	'status'),
(124,	'fldPrior',	'(ohne)',	'SHOWTAB',	'prior'),
(134,	'fldBenutzer',	'(ohne)',	'SHOWTAB',	'benutzer'),
(144,	'fldGruppe',	'(ohne)',	'SHOWTAB',	'gruppe'),
(154,	'fldcategory',	'Computerarbeiten',	'SHOWTAB',	'kategorie'),
(164,	'fldid_gruppe',	'159',	'SHOWTAB',	'gruppe'),
(174,	'fldview',	'(ohne)',	'SHOWTAB',	'Anzeige'),
(184,	'fldid_oberkonto',	'(ohne)',	'SHOWTAB',	'oberkonten'),
(194,	'fldInhaber',	'horst_bargeld',	'SHOWTAB',	'bankkonto'),
(204,	'fldKonto',	'(ohne)',	'SHOWTAB',	'konto'),
(214,	'fldDatum',	'',	'SHOWTAB',	'zeitraumvon'),
(224,	'fldDatum',	'',	'SHOWTAB',	'zeitraumbis'),
(234,	'fldanlass',	'',	'SHOWTAB',	'anlass'),
(244,	'fldTyp',	'(ohne)',	'SHOWTAB',	'typ'),
(254,	'fldGruppe',	'(ohne)',	'SHOWTAB',	'GROUP'),
(264,	'fldBezeichnung',	'',	'SHOWTAB',	'suchen'),
(13501,	'',	'KIND',	'SHOPPING_DEFAULT',	'konto'),
(13511,	'',	'Kaufland',	'SHOPPING_DEFAULT',	'kaufort'),
(13521,	'',	'(ohne)',	'SHOPPING_DEFAULT',	'abteilung'),
(1594,	'fldtimestamp',	'',	'SHOWTAB',	'zeitpunkt'),
(1604,	'fldaktiv',	'(ohne)',	'SHOWTAB',	'setaktiv'),
(1614,	'fldsettrigger',	'(ohne)',	'SHOWTAB',	'settrigger'),
(1624,	'fldid_computer',	'44',	'SHOWTAB',	'txtcomputer'),
(1994,	'fldtblname',	'',	'SHOWTAB',	'dbtable'),
(2004,	'flddbsync',	'',	'SHOWTAB',	'dbtyp'),
(2344,	'fldvon',	'',	'SHOWTAB',	'von'),
(12471,	'',	'2016-01-04',	'ACCOUNT_DEFAULT',	'datum'),
(4304,	'flddatum',	'2015-01-01',	'SHOWTAB',	'zeitraumvon'),
(4314,	'flddatum',	'',	'SHOWTAB',	'zeitraumbis'),
(6664,	'fldid_grp',	'(ohne)',	'SHOWTAB',	'gruppe'),
(9824,	'flddatum',	'2014-07-26',	'SHOWTAB',	'zeitraum'),
(10314,	'fldid_user',	'3',	'SHOWTAB',	'fuer'),
(12491,	'',	'LEBEN_HORST',	'ACCOUNT_DEFAULT',	'konto'),
(12501,	'',	'horst_bargeld',	'ACCOUNT_DEFAULT',	'bankkonto'),
(11464,	'tblktosal.fldBez',	'',	'SHOWTAB',	'suchen'),
(11465,	'fldDatum',	'',	'SHOWTAB',	'abdatum'),
(14101,	'',	'Computerarbeiten',	'TASKS_DEFAULT',	'kategorie'),
(14111,	'',	'5',	'TASKS_DEFAULT',	'pr'),
(14121,	'',	'offen',	'TASKS_DEFAULT',	'status'),
(14131,	'',	'',	'TASKS_DEFAULT',	'erldatum'),
(14141,	'',	'Horst',	'TASKS_DEFAULT',	'eintrag'),
(14151,	'',	'',	'TASKS_DEFAULT',	'rang'),
(11648,	'fldkonto',	'(ohne)',	'SHOWTAB',	'oberkonto'),
(11649,	'fldsel',	'(ohne)',	'SHOWTAB',	'askjn'),
(11650,	'fldid_ort',	'(ohne)',	'SHOWTAB',	'fltort'),
(12193,	'',	'(ohne)',	'ACCOUNT_DEFAULT',	'umbuchihnaber'),
(11697,	'',	'Weihnachten',	'PRESENT_DEFAULT',	'anlass'),
(11698,	'',	'Horst',	'PRESENT_DEFAULT',	'fuer'),
(11699,	'',	'Horst',	'PRESENT_DEFAULT',	'von'),
(11700,	'fldBarcode',	'(ohne)',	'SHOWTAB',	'barcode'),
(11701,	'fldparent',	'(ohne)',	'SHOWTAB',	'parent'),
(11702,	'fldversion',	'(ohne)',	'SHOWTAB',	'version'),
(11703,	'fldMenu',	'Feng',	'SHOWTAB',	'suchen'),
(11704,	'fldid_geraet',	'',	'SHOWTAB',	'fltgeraet'),
(11705,	'fldid_ort',	'',	'SHOWTAB',	'wo'),
(11706,	'fldAbrjahr',	'',	'SHOWTAB',	'jahr'),
(11707,	'fldok',	'',	'SHOWTAB',	'ok'),
(12146,	'fldid_dauerauftragtyp',	'(ohne)',	'SHOWTAB',	'fltdauerauftragtyp'),
(11708,	'fldMenuID',	'(ohne)',	'SHOWTAB',	'parent'),
(11709,	'fldid_etagen',	'',	'SHOWTAB',	'stockwerke'),
(11710,	'fldprior',	'',	'SHOWTAB',	'prior'),
(11711,	'fldid_status',	'',	'SHOWTAB',	'status'),
(11712,	'fldid_benutzer',	'',	'SHOWTAB',	'fltuser'),
(11713,	'fldind_zimmer',	'47',	'SHOWTAB',	'zimmer'),
(12175,	'',	'47',	'MOEBEL_DEFAULT',	'zimmer'),
(11726,	'fldind_moebel',	'1857',	'SHOWTAB',	'moebel'),
(12176,	'',	'1857',	'FAECHER_DEFAULT',	'moebel'),
(12177,	'',	'47',	'FAECHER_DEFAULT',	'zimmer'),
(11734,	'fldid_adr',	'(ohne)',	'SHOWTAB',	'anbieter'),
(11735,	'fldVondatum',	'',	'SHOWTAB',	'zeitraumvon'),
(11736,	'fldVondatum',	'',	'SHOWTAB',	'zeitraumbis'),
(11737,	'fldind_datum',	'(ohne)',	'SHOWTAB',	'rechdat'),
(11738,	'fldFahrzeug',	'',	'SHOWTAB',	'suchen'),
(11795,	'fldv01status',	'(ohne)',	'SHOWTAB',	'status'),
(11796,	'fldv01ort',	'19',	'SHOWTAB',	'zimmer'),
(11797,	'fldv01wo',	'(ohne)',	'SHOWTAB',	'moebel'),
(11798,	'fldv01konto',	'(ohne)',	'SHOWTAB',	'konto'),
(11799,	'fldid_grundartikel',	'(ohne)',	'SHOWTAB',	'grundartikel'),
(11800,	'fldv01gekauftam',	'',	'SHOWTAB',	'fltdatum'),
(11801,	'fldv01bez',	'',	'SHOWTAB',	'suchen'),
(11802,	'fldbez',	'Joorg',	'SHOWTAB',	'suchen'),
(11803,	'fldb01bez',	'',	'SHOWTAB',	'suchen'),
(11814,	'fldid_ktogrp',	'(ohne)',	'SHOWTAB',	'fltktogrp'),
(11827,	'fldid_ktoinhgrp',	'4',	'SHOWTAB',	'fltktoinhgrp'),
(12102,	'fldid_zeitpunkt',	'',	'SHOWTAB',	'fltzeitpunkt'),
(12461,	'fldtimestamp',	'',	'SHOWTAB',	'bis'),
(12076,	'fldid_group',	'(ohne)',	'SHOWTAB',	'fltgruppe'),
(12521,	'fldid_art',	'1',	'SHOWTAB',	'fltart'),
(14091,	'',	'Ubuntu einrichten',	'TASKS_DEFAULT',	'GROUP'),
(12103,	'flddatum',	'',	'SHOWTAB',	'abdatum'),
(12145,	'fldid_ktogrp',	'4',	'SHOWTAB',	'gruppe'),
(12147,	'fldid_ktoeatyp',	'(ohne)',	'SHOWTAB',	'fltktoeatyp'),
(12148,	'fldaktiv',	'J',	'SHOWTAB',	'fldaktiv'),
(12182,	'',	'21',	'KTODAUERAUFTRAG_DEFAULT',	'konto'),
(12183,	'',	'23',	'KTODAUERAUFTRAG_DEFAULT',	'dauerauftragtyp'),
(12184,	'',	'4',	'KTODAUERAUFTRAG_DEFAULT',	'gruppe'),
(12185,	'',	'13',	'KTODAUERAUFTRAG_DEFAULT',	'ktoeatyp'),
(12171,	'fldid_benutzer',	'(ohne)',	'SHOWTAB',	'benutzer'),
(12157,	'fldid_terminegrp',	'3',	'SHOWTAB',	'gruppe'),
(12158,	'fldid_terminserie',	'(ohne)',	'SHOWTAB',	'serie'),
(12159,	'fldvondatum',	'2016-01-01',	'SHOWTAB',	'zeitraumvon'),
(12160,	'fldvondatum',	'',	'SHOWTAB',	'zeitraumbis'),
(12361,	'fldid_status',	'(ohne)',	'SHOWTAB',	'fltstatus'),
(12161,	'fldid_benutzer',	'',	'SHOWTAB',	'fltbenutzer'),
(12174,	'fldid_adr',	'1016',	'SHOWTAB',	'absender'),
(12162,	'fldid_aufgabe',	'(ohne)',	'SHOWTAB',	'fltaufgabe'),
(12481,	'',	'08:00',	'ACCOUNT_DEFAULT',	'uhrzeit'),
(12172,	'flddatum',	'',	'SHOWTAB',	'bisdatum'),
(12173,	'fldid_gepaeck',	'(ohne)',	'SHOWTAB',	'gepaeck'),
(12348,	'fldid_haeufigkeit',	'',	'SHOWTAB',	'flthaeufigkeit'),
(12372,	'',	'159',	'NOTICE_DEFAULT',	'gruppe'),
(12511,	'',	'33',	'TERMINE_DEFAULT',	'serie'),
(12373,	'',	'2',	'NOTICE_DEFAULT',	'status'),
(12374,	'fldid_user',	'50008',	'SHOWTAB',	'fltuser');

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

INSERT INTO `tblfunc` (`fldIndex`, `fldBez`, `fldphp`, `fldMenuID`, `fldTyp`, `fldTarget`, `fldParam`, `fldAktiv`, `fldName`, `fldtimestamp`, `fldversion`) VALUES
(3,	'Ins Archiv',	'insarchiv.php',	183,	'MENU',	'',	'',	'J',	'',	'0000-00-00 00:00:00',	'0312'),
(13,	'Aus Stammdaten',	'ausstammdaten.php',	183,	'MENU',	'',	'',	'J',	'',	'0000-00-00 00:00:00',	''),
(23,	'Monatsbericht',	'monatsbericht.php',	213,	'MENU',	'_blank',	'&drucken=J',	'J',	'',	'0000-00-00 00:00:00',	''),
(33,	'Aus Archiv',	'ausarchiv.php',	183,	'MENU',	'',	'',	'J',	'',	'0000-00-00 00:00:00',	''),
(43,	'Auswertung',	'KontenVorschau.php',	183,	'MENU',	'_blank',	'',	'J',	'',	'0000-00-00 00:00:00',	''),
(53,	'Adressliste',	'druckadressliste.php',	263,	'MENU',	'_blank',	'&wert=',	'J',	'',	'0000-00-00 00:00:00',	''),
(63,	'Gruppenliste',	'druckgruppenliste.php',	263,	'MENU',	'_blank',	'&wert=',	'J',	'',	'0000-00-00 00:00:00',	'0312'),
(73,	'sync',	'sync.php',	593,	'MENUALL',	'',	'',	'J',	'',	'0000-00-00 00:00:00',	''),
(83,	'resync all',	'resyncall.php',	593,	'MENUALL',	'',	'',	'J',	'',	'0000-00-00 00:00:00',	''),
(93,	'export',	'export.php',	593,	'MENUALL',	'',	'',	'J',	'',	'0000-00-00 00:00:00',	''),
(103,	'import',	'import.php',	593,	'MENUALL',	'',	'',	'J',	'',	'0000-00-00 00:00:00',	''),
(113,	'raten',	'raten.php',	213,	'MENU',	'',	'',	'N',	'',	'0000-00-00 00:00:00',	'0312'),
(133,	'Dauerauftrag',	'dauerauftrag.php',	233,	'MENU',	'',	'',	'J',	'',	'0000-00-00 00:00:00',	''),
(134,	'Trigger',	'trigger.php',	503,	'MENU',	'',	'&trigger=4',	'J',	'',	'2013-09-10 21:15:07',	''),
(144,	'del sel',	'delsel.php',	493,	'MENU',	'',	'',	'J',	'',	'2013-09-14 08:29:00',	''),
(154,	'Druck Geschenke',	'druckgeschenkliste.php',	203,	'MENU',	'_blank',	'&wert=',	'J',	'',	'2013-11-16 13:43:27',	''),
(164,	'Druck Aufgabenplan',	'druckaufgabenplan.php',	754,	'MENU',	'_blank',	'',	'J',	'',	'2014-01-16 20:52:30',	''),
(174,	'Delete select',	'delsel.php',	754,	'MENU',	'',	'',	'J',	'',	'2014-01-16 20:55:48',	''),
(184,	'Aufgabenplan kopieren',	'schedulecopy.php',	754,	'MENU',	'',	'',	'J',	'',	'2014-01-16 20:57:00',	''),
(194,	'Stundenplan',	'druckstundenplan.php',	1004,	'MENU',	'_blank',	'',	'J',	'',	'2014-08-22 16:22:20',	''),
(195,	'Grafik',	'grafik.php',	213,	'MENU',	'',	'',	'J',	'',	'2014-11-19 17:08:15',	'0312'),
(200,	'Druck Liste',	'druckliste.php',	1054,	'MENU',	'_blank',	'',	'J',	'',	'2015-04-30 15:27:12',	'0315'),
(197,	'Holen',	'empfangen.php',	183,	'MENU',	'',	'',	'J',	'',	'2014-12-17 17:31:37',	'0312'),
(199,	'Leeren',	'leeren.php',	183,	'MENU',	'',	'',	'J',	'',	'2015-02-14 23:42:14',	'0312'),
(201,	'Druck Grafik',	'druckgrafik.php',	1054,	'MENU',	'_blank',	'',	'J',	'',	'2015-05-06 16:09:09',	'0315'),
(202,	'Druck Liste',	'druckliste.php',	1456,	'MENU',	'_blank',	'',	'J',	'',	'2015-05-08 16:30:44',	'0315'),
(203,	'Gruppenaufgabenliste',	'druckgrpaufgabenliste.php',	754,	'MENU',	'_blank',	'&wert=',	'J',	'',	'2015-05-13 08:16:44',	'0312'),
(204,	'Holen',	'empfangen.php',	1110,	'MENU',	'',	'',	'J',	'',	'2015-05-28 05:31:16',	'0315'),
(205,	'delsel',	'delsel.php',	213,	'MENU',	'',	'',	'J',	'',	'2015-06-13 17:00:05',	'0312'),
(206,	'Grafik',	'r=site/page&view=graph',	213,	'YIIMENU',	'',	'',	'N',	'',	'2015-06-22 06:13:52',	'0312'),
(207,	'Buchen',	'buchen.php',	183,	'MENU',	'',	'',	'J',	'buchen',	'2015-06-23 05:57:44',	'0312'),
(208,	'Druck Essensplan',	'druckessensplan.php',	994,	'MENU',	'',	'',	'J',	'',	'2015-08-22 12:42:10',	'0312'),
(209,	'mailen',	'mailsend.php',	263,	'MENU',	'',	'',	'J',	'',	'2015-08-27 15:47:47',	'0312'),
(210,	'Druck Liste',	'druckliste.php',	1461,	'MENU',	'_blank',	'',	'J',	'',	'2015-10-09 15:49:39',	'0312'),
(211,	'Druck Liste',	'druckliste.php',	734,	'MENU',	'_blank',	'',	'J',	'',	'2015-10-09 16:06:49',	'0312'),
(212,	'Druck Liste',	'druckliste.php',	1074,	'MENU',	'_blank',	'',	'J',	'',	'2015-10-24 11:09:07',	'0312');

CREATE TABLE `tblgeburtstage` (
  `fldIndex` int(3) NOT NULL AUTO_INCREMENT,
  `fldVorname` varchar(30) NOT NULL,
  `fldNachname` varchar(30) NOT NULL,
  `fldGebDatum` date NOT NULL,
  `fldSort` varchar(5) NOT NULL,
  `fldBemerk` varchar(80) NOT NULL,
  PRIMARY KEY (`fldIndex`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

INSERT INTO `tblgeburtstage` (`fldIndex`, `fldVorname`, `fldNachname`, `fldGebDatum`, `fldSort`, `fldBemerk`) VALUES
(1,	'Horst',	'Meyer',	'1964-05-18',	'05-18',	''),
(2,	'Christiane',	'Meyer',	'1967-09-20',	'09-20',	''),
(3,	'Frieda Lina',	'Meyer',	'2008-07-09',	'07-09',	''),
(4,	'Edgar',	'Meyer',	'1965-05-24',	'05-24',	''),
(5,	'Heinz',	'Meyer',	'1934-05-05',	'05-05',	''),
(6,	'Sabine ',	'Dreger',	'1968-01-25',	'01-25',	''),
(7,	'Phoebe',	'Grau',	'2009-02-26',	'02-26',	''),
(8,	'Ralf',	'Beckers',	'1963-06-15',	'06-15',	'Alter unklar.'),
(9,	'Erna',	'Meyer',	'1938-06-11',	'06-11',	''),
(10,	'Brigitte ',	'Schulte',	'1948-05-26',	'05-26',	''),
(11,	'Hartmut',	'Schulte',	'1944-11-21',	'11-21',	''),
(12,	'Orell',	'Schulte',	'2007-03-15',	'03-15',	''),
(13,	'Dagmar',	'LiÃŸke',	'1955-03-04',	'03-04',	'Alter nicht bekannt.'),
(14,	'Gerrit',	'Schulte',	'1974-10-23',	'10-23',	''),
(15,	'Sylvia',	'Schulte',	'1980-08-30',	'08-30',	''),
(16,	'Marlene',	'RÃ¶thlein',	'2007-03-30',	'03-30',	''),
(17,	'Lilia Sofie',	'PlÃ¼ckhan',	'2005-05-29',	'05-29',	''),
(18,	'Damaris',	'Dreger',	'2005-08-01',	'08-01',	''),
(19,	'Antonia',	'Dreger',	'1998-09-10',	'09-10',	'??'),
(20,	'Louis',	'Dreger',	'1997-09-14',	'09-14',	'??'),
(21,	'Iris',	'Burgmeister',	'1975-01-04',	'01-04',	''),
(22,	'Ruth',	'Krabbe',	'1900-01-29',	'01-29',	''),
(23,	'Andrea',	'Dahmann',	'1967-09-30',	'09-30',	''),
(24,	'Manfred',	'Losse',	'1938-01-16',	'01-16',	''),
(25,	'Rachel',	'Gessat',	'1966-01-19',	'01-19',	''),
(63,	'Sigrid',	'PlÃ¼ckhahn',	'1967-12-24',	'',	'');

CREATE TABLE `tblgepaeck` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldbez` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


CREATE TABLE `tblgeraet` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldbez` varchar(255) COLLATE utf8_bin NOT NULL,
  `fldgeraetenr` varchar(10) COLLATE utf8_bin NOT NULL,
  `fldfaktor` varchar(10) COLLATE utf8_bin NOT NULL,
  `fldid_wo` bigint(20) NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

INSERT INTO `tblgeraet` (`fldindex`, `fldbez`, `fldgeraetenr`, `fldfaktor`, `fldid_wo`) VALUES
(3,	'Heizung (EssZi links)',	'713269749',	'1.200',	52),
(13,	'Heizung (Hausflur)',	'712362595',	'0.975',	41),
(23,	'Heizung (KiZi links)',	'712362502',	'0.375',	21),
(33,	'Heizung (KiZi rechts)',	'712362465',	'0.375',	21),
(43,	'Heizung (SchlaZi links)',	'712362601',	'0.425',	56),
(53,	'Heizung (SchlaZi rechts)',	'712362618',	'0.850',	56),
(63,	'Heizung (Bad oben)',	'723006846',	'0.475',	55),
(73,	'Heizung (ArbZi)',	'712362625',	'1.525',	31),
(83,	'Heizung (KÃ¼)',	'712362571',	'0.850',	19),
(93,	'Heizung (Bad unten)',	'712362540',	'0.750',	51),
(103,	'Heizung (EssZi rechts)',	'712362588',	'0.425',	12),
(113,	'Heizung (WoZi links)',	'712362519',	'0.425',	53),
(123,	'Heizung (WoZi rechts)',	'712362441',	'0.425',	53),
(133,	'Vorauszahlung',	'',	'1',	12);

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

INSERT INTO `tblgeschenke` (`fldindex`, `flddatum`, `fldbez`, `fldstatus`, `fldpreis`, `flduser`, `fldbeschenkter`, `fldlink`, `fldanlass`, `fldprior`, `fldvon`, `fldimage`) VALUES
(13,	'2012-08-31 20:39:00',	'Akkordeon',	'offen',	4590.00,	'Horst',	'Horst',	'http://www.amazon.de/Zupan-Alpe-Cassotto-Akkordeon-Palisander/dp/B004K1K9Z6/ref=sr_1_7?s=musical-instruments&ie=UTF8&qid=1382799500&sr=1-7&keywords=Alpenklang+Akkordeon',	'(ohne)',	4,	'',	'63'),
(63,	'2012-09-03 18:38:00',	'Joomla Programmierbuch',	'erledigt',	0.00,	'Horst',	'Horst',	'',	'',	0,	'',	''),
(23,	'2012-08-31 23:09:00',	'Elisabeth George Buch',	'erledigt',	24.99,	'Horst',	'Christiane',	'http://www.amazon.de/Glaube-L%C3%BCge-Inspector-Lynley-Roman-Elizabeth-George/dp/3442312515/ref=sr_1_1?s=books&ie=UTF8&qid=1346533778&sr=1-1',	'(ohne)',	0,	'',	''),
(33,	'2012-08-31 23:13:00',	'Miteinander Buch',	'erledigt',	14.95,	'Horst',	'Christiane',	'http://www.amazon.de/Miteinander-Empathie-Kinder-stark-macht/dp/3407859422/ref=wl_it_dp_o_pC_nS_nC?ie=UTF8&colid=28HUOCO2M9IJP&coliid=I2SWBFRDDTZD0O',	'(ohne)',	0,	'',	''),
(43,	'2012-08-31 23:16:00',	'Puzzle',	'erledigt',	9.99,	'Horst',	'Christiane',	'http://www.amazon.de/Schmidt-Spiele-58104-Teile-Puzzle/dp/B000LN5SHG/ref=sr_1_12?s=toys&ie=UTF8&qid=1346534077&sr=1-12',	'Geburtstag',	0,	'',	''),
(53,	'2012-08-31 23:17:00',	'SpÃƒÂ¤tzle-Presse',	'erledigt',	29.01,	'Horst',	'Christiane',	'http://www.amazon.de/Sp%C3%A4tzlepresse-Sp%C3%A4tzle-Chef-handgeschabt-unregelm%C3%A4%C3%9Fige-Lochform/dp/B000ZJWCKC/ref=sr_1_1?ie=UTF8&qid=1346533387&sr=8-1',	'Geburtstag',	0,	'',	''),
(73,	'2012-09-03 18:38:00',	'raspberry pi',	'erledigt',	0.00,	'Horst',	'Horst',	'',	'Weihnachten',	0,	'Horst',	''),
(83,	'2012-09-03 18:39:00',	'gehÃƒÂ¤use fÃƒÂ¼r raspberry pi',	'erledigt',	0.00,	'Horst',	'Horst',	'',	'Weihnachten',	0,	'Horst',	''),
(103,	'2012-09-03 18:39:00',	'Riemen fÃƒÂ¼r Akkordeon',	'offen',	28.90,	'Horst',	'Horst',	'http://www.amazon.de/Boston-Akkordeon-Gurt-48-72-Leder/dp/B003IJD0IE/ref=sr_1_4?s=musical-instruments&ie=UTF8&qid=1382803649&sr=1-4&keywords=akkordeon+riemen',	'Weihnachten',	0,	'',	'83'),
(113,	'2012-09-03 18:39:00',	'DLan Adapter (ÃƒÂ¼ber Steckdose)',	'erledigt',	0.00,	'Horst',	'Horst',	'',	'',	0,	'',	''),
(123,	'2012-09-03 18:39:00',	'Folk-CD z.B. Loreena Mc Kennit',	'erledigt',	0.00,	'Horst',	'Horst',	'',	'',	0,	'',	''),
(133,	'2012-09-03 18:46:00',	'Modellflugzeug',	'erledigt',	0.00,	'Horst',	'Horst',	'',	'Weihnachten',	0,	'Horst',	''),
(143,	'2012-10-09 07:34:00',	'Joomla Programmierbuch',	'erledigt',	30.00,	'Horst',	'Horst',	'http://www.amazon.de/Joomla--Extensions-entwickeln-Komponenten-programmieren/dp/3645601341/ref=sr_1_1?s=books&ie=UTF8&qid=1382804000&sr=1-1&keywords=joomla+programmierung',	'Weihnachten',	0,	'Horst',	''),
(153,	'2012-10-23 08:12:00',	'Flachbildschirm',	'erledigt',	0.00,	'Horst',	'Horst',	'',	'Weihnachten',	5,	'Horst',	''),
(163,	'2012-10-23 18:27:00',	'Engel',	'erledigt',	0.00,	'Horst',	'Frieda',	'',	'Weihnachten',	0,	'',	''),
(173,	'2012-10-23 18:50:00',	'RÃƒÂ¤tselheft',	'offen',	0.00,	'Horst',	'Opa Heinz',	'',	'Weihnachten',	0,	'',	''),
(183,	'2012-10-23 18:53:00',	'Mokkatasse',	'offen',	0.00,	'Horst',	'Oma Erna',	'',	'Weihnachten',	1,	'',	''),
(243,	'2013-05-21 00:00:00',	'Fahrradhelm',	'offen',	0.00,	'',	'Frieda',	'',	'Geburtstag',	0,	'',	''),
(253,	'2013-05-21 00:00:00',	'Playmobil Feenboot',	'offen',	0.00,	'',	'Frieda',	'',	'Geburtstag',	0,	'',	''),
(263,	'2013-05-21 00:00:00',	'Cars Auto',	'offen',	0.00,	'',	'Frieda',	'',	'Geburtstag',	0,	'',	''),
(273,	'2013-05-21 00:00:00',	'Der kleine Ritter Trenk ( Buch )',	'offen',	0.00,	'',	'Frieda',	'',	'Geburtstag',	0,	'',	''),
(274,	'2013-05-22 00:00:00',	'sprechender Teddy',	'offen',	0.00,	'',	'Frieda',	'',	'Geburtstag',	0,	'',	''),
(284,	'0000-00-00 00:00:00',	'kleine lila Puppe vom Einkaufen',	'offen',	0.00,	'',	'Frieda',	'',	'Geburtstag',	0,	'',	''),
(294,	'0000-00-00 00:00:00',	'kleiner I-AAh vom einkaufen',	'offen',	0.00,	'',	'Frieda',	'',	'Geburtstag',	0,	'',	''),
(304,	'0000-00-00 00:00:00',	'Die Biene Maja DVD',	'offen',	0.00,	'',	'Frieda',	'',	'Geburtstag',	0,	'',	''),
(314,	'0000-00-00 00:00:00',	'Feen von Playmobil',	'offen',	0.00,	'',	'Frieda',	'',	'Geburtstag',	0,	'',	''),
(233,	'2013-05-21 00:00:00',	'Smartphone',	'erledigt',	0.00,	'',	'Christiane',	'',	'Geburtstag',	0,	'',	''),
(313,	'2013-09-07 00:00:00',	'Weleda Hautlotion Sanddorn',	'erledigt',	0.00,	'',	'Christiane',	'',	'Geburtstag',	0,	'',	''),
(323,	'2013-09-07 00:00:00',	'Gutschein fÃƒÂ¼r neue Handtasche ( selbst aussuchen )',	'offen',	0.00,	'',	'Christiane',	'',	'Geburtstag',	0,	'',	''),
(333,	'2013-09-07 00:00:00',	'Dan Brown Inferno Gebundene Ausgabe',	'offen',	0.00,	'',	'Christiane',	'',	'Geburtstag',	0,	'',	''),
(343,	'2013-09-07 00:00:00',	'kleine handliche Digitalkamera',	'offen',	0.00,	'',	'Christiane',	'',	'Geburtstag',	0,	'',	''),
(353,	'2013-09-07 00:00:00',	'Tortelliniform',	'offen',	0.00,	'',	'Christiane',	'',	'Geburtstag',	0,	'',	''),
(363,	'2013-09-07 00:00:00',	'Nudelmaschine',	'offen',	0.00,	'',	'Christiane',	'',	'Geburtstag',	0,	'',	''),
(373,	'2013-09-07 00:00:00',	'Einkaufsgutschein fÃƒÂ¼r C&A',	'offen',	0.00,	'',	'Christiane',	'',	'Geburtstag',	0,	'',	''),
(383,	'2013-09-07 00:00:00',	'Buch Jojo Moyes: Ein ganzes halbes Jahr',	'erledigt',	0.00,	'',	'Christiane',	'http://www.amazon.de/Ein-ganzes-halbes-Jahr-ebook/dp/B00A32BW7A/ref=sr_1_1?s=books&ie=UTF8&qid=1378550106&sr=1-1',	'Geburtstag',	0,	'',	'halbes_jahr.jpg'),
(303,	'2013-09-07 00:00:00',	'DVD Der Hobbit',	'erledigt',	0.00,	'',	'Christiane',	'http://www.amazon.de/Hobbit-Eine-unerwartete-Reise/dp/B00AN0MCG2/ref=sr_1_1?s=dvd&ie=UTF8&qid=1378555960&sr=1-1&keywords=der+hobbit',	'Geburtstag',	0,	'',	'der_hobbit.jpg'),
(394,	'2013-10-28 00:00:00',	'ferngesteuertes Auto',	'offen',	23.99,	'',	'Frieda',	'http://www.amazon.de/Dickie-Spielzeug-203089501-Lightning-Funkfernsteuerung-entweder/dp/B004BR3CLW/ref=sr_1_4?s=toys&ie=UTF8&qid=1382998153&sr=1-4&keywords=ferngesteuertes+auto',	'Weihnachten',	0,	'',	''),
(404,	'2013-10-28 00:00:00',	'Cars Auto Hook',	'offen',	5.38,	'',	'Frieda',	'http://www.amazon.de/Disney-Cars-V2798-Mater-Martin/dp/B0050RQOQM/ref=sr_1_3?s=toys&ie=UTF8&qid=1382998251&sr=1-3&keywords=cars+autos',	'Weihnachten',	0,	'',	''),
(93,	'2012-09-03 18:39:00',	'GeldzÃƒÂ¤hlmaschine',	'offen',	19.90,	'Horst',	'Horst',	'http://www.amazon.de/General-Office-Mobiler-Euro-M%C3%BCnzz%C3%A4hler-Batteriebetrieb/dp/B005DEI4I8/ref=pd_sim_sbs_office_5',	'Weihnachten',	0,	'',	'73'),
(403,	'2013-10-26 00:00:00',	'Festplattenrekorder',	'zurueckges',	299.00,	'',	'Horst',	'http://www.amazon.de/Kathrein-Twin-HDTV-Digitalreceiver-Festplatte-CI/dp/B007SBTNE8/ref=sr_1_3?s=home-theater&ie=UTF8&qid=1382805281&sr=1-3&keywords=festplattenrecorder',	'Weihnachten',	0,	'(ohne)',	'113'),
(484,	'2013-10-30 00:00:00',	'Playmobil Prinzessinnen Schloss',	'offen',	126.94,	'',	'Frieda',	'http://www.amazon.de/Playmobil-5142-PLAYMOBIL-Prinzessinnenschloss/dp/B004P5O8OK/ref=sr_1_1?ie=UTF8&qid=1383109740&sr=8-1&keywords=playmobil+schloss+prinzessin',	'Weihnachten',	0,	'',	''),
(414,	'2013-10-28 00:00:00',	'Puppe',	'offen',	44.99,	'',	'Frieda',	'http://www.amazon.de/dp/B00B02QKFQ?psc=1',	'Weihnachten',	0,	'',	''),
(424,	'2013-10-28 00:00:00',	'Playmobil Ponyhof',	'offen',	39.98,	'',	'Frieda',	'http://www.amazon.de/Playmobil-5222-PLAYMOBIL-Ponyhof/dp/B0077QSM46/ref=sr_1_12?s=toys&ie=UTF8&qid=1382998649&sr=1-12&keywords=playmobil+pferde',	'Weihnachten',	0,	'Opa Heinz und Oma Erna',	''),
(434,	'2013-10-28 00:00:00',	'Polly Pocket Pferde',	'offen',	12.73,	'',	'Frieda',	'http://www.amazon.de/Mattel-X7175-Freundinnen-Spielset-inklusive/dp/B006O6ELI6/ref=sr_1_1?s=toys&ie=UTF8&qid=1382998802&sr=1-1&keywords=polly+pocket+pferde',	'Weihnachten',	0,	'Tante Sylvia',	''),
(444,	'2013-10-28 00:00:00',	'Rosetta Puppe',	'offen',	25.99,	'',	'Frieda',	'http://www.ebay.de/itm/Disney-Fairies-ROSETTA-Puppe-31-cm-bewegliche-Fluegel-Flatterpuppe-Feenfluegel-/141028925219?fromMakeTrack=true&ssPageName=VIP:watchlink:top:de',	'Weihnachten',	0,	'',	''),
(454,	'2013-10-28 00:00:00',	'BettwÃƒÂ¤sche Tinkerbell',	'offen',	34.80,	'',	'Frieda',	'http://www.amazon.de/Disneys-Fairies-Bettw%C3%A4sche-Tinkerbell-135x200cm/dp/B00BKW2D4I/ref=sr_1_3?s=toys&ie=UTF8&qid=1382999097&sr=1-3&keywords=bettw%C3%A4sche+tinkerbell',	'Weihnachten',	0,	'',	''),
(464,	'2013-10-29 00:00:00',	'Buch von Khaled Hosseini',	'offen',	19.99,	'',	'Christiane',	'http://www.amazon.de/Traumsammler-Roman-Khaled-Hosseini/dp/3100329104/ref=sr_1_1?s=books&ie=UTF8&qid=1383034262&sr=1-1&keywords=khaled+hosseini+traumsammler',	'Weihnachten',	0,	'',	''),
(474,	'2013-10-29 00:00:00',	'GetreidemÃƒÂ¼hle und Flockenquetscher',	'offen',	581.03,	'',	'Christiane',	'http://www.amazon.de/Getreidem%C3%BChle-Duett-100-Fidibus-Classic/dp/B004TJ1WAU/ref=pd_cp_k_0',	'Weihnachten',	0,	'',	''),
(494,	'2013-11-01 00:00:00',	'Buch Fortsetzung von Ritter Trenk',	'offen',	14.95,	'',	'Frieda',	'http://www.amazon.de/kleine-Ritter-Trenk-Gro%C3%9Fe-Gef%C3%A4hrliche/dp/3789131938/ref=sr_1_1?ie=UTF8&qid=1383275855&sr=8-1&keywords=der+kleine+ritter+trenk+und+der+gro%C3%9Fe+gef%C3%A4hrliche',	'Weihnachten',	0,	'',	''),
(504,	'2013-11-01 00:00:00',	'Cars Auto Chick Hicks',	'offen',	20.00,	'',	'Frieda',	'http://www.amazon.de/Disney-Pixar-Cars-Chick-Hicks/dp/B00A3FVONE/ref=sr_1_1?s=toys&ie=UTF8&qid=1383275995&sr=1-1&keywords=cars+chick+hicks',	'Weihnachten',	0,	'',	''),
(483,	'2013-11-11 00:00:00',	'Star Trek DVD into darkness',	'erledigt',	12.99,	'',	'Horst',	'http://www.amazon.de/Star-Trek-Into-Darkness-Chris/dp/B00CXLSRUY/ref=sr_1_3?ie=UTF8&qid=1384208178&sr=8-3&keywords=star+trek+in+the+darkness',	'Weihnachten',	0,	'(ohne)',	''),
(493,	'2013-11-16 00:00:00',	'Pippi Langstrumpf',	'offen',	22.99,	'',	'Frieda',	'http://www.amazon.de/Astrid-Lindgren-Langstrumpf-TV-Serie-Komplettbox/dp/B00CJOQ0C2/ref=sr_1_1?s=dvd&ie=UTF8&qid=1384606556&sr=1-1&keywords=pippi+langstrumpf',	'Weihnachten',	0,	'Christiane',	''),
(384,	'2013-10-28 00:00:00',	'Schlittschuhe',	'offen',	39.50,	'',	'Frieda',	'http://www.amazon.de/Nijdam-M%C3%A4dchen-Schlittschuh-inlineskate-kombi-Verstellbar-52QZ/dp/B0050QBAR6/ref=sr_1_3?s=toys&ie=UTF8&qid=1382997856&sr=1-3&keywords=schlittschuhe+kinder',	'Weihnachten',	0,	'Oma Brigitte',	''),
(513,	'2013-11-21 00:00:00',	'Makrolinse',	'erledigt',	13.94,	'',	'Horst',	'http://www.amazon.de/Magnetische-Super-Makro-Linse-verschiedene-Kameratypen/dp/B0052JJDPW/ref=sr_1_1?s=ce-de&ie=UTF8&qid=1385029809&sr=1-1&keywords=handy+makro+linse#productDescription',	'Weihnachten',	0,	'(ohne)',	'143'),
(523,	'2013-11-21 00:00:00',	'Android Programmierung',	'erledigt',	30.00,	'',	'Horst',	'http://www.amazon.de/Java-f%C3%BCr-Android-Android-Apps-programmieren/dp/3645602542/ref=sr_1_6?s=books&ie=UTF8&qid=1385030326&sr=1-6&keywords=android+programmierung',	'Weihnachten',	0,	'(ohne)',	'123'),
(533,	'2013-11-21 00:00:00',	'Festplatte',	'erledigt',	80.90,	'',	'Horst',	'http://www.snogard.de/index.php?artikelId=HDEXT100ADH14',	'Weihnachten',	0,	'(ohne)',	'133'),
(514,	'2013-11-08 00:00:00',	'Buch Gelassen erziehen von Jesper Juul',	'offen',	17.95,	'',	'Christiane',	'http://www.amazon.de/Elterncoaching-Gelassen-erziehen-Jesper-Juul/dp/3407859201/ref=sr_1_8?s=books&ie=UTF8&qid=1383886809&sr=1-8&keywords=jesper+juul',	'Weihnachten',	0,	'Opa Heinz und Oma Erna',	'183'),
(534,	'2013-11-23 00:00:00',	'Schlittschuhe',	'offen',	0.00,	'',	'Christiane',	'Schlittschuhe ;-)',	'Weihnachten',	0,	'Horst',	''),
(544,	'2013-11-29 00:00:00',	'Buch von Elizabeth George: Nur eine bÃƒÂ¶se Tat',	'offen',	24.00,	'',	'Christiane',	'http://www.amazon.de/Nur-eine-b%C3%B6se-Tat-Inspector-Lynley-Roman/dp/3442312523/ref=sr_1_1?s=books&ie=UTF8&qid=1385702531&sr=1-1&keywords=elizabeth+george+neuerscheinung+2013',	'Weihnachten',	0,	'Horst',	''),
(554,	'2013-11-29 00:00:00',	'KochschÃƒÂ¼rze groÃƒÅ¸ mit netten Spruch',	'offen',	0.00,	'',	'Christiane',	'',	'Weihnachten',	0,	'Horst',	''),
(543,	'2013-11-25 00:00:00',	'SF Buch',	'erledigt',	15.00,	'',	'Horst',	'http://www.amazon.de/Sternenspiel-Roman-Sergej-Lukianenko/dp/345352411X/ref=sr_1_10?s=books&ie=UTF8&qid=1385405373&sr=1-10&keywords=lukianenko',	'Weihnachten',	0,	'Horst',	'163'),
(553,	'2013-12-01 00:00:00',	'KÃƒÂ¼chenradio mit CD',	'erledigt',	34.99,	'',	'Horst',	'http://www.amazon.de/K%C3%BCchenradio-mit-CD-Player-Alarm-Wecker/dp/B00EV3CHKI/ref=sr_1_1?s=ce-de&ie=UTF8&qid=1385903539&sr=1-1&keywords=k%C3%BCchenradio+cd',	'Weihnachten',	0,	'(ohne)',	'193'),
(563,	'2014-01-08 00:00:00',	'Ordnung im ganzen Haus!',	'offen',	0.00,	'',	'Horst',	'',	'Geburtstag',	0,	'(ohne)',	''),
(583,	'2014-04-29 00:00:00',	'Blue ray player',	'offen',	259.00,	'',	'Horst',	'http://www.mediamarkt.de/mcs/product/SAMSUNG-BD-F-8509-S,48353,460697,632824.html?langId=-3',	'Geburtstag',	0,	'(ohne)',	''),
(584,	'2014-11-12 00:00:00',	'Buch fÃƒÂ¼r Sensoren',	'offen',	30.00,	'',	'Horst',	'http://www.amazon.de/Sensoren-Raspberry-Pi-Temperatur-Stromst%C3%A4rke/dp/3645603425/ref=sr_1_1/278-2164466-1612115?ie=UTF8&qid=1415775504&sr=8-1&keywords=sensoren+raspberry+pi',	'Weihnachten',	0,	'(ohne)',	'');

CREATE TABLE `tblgrperl` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldbez` varchar(200) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

INSERT INTO `tblgrperl` (`fldindex`, `fldbez`) VALUES
(2,	'(ohne)'),
(3,	'Finanzen'),
(4,	'Ordnung'),
(5,	'Auto'),
(8,	'leer'),
(9,	'Computer'),
(10,	'Briefe'),
(11,	'Haushalt'),
(12,	'Reparatur'),
(19,	'PrgEntw'),
(15,	'Besuche'),
(16,	'Freizeit'),
(17,	'Geschenk'),
(18,	'Familie'),
(144,	'Friedas Fragen'),
(143,	'Wahl'),
(154,	'Geburtstagsfeier Horst'),
(155,	'LebenstrÃ¤ume'),
(156,	'Ubuntu'),
(157,	'Joomla'),
(158,	'Erfolge'),
(159,	'Familienkonferenz'),
(161,	'Ubuntu einrichten');

CREATE TABLE `tblgrundartikel` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldbez` varchar(250) NOT NULL,
  `fldbezmz` varchar(250) NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


CREATE TABLE `tblgrundeinheit` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldkurz` varchar(50) NOT NULL,
  `fldbez` varchar(200) NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

INSERT INTO `tblgrundeinheit` (`fldindex`, `fldkurz`, `fldbez`) VALUES
(1,	'STK',	'StÃ¼ck'),
(2,	'L',	'Liter');

CREATE TABLE `tblhaeufigkeit` (
  `fldIndex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldBez` varchar(250) NOT NULL,
  `fldTage` int(11) NOT NULL,
  PRIMARY KEY (`fldIndex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

INSERT INTO `tblhaeufigkeit` (`fldIndex`, `fldBez`, `fldTage`) VALUES
(1,	'tÃ¤gl.',	1),
(2,	'offen',	0),
(3,	'wÃ¶ch.',	7),
(4,	'mon.',	30),
(5,	'vierteljÃ¤hr.',	90),
(6,	'unregelmÃ¤ÃŸig',	0),
(7,	'jÃ¤hr.',	365);

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

INSERT INTO `tblheizung` (`fldindex`, `fldbez`, `fldid_ort`, `fldPreis`, `fldAnz`, `fldGespreis`, `fldAbrjahr`, `fldArchivDat`, `fldgeraetenr`, `fldid_geraet`, `fldAblesedat`, `fldok`) VALUES
(3,	'Arbeitszimmer',	31,	'0.16158035',	'1516',	'',	'2012',	'',	'',	73,	'0000-00-00',	'J'),
(13,	'Badezimmer',	55,	'0.16158035',	'79',	'',	'2012',	'',	'',	63,	'0000-00-00',	'J'),
(33,	'Heizung links',	21,	'0.16158035',	'1632',	'',	'2012',	'',	'',	23,	'0000-00-00',	'J'),
(43,	'Heizung rechts',	21,	'0.16158035',	'1888',	'',	'2012',	'',	'',	33,	'0000-00-00',	'J'),
(53,	'Flur',	41,	'0.16158035',	'1795',	'',	'2012',	'',	'',	13,	'0000-00-00',	'J'),
(63,	'Bad',	51,	'0.16158035',	'2688',	'',	'2012',	'',	'',	93,	'0000-00-00',	'J'),
(73,	'KÃƒÂ¼che',	19,	'0.16158035',	'2536',	'',	'2012',	'',	'',	83,	'0000-00-00',	'J'),
(83,	'Heizung links',	52,	'0.16158035',	'1491',	'',	'2012',	'',	'',	103,	'0000-00-00',	'J'),
(93,	'Heizung rechts',	52,	'0.16158035',	'1624',	'',	'2012',	'',	'',	3,	'0000-00-00',	'J'),
(103,	'Heizung links',	53,	'0.16158035',	'2476',	'',	'2012',	'',	'',	123,	'0000-00-00',	'J'),
(113,	'Heizung rechts',	53,	'0.16158035',	'780',	'',	'2012',	'',	'',	113,	'0000-00-00',	'J'),
(123,	'Heizung links',	56,	'0.16158035',	'1275',	'',	'2012',	'',	'',	43,	'0000-00-00',	'J'),
(133,	'Heizung hinten',	56,	'0.16158035',	'478',	'',	'2012',	'',	'',	53,	'0000-00-00',	'J'),
(283,	'',	12,	'1',	'-1380',	'',	'2012',	'',	'',	133,	'0000-00-00',	'N'),
(373,	'',	31,	'0.16158035',	'476',	'',	'2014',	'',	'',	73,	'2014-07-07',	'J'),
(383,	'',	41,	'0.16158035',	'271',	'',	'2014',	'',	'',	13,	'2014-07-07',	'J'),
(393,	'',	53,	'0.16158035',	'1158',	'',	'2014',	'',	'',	123,	'2014-07-07',	'J'),
(403,	'',	53,	'0.16158035',	'702',	'',	'2014',	'',	'',	113,	'2014-07-07',	'J'),
(413,	'',	52,	'0.16158035',	'894',	'',	'2014',	'',	'',	103,	'2014-07-07',	'J'),
(423,	'',	52,	'0.16158035',	'906',	'',	'2014',	'',	'',	3,	'2014-07-07',	'J'),
(433,	'',	19,	'0.16158035',	'1016',	'',	'2014',	'',	'',	83,	'2014-07-07',	'J'),
(443,	'',	51,	'0.16158035',	'1328',	'',	'2014',	'',	'',	93,	'2014-07-07',	'J'),
(453,	'',	21,	'0.16158035',	'754',	'',	'2014',	'',	'',	33,	'2014-07-07',	'J'),
(463,	'',	21,	'0.16158035',	'1247',	'',	'2014',	'',	'',	23,	'2014-07-07',	'J'),
(473,	'',	55,	'0.16158035',	'1',	'',	'2014',	'',	'',	63,	'2014-07-07',	'J'),
(483,	'',	56,	'0.16158035',	'694',	'',	'2014',	'',	'',	43,	'2014-07-07',	'J'),
(493,	'',	56,	'0.16158035',	'272',	'',	'2014',	'',	'',	53,	'2014-07-07',	'J'),
(503,	'',	12,	'1',	'-1400',	'',	'2014',	'',	'',	133,	'0000-00-00',	'N');

CREATE TABLE `tblhelpindex` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldbez` varchar(50) NOT NULL,
  `fldtyp` varchar(20) NOT NULL,
  `fldsort` varchar(10) NOT NULL,
  `fldmenu` bigint(20) NOT NULL,
  `fldpageno` bigint(20) NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `tblhelpindex` (`fldindex`, `fldbez`, `fldtyp`, `fldsort`, `fldmenu`, `fldpageno`) VALUES
(1,	'Inhalsverzeichnis',	'INHALT',	'0001',	0,	0),
(11,	'Filly',	'',	'',	1501,	3),
(21,	'BuchfÃ¼hrung',	'',	'',	213,	2);

CREATE TABLE `tblhelppage` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldpageno` int(11) NOT NULL,
  `fldpagename` varchar(50) NOT NULL,
  `fldhelpurl` varchar(250) NOT NULL,
  `fldheadline` varchar(100) NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `tblhelppage` (`fldindex`, `fldpageno`, `fldpagename`, `fldhelpurl`, `fldheadline`) VALUES
(1,	2,	'buchfuehrung',	'buchfuehrung.html',	'BuchfÃ¼hrung'),
(2,	1,	'helpindex',	'helpindex.php',	'Hilfe'),
(11,	3,	'filly',	'filly.html',	'Filly');

CREATE TABLE `tbljahr` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldjahr` year(4) NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

INSERT INTO `tbljahr` (`fldindex`, `fldjahr`) VALUES
(3,	'2012'),
(13,	'2013'),
(23,	'2014'),
(24,	'2015');

CREATE TABLE `tblkategorie` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldbez` varchar(100) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

INSERT INTO `tblkategorie` (`fldindex`, `fldbez`) VALUES
(4,	'(ohne)'),
(3,	'Themen'),
(23,	'Erledigung'),
(13,	'Aufgaben'),
(31,	'Computerarbeiten');

CREATE TABLE `tblktoart` (
  `fldIndex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldBez` varchar(200) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldIndex`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

INSERT INTO `tblktoart` (`fldIndex`, `fldBez`) VALUES
(24,	'EINKAUF'),
(25,	'LASTSCHRIFT');

CREATE TABLE `tblktobanken` (
  `fldIndex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldBez` varchar(50) NOT NULL,
  `fldArt` varchar(20) NOT NULL,
  `fldcalc` varchar(4) NOT NULL,
  `fldaktiv` varchar(1) NOT NULL DEFAULT 'N',
  `fldid_benutzer` bigint(20) NOT NULL,
  PRIMARY KEY (`fldIndex`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `tblktobanken` (`fldIndex`, `fldBez`, `fldArt`, `fldcalc`, `fldaktiv`, `fldid_benutzer`) VALUES
(1,	'HORST',	'PERSON',	'JA',	'N',	1),
(2,	'CHRIS',	'PERSON',	'JA',	'N',	2),
(3,	'Offenen Posten',	'',	'',	'N',	0),
(4,	'Bank_Chris',	'PERSON',	'',	'N',	2),
(5,	'Bank_Horst',	'PERSON',	'',	'N',	1),
(6,	'(ohne)',	'',	'',	'N',	0),
(7,	'Frieda_Sparkonto',	'',	'',	'N',	3),
(8,	'horst_bargeld',	'',	'JA',	'N',	1),
(9,	'chris_bargeld',	'',	'',	'N',	2);

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

INSERT INTO `tblktodauerauftrag` (`fldindex`, `fldbez`, `fldbetrag`, `fldgesamtbetrag`, `fldid_ktogrp`, `fldid_kto`, `fldid_dauerauftragtyp`, `fldid_ktoeatyp`, `fldaktiv`, `fldfaelligdatum`, `fldanzmon`) VALUES
(3,	'Kindergeld',	184.00,	0.00,	4,	83,	3,	3,	'J',	'0000-00-00',	'1'),
(13,	'Miete',	-980.00,	0.00,	5,	93,	13,	13,	'J',	'0000-00-00',	'1'),
(33,	'Schulden',	-150.00,	0.00,	4,	133,	13,	13,	'J',	'2014-06-01',	'1'),
(43,	'Strom',	-153.00,	0.00,	5,	18,	23,	13,	'J',	'0000-00-00',	'1'),
(53,	'Versicherung',	-41.21,	0.00,	4,	153,	23,	13,	'J',	'0000-00-00',	'1'),
(63,	'Gehalt Horst',	2026.00,	0.00,	5,	63,	3,	3,	'J',	'0000-00-00',	'1'),
(73,	'Lebensmittel',	-500.00,	0.00,	1,	3,	33,	13,	'J',	'0000-00-00',	''),
(83,	'Festnetz-Telefon',	-60.00,	0.00,	5,	20,	43,	13,	'J',	'0000-00-00',	'1'),
(93,	'Garagenmiete',	-30.00,	0.00,	5,	93,	13,	13,	'J',	'0000-00-00',	'1'),
(103,	'Homepage',	-61.48,	0.00,	5,	113,	43,	13,	'J',	'0000-00-00',	'12'),
(113,	'Spareinlage',	-45.00,	0.00,	5,	207,	13,	13,	'J',	'0000-00-00',	'1'),
(123,	'Flinkster Monatsmiete',	-10.00,	0.00,	5,	24,	23,	13,	'J',	'0000-00-00',	'1'),
(133,	'ADAC Mietgliedsbeitrag',	0.00,	0.00,	5,	0,	43,	13,	'N',	'0000-00-00',	''),
(143,	'Lohnsteuerhilfebeitrag',	-240.00,	0.00,	5,	210,	43,	13,	'J',	'0000-00-00',	'12'),
(153,	'Mietervereinbeitrag',	-72.00,	0.00,	5,	123,	43,	13,	'J',	'0000-00-00',	'12'),
(163,	'Gehalt Chris',	850.00,	0.00,	4,	73,	3,	3,	'J',	'0000-00-00',	'1'),
(173,	'Autoversicherung',	-280.00,	0.00,	5,	0,	0,	13,	'N',	'0000-00-00',	''),
(193,	'Nebenkosten Ratenzahlung',	-100.00,	0.00,	5,	0,	43,	13,	'N',	'0000-00-00',	'1'),
(203,	'RundfunkgebÃ¼hr',	-53.94,	0.00,	4,	163,	13,	13,	'J',	'2014-07-01',	'3'),
(204,	'Familienjahreskarte Zoo',	-175.00,	-175.00,	4,	43,	23,	13,	'J',	'0000-00-00',	'12'),
(205,	'Flinkster Fahrtkosten',	-250.00,	0.00,	5,	206,	23,	13,	'J',	'0000-00-00',	'1'),
(206,	'Monatskarte Frieda',	-60.40,	0.00,	4,	24,	23,	13,	'N',	'0000-00-00',	'1'),
(207,	'Musikschule',	-28.00,	0.00,	4,	5,	23,	13,	'J',	'0000-00-00',	'1'),
(208,	'World Vision',	-30.00,	0.00,	4,	21,	23,	13,	'J',	'0000-00-00',	'1');

CREATE TABLE `tblktoEATyp` (
  `fldIndex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldBez` varchar(250) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldIndex`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

INSERT INTO `tblktoEATyp` (`fldIndex`, `fldBez`) VALUES
(3,	'EINNAHME'),
(13,	'AUSGABE'),
(23,	'UMBUCH'),
(33,	'(ohne)');

CREATE TABLE `tblktogrpzuord` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldid_kto` bigint(20) NOT NULL,
  `fldid_ktogrp` bigint(20) NOT NULL,
  `fldid_oberkonto` bigint(20) NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


CREATE TABLE `tblktogrp_liste` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldbez` varchar(250) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


CREATE TABLE `tblktoinhgrpzuord` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldid_ktoinhaber` bigint(20) NOT NULL,
  `fldid_ktoinhgrp` bigint(20) NOT NULL,
  `fldinhaber` varchar(50) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

INSERT INTO `tblktoinhgrpzuord` (`fldindex`, `fldid_ktoinhaber`, `fldid_ktoinhgrp`, `fldinhaber`) VALUES
(1,	8,	4,	''),
(2,	9,	4,	''),
(3,	5,	5,	''),
(4,	4,	5,	'');

CREATE TABLE `tblktoinhgrp_liste` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldbez` varchar(250) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

INSERT INTO `tblktoinhgrp_liste` (`fldindex`, `fldbez`) VALUES
(3,	'Horst_Bargeld'),
(4,	'HorstChris_Bargeld'),
(5,	'HorstChris_Bank');

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

INSERT INTO `tblktokonten` (`fldIndex`, `fldKurz`, `fldBez`, `fldTyp`, `fldid_oberkonto`, `fldfarbe`, `fldParent`, `fldKtoTyp`) VALUES
(1,	'HAUSHALT',	'Haushaltswaren',	'AUSGABE',	23,	'',	0,	''),
(3,	'LEBEN',	'Lebensmittel',	'AUSGABE',	23,	'',	0,	''),
(4,	'ABHEBUNG',	'Abhebung',	'UMBUCH',	43,	'',	0,	''),
(5,	'KIND',	'Kind',	'AUSGABE',	23,	'',	0,	''),
(6,	'AUSFLUG',	'Ausflug',	'AUSGABE',	93,	'',	0,	''),
(7,	'UMBUCH',	'Umbuch',	'UMBUCH',	43,	'',	0,	''),
(8,	'PRIVAT',	'Privates',	'AUSGABE',	23,	'',	0,	''),
(9,	'PFAND',	'Pfand',	'AUSGABE',	23,	'',	0,	''),
(10,	'PFLEG',	'Pflegemittel (KrÃƒÂ¤ms, Shampoo, etc)',	'AUSGABE',	23,	'',	0,	''),
(11,	'KREDIT',	'Kredit',	'',	0,	'',	0,	''),
(12,	'BEKL',	'Bekleidung',	'AUSGABE',	23,	'',	0,	''),
(13,	'GESCH',	'Geschenk',	'AUSGABE',	103,	'',	0,	''),
(14,	'POST',	'Post, Porto',	'AUSGABE',	33,	'',	0,	''),
(15,	'EINKAUF',	'Einkauf',	'AUSGABE',	23,	'',	0,	''),
(16,	'AUTO',	'Auto',	'AUSGABE',	73,	'',	0,	''),
(17,	'GENUSS',	'Genussmittel',	'AUSGABE',	93,	'',	0,	''),
(18,	'STROM',	'Strom',	'AUSGABE',	53,	'',	0,	''),
(19,	'MED',	'Medizin',	'AUSGABE',	23,	'',	0,	''),
(20,	'TELEFON',	'Telefon',	'AUSGABE',	53,	'',	0,	''),
(21,	'SPENDE',	'Spende',	'AUSGABE',	103,	'',	0,	''),
(22,	'LASTSCHRIFT',	'Lastschrift',	'UMBUCH',	43,	'',	0,	''),
(24,	'FAHR',	'Fahrtkosten',	'AUSGABE',	73,	'',	0,	''),
(25,	'LASTSCHR',	'Lastschrift',	'',	0,	'',	0,	''),
(26,	'VERGNUEGEN',	'VergnÃƒÂ¼gen',	'AUSGABE',	93,	'',	0,	''),
(33,	'GLUEBIRNEN',	'GlÃƒÂ¼hbirnen',	'AUSGABE',	33,	'',	0,	''),
(34,	'(ohne)',	'',	'',	34,	'',	0,	''),
(43,	'FAMILIE',	'Familie',	'AUSGABE',	33,	'',	0,	''),
(53,	'(ohne)',	'(ohne)',	'',	0,	'',	0,	''),
(63,	'GEHALTHORST',	'Gehalt Horst',	'EINNAHME',	3,	'',	0,	''),
(73,	'GEHALTCHRIS',	'Gehalt Christiane',	'EINNAHME',	3,	'',	0,	''),
(83,	'KINDERGELD',	'Kindergeld',	'EINNAHME',	13,	'',	0,	''),
(93,	'MIETE',	'Miete',	'AUSGABE',	53,	'',	0,	''),
(103,	'SONSTIGES',	'Sonstiges',	'AUSGABE',	33,	'',	0,	''),
(113,	'HOMEPAGE',	'Homepage',	'AUSGABE',	53,	'',	0,	''),
(123,	'GEBUEHR',	'GebÃ¼hren',	'AUSGABE',	83,	'',	0,	''),
(133,	'SCHULDEN',	'Schulden',	'AUSGABE',	83,	'',	0,	''),
(153,	'VERSICHERUNG',	'Versicherung',	'AUSGABE',	53,	'',	0,	''),
(163,	'RUNDFUNK',	'RundfunkgebÃ¼hr',	'AUSGABE',	53,	'',	0,	''),
(173,	'GUTSCHRIFT',	'Gutschrift',	'EINNAHME',	13,	'',	0,	''),
(183,	'SPORT',	'Sport',	'AUSGABE',	93,	'',	0,	''),
(193,	'PRAESENT',	'Present',	'EINNAHME',	13,	'',	0,	''),
(203,	'RUECKBUCHUNG',	'RÃƒÂ¼ckbuchung',	'EINNAHME',	13,	'',	0,	''),
(204,	'LEBEN_HORST',	'Lebensmittel_horst',	'AUSGABE',	23,	'',	0,	''),
(205,	'CHRIS_PRIVAT',	'Chris Privat',	'AUSGABE',	0,	'',	0,	''),
(206,	'FLINKSTER',	'Flinkster',	'AUSGABE',	0,	'',	0,	''),
(207,	'SPAREINLAGE',	'Spareinlage',	'UMBUCH',	0,	'',	0,	''),
(208,	'MASTERCARD',	'Mastercard',	'UMBUCH',	0,	'',	0,	''),
(209,	'BUECHER',	'BÃƒÂ¼cher',	'AUSGABE',	0,	'',	0,	''),
(210,	'LOHNSTEUERBEITRAG',	'Lohnsteuerbeitag',	'AUSGABE',	53,	'',	0,	''),
(211,	'EINZAHLUNG',	'Einzahlung',	'EINNAHME',	0,	'',	0,	''),
(212,	'LOSGEWINN',	'Losgewinn',	'EINNAHME',	0,	'',	0,	''),
(213,	'ANFANGSBESTAND',	'Anfangsbestand',	'EINNAHME',	0,	'',	0,	''),
(214,	'BARGUTSCHRIFT',	'Bargutschrift',	'EINNAHME',	0,	'',	0,	''),
(215,	'PFANDGUTSCHRIFT',	'Pfandgutschrift',	'EINNAHME',	0,	'',	0,	'');

CREATE TABLE `tblktooberkonten` (
  `fldIndex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldBez` varchar(100) COLLATE utf8_bin NOT NULL,
  `fldKurz` varchar(100) COLLATE utf8_bin NOT NULL,
  `fldTyp` varchar(50) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldIndex`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

INSERT INTO `tblktooberkonten` (`fldIndex`, `fldBez`, `fldKurz`, `fldTyp`) VALUES
(34,	'(ohne)',	'',	''),
(3,	'Gehalt',	'GEHALT',	'EINNAHME'),
(13,	'Sonstige Einnahmen',	'SONSTEIN',	'EINNAHME'),
(23,	'Lebenshaltung',	'LEBENSHALT',	'AUSGABE'),
(33,	'Sonstige Ausgaben',	'SONSTAUS',	'AUSGABE'),
(43,	'Umbuchungen',	'UMBUCH',	'UMBUCH'),
(53,	'Miete, Strom, Versicherungen',	'MIETE',	'AUSGABE'),
(63,	'(ohne)',	'',	''),
(73,	'Auto, Fahrkosten (Bahn)',	'AUTO',	'AUSGABE'),
(83,	'GebÃƒÂ¼hren, Schulden',	'GEBUEHR',	'AUSGABE'),
(93,	'Freizeit, VergnÃƒÂ¼gen',	'FREIZEIT',	'AUSGABE'),
(103,	'Geschenke, Spenden',	'GESCHENK',	'AUSGABE');

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
  `flddel` varchar(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`fldindex`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `tblktosal` (`fldindex`, `fldDatum`, `fldUhrzeit`, `fldPos`, `fldBez`, `fldArt`, `fldKonto`, `fldBetrag`, `fldInhaber`, `fldKtoart`, `fldFix`, `fldorgdatum`, `fldfremdbetrag`, `fldwaehrung`, `fldDetailind`, `fldUmbuchinhaber`, `fldsel`, `fldid_ort`, `fldtyp`, `fldfilename`, `fldcomputer`, `fldtimestamp`, `flddbsyncnr`, `flddel`) VALUES
(1473,	'2013-02-02',	'00:00:00',	0,	'Cappucino',	'',	'PRIVAT',	-3.60,	'CHRIS',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(1223,	'2013-01-02',	'00:00:00',	0,	'Kassensturz',	'U',	'UMBUCH',	0.00,	'CHRIS',	'VAL',	8.93,	'0000-00-00',	0.00,	'EURO',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(243,	'2010-04-07',	'00:00:00',	0,	'Kassensturz',	'U',	'UMBUCH',	11.00,	'CHRIS',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(253,	'2010-04-08',	'00:00:00',	0,	'Penny Lebensmittel',	'G',	'LEBEN',	-2.20,	'CHRIS',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(323,	'2012-02-29',	'00:00:00',	0,	'Kassensturz',	'P',	'UMBUCH',	42.21,	'CHRIS',	'VAL',	51.01,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(393,	'2012-05-02',	'00:00:00',	0,	'Kassensturz',	'U',	'UMBUCH',	4.76,	'CHRIS',	'VAL',	55.77,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(1463,	'2013-02-07',	'00:00:00',	0,	'Sonstige Ausgaben (Kassensturz)',	'',	'GUTSCHRI',	13.52,	'CHRIS',	'',	18.85,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(1474,	'2013-02-10',	'00:00:00',	0,	'Kassensturz',	'',	'UMBUCH',	6.59,	'FRIEDA',	'',	6.59,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(1483,	'2013-02-13',	'00:00:00',	0,	'Telefonrechnung Januar 2013',	'',	'TELEFON',	-2049.49,	'Netcologne',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(1533,	'2013-01-29',	'00:00:00',	0,	'Korrektur',	'',	'SONSTIGE',	42.32,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(1543,	'2013-01-28',	'00:00:00',	0,	'Abhebung',	'',	'ABHEBUNG',	50.00,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(4693,	'2013-01-31',	'00:00:00',	0,	'2401649130123124016491301231IHRE RECHNUNG VOM 23.0',	'P',	'AUTO',	-38.36,	'Bank_Horst',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(4703,	'2013-01-28',	'00:00:00',	0,	'28.01/12.13UHR 120  B.BNPGA NR00003457 BLZ37050299',	'P',	'ABHEBUNG',	-50.00,	'Bank_Horst',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(4713,	'2013-01-28',	'00:00:00',	0,	'ELV61302499 26.01 14.27 ME0KAUFLAND SAGT DANKE',	'P',	'EINKAUF',	-28.39,	'Bank_Horst',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(4723,	'2013-01-28',	'00:00:00',	0,	'EC 65443605 260113133011OC0ALDI SUED SAGT DANKE',	'P',	'EINKAUF',	-51.84,	'Bank_Horst',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(4733,	'2013-01-23',	'00:00:00',	0,	'23.01/12.14UHR 120  B.BNPGA NR00003456 BLZ37050299',	'P',	'ABHEBUNG',	-50.00,	'Bank_Horst',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(4743,	'2013-01-22',	'00:00:00',	0,	'22.01/12.15UHR 120  B.BNPGA NR00003456 BLZ37050299',	'P',	'ABHEBUNG',	-50.00,	'Bank_Horst',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(4753,	'2013-01-21',	'00:00:00',	0,	'EC 65443605 190113141633OC0ALDI SUED SAGT DANKE',	'P',	'EINKAUF',	-43.20,	'Bank_Horst',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(4763,	'2013-01-18',	'00:00:00',	0,	'VOM 16.01.2013 20.48 UHRMOBILFUNKNR016096700923CON',	'P',	'TELEFON',	-30.00,	'Bank_Horst',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(4773,	'2013-01-15',	'00:00:00',	0,	'KUNDENNR. 10412030RECHNUNG 12 2012DATUM 15.01.2013',	'P',	'TELEFON',	-96.40,	'Bank_Horst',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(4783,	'2013-01-15',	'00:00:00',	0,	'KAUTIONKD-NR. 401178DATUM 15.01.2013, 00.15 UHR1.T',	'P',	'AUTO',	-500.00,	'Bank_Horst',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(4793,	'2013-01-15',	'00:00:00',	0,	'TRÃ„GERANTEIL / ESSENSGELDDATUM 15.01.2013, 00.01 U',	'P',	'KIND',	-71.00,	'Bank_Horst',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(4803,	'2013-01-15',	'00:00:00',	0,	'MIETE + NEBENKOSTENDATUM 14.01.2013, 23.51 UHR1.TA',	'P',	'MIETE',	-950.00,	'Bank_Horst',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(4813,	'2013-01-14',	'00:00:00',	0,	'ELV61302148 12.01 20.58 ME0KAUFLAND SAGT DANKE',	'P',	'EINKAUF',	-74.08,	'Bank_Horst',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(4823,	'2013-01-14',	'00:00:00',	0,	'EC 65443575 120113162739OC0ALDI SUED SAGT DANKE',	'P',	'EINKAUF',	-47.28,	'Bank_Horst',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(4833,	'2013-01-14',	'00:00:00',	0,	'12.01/15.06UHR 740  NMFOYGA NR00003764 BLZ37050299',	'P',	'ABHEBUNG',	-100.00,	'Bank_Horst',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(4843,	'2013-01-10',	'00:00:00',	0,	'ZAHLUNGSBELEG 003530578941RGNR.10000495813047,94  ',	'P',	'HOMEPAGE',	-47.94,	'Bank_Horst',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(4853,	'2013-01-08',	'00:00:00',	0,	'050114030039643141230058290ELV65158989 05.01 14.03',	'P',	'EINKAUF',	-22.64,	'Bank_Horst',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(4863,	'2013-01-08',	'00:00:00',	0,	'VERDIENSTABRECHNUNG 12.12/1MAUSER-WERKE GMBH',	'P',	'GEHALTHORST',	2827.09,	'Bank_Horst',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'horald-Easynote',	'2015-09-01 15:59:57',	1,	'N'),
(4873,	'2013-01-08',	'00:00:00',	0,	'Benachrichtigungsentg.KREISSPARKASSE KOELN',	'P',	'GEBUEHR',	-3.00,	'Bank_Horst',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(4883,	'2013-01-08',	'00:00:00',	0,	'Benachrichtigungsentg.KREISSPARKASSE KOELN',	'P',	'GEBUEHR',	-3.00,	'Bank_Horst',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(4893,	'2013-01-04',	'00:00:00',	0,	'EC 71028375 02.01 07.48 CE0ARAL TST. KÃ–LN Ã„UÃŸERE-K',	'P',	'AUTO',	-37.50,	'Bank_Horst',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(4903,	'2013-01-02',	'00:00:00',	0,	'LS0000000651683KD.NR 215608HORST MEYERMERKENICHER ',	'P',	'STROM',	-72.00,	'Bank_Horst',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(4913,	'2013-01-02',	'00:00:00',	0,	'EC 60907777 311212091258OC0ADAC CM K LN',	'P',	'AUTO',	-109.00,	'Bank_Horst',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(4923,	'2013-01-02',	'00:00:00',	0,	'EC 65154571 311212100627OC0REWE SAGT DANKE  434000',	'P',	'EINKAUF',	-19.03,	'Bank_Horst',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(4933,	'2013-01-02',	'00:00:00',	0,	'EC 67022641 281212173130OC0C&amp',	'P',	'BEKL',	-24.25,	'Bank_Horst',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(4943,	'2013-01-02',	'00:00:00',	0,	'EC 65482548 281212174836OC0MEDIA MARKT DANKT 65482',	'P',	'EINKAUF',	-17.98,	'Bank_Horst',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(4953,	'2013-01-02',	'00:00:00',	0,	'GARAGENMIETEHILDEGARD HELFF',	'P',	'MIETE',	-30.00,	'Bank_Horst',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(6803,	'2012-12-31',	'00:00:00',	0,	'Anfangsbestand',	'',	'UMBUCH',	972.59,	'Bank_Horst',	'',	972.59,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'horald-Easynote',	'2015-09-01 16:06:37',	1,	'N'),
(6813,	'2013-01-14',	'00:00:00',	0,	'Abhebung',	'',	'ABHEBUNG',	100.00,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(6823,	'2013-01-22',	'00:00:00',	0,	'Abhebung',	'',	'ABHEBUNG',	50.00,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(6833,	'2013-01-23',	'00:00:00',	0,	'Abhebung',	'',	'ABHEBUNG',	50.00,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(6853,	'2012-12-31',	'00:00:00',	0,	'Anfangsbestand',	'',	'UMBUCH',	0.00,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(6863,	'2013-01-31',	'00:00:00',	0,	'Sonstiges',	'',	'SONSTIGE',	-250.00,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(6873,	'2012-12-31',	'00:00:00',	0,	'Anfangsbestand',	'',	'UMBUCH',	-46.84,	'CHRIS',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(6883,	'2012-12-31',	'00:00:00',	0,	'ÃœBERWEISUNG TARGOBANK TBOL AM 29 12 2012 UM 23 06 ',	'I',	'UMBUCH',	-8.40,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(6893,	'2012-12-31',	'00:00:00',	0,	'FUER DIE INANSPRUCHNAHME DES DISPOSITIONSKREDITES ',	'I',	'UMBUCH',	0.00,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(6903,	'2012-12-31',	'00:00:00',	0,	'GRUNDGEBÃœHR',	'I',	'UMBUCH',	0.00,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(6913,	'2013-01-02',	'00:00:00',	0,	'AUSFÃœHRUNG DAUERAUFTRAG AUFTRAGSNUMMER 0300005 BAD',	'I',	'SCHULDEN',	-150.00,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(6923,	'2013-01-02',	'00:00:00',	0,	'AUSFÃœHRUNG DAUERAUFTRAG AUFTRAGSNUMMER 0300004 STA',	'I',	'KIND',	-78.59,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(6933,	'2013-01-02',	'00:00:00',	0,	'AUSFÃœHRUNG DAUERAUFTRAG AUFTRAGSNUMMER 0300002 RUN',	'I',	'RUNDFUNK',	-53.94,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(6943,	'2013-01-02',	'00:00:00',	0,	'RESERV POS EUR 7 18 AUTORISIERUNGSNR 132742 REWE P',	'I',	'EINKAUF',	0.00,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(6953,	'2013-01-02',	'00:00:00',	0,	'GAA-AUSZAHLUNG 002636 1312 0395 GA NR00003595 BLZ37050198 028 12/08 07UHR MERKENICH EUR 25 00 00E2800004800001180028012 0FA508A030C000000000000000 0000000F101212180000000000 000000000000 D27600002547410100 0203006040201411026060 0002',	'I',	'ABHEBUNG',	-25.00,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(6963,	'2013-01-02',	'00:00:00',	0,	'POS MIT PIN F016757016757 00000 REWE SAGT DANKE 43',	'I',	'EINKAUF',	-15.72,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(6973,	'2013-01-02',	'00:00:00',	0,	'GEBÃœHR FÃœR GAA-AUSZAHLUNG',	'I',	'GEBUEHR',	-3.95,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(6983,	'2013-01-03',	'00:00:00',	0,	'GUTSCHRIFT PROMEUS AG ERMÃ„ÃŸIGUNG PUPPENBETT',	'I',	'GUTSCHRI',	1.79,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(6993,	'2013-01-03',	'00:00:00',	0,	'LASTSCHRIFT AMAZON DE 1874809423220513',	'I',	'EINKAUF',	-11.04,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(7003,	'2013-01-03',	'00:00:00',	0,	'POS MIT PIN F132742132742 00000 PENNY SAGT DANKE 3',	'I',	'EINKAUF',	-7.18,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(7023,	'2013-01-04',	'00:00:00',	0,	'LASTSCHRIFT OTTMAR SCHNEIDER MUSIKSCHULGEB HR JAN ',	'I',	'KIND',	-49.60,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(7033,	'2013-01-04',	'00:00:00',	0,	'LASTSCHRIFT PENNY SAGT DANKE 33300582 030111580132',	'I',	'EINKAUF',	-14.54,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(7053,	'2013-01-07',	'00:00:00',	0,	'GAA-AUSZAHLUNG 000313 1312 0395 GA NR00003595 BLZ37050198 004 01/13 36UHR MERKENICH EUR 25 00 00E6800004800001180028013 0FA508A030C000000000000000 0000000F101301020000000000 000000000000 D27600002547410100 0203006040201411026060 0002',	'I',	'ABHEBUNG',	-25.00,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(7063,	'2013-01-07',	'00:00:00',	0,	'GAA-AUSZAHLUNG 000573 1312 0395 GA NR00003538 BLZ37050198 006 01/14 39UHR ZOO KOELN EUR 25 00 00E8800004800001180028013 0FA508A030C000000000000000 0000000F101301040000000000 000000000000 D27600002547410100 0203006040201412259040 0002',	'I',	'ABHEBUNG',	-25.00,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(7073,	'2013-01-07',	'00:00:00',	0,	'GEBÃœHR FÃœR GAA-AUSZAHLUNG',	'I',	'GEBUEHR',	-3.95,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(7083,	'2013-01-07',	'00:00:00',	0,	'GEBÃœHR FÃœR GAA-AUSZAHLUNG',	'I',	'GEBUEHR',	-3.95,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(7093,	'2013-01-09',	'00:00:00',	0,	'LASTSCHRIFT AMAZON DE 1974392361019882',	'I',	'EINKAUF',	-13.80,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(7103,	'2013-01-10',	'00:00:00',	0,	'GUTSCHRIFT FAMILIENKASSE KG357357FK149064 0113 920',	'I',	'GUTSCHRI',	184.00,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(7123,	'2013-01-11',	'00:00:00',	0,	'RESERV POS EUR 14 48 AUTORISIERUNGSNR 133393 REWE ',	'I',	'EINKAUF',	0.00,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(7133,	'2013-01-11',	'00:00:00',	0,	'POS MIT PIN F166008166008 00000 C-A KÃ¯Â¿Â½LN EC 6702',	'I',	'KIND',	-34.00,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(7143,	'2013-01-14',	'00:00:00',	0,	'LASTSCHRIFT DEVK-GRUPPE 628004453288 VERTRAGSKONTO',	'I',	'VERSICHE',	-40.21,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(7153,	'2013-01-14',	'00:00:00',	0,	'LASTSCHRIFT DM DROGERIEMARKT SAGT DANKE 1001095001',	'I',	'EINKAUF',	-16.90,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(7163,	'2013-01-14',	'00:00:00',	0,	'POS MIT PIN F133393133393 00000 PENNY SAGT DANKE 3',	'I',	'EINKAUF',	-14.48,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(7183,	'2013-01-16',	'00:00:00',	0,	'GAA-AUSZAHLUNG 000724 1312 0395 GA NR00003595 BLZ37050198 015 01/11 24UHR MERKENICH EUR 20 00 00EC800004800001180028013 0FA508A030C000000000000000 0000000F101301110000000000 000000000000 D27600002547410100 0203006040201411026060 0002',	'I',	'ABHEBUNG',	-20.00,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(7193,	'2013-01-16',	'00:00:00',	0,	'GEBÃœHR FÃœR GAA-AUSZAHLUNG',	'I',	'GEBUEHR',	-3.95,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(7203,	'2013-01-17',	'00:00:00',	0,	'RESERV POS EUR 9 83 AUTORISIERUNGSNR 133840 REWE P',	'I',	'EINKAUF',	0.00,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(7213,	'2013-01-17',	'00:00:00',	0,	'LASTSCHRIFT PENNY SAGT DANKE 33300582 160109340133',	'I',	'EINKAUF',	-11.93,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(7223,	'2013-01-18',	'00:00:00',	0,	'LASTSCHRIFT AMAZON SERVICES EUROPE SA 213980822899',	'I',	'EINKAUF',	-12.90,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(7233,	'2013-01-18',	'00:00:00',	0,	'POS MIT PIN F133840133840 00000 PENNY SAGT DANKE 3',	'I',	'EINKAUF',	-9.83,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(7243,	'2013-01-21',	'00:00:00',	0,	'LASTSCHRIFT PENNY SAGT DANKE 33300582 180112590133',	'I',	'EINKAUF',	-6.64,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(7263,	'2013-01-23',	'00:00:00',	0,	'GAA-AUSZAHLUNG 008241 1312 0395 GA NR00003733 BLZ37050198 022 01/15 13UHR NIEHL EUR 10 00 00EF800004800001180028013 0FA508A030C000000000000000 0000000F101301170000000000 000000000000 D27600002547410100 0203006040201412259040 0002',	'I',	'ABHEBUNG',	-10.00,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(7273,	'2013-01-23',	'00:00:00',	0,	'GEBÃœHR FÃœR GAA-AUSZAHLUNG',	'I',	'GEBUEHR',	-3.95,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(7283,	'2013-01-24',	'00:00:00',	0,	'LASTSCHRIFT PENNY SAGT DANKE 33300582 230109060040',	'I',	'EINKAUF',	-15.82,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(7293,	'2013-01-28',	'00:00:00',	0,	'LASTSCHRIFT PENNY SAGT DANKE 33300582 250113100134',	'I',	'EINKAUF',	-15.57,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(7303,	'2013-01-29',	'00:00:00',	0,	'LASTSCHRIFT AMAZON DE 2736320565457042',	'I',	'EINKAUF',	-15.00,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(7313,	'2013-01-30',	'00:00:00',	0,	'LASTSCHRIFT PENNY SAGT DANKE 33300582 290111460134',	'I',	'EINKAUF',	-11.43,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(7323,	'2013-01-31',	'00:00:00',	0,	'LOHN / GEHALT / RENTE PERSONALAMT DER STADT KOELN ',	'I',	'GEHALTCH',	497.00,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(7333,	'2013-01-31',	'00:00:00',	0,	'LASTSCHRIFT AMAZON DE 1672908424740765',	'I',	'EINKAUF',	-18.99,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(7343,	'2013-01-31',	'00:00:00',	0,	'GRUNDGEBÃ¯Â¿Â½HR',	'I',	'GEBUEHR',	-5.60,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(9883,	'2013-02-01',	'00:00:00',	0,	'AUSFÃœHRUNG DAUERAUFTRAG AUFTRAGSNUMMER 0300004 STADTKASSE KOELN KONTO 37050198 / 0093102978 ELTERNBEITRAG FRIEDA LINA MEYER MO HLENWEG 2',	'I',	'KIND',	-78.59,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(9913,	'2013-02-01',	'00:00:00',	0,	'LASTSCHRIFT AMAZON DE 1235879556721240',	'I',	'EINKAUF',	-29.99,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(9923,	'2013-02-01',	'00:00:00',	0,	'LASTSCHRIFT AMAZON DE 0497729231509138',	'I',	'EINKAUF',	-11.98,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(9933,	'2013-02-01',	'00:00:00',	0,	'LASTSCHRIFT PENNY SAGT DANKE 33300582 310109420134723131230058290ELV65158990 31 01 09 42 ME0',	'I',	'EINKAUF',	-11.84,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(9953,	'2013-02-04',	'00:00:00',	0,	'AUSFÃœHRUNG DAUERAUFTRAG AUFTRAGSNUMMER 0300005 BAD HOMBURGER INKASSO GMBH KONTO 50050000 / 0014700009 GESCHÃ„FTSZEICHEN 1683389',	'I',	'SCHULDEN',	-150.00,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(9963,	'2013-02-04',	'00:00:00',	0,	'GAA-AUSZAHLUNG 000005 1312 0395 GA NR80870011 BLZ37160087 003 02/06 42UHR MERHEIM EUR 50 00 00F2800004800001180028013 0FA508A030C000000000000000 0000000F101302010000000000 000000000000 D27600002547410100 02030060402014001Y1406 0002',	'I',	'ABHEBUNG',	-50.00,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(9973,	'2013-02-04',	'00:00:00',	0,	'LASTSCHRIFT OTTMAR SCHNEIDER MUSIKSCHULGEB HR FEBR 13',	'I',	'KIND',	-49.60,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(9983,	'2013-02-04',	'00:00:00',	0,	'POS MIT PIN F134834134834 00000 PENNY SAGT DANKE 33300582 EC 65158990 010213110948OC0',	'I',	'EINKAUF',	-22.57,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(9993,	'2013-02-04',	'00:00:00',	0,	'GEBÃœHR FÃœR GAA-AUSZAHLUNG',	'I',	'GEBUEHR',	-3.95,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(10003,	'2013-02-05',	'00:00:00',	0,	'POS MIT PIN F011688011688 00000 APOTHEKEMERKENICH EC 65398675 010213104904OC0',	'I',	'MED',	-10.87,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(10033,	'2013-02-07',	'00:00:00',	0,	'LASTSCHRIFT PENNY SAGT DANKE 33300582 060215260135196131230058290ELV65158990 06 02 15 26 ME0',	'I',	'EINKAUF',	-17.76,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(10053,	'2013-02-08',	'00:00:00',	0,	'POS MIT PIN F135233135233 00000 PENNY SAGT DANKE 33300582 EC 65158990 070213092528OC0',	'I',	'EINKAUF',	-12.98,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(10063,	'2013-02-08',	'00:00:00',	0,	'LASTSCHRIFT AMAZON SERVICES EUROPE SA 3006818706411690',	'I',	'EINKAUF',	-9.99,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(10073,	'2013-02-08',	'00:00:00',	0,	'RÃ¯Â¿Â½CKGABE LASTSCHRIFT MANGELS DECKUNG 3006818706411690',	'I',	'RUECKBUCHUNG',	9.99,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(10093,	'2013-02-11',	'00:00:00',	0,	'GUTSCHRIFT BUNDESAGENTUR FUER ARBEIT-S KG357357FK149064 0213620102N DE 94193 30 00043609926/ERST MARKDEF1760/CREF 62010294193 /ADRS RASSE 104 90478 NUERNBERG DE ERVICE-HAUS REGENSBURGER ST',	'I',	'GUTSCHRIFT',	184.00,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(10103,	'2013-02-11',	'00:00:00',	0,	'LASTSCHRIFT PENNY SAGT DANKE 33300582 080209080135320131230058290ELV65158990 08 02 09 08 ME0',	'I',	'EINKAUF',	-22.37,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(10113,	'2013-02-11',	'00:00:00',	0,	'POS MIT PIN F011755011755 00000 APOTHEKEMERKENICH EC 65398675 070213112107OC0',	'I',	'MED',	-21.22,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(10133,	'2013-02-13',	'00:00:00',	0,	'LASTSCHRIFT DEVK-GRUPPE 622004470127 VERTRAGSKONTO Z00006939535 DEVK-GRUPPE SAGT DANKE',	'I',	'VERSICHERUNG',	-40.21,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(10143,	'2013-02-13',	'00:00:00',	0,	'LASTSCHRIFT PENNY SAGT DANKE 33300582 120209250135514131230058290ELV65158990 12 02 09 25 ME0',	'I',	'EINKAUF',	-22.25,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(10163,	'2013-02-14',	'00:00:00',	0,	'POS MIT PIN F135593135593 00000 PENNY SAGT DANKE 33300582 EC 65158990 130213090605OC0',	'I',	'EINKAUF',	-10.29,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(10173,	'2013-02-15',	'00:00:00',	0,	'GAA-AUSZAHLUNG 000295 1312 0395 GA NR00003595 BLZ37050198 014 02/13 39UHR MERKENICH EUR 50 00 00F8800004800001180028013 0FA508A030C000000000000000 0000000F101302130000000000 000000000000 D27600002547410100 0203006040201411026060 0002',	'I',	'ABHEBUNG',	-50.00,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(10183,	'2013-02-15',	'00:00:00',	0,	'GEBÃœHR FÃœR GAA-AUSZAHLUNG',	'I',	'GEBUEHR',	-3.95,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(10203,	'2013-02-18',	'00:00:00',	0,	'POS MIT PIN F003635003635 00000 AKZENTE EC 65303741 080213114740OC0',	'I',	'GESCH',	-12.95,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(10213,	'2013-02-19',	'00:00:00',	0,	'POS MIT PIN F040967040967 00000 PENNY SAGT DANKE 33300582 EC 65158989 180213132017OC0',	'I',	'EINKAUF',	-10.61,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(10233,	'2013-02-20',	'00:00:00',	0,	'LASTSCHRIFT PENNY SAGT DANKE 33300582 190208430136056131230058290ELV65158990 19 02 08 43 ME0',	'I',	'EINKAUF',	-16.96,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(10243,	'2013-02-20',	'00:00:00',	0,	'RÃ¯Â¿Â½CKGABE LASTSCHRIFT MANGELS DECKUNG 190208430136056131230058290ELV65158990 19 02 08 43 ME0',	'I',	'RUECKBUCHUNG',	16.96,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(10263,	'2013-02-21',	'00:00:00',	0,	'POS MIT PIN F136159136159 00000 PENNY SAGT DANKE 33300582 EC 65158990 200213092744OC0',	'I',	'EINKAUF',	-13.18,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(10273,	'2013-02-22',	'00:00:00',	0,	'LASTSCHRIFT PENNY SAGT DANKE 33300582 210209200136245131230058290ELV65158990 21 02 09 20 ME0',	'I',	'EINKAUF',	-16.67,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(8293,	'2012-12-31',	'00:00:00',	0,	'Anfangsbestand',	'',	'UMBUCH',	560.96,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(8303,	'2013-03-25',	'00:00:00',	0,	'Abhebung',	'',	'ABHEBUNG',	100.00,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(8313,	'2013-03-25',	'00:00:00',	0,	'Geld an Chris',	'',	'UMBUCH',	-50.00,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(8323,	'2013-03-25',	'00:00:00',	0,	'Sonstige Ausgaben',	'',	'SONSTIGES',	-39.59,	'HORST',	'',	53.10,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(8333,	'2013-03-25',	'00:00:00',	0,	'Geld von Horst',	'',	'UMBUCH',	50.00,	'CHRIS',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(8343,	'2013-03-25',	'00:00:00',	0,	'Sonstige Ausgaben',	'',	'SONSTIGE',	-15.50,	'CHRIS',	'',	53.35,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(8363,	'2013-03-23',	'00:00:00',	0,	'Aldi Einkauf',	'G',	'HAUSHALT',	-3.11,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(8373,	'2013-03-23',	'00:00:00',	0,	'Aldi Einkauf',	'G',	'LEBEN',	-52.08,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(8383,	'2013-03-23',	'00:00:00',	0,	'Aldi Einkauf',	'G',	'PFAND',	-3.00,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(8393,	'2013-03-23',	'00:00:00',	0,	'cafe Einkauf',	'G',	'AUSFLUG',	-10.00,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(8403,	'2013-03-23',	'00:00:00',	0,	'Kaufland Einkauf',	'G',	'GESCH',	-8.37,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(8413,	'2013-03-23',	'00:00:00',	0,	'Kaufland Einkauf',	'G',	'HAUSHALT',	-7.48,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(8423,	'2013-03-23',	'00:00:00',	0,	'Kaufland Einkauf',	'G',	'KIND',	-3.73,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(8433,	'2013-03-23',	'00:00:00',	0,	'Kaufland Einkauf',	'G',	'LEBEN',	-7.16,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(8443,	'2013-03-23',	'00:00:00',	0,	'Kaufland Einkauf',	'G',	'PFLEG',	-1.75,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(8453,	'2013-03-27',	'00:00:00',	0,	'Ostergeschenke (BÃƒÂ¼cher)',	'',	'GESCH',	-10.75,	'CHRIS',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(8463,	'2013-03-27',	'00:00:00',	0,	'Sonstige Einnahmen',	'',	'GUTSCHRI',	0.84,	'CHRIS',	'',	43.44,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(8473,	'2013-03-30',	'00:00:00',	0,	'Aldi Einkauf',	'',	'HAUSHALT',	-0.99,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(8483,	'2013-03-30',	'00:00:00',	0,	'Aldi Einkauf',	'',	'LEBEN',	-40.58,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(8493,	'2013-03-30',	'00:00:00',	0,	'Aldi Lastschrift',	'',	'LASTSCHRIFT',	41.57,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(8503,	'2013-03-30',	'00:00:00',	0,	'Kaufland Einkauf',	'',	'HAUSHALT',	-0.75,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(8513,	'2013-03-30',	'00:00:00',	0,	'Kaufland Einkauf',	'',	'KIND',	-1.99,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(8523,	'2013-03-30',	'00:00:00',	0,	'Kaufland Einkauf',	'',	'LEBEN',	-14.65,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(8533,	'2013-03-30',	'00:00:00',	0,	'Kaufland Einkauf',	'',	'PFAND',	-3.00,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(8543,	'2013-03-30',	'00:00:00',	0,	'Kaufland Einkauf',	'',	'PFLEG',	-0.95,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(8553,	'2013-03-30',	'00:00:00',	0,	'Kaufland Lastschrift',	'',	'LASTSCHRIFT',	21.34,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(8563,	'2013-03-30',	'00:00:00',	0,	'Penny Einkauf',	'',	'LEBEN',	-9.41,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(8573,	'2013-03-30',	'00:00:00',	0,	'Penny Einkauf',	'',	'PFAND',	-1.50,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(8583,	'2013-03-23',	'00:00:00',	0,	'Aldi Lastschrift',	'',	'LASTSCHR',	58.19,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(8593,	'2013-03-23',	'00:00:00',	0,	'Kaufland Lastschrift',	'',	'LASTSCHRIFT',	28.49,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(8603,	'2013-04-02',	'00:00:00',	0,	'Sonstige Ausgaben (Kassensturz)',	'',	'SONSTIGES',	-31.64,	'HORST',	'',	10.55,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(8613,	'2013-04-02',	'00:00:00',	0,	'Sonstige Einnahmen',	'',	'GUTSCHRIFT',	26.82,	'CHRIS',	'',	70.26,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(8623,	'2013-04-03',	'00:00:00',	0,	'Abhebung',	'',	'ABHEBUNG',	50.00,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(8633,	'2013-04-03',	'00:00:00',	0,	'Badminton',	'',	'SPORT',	-6.00,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(8643,	'2013-04-03',	'00:00:00',	0,	'Sonstige Ausgaben (Kassensturz)',	'',	'SONSTIGES',	0.00,	'HORST',	'',	42.01,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(8653,	'2013-04-03',	'00:00:00',	0,	'Batterien und Stopfpilz',	'',	'HAUSHALT',	-9.59,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(8663,	'2013-04-03',	'00:00:00',	0,	'Deo',	'',	'PFLEG',	-2.95,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(9023,	'2013-03-01',	'00:00:00',	0,	'Rate',	'',	'TELEFON',	350.00,	'Netcologne',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(9033,	'2013-04-01',	'00:00:00',	0,	'Rate',	'',	'TELEFON',	100.00,	'Netcologne',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(9043,	'2013-05-01',	'00:00:00',	0,	'Rate',	'',	'TELEFON',	100.00,	'Netcologne',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(9053,	'2013-06-01',	'00:00:00',	0,	'Rate',	'',	'TELEFON',	100.00,	'Netcologne',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(9063,	'2013-07-01',	'00:00:00',	0,	'Rate',	'',	'TELEFON',	100.00,	'Netcologne',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(9073,	'2013-08-01',	'00:00:00',	0,	'Rate',	'',	'TELEFON',	100.00,	'Netcologne',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(9083,	'2013-09-01',	'00:00:00',	0,	'Rate',	'',	'TELEFON',	100.00,	'Netcologne',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(9093,	'2013-10-01',	'00:00:00',	0,	'Rate',	'',	'TELEFON',	100.00,	'Netcologne',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(9103,	'2013-11-01',	'00:00:00',	0,	'Rate',	'',	'TELEFON',	100.00,	'Netcologne',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(9113,	'2013-12-01',	'00:00:00',	0,	'Rate',	'',	'TELEFON',	100.00,	'Netcologne',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(9123,	'2014-01-01',	'00:00:00',	0,	'Rate',	'',	'TELEFON',	100.00,	'Netcologne',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(9133,	'2014-02-01',	'00:00:00',	0,	'Rate',	'',	'TELEFON',	100.00,	'Netcologne',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(9143,	'2014-03-01',	'00:00:00',	0,	'Rate',	'',	'TELEFON',	100.00,	'Netcologne',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(9153,	'2014-04-01',	'00:00:00',	0,	'Rate',	'',	'TELEFON',	100.00,	'Netcologne',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(9163,	'2014-05-01',	'00:00:00',	0,	'Rate',	'',	'TELEFON',	100.00,	'Netcologne',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(9173,	'2014-06-01',	'00:00:00',	0,	'Rate',	'',	'TELEFON',	100.00,	'Netcologne',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(9183,	'2014-07-01',	'00:00:00',	0,	'Rate',	'',	'TELEFON',	100.00,	'Netcologne',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(9193,	'2014-08-01',	'00:00:00',	0,	'Rate',	'',	'TELEFON',	99.49,	'Netcologne',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(9203,	'2013-04-07',	'00:00:00',	0,	'Spende',	'',	'SPENDE',	-2.20,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(9213,	'2013-04-07',	'00:00:00',	0,	'Flutschfinger',	'',	'KIND',	-1.50,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(9223,	'2013-04-07',	'00:00:00',	0,	'Pommes',	'',	'FAMILIE',	-2.90,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(9233,	'2013-04-07',	'00:00:00',	0,	'Eis',	'',	'KIND',	-1.90,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(9243,	'2013-04-06',	'00:00:00',	0,	'Abhebung',	'',	'ABHEBUNG',	50.00,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(9253,	'2013-04-06',	'00:00:00',	0,	'Kaufland Lastschrift',	'',	'LASTSCHRIFT',	16.91,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(9263,	'2013-04-06',	'00:00:00',	0,	'Kaufland Einkauf',	'',	'HAUSHALT',	-5.90,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(9273,	'2013-04-06',	'00:00:00',	0,	'Kaufland Einkauf',	'',	'KIND',	-4.98,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(9283,	'2013-04-06',	'00:00:00',	0,	'Kaufland Einkauf',	'',	'LEBEN',	-1.68,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(9293,	'2013-04-06',	'00:00:00',	0,	'Kaufland Einkauf',	'',	'PFAND',	-0.25,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(9303,	'2013-04-06',	'00:00:00',	0,	'Kaufland Einkauf',	'',	'PFLEG',	-4.10,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(9313,	'2013-04-06',	'00:00:00',	0,	'Aldi Lastschrift',	'',	'LASTSCHRIFT',	56.46,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(9323,	'2013-04-06',	'00:00:00',	0,	'Aldi Einkauf',	'',	'KIND',	-0.29,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(9333,	'2013-04-06',	'00:00:00',	0,	'Aldi Einkauf',	'',	'LEBEN',	-53.17,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(9343,	'2013-04-06',	'00:00:00',	0,	'Aldi Einkauf',	'',	'PFAND',	-3.00,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(9353,	'2013-04-13',	'00:00:00',	0,	'Penny Lastschrift',	'',	'LASTSCHRIFT',	36.65,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(9363,	'2013-04-13',	'00:00:00',	0,	'Penny Einkauf',	'',	'LEBEN',	-35.15,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(9373,	'2013-04-13',	'00:00:00',	0,	'Penny Einkauf',	'',	'PFAND',	-1.50,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(9383,	'2013-04-13',	'00:00:00',	0,	'Kaufland Lastschrift',	'',	'LASTSCHRIFT',	8.34,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(9393,	'2013-04-13',	'00:00:00',	0,	'Kaufland Einkauf',	'',	'HAUSHALT',	-3.90,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(9403,	'2013-04-13',	'00:00:00',	0,	'Kaufland Einkauf',	'',	'LEBEN',	-4.44,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(9453,	'2013-03-03',	'00:00:00',	0,	'Kautionsvorlage',	'',	'PRIVAT',	-600.00,	'Bar_Papa',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(9463,	'2013-03-03',	'00:00:00',	0,	'Kautionsvorlage',	'',	'PRIVAT',	600.00,	'Bar_Horst',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(9473,	'2013-05-04',	'00:00:00',	0,	'Penny Lastschrift',	'',	'LASTSCHRIFT',	23.22,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(9483,	'2013-05-04',	'00:00:00',	0,	'Penny Einkauf',	'',	'HAUSHALT',	-0.66,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(9493,	'2013-05-04',	'00:00:00',	0,	'Penny Einkauf',	'',	'LEBEN',	-22.06,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(9503,	'2013-05-04',	'00:00:00',	0,	'Penny Einkauf',	'',	'PFAND',	-0.50,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(9513,	'2013-05-04',	'00:00:00',	0,	'Sonstige Ausgaben (Kassensturz)',	'',	'SONSTIGES',	0.00,	'HORST',	'',	9.78,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(9523,	'2013-05-05',	'00:00:00',	0,	'Spende',	'',	'SPENDE',	-2.50,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(9533,	'2013-05-05',	'00:00:00',	0,	'faire Banane',	'',	'KIND',	-0.55,	'HORST',	'',	6.73,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(9543,	'2013-05-05',	'00:00:00',	0,	'BrÃƒÂ¶tchen',	'',	'LEBEN',	-2.72,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(9553,	'2013-05-05',	'00:00:00',	0,	'vorzeitiges Geburtstagsgeschenk',	'',	'PRAESENT',	100.00,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(9563,	'2013-01-26',	'00:00:00',	0,	'Kaufland Lastschrift',	'',	'LASTSCHRIFT',	28.39,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(9573,	'2013-01-26',	'00:00:00',	0,	'Kaufland Einkauf',	'',	'HAUSHALT',	-7.54,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(9583,	'2013-01-26',	'00:00:00',	0,	'Kaufland Einkauf',	'',	'KIND',	-5.57,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(9593,	'2013-01-26',	'00:00:00',	0,	'Kaufland Einkauf',	'',	'LEBEN',	-12.03,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(9603,	'2013-01-26',	'00:00:00',	0,	'Kaufland Einkauf',	'',	'PFAND',	-1.50,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(9613,	'2013-01-26',	'00:00:00',	0,	'Kaufland Einkauf',	'',	'PFLEG',	-1.75,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(9623,	'2013-01-26',	'00:00:00',	0,	'Aldi Lastschrift',	'',	'LASTSCHRIFT',	51.84,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(9633,	'2013-01-26',	'00:00:00',	0,	'Aldi Einkauf',	'',	'HAUSHALT',	-1.35,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(9643,	'2013-01-26',	'00:00:00',	0,	'Aldi Einkauf',	'',	'LEBEN',	-48.99,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(9653,	'2013-01-26',	'00:00:00',	0,	'Aldi Einkauf',	'',	'PFAND',	-1.50,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(9663,	'2013-05-09',	'00:00:00',	0,	'Waffeln, Apfelschorle',	'',	'AUSFLUG',	-2.50,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(9673,	'2013-05-09',	'00:00:00',	0,	'Eis',	'',	'AUSFLUG',	-6.00,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(9683,	'2013-05-08',	'00:00:00',	0,	'Schirm',	'',	'BEKL',	-19.99,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(9693,	'2013-05-08',	'00:00:00',	0,	'Armbanduhr',	'',	'BEKL',	-14.99,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(9703,	'2013-05-08',	'00:00:00',	0,	'Verpflegung',	'',	'LEBEN',	-2.03,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(9713,	'2013-05-07',	'00:00:00',	0,	'GetrÃƒÂ¤nk',	'',	'LEBEN',	-3.84,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(9723,	'2013-05-06',	'00:00:00',	0,	'Prepaid',	'',	'TELEFON',	-30.00,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(9733,	'2013-05-06',	'00:00:00',	0,	'zahnbÃƒÂ¼rste',	'',	'PFLEG',	-1.95,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(9743,	'2013-05-06',	'00:00:00',	0,	'gemÃƒÂ¼se ravioli',	'',	'LEBEN',	-1.95,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(9753,	'2013-04-30',	'00:00:00',	0,	'Sonstige Ausgaben (Kassensturz)',	'',	'SONSTIGES',	-73.73,	'HORST',	'',	9.78,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(9763,	'2013-05-11',	'00:00:00',	0,	'GetrÃƒÂ¤nke',	'',	'AUSFLUG',	-5.10,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(9773,	'2013-05-11',	'00:00:00',	0,	'Lose',	'',	'GESCH',	-2.00,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(9783,	'2013-05-11',	'00:00:00',	0,	'Spargel',	'',	'HAUSHALT',	-6.80,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(9793,	'2013-05-11',	'00:00:00',	0,	'Motorrad',	'',	'KIND',	-0.50,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(9813,	'2013-05-11',	'00:00:00',	0,	'Einkaufseuro',	'',	'UMBUCH',	-1.00,	'HORST',	'',	5.36,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(9823,	'2013-05-12',	'00:00:00',	0,	'Spende',	'',	'SPENDE',	-3.00,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(9833,	'2013-05-12',	'00:00:00',	0,	'Abhebung',	'',	'ABHEBUNG',	50.00,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(9843,	'2013-05-12',	'00:00:00',	0,	'GetrÃƒÂ¤nke Altenbergerhof',	'',	'AUSFLUG',	-12.00,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(9853,	'2013-05-13',	'00:00:00',	0,	'NachthÃƒÂ¶schen',	'',	'KIND',	-9.99,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(9863,	'2013-05-14',	'00:00:00',	0,	'Einschreiben bnetza',	'',	'POST',	-3.00,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(9873,	'2013-05-14',	'00:00:00',	0,	'Einkauf Netto',	'',	'LEBEN',	-7.00,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(10283,	'2013-02-22',	'00:00:00',	0,	'RÃ¯Â¿Â½CKGABE LASTSCHRIFT MANGELS DECKUNG 210209200136245131230058290ELV65158990 21 02 09 20 ME0',	'I',	'RUECKBUCHUNG',	16.67,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(10313,	'2013-02-26',	'00:00:00',	0,	'GUTSCHRIFT HORST MEYER GELDGESCHENK',	'I',	'GUTSCHRIFT',	100.00,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(10333,	'2013-02-26',	'00:00:00',	0,	'LASTSCHRIFT ZOOLOGISCHER GARTEN KOELN 233005712301224830 VERLÃ¯Â¿Â½NGERUNG',	'I',	'VERGNUEGEN',	-75.00,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(10343,	'2013-02-26',	'00:00:00',	0,	'POS MIT PIN F136547136547 00000 PENNY SAGT DANKE 33300582 EC 65158990 250213092249OC0',	'I',	'EINKAUF',	-12.00,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(10363,	'2013-02-27',	'00:00:00',	0,	'GAA-AUSZAHLUNG 001223 1312 0395 GA NR00003595 BLZ37050198 026 02/09 20UHR MERKENICH EUR 5 00 00FD800004800001180028013 0FA508A030C000000000000000 0000000F101302250000000000 000000000000 D27600002547410100 0203006040201411026060 0002',	'I',	'ABHEBUNG',	-5.00,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(10373,	'2013-02-27',	'00:00:00',	0,	'GEBÃœHR FÃœR GAA-AUSZAHLUNG',	'I',	'GEBUEHR',	-3.95,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(10383,	'2013-02-28',	'00:00:00',	0,	'LOHN / GEHALT / RENTE PERSONALAMT DER STADT KOELN LOHN/GEHALT 09202800/201302* KLINIKEN',	'I',	'GEHALTCHRIS',	497.00,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(10403,	'2013-02-28',	'00:00:00',	0,	'LASTSCHRIFT PENNY SAGT DANKE 33300582 190208430136056131230058290KAUFBETRAG 16 96 EUR + GEBUEHREN 25 46 EUR AUS LASTSCHRIFT',	'I',	'EINKAUF',	-25.46,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(10413,	'2013-02-28',	'00:00:00',	0,	'GRUNDGEBÃ¯Â¿Â½HR',	'I',	'GEBUEHR',	-5.60,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(11773,	'2013-03-01',	'00:00:00',	0,	'AUSFÃœHRUNG DAUERAUFTRAG AUFTRAGSNUMMER 0300004 STADTKASSE KOELN KONTO 37050198 / 0093102978 ELTERNBEITRAG FRIEDA LINA MEYER MO HLENWEG 2',	'I',	'KIND',	-78.59,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(11783,	'2013-03-01',	'00:00:00',	0,	'POS MIT PIN F136843136843 00000 PENNY SAGT DANKE 33300582 EC 65158990 280213142201OC0',	'I',	'EINKAUF',	-19.40,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(11793,	'2013-03-04',	'00:00:00',	0,	'AUSFÃœHRUNG DAUERAUFTRAG AUFTRAGSNUMMER 0300005 BAD HOMBURGER INKASSO GMBH KONTO 50050000 / 0014700009 GESCHÃ„FTSZEICHEN 1683389',	'I',	'SCHULDEN',	-150.00,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(11803,	'2013-03-04',	'00:00:00',	0,	'LASTSCHRIFT OTTMAR SCHNEIDER MUSIKSCHULGEB HR M RZ 13',	'I',	'KIND',	-49.60,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(11813,	'2013-03-05',	'00:00:00',	0,	'GAA-AUSZAHLUNG 000012 1312 0395 GA NR00003538 BLZ37050198 004 03/12 46UHR ZOO KOELN EUR 50 00 0100800004800001180028013 0FA508A030C000000000000000 0000000F101302280000000000 000000000000 D27600002547410100 0203006040201412259040 0002',	'I',	'ABHEBUNG',	-50.00,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(11823,	'2013-03-05',	'00:00:00',	0,	'GEBÃœHR FÃœR GAA-AUSZAHLUNG',	'I',	'GEBUEHR',	-3.95,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(11833,	'2013-03-08',	'00:00:00',	0,	'LASTSCHRIFT PENNY SAGT DANKE 33300582 070312010000790131256000213',	'I',	'EINKAUF',	-14.19,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(11843,	'2013-03-08',	'00:00:00',	0,	'LASTSCHRIFT AMAZON DE 0489240864806585',	'I',	'EINKAUF',	-11.90,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(11853,	'2013-03-08',	'00:00:00',	0,	'POS MIT PIN F000067000067 00000 PENNY SAGT DANKE 33300582 EC 56000212 070313195414OC0',	'I',	'EINKAUF',	-7.03,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(11863,	'2013-03-08',	'00:00:00',	0,	'LASTSCHRIFT AMAZON SERVICES EUROPE SA 2521471822670963',	'I',	'EINKAUF',	-5.10,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(11873,	'2013-03-11',	'00:00:00',	0,	'GUTSCHRIFT BUNDESAGENTUR FUER ARBEIT - KG357357FK149064 0313420113N DE 15327 30 00043609926/ERST MARKDEF1760/CREF 42011315327 /ADRS STRASSE 104 90478 NUERNBERG DE FAMILIENKASSE REGENSBURGER',	'I',	'GUTSCHRIFT',	184.00,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(11883,	'2013-03-11',	'00:00:00',	0,	'POS MIT PIN F092471092471 00000 DEUTSCHE BAHN KOELN HBF EC 59082923 090313095235OC0',	'I',	'FAHR',	-42.00,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(11893,	'2013-03-12',	'00:00:00',	0,	'GUTSCHRIFT HORST MEYER GELDGESCHENK',	'I',	'GUTSCHRIFT',	100.00,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(11903,	'2013-03-12',	'00:00:00',	0,	'LASTSCHRIFT AMAZON SERVICES EUROPE SA 0821084556734666',	'I',	'EINKAUF',	-22.94,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(11913,	'2013-03-12',	'00:00:00',	0,	'POS MIT PIN F229016229016 00000 DM DROGERIEMARKT SAGT DANKEEC 65131369 090313154200OC0',	'I',	'EINKAUF',	-22.55,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(11923,	'2013-03-13',	'00:00:00',	0,	'LASTSCHRIFT DEVK-GRUPPE 590005697675 VERTRAGSKONTO Z00006939535 DEVK-GRUPPE SAGT DANKE',	'I',	'VERSICHERUNG',	-40.21,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(11933,	'2013-03-15',	'00:00:00',	0,	'GUTSCHRIFT AMAZON SERVICES EUROPE SARL 0190961114618629',	'I',	'GUTSCHRIFT',	8.44,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(11943,	'2013-03-15',	'00:00:00',	0,	'POS MIT PIN F000731000731 00000 PENNY SAGT DANKE 33300582 EC 56000213 140313154041OC0',	'I',	'EINKAUF',	-5.42,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(11953,	'2013-03-18',	'00:00:00',	0,	'POS MIT PIN F000928000928 00000 PENNY SAGT DANKE 33300582 EC 56000213 150313185156OC0',	'I',	'EINKAUF',	-33.27,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(11963,	'2013-03-18',	'00:00:00',	0,	'LASTSCHRIFT PENNY SAGT DANKE 33300582 150309390008140131256000213',	'I',	'EINKAUF',	-17.34,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(11973,	'2013-03-19',	'00:00:00',	0,	'POS MIT PIN F001120001120 00000 PENNY SAGT DANKE 33300582 EC 56000213 180313090501OC0',	'I',	'EINKAUF',	-15.79,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(11983,	'2013-03-19',	'00:00:00',	0,	'POS MIT PIN F012090012090 00000 APOTHEKEMERKENICH EC 65398675 150313152134OC0',	'I',	'MED',	-15.15,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(11993,	'2013-03-20',	'00:00:00',	0,	'GAA-AUSZAHLUNG 219502 1312 0195 GA NR00002098 BLZ37040044 019 03/14 58UHR K-EBERT 15 EUR 50 00 0110800004808001180028013 0FA508A030C000000000000000 0000000F101303180000000000 000000000000 D2760000254741010000000000000000 0203006040201420081691 0002',	'I',	'ABHEBUNG',	-50.00,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(12003,	'2013-03-20',	'00:00:00',	0,	'LASTSCHRIFT PENNY SAGT DANKE 33300582 190310580012170131256000213',	'I',	'EINKAUF',	-20.75,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(12013,	'2013-03-20',	'00:00:00',	0,	'GEBÃœHR FÃœR GAA-AUSZAHLUNG',	'I',	'GEBUEHR',	-1.95,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(12023,	'2013-03-21',	'00:00:00',	0,	'Ã¯Â¿Â½BERWEISUNG TARGOBANK TBOL AM 21 03 2013 UM 05 01 12 13/0 MARCUS BRASSAT KONTO 20069782/0059792900 LILLIFEE BETTWÃ¯Â¿Â½SCHE',	'I',	'KIND',	-13.89,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(12033,	'2013-03-22',	'00:00:00',	0,	'POS MIT PIN F121765121765 00000 ALDI SUED SAGT DANKE EC 65443421 210313111130OC0',	'I',	'EINKAUF',	-13.94,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(12043,	'2013-03-25',	'00:00:00',	0,	'LASTSCHRIFT PENNY SAGT DANKE 33300582 220309280015300131256000213',	'I',	'EINKAUF',	-22.55,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(12053,	'2013-03-27',	'00:00:00',	0,	'LASTSCHRIFT PENNY SAGT DANKE 33300582 260309380018520131256000213',	'I',	'EINKAUF',	-28.15,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(12063,	'2013-03-27',	'00:00:00',	0,	'RÃ¯Â¿Â½CKGABE LASTSCHRIFT MANGELS DECKUNG 260309380018520131256000213',	'I',	'RUECKBUCHUNG',	28.15,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(12073,	'2013-03-28',	'00:00:00',	0,	'LOHN / GEHALT / RENTE PERSONALAMT DER STADT KOELN LOHN/GEHALT 09202800/201303* KLINIKEN',	'I',	'GEHALTCHRIS',	653.00,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(12083,	'2013-03-28',	'00:00:00',	0,	'LASTSCHRIFT PENNY SAGT DANKE 33300582 210209200136245131230058290KAUFBETRAG 16 67 EUR + GEBUEHREN 25 17 EUR AUS LASTSCHRIFT',	'I',	'EINKAUF',	-25.17,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(12093,	'2013-03-28',	'00:00:00',	0,	'GAA-AUSZAHLUNG 000033 1312 0395 GA NR00003595 BLZ37050198 027 03/09 29UHR MERKENICH EUR 25 00 0113800004800001180028013 0FA508A030C000000000000000 0000000F101303210000000000 000000000000 D27600002547410100 0203006040201411026060 0002',	'I',	'ABHEBUNG',	-25.00,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(12103,	'2013-03-28',	'00:00:00',	0,	'GEBÃœHR FÃœR GAA-AUSZAHLUNG',	'I',	'GEBUEHR',	-3.95,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(12113,	'2013-03-28',	'00:00:00',	0,	'GRUNDGEBÃ¯Â¿Â½HR',	'I',	'GEBUEHR',	-5.60,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(12123,	'2013-04-02',	'00:00:00',	0,	'AUSFÃœHRUNG DAUERAUFTRAG AUFTRAGSNUMMER 0300005 BAD HOMBURGER INKASSO GMBH KONTO 50050000 / 0014700009 GESCHÃ„FTSZEICHEN 1683389',	'I',	'SCHULDEN',	-150.00,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(12133,	'2013-04-02',	'00:00:00',	0,	'AUSFÃœHRUNG DAUERAUFTRAG AUFTRAGSNUMMER 0300004 STADTKASSE KOELN KONTO 37050198 / 0093102978 ELTERNBEITRAG FRIEDA LINA MEYER MO HLENWEG 2',	'I',	'KIND',	-78.59,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(12143,	'2013-04-02',	'00:00:00',	0,	'AUSFÃœHRUNG DAUERAUFTRAG AUFTRAGSNUMMER 0300002 RUNDFUNK ARD ZDF DRADIO KONTO 30050000 / 0001111111 RUNDFUNKGEBÃœHREN TEILNEHMERNUMMER 1 22 418 615',	'I',	'RUNDFUNK',	-53.94,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(12153,	'2013-04-02',	'00:00:00',	0,	'GAA-AUSZAHLUNG 000428 1312 0395 GA NR00003595 BLZ37050198 028 03/13 25UHR MERKENICH EUR 50 00 0115800004800001180028013 0FA508A030C000000000000000 0000000F101303270000000000 000000000000 D27600002547410100 0203006040201411026060 0002',	'I',	'ABHEBUNG',	-50.00,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(12163,	'2013-04-02',	'00:00:00',	0,	'GEBÃœHR FÃœR GAA-AUSZAHLUNG',	'I',	'GEBUEHR',	-3.95,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(12173,	'2013-04-03',	'00:00:00',	0,	'ÃœBERWEISUNG TARGOBANK TBOL AM 03 04 2013 UM 11 54 12 13/0 NETCOLOGNE KONTO 37050198/0002462950 KUNDEN NR 10412030',	'I',	'TELEFON',	-100.00,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(12183,	'2013-04-03',	'00:00:00',	0,	'LASTSCHRIFT OTTMAR SCHNEIDER MUSIKSCHULGEB HR APRIL 13',	'I',	'KIND',	-49.60,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(12193,	'2013-04-04',	'00:00:00',	0,	'POS MIT PIN F002463002463 00000 PENNY SAGT DANKE 33300582 EC 56000213 030413092735OC0',	'I',	'EINKAUF',	-18.72,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(12203,	'2013-04-09',	'00:00:00',	0,	'POS MIT PIN F002838002838 00000 PENNY SAGT DANKE 33300582 EC 56000213 080413115632OC0',	'I',	'EINKAUF',	-5.99,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(12213,	'2013-04-10',	'00:00:00',	0,	'GUTSCHRIFT BUNDESAGENTUR FUER ARBEIT - KG357357FK149064 0413480110N DE 93699 30 00043609926/ERST MARKDEF1760/CREF 48011093699 /ADRS STRASSE 104 90478 NUERNBERG DE FAMILIENKASSE REGENSBURGER Wertstellung 09 04 2013',	'I',	'GUTSCHRIFT',	184.00,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(12223,	'2013-04-10',	'00:00:00',	0,	'POS MIT PIN F021239021239 00000 REWE SAGT DANKE 47655371 EC 65495993 090413101303OC0',	'I',	'EINKAUF',	-16.11,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(12233,	'2013-04-10',	'00:00:00',	0,	'POS MIT PIN F002938002938 00000 PENNY SAGT DANKE 33300582 EC 56000213 090413111407OC0',	'I',	'EINKAUF',	-13.76,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(12243,	'2013-04-12',	'00:00:00',	0,	'LASTSCHRIFT DEVK-GRUPPE 570005834479 VERTRAGSKONTO Z00006939535 DEVK-GRUPPE SAGT DANKE',	'I',	'VERSICHERUNG',	-40.21,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(12253,	'2013-04-12',	'00:00:00',	0,	'POS MIT PIN F003115003115 00000 PENNY SAGT DANKE 33300582 EC 56000213 110413104429OC0',	'I',	'EINKAUF',	-11.87,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(12263,	'2013-04-19',	'00:00:00',	0,	'AUSZAHLUNG GELDAUTOMAT - TARGOBANK KÃ¯Â¿Â½LN 01189 AM 19 04 2013 UM 10 32 KARTE 12 13/0 TRANSAKTIONSNUMMER 054619',	'I',	'ABHEBUNG',	-70.00,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(12273,	'2013-04-19',	'00:00:00',	0,	'POS MIT PIN F003606003606 00000 PENNY SAGT DANKE 33300582 EC 56000213 170413092156OC0',	'I',	'EINKAUF',	-22.99,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(12283,	'2013-04-19',	'00:00:00',	0,	'POS MIT PIN F003720003720 00000 PENNY SAGT DANKE 33300582 EC 56000213 180413094344OC0',	'I',	'EINKAUF',	-15.59,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(12293,	'2013-04-25',	'00:00:00',	0,	'POS MIT PIN F001410001410 00000 PENNY SAGT DANKE 33300582 EC 56000212 240413105546OC0',	'I',	'EINKAUF',	-12.73,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(12303,	'2013-04-26',	'00:00:00',	0,	'GAA-AUSZAHLUNG 000949 1312 0395 GA NR00003595 BLZ37050198 025 04/09 19UHR MERKENICH EUR 50 00 0120800004800001180028013 0FA508A030C000000000000000 0000000F101304240000000000 000000000000 D27600002547410100 0203006040201411026060 0002',	'I',	'ABHEBUNG',	-50.00,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(12313,	'2013-04-26',	'00:00:00',	0,	'GEBÃœHR FÃœR GAA-AUSZAHLUNG',	'I',	'GEBUEHR',	-3.95,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(12323,	'2013-04-29',	'00:00:00',	0,	'POS MIT PIN F004391004391 00000 PENNY SAGT DANKE 33300582 EC 56000213 260413104335OC0',	'I',	'EINKAUF',	-14.92,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(12333,	'2013-04-30',	'00:00:00',	0,	'LOHN / GEHALT / RENTE PERSONALAMT DER STADT KOELN LOHN/GEHALT 09202800/201304* KLINIKEN',	'I',	'GEHALTCHRIS',	604.00,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(12343,	'2013-04-30',	'00:00:00',	0,	'LASTSCHRIFT PENNY-MARKT GMBH DC KOELN 040000005699 33300582 PENNY SAGT DANKE 260309380018520131256000213KAUFB 28 15 EUR + GEBUEHR 8 50 EUR AUS LASTSCHRIFT',	'I',	'EINKAUF',	-36.65,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(12353,	'2013-04-30',	'00:00:00',	0,	'POS MIT PIN F001630001630 00000 PENNY SAGT DANKE 33300582 EC 56000212 290413102230OC0',	'I',	'EINKAUF',	-10.29,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(12354,	'2014-10-03',	'00:00:00',	0,	'Kassensturz 22.11',	'',	'SONSTIGES',	-48.15,	'CHRIS',	'',	22.11,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'0000-00-00 00:00:00',	1,	'N'),
(12356,	'0000-00-00',	'00:00:00',	0,	'REWE Einkauf',	'',	'LEBEN',	-1.98,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	85,	'',	'',	'',	'2014-11-05 16:51:09',	1,	'N'),
(12357,	'0000-00-00',	'00:00:00',	0,	'REWE Einkauf',	'',	'LEBEN',	-1.98,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	85,	'',	'',	'',	'2014-11-05 16:52:09',	1,	'N'),
(12358,	'0000-00-00',	'00:00:00',	0,	'REWE Einkauf',	'',	'LEBEN',	-1.98,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	85,	'',	'',	'',	'2014-11-05 16:58:34',	1,	'N'),
(12525,	'2014-11-11',	'18:49:00',	0,	'Vegane WÃƒÂ¼rstchen',	'',	'LEBEN',	-2.19,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-18 17:30:02',	1,	'N'),
(12523,	'2014-11-12',	'11:19:51',	0,	'Abhebung',	'',	'ABHEBUNG',	50.00,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-18 17:30:02',	1,	'N'),
(12524,	'2014-11-12',	'08:13:22',	0,	'brÃƒÂ¶tchen',	'',	'LEBENHORST',	-0.75,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-18 17:30:02',	1,	'N'),
(12522,	'2014-11-12',	'12:21:52',	0,	'Einkauf Rewe',	'',	'EINKAUF',	-1.48,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-18 17:30:02',	1,	'N'),
(12521,	'2014-11-13',	'08:20:23',	0,	'brÃƒÂ¶tchen',	'',	'LEBENHORST',	-0.75,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-18 17:30:02',	1,	'N'),
(12520,	'2014-11-13',	'22:56:49',	0,	'Ãƒâ€“l',	'',	'PRIVAT',	-3.09,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-18 17:30:02',	1,	'N'),
(12519,	'2014-11-14',	'07:02:45',	0,	'Essen Backwerk',	'',	'LEBENHORST',	-2.09,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-18 17:30:02',	1,	'N'),
(12518,	'2014-11-15',	'12:14:55',	0,	'Kaffee U Kuchen',	'',	'FAMILIE',	-8.09,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-18 17:30:02',	1,	'N'),
(12517,	'2014-11-16',	'13:32:59',	0,	'Essen Backwerk',	'',	'FAMILIE',	-3.84,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-18 17:30:02',	1,	'N'),
(12516,	'2014-11-17',	'08:32:22',	0,	'brÃƒÂ¶tchen',	'',	'LEBENHORST',	-0.75,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-18 17:30:02',	1,	'N'),
(12393,	'2014-10-31',	'12:36:47',	0,	'Wein',	'',	'GESCH',	-4.49,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-06 07:39:26',	1,	'N'),
(12515,	'2014-11-18',	'08:02:24',	0,	'brÃƒÂ¶tchen',	'',	'LEBENHORST',	-0.75,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-18 17:30:02',	1,	'N'),
(12514,	'2014-11-18',	'08:20:47',	0,	'kassensturz 20.04',	'',	'UMBUCH',	-11.93,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-18 17:30:02',	1,	'N'),
(12394,	'2014-10-31',	'10:29:27',	0,	'Musikgeld',	'',	'UMBUCH',	50.00,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-06 07:39:26',	1,	'N'),
(12395,	'2014-10-31',	'07:57:53',	0,	'brÃƒÂ¶tchen',	'',	'LEBENHORST',	-0.75,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-06 07:39:26',	1,	'N'),
(12396,	'2014-10-31',	'07:14:20',	0,	'Geburtagsgeld',	'',	'UMBUCH',	10.00,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-06 07:39:26',	1,	'N'),
(12397,	'2014-10-30',	'12:52:07',	0,	'Einkauf Rewe',	'',	'EINKAUF',	-1.98,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-06 07:39:26',	1,	'N'),
(12398,	'2014-10-30',	'08:08:02',	0,	'brÃƒÂ¶tchen',	'',	'LEBENHORST',	-0.75,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-06 07:39:26',	1,	'N'),
(12399,	'2014-10-30',	'06:12:51',	0,	'Geld An Chris',	'',	'UMBUCH',	-10.00,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-06 07:39:26',	1,	'N'),
(12400,	'2014-10-29',	'08:34:27',	0,	'kassensturz 14.22',	'',	'UMBUCH',	0.00,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-06 07:39:26',	1,	'N'),
(12401,	'2014-10-29',	'08:32:51',	0,	'fundgeld',	'',	'UMBUCH',	1.00,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-06 07:39:26',	1,	'N'),
(12402,	'2014-10-29',	'07:59:17',	0,	'brÃƒÂ¶tchen',	'',	'LEBENHORST',	-0.75,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-06 07:39:26',	1,	'N'),
(12403,	'2014-10-28',	'12:20:49',	0,	'Einkauf Rewe',	'',	'EINKAUF',	-14.96,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-06 07:39:26',	1,	'N'),
(12404,	'2014-10-28',	'09:23:11',	0,	'brÃƒÂ¶tchen',	'',	'LEBENHORST',	-0.75,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-06 07:39:26',	1,	'N'),
(12405,	'2014-10-27',	'12:17:49',	0,	'Adapter',	'',	'FAMILIE',	-59.90,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-06 07:39:26',	1,	'N'),
(12406,	'2014-10-27',	'09:13:06',	0,	'brÃƒÂ¶tchen',	'',	'LEBENHORST',	-0.75,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-06 07:39:26',	1,	'N'),
(12407,	'2014-10-27',	'08:30:11',	0,	'Geburtagsgeld',	'',	'UMBUCH',	70.00,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-06 07:39:26',	1,	'N'),
(12408,	'2014-10-26',	'16:22:50',	0,	'Klezmerkonzert',	'',	'SPENDE',	-2.00,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-06 07:39:26',	1,	'N'),
(12409,	'2014-10-26',	'11:21:47',	0,	'kirchenspende',	'',	'SPENDE',	-1.70,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-06 07:39:26',	1,	'N'),
(12410,	'2014-10-26',	'09:12:21',	0,	'kassensturz 24.03',	'',	'UMBUCH',	0.00,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-06 07:39:26',	1,	'N'),
(12411,	'2014-10-25',	'16:51:14',	0,	'einkauf kaufland',	'',	'EINKAUF',	-54.12,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-06 07:39:26',	1,	'N'),
(12412,	'2014-10-25',	'16:10:22',	0,	'Lose',	'',	'FAMILIE',	-2.00,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-06 07:39:26',	1,	'N'),
(12413,	'2014-10-25',	'15:44:12',	0,	'einkauf aldi',	'',	'EINKAUF',	-46.52,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-06 07:39:26',	1,	'N'),
(12414,	'2014-10-25',	'14:23:10',	0,	'Abhebung',	'',	'ABHEBUNG',	100.00,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-06 07:39:26',	1,	'N'),
(12415,	'2014-10-25',	'09:57:09',	0,	'Kaffee U Kuchen',	'',	'SPENDE',	-2.00,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-06 07:39:26',	1,	'N'),
(12416,	'2014-10-24',	'12:25:52',	0,	'Einkauf Rewe',	'',	'EINKAUF',	-11.37,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-06 07:39:26',	1,	'N'),
(12417,	'2014-10-24',	'08:06:25',	0,	'brÃƒÂ¶tchen',	'',	'LEBENHORST',	-0.67,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-06 07:39:26',	1,	'N'),
(12418,	'2014-10-23',	'12:33:01',	0,	'Briefmarken',	'',	'POST',	-12.00,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-06 07:39:26',	1,	'N'),
(12419,	'2014-10-23',	'12:32:38',	0,	'Abhebung',	'',	'ABHEBUNG',	50.00,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-06 07:39:26',	1,	'N'),
(12420,	'2014-10-23',	'07:57:55',	0,	'brÃƒÂ¶tchen',	'',	'LEBENHORST',	-0.75,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-06 07:39:26',	1,	'N'),
(12421,	'2014-10-22',	'12:24:23',	0,	'Einkauf Rewe',	'',	'EINKAUF',	-3.18,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-06 07:39:26',	1,	'N'),
(12422,	'2014-10-22',	'08:41:20',	0,	'kassensturz 6.64',	'',	'UMBUCH',	0.00,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-06 07:39:26',	1,	'N'),
(12423,	'2014-10-22',	'08:40:20',	0,	'brÃƒÂ¶tchen',	'',	'LEBENHORST',	-0.75,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-06 07:39:26',	1,	'N'),
(12424,	'2014-10-21',	'08:24:59',	0,	'brÃƒÂ¶tchen',	'',	'LEBENHORST',	-0.75,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-06 07:39:26',	1,	'N'),
(12425,	'2014-10-20',	'12:30:17',	0,	'Einkauf Rewe',	'',	'EINKAUF',	-3.49,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-06 07:39:26',	1,	'N'),
(12426,	'2014-10-20',	'08:29:53',	0,	'brÃƒÂ¶tchen',	'',	'LEBENHORST',	-0.75,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-06 07:39:26',	1,	'N'),
(12427,	'2014-10-19',	'12:36:54',	0,	'kirchenspende',	'',	'SPENDE',	-3.00,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-06 07:39:26',	1,	'N'),
(12428,	'2014-10-18',	'08:45:08',	0,	'BrÃƒÂ¶tchen',	'',	'LEBEN',	-1.13,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-06 07:39:26',	1,	'N'),
(12429,	'2014-10-17',	'19:49:13',	0,	'\"\"',	'',	'FAMILIE',	-8.00,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-06 07:39:26',	1,	'N'),
(12430,	'2014-10-17',	'16:42:13',	0,	'parken',	'',	'AUTO',	-0.50,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-06 07:39:26',	1,	'N'),
(12431,	'2014-10-17',	'09:25:52',	0,	'BrÃƒÂ¶tchen',	'',	'LEBEN',	-1.13,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-06 07:39:26',	1,	'N'),
(12432,	'2014-10-16',	'19:26:25',	0,	'einkauf penny',	'',	'EINKAUF',	-5.06,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-06 07:39:26',	1,	'N'),
(12433,	'2014-10-16',	'13:06:43',	0,	'Odysseum',	'',	'FAMILIE',	-40.00,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-06 07:39:26',	1,	'N'),
(12434,	'2014-10-16',	'10:28:04',	0,	'kassensturz 71.20',	'',	'UMBUCH',	0.00,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-06 07:39:26',	1,	'N'),
(12435,	'2014-10-15',	'13:04:19',	0,	'Einkauf Edeka',	'',	'EINKAUF',	-2.13,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-06 07:39:26',	1,	'N'),
(12436,	'2014-10-15',	'08:56:57',	0,	'BrÃƒÂ¶tchen',	'',	'LEBEN',	-1.13,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-06 07:39:26',	1,	'N'),
(12437,	'2014-10-14',	'16:47:49',	0,	'Eis',	'',	'FAMILIE',	-3.00,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-06 07:39:26',	1,	'N'),
(12438,	'2014-10-14',	'16:44:08',	0,	'Zoo Foto',	'',	'FAMILIE',	-6.50,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-06 07:39:26',	1,	'N'),
(12439,	'2014-10-14',	'14:08:21',	0,	'zoo essen',	'',	'FAMILIE',	-12.28,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-06 07:39:26',	1,	'N'),
(12440,	'2014-10-14',	'08:40:14',	0,	'einkauf penny',	'',	'EINKAUF',	-0.26,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-06 07:39:26',	1,	'N'),
(12441,	'2014-10-13',	'18:45:43',	0,	'backwerk',	'',	'LEBENHORST',	-2.13,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-06 07:39:26',	1,	'N'),
(12442,	'2014-10-13',	'16:26:28',	0,	'Kuchen',	'',	'FAMILIE',	-3.50,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-06 07:39:26',	1,	'N'),
(12443,	'2014-10-13',	'10:44:35',	0,	'Geld Von Geburtstag',	'',	'UMBUCH',	1.00,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-06 07:39:26',	1,	'N'),
(12444,	'2014-10-13',	'10:22:42',	0,	'Abhebung',	'',	'ABHEBUNG',	100.00,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-06 07:39:26',	1,	'N'),
(12445,	'2014-10-13',	'09:39:43',	0,	'kassensturz 1.13',	'',	'UMBUCH',	0.00,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-06 07:39:26',	1,	'N'),
(12446,	'2014-10-13',	'08:35:42',	0,	'BrÃƒÂ¶tchen',	'',	'LEBEN',	-2.18,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-06 07:39:26',	1,	'N'),
(12447,	'2014-10-11',	'14:38:57',	0,	'Frieda Auto',	'',	'KIND',	-1.00,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-06 07:39:26',	1,	'N'),
(12448,	'2014-10-10',	'12:29:32',	0,	'Einkauf Rewe',	'',	'EINKAUF',	-0.99,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-06 07:39:26',	1,	'N'),
(12449,	'2014-10-10',	'08:15:47',	0,	'kassensturz 5.30',	'',	'UMBUCH',	0.00,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-06 07:39:26',	1,	'N'),
(12450,	'2014-10-10',	'07:57:17',	0,	'brÃƒÂ¶tchen',	'',	'LEBENHORST',	-0.75,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-06 07:39:26',	1,	'N'),
(12451,	'2014-10-09',	'12:26:18',	0,	'Einkauf Rewe',	'',	'EINKAUF',	-21.06,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-06 07:39:26',	1,	'N'),
(12452,	'2014-10-09',	'08:30:09',	0,	'kassensturz 27.11',	'',	'UMBUCH',	0.00,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-06 07:39:26',	1,	'N'),
(12453,	'2014-10-09',	'08:10:34',	0,	'Hustenbonbons',	'',	'MED',	-1.74,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-06 07:39:26',	1,	'N'),
(12454,	'2014-10-09',	'07:58:24',	0,	'brÃƒÂ¶tchen',	'',	'LEBENHORST',	-0.75,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-06 07:39:26',	1,	'N'),
(12455,	'2014-10-08',	'12:24:10',	0,	'Einkauf Rewe',	'',	'EINKAUF',	-3.25,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-06 07:39:26',	1,	'N'),
(12456,	'2014-10-08',	'08:59:50',	0,	'Tabletten',	'',	'MED',	-5.00,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-06 07:39:26',	1,	'N'),
(12457,	'2014-10-08',	'08:51:12',	0,	'brÃƒÂ¶tchen',	'',	'LEBENHORST',	-0.75,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-06 07:39:26',	1,	'N'),
(12458,	'2014-10-07',	'19:50:06',	0,	'Veganes Essen',	'',	'UMBUCH',	-30.00,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-06 07:39:26',	1,	'N'),
(12459,	'2014-10-07',	'17:43:07',	0,	'Abhebung',	'',	'ABHEBUNG',	50.00,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-06 07:39:26',	1,	'N'),
(12460,	'2014-10-07',	'12:27:24',	0,	'Einkauf Rewe',	'',	'EINKAUF',	-4.28,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-06 07:39:26',	1,	'N'),
(12461,	'2014-10-07',	'08:10:19',	0,	'kassensturz 22.88',	'',	'UMBUCH',	0.00,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-06 07:39:26',	1,	'N'),
(12462,	'2014-10-07',	'08:09:24',	0,	'fundgeld',	'',	'UMBUCH',	3.00,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-06 07:39:26',	1,	'N'),
(12463,	'2014-10-07',	'07:48:23',	0,	'brÃƒÂ¶tchen',	'',	'LEBENHORST',	-0.75,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-06 07:39:26',	1,	'N'),
(12464,	'2014-10-06',	'12:30:21',	0,	'Einkauf Rewe',	'',	'EINKAUF',	-7.57,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-06 07:39:26',	1,	'N'),
(12465,	'2014-10-06',	'08:23:40',	0,	'kassensturz 28.20',	'',	'UMBUCH',	0.00,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-06 07:39:26',	1,	'N'),
(12466,	'2014-10-06',	'08:07:54',	0,	'brÃƒÂ¶tchen',	'',	'LEBENHORST',	-0.75,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-06 07:39:26',	1,	'N'),
(12467,	'2014-10-05',	'11:51:27',	0,	'kirchenspende',	'',	'SPENDE',	-0.20,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-06 07:39:26',	1,	'N'),
(12468,	'2014-10-05',	'08:41:03',	0,	'Geld An Chris',	'',	'UMBUCH',	-30.00,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-06 07:39:26',	1,	'N'),
(12469,	'2014-10-04',	'20:48:57',	0,	'kassensturz 59.15',	'',	'UMBUCH',	-14.38,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-06 07:39:26',	1,	'N'),
(12470,	'2014-10-04',	'16:06:17',	0,	'Einkauf Alnatura',	'',	'EINKAUF',	-13.95,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-06 07:39:26',	1,	'N'),
(12471,	'2014-10-04',	'15:09:43',	0,	'einkauf kaufland',	'',	'EINKAUF',	-39.64,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-06 07:39:26',	1,	'N'),
(12472,	'2014-10-04',	'14:09:44',	0,	'einkauf aldi',	'',	'EINKAUF',	-38.86,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-06 07:39:26',	1,	'N'),
(12473,	'2014-10-04',	'11:52:59',	0,	'geld von chris',	'',	'UMBUCH',	120.00,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-06 07:39:26',	1,	'N'),
(12474,	'2014-10-03',	'13:09:45',	0,	'Fritten U Salat',	'',	'FAMILIE',	-10.60,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-06 07:39:26',	1,	'N'),
(12475,	'2014-10-03',	'13:09:09',	0,	'schwimmen',	'',	'FAMILIE',	-8.20,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-06 07:39:26',	1,	'N'),
(12476,	'2014-10-03',	'08:07:40',	0,	'Geburtagsgeld',	'',	'UMBUCH',	50.00,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-06 07:39:26',	1,	'N'),
(12477,	'2014-10-02',	'08:59:05',	0,	'brÃƒÂ¶tchen',	'',	'LEBENHORST',	-0.75,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-06 07:39:26',	1,	'N'),
(12478,	'2014-10-01',	'15:17:04',	0,	'Vatergeld',	'',	'GESCH',	-2.00,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-06 07:39:26',	1,	'N'),
(12479,	'2014-10-01',	'08:37:20',	0,	'kassensturz 17.53',	'',	'UMBUCH',	-1.20,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-06 07:39:26',	1,	'N'),
(12480,	'2014-10-01',	'08:17:21',	0,	'brÃƒÂ¶tchen',	'',	'LEBENHORST',	-0.75,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-06 07:39:26',	1,	'N'),
(12483,	'2014-01-30',	'09:04:29',	0,	'brÃƒÂ¶tchen',	'',	'LEBENHORST',	-0.75,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-06 20:29:21',	1,	'N'),
(12482,	'2013-12-31',	'00:00:00',	0,	'',	'',	'UMBUCH',	30.57,	'HORST',	'',	34.63,	'0000-00-00',	0.00,	'',	0,	'HORST',	'N',	0,	'',	'',	'horald-Easynote',	'2014-11-06 07:51:05',	1,	'N'),
(12484,	'2014-01-29',	'12:24:29',	0,	'Himbeersirup',	'',	'LEBEN',	-1.35,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-06 20:29:22',	1,	'N'),
(12485,	'2014-01-29',	'08:17:42',	0,	'brÃƒÂ¶tchen',	'',	'LEBENHORST',	-0.75,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-06 20:29:22',	1,	'N'),
(12486,	'2014-01-29',	'08:16:56',	0,	'einkauf rewe brÃƒÂ¼hl',	'',	'EINKAUF',	-4.71,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-06 20:29:22',	1,	'N'),
(12487,	'2014-01-29',	'06:58:13',	0,	'abhebung',	'',	'ABHEBUNG',	30.00,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-06 20:29:22',	1,	'N'),
(12488,	'2014-01-28',	'08:04:35',	0,	'kassensturz',	'',	'UMBUCH',	-24.78,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-06 20:29:22',	1,	'N'),
(12489,	'2014-01-21',	'12:38:56',	0,	'einkauf rewe brÃƒÂ¼hl',	'',	'EINKAUF',	-5.44,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-06 20:29:22',	1,	'N'),
(12490,	'2014-01-21',	'08:16:55',	0,	'brÃƒÂ¶tchen',	'',	'LEBENHORST',	-0.75,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-06 20:29:22',	1,	'N'),
(12491,	'2014-01-20',	'08:16:34',	0,	'brÃƒÂ¶tchen',	'',	'LEBENHORST',	-0.75,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-06 20:29:22',	1,	'N'),
(12492,	'2014-01-19',	'17:30:05',	0,	'kassensturz',	'',	'UMBUCH',	-3.51,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-06 20:29:22',	1,	'N'),
(12493,	'2014-01-19',	'17:27:41',	0,	'Geld An Chris',	'',	'UMBUCH',	-10.00,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-06 20:29:22',	1,	'N'),
(12494,	'2014-01-19',	'15:03:05',	0,	'bahn frieda',	'',	'KIND',	-1.00,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-06 20:29:22',	1,	'N'),
(12495,	'2014-01-19',	'15:02:48',	0,	'kirchenspende',	'',	'SPENDE',	-3.00,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-06 20:29:22',	1,	'N'),
(12496,	'2014-01-18',	'10:33:00',	0,	'KÃƒÂ¤sestange',	'',	'LEBENHORST',	-1.10,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-06 20:29:22',	1,	'N'),
(12497,	'2014-01-18',	'10:32:25',	0,	'abhebung',	'',	'ABHEBUNG',	50.00,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-06 20:29:22',	1,	'N'),
(12498,	'2014-01-17',	'08:16:22',	0,	'einkauf rewe brÃƒÂ¼hl',	'',	'EINKAUF',	-4.07,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-06 20:29:22',	1,	'N'),
(12499,	'2014-01-17',	'08:16:03',	0,	'brÃƒÂ¶tchen',	'',	'LEBENHORST',	-0.75,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-06 20:29:22',	1,	'N'),
(12500,	'2014-01-15',	'17:32:40',	0,	'einkauf rewe brÃƒÂ¼hl',	'',	'EINKAUF',	-5.56,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-06 20:29:22',	1,	'N'),
(12501,	'2014-01-15',	'08:23:47',	0,	'brÃƒÂ¶tchen',	'',	'LEBENHORST',	-0.75,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-06 20:29:22',	1,	'N'),
(12502,	'2014-01-14',	'12:39:01',	0,	'einkauf rewe brÃƒÂ¼hl',	'',	'EINKAUF',	-3.43,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-06 20:29:22',	1,	'N'),
(12503,	'2014-01-14',	'08:29:28',	0,	'brÃƒÂ¶tchen',	'',	'LEBENHORST',	-0.75,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-06 20:29:22',	1,	'N'),
(12504,	'2014-01-13',	'20:58:59',	0,	'kassensturz',	'',	'UMBUCH',	-27.10,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-06 20:29:22',	1,	'N'),
(12505,	'2014-01-13',	'09:08:18',	0,	'brÃƒÂ¶tchen',	'',	'LEBENHORST',	-0.75,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-06 20:29:22',	1,	'N'),
(12506,	'2014-01-12',	'11:44:34',	0,	'kirchenspende',	'',	'SPENDE',	-1.20,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-06 20:29:22',	1,	'N'),
(12507,	'2014-01-10',	'18:04:53',	0,	'Geschenk',	'',	'GESCH',	-5.00,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-06 20:29:22',	1,	'N'),
(12508,	'2014-01-10',	'18:04:34',	0,	'abhebung',	'',	'ABHEBUNG',	50.00,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-06 20:29:22',	1,	'N'),
(12509,	'2014-01-09',	'12:35:23',	0,	'Spachtel',	'',	'HAUSHALT',	-2.39,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-06 20:29:22',	1,	'N'),
(12510,	'2014-01-09',	'08:21:20',	0,	'kassensturz',	'',	'UMBUCH',	-2.37,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-06 20:29:22',	1,	'N'),
(12511,	'2014-01-09',	'08:07:05',	0,	'brÃƒÂ¶tchen',	'',	'LEBENHORST',	-0.75,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-06 20:29:22',	1,	'N'),
(12512,	'2014-01-08',	'09:34:45',	0,	'brÃƒÂ¶tchen',	'',	'LEBENHORST',	-0.75,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-06 20:29:22',	1,	'N'),
(12513,	'2014-01-05',	'11:16:51',	0,	'kirchenspende',	'',	'SPENDE',	-1.50,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-06 20:29:22',	1,	'N'),
(12526,	'2014-11-11',	'18:46:36',	0,	'Brot',	'',	'LEBEN',	-2.40,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-18 17:30:02',	1,	'N'),
(12527,	'2014-11-11',	'12:48:46',	0,	'einkauf netto',	'',	'EINKAUF',	-4.26,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-18 17:30:02',	1,	'N'),
(12528,	'2014-11-11',	'12:38:27',	0,	'Passfotos',	'',	'PRIVAT',	-11.95,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-18 17:30:02',	1,	'N'),
(12529,	'2014-11-11',	'08:49:55',	0,	'Medikamente',	'',	'MED',	-5.00,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-18 17:30:02',	1,	'N'),
(12530,	'2014-11-11',	'08:45:45',	0,	'brÃƒÂ¶tchen',	'',	'LEBENHORST',	-0.75,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-18 17:30:02',	1,	'N'),
(12531,	'2014-11-10',	'18:30:20',	0,	'Essen Backwerk',	'',	'LEBENHORST',	-4.13,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-18 17:30:02',	1,	'N'),
(12532,	'2014-11-10',	'12:29:50',	0,	'einkauf baumarkt',	'',	'EINKAUF',	-16.68,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-18 17:30:02',	1,	'N'),
(12533,	'2014-11-10',	'08:39:24',	0,	'kassensturz 50.92',	'',	'UMBUCH',	38.99,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-18 17:30:02',	1,	'N'),
(12534,	'2014-11-10',	'08:18:54',	0,	'brÃƒÂ¶tchen',	'',	'LEBENHORST',	-0.75,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-18 17:30:02',	1,	'N'),
(12535,	'2014-11-09',	'12:12:59',	0,	'kirchenspende',	'',	'SPENDE',	-2.50,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-18 17:30:02',	1,	'N'),
(12536,	'2014-11-08',	'09:02:28',	0,	'BrÃƒÂ¶tchen',	'',	'LEBEN',	-10.57,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-18 17:30:02',	1,	'N'),
(12537,	'2014-11-07',	'08:53:48',	0,	'kassensturz 25.75',	'',	'UMBUCH',	0.00,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-18 17:30:02',	1,	'N'),
(12538,	'2014-11-07',	'08:07:51',	0,	'brÃƒÂ¶tchen',	'',	'LEBENHORST',	-0.75,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-18 17:30:02',	1,	'N'),
(12539,	'2014-11-06',	'12:29:56',	0,	'Einkauf Rewe',	'',	'EINKAUF',	-7.15,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-18 17:30:02',	1,	'N'),
(12540,	'2014-11-06',	'08:59:57',	0,	'brÃƒÂ¶tchen',	'',	'LEBENHORST',	-0.75,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-18 17:30:02',	1,	'N'),
(12541,	'2014-11-05',	'08:59:06',	0,	'brÃƒÂ¶tchen',	'',	'LEBENHORST',	-0.75,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-18 17:30:02',	1,	'N'),
(12542,	'2014-11-04',	'12:34:26',	0,	'Einkauf Rewe',	'',	'EINKAUF',	-2.48,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-18 17:30:02',	1,	'N'),
(12543,	'2014-11-04',	'08:18:50',	0,	'brÃƒÂ¶tchen',	'',	'LEBENHORST',	-0.75,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-18 17:30:02',	1,	'N'),
(12544,	'2014-11-03',	'14:25:09',	0,	'Fr Sauerwein',	'',	'GESCH',	-2.00,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-18 17:30:02',	1,	'N'),
(12545,	'2014-11-03',	'12:26:32',	0,	'Einkauf Rewe',	'',	'EINKAUF',	-1.98,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-18 17:30:02',	1,	'N'),
(12546,	'2014-11-03',	'08:27:04',	0,	'kassensturz 42.36',	'',	'UMBUCH',	0.00,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-18 17:30:02',	1,	'N'),
(12547,	'2014-11-03',	'08:26:05',	0,	'Unbekannt',	'',	'SPENDE',	-1.50,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-18 17:30:02',	1,	'N'),
(12548,	'2014-11-03',	'08:02:11',	0,	'brÃƒÂ¶tchen',	'',	'LEBENHORST',	-0.75,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-18 17:30:02',	1,	'N'),
(12549,	'2014-11-02',	'15:51:31',	0,	'fÃƒÂ¤hre',	'',	'FAMILIE',	-1.50,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-18 17:30:02',	1,	'N'),
(12550,	'2014-11-02',	'13:36:37',	0,	'Essen Backwerk',	'',	'FAMILIE',	-4.32,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-18 17:30:02',	1,	'N'),
(12551,	'2014-11-02',	'11:37:12',	0,	'kirchenspende',	'',	'SPENDE',	-1.50,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-18 17:30:02',	1,	'N'),
(12552,	'2014-11-01',	'11:11:21',	0,	'Fahrkarte Kamen',	'',	'FAMILIE',	-41.00,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-18 17:30:02',	1,	'N'),
(12553,	'2014-11-01',	'11:10:34',	0,	'Essen Backwerk',	'',	'FAMILIE',	-3.32,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-18 17:30:02',	1,	'N'),
(12554,	'2014-11-01',	'10:30:13',	0,	'Geburtstagsgeld',	'',	'UMBUCH',	40.00,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-18 17:30:02',	1,	'N'),
(12555,	'2014-02-28',	'07:59:55',	0,	'brÃƒÂ¶tchen',	'',	'LEBENHORST',	-0.75,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-19 07:03:43',	1,	'N'),
(12556,	'2014-02-28',	'06:29:50',	0,	'geld von chris',	'',	'UMBUCH',	10.00,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-19 07:03:43',	1,	'N'),
(12557,	'2014-02-26',	'08:10:38',	0,	'brÃƒÂ¶tchen',	'',	'LEBENHORST',	-0.75,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-19 07:03:43',	1,	'N'),
(12558,	'2014-02-25',	'12:32:28',	0,	'einkauf rewe brÃƒÂ¼hl',	'',	'LEBENHORST',	-3.98,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-19 07:03:43',	1,	'N'),
(12559,	'2014-02-25',	'08:20:21',	0,	'kassensturz 7,81',	'',	'UMBUCH',	0.00,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-19 07:03:43',	1,	'N'),
(12560,	'2014-02-25',	'08:00:12',	0,	'brÃƒÂ¶tchen',	'',	'LEBENHORST',	-0.75,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-19 07:03:43',	1,	'N'),
(12561,	'2014-02-24',	'12:18:27',	0,	'Computer Zeitschriften',	'',	'UMBUCH',	-4.20,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-19 07:03:43',	1,	'N'),
(12562,	'2014-02-24',	'12:17:00',	0,	'einkauf rewe brÃƒÂ¼hl',	'',	'LEBENHORST',	-2.68,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-19 07:03:43',	1,	'N'),
(12563,	'2014-02-24',	'08:32:56',	0,	'kassensturz 15,44',	'',	'UMBUCH',	-25.22,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-19 07:03:43',	1,	'N'),
(12564,	'2014-02-23',	'16:49:43',	0,	'eis',	'',	'FAMILIE',	-3.50,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-19 07:03:43',	1,	'N'),
(12565,	'2014-02-23',	'16:49:16',	0,	'spende',	'',	'SPENDE',	-2.50,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-19 07:03:43',	1,	'N'),
(12566,	'2014-02-22',	'18:33:00',	0,	'lose',	'',	'FAMILIE',	-7.00,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-19 07:03:43',	1,	'N'),
(12567,	'2014-02-22',	'18:32:39',	0,	'Eisenbahn',	'',	'KIND',	-2.00,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-19 07:03:43',	1,	'N'),
(12568,	'2014-02-21',	'08:11:57',	0,	'brÃƒÂ¶tchen',	'',	'LEBENHORST',	-0.75,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-19 07:03:43',	1,	'N'),
(12569,	'2014-02-20',	'20:22:56',	0,	'geld von chris',	'',	'UMBUCH',	10.00,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-19 07:03:43',	1,	'N'),
(12570,	'2014-02-20',	'08:57:23',	0,	'brÃƒÂ¶tchen',	'',	'LEBENHORST',	-0.75,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-19 07:03:43',	1,	'N'),
(12571,	'2014-02-19',	'12:25:38',	0,	'einkauf rewe brÃƒÂ¼hl',	'',	'LEBENHORST',	-1.74,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-19 07:03:43',	1,	'N'),
(12572,	'2014-02-19',	'08:03:29',	0,	'brÃƒÂ¶tchen',	'',	'LEBENHORST',	-0.75,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-19 07:03:43',	1,	'N'),
(12573,	'2014-02-17',	'13:08:00',	0,	'Nachthose',	'',	'KIND',	-8.79,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-19 07:03:43',	1,	'N'),
(12574,	'2014-02-17',	'13:07:39',	0,	'abhebung',	'',	'ABHEBUNG',	50.00,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-19 07:03:43',	1,	'N'),
(12575,	'2014-02-17',	'09:24:32',	0,	'Paracetamol',	'',	'MED',	-2.30,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-19 07:03:43',	1,	'N'),
(12576,	'2014-02-17',	'09:16:34',	0,	'brÃƒÂ¶tchen',	'',	'LEBENHORST',	-0.75,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-19 07:03:43',	1,	'N'),
(12577,	'2014-02-16',	'11:18:57',	0,	'kirchenspende',	'',	'SPENDE',	-3.00,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-19 07:03:43',	1,	'N'),
(12578,	'2014-02-16',	'11:07:26',	0,	'kassensturz 14,49',	'',	'UMBUCH',	0.00,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-19 07:03:43',	1,	'N'),
(12579,	'2014-02-15',	'15:01:20',	0,	'eiscafe',	'',	'FAMILIE',	-12.00,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-19 07:03:43',	1,	'N'),
(12580,	'2014-02-15',	'11:18:51',	0,	'geld von chris',	'',	'UMBUCH',	10.00,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-19 07:03:43',	1,	'N'),
(12581,	'2014-02-14',	'07:54:42',	0,	'brÃƒÂ¶tchen',	'',	'LEBENHORST',	-0.75,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-19 07:03:43',	1,	'N'),
(12582,	'2014-02-13',	'12:32:56',	0,	'Mundwasser',	'',	'UMBUCH',	-3.59,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-19 07:03:43',	1,	'N'),
(12583,	'2014-02-13',	'12:31:50',	0,	'Essen Rewe BrÃƒÂ¼hl',	'',	'LEBENHORST',	-3.69,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-19 07:03:43',	1,	'N'),
(12584,	'2014-02-13',	'08:17:12',	0,	'kassensturz 24.52',	'',	'UMBUCH',	-11.19,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-19 07:03:43',	1,	'N'),
(12585,	'2014-02-13',	'08:01:44',	0,	'brÃƒÂ¶tchen',	'',	'LEBENHORST',	-0.75,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-19 07:03:43',	1,	'N'),
(12586,	'2014-02-09',	'12:09:23',	0,	'kassensturz',	'',	'UMBUCH',	-18.00,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-19 07:03:43',	1,	'N'),
(12587,	'2014-02-09',	'12:06:22',	0,	'Essen Backwerk',	'',	'UMBUCH',	-6.51,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-19 07:03:43',	1,	'N'),
(12588,	'2014-02-09',	'12:05:53',	0,	'abhebung',	'',	'ABHEBUNG',	50.00,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-19 07:03:43',	1,	'N'),
(12589,	'2014-02-09',	'12:05:37',	0,	'kirchenspende',	'',	'SPENDE',	-1.20,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-19 07:03:43',	1,	'N'),
(12590,	'2014-02-09',	'09:26:13',	0,	'geld von chris',	'',	'UMBUCH',	-1.40,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-19 07:03:43',	1,	'N'),
(12591,	'2014-02-06',	'08:40:18',	0,	'brÃƒÂ¶tchen',	'',	'LEBENHORST',	-0.59,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-19 07:03:43',	1,	'N'),
(12592,	'2014-02-05',	'08:38:26',	0,	'brÃƒÂ¶tchen',	'',	'LEBENHORST',	-0.75,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-19 07:03:43',	1,	'N'),
(12593,	'2014-02-04',	'07:03:38',	0,	'brÃƒÂ¶tchen',	'',	'LEBENHORST',	-0.57,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-19 07:03:43',	1,	'N'),
(12594,	'2014-02-02',	'13:04:54',	0,	'kassensturz',	'',	'UMBUCH',	0.00,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-19 07:03:43',	1,	'N'),
(12595,	'2014-02-02',	'13:03:20',	0,	'auto frieda',	'',	'KIND',	-0.50,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-19 07:03:43',	1,	'N'),
(12596,	'2014-02-02',	'11:30:34',	0,	'kirchenspende',	'',	'SPENDE',	-2.10,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2014-11-19 07:03:43',	1,	'N'),
(12597,	'2014-12-31',	'00:00:00',	0,	'Jahresabschluss',	'',	'UMBUCH',	-22.54,	'HORST',	'',	21.89,	'0000-00-00',	0.00,	'',	0,	'HORST',	'N',	0,	'',	'',	'',	'2015-01-05 16:57:18',	1,	'N'),
(12797,	'2015-01-20',	'07:58:39',	0,	'brÃƒÂ¶tchen',	'',	'LEBENHORST',	-0.75,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-02-15 13:14:37',	1,	'N'),
(12796,	'2015-01-20',	'12:17:13',	0,	'Einkauf Rewe',	'',	'EINKAUF',	-4.53,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-02-15 13:14:37',	1,	'N'),
(12795,	'2015-01-20',	'18:15:45',	0,	'Finanzbuch',	'',	'PRIVAT',	-9.90,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-02-15 13:14:37',	1,	'N'),
(12794,	'2015-01-21',	'08:12:13',	0,	'brÃƒÂ¶tchen',	'',	'LEBENHORST',	-0.75,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-02-15 13:14:37',	1,	'N'),
(12604,	'2014-12-31',	'00:00:00',	0,	'Jahresabschluss',	'',	'UMBUCH',	6.29,	'CHRIS',	'',	28.40,	'0000-00-00',	0.00,	'',	0,	'HORST',	'N',	0,	'',	'',	'horald-Easynote',	'2015-01-05 17:06:44',	1,	'N'),
(12841,	'2015-01-03',	'15:56:47',	0,	'BÃƒÂ¼cher',	'',	'CHRIS_PRIVAT',	-11.93,	'CHRIS',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-02-15 13:29:47',	1,	'N'),
(12840,	'2015-01-04',	'17:17:23',	0,	'Lakritz',	'',	'CHRIS_PRIVAT',	-1.60,	'CHRIS',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-02-15 13:29:47',	1,	'N'),
(12838,	'2015-01-05',	'21:12:22',	0,	'kassensturz 5.32',	'',	'UMBUCH',	0.00,	'CHRIS',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-02-15 13:29:47',	1,	'N'),
(12839,	'2015-01-04',	'21:21:15',	0,	'Ksta',	'',	'CHRIS_PRIVAT',	-1.40,	'CHRIS',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-02-15 13:29:47',	1,	'N'),
(12791,	'2015-01-23',	'12:31:30',	0,	'Einkauf Rewe',	'',	'EINKAUF',	-1.94,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-02-15 13:14:37',	1,	'N'),
(12835,	'2015-01-11',	'11:59:14',	0,	'Kaffee u Kuchen',	'',	'FAMILIE',	-3.36,	'CHRIS',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'HORST',	'N',	0,	'CSVIMPORT',	'',	'horald-Easynote',	'2015-02-15 13:31:07',	1,	'N'),
(12836,	'2015-01-06',	'11:55:37',	0,	'Broccoli',	'',	'LEBEN',	-0.79,	'CHRIS',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-02-15 13:29:47',	1,	'N'),
(12837,	'2015-01-06',	'08:54:49',	0,	'BrÃƒÂ¶tchen',	'',	'LEBEN',	-2.50,	'CHRIS',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-02-15 13:29:47',	1,	'N'),
(12834,	'2015-01-24',	'14:53:49',	0,	'Abhebung',	'',	'ABHEBUNG',	50.00,	'CHRIS',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-02-15 13:29:47',	1,	'N'),
(12833,	'2015-01-24',	'15:02:08',	0,	'Kaffee U Kuchen',	'',	'FAMILIE',	-9.24,	'CHRIS',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-02-15 13:29:47',	1,	'N'),
(12792,	'2015-01-23',	'08:16:28',	0,	'brÃƒÂ¶tchen',	'',	'LEBENHORST',	-0.75,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-02-15 13:14:37',	1,	'N'),
(12656,	'2015-01-02',	'00:00:00',	10,	'Kiosk Einkauf',	'',	'EINKAUF',	4.90,	'CHRIS',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-01-06 19:24:11',	1,	'N'),
(12657,	'2015-01-02',	'00:00:00',	11,	'Kiosk Einkauf',	'',	'CHRIS_PRIVAT',	-1.40,	'CHRIS',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	1855,	'',	'',	'',	'2015-01-06 19:24:11',	1,	'N'),
(12658,	'2015-01-02',	'00:00:00',	12,	'Kiosk Einkauf',	'',	'LEBEN',	-3.50,	'CHRIS',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	1855,	'',	'',	'',	'2015-01-06 19:24:11',	1,	'N'),
(12789,	'2015-01-25',	'10:45:45',	0,	'kirchenspende',	'',	'SPENDE',	-4.00,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-02-15 13:14:37',	1,	'N'),
(12790,	'2015-01-24',	'16:58:10',	0,	'einkauf baumarkt',	'',	'EINKAUF',	-2.08,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-02-15 13:14:37',	1,	'N'),
(12788,	'2015-01-26',	'07:55:57',	0,	'brÃƒÂ¶tchen',	'',	'LEBENHORST',	-0.75,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-02-15 13:14:37',	1,	'N'),
(12787,	'2015-01-26',	'08:18:22',	0,	'kassensturz 4.13',	'',	'UMBUCH',	0.00,	'HORST',	'',	4.13,	'0000-00-00',	0.00,	'',	0,	'HORST',	'N',	0,	'CSVIMPORT',	'',	'horald-Easynote',	'2015-02-15 13:22:15',	1,	'N'),
(12786,	'2015-01-26',	'17:50:47',	0,	'Abhebung',	'',	'ABHEBUNG',	50.00,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-02-15 13:14:37',	1,	'N'),
(12785,	'2015-01-26',	'18:50:21',	0,	'Essen Backwerk',	'',	'LEBENHORST',	-5.04,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-02-15 13:14:37',	1,	'N'),
(12784,	'2015-01-27',	'08:08:04',	0,	'brÃƒÂ¶tchen',	'',	'LEBENHORST',	-0.75,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-02-15 13:14:37',	1,	'N'),
(12783,	'2015-01-28',	'07:58:24',	0,	'brÃƒÂ¶tchen',	'',	'LEBENHORST',	-0.75,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-02-15 13:14:37',	1,	'N'),
(12692,	'2015-01-10',	'00:00:00',	13,	'Kaufland Einkauf',	'',	'HAUSHALT',	-3.30,	'Bank_Horst',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	5,	'',	'',	'',	'2015-01-10 15:44:30',	1,	'N'),
(12691,	'2015-01-10',	'00:00:00',	12,	'Kaufland ',	'',	'LASTSCHRIFT',	44.20,	'Bank_Horst',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'HORST',	'N',	0,	'',	'',	'horald-Easynote',	'2015-01-10 15:46:14',	1,	'N'),
(12690,	'2015-01-10',	'00:00:00',	11,	'Aldi Einkauf',	'',	'LEBEN',	-25.33,	'Bank_Horst',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	3,	'',	'',	'',	'2015-01-10 15:44:30',	1,	'N'),
(12689,	'2015-01-10',	'00:00:00',	10,	'Aldi ',	'',	'LASTSCHRIFT',	25.33,	'Bank_Horst',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'HORST',	'N',	0,	'',	'',	'horald-Easynote',	'2015-01-10 15:45:50',	1,	'N'),
(12693,	'2015-01-10',	'00:00:00',	14,	'Kaufland Einkauf',	'',	'KIND',	-12.23,	'Bank_Horst',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	5,	'',	'',	'',	'2015-01-10 15:44:30',	1,	'N'),
(12694,	'2015-01-10',	'00:00:00',	15,	'Kaufland Einkauf',	'',	'LEBEN',	-28.67,	'Bank_Horst',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	5,	'',	'',	'',	'2015-01-10 15:44:30',	1,	'N'),
(12695,	'2015-02-14',	'00:00:00',	10,	'Kaufland ',	'',	'LASTSCHRIFT',	48.65,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'HORST',	'N',	0,	'',	'',	'horald-Easynote',	'2015-02-15 08:39:23',	1,	'N'),
(12696,	'2015-02-14',	'00:00:00',	11,	'Kaufland Einkauf',	'',	'HAUSHALT',	-6.49,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	5,	'',	'',	'',	'2015-02-15 08:37:47',	1,	'N'),
(12697,	'2015-02-14',	'00:00:00',	12,	'Kaufland Einkauf',	'',	'KIND',	-10.24,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	5,	'',	'',	'',	'2015-02-15 08:37:47',	1,	'N'),
(12698,	'2015-02-14',	'00:00:00',	13,	'Kaufland Einkauf',	'',	'LEBEN',	-31.92,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	5,	'',	'',	'',	'2015-02-15 08:37:47',	1,	'N'),
(12699,	'2015-02-14',	'00:00:00',	14,	'Aldi ',	'',	'LASTSCHRIFT',	39.42,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'HORST',	'N',	0,	'',	'',	'horald-Easynote',	'2015-02-15 08:39:40',	1,	'N'),
(12700,	'2015-02-14',	'00:00:00',	15,	'Aldi Einkauf',	'',	'HAUSHALT',	-3.13,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	3,	'',	'',	'',	'2015-02-15 08:37:47',	1,	'N'),
(12701,	'2015-02-14',	'00:00:00',	16,	'Aldi Einkauf',	'',	'LEBEN',	-36.29,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	3,	'',	'',	'',	'2015-02-15 08:37:47',	1,	'N'),
(12793,	'2015-01-21',	'08:44:47',	0,	'kassensturz 13.65',	'',	'UMBUCH',	0.00,	'HORST',	'',	13.65,	'0000-00-00',	0.00,	'',	0,	'HORST',	'N',	0,	'CSVIMPORT',	'',	'horald-Easynote',	'2015-02-15 13:20:16',	1,	'N'),
(12782,	'2015-01-28',	'12:33:51',	0,	'Einkauf Rewe',	'',	'EINKAUF',	-5.92,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-02-15 13:14:37',	1,	'N'),
(12781,	'2015-01-29',	'09:17:45',	0,	'brÃƒÂ¶tchen',	'',	'LEBENHORST',	-0.75,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-02-15 13:14:37',	1,	'N'),
(12780,	'2015-01-29',	'12:32:54',	0,	'Einkauf Rewe',	'',	'EINKAUF',	-16.39,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-02-15 13:14:37',	1,	'N'),
(12779,	'2015-01-30',	'08:50:30',	0,	'brÃƒÂ¶tchen',	'',	'LEBENHORST',	-0.75,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-02-15 13:14:37',	1,	'N'),
(12778,	'2015-01-30',	'12:22:25',	0,	'Einkauf Rewe',	'',	'EINKAUF',	-4.94,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-02-15 13:14:37',	1,	'N'),
(12777,	'2015-01-30',	'17:24:15',	0,	'Briefmarken',	'',	'POST',	-6.40,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-02-15 13:14:37',	1,	'N'),
(12876,	'2015-02-18',	'18:37:12',	4,	'Einkauf Alnatura',	'',	'EINKAUF',	-5.98,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'HORST',	'N',	0,	'CSVIMPORT',	'',	'horald-Easynote',	'2015-03-03 06:30:34',	1,	'N'),
(12875,	'2015-02-19',	'07:27:47',	0,	'brÃƒÂ¶tchen',	'',	'LEBENHORST',	-0.75,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-03-03 06:15:03',	1,	'N'),
(12873,	'2015-02-20',	'08:06:18',	0,	'brÃƒÂ¶tchen',	'',	'LEBENHORST',	-0.75,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-03-03 06:15:03',	1,	'N'),
(12871,	'2015-02-20',	'18:17:59',	0,	'Essen Backwerk',	'',	'LEBENHORST',	-3.73,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-03-03 06:15:03',	1,	'N'),
(12872,	'2015-02-20',	'12:25:29',	0,	'Einkauf Rewe',	'',	'EINKAUF',	-3.08,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-03-03 06:15:03',	1,	'N'),
(12870,	'2015-02-24',	'09:04:00',	0,	'brÃƒÂ¶tchen',	'',	'LEBENHORST',	-0.75,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-03-03 06:15:03',	1,	'N'),
(12868,	'2015-02-24',	'12:36:21',	0,	'Einkauf Lidl',	'',	'EINKAUF',	-2.91,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-03-03 06:15:03',	1,	'N'),
(12869,	'2015-02-24',	'12:17:35',	0,	'Abhebung',	'',	'ABHEBUNG',	50.00,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-03-03 06:15:03',	1,	'N'),
(12867,	'2015-02-25',	'08:21:47',	0,	'brÃƒÂ¶tchen',	'',	'LEBENHORST',	-0.75,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-03-03 06:15:03',	1,	'N'),
(12865,	'2015-02-25',	'12:09:32',	3,	'frisÃƒÂ¶r',	'',	'SPENDE',	-2.00,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'HORST',	'N',	0,	'CSVIMPORT',	'',	'horald-Easynote',	'2015-03-03 06:28:09',	1,	'N'),
(12866,	'2015-02-25',	'08:38:36',	2,	'kassensturz 35.37',	'',	'UMBUCH',	-18.21,	'HORST',	'',	35.37,	'0000-00-00',	0.00,	'',	0,	'HORST',	'N',	0,	'CSVIMPORT',	'',	'horald-Easynote',	'2015-03-03 06:33:24',	1,	'N'),
(12864,	'2015-02-26',	'08:09:07',	0,	'brÃƒÂ¶tchen',	'',	'LEBENHORST',	-0.75,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-03-03 06:15:03',	1,	'N'),
(12862,	'2015-02-26',	'18:26:58',	0,	'klo',	'',	'FAMILIE',	-0.50,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-03-03 06:15:03',	1,	'N'),
(12863,	'2015-02-26',	'12:30:34',	0,	'Einkauf Rewe',	'',	'EINKAUF',	-9.61,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-03-03 06:15:03',	1,	'N'),
(12861,	'2015-02-27',	'07:28:47',	0,	'brÃƒÂ¶tchen',	'',	'LEBENHORST',	-0.75,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-03-03 06:15:03',	1,	'N'),
(12860,	'2015-02-28',	'11:49:28',	0,	'toastbrÃƒÂ¶tchen',	'',	'LEBEN',	-1.98,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-03-03 06:15:03',	1,	'N'),
(12859,	'2015-02-28',	'12:39:46',	0,	'geld von chris',	'',	'UMBUCH',	150.00,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-03-03 06:15:03',	1,	'N'),
(12858,	'2015-02-28',	'15:41:13',	0,	'Frieda Auto',	'',	'KIND',	-1.00,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-03-03 06:15:03',	1,	'N'),
(12857,	'2015-02-28',	'16:32:58',	0,	'einkauf aldi',	'',	'EINKAUF',	-29.86,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-03-03 06:15:03',	1,	'N'),
(12856,	'2015-02-28',	'17:20:59',	0,	'einkauf kaufland',	'',	'EINKAUF',	-57.30,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-03-03 06:15:03',	1,	'N'),
(12854,	'2015-02-28',	'19:42:06',	0,	'Geld An Chris',	'',	'UMBUCH',	-60.00,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-03-03 06:15:03',	1,	'N'),
(12798,	'2015-01-19',	'12:30:01',	0,	'Einkauf Rewe',	'',	'EINKAUF',	-5.78,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-02-15 13:14:37',	1,	'N'),
(12799,	'2015-01-19',	'08:19:32',	0,	'brÃƒÂ¶tchen',	'',	'LEBENHORST',	-0.75,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-02-15 13:14:37',	1,	'N'),
(12800,	'2015-01-17',	'12:35:05',	0,	'Geschenk',	'',	'GESCH',	-3.99,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-02-15 13:14:37',	1,	'N'),
(12801,	'2015-01-17',	'11:23:03',	0,	'FrÃƒÂ¼hstÃƒÂ¼ck',	'',	'LEBENHORST',	-4.95,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-02-15 13:14:37',	1,	'N'),
(12802,	'2015-01-17',	'10:06:15',	0,	'toastbrÃƒÂ¶tchen',	'',	'LEBEN',	-0.99,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-02-15 13:14:37',	1,	'N'),
(12803,	'2015-01-16',	'12:22:35',	0,	'Medikamente',	'',	'MED',	-5.00,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-02-15 13:14:37',	1,	'N'),
(12804,	'2015-01-16',	'12:22:26',	0,	'Abhebung',	'',	'ABHEBUNG',	50.00,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-02-15 13:14:37',	1,	'N'),
(12805,	'2015-01-16',	'09:47:13',	0,	'brÃƒÂ¶tchen',	'',	'LEBENHORST',	-0.75,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-02-15 13:14:37',	1,	'N'),
(12806,	'2015-01-15',	'12:43:15',	0,	'Schieblehre',	'',	'HAUSHALT',	-6.99,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-02-15 13:14:37',	1,	'N'),
(12807,	'2015-01-15',	'08:08:09',	0,	'brÃƒÂ¶tchen',	'',	'LEBENHORST',	-0.75,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-02-15 13:14:37',	1,	'N'),
(12808,	'2015-01-13',	'13:02:43',	0,	'Medikamente',	'',	'MED',	-10.98,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-02-15 13:14:37',	1,	'N'),
(12809,	'2015-01-13',	'13:02:16',	0,	'Teilchen',	'',	'LEBENHORST',	-1.60,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-02-15 13:14:37',	1,	'N'),
(12810,	'2015-01-12',	'12:17:57',	0,	'Einkauf Rewe',	'',	'EINKAUF',	-2.28,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-02-15 13:14:37',	1,	'N'),
(12811,	'2015-01-12',	'08:02:09',	0,	'brÃƒÂ¶tchen',	'',	'LEBENHORST',	-0.75,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-02-15 13:14:37',	1,	'N'),
(12812,	'2015-01-10',	'15:50:45',	0,	'Lose',	'',	'FAMILIE',	-2.00,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'HORST',	'N',	0,	'CSVIMPORT',	'',	'horald-Easynote',	'2015-02-15 13:16:54',	1,	'N'),
(12813,	'2015-01-10',	'12:34:33',	0,	'Kaffee U Kuchen',	'',	'FAMILIE',	-8.33,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-02-15 13:14:37',	1,	'N'),
(12814,	'2015-01-10',	'12:33:56',	0,	'getrÃƒÂ¤nke',	'',	'KIND',	-1.54,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-02-15 13:14:37',	1,	'N'),
(12815,	'2015-01-09',	'12:39:30',	0,	'Einkauf Rewe',	'',	'EINKAUF',	-7.76,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-02-15 13:14:37',	1,	'N'),
(12816,	'2015-01-09',	'07:58:40',	0,	'brÃƒÂ¶tchen',	'',	'LEBENHORST',	-0.75,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-02-15 13:14:37',	1,	'N'),
(12817,	'2015-01-08',	'12:41:07',	0,	'Einkauf Rewe',	'',	'EINKAUF',	-6.65,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-02-15 13:14:37',	1,	'N'),
(12818,	'2015-01-08',	'12:13:17',	0,	'Abhebung',	'',	'ABHEBUNG',	50.00,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-02-15 13:14:37',	1,	'N'),
(12819,	'2015-01-08',	'08:28:01',	0,	'brÃƒÂ¶tchen',	'',	'LEBENHORST',	-0.75,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-02-15 13:14:37',	1,	'N'),
(12820,	'2015-01-07',	'12:42:33',	0,	'nudeln',	'',	'LEBENHORST',	-0.69,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-02-15 13:14:37',	1,	'N'),
(12821,	'2015-01-07',	'08:10:10',	0,	'brÃƒÂ¶tchen',	'',	'LEBENHORST',	-0.75,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-02-15 13:14:37',	1,	'N'),
(12822,	'2015-01-06',	'12:23:08',	0,	'Einkauf Rewe',	'',	'EINKAUF',	-6.07,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-02-15 13:14:37',	1,	'N'),
(12823,	'2015-01-06',	'07:57:34',	0,	'brÃƒÂ¶tchen',	'',	'LEBENHORST',	-0.75,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-02-15 13:14:37',	1,	'N'),
(12824,	'2015-01-05',	'12:27:11',	0,	'einkauf baumarkt',	'',	'EINKAUF',	-2.48,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-02-15 13:14:37',	1,	'N'),
(12825,	'2015-01-05',	'08:07:49',	0,	'brÃƒÂ¶tchen',	'',	'LEBENHORST',	-0.75,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-02-15 13:14:37',	1,	'N'),
(12826,	'2015-01-04',	'11:31:11',	0,	'kirchenspende',	'',	'SPENDE',	-3.00,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-02-15 13:14:37',	1,	'N'),
(12827,	'2015-01-03',	'17:01:33',	0,	'Essen Backwerk',	'',	'LEBENHORST',	-3.49,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-02-15 13:14:37',	1,	'N'),
(12828,	'2015-01-03',	'12:11:30',	0,	'toastbrÃƒÂ¶tchen',	'',	'LEBEN',	-0.99,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-02-15 13:14:37',	1,	'N'),
(12829,	'2015-01-01',	'14:10:18',	0,	'kassensturz 21.89',	'',	'UMBUCH',	0.00,	'HORST',	'',	21.89,	'0000-00-00',	0.00,	'',	0,	'HORST',	'N',	0,	'CSVIMPORT',	'',	'horald-Easynote',	'2015-02-15 13:20:00',	1,	'N'),
(12874,	'2015-02-19',	'12:27:05',	0,	'Einkauf Rewe',	'',	'EINKAUF',	-1.78,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-03-03 06:15:03',	1,	'N'),
(12830,	'2015-02-01',	'00:00:00',	0,	'Sonstiges',	'',	'SONSTIGES',	-2.19,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'HORST',	'N',	0,	'',	'',	'',	'2015-02-15 13:18:59',	1,	'N'),
(12831,	'2015-02-13',	'00:00:00',	0,	'Sonstiges',	'',	'SONSTIGES',	-19.93,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'HORST',	'N',	0,	'',	'',	'',	'2015-02-15 13:21:34',	1,	'N'),
(12855,	'2015-02-28',	'17:40:40',	0,	'Lose',	'',	'FAMILIE',	-2.00,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-03-03 06:15:03',	1,	'N'),
(12832,	'2015-02-14',	'00:00:00',	0,	'Sonstiges',	'',	'SONSTIGES',	-5.98,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'HORST',	'N',	0,	'',	'',	'',	'2015-02-15 13:23:22',	1,	'N'),
(12842,	'2015-01-02',	'21:15:10',	0,	'Einkauf Kiosk',	'',	'EINKAUF',	-4.90,	'CHRIS',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-02-15 13:29:47',	1,	'N'),
(12843,	'2015-01-01',	'11:57:57',	0,	'Cappuccino',	'',	'CHRIS_PRIVAT',	-3.25,	'CHRIS',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-02-15 13:29:47',	1,	'N'),
(12905,	'2015-02-28',	'12:40:23',	0,	'Abhebung',	'',	'ABHEBUNG',	200.00,	'CHRIS',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-03-03 06:34:16',	1,	'N'),
(12904,	'2015-02-28',	'13:34:37',	0,	'Geld An Horst',	'',	'UMBUCH',	-150.00,	'CHRIS',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-03-03 06:34:16',	1,	'N'),
(12846,	'2015-02-15',	'00:00:00',	0,	'Eis',	'',	'FAMILIE',	-10.00,	'CHRIS',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'(ohne)',	'N',	0,	'',	'',	'',	'2015-02-15 13:35:41',	1,	'N'),
(12847,	'2015-02-28',	'00:00:00',	10,	'Kaufland Einkauf',	'',	'EINKAUF',	57.30,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-03-03 06:09:54',	1,	'N'),
(12848,	'2015-02-28',	'00:00:00',	11,	'Kaufland Einkauf',	'',	'HAUSHALT',	-1.50,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	5,	'',	'',	'',	'2015-03-03 06:09:54',	1,	'N'),
(12849,	'2015-02-28',	'00:00:00',	12,	'Kaufland Einkauf',	'',	'KIND',	-10.24,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	5,	'',	'',	'',	'2015-03-03 06:09:54',	1,	'N'),
(12850,	'2015-02-28',	'00:00:00',	13,	'Kaufland Einkauf',	'',	'LEBEN',	-45.56,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	5,	'',	'',	'',	'2015-03-03 06:09:54',	1,	'N'),
(12851,	'2015-02-28',	'00:00:00',	14,	'Aldi Einkauf',	'',	'EINKAUF',	29.86,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-03-03 06:09:54',	1,	'N'),
(12852,	'2015-02-28',	'00:00:00',	15,	'Aldi Einkauf',	'',	'KIND',	-6.99,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	3,	'',	'',	'',	'2015-03-03 06:09:54',	1,	'N'),
(12853,	'2015-02-28',	'00:00:00',	16,	'Aldi Einkauf',	'',	'LEBEN',	-22.87,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	3,	'',	'',	'',	'2015-03-03 06:09:54',	1,	'N'),
(12877,	'2015-02-18',	'12:24:03',	3,	'Einkauf Rewe',	'',	'EINKAUF',	-8.11,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'HORST',	'N',	0,	'CSVIMPORT',	'',	'horald-Easynote',	'2015-03-03 06:29:55',	1,	'N'),
(12878,	'2015-02-18',	'08:17:02',	1,	'kassensturz 32.17',	'',	'UMBUCH',	2.00,	'HORST',	'',	32.17,	'0000-00-00',	0.00,	'',	0,	'HORST',	'N',	0,	'CSVIMPORT',	'',	'horald-Easynote',	'2015-03-03 06:32:02',	1,	'N'),
(12879,	'2015-02-18',	'08:00:32',	0,	'brÃƒÂ¶tchen',	'',	'LEBENHORST',	-0.75,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-03-03 06:15:03',	1,	'N'),
(12880,	'2015-02-17',	'07:45:13',	0,	'brÃƒÂ¶tchen',	'',	'LEBENHORST',	-0.75,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-03-03 06:15:03',	1,	'N'),
(12881,	'2015-02-16',	'12:30:14',	0,	'Kaffee U Kuchen',	'',	'FAMILIE',	-8.99,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-03-03 06:15:03',	1,	'N'),
(12882,	'2015-02-15',	'12:30:28',	0,	'kirchenspende',	'',	'SPENDE',	-4.00,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-03-03 06:15:03',	1,	'N'),
(12883,	'2015-02-14',	'21:12:39',	0,	'kassensturz 46.66',	'',	'UMBUCH',	-2.00,	'HORST',	'',	46.66,	'0000-00-00',	0.00,	'',	0,	'HORST',	'N',	0,	'CSVIMPORT',	'',	'horald-Easynote',	'2015-03-03 06:19:59',	1,	'N'),
(12884,	'2015-02-14',	'19:14:38',	0,	'Lose',	'',	'FAMILIE',	-2.00,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-03-03 06:15:03',	1,	'N'),
(12885,	'2015-02-13',	'18:30:19',	9,	'kassensturz 54.64',	'',	'UMBUCH',	3.50,	'HORST',	'',	54.64,	'0000-00-00',	0.00,	'',	0,	'HORST',	'N',	0,	'CSVIMPORT',	'',	'horald-Easynote',	'2015-03-03 06:18:54',	1,	'N'),
(12886,	'2015-02-13',	'18:28:12',	0,	'Essen Backwerk',	'',	'LEBENHORST',	-1.99,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-03-03 06:15:03',	1,	'N'),
(12887,	'2015-02-13',	'18:27:38',	0,	'Abhebung',	'',	'ABHEBUNG',	50.00,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-03-03 06:15:03',	1,	'N'),
(12888,	'2015-02-13',	'12:15:27',	0,	'Einkauf Rewe',	'',	'EINKAUF',	-8.18,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-03-03 06:15:03',	1,	'N'),
(12889,	'2015-02-13',	'07:45:56',	0,	'brÃƒÂ¶tchen',	'',	'LEBENHORST',	-0.75,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-03-03 06:15:03',	1,	'N'),
(12890,	'2015-02-12',	'07:54:47',	0,	'brÃƒÂ¶tchen',	'',	'LEBENHORST',	-0.75,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-03-03 06:15:03',	1,	'N'),
(12891,	'2015-02-10',	'08:20:47',	0,	'brÃƒÂ¶tchen',	'',	'LEBENHORST',	-0.75,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-03-03 06:15:03',	1,	'N'),
(12892,	'2015-02-09',	'08:04:41',	0,	'brÃƒÂ¶tchen',	'',	'LEBENHORST',	-0.75,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-03-03 06:15:03',	1,	'N'),
(12893,	'2015-02-08',	'11:40:09',	0,	'Kaffee U Kuchen',	'',	'FAMILIE',	-11.30,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-03-03 06:15:03',	1,	'N'),
(12894,	'2015-02-06',	'11:08:06',	0,	'brÃƒÂ¶tchen',	'',	'LEBENHORST',	-0.75,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-03-03 06:15:03',	1,	'N'),
(12895,	'2015-02-05',	'07:47:23',	0,	'brÃƒÂ¶tchen',	'',	'LEBENHORST',	-0.75,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-03-03 06:15:03',	1,	'N'),
(12896,	'2015-02-04',	'12:47:15',	0,	'Abhebung',	'',	'ABHEBUNG',	50.00,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-03-03 06:15:03',	1,	'N'),
(12897,	'2015-02-04',	'07:58:56',	0,	'brÃƒÂ¶tchen',	'',	'LEBENHORST',	-0.75,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-03-03 06:15:03',	1,	'N'),
(12898,	'2015-02-03',	'12:33:42',	0,	'Einkauf Rewe',	'',	'EINKAUF',	-1.98,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-03-03 06:15:03',	1,	'N'),
(12899,	'2015-02-03',	'09:04:46',	0,	'brÃƒÂ¶tchen',	'',	'LEBENHORST',	-0.75,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-03-03 06:15:03',	1,	'N'),
(12900,	'2015-02-02',	'12:34:07',	0,	'Einkauf Rewe',	'',	'EINKAUF',	-1.98,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-03-03 06:15:03',	1,	'N'),
(12901,	'2015-02-02',	'08:59:13',	0,	'brÃƒÂ¶tchen',	'',	'LEBENHORST',	-0.75,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-03-03 06:15:03',	1,	'N'),
(12902,	'2015-02-01',	'13:26:45',	0,	'kassensturz 6.75',	'',	'UMBUCH',	-3.50,	'HORST',	'',	6.75,	'0000-00-00',	0.00,	'',	0,	'HORST',	'N',	0,	'CSVIMPORT',	'',	'horald-Easynote',	'2015-03-03 06:16:27',	1,	'N'),
(12903,	'2015-02-01',	'11:27:33',	0,	'kirchenspende',	'',	'SPENDE',	-3.50,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-03-03 06:15:03',	1,	'N'),
(12906,	'2015-02-21',	'12:35:42',	0,	'Kaffee U Kuchen',	'',	'FAMILIE',	-11.03,	'CHRIS',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-03-03 06:34:16',	1,	'N'),
(12907,	'2015-02-15',	'14:24:28',	0,	'Eis',	'',	'FAMILIE',	-10.00,	'CHRIS',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-03-03 06:34:16',	1,	'N'),
(12908,	'2015-02-14',	'21:07:55',	0,	'kassensturz 26.99',	'',	'SONSTIGES',	15.56,	'CHRIS',	'',	26.99,	'0000-00-00',	0.00,	'',	0,	'HORST',	'N',	0,	'CSVIMPORT',	'',	'horald-Easynote',	'2015-03-03 06:36:15',	1,	'N'),
(12909,	'2015-02-06',	'19:52:13',	0,	'Essen',	'',	'FAMILIE',	-28.00,	'CHRIS',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'HORST',	'N',	0,	'CSVIMPORT',	'',	'horald-Easynote',	'2015-03-03 06:34:46',	1,	'N'),
(12910,	'2015-03-21',	'00:00:00',	10,	'Aldi ',	'',	'LASTSCHRIFT',	31.72,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'HORST',	'N',	0,	'',	'',	'horald-Easynote',	'2015-03-23 06:08:39',	1,	'N'),
(12911,	'2015-03-21',	'00:00:00',	11,	'Aldi Einkauf',	'',	'HAUSHALT',	-3.10,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	3,	'',	'',	'',	'2015-03-23 06:07:24',	1,	'N'),
(12912,	'2015-03-21',	'00:00:00',	12,	'Aldi Einkauf',	'',	'LEBEN',	-28.62,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	3,	'',	'',	'',	'2015-03-23 06:07:24',	1,	'N'),
(12913,	'2015-03-21',	'00:00:00',	13,	'Kaufland ',	'',	'LASTSCHRIFT',	30.53,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'HORST',	'N',	0,	'',	'',	'horald-Easynote',	'2015-03-23 06:09:01',	1,	'N'),
(12914,	'2015-03-21',	'00:00:00',	14,	'Kaufland Einkauf',	'',	'HAUSHALT',	-4.95,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	5,	'',	'',	'',	'2015-03-23 06:07:24',	1,	'N'),
(12915,	'2015-03-21',	'00:00:00',	15,	'Kaufland Einkauf',	'',	'KIND',	-1.49,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	5,	'',	'',	'',	'2015-03-23 06:07:24',	1,	'N'),
(12916,	'2015-03-21',	'00:00:00',	16,	'Kaufland Einkauf',	'',	'LEBEN',	-24.09,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	5,	'',	'',	'',	'2015-03-23 06:07:24',	1,	'N'),
(12917,	'2015-03-21',	'00:00:00',	17,	'Alnatura ',	'',	'LASTSCHRIFT',	18.38,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'HORST',	'N',	0,	'',	'',	'horald-Easynote',	'2015-03-23 06:09:23',	1,	'N'),
(12918,	'2015-03-21',	'00:00:00',	18,	'Alnatura Einkauf',	'',	'LEBEN',	-6.48,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	1852,	'',	'',	'',	'2015-03-23 06:07:24',	1,	'N'),
(12919,	'2015-03-21',	'00:00:00',	19,	'Alnatura Einkauf',	'',	'PFLEGE',	-11.90,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	1852,	'',	'',	'',	'2015-03-23 06:07:24',	1,	'N'),
(12920,	'2015-03-28',	'00:00:00',	10,	'Penny ',	'',	'LASTSCHRIFT',	9.61,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'HORST',	'N',	0,	'',	'',	'horald-Easynote',	'2015-03-30 05:33:10',	1,	'N'),
(12921,	'2015-03-28',	'00:00:00',	11,	'Penny Einkauf',	'',	'HAUSHALT',	-1.00,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	7,	'',	'',	'',	'2015-03-30 05:32:08',	1,	'N'),
(12922,	'2015-03-28',	'00:00:00',	12,	'Penny Einkauf',	'',	'LEBEN',	-8.61,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	7,	'',	'',	'',	'2015-03-30 05:32:08',	1,	'N'),
(12923,	'2015-03-28',	'00:00:00',	13,	'Kaufland ',	'',	'LASTSCHRIFT',	39.77,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'HORST',	'N',	0,	'',	'',	'horald-Easynote',	'2015-03-30 05:33:31',	1,	'N'),
(12924,	'2015-03-28',	'00:00:00',	14,	'Kaufland Einkauf',	'',	'HAUSHALT',	-12.99,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	5,	'',	'',	'',	'2015-03-30 05:32:08',	1,	'N'),
(12925,	'2015-03-28',	'00:00:00',	15,	'Kaufland Einkauf',	'',	'LEBEN',	-24.80,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	5,	'',	'',	'',	'2015-03-30 05:32:08',	1,	'N'),
(12926,	'2015-03-28',	'00:00:00',	16,	'Kaufland Einkauf',	'',	'LEBEN_HORST',	-1.98,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	5,	'',	'',	'',	'2015-03-30 05:32:08',	1,	'N'),
(12942,	'2015-04-04',	'00:00:00',	10,	'Aldi Einkauf',	'',	'EINKAUF',	23.39,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-04-07 05:31:58',	1,	'N'),
(12943,	'2015-04-04',	'00:00:00',	11,	'Aldi Einkauf',	'',	'HAUSHALT',	-2.40,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	3,	'',	'',	'',	'2015-04-07 05:31:58',	1,	'N'),
(12944,	'2015-04-04',	'00:00:00',	12,	'Aldi Einkauf',	'',	'LEBEN',	-20.99,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	3,	'',	'',	'',	'2015-04-07 05:31:58',	1,	'N'),
(12945,	'2015-04-04',	'00:00:00',	13,	'Kaufland Einkauf',	'',	'EINKAUF',	39.63,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-04-07 05:31:58',	1,	'N'),
(12946,	'2015-04-04',	'00:00:00',	14,	'Kaufland Einkauf',	'',	'KIND',	-2.49,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	5,	'',	'',	'',	'2015-04-07 05:31:58',	1,	'N'),
(12947,	'2015-04-04',	'00:00:00',	15,	'Kaufland Einkauf',	'',	'LEBEN',	-37.14,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	5,	'',	'',	'',	'2015-04-07 05:31:58',	1,	'N'),
(12948,	'2015-04-11',	'00:00:00',	10,	'Kaufland ',	'',	'LASTSCHRIFT',	76.10,	'Bank_Horst',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'HORST',	'N',	0,	'EINKAUF',	'',	'horald-Easynote',	'2015-04-28 16:10:45',	1,	'N'),
(12949,	'2015-04-11',	'00:00:00',	11,	'Kaufland Einkauf',	'',	'HAUSHALT',	-25.22,	'Bank_Horst',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'HORST',	'N',	5,	'EINKAUF',	'',	'horald-Easynote',	'2015-04-28 16:11:19',	1,	'N'),
(12950,	'2015-04-11',	'00:00:00',	12,	'Kaufland Einkauf',	'',	'KIND',	-20.69,	'Bank_Horst',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'HORST',	'N',	5,	'EINKAUF',	'',	'horald-Easynote',	'2015-04-28 16:11:36',	1,	'N'),
(12951,	'2015-04-11',	'00:00:00',	13,	'Kaufland Einkauf',	'',	'LEBEN',	-30.19,	'Bank_Horst',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'HORST',	'N',	5,	'EINKAUF',	'',	'horald-Easynote',	'2015-04-28 16:11:50',	1,	'N'),
(12952,	'2015-04-11',	'00:00:00',	14,	'Aldi ',	'',	'LASTSCHRIFT',	30.20,	'Bank_Horst',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'HORST',	'N',	0,	'EINKAUF',	'',	'horald-Easynote',	'2015-04-28 16:12:45',	1,	'N'),
(12953,	'2015-04-11',	'00:00:00',	15,	'Aldi Einkauf',	'',	'HAUSHALT',	-2.74,	'Bank_Horst',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'HORST',	'N',	3,	'EINKAUF',	'',	'horald-Easynote',	'2015-04-28 16:12:58',	1,	'N'),
(12954,	'2015-04-11',	'00:00:00',	16,	'Aldi Einkauf',	'',	'KIND',	-0.49,	'Bank_Horst',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'HORST',	'N',	3,	'EINKAUF',	'',	'horald-Easynote',	'2015-04-28 16:13:25',	1,	'N'),
(12955,	'2015-04-11',	'00:00:00',	17,	'Aldi Einkauf',	'',	'LEBEN',	-26.97,	'Bank_Horst',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'HORST',	'N',	3,	'EINKAUF',	'',	'horald-Easynote',	'2015-04-28 16:13:47',	1,	'N'),
(12957,	'2015-04-24',	'00:00:00',	0,	'Kassensturz',	'',	'SONSTIGES',	0.00,	'HORST',	'',	147.59,	'0000-00-00',	0.00,	'',	0,	'(ohne)',	'N',	0,	'',	'',	'',	'2015-04-24 15:39:13',	1,	'N'),
(12958,	'2015-04-25',	'00:00:00',	10,	'Aldi Einkauf',	'',	'EINKAUF',	50.92,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-04-27 05:28:04',	1,	'N'),
(12959,	'2015-04-25',	'00:00:00',	11,	'Aldi Einkauf',	'',	'KIND',	-6.99,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	3,	'',	'',	'',	'2015-04-27 05:28:04',	1,	'N'),
(12960,	'2015-04-25',	'00:00:00',	12,	'Aldi Einkauf',	'',	'LEBEN',	-43.93,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	3,	'',	'',	'',	'2015-04-27 05:28:04',	1,	'N'),
(12961,	'2015-04-25',	'00:00:00',	13,	'Kaufland Einkauf',	'',	'EINKAUF',	65.23,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-04-27 05:28:04',	1,	'N'),
(12962,	'2015-04-25',	'00:00:00',	14,	'Kaufland Einkauf',	'',	'HAUSHALT',	-10.29,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	5,	'',	'',	'',	'2015-04-27 05:28:04',	1,	'N'),
(12963,	'2015-04-25',	'00:00:00',	15,	'Kaufland Einkauf',	'',	'KIND',	-2.99,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	5,	'',	'',	'',	'2015-04-27 05:28:04',	1,	'N'),
(12964,	'2015-04-25',	'00:00:00',	16,	'Kaufland Einkauf',	'',	'LEBEN',	-49.00,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	5,	'',	'',	'',	'2015-04-27 05:28:04',	1,	'N'),
(12965,	'2015-04-25',	'00:00:00',	17,	'Kaufland Einkauf',	'',	'PFLEGE',	-2.95,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	5,	'',	'',	'',	'2015-04-27 05:28:04',	1,	'N'),
(13052,	'2015-02-02',	'00:00:00',	0,	'SEPA LASTSCHRIFT KOELNER VERKEHRS-BETRIEBE AG Kundenreferenz : AB33977505 144226108 GlÃ¤ubiger-ID : DE74KVB00000041511 Mandatsreferenz : 33977505-1 Mandatsdatum : 2014-07-01',	'I',	'KIND',	-60.40,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-04-28 19:54:53',	1,	'N'),
(12967,	'2015-04-01',	'00:00:00',	0,	'',	'',	'GEHALTCHRIS',	1000.00,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'(ohne)',	'N',	0,	'',	'',	'',	'2015-04-28 05:32:14',	1,	'N'),
(12968,	'2015-03-31',	'00:00:00',	0,	'Endbestand',	'',	'UMBUCH',	-1170.52,	'Bank_Horst',	'',	62.27,	'0000-00-00',	0.00,	'',	0,	'HORST',	'N',	0,	'FIX',	'',	'horald-Easynote',	'2015-04-28 19:31:54',	1,	'N'),
(13051,	'2015-02-02',	'00:00:00',	0,	'AUSFÃœHRUNG DAUERAUFTRAG AUFTRAGSNUMMER 0300005 BAD HOMBURGER INKASSO GMBH KONTO HELADEFFXXX / DE62500500000014700009 GESCHAEFTSZEICHEN 1683388',	'I',	'SCHULDEN',	-150.00,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-04-28 19:54:53',	1,	'N'),
(13050,	'2015-04-07',	'00:00:00',	0,	'LOHN  GEHALT 2015040112585301000000006000001865Verdienstabrechnung 03.15/1 MAUSER CORPORATE GMBH',	'I',	'GEHALTHORST',	2026.36,	'Bank_Horst',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-04-28 19:25:52',	1,	'N'),
(13049,	'2015-04-07',	'00:00:00',	0,	'DAUERAUFTRAG MIETE + NEBENKOSTEN HILDEGARD HELFF',	'I',	'MIETE',	-980.00,	'Bank_Horst',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-04-28 19:25:52',	1,	'N'),
(13047,	'2015-04-08',	'00:00:00',	0,	'LADEVORGANG PREPAID - KARTE VOM 06.04.2015 23.33 UHRMOBILFUNKNR01602142358CONGSTAR GMBH HB-HANDY-LADEN, TAN 826982',	'I',	'TELEFON',	-30.00,	'Bank_Horst',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-04-28 19:25:52',	1,	'N'),
(13048,	'2015-04-07',	'00:00:00',	0,	'DAUERAUFTRAG GARAGENMIETE HILDEGARD HELFF',	'I',	'MIETE',	-30.00,	'Bank_Horst',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-04-28 19:25:52',	1,	'N'),
(13046,	'2015-04-10',	'00:00:00',	0,	'LADEVORGANG PREPAID - KARTE VOM 08.04.2015 23.10 UHRMOBILFUNKNR016096700923CONGSTAR GMBH HB-HANDY-LADEN, TAN 184461',	'I',	'TELEFON',	-15.00,	'Bank_Horst',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-04-28 19:25:52',	1,	'N'),
(13043,	'2015-04-13',	'00:00:00',	0,	'ONLINE-UEBERWEISUNG KREF+P20150413023848KUNDENNR. 10412030 RECHNUNG 02 2015DATUM 12.04.2015, 17.01 UHR1.TAN 416437 NetCologne GmbH',	'I',	'TELEFON',	-46.62,	'Bank_Horst',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-04-28 19:25:52',	1,	'N'),
(13044,	'2015-04-13',	'00:00:00',	0,	'ONLINE-UEBERWEISUNG KREF+P201504130229025299 5321 9002 3235DATUM 12.04.2015, 16.56 UHR1.TAN 208986 Kreissparkasse KÃ¶ln',	'I',	'MASTERCARD',	-100.00,	'Bank_Horst',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'HORST',	'N',	0,	'',	'',	'horald-Easynote',	'2015-04-28 19:43:06',	1,	'N'),
(13045,	'2015-04-13',	'00:00:00',	0,	'ONLINE-UEBERWEISUNG KREF+P20150413022422Geschaeftszeichen 100181167 zweite RatenDATUM 12.04.2015, 16.54 UHR1.TAN 519188 Creditreform Darmstadt Skoruppa KG',	'I',	'SCHULDEN',	-100.00,	'Bank_Horst',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-04-28 19:25:52',	1,	'N'),
(13042,	'2015-04-13',	'00:00:00',	0,	'ONLINE-UEBERWEISUNG KREF+P20150413070754KUNDENNR. 10412030 RECHNUNG 03 2015DATUM 12.04.2015, 17.03 UHR1.TAN 763105 NetCologne GmbH',	'I',	'TELEFON',	-59.55,	'Bank_Horst',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-04-28 19:25:52',	1,	'N'),
(13041,	'2015-04-13',	'00:00:00',	0,	'SONSTIGER EINZUG EC 65443405 110415142509OC1 ALDI SUED SAGT DANKE',	'I',	'LASTSCHRIFT',	-30.20,	'Bank_Horst',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-04-28 19:25:52',	1,	'N'),
(13039,	'2015-04-13',	'00:00:00',	0,	'GELDAUTOMAT 13.04/12.14UHR 120  B.BNP GA NR00003715 BLZ37050299 1',	'I',	'ABHEBUNG',	-50.00,	'Bank_Horst',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-04-28 19:25:52',	1,	'N'),
(13040,	'2015-04-13',	'00:00:00',	0,	'LASTSCHRIFT ELV61302497 11.04 15.41 ME1 KAUFLAND SAGT DANKE',	'I',	'EINKAUF',	-76.10,	'Bank_Horst',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-04-28 19:25:52',	1,	'N'),
(13036,	'2015-04-20',	'00:00:00',	0,	'LASTSCHRIFT ELV61302498 18.04 15.10 ME1 KAUFLAND SAGT DANKE',	'I',	'EINKAUF',	-40.35,	'Bank_Horst',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-04-28 19:25:52',	1,	'N'),
(13037,	'2015-04-20',	'00:00:00',	0,	'SONSTIGER EINZUG EC 65482547 180415130257OC1 MEDIA MARKT DANKT 65482547',	'I',	'EINKAUF',	-37.98,	'Bank_Horst',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-04-28 19:25:52',	1,	'N'),
(13038,	'2015-04-15',	'00:00:00',	0,	'DAUERAUFTRAG SPAREINLAGE HORST MEYER',	'I',	'SPAREINLAGE',	-45.00,	'Bank_Horst',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-04-28 19:25:52',	1,	'N'),
(13035,	'2015-04-20',	'00:00:00',	0,	'SONSTIGER EINZUG EC 65443605 180415140612OC1 ALDI SUED SAGT DANKE',	'I',	'LASTSCHRIFT',	-33.26,	'Bank_Horst',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-04-28 19:25:52',	1,	'N'),
(13033,	'2015-04-24',	'00:00:00',	0,	'GELDAUTOMAT 24.04/12.18UHR 120  B.BNP GA NR00003715 BLZ37050299 1',	'I',	'ABHEBUNG',	-150.00,	'Bank_Horst',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-04-28 19:25:52',	1,	'N'),
(13034,	'2015-04-22',	'00:00:00',	0,	'FOLGELASTSCHRIFT 24016491504081MREF+240164900CRED+DE89SGR0000000215024016491504081 Ihre Flinkster-lokal-Rechnung vom08.04.15ABWA+Flinkster - lokal DB Rent GmbH',	'I',	'FLINKSTER',	-241.01,	'Bank_Horst',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-04-28 19:25:52',	1,	'N'),
(13032,	'2015-04-28',	'00:00:00',	0,	'LADEVORGANG PREPAID - KARTE  HB-HANDY-LADEN, TAN 023071',	'I',	'TELEFON',	-15.00,	'Bank_Horst',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-04-28 19:25:52',	1,	'N'),
(13053,	'2015-02-02',	'00:00:00',	0,	'SEPA LASTSCHRIFT Musicfactory Musikschulgebuehr Febr 15 Kundenreferenz : iMikel1-T-0278-36673562649236 GlÃ¤ubiger-ID : DE37MUF00000997239 Mandatsreferenz : 101961001 Mandatsdatum : 2013-11-01',	'I',	'KIND',	-28.00,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-04-28 19:54:53',	1,	'N'),
(13054,	'2015-02-02',	'00:00:00',	0,	'GAA-AUSZAHLUNG 028589 1712 0495 GA NR00003173 BLZ37050198 030 01/09 01UHR MERKENICH EUR 20 00 00C3800004800001180028015 0FA50BA030C000000000000000 0000000F101501280100000000 000000000000 A00000005945430100 0203006040201400000000 0002',	'I',	'GEBUEHR',	-20.00,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-04-28 19:54:53',	1,	'N'),
(13055,	'2015-02-02',	'00:00:00',	0,	'GEBÃœHR FÃœR GAA-AUSZAHLUNG',	'I',	'GEBUEHR',	-4.95,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-04-28 19:54:53',	1,	'N'),
(13056,	'2015-02-03',	'00:00:00',	0,	'SEPA LASTSCHRIFT AMAZON EU S A R L 302-9425255-4065103 Amazon de 1054990769059465 Kundenreferenz : 1054990769059465 GlÃ¤ubiger-ID : DE24ZZZ00000561652 Mandatsreferenz : kCB?plCILNO(vCD)WToJCNIo?hB5?M Mandatsdatum : 2014-06-13',	'I',	'EINKAUF',	-15.94,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-04-28 19:54:53',	1,	'N'),
(13057,	'2015-02-03',	'00:00:00',	0,	'POS MIT UNTERSCHRIFT 5057676 PENNY SAGT DANKE 33300582 020210410576760171256000213',	'I',	'EINKAUF',	-13.15,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-04-28 19:54:53',	1,	'N'),
(13058,	'2015-02-03',	'00:00:00',	0,	'SEPA LASTSCHRIFT AMAZON EU S A R L 302-9425255-4065103 Amazon de 1054985668544399 Kundenreferenz : 1054985668544399 GlÃ¤ubiger-ID : DE24ZZZ00000561652 Mandatsreferenz : kCB?plCILNO(vCD)WToJCNIo?hB5?M Mandatsdatum : 2014-06-13',	'I',	'EINKAUF',	-7.99,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-04-28 19:54:53',	1,	'N'),
(13059,	'2015-02-04',	'00:00:00',	0,	'POS MIT PIN F681936681936 00000 DM DROGERIEMARKT SAGT DANKEEC 65053856 020215194103OC0',	'I',	'EINKAUF',	-22.50,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-04-28 19:54:53',	1,	'N'),
(13060,	'2015-02-04',	'00:00:00',	0,	'POS MIT UNTERSCHRIFT 5057778 PENNY SAGT DANKE 33300582 030208030577780171256000213',	'I',	'EINKAUF',	-15.87,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-04-28 19:54:53',	1,	'N'),
(13061,	'2015-02-05',	'00:00:00',	0,	'POS MIT PIN F057893057893 00000 PENNY SAGT DANKE 33300582 EC 56000213 040215083758OC0',	'I',	'EINKAUF',	-19.40,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-04-28 19:54:53',	1,	'N'),
(13062,	'2015-02-06',	'00:00:00',	0,	'POS MIT UNTERSCHRIFT 5058006 PENNY SAGT DANKE 33300582 050208310580060171256000213',	'I',	'EINKAUF',	-19.34,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-04-28 19:54:53',	1,	'N'),
(13063,	'2015-02-06',	'00:00:00',	0,	'POS MIT PIN F058008058008 00000 PENNY SAGT DANKE 33300582 EC 56000213 050215083337OC0',	'I',	'EINKAUF',	-3.99,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-04-28 19:54:53',	1,	'N'),
(13064,	'2015-02-09',	'00:00:00',	0,	'GAA-AUSZAHLUNG 000301 1712 0495 GA NR00003173 BLZ37050198 006 02/14 47UHR MERKENICH EUR 50 00 00C7800004800001180028015 0FA50BA030C000000000000000 0000000F101502050100000000 000000000000 A00000005945430100 0203006040201400000000 0002',	'I',	'GEBUEHR',	-50.00,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-04-28 19:54:53',	1,	'N'),
(13065,	'2015-02-09',	'00:00:00',	0,	'POS MIT PIN F010776010776 00000 CINEDOM KOELN EC 60519070 060215185945OC0',	'I',	'UMBUCH',	-21.80,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-04-28 19:54:53',	1,	'N'),
(13066,	'2015-02-09',	'00:00:00',	0,	'POS MIT UNTERSCHRIFT 5058115 PENNY SAGT DANKE 33300582 060208370581150171256000213',	'I',	'EINKAUF',	-6.49,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-04-28 19:54:53',	1,	'N'),
(13067,	'2015-02-09',	'00:00:00',	0,	'GEBÃœHR FÃœR GAA-AUSZAHLUNG',	'I',	'GEBUEHR',	-4.95,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-04-28 19:54:53',	1,	'N'),
(13068,	'2015-02-10',	'00:00:00',	0,	'GAA-AUSZAHLUNG 000892 1712 0495 GA NR00003173 BLZ37050198 009 02/17 07UHR MERKENICH EUR 30 00 00C9800004800001180028015 0FA50BA030C000000000000000 0000000F101502060100000000 000000000000 A00000005945430100 0203006040201400000000 0002',	'I',	'GEBUEHR',	-30.00,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-04-28 19:54:53',	1,	'N'),
(13069,	'2015-02-10',	'00:00:00',	0,	'POS MIT UNTERSCHRIFT 5058391 PENNY SAGT DANKE 33300582 090208280583910171256000213',	'I',	'EINKAUF',	-23.29,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-04-28 19:54:53',	1,	'N'),
(13070,	'2015-02-10',	'00:00:00',	0,	'GEBÃœHR FÃœR GAA-AUSZAHLUNG',	'I',	'GEBUEHR',	-4.95,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-04-28 19:54:53',	1,	'N'),
(13071,	'2015-02-12',	'00:00:00',	0,	'GUTSCHRIFT Bundesagentur fuer Arbeit - Familienkasse KG357357FK149064 0215 28017715559/3000043609926 KUNDENREFERENZ : 28017715559',	'I',	'GUTSCHRIFT',	184.00,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-04-28 19:54:53',	1,	'N'),
(13072,	'2015-02-12',	'00:00:00',	0,	'POS MIT UNTERSCHRIFT 5216049 00000000 9728000000 ALNATURA DANKT ELV94312931 11 02 09 15 ME0',	'I',	'LEBEN',	-57.71,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-04-28 19:54:53',	1,	'N'),
(13073,	'2015-02-12',	'00:00:00',	0,	'LASTSCHRIFT PFAUEN APOTHEKE KOELN 110208440048846171222898000ELV65228980 11 02 08 44 ME0',	'I',	'MED',	-11.70,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-04-28 19:54:53',	1,	'N'),
(13074,	'2015-02-13',	'00:00:00',	0,	'SEPA LASTSCHRIFT DEVK Vertragskonto Z00006939535BELEG 598008097231DEVK-Grupp e sagt Danke Kundenreferenz : 598008097231 GlÃ¤ubiger-ID : DE30ZZZ00000000884 Mandatsreferenz : INK0029510016 Mandatsdatum : 2013-10-12',	'I',	'VERSICHERUNG',	-41.21,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-04-28 19:54:53',	1,	'N'),
(13075,	'2015-02-13',	'00:00:00',	0,	'GAA-AUSZAHLUNG 001521 1712 0495 GA NR00003173 BLZ37050198 012 02/12 49UHR MERKENICH EUR 30 00 00CB800004800001180028015 0FA50BA030C000000000000000 0000000F101502110100000000 000000000000 A00000005945430100 0203006040201400000000 0002',	'I',	'GEBUEHR',	-30.00,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-04-28 19:54:53',	1,	'N'),
(13076,	'2015-02-13',	'00:00:00',	0,	'POS MIT PIN F580874580874 00000 DM DROGERIEMARKT SAGT DANKEEC 65132070 110215093258OC0',	'I',	'EINKAUF',	-14.70,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-04-28 19:54:53',	1,	'N'),
(13077,	'2015-02-13',	'00:00:00',	0,	'GEBÃœHR FÃœR GAA-AUSZAHLUNG',	'I',	'GEBUEHR',	-4.95,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-04-28 19:54:53',	1,	'N'),
(13078,	'2015-02-16',	'00:00:00',	0,	'SEPA LASTSCHRIFT World Vision Deutschland e V PID 001667575 RLS3766839 SIE-187277-0333 JENEBA Kundenreferenz : WORLDVISION-4115-423220000 GlÃ¤ubiger-ID : DE19ZZZ00000150171 Mandatsreferenz : 0016675750020 Mandatsdatum : 2014-07-31',	'I',	'SPENDE',	-30.00,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-04-28 19:54:53',	1,	'N'),
(13079,	'2015-02-16',	'00:00:00',	0,	'POS MIT PIN F058895058895 00000 PENNY SAGT DANKE 33300582 EC 56000213 130215150252OC0',	'I',	'EINKAUF',	-30.00,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-04-28 19:54:53',	1,	'N'),
(13080,	'2015-02-16',	'00:00:00',	0,	'POS MIT UNTERSCHRIFT 5058889 PENNY SAGT DANKE 33300582 130214260588890171256000213',	'I',	'EINKAUF',	-27.12,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-04-28 19:54:53',	1,	'N'),
(13081,	'2015-02-17',	'00:00:00',	0,	'ÃœBERWEISUNG TARGOBANK TBOL AM 17 02 2015 UM 11 47 12 17/0 PATRICK SELLHORN KTO DE41200400000133362400 ARTIKELNUMMER 121571331266 EBAYKAUF',	'I',	'UMBUCH',	-3.95,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-04-28 19:54:53',	1,	'N'),
(13082,	'2015-02-19',	'00:00:00',	0,	'POS MIT UNTERSCHRIFT 5059257 PENNY SAGT DANKE 33300582 180208370592570171256000213',	'I',	'EINKAUF',	-25.01,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-04-28 19:54:53',	1,	'N'),
(13083,	'2015-02-20',	'00:00:00',	0,	'POS MIT PIN F059398059398 00000 PENNY SAGT DANKE 33300582 EC 56000213 190215152100OC0',	'I',	'EINKAUF',	-24.97,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-04-28 19:54:53',	1,	'N'),
(13084,	'2015-02-20',	'00:00:00',	0,	'POS MIT UNTERSCHRIFT 5000814 00000000 9728000000 DEUTSCHE POST AG ELV94602838 19 02 15 14 ME0',	'I',	'UMBUCH',	-13.98,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-04-28 19:54:53',	1,	'N'),
(13085,	'2015-02-20',	'00:00:00',	0,	'POS MIT UNTERSCHRIFT 5059347 PENNY SAGT DANKE 33300582 190208590593470171256000213',	'I',	'EINKAUF',	-6.42,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-04-28 19:54:53',	1,	'N'),
(13086,	'2015-02-23',	'00:00:00',	0,	'GAA-AUSZAHLUNG 003168 1712 0495 GA NR00003173 BLZ37050198 020 02/13 12UHR MERKENICH EUR 50 00 00CE800004800001180028015 0FA50BA030C000000000000000 0000000F101502190100000000 000000000000 A00000005945430100 0203006040201400000000 0002',	'I',	'GEBUEHR',	-50.00,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-04-28 19:54:53',	1,	'N'),
(13087,	'2015-02-23',	'00:00:00',	0,	'POS MIT UNTERSCHRIFT 5217879 00000000 9728000000 ALNATURA DANKT ELV94312931 20 02 08 37 ME0',	'I',	'LEBEN',	-40.51,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-04-28 19:54:53',	1,	'N'),
(13088,	'2015-02-23',	'00:00:00',	0,	'SEPA LASTSCHRIFT AMAZON EU S A R L 305-2296575-3953108 Amazon de 0219318531199259 Kundenreferenz : 0219318531199259 GlÃ¤ubiger-ID : DE24ZZZ00000561652 Mandatsreferenz : kCB?plCILNO(vCD)WToJCNIo?hB5?M Mandatsdatum : 2014-06-13',	'I',	'EINKAUF',	-16.90,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-04-28 19:54:53',	1,	'N'),
(13089,	'2015-02-23',	'00:00:00',	0,	'SEPA LASTSCHRIFT AMAZON EU S A R L 305-7707048-9288328 Amazon de 0658423571983911 Kundenreferenz : 0658423571983911 GlÃ¤ubiger-ID : DE24ZZZ00000561652 Mandatsreferenz : kCB?plCILNO(vCD)WToJCNIo?hB5?M Mandatsdatum : 2014-06-13',	'I',	'EINKAUF',	-8.99,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-04-28 19:54:53',	1,	'N'),
(13090,	'2015-02-23',	'00:00:00',	0,	'GEBÃœHR FÃœR GAA-AUSZAHLUNG',	'I',	'GEBUEHR',	-4.95,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-04-28 19:54:53',	1,	'N'),
(13091,	'2015-02-25',	'00:00:00',	0,	'SEPA LASTSCHRIFT AMAZON PAYMENTS EUROPE S C A 305-1208511-0637942 Amazon Mktplce EU-DE 151674092594 1976 Kundenreferenz : 1516740925941976 GlÃ¤ubiger-ID : DE94ZZZ00000561653 Mandatsreferenz : kCB?plCILNO(vCD)WToJCNIo?hB5?M Mandatsdatum : 2014-06-13',	'I',	'EINKAUF',	-19.49,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-04-28 19:54:53',	1,	'N'),
(13092,	'2015-02-26',	'00:00:00',	0,	'SEPA LASTSCHRIFT AMAZON PAYMENTS EUROPE S C A 305-0114827-5065967 Amazon Mktplce EU-DE 169772547323 9114 Kundenreferenz : 1697725473239114 GlÃ¤ubiger-ID : DE94ZZZ00000561653 Mandatsreferenz : kCB?plCILNO(vCD)WToJCNIo?hB5?M Mandatsdatum : 2014-06-13',	'I',	'EINKAUF',	-26.40,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-04-28 19:54:53',	1,	'N'),
(13093,	'2015-02-26',	'00:00:00',	0,	'POS MIT UNTERSCHRIFT 5059841 PENNY SAGT DANKE 33300582 250208260598410171256000213',	'I',	'EINKAUF',	-18.33,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-04-28 19:54:53',	1,	'N'),
(13094,	'2015-02-27',	'00:00:00',	0,	'LOHN / GEHALT / RENTE Kliniken Lohn/Gehalt 09202800/201502',	'I',	'GEHALTCHRIS',	894.00,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-04-28 19:54:53',	1,	'N'),
(13095,	'2015-02-27',	'00:00:00',	0,	'POS MIT UNTERSCHRIFT 5059933 PENNY SAGT DANKE 33300582 260208330599330171256000213',	'I',	'EINKAUF',	-24.14,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-04-28 19:54:53',	1,	'N'),
(13096,	'2015-01-31',	'00:00:00',	0,	'Endbestand',	'',	'UMBUCH',	-671.33,	'Bank_Horst',	'',	561.46,	'0000-00-00',	0.00,	'',	0,	'(ohne)',	'N',	0,	'',	'',	'',	'2015-04-28 20:00:55',	1,	'N'),
(13097,	'2015-02-26',	'00:00:00',	0,	'SONSTIGER EINZUG EC 54046210 250215132916OC1 HAAR ATELIER',	'I',	'UMBUCH',	-16.50,	'Bank_Horst',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-04-28 20:03:17',	1,	'N'),
(13098,	'2015-02-25',	'00:00:00',	0,	'FOLGELASTSCHRIFT 24016491502111MREF+240164900CRED+DE89SGR0000000215024016491502111 Ihre Flinkster-lokal-Rechnung vom11.02.15ABWA+Flinkster - lokal DB Rent GmbH',	'I',	'FLINKSTER',	-201.14,	'Bank_Horst',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-04-28 20:03:17',	1,	'N'),
(13099,	'2015-02-24',	'00:00:00',	0,	'GELDAUTOMAT 24.02/12.16UHR 120  B.BNP GA NR00003456 BLZ37050299 1',	'I',	'ABHEBUNG',	-50.00,	'Bank_Horst',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-04-28 20:03:17',	1,	'N'),
(13100,	'2015-02-24',	'00:00:00',	0,	'SONSTIGER EINZUG EC 53505363 230215122048OC1 THALIA-BUCHHANDLUNG',	'I',	'BUECHER',	-9.99,	'Bank_Horst',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-04-28 20:03:17',	1,	'N'),
(13101,	'2015-02-24',	'00:00:00',	0,	'SONSTIGER EINZUG EC 65395921 210215142255OC1 DM DROGERIEMARKT SAGT DANKE',	'I',	'EINKAUF',	-18.55,	'Bank_Horst',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-04-28 20:03:17',	1,	'N'),
(13102,	'2015-02-23',	'00:00:00',	0,	'LASTSCHRIFT ELV61302499 21.02 15.31 ME1 KAUFLAND SAGT DANKE',	'I',	'EINKAUF',	-35.03,	'Bank_Horst',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-04-28 20:03:17',	1,	'N'),
(13103,	'2015-02-23',	'00:00:00',	0,	'SONSTIGER EINZUG EC 65442179 210215140901OC1 ALDI SUED SAGT DANKE',	'I',	'LASTSCHRIFT',	-13.35,	'Bank_Horst',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-04-28 20:03:17',	1,	'N'),
(13104,	'2015-02-17',	'00:00:00',	0,	'SONSTIGER EINZUG EC 54027710 160215105428OC1 LUDWIG 130303',	'I',	'UMBUCH',	-19.99,	'Bank_Horst',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-04-28 20:03:17',	1,	'N'),
(13105,	'2015-02-17',	'00:00:00',	0,	'LASTSCHRIFT ELV61302501 14.02 19.44 ME1 KAUFLAND SAGT DANKE',	'I',	'EINKAUF',	-48.65,	'Bank_Horst',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-04-28 20:03:17',	1,	'N'),
(13106,	'2015-02-16',	'00:00:00',	0,	'SONSTIGER EINZUG EC 65443405 140215185922OC1 ALDI SUED SAGT DANKE',	'I',	'LASTSCHRIFT',	-39.42,	'Bank_Horst',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-04-28 20:03:17',	1,	'N'),
(13107,	'2015-02-16',	'00:00:00',	0,	'DAUERAUFTRAG SPAREINLAGE HORST MEYER',	'I',	'SPAREINLAGE',	-45.00,	'Bank_Horst',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-04-28 20:03:17',	1,	'N'),
(13108,	'2015-02-13',	'00:00:00',	0,	'GELDAUTOMAT 13.02/17.42UHR 120  B.BNP GA NR00003456 BLZ37050299 1',	'I',	'ABHEBUNG',	-50.00,	'Bank_Horst',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-04-28 20:03:17',	1,	'N'),
(13109,	'2015-02-12',	'00:00:00',	0,	'ONLINE-UEBERWEISUNG KREF+P20150213134455Anzahlung Ferienwhg 11.07. bis 25.07.2015DATUM 11.02.2015, 23.14 UHR1.TAN 789231 Pesch, Hilde',	'I',	'UMBUCH',	-150.00,	'Bank_Horst',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-04-28 20:03:17',	1,	'N'),
(13110,	'2015-02-10',	'00:00:00',	0,	'FOLGELASTSCHRIFT 003906626211MREF+0020000119222CRED+DE74ZZZ00000045294KD-Nr. K5595059/ RG-Nr. 100017989006 1u1 Internet AG',	'I',	'UMBUCH',	-3.81,	'Bank_Horst',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-04-28 20:03:17',	1,	'N'),
(13111,	'2015-02-09',	'00:00:00',	0,	'EINZAHLUNG  ',	'I',	'UMBUCH',	125.00,	'Bank_Horst',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-04-28 20:03:17',	1,	'N'),
(13112,	'2015-02-09',	'00:00:00',	0,	'LASTSCHRIFT ELV61304468 07.02 14.41 ME1 KAUFLAND SAGT DANKE',	'I',	'EINKAUF',	-26.12,	'Bank_Horst',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-04-28 20:03:17',	1,	'N'),
(13113,	'2015-02-09',	'00:00:00',	0,	'SONSTIGER EINZUG EC 65443515 070215135534OC1 ALDI SUED SAGT DANKE',	'I',	'LASTSCHRIFT',	-18.80,	'Bank_Horst',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-04-28 20:03:17',	1,	'N'),
(13114,	'2015-02-09',	'00:00:00',	0,	'SONSTIGER EINZUG EC 54066864 070215165327OC1 IKEA 102 KOELN',	'I',	'UMBUCH',	-115.97,	'Bank_Horst',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-04-28 20:03:17',	1,	'N'),
(13115,	'2015-02-08',	'00:00:00',	0,	'GELDAUTOMAT 08.02/13.52UHR 159  WORRI GA NR00003613 BLZ37050299 1',	'I',	'ABHEBUNG',	-50.00,	'Bank_Horst',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-04-28 20:03:17',	1,	'N'),
(13116,	'2015-02-06',	'00:00:00',	0,	'SONSTIGER EINZUG EC 65022185 040215122414OC1 DM DROGERIEMARKT SAGT DANKE',	'I',	'EINKAUF',	-30.95,	'Bank_Horst',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-04-28 20:03:17',	1,	'N'),
(13117,	'2015-02-06',	'00:00:00',	0,	'DAUERAUFTRAG MIETE + NEBENKOSTEN HILDEGARD HELFF',	'I',	'MIETE',	-980.00,	'Bank_Horst',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-04-28 20:03:17',	1,	'N'),
(13118,	'2015-02-06',	'00:00:00',	0,	'DAUERAUFTRAG GARAGENMIETE HILDEGARD HELFF',	'I',	'MIETE',	-30.00,	'Bank_Horst',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-04-28 20:03:17',	1,	'N'),
(13119,	'2015-02-04',	'00:00:00',	0,	'GELDAUTOMAT 04.02/12.12UHR 120  B.BNP GA NR00003456 BLZ37050299 1',	'I',	'ABHEBUNG',	-50.00,	'Bank_Horst',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-04-28 20:03:17',	1,	'N'),
(13120,	'2015-02-04',	'00:00:00',	0,	'LOHN  GEHALT 2015020313140301000000006000001859Verdienstabrechnung 01.15/1 MAUSER CORPORATE GMBH',	'I',	'GEHALTHORST',	2026.36,	'Bank_Horst',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-04-28 20:03:17',	1,	'N'),
(13121,	'2015-02-03',	'00:00:00',	0,	'SONSTIGER EINZUG EC 65395922 310115173733OC1 DM DROGERIEMARKT SAGT DANKE',	'I',	'EINKAUF',	-21.20,	'Bank_Horst',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-04-28 20:03:17',	1,	'N'),
(13122,	'2015-02-03',	'00:00:00',	0,	'ONLINE-UEBERWEISUNG KREF+P20150207140812Geschaeftszeichen 100181167 in RatenDATUM 02.02.2015, 23.00 UHR1.TAN 562274 Creditreform Darmstadt Skoruppa KG',	'I',	'SCHULDEN',	-125.19,	'Bank_Horst',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-04-28 20:03:17',	1,	'N'),
(13123,	'2015-02-02',	'00:00:00',	0,	'LASTSCHRIFT ELV61302502 31.01 19.59 ME1 KAUFLAND SAGT DANKE',	'I',	'EINKAUF',	-59.08,	'Bank_Horst',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-04-28 20:03:17',	1,	'N'),
(13124,	'2015-02-02',	'00:00:00',	0,	'SONSTIGER EINZUG EC 65442254 310115172507OC1 ALDI SUED SAGT DANKE',	'I',	'LASTSCHRIFT',	-57.95,	'Bank_Horst',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-04-28 20:03:17',	1,	'N'),
(13125,	'2015-05-12',	'00:00:00',	0,	'KontoerÃ¶ffnung',	'',	'EINZAHLUNG',	50.00,	'Frieda_Sparkonto',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'HORST',	'N',	0,	'',	'',	'horald-Easynote',	'2015-05-12 15:55:05',	1,	'N'),
(13127,	'2015-05-30',	'00:00:00',	10,	'Aldi Einkauf',	'',	'EINKAUF',	31.24,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-06-01 16:16:34',	1,	'N'),
(13128,	'2015-05-30',	'00:00:00',	11,	'Aldi Einkauf',	'',	'HAUSHALT',	-3.13,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	3,	'',	'',	'',	'2015-06-01 16:16:34',	1,	'N'),
(13129,	'2015-05-30',	'00:00:00',	12,	'Aldi Einkauf',	'',	'LEBEN',	-28.11,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	3,	'',	'',	'',	'2015-06-01 16:16:34',	1,	'N'),
(13130,	'2015-05-30',	'00:00:00',	13,	'Kaufland Einkauf',	'',	'EINKAUF',	49.68,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-06-01 16:16:34',	1,	'N'),
(13131,	'2015-05-30',	'00:00:00',	14,	'Kaufland Einkauf',	'',	'LEBEN',	-4.47,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'HORST',	'N',	5,	'',	'',	'horald-Easynote',	'2015-06-01 16:19:38',	1,	'N'),
(13132,	'2015-05-30',	'00:00:00',	15,	'Kaufland Einkauf',	'',	'HAUSHALT',	-4.48,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	5,	'',	'',	'',	'2015-06-01 16:16:34',	1,	'N'),
(13133,	'2015-05-30',	'00:00:00',	16,	'Kaufland Einkauf',	'',	'KIND',	-8.25,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	5,	'',	'',	'',	'2015-06-01 16:16:34',	1,	'N'),
(13134,	'2015-05-30',	'00:00:00',	17,	'Kaufland Einkauf',	'',	'LEBEN',	-32.48,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	5,	'',	'',	'',	'2015-06-01 16:16:34',	1,	'N'),
(13135,	'2015-05-30',	'00:00:00',	18,	'Kaufland Einkauf',	'',	'PFLEGE',	0.00,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	5,	'',	'',	'',	'2015-06-01 16:16:34',	1,	'N'),
(13136,	'2015-05-30',	'00:00:00',	19,	'Penny Einkauf',	'',	'EINKAUF',	7.84,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-06-01 16:16:34',	1,	'N'),
(13137,	'2015-05-30',	'00:00:00',	20,	'Penny Einkauf',	'',	'HAUSHALT',	-1.00,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	7,	'',	'',	'',	'2015-06-01 16:16:34',	1,	'N'),
(13138,	'2015-05-30',	'00:00:00',	21,	'Penny Einkauf',	'',	'LEBEN',	-5.34,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	7,	'',	'',	'',	'2015-06-01 16:16:34',	1,	'N'),
(13139,	'2015-05-30',	'00:00:00',	22,	'Penny Einkauf',	'',	'PFAND',	-1.50,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	7,	'',	'',	'',	'2015-06-01 16:16:34',	1,	'N'),
(13157,	'2015-06-13',	'00:00:00',	17,	'Kaufland Einkauf',	'',	'PFLEG',	-4.45,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'HORST',	'N',	5,	'',	'',	'horald-Easynote',	'2015-06-22 16:19:51',	1,	'N'),
(13156,	'2015-06-13',	'00:00:00',	16,	'Kaufland Einkauf',	'',	'LEBEN',	-26.40,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	5,	'',	'',	'',	'2015-06-13 17:03:15',	1,	'N'),
(13155,	'2015-06-13',	'00:00:00',	15,	'Kaufland Einkauf',	'',	'KIND',	-3.49,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	5,	'',	'',	'',	'2015-06-13 17:03:15',	1,	'N'),
(13154,	'2015-06-13',	'00:00:00',	14,	'Kaufland Einkauf',	'',	'HAUSHALT',	-8.23,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	5,	'',	'',	'',	'2015-06-13 17:03:15',	1,	'N'),
(13153,	'2015-06-13',	'00:00:00',	13,	'Kaufland ',	'',	'LASTSCHRIFT',	42.57,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'HORST',	'N',	0,	'',	'',	'horald-Easynote',	'2015-06-13 17:04:13',	1,	'N'),
(13152,	'2015-06-13',	'00:00:00',	12,	'Aldi Einkauf',	'',	'LEBEN',	-31.87,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	3,	'',	'',	'',	'2015-06-13 17:03:15',	1,	'N'),
(13151,	'2015-06-13',	'00:00:00',	11,	'Aldi Einkauf',	'',	'KIND',	-0.29,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	3,	'',	'',	'',	'2015-06-13 17:03:15',	1,	'N'),
(13150,	'2015-06-13',	'00:00:00',	10,	'Aldi ',	'',	'LASTSCHRIFT',	32.16,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'HORST',	'N',	0,	'',	'',	'horald-Easynote',	'2015-06-13 17:03:45',	1,	'N'),
(13158,	'2015-05-31',	'16:07:50',	0,	'Tiere Zoo',	'',	'KIND',	-3.00,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-06-19 05:41:04',	1,	'N'),
(13159,	'2015-05-30',	'16:47:18',	0,	'einkauf penny',	'',	'EINKAUF',	-7.84,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-06-19 05:41:04',	1,	'N'),
(13160,	'2015-05-30',	'16:46:32',	0,	'Frieda Uhr',	'',	'KIND',	-4.90,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-06-19 05:41:04',	1,	'N'),
(13161,	'2015-05-30',	'16:45:46',	0,	'einkauf kaufland',	'',	'EINKAUF',	-49.68,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-06-19 05:41:04',	1,	'N'),
(13162,	'2015-05-30',	'13:56:16',	0,	'Lose',	'',	'FAMILIE',	-2.00,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-06-19 05:41:04',	1,	'N'),
(13163,	'2015-05-30',	'13:44:28',	0,	'Einkauf Aldi',	'',	'EINKAUF',	-31.24,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-06-19 05:41:04',	1,	'N'),
(13164,	'2015-05-30',	'13:10:57',	0,	'geld von chris',	'',	'UMBUCH',	150.00,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-06-19 05:41:04',	1,	'N'),
(13165,	'2015-05-29',	'07:58:47',	0,	'brÃƒÂ¶tchen',	'',	'LEBENHORST',	-0.75,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-06-19 05:41:04',	1,	'N'),
(13166,	'2015-05-28',	'08:22:20',	0,	'brÃƒÂ¶tchen',	'',	'LEBENHORST',	-0.75,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-06-19 05:41:04',	1,	'N'),
(13167,	'2015-05-27',	'22:13:48',	0,	'Einkauf',	'',	'EINKAUF',	-3.53,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-06-19 05:41:04',	1,	'N'),
(13168,	'2015-05-27',	'12:12:16',	0,	'pfand',	'',	'UMBUCH',	0.54,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-06-19 05:41:04',	1,	'N'),
(13169,	'2015-05-27',	'08:18:44',	0,	'brÃƒÂ¶tchen',	'',	'LEBENHORST',	-0.75,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-06-19 05:41:04',	1,	'N'),
(13170,	'2015-05-26',	'12:31:59',	0,	'Einkauf Rewe',	'',	'EINKAUF',	-1.03,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-06-19 05:41:04',	1,	'N'),
(13171,	'2015-05-26',	'07:47:30',	0,	'brÃƒÂ¶tchen',	'',	'LEBENHORST',	-0.75,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-06-19 05:41:04',	1,	'N'),
(13172,	'2015-05-25',	'16:48:44',	0,	'Klo',	'',	'FAMILIE',	-0.50,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-06-19 05:41:04',	1,	'N'),
(13173,	'2015-05-25',	'16:47:48',	0,	'Schminken',	'',	'FAMILIE',	-1.00,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-06-19 05:41:04',	1,	'N'),
(13174,	'2015-05-25',	'16:46:48',	0,	'Waffeln',	'',	'FAMILIE',	-1.50,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-06-19 05:41:04',	1,	'N'),
(13175,	'2015-05-25',	'16:10:03',	0,	'Wette',	'',	'FAMILIE',	-4.00,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-06-19 05:41:04',	1,	'N'),
(13176,	'2015-05-25',	'16:09:21',	0,	'Waffeln',	'',	'FAMILIE',	-4.50,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-06-19 05:41:04',	1,	'N'),
(13177,	'2015-05-25',	'16:09:02',	0,	'eintritt',	'',	'FAMILIE',	-14.00,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-06-19 05:41:04',	1,	'N'),
(13178,	'2015-05-25',	'13:03:29',	0,	'kassensturz 33.53',	'',	'UMBUCH',	-2.00,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-06-19 05:41:04',	1,	'N'),
(13179,	'2015-05-24',	'12:59:29',	0,	'kirchenspende',	'',	'SPENDE',	-1.50,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-06-19 05:41:04',	1,	'N'),
(13180,	'2015-05-23',	'12:06:32',	0,	'brezel',	'',	'FAMILIE',	-3.20,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-06-19 05:41:04',	1,	'N'),
(13181,	'2015-05-23',	'08:55:31',	0,	'Geldgeschenk Schwiegereltern',	'',	'UMBUCH',	30.00,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-06-19 05:41:04',	1,	'N'),
(13182,	'2015-05-23',	'08:54:57',	0,	'Fahrgeld Von Frieda',	'',	'UMBUCH',	2.00,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-06-19 05:41:04',	1,	'N'),
(13183,	'2015-05-22',	'12:22:00',	0,	'Einkauf Rewe',	'',	'EINKAUF',	-1.24,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-06-19 05:41:04',	1,	'N'),
(13184,	'2015-05-22',	'12:00:10',	0,	'brÃƒÂ¶tchen',	'',	'LEBENHORST',	-0.75,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-06-19 05:41:04',	1,	'N'),
(13185,	'2015-05-21',	'08:07:40',	0,	'brÃƒÂ¶tchen',	'',	'LEBENHORST',	-0.75,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-06-19 05:41:04',	1,	'N'),
(13186,	'2015-05-20',	'12:12:27',	0,	'Einkauf Rewe',	'',	'EINKAUF',	-7.42,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-06-19 05:41:04',	1,	'N'),
(13187,	'2015-05-19',	'12:22:37',	0,	'baumarkt',	'',	'HAUSHALT',	-19.96,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-06-19 05:41:04',	1,	'N'),
(13188,	'2015-05-19',	'12:21:45',	0,	'Fr Langen Hochzeit',	'',	'GESCH',	-2.00,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-06-19 05:41:04',	1,	'N'),
(13189,	'2015-05-19',	'07:54:24',	0,	'brÃƒÂ¶tchen',	'',	'LEBENHORST',	-0.75,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-06-19 05:41:04',	1,	'N'),
(13190,	'2015-05-18',	'16:23:41',	0,	'bimmelbahn',	'',	'FAMILIE',	-10.50,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-06-19 05:41:04',	1,	'N'),
(13191,	'2015-05-18',	'16:20:20',	0,	'Gockel',	'',	'FAMILIE',	-11.95,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-06-19 05:41:04',	1,	'N'),
(13192,	'2015-05-18',	'15:05:03',	0,	'Bahn',	'',	'FAMILIE',	-6.00,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-06-19 05:41:04',	1,	'N'),
(13193,	'2015-05-18',	'14:23:26',	0,	'fÃƒÂ¤hre',	'',	'FAMILIE',	-7.50,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-06-19 05:41:04',	1,	'N'),
(13194,	'2015-05-18',	'13:48:51',	0,	'Abhebung',	'',	'ABHEBUNG',	75.00,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-06-19 05:41:04',	1,	'N'),
(13195,	'2015-05-17',	'11:34:22',	0,	'kirchenspende',	'',	'SPENDE',	-1.50,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-06-19 05:41:04',	1,	'N'),
(13196,	'2015-05-16',	'16:24:37',	0,	'Lose',	'',	'FAMILIE',	-2.00,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-06-19 05:41:04',	1,	'N'),
(13197,	'2015-05-16',	'16:24:00',	0,	'Agavendicksafz',	'',	'LEBEN',	-5.30,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-06-19 05:41:04',	1,	'N'),
(13198,	'2015-05-16',	'13:03:50',	0,	'kassensturz 10.85',	'',	'UMBUCH',	-25.08,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-06-19 05:41:04',	1,	'N'),
(13199,	'2015-05-16',	'12:59:21',	0,	'Cappuccino U BrÃƒÂ¶tchrn',	'',	'LEBENHORST',	-4.60,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-06-19 05:41:04',	1,	'N'),
(13200,	'2015-05-12',	'16:48:12',	0,	'Einkauf DM',	'',	'EINKAUF',	-3.65,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-06-19 05:41:04',	1,	'N'),
(13201,	'2015-05-10',	'14:23:18',	0,	'kirchenspende',	'',	'SPENDE',	-1.50,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-06-19 05:41:04',	1,	'N'),
(13202,	'2015-05-10',	'14:22:34',	0,	'Geld Von Frieda',	'',	'UMBUCH',	0.30,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-06-19 05:41:04',	1,	'N'),
(13203,	'2015-05-08',	'08:19:37',	0,	'brÃƒÂ¶tchen',	'',	'LEBENHORST',	-0.75,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-06-19 05:41:04',	1,	'N'),
(13204,	'2015-05-07',	'07:49:26',	0,	'brÃƒÂ¶tchen',	'',	'LEBENHORST',	-0.75,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-06-19 05:41:04',	1,	'N'),
(13205,	'2015-05-07',	'07:08:41',	0,	'EinkaufsmÃƒÂ¼nze',	'',	'HAUSHALT',	-1.00,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-06-19 05:41:04',	1,	'N'),
(13206,	'2015-05-06',	'19:06:15',	0,	'Brot',	'',	'LEBEN',	-1.29,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-06-19 05:41:04',	1,	'N'),
(13207,	'2015-05-06',	'12:08:09',	0,	'Einkauf Rewe',	'',	'EINKAUF',	-1.58,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-06-19 05:41:04',	1,	'N'),
(13208,	'2015-05-06',	'12:04:47',	0,	'Abhebung',	'',	'ABHEBUNG',	50.00,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-06-19 05:41:04',	1,	'N'),
(13209,	'2015-05-06',	'07:05:12',	0,	'brÃƒÂ¶tchen',	'',	'LEBENHORST',	-0.75,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-06-19 05:41:04',	1,	'N'),
(13210,	'2015-05-06',	'07:03:14',	0,	'pfand',	'',	'UMBUCH',	1.00,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-06-19 05:41:04',	1,	'N'),
(13211,	'2015-05-05',	'12:26:46',	0,	'Einkauf Rewe',	'',	'EINKAUF',	-2.34,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-06-19 05:41:04',	1,	'N'),
(13212,	'2015-05-05',	'08:01:59',	0,	'brÃƒÂ¶tchen',	'',	'LEBENHORST',	-0.75,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-06-19 05:41:04',	1,	'N'),
(13213,	'2015-05-04',	'18:27:24',	0,	'Essen Backwerk',	'',	'LEBENHORST',	-3.53,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-06-19 05:41:04',	1,	'N'),
(13214,	'2015-05-04',	'12:19:11',	0,	'Einkauf Rewe',	'',	'EINKAUF',	-1.94,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-06-19 05:41:04',	1,	'N'),
(13215,	'2015-05-04',	'08:10:58',	0,	'brÃƒÂ¶tchen',	'',	'LEBENHORST',	-0.75,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-06-19 05:41:04',	1,	'N'),
(13216,	'2015-05-03',	'12:13:45',	0,	'kirchenspende',	'',	'SPENDE',	-2.50,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-06-19 05:41:04',	1,	'N'),
(13217,	'2015-05-03',	'10:28:41',	0,	'pfand',	'',	'UMBUCH',	0.15,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-06-19 05:41:04',	1,	'N'),
(13218,	'2015-05-02',	'19:26:25',	0,	'Einkauf Aldi',	'',	'EINKAUF',	-41.36,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-06-19 05:41:04',	1,	'N'),
(13219,	'2015-05-02',	'19:25:21',	0,	'einkauf kaufland',	'',	'EINKAUF',	-47.31,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-06-19 05:41:04',	1,	'N'),
(13220,	'2015-05-02',	'19:23:48',	0,	'Pass Tomaten',	'',	'LEBEN',	-1.56,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-06-19 05:41:04',	1,	'N'),
(13221,	'2015-05-02',	'17:22:55',	0,	'Lose',	'',	'FAMILIE',	-2.00,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-06-19 05:41:04',	1,	'N'),
(13222,	'2015-05-02',	'08:44:43',	0,	'toastbrÃƒÂ¶tchen',	'',	'LEBEN',	-1.99,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-06-19 05:41:04',	1,	'N'),
(13223,	'2015-05-02',	'05:38:35',	0,	'Abhebung Chris',	'',	'ABHEBUNG',	100.00,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-06-19 05:41:04',	1,	'N'),
(13224,	'2015-05-01',	'16:29:27',	0,	'schokolade',	'',	'FAMILIE',	-1.00,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-06-19 05:41:04',	1,	'N'),
(13225,	'2015-05-01',	'16:28:51',	0,	'Schokomuseum',	'',	'FAMILIE',	-15.50,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'CSVIMPORT',	'',	'',	'2015-06-19 05:41:04',	1,	'N'),
(13226,	'2015-05-01',	'10:36:17',	0,	'kassensturz 22.88',	'',	'UMBUCH',	19.76,	'HORST',	'',	22.88,	'0000-00-00',	0.00,	'',	0,	'HORST',	'N',	0,	'CSVIMPORT',	'',	'horald-Easynote',	'2015-06-19 06:02:08',	1,	'N'),
(13227,	'0000-00-00',	'00:00:00',	10,	'Aldi ',	'',	'',	52.91,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-06-19 05:50:43',	1,	'N'),
(13228,	'0000-00-00',	'00:00:00',	11,	'Aldi Einkauf',	'',	'HAUSHALT',	-1.95,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	3,	'',	'',	'',	'2015-06-19 05:50:43',	1,	'N'),
(13229,	'0000-00-00',	'00:00:00',	12,	'Aldi Einkauf',	'',	'KIND',	-1.48,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	3,	'',	'',	'',	'2015-06-19 05:50:43',	1,	'N'),
(13230,	'0000-00-00',	'00:00:00',	13,	'Aldi Einkauf',	'',	'LEBEN',	-49.48,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	3,	'',	'',	'',	'2015-06-19 05:50:43',	1,	'N'),
(13231,	'0000-00-00',	'00:00:00',	14,	'Kaufland ',	'',	'',	67.32,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-06-19 05:50:43',	1,	'N'),
(13232,	'0000-00-00',	'00:00:00',	15,	'Kaufland Einkauf',	'',	'HAUSHALT',	-3.55,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	5,	'',	'',	'',	'2015-06-19 05:50:43',	1,	'N'),
(13233,	'0000-00-00',	'00:00:00',	16,	'Kaufland Einkauf',	'',	'KIND',	-3.97,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	5,	'',	'',	'',	'2015-06-19 05:50:43',	1,	'N'),
(13234,	'0000-00-00',	'00:00:00',	17,	'Kaufland Einkauf',	'',	'LEBEN',	-59.80,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	5,	'',	'',	'',	'2015-06-19 05:50:43',	1,	'N'),
(13235,	'0000-00-00',	'00:00:00',	18,	'REWE ',	'',	'',	0.00,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-06-19 05:50:43',	1,	'N'),
(13236,	'0000-00-00',	'00:00:00',	19,	'REWE Einkauf',	'',	'LEBEN',	0.00,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	403,	'',	'',	'',	'2015-06-19 05:50:43',	1,	'N'),
(13237,	'2015-05-23',	'00:00:00',	10,	'Aldi ',	'',	'LASTSCHRIFT',	52.91,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'HORST',	'N',	0,	'',	'',	'horald-Easynote',	'2015-06-19 05:56:45',	1,	'N'),
(13238,	'2015-05-23',	'00:00:00',	11,	'Aldi Einkauf',	'',	'HAUSHALT',	-1.95,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	3,	'',	'',	'',	'2015-06-19 05:52:23',	1,	'N'),
(13239,	'2015-05-23',	'00:00:00',	12,	'Aldi Einkauf',	'',	'KIND',	-1.48,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	3,	'',	'',	'',	'2015-06-19 05:52:23',	1,	'N'),
(13240,	'2015-05-23',	'00:00:00',	13,	'Aldi Einkauf',	'',	'LEBEN',	-49.48,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	3,	'',	'',	'',	'2015-06-19 05:52:23',	1,	'N'),
(13241,	'2015-05-23',	'00:00:00',	14,	'Kaufland ',	'',	'LASTSCHRIFT',	67.32,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'HORST',	'N',	0,	'',	'',	'horald-Easynote',	'2015-06-19 05:57:20',	1,	'N'),
(13242,	'2015-05-23',	'00:00:00',	15,	'Kaufland Einkauf',	'',	'HAUSHALT',	-3.55,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	5,	'',	'',	'',	'2015-06-19 05:52:23',	1,	'N'),
(13243,	'2015-05-23',	'00:00:00',	16,	'Kaufland Einkauf',	'',	'KIND',	-3.97,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	5,	'',	'',	'',	'2015-06-19 05:52:23',	1,	'N'),
(13244,	'2015-05-23',	'00:00:00',	17,	'Kaufland Einkauf',	'',	'LEBEN',	-59.80,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	5,	'',	'',	'',	'2015-06-19 05:52:23',	1,	'N'),
(13245,	'2015-05-23',	'00:00:00',	18,	'REWE ',	'',	'LASTSCHRIFT',	0.00,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'HORST',	'N',	0,	'',	'',	'horald-Easynote',	'2015-06-19 05:57:58',	1,	'N'),
(13246,	'2015-05-23',	'00:00:00',	19,	'REWE Einkauf',	'',	'LEBEN',	0.00,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	403,	'',	'',	'',	'2015-06-19 05:52:23',	1,	'N'),
(13247,	'2015-05-04',	'00:00:00',	0,	'AUSZAHLUNG GELDAUTOMAT - TARGOBANK KÃ¶LN 00508 AM 02 05 2015 UM 17 37 KARTE 12 17/0 TRANSAKTIONSNUMMER 095453 Wertstellung 02 05 2015',	'I',	'ABHEBUNG',	-100.00,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-06-20 14:46:13',	1,	'N'),
(13248,	'2015-05-04',	'00:00:00',	0,	'AUSFÃœHRUNG DAUERAUFTRAG AUFTRAGSNUMMER 0300005 BAD HOMBURGER INKASSO GMBH KONTO HELADEFFXXX / DE62500500000014700009 GESCHAEFTSZEICHEN 1683388',	'I',	'SCHULDEN',	-150.00,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-06-20 14:46:13',	1,	'N'),
(13249,	'2015-05-04',	'00:00:00',	0,	'POS MIT PIN F177595177595 00000 SCHUHHAUS WERNER EC 69527495 300415151814OC0',	'I',	'KIND',	-112.80,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'HORST',	'N',	0,	'',	'',	'horald-Easynote',	'2015-06-20 14:50:58',	1,	'N'),
(13250,	'2015-05-04',	'00:00:00',	0,	'SEPA LASTSCHRIFT KOELNER VERKEHRS-BETRIEBE AG Kundenreferenz : AB33977505 145062255 GlÃ¤ubiger-ID : DE74KVB00000041511 Mandatsreferenz : 33977505-1 Mandatsdatum : 2014-07-01',	'I',	'KIND',	-60.40,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-06-20 14:46:13',	1,	'N'),
(13251,	'2015-05-04',	'00:00:00',	0,	'GAA-AUSZAHLUNG 000001 1712 0395 GA NR80870011 BLZ37160087 001 05/07 10UHR MERHEIM EUR 50 00 00E2800004800001180028015 0FA50BA030C000000000000000 0000000F101504300100000000 000000000000 A00000005945430100 020300604020143S4YRMVF 0002',	'I',	'ABHEBUNG',	-50.00,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'HORST',	'N',	0,	'',	'',	'horald-Easynote',	'2015-06-20 14:53:17',	1,	'N'),
(13252,	'2015-05-04',	'00:00:00',	0,	'POS MIT UNTERSCHRIFT 5231784 00000000 9728000000 ALNATURA DANKT ELV94312931 30 04 16 24 ME0',	'I',	'LEBEN',	-26.68,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-06-20 14:46:13',	1,	'N'),
(13253,	'2015-05-04',	'00:00:00',	0,	'POS MIT UNTERSCHRIFT 5162230 REWE SAGT DANKE 43400019 300416421622300171256002132',	'I',	'EINKAUF',	-11.95,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-06-20 14:46:13',	1,	'N'),
(13254,	'2015-05-04',	'00:00:00',	0,	'SEPA LASTSCHRIFT AMAZON EU S A R L 305-0793870-2946711 Amazon de 0532414320275391 Kundenreferenz : 0532414320275391 GlÃ¤ubiger-ID : DE24ZZZ00000561652 Mandatsreferenz : kCB?plCILNO(vCD)WToJCNIo?hB5?M Mandatsdatum : 2014-06-13',	'I',	'EINKAUF',	-5.95,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-06-20 14:46:13',	1,	'N'),
(13255,	'2015-05-04',	'00:00:00',	0,	'GEBÃœHR FÃœR GAA-AUSZAHLUNG',	'I',	'GEBUEHR',	-3.95,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-06-20 14:46:13',	1,	'N'),
(13256,	'2015-05-05',	'00:00:00',	0,	'POS MIT UNTERSCHRIFT 5065647 PENNY SAGT DANKE 33300582 040508260656470171256000213',	'I',	'EINKAUF',	-42.10,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-06-20 14:46:13',	1,	'N'),
(13257,	'2015-05-05',	'00:00:00',	0,	'SEPA LASTSCHRIFT Musicfactory Musikschulgebuehr Mai 15 Kundenreferenz : iMikel1-T-1669-08973571756273 GlÃ¤ubiger-ID : DE37MUF00000997239 Mandatsreferenz : 101961001 Mandatsdatum : 2013-11-01',	'I',	'KIND',	-28.00,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-06-20 14:46:13',	1,	'N'),
(13258,	'2015-05-05',	'00:00:00',	0,	'SEPA LASTSCHRIFT AMAZON EU S A R L 305-4681315-0277958 Amazon de 0654373995387285 Kundenreferenz : 0654373995387285 GlÃ¤ubiger-ID : DE24ZZZ00000561652 Mandatsreferenz : kCB?plCILNO(vCD)WToJCNIo?hB5?M Mandatsdatum : 2014-06-13',	'I',	'EINKAUF',	-5.95,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-06-20 14:46:13',	1,	'N'),
(13259,	'2015-05-06',	'00:00:00',	0,	'POS MIT UNTERSCHRIFT 5065862 PENNY SAGT DANKE 33300582 050519580658620171256000213',	'I',	'EINKAUF',	-3.15,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-06-20 14:46:13',	1,	'N'),
(13260,	'2015-05-07',	'00:00:00',	0,	'GAA-AUSZAHLUNG 009083 1712 0495 GA NR00003173 BLZ37050198 006 05/15 35UHR MERKENICH EUR 50 00 00E4800004800001180028015 0FA50BA030C000000000000000 0000000F101505020100000000 000000000000 A00000005945430100 0203006040201400000000 0002',	'I',	'ABHEBUNG',	-50.00,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'HORST',	'N',	0,	'',	'',	'horald-Easynote',	'2015-06-20 14:53:32',	1,	'N'),
(13261,	'2015-05-07',	'00:00:00',	0,	'GEBÃœHR FÃœR GAA-AUSZAHLUNG',	'I',	'GEBUEHR',	-4.95,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-06-20 14:46:13',	1,	'N'),
(13262,	'2015-05-08',	'00:00:00',	0,	'POS MIT PIN F033765033765 00000 REWE SAGT DANKE 43655091 EC 56020629 070515210533OC0',	'I',	'EINKAUF',	-18.85,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-06-20 14:46:13',	1,	'N'),
(13263,	'2015-05-08',	'00:00:00',	0,	'SEPA LASTSCHRIFT AMAZON SERVICES EUROPE S A R L 305-8869681-0668323 Amazon Services Europe SARL 071662 7375464171 Kundenreferenz : 0716627375464171 GlÃ¤ubiger-ID : DE51ZZZ00000561651 Mandatsreferenz : kCB?plCILNO(vCD)WToJCNIo?hB5?M Mandatsdatum : 2014',	'I',	'EINKAUF',	-3.90,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-06-20 14:46:13',	1,	'N'),
(13264,	'2015-05-11',	'00:00:00',	0,	'SEPA LASTSCHRIFT AMAZON PAYMENTS EUROPE S C A 305-2739112-1086726 Amazon Mktplce EU-DE 107821809171 0512 Kundenreferenz : 1078218091710512 GlÃ¤ubiger-ID : DE94ZZZ00000561653 Mandatsreferenz : kCB?plCILNO(vCD)WToJCNIo?hB5?M Mandatsdatum : 2014-06-13',	'I',	'EINKAUF',	-39.90,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-06-20 14:46:13',	1,	'N'),
(13265,	'2015-05-11',	'00:00:00',	0,	'SEPA LASTSCHRIFT AMAZON EU S A R L 305-1640899-9629917 Amazon de 2397938156484101 Kundenreferenz : 2397938156484101 GlÃ¤ubiger-ID : DE24ZZZ00000561652 Mandatsreferenz : kCB?plCILNO(vCD)WToJCNIo?hB5?M Mandatsdatum : 2014-06-13',	'I',	'EINKAUF',	-12.99,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-06-20 14:46:13',	1,	'N'),
(13266,	'2015-05-12',	'00:00:00',	0,	'GUTSCHRIFT Bundesagentur fuer Arbeit - Familienkasse KG357357FK149064 0515 30018177797/3000043609926 KUNDENREFERENZ : 30018177797',	'I',	'GUTSCHRIFT',	184.00,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-06-20 14:46:13',	1,	'N'),
(13267,	'2015-05-12',	'00:00:00',	0,	'POS MIT UNTERSCHRIFT 5066384 PENNY SAGT DANKE 33300582 110508240663840171256000213',	'I',	'EINKAUF',	-13.22,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-06-20 14:46:13',	1,	'N'),
(13268,	'2015-05-12',	'00:00:00',	0,	'POS MIT PIN F336392336392 00000 DM DROGERIEMARKT SAGT DANKEEC 65395922 090515183932OC0',	'I',	'EINKAUF',	-10.45,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-06-20 14:46:13',	1,	'N'),
(13269,	'2015-05-13',	'00:00:00',	0,	'GAA-AUSZAHLUNG 010308 1712 0495 GA NR00003173 BLZ37050198 012 05/08 06UHR MERKENICH EUR 50 00 00E7800004800001180028015 0FA50BA030C000000000000000 0000000F101505090100000000 000000000000 A00000005945430100 0203006040201400000000 0002',	'I',	'ABHEBUNG',	-50.00,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'HORST',	'N',	0,	'',	'',	'horald-Easynote',	'2015-06-20 14:53:47',	1,	'N'),
(13270,	'2015-05-13',	'00:00:00',	0,	'GEBÃœHR FÃœR GAA-AUSZAHLUNG',	'I',	'GEBUEHR',	-4.95,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-06-20 14:46:13',	1,	'N'),
(13271,	'2015-05-15',	'00:00:00',	0,	'AUSZAHLUNG GELDAUTOMAT - TARGOBANK KÃ–LN 01189 AM 15 05 2015 UM 13 37 KARTE 12 17/0 TRANSAKTIONSNUMMER 055131',	'I',	'ABHEBUNG',	-50.00,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-06-20 14:46:13',	1,	'N'),
(13272,	'2015-05-15',	'00:00:00',	0,	'POS MIT UNTERSCHRIFT 5072442 00000000 9728000000 ALNATURA DANKT ELV94312932 13 05 08 55 ME0',	'I',	'LEBEN',	-58.28,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-06-20 14:46:13',	1,	'N'),
(13273,	'2015-05-15',	'00:00:00',	0,	'SEPA LASTSCHRIFT DEVK Vertragskonto Z00006939535BELEG 626008416608DEVK-Grupp e sagt Danke Kundenreferenz : 626008416608 GlÃ¤ubiger-ID : DE30ZZZ00000000884 Mandatsreferenz : INK0029510016 Mandatsdatum : 2013-10-12',	'I',	'VERSICHERUNG',	-41.21,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-06-20 14:46:13',	1,	'N'),
(13274,	'2015-05-15',	'00:00:00',	0,	'POS MIT UNTERSCHRIFT 5045164 00000000 9728000000 060 MAYERSCHEBUCH ELV94338831 13 05 09 29 ME0',	'I',	'PRIVAT',	-35.42,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-06-20 14:46:13',	1,	'N'),
(13275,	'2015-05-15',	'00:00:00',	0,	'SEPA LASTSCHRIFT World Vision Deutschland e V PID 001667575 RLS4119967 SIE-187277-0333 JENEBA Kundenreferenz : WORLDVISION-4205-422510000 GlÃ¤ubiger-ID : DE19ZZZ00000150171 Mandatsreferenz : 0016675750020 Mandatsdatum : 2014-07-31',	'I',	'SPENDE',	-30.00,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-06-20 14:46:13',	1,	'N'),
(13276,	'2015-05-18',	'00:00:00',	0,	'SEPA LASTSCHRIFT Heike Graf e K ALLES-VEGETARISCH DE - B-569562 KD- 179357 - Vielen Da nk GlÃ¤ubiger-ID : DE57AV000000204583 Mandatsreferenz : KD-179357 Mandatsdatum : 2015-05-07',	'I',	'LEBEN',	-53.49,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'HORST',	'N',	0,	'',	'',	'horald-Easynote',	'2015-06-20 14:51:20',	1,	'N'),
(13277,	'2015-05-18',	'00:00:00',	0,	'GAA-AUSZAHLUNG 011570 1712 0495 GA NR00003173 BLZ37050198 018 05/05 55UHR MERKENICH EUR 30 00 00E9800004800001180028015 0FA50BA030C000000000000000 0000000F101505150100000000 000000000000 A00000005945430100 0203006040201400000000 0002',	'I',	'ABHEBUNG',	-30.00,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'HORST',	'N',	0,	'',	'',	'horald-Easynote',	'2015-06-20 14:54:06',	1,	'N'),
(13278,	'2015-05-18',	'00:00:00',	0,	'GEBÃœHR FÃœR GAA-AUSZAHLUNG',	'I',	'GEBUEHR',	-4.95,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-06-20 14:46:13',	1,	'N'),
(13279,	'2015-05-19',	'00:00:00',	0,	'SEPA LASTSCHRIFT AMAZON EU S A R L 305-5157884-1080315 Amazon de 1208795675995153 Kundenreferenz : 1208795675995153 GlÃ¤ubiger-ID : DE24ZZZ00000561652 Mandatsreferenz : kCB?plCILNO(vCD)WToJCNIo?hB5?M Mandatsdatum : 2014-06-13',	'I',	'EINKAUF',	-31.17,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-06-20 14:46:13',	1,	'N'),
(13280,	'2015-05-19',	'00:00:00',	0,	'RÃœCKGABE SEPA LASTSCHRIFT MANGELS DECKUNG AMAZON EU S A R L 305-5157884-1080315 Amazon de 1208795675995153 Kundenreferenz : 1208795675995153 GlÃ¤ubiger-ID : DE24ZZZ00000561652 Mandatsreferenz : kCB?plCILNO(vCD)WToJCNIo?hB5?M Mandatsdatum : 2014-06-13',	'I',	'EINKAUF',	31.17,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-06-20 14:46:13',	1,	'N'),
(13281,	'2015-05-21',	'00:00:00',	0,	'POS MIT UNTERSCHRIFT 5067277 PENNY SAGT DANKE 33300582 200511040672770171256000213',	'I',	'EINKAUF',	-19.48,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-06-20 14:46:13',	1,	'N'),
(13282,	'2015-05-21',	'00:00:00',	0,	'RÃ¼CKGABE POS MIT UNTERSCHR MANGELS DECKUNG PENNY SAGT DANKE 33300582 200511040672770171256000213',	'I',	'EINKAUF',	19.48,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-06-20 14:46:13',	1,	'N'),
(13283,	'2015-05-22',	'00:00:00',	0,	'POS MIT UNTERSCHRIFT 5067370 PENNY SAGT DANKE 33300582 210508560673700171256000213',	'I',	'EINKAUF',	-6.72,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-06-20 14:46:13',	1,	'N'),
(13284,	'2015-05-22',	'00:00:00',	0,	'RÃ¼CKGABE POS MIT UNTERSCHR MANGELS DECKUNG PENNY SAGT DANKE 33300582 210508560673700171256000213',	'I',	'EINKAUF',	6.72,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-06-20 14:46:13',	1,	'N'),
(13285,	'2015-05-25',	'00:00:00',	0,	'SEPA LASTSCHRIFT AMAZON EU S A R L 305-7675308-3672328 Amazon de 1946518341972464 Kundenreferenz : 1946518341972464 GlÃ¤ubiger-ID : DE24ZZZ00000561652 Mandatsreferenz : kCB?plCILNO(vCD)WToJCNIo?hB5?M Mandatsdatum : 2014-06-13',	'I',	'EINKAUF',	-29.98,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-06-20 14:46:13',	1,	'N'),
(13286,	'2015-05-25',	'00:00:00',	0,	'RÃœCKGABE SEPA LASTSCHRIFT MANGELS DECKUNG AMAZON EU S A R L 305-7675308-3672328 Amazon de 1946518341972464 Kundenreferenz : 1946518341972464 GlÃ¤ubiger-ID : DE24ZZZ00000561652 Mandatsreferenz : kCB?plCILNO(vCD)WToJCNIo?hB5?M Mandatsdatum : 2014-06-13',	'I',	'EINKAUF',	29.98,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-06-20 14:46:13',	1,	'N'),
(13287,	'2015-05-29',	'00:00:00',	0,	'LOHN / GEHALT / RENTE Kliniken Lohn/Gehalt 09202800/201505',	'I',	'GEHALTCHRIS',	942.00,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-06-20 14:46:13',	1,	'N'),
(13288,	'2015-05-29',	'00:00:00',	0,	'LASTSCHRIFT PENNY-MARKT GMBH DC KOELN 060000322625 33300582 PENNY SAGT DANKE 200511040672770171256000213KAUFB 19 48 EUR + GEBUEHR 8 50 EUR AUS LASTSCHRIFT',	'I',	'EINKAUF',	-27.98,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-06-20 14:46:13',	1,	'N'),
(13289,	'2015-05-29',	'00:00:00',	0,	'LASTSCHRIFT PENNY-MARKT GMBH DC KOELN 060000322626 33300582 PENNY SAGT DANKE 210508560673700171256000213KAUFB 6 72 EUR + GEBUEHR 8 50 EUR AUS LASTSCHRIFT',	'I',	'EINKAUF',	-15.22,	'Bank_Chris',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-06-20 14:46:13',	1,	'N'),
(13290,	'2015-06-21',	'00:00:00',	0,	'Pfeile werfen',	'',	'KIND',	-3.00,	'CHRIS',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'(ohne)',	'N',	0,	'',	'',	'',	'2015-06-22 06:57:00',	1,	'N'),
(13291,	'2015-06-21',	'00:00:00',	0,	'Kinderkarussell',	'',	'KIND',	-5.00,	'CHRIS',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'(ohne)',	'N',	0,	'',	'',	'',	'2015-06-22 06:57:24',	1,	'N'),
(13314,	'2015-06-15',	'00:00:00',	1,	'Penny Einkauf',	'',	'HAUSHALT',	-5.99,	'CHRIS',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	7,	'BUCHEN',	'',	'',	'2015-06-24 05:49:34',	1,	'N'),
(13313,	'2015-06-18',	'00:00:00',	1,	'Penny Einkauf',	'',	'LEBEN',	-1.29,	'CHRIS',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	7,	'BUCHEN',	'',	'',	'2015-06-24 05:42:20',	1,	'N'),
(13312,	'2015-06-17',	'00:00:00',	1,	'Penny Einkauf',	'',	'LEBEN',	-4.06,	'CHRIS',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	7,	'BUCHEN',	'',	'',	'2015-06-24 05:26:00',	1,	'N'),
(13309,	'2015-06-19',	'00:00:00',	1,	'Penny Lastschrift',	'',	'LASTSCHRIFT',	7.41,	'CHRIS',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	7,	'BUCHEN',	'',	'',	'2015-06-23 19:05:28',	1,	'N'),
(13310,	'2015-06-19',	'00:00:00',	2,	'Penny Einkauf',	'',	'LEBEN',	-10.66,	'CHRIS',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	7,	'BUCHEN',	'',	'',	'2015-06-23 19:05:28',	1,	'N'),
(13311,	'2015-06-19',	'00:00:00',	3,	'Penny Einkauf',	'',	'PFAND',	3.25,	'CHRIS',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	7,	'BUCHEN',	'',	'',	'2015-06-23 19:05:28',	1,	'N'),
(13300,	'2015-06-20',	'00:00:00',	10,	'Aldi Lastschrift',	'',	'LASTSCHRIFT',	25.53,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-06-22 16:10:56',	1,	'N'),
(13301,	'2015-06-20',	'00:00:00',	11,	'Aldi Einkauf',	'',	'LEBEN',	-25.53,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	3,	'',	'',	'',	'2015-06-22 16:10:56',	1,	'N'),
(13302,	'2015-06-20',	'00:00:00',	12,	'Kaufland Lastschrift',	'',	'LASTSCHRIFT',	77.55,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-06-22 16:10:56',	1,	'N'),
(13303,	'2015-06-20',	'00:00:00',	13,	'Kaufland Einkauf',	'',	'GESCH',	-2.99,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	5,	'',	'',	'',	'2015-06-22 16:10:56',	1,	'N'),
(13304,	'2015-06-20',	'00:00:00',	14,	'Kaufland Einkauf',	'',	'KIND',	-10.75,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	5,	'',	'',	'',	'2015-06-22 16:10:56',	1,	'N'),
(13305,	'2015-06-20',	'00:00:00',	15,	'Kaufland Einkauf',	'',	'LEBEN',	-63.81,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	5,	'',	'',	'',	'2015-06-22 16:10:56',	1,	'N'),
(13315,	'2015-06-15',	'00:00:00',	2,	'Penny Einkauf',	'',	'LEBEN',	-1.19,	'CHRIS',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	7,	'BUCHEN',	'',	'',	'2015-06-24 05:49:34',	1,	'N'),
(13316,	'2015-06-15',	'00:00:00',	3,	'Penny Einkauf',	'',	'PFAND',	4.75,	'CHRIS',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	7,	'BUCHEN',	'',	'',	'2015-06-24 05:49:34',	1,	'N'),
(13317,	'2015-08-08',	'00:00:00',	10,	'Kaufland Einkauf',	'',	'EINKAUF',	50.24,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-08-08 23:07:29',	1,	'N'),
(13318,	'2015-08-08',	'00:00:00',	11,	'Kaufland Einkauf',	'',	'HAUSHALT',	-21.45,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	5,	'',	'',	'',	'2015-08-08 23:07:29',	1,	'N'),
(13319,	'2015-08-08',	'00:00:00',	12,	'Kaufland Einkauf',	'',	'KIND',	-1.99,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	5,	'',	'',	'',	'2015-08-08 23:07:29',	1,	'N'),
(13320,	'2015-08-08',	'00:00:00',	13,	'Kaufland Einkauf',	'',	'LEBEN',	-32.15,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	5,	'',	'',	'',	'2015-08-08 23:07:29',	1,	'N'),
(13321,	'2015-08-08',	'00:00:00',	14,	'Kaufland Einkauf',	'',	'PFAND',	5.35,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	5,	'',	'',	'',	'2015-08-08 23:07:29',	1,	'N'),
(13322,	'2015-08-08',	'00:00:00',	15,	'Aldi Einkauf',	'',	'EINKAUF',	51.26,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-08-08 23:07:29',	1,	'N'),
(13323,	'2015-08-08',	'00:00:00',	16,	'Aldi Einkauf',	'',	'HAUSHALT',	-9.82,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	3,	'',	'',	'',	'2015-08-08 23:07:29',	1,	'N'),
(13324,	'2015-08-08',	'00:00:00',	17,	'Aldi Einkauf',	'',	'LEBEN',	-41.44,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	3,	'',	'',	'',	'2015-08-08 23:07:29',	1,	'N'),
(13325,	'2015-08-08',	'00:00:00',	18,	'Alnatura Einkauf',	'',	'EINKAUF',	16.81,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-08-08 23:07:29',	1,	'N'),
(13326,	'2015-08-08',	'00:00:00',	19,	'Alnatura Einkauf',	'',	'LEBEN',	-16.81,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	1852,	'',	'',	'',	'2015-08-08 23:07:29',	1,	'N'),
(13330,	'2015-05-12',	'00:00:00',	0,	'ErÃƒÂ¶ffnung',	'',	'SONSTIGES',	0.00,	'Frieda_sparkonto',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-08-26 18:59:55',	1,	'N'),
(13342,	'2015-05-12',	'00:00:00',	0,	'ErÃƒÂ¶ffnung',	'',	'SONSTIGES',	0.00,	'Frieda_sparkonto',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-08-26 19:04:24',	1,	'N'),
(13409,	'2015-05-12',	'15:15:00',	0,	'ErÃ¶ffnung',	'',	'SONSTIGES',	0.00,	'Frieda_sparkonto',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-08-28 05:42:13',	1,	'N'),
(13354,	'2015-05-12',	'00:00:00',	0,	'ErÃƒÂ¶ffnung',	'',	'SONSTIGES',	0.00,	'Frieda_sparkonto',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-08-27 06:08:32',	1,	'N'),
(13393,	'2015-05-12',	'00:00:00',	0,	'ErÃ¶ffnung',	'',	'SONSTIGES',	0.00,	'Frieda_sparkonto',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-08-28 05:38:59',	1,	'N'),
(13366,	'2015-05-12',	'00:00:00',	0,	'ErÃƒÂ¶ffnung',	'',	'SONSTIGES',	0.00,	'Frieda_sparkonto',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-08-27 06:09:08',	1,	'N'),
(13377,	'2015-05-12',	'00:00:00',	0,	'ErÃ¶ffnung',	'',	'SONSTIGES',	0.00,	'Frieda_sparkonto',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-08-28 05:27:09',	1,	'N'),
(13635,	'2015-05-12',	'15:15:00',	0,	'ErÃ¶ffnung',	'',	'SONSTIGES',	0.00,	'Frieda_sparkonto',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 06:38:27',	1,	'N'),
(13467,	'2015-10-10',	'00:00:00',	10,	'Kaufland Lastschrift',	'',	'LASTSCHRIFT',	59.44,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-10-20 05:12:27',	1,	'N'),
(13468,	'2015-10-10',	'00:00:00',	11,	'Kaufland Einkauf',	'',	'FAMILIE',	-2.00,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	5,	'',	'',	'',	'2015-10-20 05:12:27',	1,	'N'),
(13469,	'2015-10-10',	'00:00:00',	12,	'Kaufland Einkauf',	'',	'HAUSHALT',	-17.87,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	5,	'',	'',	'',	'2015-10-20 05:12:27',	1,	'N'),
(13470,	'2015-10-10',	'00:00:00',	13,	'Kaufland Einkauf',	'',	'KIND',	-3.99,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	5,	'',	'',	'',	'2015-10-20 05:12:27',	1,	'N'),
(13471,	'2015-10-10',	'00:00:00',	14,	'Kaufland Einkauf',	'',	'LEBEN',	-35.58,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	5,	'',	'',	'',	'2015-10-20 05:12:27',	1,	'N'),
(13472,	'2015-10-10',	'00:00:00',	15,	'Aldi Lastschrift',	'',	'LASTSCHRIFT',	42.88,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-10-20 05:12:27',	1,	'N'),
(13473,	'2015-10-10',	'00:00:00',	16,	'Aldi Einkauf',	'',	'HAUSHALT',	-5.99,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	3,	'',	'',	'',	'2015-10-20 05:12:27',	1,	'N'),
(13474,	'2015-10-10',	'00:00:00',	17,	'Aldi Einkauf',	'',	'LEBEN',	-36.89,	'HORST',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	3,	'',	'',	'',	'2015-10-20 05:12:27',	1,	'N'),
(13478,	'2015-05-12',	'15:15:00',	0,	'ErÃ¶ffnung',	'',	'SONSTIGES',	0.00,	'Frieda_sparkonto',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-16 21:17:13',	1,	'N'),
(14225,	'2015-10-19',	'12:30:00',	0,	'REWE Lebensmittel ',	'',	'EINKAUF',	-7.88,	'horst_bargeld',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 10:42:02',	1,	'N'),
(14226,	'2015-10-19',	'18:27:00',	0,	'Backwerk essen',	'',	'LEBEN_HORST',	-3.63,	'horst_bargeld',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 10:42:02',	1,	'N'),
(14227,	'2015-09-23',	'12:29:00',	0,	'REWE Lebensmittel ',	'',	'EINKAUF',	-6.29,	'horst_bargeld',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 10:42:02',	1,	'N'),
(14228,	'2015-09-24',	'07:55:00',	0,	'BrÃ¶tchen',	'',	'LEBEN_HORST',	-0.80,	'horst_bargeld',	'',	3.75,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 10:42:02',	1,	'N'),
(14229,	'2015-09-24',	'12:15:00',	0,	'Abhebung',	'',	'ABHEBUNG',	50.00,	'horst_bargeld',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 10:42:02',	1,	'N'),
(14230,	'2015-09-24',	'18:30:00',	0,	'vegane steaks',	'',	'LEBEN',	-7.98,	'horst_bargeld',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 10:42:02',	1,	'N'),
(14235,	'2015-10-08',	'17:52:00',	0,	'test',	'',	'SONSTIGES',	11.00,	'horst_bargeld',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'horald-Easynote',	'2015-11-17 11:38:50',	1,	'J'),
(14232,	'2015-09-09',	'08:30:00',	0,	'alnatura',	'',	'LEBEN',	-11.19,	'horst_bargeld',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 10:44:40',	1,	'N'),
(14233,	'2015-09-13',	'12:42:00',	0,	'spende',	'',	'SPENDE',	-1.10,	'horst_bargeld',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 10:45:47',	1,	'N'),
(14234,	'2015-09-09',	'08:12:00',	0,	'BrÃ¶tchen',	'',	'LEBEN_HORST',	-0.80,	'horst_bargeld',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 10:46:57',	1,	'N'),
(14218,	'2015-10-16',	'18:00:00',	0,	'parken',	'',	'FAMILIE',	-2.00,	'horst_bargeld',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 10:42:02',	1,	'N'),
(14215,	'2015-10-14',	'14:52:00',	0,	'zeitung',	'',	'SPENDE',	-2.00,	'horst_bargeld',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 10:42:02',	1,	'N'),
(14211,	'2015-10-13',	'08:40:00',	0,	'Penny Einkauf ',	'',	'EINKAUF',	-5.59,	'horst_bargeld',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 10:42:02',	1,	'N'),
(14202,	'2015-10-08',	'08:03:00',	0,	'BrÃ¶tchen',	'',	'LEBEN_HORST',	-0.80,	'horst_bargeld',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 10:42:02',	1,	'N'),
(14203,	'2015-10-07',	'12:26:00',	0,	'REWE Lebensmittel ',	'',	'LEBEN_HORST',	-3.08,	'horst_bargeld',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 10:42:02',	1,	'N'),
(14204,	'2015-10-08',	'12:20:00',	0,	'REWE Lebensmittel ',	'',	'LEBEN_HORST',	-2.90,	'horst_bargeld',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 10:42:02',	1,	'N'),
(14205,	'2015-10-09',	'08:03:00',	0,	'BrÃ¶tchen',	'',	'LEBEN_HORST',	-0.80,	'horst_bargeld',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 10:42:02',	1,	'N'),
(14189,	'2015-09-30',	'12:25:00',	0,	'REWE Einkauf ',	'',	'EINKAUF',	-7.72,	'horst_bargeld',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 10:42:02',	1,	'N'),
(14184,	'2015-09-30',	'08:27:00',	0,	'BrÃ¶tchen',	'',	'LEBEN_HORST',	-1.20,	'horst_bargeld',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 10:42:02',	1,	'N'),
(14185,	'2015-09-29',	'12:34:00',	0,	'REWE Lebensmittel ',	'',	'EINKAUF',	-14.87,	'horst_bargeld',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 10:42:02',	1,	'N'),
(14177,	'2015-09-25',	'13:00:00',	0,	'buch',	'',	'GESCHENK',	-6.00,	'horst_bargeld',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 10:42:02',	1,	'N'),
(14171,	'2015-09-23',	'08:00:00',	0,	'BrÃ¶tchen',	'',	'LEBEN_HORST',	-0.80,	'horst_bargeld',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 10:42:02',	1,	'N'),
(14168,	'2015-09-20',	'17:30:00',	0,	'geld von papa',	'',	'BARGUTSCHRIFT',	20.00,	'horst_bargeld',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 10:42:02',	1,	'N'),
(14163,	'2015-09-21',	'18:48:00',	0,	'getrÃ¤nk',	'',	'LEBEN_HORST',	-1.49,	'horst_bargeld',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 10:42:02',	1,	'N'),
(14160,	'2015-09-20',	'12:49:00',	0,	'spende ',	'',	'SPENDE',	-2.40,	'horst_bargeld',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 10:42:02',	1,	'N'),
(14157,	'2015-09-16',	'12:28:00',	0,	'Einkauf baumarkt',	'',	'EINKAUF',	-14.72,	'horst_bargeld',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 10:42:02',	1,	'N'),
(14153,	'2015-09-15',	'14:00:00',	0,	'GenesungswÃ¼nsche',	'',	'GESCHENK',	-0.50,	'horst_bargeld',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 10:42:02',	1,	'N'),
(14145,	'2015-09-10',	'08:21:00',	0,	'BrÃ¶tchen',	'',	'LEBEN_HORST',	-0.80,	'horst_bargeld',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 10:42:02',	1,	'N'),
(14146,	'2015-09-11',	'08:04:00',	0,	'BrÃ¶tchen',	'',	'LEBEN_HORST',	-0.80,	'horst_bargeld',	'',	18.15,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 10:42:02',	1,	'N'),
(14147,	'2015-09-10',	'12:29:00',	0,	'Einkauf rewe',	'',	'LEBEN_HORST',	-2.84,	'horst_bargeld',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 10:42:02',	1,	'N'),
(14148,	'2015-09-13',	'12:43:00',	0,	'zooessen',	'',	'FAMILIE',	-17.00,	'horst_bargeld',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 10:42:02',	1,	'N'),
(14149,	'2015-09-14',	'08:17:00',	0,	'BrÃ¶tchen',	'',	'LEBEN_HORST',	-0.80,	'horst_bargeld',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 10:42:02',	1,	'N'),
(14150,	'2015-09-15',	'08:17:00',	0,	'BrÃ¶tchen',	'',	'LEBEN_HORST',	-0.80,	'horst_bargeld',	'',	38.35,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 10:42:02',	1,	'N'),
(14127,	'2015-08-31',	'12:29:00',	0,	'Einkauf rewe',	'',	'LEBEN_HORST',	-5.87,	'horst_bargeld',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 10:42:02',	1,	'N'),
(14126,	'2015-09-01',	'08:26:00',	0,	'BrÃ¶tchen',	'',	'LEBEN_HORST',	-0.80,	'horst_bargeld',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 10:42:02',	1,	'N'),
(14118,	'2015-08-29',	'18:54:00',	0,	'einkauf aldo',	'',	'EINKAUF',	-17.69,	'horst_bargeld',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 10:42:02',	1,	'N'),
(14119,	'2015-08-29',	'19:00:00',	0,	'losgewinn',	'',	'LOSGEWINN',	5.00,	'horst_bargeld',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 10:42:02',	1,	'N'),
(14120,	'2015-08-29',	'19:01:00',	0,	'lose',	'',	'FAMILIE',	-2.00,	'horst_bargeld',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 10:42:02',	1,	'N'),
(14121,	'2015-08-29',	'19:02:00',	0,	'einkauf kaufland',	'',	'EINKAUF',	-16.87,	'horst_bargeld',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 10:42:02',	1,	'N'),
(14122,	'2015-08-29',	'19:03:00',	0,	'einkauf rewe',	'',	'EINKAUF',	-4.42,	'horst_bargeld',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 10:42:02',	1,	'N'),
(14123,	'2015-08-29',	'19:04:00',	0,	'geld an chris',	'',	'BARLASTSCHRIFT',	-20.00,	'horst_bargeld',	'',	16.03,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 10:42:02',	1,	'N'),
(14124,	'2015-08-31',	'08:10:00',	0,	'BrÃ¶tchen',	'',	'LEBEN_HORST',	-0.80,	'horst_bargeld',	'',	14.03,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 10:42:02',	1,	'N'),
(14125,	'2015-08-30',	'08:10:00',	0,	'kirchenspende',	'',	'SPENDE',	-1.20,	'horst_bargeld',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 10:42:02',	1,	'N'),
(13968,	'2015-08-29',	'18:53:00',	0,	'geld von Horst ',	'',	'BARGUTSCHRIFT',	20.00,	'chris_bargeld',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 06:39:17',	1,	'N'),
(13960,	'2015-08-27',	'10:26:00',	0,	'Einkauf penny',	'',	'LEBEN',	-1.38,	'chris_bargeld',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 06:39:17',	1,	'N'),
(13965,	'2015-08-28',	'10:35:00',	0,	'Einkauf penny',	'',	'LEBEN',	-4.88,	'chris_bargeld',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 06:39:17',	1,	'N'),
(13964,	'2015-08-28',	'08:14:00',	0,	'Einkauf penny',	'',	'EINKAUF',	-1.05,	'chris_bargeld',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 06:39:17',	1,	'N'),
(14217,	'2015-10-16',	'16:01:00',	0,	'Kaffee ',	'',	'FAMILIE',	-2.20,	'horst_bargeld',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 10:42:02',	1,	'N'),
(14214,	'2015-10-14',	'13:09:00',	0,	'geld von chris',	'',	'BARGUTSCHRIFT',	20.00,	'horst_bargeld',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 10:42:02',	1,	'N'),
(14209,	'2015-10-14',	'11:14:00',	0,	'Kassensturz 2.31',	'',	'SONSTIGES',	0.00,	'horst_bargeld',	'',	2.31,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 10:42:02',	1,	'N'),
(14210,	'2015-10-12',	'17:44:00',	0,	'Penny Einkauf ',	'',	'EINKAUF',	0.39,	'horst_bargeld',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 10:42:02',	1,	'N'),
(14198,	'2015-10-06',	'08:44:00',	0,	'BrÃ¶tchen',	'',	'LEBEN_HORST',	-0.80,	'horst_bargeld',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 10:42:02',	1,	'N'),
(14199,	'2015-10-06',	'18:39:00',	0,	'einkauf dm',	'',	'EINKAUF',	-3.80,	'horst_bargeld',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 10:42:02',	1,	'N'),
(14200,	'2015-10-06',	'12:25:00',	0,	'REWE Einkauf ',	'',	'EINKAUF',	-9.16,	'horst_bargeld',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 10:42:02',	1,	'N'),
(14201,	'2015-10-07',	'08:29:00',	0,	'BrÃ¶tchen',	'',	'LEBEN_HORST',	-0.80,	'horst_bargeld',	'',	35.90,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 10:42:02',	1,	'N'),
(14188,	'2015-09-30',	'18:30:00',	0,	'REWE Lebensmittel ',	'',	'LEBEN_HORST',	-4.98,	'horst_bargeld',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 10:42:02',	1,	'N'),
(14181,	'2015-09-28',	'08:24:00',	0,	'BrÃ¶tchen',	'',	'LEBEN_HORST',	-0.80,	'horst_bargeld',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 10:42:02',	1,	'N'),
(14182,	'2015-09-29',	'07:12:00',	0,	'BrÃ¶tchen',	'',	'LEBEN_HORST',	-0.80,	'horst_bargeld',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 10:42:02',	1,	'N'),
(14183,	'2015-09-29',	'07:59:00',	0,	'BrÃ¶tchen',	'',	'LEBEN_HORST',	0.00,	'horst_bargeld',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 10:42:02',	1,	'N'),
(14176,	'2015-09-27',	'11:14:00',	0,	'frÃ¼hstÃ¼ck',	'',	'FAMILIE',	-6.18,	'horst_bargeld',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 10:42:02',	1,	'N'),
(14173,	'2015-09-27',	'10:59:00',	0,	'spende',	'',	'SPENDE',	-1.40,	'horst_bargeld',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 10:42:02',	1,	'N'),
(14170,	'2015-09-22',	'12:17:00',	0,	'REWE Lebensmittel ',	'',	'LEBEN_HORST',	-4.08,	'horst_bargeld',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 10:42:02',	1,	'N'),
(14165,	'2015-09-09',	'08:27:00',	0,	'rewe',	'',	'LEBEN',	-6.03,	'horst_bargeld',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 10:42:02',	1,	'N'),
(14162,	'2015-09-21',	'08:21:00',	0,	'BrÃ¶tchen',	'',	'LEBEN_HORST',	-0.80,	'horst_bargeld',	'',	21.64,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 10:42:02',	1,	'N'),
(14159,	'2015-09-18',	'12:18:00',	0,	'Einkauf baumarkt',	'',	'EINKAUF',	-7.12,	'horst_bargeld',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 10:42:02',	1,	'N'),
(14156,	'2015-09-18',	'09:00:00',	0,	'BrÃ¶tchen',	'',	'LEBEN_HORST',	-0.80,	'horst_bargeld',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 10:42:02',	1,	'N'),
(14152,	'2015-09-12',	'08:41:00',	0,	'pfand wagen',	'',	'PFAND',	-1.00,	'horst_bargeld',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 10:42:02',	1,	'N'),
(14140,	'2015-09-13',	'12:41:00',	0,	'Abhebung',	'',	'ABHEBUNG',	50.00,	'horst_bargeld',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 10:42:02',	1,	'N'),
(14141,	'2015-09-21',	'18:38:00',	0,	'essen backwerk',	'',	'LEBEN_HORST',	-3.63,	'horst_bargeld',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 10:42:02',	1,	'N'),
(14142,	'2015-09-09',	'08:29:00',	0,	'ct',	'',	'HAUSHALT',	-4.50,	'horst_bargeld',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 10:42:02',	1,	'N'),
(14143,	'2015-09-09',	'08:32:00',	0,	'laugenstange',	'',	'LEBEN_HORST',	-0.55,	'horst_bargeld',	'',	27.27,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 10:42:02',	1,	'N'),
(14144,	'2015-09-09',	'12:25:00',	0,	'REWE Lebensmittel ',	'',	'EINKAUF',	-4.68,	'horst_bargeld',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 10:42:02',	1,	'N'),
(14117,	'2015-08-29',	'15:29:00',	0,	'geld von chris',	'',	'ABHEBUNG',	70.00,	'horst_bargeld',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 10:42:02',	1,	'N'),
(14109,	'2015-08-25',	'12:18:00',	0,	'REWE Lebensmittel ',	'',	'LEBEN_HORST',	-2.04,	'horst_bargeld',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 10:42:02',	1,	'N'),
(14110,	'2015-08-26',	'08:11:00',	0,	'BrÃ¶tchen',	'',	'LEBEN_HORST',	-0.80,	'horst_bargeld',	'',	7.14,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 10:42:02',	1,	'N'),
(14111,	'2015-08-26',	'12:29:00',	0,	'sirup',	'',	'LEBEN_HORST',	-1.35,	'horst_bargeld',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 10:42:02',	1,	'N'),
(14112,	'2015-08-26',	'12:30:00',	0,	'leergut',	'',	'PFANDGUTSCHRIFT',	1.00,	'horst_bargeld',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 10:42:02',	1,	'N'),
(14113,	'2015-08-26',	'18:04:00',	0,	'backwerk pizza',	'',	'LEBEN_HORST',	-1.99,	'horst_bargeld',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 10:42:02',	1,	'N'),
(14114,	'2015-08-27',	'08:00:00',	0,	'BrÃ¶tchen',	'',	'LEBEN_HORST',	-0.80,	'horst_bargeld',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 10:42:02',	1,	'N'),
(14115,	'2015-08-27',	'10:14:00',	0,	'Brot',	'',	'LEBEN',	-1.19,	'horst_bargeld',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 10:42:02',	1,	'N'),
(14116,	'2015-08-28',	'08:08:00',	0,	'BrÃ¶tchen',	'',	'LEBEN_HORST',	-0.80,	'horst_bargeld',	'',	2.01,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 10:42:02',	1,	'N'),
(13792,	'2015-05-12',	'15:15:00',	0,	'ErÃ¶ffnung',	'',	'SONSTIGES',	0.00,	'Frieda_sparkonto',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 06:38:54',	1,	'N'),
(13977,	'2015-08-30',	'10:30:00',	0,	'kirchenspende',	'',	'SPENDE',	-3.10,	'chris_bargeld',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 06:39:17',	1,	'N'),
(13966,	'2015-08-29',	'14:45:00',	0,	'Eis',	'',	'KIND',	-2.60,	'chris_bargeld',	'',	5.33,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 06:39:17',	1,	'N'),
(13961,	'2015-08-27',	'15:00:00',	0,	'kratzeis',	'',	'KIND',	-1.00,	'chris_bargeld',	'',	13.86,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 06:39:17',	1,	'N'),
(13958,	'2015-08-27',	'07:00:00',	0,	'Kassensturz 16,24',	'',	'ANFANGSBESTAND',	16.24,	'chris_bargeld',	'',	16.24,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 06:39:17',	1,	'N'),
(14216,	'2015-10-14',	'13:15:00',	0,	'penny einkauf',	'',	'EINKAUF',	-3.17,	'horst_bargeld',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 10:42:02',	1,	'N'),
(14213,	'2015-10-13',	'16:21:00',	0,	'Drache',	'',	'KIND',	-1.00,	'horst_bargeld',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 10:42:02',	1,	'N'),
(14208,	'2015-10-10',	'16:00:00',	0,	'lose',	'',	'FAMILIE',	-4.00,	'horst_bargeld',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 10:42:02',	1,	'N'),
(14194,	'2015-10-04',	'11:00:00',	0,	'kirchenspende',	'',	'SPENDE',	-2.10,	'horst_bargeld',	'',	4.89,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 10:42:02',	1,	'N'),
(14195,	'2015-10-05',	'07:47:00',	0,	'BrÃ¶tchen',	'',	'LEBEN_HORST',	-0.80,	'horst_bargeld',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 10:42:02',	1,	'N'),
(14196,	'2015-10-05',	'18:51:00',	0,	'backwerk',	'',	'LEBEN_HORST',	-3.63,	'horst_bargeld',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 10:42:02',	1,	'N'),
(14197,	'2015-10-06',	'07:10:00',	0,	'Abhebung',	'',	'ABHEBUNG',	50.00,	'horst_bargeld',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 10:42:02',	1,	'N'),
(14179,	'2015-09-27',	'15:58:00',	0,	'fÃ¤hre',	'',	'FAMILIE',	-7.50,	'horst_bargeld',	'',	0.06,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 10:42:02',	1,	'N'),
(14180,	'2015-09-28',	'08:15:00',	0,	'Abhebung',	'',	'ABHEBUNG',	50.00,	'horst_bargeld',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 10:42:02',	1,	'N'),
(14175,	'2015-09-26',	'16:00:00',	0,	'lose',	'',	'FAMILIE',	-4.00,	'horst_bargeld',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 10:42:02',	1,	'N'),
(14172,	'2015-09-25',	'08:10:00',	0,	'BrÃ¶tchen',	'',	'LEBEN_HORST',	-0.80,	'horst_bargeld',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 10:42:02',	1,	'N'),
(14167,	'2015-09-19',	'15:00:00',	0,	'einkaufswagen',	'',	'LEBEN',	-1.00,	'horst_bargeld',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 10:42:02',	1,	'N'),
(14164,	'2015-09-08',	'08:11:00',	0,	'Abhebung',	'',	'ABHEBUNG',	50.00,	'horst_bargeld',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 10:42:02',	1,	'N'),
(14161,	'2015-09-20',	'12:50:00',	0,	'lotto',	'',	'FAMILIE',	-2.00,	'horst_bargeld',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 10:42:02',	1,	'N'),
(14155,	'2015-09-16',	'08:59:00',	0,	'BrÃ¶tchen',	'',	'LEBEN_HORST',	-0.80,	'horst_bargeld',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 10:42:02',	1,	'N'),
(14151,	'2015-09-11',	'12:31:00',	0,	'REWE Lebensmittel ',	'',	'EINKAUF',	-5.76,	'horst_bargeld',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 10:42:02',	1,	'N'),
(14133,	'2015-09-03',	'12:19:00',	0,	'Einkauf rewe',	'',	'LEBEN_HORST',	-3.44,	'horst_bargeld',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 10:42:02',	1,	'N'),
(14134,	'2015-09-04',	'08:30:00',	0,	'BrÃ¶tchen',	'',	'LEBEN_HORST',	-0.80,	'horst_bargeld',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 10:42:02',	1,	'N'),
(14135,	'2015-09-04',	'18:00:00',	0,	'Sonnenblume',	'',	'SONSTIGES',	-1.95,	'horst_bargeld',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 10:42:02',	1,	'N'),
(14136,	'2015-09-07',	'08:00:00',	0,	'BrÃ¶tchen',	'',	'LEBEN_HORST',	-0.80,	'horst_bargeld',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 10:42:02',	1,	'N'),
(14137,	'2015-09-06',	'10:30:00',	0,	'spende',	'',	'SPENDE',	-0.70,	'horst_bargeld',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 10:42:02',	1,	'N'),
(14138,	'2015-09-05',	'17:34:00',	0,	'lose',	'',	'FAMILIE',	-2.00,	'horst_bargeld',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 10:42:02',	1,	'N'),
(14108,	'2015-08-25',	'07:58:00',	0,	'BrÃ¶tchen',	'',	'LEBEN_HORST',	-0.80,	'horst_bargeld',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 10:42:02',	1,	'N'),
(14107,	'2015-08-24',	'22:41:00',	0,	'Kassensturz 10,78',	'',	'SONSTIGES',	-87.67,	'horst_bargeld',	'',	10.78,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 10:42:02',	1,	'N'),
(14106,	'2015-08-24',	'08:08:00',	0,	'BrÃ¶tchen',	'',	'LEBEN_HORST',	-0.80,	'horst_bargeld',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 10:42:02',	1,	'N'),
(13949,	'2015-05-12',	'15:15:00',	0,	'ErÃ¶ffnung',	'',	'SONSTIGES',	0.00,	'Frieda_sparkonto',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 06:39:17',	1,	'N'),
(14219,	'2015-10-17',	'16:01:00',	0,	'lose',	'',	'FAMILIE',	-4.00,	'horst_bargeld',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 10:42:02',	1,	'N'),
(14220,	'2015-10-18',	'10:30:00',	0,	'kirchenspende',	'',	'SPENDE',	-1.20,	'horst_bargeld',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 10:42:02',	1,	'N'),
(14221,	'2015-10-18',	'11:24:00',	0,	'klo',	'',	'KIND',	-0.50,	'horst_bargeld',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 10:42:02',	1,	'N'),
(14222,	'2015-10-18',	'11:31:00',	0,	'Abhebung',	'',	'ABHEBUNG',	100.00,	'horst_bargeld',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 10:42:02',	1,	'N'),
(14223,	'2015-10-18',	'15:09:00',	0,	'essen burger',	'',	'FAMILIE',	-48.00,	'horst_bargeld',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 10:42:02',	1,	'N'),
(14224,	'2015-10-19',	'07:57:00',	0,	'BrÃ¶tchen',	'',	'LEBEN_HORST',	-0.80,	'horst_bargeld',	'',	58.44,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 10:42:02',	1,	'N'),
(13983,	'2015-09-01',	'10:00:00',	0,	'Abhebung',	'',	'ABHEBUNG',	50.00,	'chris_bargeld',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 06:39:17',	1,	'N'),
(13984,	'2015-09-03',	'07:19:00',	0,	'geld an horst',	'',	'BARLASTSCHRIFT',	-10.00,	'chris_bargeld',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 06:39:17',	1,	'N'),
(13986,	'2015-09-01',	'11:00:00',	0,	'Einkauf',	'',	'EINKAUF',	-7.04,	'chris_bargeld',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 06:39:17',	1,	'N'),
(13987,	'2015-09-02',	'10:00:00',	0,	'Einkauf',	'',	'EINKAUF',	-4.98,	'chris_bargeld',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 06:39:17',	1,	'N'),
(13988,	'2015-09-02',	'11:00:00',	0,	'Einkauf',	'',	'EINKAUF',	-1.49,	'chris_bargeld',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 06:39:17',	1,	'N'),
(13989,	'2015-09-03',	'07:26:00',	0,	'Schulgeld BÃ¼cher',	'',	'KIND',	-17.60,	'chris_bargeld',	'',	31.12,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 06:39:17',	1,	'N'),
(13992,	'2015-09-04',	'06:59:00',	0,	'summe einkÃ¤ufe',	'',	'EINKAUF',	-27.79,	'chris_bargeld',	'',	3.33,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 06:39:17',	1,	'N'),
(14212,	'2015-10-11',	'16:00:00',	0,	'Folktanz',	'',	'FAMILIE',	-7.70,	'horst_bargeld',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 10:42:02',	1,	'N'),
(14206,	'2015-10-09',	'12:20:00',	0,	'REWE Einkauf ',	'',	'EINKAUF',	-5.91,	'horst_bargeld',	'',	22.41,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 10:42:02',	1,	'N'),
(14207,	'2015-10-11',	'11:15:00',	0,	'kirchenspende',	'',	'SPENDE',	-2.20,	'horst_bargeld',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 10:42:02',	1,	'N'),
(14190,	'2015-10-01',	'12:05:00',	0,	'birne rÃ¼ckgabe',	'',	'SONSTIGES',	2.49,	'horst_bargeld',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 10:42:02',	1,	'N'),
(14191,	'2015-10-02',	'09:06:00',	0,	'BrÃ¶tchen',	'',	'LEBEN_HORST',	-0.80,	'horst_bargeld',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 10:42:02',	1,	'N'),
(14192,	'2015-10-01',	'12:27:00',	0,	'lakritz',	'',	'LEBEN_HORST',	-1.29,	'horst_bargeld',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 10:42:02',	1,	'N'),
(14193,	'2015-10-02',	'12:23:00',	0,	'REWE Einkauf ',	'',	'EINKAUF',	-6.30,	'horst_bargeld',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 10:42:02',	1,	'N'),
(14187,	'2015-10-01',	'09:01:00',	0,	'BrÃ¶tchen',	'',	'LEBEN_HORST',	-0.80,	'horst_bargeld',	'',	12.89,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 10:42:02',	1,	'N'),
(14178,	'2015-09-25',	'12:50:00',	0,	'netto',	'',	'LEBEN_HORST',	-2.83,	'horst_bargeld',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 10:42:02',	1,	'N'),
(14077,	'2015-10-14',	'14:53:00',	0,	'blumen',	'',	'GESCHENK',	-10.00,	'chris_bargeld',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 06:39:17',	1,	'N'),
(14186,	'2015-09-29',	'12:30:00',	0,	'kopien',	'',	'SONSTIGES',	-6.00,	'horst_bargeld',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 10:42:02',	1,	'N'),
(14174,	'2015-09-25',	'12:30:00',	0,	'frisÃ¶t',	'',	'PFLEGE',	-17.00,	'horst_bargeld',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 10:42:02',	1,	'N'),
(14169,	'2015-09-22',	'08:15:00',	0,	'BrÃ¶tchen',	'',	'LEBEN_HORST',	-0.80,	'horst_bargeld',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 10:42:02',	1,	'N'),
(14166,	'2015-09-14',	'12:17:00',	0,	'REWE Lebensmittel ',	'',	'EINKAUF',	-3.34,	'horst_bargeld',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 10:42:02',	1,	'N'),
(14158,	'2015-09-17',	'18:53:00',	0,	'einkauf penny',	'',	'EINKAUF',	-5.77,	'horst_bargeld',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 10:42:02',	1,	'N'),
(14154,	'2015-09-17',	'08:58:00',	0,	'BrÃ¶tchen',	'',	'LEBEN_HORST',	-0.80,	'horst_bargeld',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 10:42:02',	1,	'N'),
(14128,	'2015-09-01',	'12:29:00',	0,	'REWE Einkauf ',	'',	'EINKAUF',	-3.04,	'horst_bargeld',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 10:42:02',	1,	'N'),
(14129,	'2015-09-02',	'08:32:00',	0,	'BrÃ¶tchen',	'',	'LEBEN_HORST',	-0.80,	'horst_bargeld',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 10:42:02',	1,	'N'),
(14130,	'2015-09-02',	'12:21:00',	0,	'Einkauf rewÃª',	'',	'LEBEN_HORST',	-2.64,	'horst_bargeld',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 10:42:02',	1,	'N'),
(14131,	'2015-09-03',	'07:20:00',	0,	'geld von chris',	'',	'BARGUTSCHRIFT',	10.00,	'horst_bargeld',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 10:42:02',	1,	'N'),
(14132,	'2015-09-03',	'07:40:00',	0,	'BrÃ¶tchen',	'',	'LEBEN_HORST',	-0.85,	'horst_bargeld',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 10:42:02',	1,	'N'),
(14094,	'2015-10-26',	'20:42:00',	0,	'REWE Einkauf',	'',	'EINKAUF',	10.52,	'chris_bargeld',	'',	3.85,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 06:39:17',	1,	'N'),
(14236,	'2015-11-07',	'00:00:00',	0,	'Agavendicksaft',	'',	'[_____________]',	-2.65,	'horst_bargeld',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 10:52:04',	1,	'N'),
(14104,	'2014-12-31',	'18:11:00',	0,	'Endbestand',	'',	'(ohne)',	100.00,	'horst_bargeld',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 10:42:02',	1,	'N'),
(14103,	'2015-02-17',	'07:41:00',	0,	'KÃ¤sebrÃ¶tchen',	'',	'LEBEN_HORST',	-0.75,	'horst_bargeld',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 10:42:02',	1,	'N'),
(14098,	'2015-11-07',	'15:00:00',	0,	'Alsan',	'',	'[_____________]',	-0.75,	'chris_bargeld',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 06:39:17',	1,	'N'),
(14099,	'2015-11-07',	'15:00:00',	0,	'Kalkstopppulver',	'',	'[_____________]',	-2.55,	'chris_bargeld',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 06:39:17',	1,	'N'),
(14100,	'2015-11-07',	'15:00:00',	0,	'Alsan',	'',	'[_____________]',	-0.75,	'chris_bargeld',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 06:39:17',	1,	'N'),
(14101,	'2015-11-07',	'15:00:00',	0,	'Kalkstopppulver',	'',	'[_____________]',	-2.55,	'chris_bargeld',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 06:39:17',	1,	'N'),
(14102,	'2015-11-07',	'15:00:00',	0,	'Einkauf',	'',	'EINKAUF',	3.30,	'chris_bargeld',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'',	'2015-11-17 06:39:17',	1,	'N'),
(14241,	'2015-12-31',	'13:30:00',	0,	'Kassensturz 96,63',	'',	'SONSTIGES',	96.08,	'chris_bargeld',	'',	96.63,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'horald-Easynote',	'2015-12-31 13:28:33',	1,	'N'),
(14251,	'2015-12-31',	'13:30:00',	0,	'Kassensturz 134,32',	'',	'SONSTIGES',	90.04,	'horst_bargeld',	'',	134.32,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'horald-Easynote',	'2015-12-31 13:24:21',	1,	'N'),
(14271,	'2016-01-04',	'08:00:00',	0,	'BrÃ¶tchen',	'',	'LEBEN_HORST',	-0.80,	'horst_bargeld',	'',	0.00,	'0000-00-00',	0.00,	'',	0,	'',	'N',	0,	'',	'',	'horald-Easynote',	'2016-01-04 17:53:07',	1,	'N');

CREATE TABLE `tblktotyp` (
  `fldIndex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldTyp` varchar(50) COLLATE utf8_bin NOT NULL,
  `fldBez` varchar(200) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldIndex`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

INSERT INTO `tblktotyp` (`fldIndex`, `fldTyp`, `fldBez`) VALUES
(24,	'CSV-IMPORT',	'CSV-Import'),
(25,	'XML-IMPORT',	'Einkaufsliste'),
(26,	'SQL-IMPORT',	'SQL-Import'),
(27,	'SQLITE-IMPORT',	'Sqlite-Import'),
(3,	'KSK-IMPORT',	'KSK-Import'),
(23,	'TARGO-IMPORT',	'Targobank-Import');

CREATE TABLE `tblktozuord` (
  `fldIndex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldKurz` varchar(20) COLLATE utf8_bin NOT NULL,
  `fldSuch` varchar(250) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldIndex`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

INSERT INTO `tblktozuord` (`fldIndex`, `fldKurz`, `fldSuch`) VALUES
(294,	'EINKAUF',	'EINKAUF'),
(295,	'PRIVAT',	'CHRIS_PRIVAT'),
(3,	'MIETE',	'MIETE'),
(13,	'GEHALTHORST',	'VERDIENST'),
(23,	'LASTSCHRIFT',	'ALDI'),
(33,	'EINKAUF',	'KAUFLAND'),
(43,	'EINKAUF',	'PENNY'),
(53,	'STROM',	'GENO'),
(63,	'AUTO',	'ADAC'),
(73,	'EINKAUF',	'REWE'),
(83,	'EINKAUF',	'MEDIA'),
(93,	'AUTO',	'ARAL'),
(103,	'TELEFON',	'CONGSTAR'),
(113,	'FLINKSTER',	'FLINKSTER'),
(123,	'BEKL',	'C&'),
(133,	'KIND',	'REGENBOGEN'),
(143,	'TELEFON',	'NETCOLOGNE'),
(153,	'HOMEPAGE',	'1&'),
(163,	'GEBUEHR',	'KREISSPARKASSE'),
(173,	'ABHEBUNG',	'GA NR'),
(183,	'GEHALTCHRIS',	'LOHN / GEHALT'),
(193,	'KIND',	'MUSIKSCHULGEB'),
(203,	'EINKAUF',	'AMAZON'),
(213,	'GEBUEHR',	'GAA-AUSZAHLUNG'),
(223,	'SCHULDEN',	'INKASSO'),
(233,	'KIND',	'ELTERNBEITRAG'),
(243,	'KINDERGELD',	'FAMILIENKASSE'),
(253,	'EINKAUF',	'DROGERIEMARKT'),
(263,	'VERSICHERUNG',	'DEVK'),
(273,	'RUNDFUNK',	'ARD ZDF'),
(283,	'GUTSCHRIFT',	'GUTSCHRIFT'),
(293,	'MED',	'APOTHEKE'),
(303,	'ABHEBUNG',	'AUSZAHLUNG GELDAUTOMAT'),
(313,	'MIETE',	'GARAGENMIETE'),
(323,	'AUTO',	'ESSO'),
(383,	'AUSFLUG',	'CALEVORNIA'),
(343,	'EINKAUF',	'KAUFHOF'),
(353,	'BEKL',	'DEICHMANN'),
(363,	'LASTSCHRIFT',	'REAL'),
(373,	'GEBUEHR',	'VERBR.NORDRHEIN'),
(393,	'GEBUEHR',	'Abschluss Abrechnung'),
(403,	'GEBUEHR',	'GRUNDGEB'),
(413,	'SPAREINLAGE',	'SPAREINLAGE'),
(423,	'MIETE',	'HILDEGARD HELFF'),
(433,	'LEBENHORST',	'LEBENSMITTEL_HORST'),
(443,	'AUTO',	'JET-TANK'),
(453,	'ZOO',	'ZOO'),
(463,	'MUSICSCHULE',	'Musicfactory'),
(473,	'AUTO',	'SB TANK'),
(483,	'BUECHER',	'THALIA'),
(493,	'SCHWIMMKURS',	'PROPHYSIO'),
(503,	'AUTO',	'SHELL'),
(513,	'KIND',	'ERNSTINGS'),
(522,	'LEBEN',	'ALNATURA'),
(532,	'KIND',	'KOELNER VERKEHR'),
(542,	'PRIVAT',	'MAYERSCHE'),
(552,	'SPENDE',	'WORLDVISION'),
(562,	'PFLEG',	'HAIRSHOP'),
(563,	'SCHULDEN',	'CREDITREFORM'),
(564,	'TELEFON',	'PREPAID');

CREATE TABLE `tbllanguage` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldkurz` varchar(4) COLLATE utf8_bin NOT NULL,
  `fldbez` varchar(250) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


CREATE TABLE `tblmengein` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldkurz` varchar(50) NOT NULL,
  `fldbez` varchar(200) NOT NULL,
  `fldid_grundeinheit` bigint(20) NOT NULL,
  `fldcalc` varchar(1) NOT NULL,
  `fldfaktor` varchar(10) NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

INSERT INTO `tblmengein` (`fldindex`, `fldkurz`, `fldbez`, `fldid_grundeinheit`, `fldcalc`, `fldfaktor`) VALUES
(2,	'STK',	'StÃ¼ck',	1,	'',	''),
(3,	'L',	'Liter',	2,	'',	''),
(4,	'PK',	'Packung(en)',	1,	'',	'');

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

INSERT INTO `tblmenu_liste` (`fldMenu`, `fldIndex`, `fldtblwebadr`, `fldSort`, `fldGroup`, `fldview`, `fldid_modul`, `fldparent`, `fldversion`, `fldTyp`, `fldName`, `fldtimestamp`, `fldid_publictyp`, `fldhelplink`, `fldtarget`, `fldid_menuprojekt`, `fldart`) VALUES
('Gruppen bearbeiten',	93,	NULL,	'00000',	NULL,	'J',	93,	'18',	'0302',	'',	'',	'0000-00-00 00:00:00',	0,	'',	'',	13,	''),
('Adressliste',	83,	'\"http://localhost/webportal/adressliste/index.php\"',	'00008',	NULL,	'J',	73,	'0',	'0302',	'',	'',	'0000-00-00 00:00:00',	0,	'',	'',	13,	''),
('Addressliste-neu',	73,	'\"sites/views/wp_adress/index.php\"',	'00007',	'MAIN',	'N',	3,	'0',	'0302',	'',	'',	'0000-00-00 00:00:00',	0,	'',	'',	13,	''),
('Notizen',	63,	'\"http://localhost/webportal/zwiegespraech/index.php\"',	'00003',	NULL,	'J',	33,	'0',	'0302',	'',	'',	'0000-00-00 00:00:00',	0,	'',	'',	13,	''),
('Erledigungen',	53,	'\"http://localhost/webportal/erledigung/index.php\"',	'00002',	NULL,	'J',	13,	'0',	'0302',	'',	'',	'0000-00-00 00:00:00',	0,	'',	'',	13,	''),
('Geburtstage',	43,	'\"http://localhost/webportal/geburtstage/index.php\"',	'00006',	NULL,	'J',	63,	'0',	'0302',	'',	'',	'0000-00-00 00:00:00',	0,	'',	'',	13,	''),
('Konto',	33,	'\"http://localhost/webportal/konto/ktosal.php\"',	'00003',	NULL,	'J',	23,	'0',	'0302',	'',	'',	'0000-00-00 00:00:00',	0,	'',	'',	13,	''),
('Geschenkeliste',	23,	'\"http://localhost/webportal/geschenke/index.php\"',	'00006',	NULL,	'J',	53,	'0',	'0302',	'',	'',	'0000-00-00 00:00:00',	0,	'',	'',	13,	''),
('Administration',	13,	'\"admin/index.php\"',	'00100',	'MAIN',	'J',	3,	'0',	'0302',	'',	'',	'0000-00-00 00:00:00',	0,	'',	'',	13,	''),
('Einkaufsliste',	3,	'\"sites/views/wp_shopping/index.php\"',	'00010',	'MAIN',	'J',	43,	'0',	'0302',	'',	'',	'0000-00-00 00:00:00',	0,	'',	'',	13,	''),
('Status bearbeiten',	103,	NULL,	'00000',	NULL,	'J',	13,	'Erledigungen',	'0302',	'',	'',	'0000-00-00 00:00:00',	0,	'',	'',	13,	''),
('Vorrat',	113,	NULL,	'00004',	NULL,	'J',	93,	'0',	'0302',	'',	'',	'0000-00-00 00:00:00',	0,	'',	'',	13,	''),
('Reiseliste',	123,	NULL,	'00005',	NULL,	'J',	93,	'0',	'0302',	'',	'',	'0000-00-00 00:00:00',	0,	'',	'',	13,	''),
('Docman',	133,	NULL,	'00006',	NULL,	'J',	93,	'0',	'0302',	'',	'',	'0000-00-00 00:00:00',	0,	'',	'',	13,	''),
('Elternstunden',	143,	NULL,	'00009',	NULL,	'J',	113,	'0',	'0302',	'',	'',	'0000-00-00 00:00:00',	0,	'',	'',	13,	''),
('Home',	153,	NULL,	'00001',	NULL,	'J',	83,	'0',	'0302',	'',	'',	'0000-00-00 00:00:00',	0,	'',	'',	13,	''),
('Verbesserung',	163,	NULL,	'00011',	NULL,	'J',	93,	'0',	'0302',	'',	'',	'0000-00-00 00:00:00',	0,	'',	'',	13,	''),
('Essensplan',	173,	NULL,	'00012',	NULL,	'J',	93,	'0',	'0302',	'',	'',	'0000-00-00 00:00:00',	0,	'',	'',	13,	''),
('Einkaufsliste',	183,	'',	'00010',	'MAIN',	'J',	173,	'0',	'0303',	'',	'',	'0000-00-00 00:00:00',	0,	'',	'',	13,	''),
('Administration',	193,	'',	'00100',	'MAIN',	'J',	133,	'0',	'0303',	'',	'',	'0000-00-00 00:00:00',	0,	'',	'',	13,	''),
('Geschenke',	203,	'',	'00006',	NULL,	'J',	183,	'1095',	'0312',	'MODUL',	'',	'0000-00-00 00:00:00',	0,	'',	'',	13,	''),
('Konto',	213,	'',	'00004',	NULL,	'J',	153,	'1034',	'0303',	'MODUL',	'ACCOUNT',	'0000-00-00 00:00:00',	0,	'',	'',	13,	''),
('Geburtstage',	223,	'',	'00006',	NULL,	'J',	193,	'1095',	'0312',	'MODUL',	'',	'0000-00-00 00:00:00',	0,	'',	'',	13,	''),
('Erledigungen',	233,	'',	'00003',	NULL,	'J',	143,	'1034',	'0303',	'MODUL',	'TASK',	'0000-00-00 00:00:00',	0,	'',	'',	13,	''),
('Notizen',	243,	'',	'00003',	NULL,	'N',	163,	'0',	'0303',	'MODUL',	'NOTICE',	'0000-00-00 00:00:00',	0,	'',	'',	13,	''),
('Prior',	393,	NULL,	'',	NULL,	'J',	303,	'233',	'0303',	'',	'',	'0000-00-00 00:00:00',	0,	'',	'',	13,	''),
('Adressliste',	263,	'',	'00008',	NULL,	'J',	203,	'0',	'0303',	'',	'',	'0000-00-00 00:00:00',	0,	'',	'',	13,	''),
('Status bearbeiten',	283,	NULL,	'00013',	NULL,	'J',	273,	'233',	'0303',	'',	'',	'0000-00-00 00:00:00',	0,	'',	'',	13,	''),
('Vorrat',	293,	NULL,	'00004',	NULL,	'N',	243,	'0',	'0303',	'MODUL',	'',	'0000-00-00 00:00:00',	0,	'',	'',	13,	''),
('Checkliste',	303,	NULL,	'00005',	NULL,	'N',	253,	'0',	'0303',	'',	'',	'0000-00-00 00:00:00',	0,	'',	'',	13,	''),
('Docman',	313,	NULL,	'00006',	NULL,	'N',	263,	'0',	'0303',	'MODUL',	'',	'0000-00-00 00:00:00',	0,	'',	'',	13,	''),
('Elternstunden',	323,	'',	'00009',	NULL,	'J',	233,	'1095',	'0312',	'MODUL',	'',	'0000-00-00 00:00:00',	0,	'',	'',	13,	''),
('Home',	333,	NULL,	'00001',	NULL,	'J',	213,	'0',	'0303',	'',	'',	'0000-00-00 00:00:00',	0,	'',	'',	13,	''),
('Verbesserung',	343,	NULL,	'00011',	NULL,	'N',	223,	'0',	'0303',	'',	'',	'0000-00-00 00:00:00',	0,	'',	'',	13,	''),
('Essensplan',	353,	NULL,	'00012',	NULL,	'N',	223,	'0',	'0303',	'',	'',	'0000-00-00 00:00:00',	0,	'',	'',	13,	''),
('Fahrtenbuch',	363,	NULL,	'00013',	NULL,	'N',	283,	'0',	'0303',	'MODUL',	'',	'0000-00-00 00:00:00',	0,	'',	'',	13,	''),
('Kaufort',	373,	NULL,	'00014',	NULL,	'J',	293,	'183',	'0303',	'',	'',	'0000-00-00 00:00:00',	0,	'',	'',	13,	''),
('Status bearbeiten',	383,	NULL,	NULL,	NULL,	'J',	273,	'183',	'0303',	'',	'',	'0000-00-00 00:00:00',	0,	'',	'',	13,	''),
('Benutzer',	403,	NULL,	'',	NULL,	'J',	323,	'233',	'0303',	'MODUL',	'USER',	'0000-00-00 00:00:00',	0,	'',	'',	13,	''),
('Kategorie',	413,	NULL,	'',	NULL,	'J',	313,	'233',	'0303',	'MODUL',	'',	'0000-00-00 00:00:00',	0,	'',	'',	13,	''),
('Terminkalender',	423,	NULL,	'00015',	NULL,	'N',	333,	'0',	'0303',	'PLUGIN',	'',	'0000-00-00 00:00:00',	0,	'',	'',	13,	''),
('Stammdaten',	433,	NULL,	'',	NULL,	'J',	343,	'183',	'0303',	'MODUL',	'',	'0000-00-00 00:00:00',	0,	'',	'',	13,	''),
('Kontengruppe',	443,	NULL,	'',	NULL,	'J',	363,	'213',	'0303',	'MODUL',	'',	'0000-00-00 00:00:00',	0,	'',	'',	13,	''),
('Module',	453,	NULL,	'',	NULL,	'J',	353,	'193',	'0303',	'MODUL',	'',	'0000-00-00 00:00:00',	0,	'',	'',	13,	''),
('Konten',	463,	NULL,	'',	NULL,	'J',	373,	'213',	'0303',	'MODUL',	'',	'0000-00-00 00:00:00',	0,	'',	'',	13,	''),
('Kontenzuordnung',	473,	'',	'',	NULL,	'J',	383,	'463',	'0312',	'MODUL',	'',	'0000-00-00 00:00:00',	0,	'',	'',	13,	''),
('Sync-Computer',	483,	'',	'',	NULL,	'J',	393,	'193',	'0312',	'MODUL',	'',	'0000-00-00 00:00:00',	0,	'',	'',	13,	''),
('dbsync',	493,	'',	'',	NULL,	'J',	403,	'483',	'0312',	'MODUL',	'',	'0000-00-00 00:00:00',	0,	'',	'',	13,	''),
('Trigger',	503,	'',	'',	NULL,	'J',	413,	'483',	'0312',	'MODUL',	'',	'0000-00-00 00:00:00',	0,	'',	'',	13,	''),
('Erledigungsgruppe',	513,	NULL,	'',	NULL,	'J',	423,	'233',	'0303',	'MODUL',	'',	'0000-00-00 00:00:00',	0,	'',	'',	13,	''),
('Programmupdate',	523,	'',	'00090',	NULL,	'J',	433,	'193',	'0312',	'MODUL',	'',	'0000-00-00 00:00:00',	0,	'',	'',	13,	''),
('Funktionen',	533,	NULL,	'',	NULL,	'J',	443,	'193',	'0303',	'MODUL',	'',	'0000-00-00 00:00:00',	0,	'',	'',	13,	''),
('Oberkonten',	543,	'',	'',	NULL,	'J',	453,	'463',	'0312',	'MODUL',	'',	'0000-00-00 00:00:00',	0,	'',	'',	13,	''),
('Abteilungen',	553,	NULL,	'',	NULL,	'J',	463,	'183',	'0303',	'MODUL',	'',	'0000-00-00 00:00:00',	0,	'',	'',	13,	''),
('Adressgruppe',	563,	NULL,	'',	NULL,	'J',	473,	'263',	'0303',	'MODUL',	'',	'0000-00-00 00:00:00',	0,	'',	'',	13,	''),
('Kontenart',	573,	NULL,	'',	NULL,	'J',	483,	'183',	'0303',	'MODUL',	'',	'0000-00-00 00:00:00',	0,	'',	'',	13,	''),
('Adresszuordnung',	583,	NULL,	'',	NULL,	'J',	493,	'263',	'0303',	'MODUL',	'',	'0000-00-00 00:00:00',	0,	'',	'',	13,	''),
('Reiseliste',	613,	'',	'00016',	NULL,	'J',	513,	'1095',	'0312',	'MODUL',	'',	'0000-00-00 00:00:00',	0,	'',	'',	13,	''),
('Bilder',	603,	NULL,	'',	NULL,	'J',	503,	'293',	'0303',	'MODUL',	'',	'0000-00-00 00:00:00',	0,	'',	'',	13,	''),
('Reisegrund',	623,	NULL,	'',	NULL,	'J',	523,	'613',	'0303',	'MODUL',	'',	'0000-00-00 00:00:00',	0,	'',	'',	13,	''),
('Gepaeckliste',	633,	NULL,	'',	NULL,	'J',	533,	'613',	'0303',	'MODUL',	'',	'0000-00-00 00:00:00',	0,	'',	'',	13,	''),
('Gepaeckstueck',	643,	NULL,	'',	NULL,	'J',	543,	'613',	'0303',	'MODUL',	'',	'0000-00-00 00:00:00',	0,	'',	'',	13,	''),
('Briefverkehr',	653,	NULL,	'',	NULL,	'J',	553,	'313',	'0303',	'MODUL',	'',	'0000-00-00 00:00:00',	0,	'',	'',	13,	''),
('Zimmer',	663,	NULL,	'',	NULL,	'J',	563,	'293',	'0303',	'MODUL',	'',	'0000-00-00 00:00:00',	0,	'',	'',	13,	''),
('Moebel',	673,	NULL,	'',	NULL,	'J',	573,	'293',	'0303',	'MODUL',	'',	'0000-00-00 00:00:00',	0,	'',	'',	13,	''),
('Faecher',	683,	NULL,	'',	NULL,	'J',	583,	'293',	'0303',	'MODUL',	'',	'0000-00-00 00:00:00',	0,	'',	'',	13,	''),
('RechDatum',	693,	NULL,	'',	NULL,	'J',	593,	'363',	'0303',	'MODUL',	'',	'0000-00-00 00:00:00',	0,	'',	'',	13,	''),
('Wiki',	703,	NULL,	'00091',	NULL,	'N',	613,	'0',	'0303',	'PLUGIN',	'',	'0000-00-00 00:00:00',	0,	'',	'',	13,	''),
('Sprache',	713,	NULL,	'',	NULL,	'J',	603,	'193',	'0303',	'MODUL',	'',	'0000-00-00 00:00:00',	0,	'',	'',	13,	''),
('Dauerauftrag',	723,	NULL,	'',	NULL,	'J',	623,	'233',	'0303',	'MODUL',	'',	'0000-00-00 00:00:00',	0,	'',	'',	13,	''),
('Kontotyp',	733,	'',	'',	'',	'J',	633,	'463',	'0312',	'MODUL',	'',	'0000-00-00 00:00:00',	0,	'',	'',	13,	''),
('Notizen',	734,	NULL,	'00003',	NULL,	'J',	163,	'0',	'0303',	'MODUL',	'',	'2013-08-29 17:22:44',	0,	'',	'',	13,	''),
('Gruppe',	744,	NULL,	'',	NULL,	'J',	423,	'734',	'0303',	'MODUL',	'',	'2013-08-30 16:26:12',	0,	'',	'',	13,	''),
('Aufgabenplan',	754,	'',	'00080',	NULL,	'J',	644,	'1095',	'0312',	'MODUL',	'',	'2014-01-16 20:47:43',	0,	'',	'',	13,	''),
('Benutzerwechsel',	764,	NULL,	'',	NULL,	'J',	654,	'754',	'0303',	'MODUL',	'',	'2014-01-16 21:48:32',	0,	'',	'',	13,	''),
('Termine',	973,	'',	'00009',	'',	'J',	843,	'0',	'0303',	'MODUL',	'DATES',	'2013-08-27 17:43:06',	3,	'Joorgportal/Termine',	'',	13,	''),
('Statusgruppe',	974,	'',	'',	NULL,	'N',	0,	'263',	'0312',	'MODUL',	'',	'2014-04-08 21:12:47',	0,	'',	'',	13,	''),
('Aufgabenuser',	984,	'',	'',	NULL,	'J',	674,	'754',	'0312',	'MODUL',	'',	'2014-04-28 19:13:56',	0,	'',	'',	13,	''),
('Essensplan',	994,	'',	'00011',	NULL,	'J',	684,	'1095',	'0312',	'MODUL',	'',	'2014-07-26 08:57:26',	0,	'',	'',	13,	''),
('Stundenplan',	1004,	NULL,	'',	NULL,	'J',	1013,	'973',	'0303',	'MODUL',	'',	'2014-08-22 16:15:28',	0,	'',	'',	13,	''),
('Zeiten',	1014,	NULL,	'',	NULL,	'J',	1344,	'1004',	'0303',	'MODUL',	'',	'2014-08-22 16:18:12',	0,	'',	'',	13,	''),
('Wotag',	1024,	NULL,	'',	NULL,	'J',	1345,	'1004',	'0303',	'MODUL',	'',	'2014-08-22 16:19:44',	0,	'',	'',	13,	''),
('Privat',	1034,	NULL,	'00002',	NULL,	'J',	783,	'0',	'0303',	'MODUL',	'',	'2014-08-22 17:58:12',	0,	'',	'',	13,	''),
('Heizung',	1044,	NULL,	'',	NULL,	'J',	803,	'1034',	'0303',	'MODUL',	'',	'2014-08-22 18:01:51',	0,	'',	'',	13,	''),
('Blutdruck',	1054,	NULL,	'',	NULL,	'J',	973,	'1034',	'0303',	'MODUL',	'',	'2014-08-22 18:02:53',	0,	'',	'',	13,	''),
('Umfragen',	1064,	NULL,	'',	NULL,	'J',	1073,	'1034',	'0303',	'MODUL',	'',	'2014-08-22 18:04:17',	0,	'',	'',	13,	''),
('Tabletten',	1074,	NULL,	'',	NULL,	'J',	1153,	'1034',	'0303',	'MODUL',	'',	'2014-08-22 20:44:58',	0,	'',	'',	13,	''),
('Bildverz',	1084,	NULL,	'',	NULL,	'J',	1233,	'1034',	'0303',	'MODUL',	'',	'2014-08-22 20:57:12',	0,	'',	'',	13,	''),
('Vorrat',	1094,	NULL,	'00005',	NULL,	'J',	123,	'1034',	'0303',	'MODUL',	'',	'2014-08-22 20:59:20',	0,	'',	'',	13,	''),
('Familie',	1095,	'',	'00003',	NULL,	'J',	0,	'0',	'0312',	'MODUL',	'',	'2014-11-03 06:31:39',	0,	'',	'',	0,	''),
('Rezepte',	1096,	'',	'',	NULL,	'J',	703,	'994',	'0312',	'MODUL',	'',	'2014-11-03 06:42:22',	0,	'',	'',	0,	''),
('Docman',	1097,	'',	'00004',	NULL,	'J',	0,	'0',	'0312',	'MODUL',	'',	'2014-11-03 06:44:23',	0,	'',	'',	0,	''),
('Briefverkehr',	1098,	'',	'',	NULL,	'J',	553,	'1097',	'0312',	'MODUL',	'',	'2014-11-03 06:45:33',	0,	'',	'',	0,	''),
('Test',	1099,	'app/index.php?r=site/index',	'',	NULL,	'N',	0,	'0',	'0312',	'WEBLINK',	'',	'2014-11-03 17:19:44',	0,	'',	'',	0,	''),
('Importtyp',	1100,	'',	'',	NULL,	'J',	1043,	'213',	'0312',	'MODUL',	'',	'2014-11-05 17:36:02',	0,	'',	'',	0,	''),
('Jahr',	1101,	'',	'',	NULL,	'J',	1023,	'1044',	'0312',	'MODUL',	'',	'2014-11-14 17:21:02',	0,	'',	'',	0,	''),
('Geraet',	1102,	'',	'',	NULL,	'J',	1033,	'1044',	'0312',	'MODUL',	'',	'2014-11-14 17:24:15',	0,	'',	'',	0,	''),
('Zimmer',	1103,	'',	'',	NULL,	'J',	563,	'1094',	'0312',	'MODUL',	'',	'2014-11-19 17:38:29',	0,	'',	'',	0,	''),
('Moebel',	1104,	'',	'',	NULL,	'J',	573,	'1094',	'0312',	'MODUL',	'',	'2014-11-19 17:47:37',	0,	'',	'',	0,	''),
('Faecher',	1105,	'',	'',	NULL,	'J',	583,	'1094',	'0312',	'MODUL',	'',	'2014-11-20 06:14:27',	0,	'',	'',	0,	''),
('Status',	1106,	'',	'',	NULL,	'J',	273,	'1094',	'0312',	'MODUL',	'',	'2014-11-20 06:46:16',	0,	'',	'',	0,	''),
('Statusgrp',	1107,	'',	'',	NULL,	'J',	664,	'1106',	'0312',	'MODUL',	'',	'2014-11-20 06:47:38',	0,	'',	'',	0,	''),
('Statuszuord',	1108,	'',	'',	NULL,	'J',	1323,	'1106',	'0312',	'MODUL',	'',	'2014-11-20 06:49:09',	0,	'',	'',	0,	''),
('Bilder',	1109,	'',	'',	NULL,	'J',	503,	'1094',	'0312',	'MODUL',	'',	'2014-11-20 16:55:47',	0,	'',	'',	0,	''),
('Fahrtenbuch',	1110,	'',	'',	NULL,	'J',	283,	'1034',	'0312',	'MODUL',	'',	'2014-11-21 07:00:22',	0,	'',	'',	0,	''),
('RechDatum',	1111,	'',	'',	NULL,	'J',	593,	'1110',	'0312',	'MODUL',	'',	'2014-11-21 17:05:47',	0,	'',	'',	0,	''),
('sqlite',	1112,	'',	'',	NULL,	'J',	1346,	'1110',	'0312',	'MODUL',	'',	'2014-11-21 17:35:53',	0,	'',	'',	0,	''),
('mynetmon',	1113,	'',	'',	NULL,	'J',	1347,	'483',	'0312',	'MODUL',	'',	'2014-12-31 15:57:01',	0,	'',	'',	0,	''),
('Inhabergruppe',	1115,	'',	'',	NULL,	'J',	1133,	'443',	'0312',	'MODUL',	'',	'2015-01-05 21:14:49',	0,	'',	'',	0,	''),
('Inhaberzuordnung',	1116,	'',	'',	NULL,	'J',	1143,	'443',	'0312',	'MODUL',	'',	'2015-01-05 21:17:54',	0,	'',	'',	0,	''),
('Konten&uumlbersicht',	1117,	'',	'',	NULL,	'J',	893,	'213',	'0312',	'MODUL',	'',	'2015-01-05 21:38:48',	0,	'',	'',	0,	''),
('Versionen',	1118,	'',	'',	NULL,	'J',	863,	'193',	'0312',	'MODUL',	'',	'2015-01-06 06:09:05',	0,	'',	'',	0,	''),
('Benutzer',	1119,	'',	'',	NULL,	'J',	323,	'1004',	'0312',	'MODUL',	'',	'2015-02-02 06:03:43',	0,	'',	'',	0,	''),
('Adressstatus',	1444,	'',	'',	'',	'J',	1353,	'263',	'0312',	'MODUL',	'',	'2015-03-17 16:54:43',	0,	'',	'',	0,	''),
('Statusgruppe',	1445,	'',	'',	'',	'J',	963,	'1444',	'0312',	'MODUL',	'',	'2015-03-17 17:01:04',	0,	'',	'',	0,	''),
('Statuszuord',	1446,	'',	'',	'',	'J',	1323,	'1444',	'0312',	'MODUL',	'',	'2015-03-17 17:02:15',	0,	'',	'',	0,	''),
('Statusgruppe',	1447,	'',	'',	NULL,	'J',	963,	'283',	'0312',	'MODUL',	'',	'2015-04-20 05:21:08',	0,	'',	'',	0,	''),
('Statuszuord',	1448,	'',	'',	NULL,	'J',	1323,	'283',	'0312',	'MODUL',	'',	'2015-04-20 05:22:18',	0,	'',	'',	0,	''),
('Verbrauch',	1449,	'',	'',	NULL,	'J',	1354,	'1034',	'0315',	'MODUL',	'',	'2015-04-22 05:13:29',	0,	'',	'',	0,	''),
('Zeitpunkt',	1452,	'',	'',	NULL,	'J',	983,	'1054',	'0315',	'MODUL',	'',	'2015-04-30 15:22:31',	0,	'',	'',	0,	''),
('Reports',	1451,	'',	'',	NULL,	'J',	1356,	'213',	'0315',	'MODUL',	'',	'2015-04-23 16:07:02',	0,	'',	'',	0,	''),
('Oberkategorie',	1453,	'',	'',	NULL,	'J',	1357,	'1094',	'0315',	'MODUL',	'',	'2015-05-04 05:49:30',	0,	'',	'',	0,	''),
('Grundeinheit',	1454,	'',	'',	NULL,	'J',	713,	'1094',	'0315',	'MODUL',	'',	'2015-05-04 05:51:45',	0,	'',	'',	0,	''),
('Mengeneinheit',	1455,	'',	'',	NULL,	'J',	723,	'1094',	'0315',	'MODUL',	'',	'2015-05-04 05:53:25',	0,	'',	'',	0,	''),
('Kosten',	1456,	'',	'',	NULL,	'J',	1293,	'213',	'0315',	'MODUL',	'',	'2015-05-08 16:04:08',	0,	'',	'',	0,	''),
('Dauerauftragtyp',	1457,	'',	'',	NULL,	'J',	1313,	'1456',	'0315',	'MODUL',	'',	'2015-05-08 16:11:13',	0,	'',	'',	0,	''),
('Termingruppen',	1458,	'',	'',	NULL,	'J',	1263,	'973',	'0315',	'MODUL',	'',	'2015-05-11 17:10:57',	0,	'',	'',	0,	''),
('Teminserie',	1459,	'',	'',	NULL,	'J',	1283,	'973',	'0315',	'MODUL',	'',	'2015-05-11 17:14:53',	0,	'',	'',	0,	''),
('Kalender',	1460,	'classes/calendar.php',	'',	NULL,	'J',	0,	'973',	'0315',	'WEBLINK',	'',	'2015-05-11 17:18:38',	0,	'',	'',	0,	''),
('Aufgabenliste',	1461,	'',	'',	NULL,	'J',	1358,	'754',	'0315',	'MODUL',	'',	'2015-05-11 19:24:05',	0,	'',	'',	0,	''),
('Etagen',	1462,	'',	'',	NULL,	'J',	1123,	'1094',	'0312',	'MODUL',	'',	'2015-06-27 19:14:32',	0,	'',	'',	0,	''),
('Hilfe',	1463,	'',	'',	NULL,	'J',	1359,	'1521',	'0312',	'MODUL',	'',	'2015-07-01 15:59:41',	0,	'',	'',	0,	''),
('HÃ¤ufigkeit',	1464,	'',	'',	NULL,	'J',	1360,	'1461',	'0312',	'MODUL',	'',	'2015-08-09 12:02:13',	0,	'',	'',	0,	''),
('Treegrid',	1465,	'',	'',	NULL,	'J',	753,	'1097',	'0312',	'MODUL',	'',	'2015-08-18 15:59:23',	0,	'',	'',	0,	''),
('Make Sql-Struc',	1466,	'classes/mksqlstruc.php',	'',	NULL,	'J',	0,	'483',	'0312',	'WEBLINK',	'',	'2015-08-21 05:13:51',	0,	'',	'',	0,	''),
('Tools',	1467,	'sites/html/tools.php?idwert=1467',	'00099',	NULL,	'J',	0,	'0',	'0312',	'WEBLINK',	'',	'2015-09-15 05:32:01',	0,	'',	'',	0,	''),
('Joorgsqlite',	1468,	'http://localhost/android/own/joorgsqlite/index.php',	'',	NULL,	'J',	0,	'1467',	'0312',	'WEBLINK',	'',	'2015-09-15 05:36:24',	0,	'',	'_blank',	0,	''),
('Benutzer',	1469,	'',	'',	NULL,	'J',	323,	'984',	'0312',	'MODUL',	'',	'2015-09-19 11:19:46',	0,	'',	'',	0,	''),
('Rechnungen',	1470,	'',	'',	NULL,	'J',	883,	'1110',	'0312',	'MODUL',	'',	'2015-10-02 16:15:24',	0,	'',	'',	0,	''),
('Rechnungen',	1471,	'',	'',	NULL,	'J',	883,	'1097',	'0312',	'MODUL',	'',	'2015-10-02 16:20:32',	0,	'',	'',	0,	''),
('Computer',	1481,	'',	'',	NULL,	'J',	1361,	'193',	'0312',	'MODUL',	'',	'2015-12-31 13:43:46',	0,	'',	'',	0,	''),
('Tables',	1491,	'',	'',	NULL,	'J',	1303,	'193',	'0312',	'MODUL',	'',	'2015-12-31 14:17:58',	0,	'',	'',	0,	''),
('Filly',	1501,	'',	'',	NULL,	'J',	1371,	'1511',	'0312',	'MODUL',	'',	'2016-01-06 17:03:10',	0,	'',	'',	0,	''),
('Fillys',	1511,	'',	'',	NULL,	'J',	1381,	'1034',	'0312',	'MODUL',	'',	'2016-01-07 07:02:58',	0,	'',	'',	0,	''),
('Hilfe',	1521,	'',	'',	NULL,	'J',	1391,	'193',	'0312',	'MODUL',	'',	'2016-01-07 17:05:59',	0,	'',	'',	0,	''),
('Hilfeindex',	1531,	'',	'',	NULL,	'J',	1401,	'1521',	'0312',	'MODUL',	'',	'2016-01-07 17:09:27',	0,	'',	'',	0,	''),
('Fillyart',	1541,	'',	'',	NULL,	'J',	1411,	'1511',	'0312',	'MODUL',	'',	'2016-01-11 07:04:08',	0,	'',	'',	0,	''),
('Bilder',	1551,	'',	'',	NULL,	'J',	503,	'1511',	'0312',	'MODUL',	'',	'2016-01-11 07:23:59',	0,	'',	'',	0,	''),
('Bildart',	1561,	'',	'',	NULL,	'J',	1421,	'1094',	'0312',	'MODUL',	'',	'2016-01-11 07:33:15',	0,	'',	'',	0,	''),
('FengOffice',	1571,	'http://localhost/app/fengoffice',	'',	NULL,	'J',	0,	'1097',	'0312',	'WEBLINK',	'',	'2016-01-12 16:50:59',	0,	'',	'_blank',	0,	'');

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
(533,	'GepÃƒÂ¤ckliste',	'classes/showtab.php?menu=tc_gepaeck',	'de',	'0303',	'0000-00-00 00:00:00',	'',	0),
(543,	'Gepaeckstueck',	'classes/showtab.php?menu=tc_gepaeckstueck',	'de',	'0303',	'0000-00-00 00:00:00',	'',	0),
(553,	'Briefverkehr',	'classes/showtab.php?menu=brfverkehr',	'de',	'0303',	'0000-00-00 00:00:00',	'',	0),
(563,	'Zimmer',	'classes/showtab.php?menu=rooms',	'de',	'0303',	'0000-00-00 00:00:00',	'',	0),
(573,	'MÃƒÂ¶bel',	'classes/showtab.php?menu=moebel',	'de',	'0303',	'0000-00-00 00:00:00',	'',	0),
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
(653,	'Kategorie (AufrÃƒÂ¤umen)',	'classes/showtab.php?menu=vo_category',	'de',	'0303',	'0000-00-00 00:00:00',	'',	0),
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
(893,	'KontenÃƒÂ¼bersicht',	'classes/overviewaccount.php',	'de',	'0308',	'2013-09-04 15:15:19',	'',	0),
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
(1033,	'GerÃƒÂ¤te',	'classes/showtab.php?menu=geraet',	'de',	'0310',	'2013-12-01 14:44:10',	'',	0),
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
(1360,	'HÃ¤ufigkeit',	'classes/showtab.php?menu=haeufigkeit',	'de',	'0312',	'2015-08-09 12:02:50',	'',	0),
(1361,	'Computer',	'classes/showtab.php?menu=computer',	'de',	'0312',	'2015-12-31 13:42:52',	'',	0),
(1371,	'Filly',	'classes/showtab.php?menu=filly',	'de',	'0312',	'2016-01-06 17:02:32',	'',	0),
(1381,	'FillySubmenu',	'	classes/submenushow.php?menu=fillys',	'de',	'0312',	'2016-01-07 07:02:27',	'',	0),
(1391,	'HilfeSubmenu',	'	classes/submenushow.php?menu=hilfe',	'de',	'0312',	'2016-01-07 17:05:06',	'',	0),
(1401,	'Hilfeindex',	'classes/showtab.php?menu=helpindex',	'de',	'0312',	'2016-01-07 17:08:55',	'',	0),
(1411,	'Fillyart',	'classes/showtab.php?menu=fillyart',	'de',	'0312',	'2016-01-11 07:03:18',	'',	0),
(1421,	'Bildart',	'classes/showtab.php?menu=bildart',	'de',	'0312',	'2016-01-11 07:32:10',	'',	0);

CREATE TABLE `tblmenu_projekt` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldbez` varchar(250) NOT NULL,
  `fldaktiv` varchar(1) NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `tblmenu_projekt` (`fldindex`, `fldbez`, `fldaktiv`) VALUES
(13,	'Joorgportal',	'J');

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

CREATE TABLE `tblnotiz` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `flddatum` datetime NOT NULL,
  `fldbez` varchar(500) COLLATE utf8_bin NOT NULL,
  `fldbemerk` varchar(500) COLLATE utf8_bin NOT NULL,
  `fldarchivdat` date NOT NULL,
  `fldstatus` varchar(20) COLLATE utf8_bin NOT NULL,
  `fldart` varchar(20) COLLATE utf8_bin NOT NULL,
  `fldbenutzer` varchar(20) COLLATE utf8_bin NOT NULL,
  `fldid_gruppe` bigint(20) NOT NULL,
  `fldlink` varchar(250) COLLATE utf8_bin NOT NULL,
  `fldTarget` varchar(20) COLLATE utf8_bin NOT NULL,
  `fldfilename` varchar(50) COLLATE utf8_bin NOT NULL,
  `fldid_status` bigint(20) NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

INSERT INTO `tblnotiz` (`fldindex`, `flddatum`, `fldbez`, `fldbemerk`, `fldarchivdat`, `fldstatus`, `fldart`, `fldbenutzer`, `fldid_gruppe`, `fldlink`, `fldTarget`, `fldfilename`, `fldid_status`) VALUES
(1,	'2011-09-23 07:55:00',	'Ich brauche Zeit fÃƒÂ¼r mich, die habe ich letzte Woche zu wenig bekommen. Dies steht auch in dem Buch. Ich kann bestimmte Sachen nur alleine machen, dass ist nichts gegen Dich, aber ich bin so.',	'',	'2011-09-27',	'',	'',	'',	0,	'',	'',	'',	0),
(3,	'2011-09-23 07:50:00',	'Da ich nicht so spontan bin, habe ich mir jetzt angewÃƒÂ¶hnt, alles was zum ZwiegesprÃƒÂ¤ch beitragen kann, aufzuschreiben.',	'',	'2011-09-27',	'',	'',	'',	0,	'',	'',	'',	0),
(4,	'2011-09-23 18:05:00',	'Heute wurde angekÃƒÂ¼ndigt, dass bei Mauser eine Mitarbeiterzufriedenheitsbefragung durchgefÃƒÂ¼hrt wird. Da ich mit vielen Dingen sehr unzufrieden bin, eine gute Gelegenheit dies mitzuteilen.',	'',	'2011-09-27',	'',	'',	'',	0,	'',	'',	'',	0),
(5,	'2011-09-26 22:11:00',	'Finanzberater-Ausdruck nicht ausdrucken, da ich mich jetzt als Versager fÃƒÂ¼hle',	'',	'2011-09-27',	'',	'',	'',	0,	'',	'',	'',	0),
(6,	'2011-09-26 22:13:00',	'Zahnschmerzen machen mir zu schaffen',	'',	'2011-09-27',	'',	'',	'',	0,	'',	'',	'',	0),
(7,	'2011-09-26 22:13:00',	'Geburtstagsparty war schÃƒÂ¶n. Aber nicht mein Fall.',	'',	'2011-09-27',	'',	'',	'',	0,	'',	'',	'',	0),
(8,	'2011-09-27 07:10:00',	'Finde es gut, dass wir in dem Buch lesen, schade dass wir es nicht schaffen, jeden Abend darin zu lesen. Ich finde es sehr hilfreich.',	'',	'2011-09-27',	'',	'',	'',	0,	'',	'',	'',	0),
(10,	'2011-09-28 08:27:00',	'Habe mich gefreut, dass du mir ÃƒÂ¼ber deinen Gewinn berichtet hast. (Geldregen)',	'',	'2011-10-04',	'',	'',	'',	0,	'',	'',	'',	0),
(11,	'2011-10-01 11:33:00',	'Ich bin glÃƒÂ¼cklich, dass Du Ruth das Geld zurÃƒÂ¼ckzahlen willst. Mir war das auch wichtig und wuÃƒÅ¸te nicht wie es Dir sagen sollte. Deshalb bin ich froh, dass Du es mir selbst gesagt hast.',	'',	'2011-10-04',	'',	'',	'',	0,	'',	'',	'',	0),
(12,	'2011-10-06 08:27:00',	'Ein GesprÃƒÂ¤chsabend ÃƒÂ¼ber WÃƒÂ¤sche waschen wÃƒÂ¼rde ich mir wÃƒÂ¼nschen. Jeder erklÃƒÂ¤rt seinen Vorgehensweise. Stichwort: Hose nicht gefunden.',	'',	'2011-10-11',	'',	'',	'',	0,	'',	'',	'',	0),
(13,	'2011-10-08 12:01:00',	'Habe mich ÃƒÂ¼ber das Giraffenposter geÃƒÂ¤rgert. Und bin froh, dass ich meinen Frust erst mal fÃƒÂ¼r mich behalten habe.',	'',	'2011-10-11',	'',	'',	'',	0,	'',	'',	'',	0),
(14,	'2011-10-08 13:10:00',	'Ich bin sehr verÃƒÂ¤rgert, dass du meiner mehrfachen Bitte nicht nachkommst und meinen Schreibtisch NICHT als ablageplatz nutz. Wie soll ich ordnung schaffen, wenn es immer wieder zu nichte gemacht wird',	'',	'2011-10-11',	'',	'',	'',	0,	'',	'',	'',	0),
(15,	'2011-10-10 07:09:00',	'Das Wochendenende war nicht so schÃƒÂ¶n. Ich habe mir geÃƒÂ¤rgert, dass die Meinung deiner Mutter wichtiger ist als meine.',	'',	'2011-10-11',	'',	'',	'',	0,	'',	'',	'',	0),
(16,	'2011-10-06 07:12:00',	'Ich finde es gut, dass wir uns schnell versÃƒÂ¶hnen kÃƒÂ¶nnen.',	'',	'2011-10-11',	'',	'',	'',	0,	'',	'',	'',	0),
(17,	'2011-10-14 07:58:00',	'Bin frustriert ÃƒÂ¼ber das letzte ZweigesprÃƒÂ¤ch, es war unfair, weil Christiane sich nicht an die Regeln gehalten hat und es einfach ausdehnen wollte!',	'',	'2011-10-19',	'',	'',	'',	0,	'',	'',	'',	0),
(18,	'2011-10-14 07:10:00',	'ich habe mich sehr gefreut dass Chris mich gefragt hat, wie ich mir das WE wÃƒÂ¼nsche. Das hat mir ein gutes GefÃƒÂ¼hl gegeben.',	'',	'2011-10-19',	'',	'',	'',	0,	'',	'',	'',	0),
(19,	'2011-10-16 07:11:00',	'Ich fand es sehr schade dass ich sonntagabend nichts mehr gemacht habe, aber ich war sehr mÃƒÂ¼de. Trotzdem habe ich mich gefreut das Chris dran gedacht hat und selbst schon was fÃƒÂ¼r sich machen wollte ',	'',	'2011-10-19',	'',	'',	'',	0,	'',	'',	'',	0),
(20,	'2011-10-17 07:12:00',	'Ich fand es sehr stressig dass wir am Montag verschlafen haben, zumal ich noch die Abrechnung laufen hatte die ich montag morgen noch schnell fertig machen wollte, bevor die Kollegen kommen.',	'',	'2011-10-19',	'',	'',	'',	0,	'',	'',	'',	0),
(21,	'2011-10-17 18:17:00',	'Mauser Mitarbeiterzufriedenheitsabfrage wurde durchgefÃƒÂ¼hrt, war aber sehr unbefriedigend. Man konnte nur multiple-choice antworten geben, zufrieden nicht zufrieden, nur am schluss konnte man noch kur',	'',	'2011-10-19',	'',	'',	'',	0,	'',	'',	'',	0),
(22,	'2011-10-18 07:00:00',	'Mich stÃƒÂ¶rt, dass wir keinen orgatermin haben. Darum habe ich mir ÃƒÂ¼berlegt dies am Samstag nach dem FrÃƒÂ¼hstÃƒÂ¼ck zusammmen mit der Einkaufsliste zu machen. Frieda soll auch dabei sein.',	'',	'2011-10-19',	'',	'',	'',	0,	'',	'',	'',	0),
(23,	'2011-10-20 08:18:00',	'ich wÃƒÂ¼rde gerne unseren Urlaub noch dieses Jahr festmachen. Vor Weihnachten. Evtl. sogar im Mai.',	'',	'2011-10-25',	'',	'',	'',	0,	'',	'',	'',	0),
(24,	'2011-10-25 18:09:00',	'ich fand es gut das Du nochmal mit deiner Mutter ÃƒÂ¼ber das Problem von Ostern gesprochen hast. Mich hatte es etwas gestÃƒÂ¶rt, dass ich nicht wusste wo ich dran war',	'',	'2011-10-25',	'',	'',	'',	0,	'',	'',	'',	0),
(25,	'2011-10-25 18:11:00',	'Lerche und Nachteule. Was machen wir da? Wie gehts mir?',	'',	'2011-10-25',	'',	'',	'',	0,	'',	'',	'',	0),
(26,	'2011-10-27 18:05:00',	'absprachen, wie tisch abrÃƒÂ¤umen, ohne vorwurfsvollen ton. dafÃƒÂ¼r rÃƒÂ¤umst du aber den tisch ab...',	'',	'2011-11-01',	'',	'',	'',	0,	'',	'',	'',	0),
(27,	'2011-10-28 13:19:00',	'das drÃƒÂ¤ngeln wann wir die Einkaufsliste machen, fand ich als sehr anstrengen. Dinge immer dann tun zu mÃƒÂ¼ssen, wann Du es mÃƒÂ¶chtes, finde ich sehr anstrengen, statt auf meine BedÃƒÂ¼rfnisse zu achten. ',	'',	'2011-11-01',	'',	'',	'',	0,	'',	'',	'',	0),
(28,	'2011-10-28 23:31:00',	'ich war froh das wir das streiten am freitag noch schlichten konnten nur wenn so einem doofen babyfon.\r\nthema lerche u. nachteule',	'',	'2011-11-01',	'',	'',	'',	0,	'',	'',	'',	0),
(29,	'2011-11-03 08:42:00',	'ich habe mich ÃƒÂ¼ber die ordentliche Voratskammer gefreut.',	'',	'2011-11-25',	'',	'',	'',	0,	'',	'',	'',	0),
(30,	'2011-11-25 07:14:00',	'ich find es nicht schÃƒÂ¶n, wenn wir Briefe und Papiere in der KÃƒÂ¼che habe, dann kÃƒÂ¶nnen daran fettflecken kommen. ich suche nach einer besseren lÃƒÂ¶sung',	'',	'2011-12-21',	'',	'',	'',	0,	'',	'',	'',	0),
(31,	'2011-11-26 20:04:00',	'das du dich in meine erziehung einmischt finde ich ganz schlecht. das hat mich sehr geÃƒÂ¤rgert. das schadet uns allen. ich finde, es muss mÃƒÂ¶glich sein, dass ich mit Frieda etwas mache ohne dass sie uns ausspielen kann.',	'',	'2011-12-21',	'',	'',	'',	0,	'',	'',	'',	0),
(32,	'2011-11-28 18:29:00',	'am meisten hat mich geÃƒÂ¤rgert das du mir deine meinung aufzwingen wolltest. Frieda muss kaffee trinken damit sie wach wird. keine andere meinung ist zulÃƒÂ¤ssig!',	'',	'2011-12-21',	'',	'',	'',	0,	'',	'',	'',	0),
(33,	'2011-12-01 18:26:00',	'warum belÃƒÂ¼gt mich Christiane. Sie hat nachweislich Televoting gemacht und das hat uns fast 200 Euro gekostet!',	'',	'2011-12-21',	'',	'',	'',	0,	'',	'',	'',	0),
(34,	'2012-03-01 07:58:00',	'Fruchtfliegen haben mich gestÃƒÂ¶rt und das ich das gefÃƒÂ¼hl hatte du unternimmst nichts dagegen.\r\nBiomÃƒÂ¼ll wird weiter in der SpÃƒÂ¼le stundenlang liegen gelassen.',	'',	'2012-04-17',	'negativ',	'',	'',	0,	'',	'',	'',	0),
(35,	'2012-03-01 07:59:00',	'Das Pflaster im Bad wird nicht an der gleiche Stelle zurÃƒÂ¼ckgestellt, so dass ich erst suchen muss und aus verzweiflung kinderpflaster nehme.',	'',	'2012-04-17',	'',	'',	'',	0,	'',	'',	'',	0),
(36,	'2012-03-01 08:00:00',	'Obwohl ich dich gebeten habe mir die Telekom-Rechnung zu geben, muss ich erst lange danach suchen und sie ist schon lÃƒÂ¤ngst ÃƒÂ¼berfÃƒÂ¤llig und kosten uns hohe MahngebÃƒÂ¼hren.',	'',	'2012-04-17',	'',	'',	'',	0,	'',	'',	'',	0),
(37,	'2012-03-01 08:01:00',	'Das Kabel vom Kassettenrekorder wird nicht ordentlich auf den Boden gelegt, so dass ich nicht mehr vernÃƒÂ¼nftig ins Kinderzimmer komme.',	'',	'2012-04-17',	'',	'',	'',	0,	'',	'',	'',	0),
(38,	'2012-03-01 08:02:00',	'ich werde mit den Worten begrÃƒÂ¼ÃƒÅ¸t \"Frieda, aber jetzt nicht wach werden\". oh Schreck, der Papa ist da. Das hat mich sehr wÃƒÂ¼tend gemacht.',	'',	'2012-04-17',	'',	'',	'',	0,	'',	'',	'',	0),
(39,	'2012-03-01 07:58:00',	'Du rÃƒÂ¤umst regelmÃƒÂ¤ssig die SpÃƒÂ¼lmaschine ein u. aus.',	'',	'2012-04-17',	'positiv',	'',	'',	0,	'',	'',	'',	0),
(40,	'2012-03-01 07:59:00',	'Du wÃƒÂ¤scht und bÃƒÂ¼gelst fleissig meine WÃƒÂ¤sche',	'',	'2012-04-17',	'positiv',	'',	'',	0,	'',	'',	'',	0),
(333,	'2013-08-30 00:00:00',	'Wahlomat',	'',	'0000-00-00',	'',	'',	'',	143,	'http://www.wahl-o-mat.de/bundestagswahl2013/main_app.php',	'_blank',	'',	0),
(343,	'2013-08-30 00:00:00',	'Abgeordnetencheck',	'',	'0000-00-00',	'',	'',	'',	143,	'http://kandidatencheck.abgeordnetenwatch.de/',	'_blank',	'',	0),
(344,	'2014-01-02 00:00:00',	'Schriften der Welt',	'',	'0000-00-00',	'',	'',	'',	144,	'http://de.wikipedia.org/wiki/Datei:WritingSystemsOfTheWorld-de.png',	'_blank',	'',	0),
(354,	'2014-04-29 00:00:00',	'Planung Geburtagsfeier',	'',	'0000-00-00',	'',	'',	'',	154,	'http://192.168.0.104/daten/doc/Geburtstagsfeierplanung.html',	'',	'',	0),
(355,	'2015-08-20 00:00:00',	'x2go server',	'',	'0000-00-00',	'',	'',	'',	156,	'http://ubuntuhandbook.org/index.php/2015/01/remotely-access-graphical-desktop-of-ubuntu-14-04-server/',	'_blank',	'',	0),
(356,	'2015-08-20 00:00:00',	'Joomla Sprache installieren',	'',	'0000-00-00',	'',	'',	'',	157,	'http://go-lux.de/go-lux-stellt-sich-vor/webtec/41-joomla-3x-mehrsprachig',	'_blank',	'',	0),
(357,	'2015-08-26 00:00:00',	'Joomla Sprache installiert',	'',	'0000-00-00',	'',	'',	'',	158,	'',	'',	'',	0),
(358,	'2015-10-09 00:00:00',	'Aufgabenliste verteilen',	'Aufgabenplan nochmal abstimmen',	'0000-00-00',	'',	'',	'',	159,	'',	'',	'',	3),
(359,	'2015-10-09 00:00:00',	'UrlaubsaktivitÃ¤ten planen',	'',	'0000-00-00',	'',	'',	'',	159,	'',	'',	'',	24),
(360,	'2015-10-09 00:00:00',	'Eheseminar klÃ¤ren',	'',	'0000-00-00',	'',	'',	'',	159,	'',	'',	'',	2),
(361,	'2015-10-09 00:00:00',	'Mein Sparbuch als vermisst erklÃ¤ren',	'',	'0000-00-00',	'',	'',	'',	159,	'',	'',	'',	4),
(362,	'2015-10-19 00:00:00',	'UnterstÃ¼tzung fÃ¼r Joorgportal',	'Ich bitte um mehr UnterstÃ¼tzung beim Joorgportal. Was ist gut, was kann verbessert werden.',	'0000-00-00',	'',	'',	'',	159,	'',	'',	'',	3),
(363,	'2015-10-31 00:00:00',	'Nach Kamen fahren',	'',	'0000-00-00',	'',	'',	'',	159,	'',	'',	'',	2),
(364,	'2015-10-31 00:00:00',	'joorgportal am raspberry pi zeigen (geschenke eintragen zeigen / Wunschliste)',	'',	'0000-00-00',	'',	'',	'',	159,	'',	'',	'',	2),
(365,	'2015-10-31 00:00:00',	'adventskalender basteln',	'',	'0000-00-00',	'',	'',	'',	159,	'',	'',	'',	2),
(366,	'2015-10-31 00:00:00',	'ordnung wie kÃ¶nnen wir das gemeinsam hinkriegen',	'',	'0000-00-00',	'',	'',	'',	159,	'',	'',	'',	2),
(367,	'2015-10-31 00:00:00',	'dienstplan christiane im kalender',	'',	'0000-00-00',	'',	'',	'',	159,	'',	'',	'',	2);

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

INSERT INTO `tblorte` (`fldIndex`, `fldKurz`, `fldBez`, `fldo01typ`, `fldo01pos`, `fldo01parent`, `fldzimmer`, `fldetage`, `fldsort`, `fldmoebel`, `fldstatus`, `fldproz`, `fldind_zimmer`, `fldind_moebel`, `fldbildid`, `fldnummer`, `fldmaxanz`, `fldid_etagen`, `fldid_benutzer`, `fldprior`, `fldid_status`, `fldbemerk`) VALUES
(73,	'',	'Garage',	'ZIMMER',	0,	0,	'Garage',	'0.EG',	'002',	'',	'',	0,	0,	0,	0,	'R01',	0,	13,	1,	4,	2,	''),
(46,	'',	'Weinkeller',	'ZIMMER',	0,	0,	'Vorratskammer',	'1.UG',	'101',	'',	'',	0,	0,	0,	0,	'R02',	2,	3,	2,	0,	2,	''),
(48,	'',	'Tresorkeller',	'ZIMMER',	0,	0,	'Vorratskammer',	'1.UG',	'103',	'',	'',	0,	0,	0,	0,	'R04',	0,	3,	1,	3,	2,	''),
(49,	'',	'Stromkeller',	'ZIMMER',	0,	0,	'Vorratskammer',	'1.UG',	'104',	'',	'',	0,	0,	0,	0,	'R05',	0,	3,	1,	3,	2,	''),
(23,	'',	'Vorkeller',	'ZIMMER',	0,	0,	'Vorkeller',	'0.EG',	'202',	'',	'',	0,	0,	0,	0,	'R07',	0,	13,	1,	4,	2,	''),
(31,	'',	'Arbeitszimmer',	'ZIMMER',	0,	0,	'Vorratskammer',	'1.ZG',	'301',	'',	'',	0,	0,	0,	0,	'R08',	11,	23,	1,	5,	2,	''),
(12,	'',	'Vorratskammer',	'ZIMMER',	0,	0,	'Vorratskammer',	'1.ZG',	'302',	'',	'',	0,	0,	0,	0,	'R09',	0,	23,	1,	4,	7,	''),
(50,	'',	'Wohnflur',	'ZIMMER',	0,	0,	'Vorratskammer',	'1.OG',	'401',	'',	'',	0,	0,	0,	0,	'R10',	2,	23,	1,	2,	7,	'Verant. Christiane'),
(19,	'',	'KÃ¼che',	'ZIMMER',	0,	0,	'Vorratskammer',	'1.OG',	'403',	'',	'',	0,	0,	0,	0,	'R12',	0,	23,	2,	1,	7,	'Verant. Christiane'),
(52,	'',	'Esszimmer',	'ZIMMER',	0,	0,	'Vorratskammer',	'1.OG',	'404',	'',	'',	0,	0,	0,	0,	'R13',	6,	23,	1,	0,	2,	'Verant. Christiane'),
(39,	'',	'Abstellkammer',	'ZIMMER',	0,	0,	'Vorratskammer',	'2.ZG',	'502',	'',	'',	0,	0,	0,	0,	'R16',	0,	33,	1,	4,	2,	''),
(83,	'',	'Oberer Flur',	'ZIMMER',	0,	0,	'Oberer Flur',	'2.OG',	'604',	'',	'',	0,	0,	0,	0,	'R20',	0,	33,	1,	4,	2,	''),
(63,	'',	'Dachboden',	'ZIMMER',	0,	0,	'Dachboden',	'3.DG',	'701',	'',	'',	0,	0,	0,	0,	'R21',	1,	43,	2,	0,	2,	''),
(47,	'',	'Waschkeller',	'ZIMMER',	0,	0,	'Vorratskammer',	'1.UG',	'102',	'',	'',	0,	0,	0,	0,	'R03',	0,	3,	2,	0,	2,	''),
(41,	'',	'Hausflur',	'ZIMMER',	0,	0,	'Hausflur',	'0.EG',	'201',	'',	'',	0,	0,	0,	0,	'R06',	0,	13,	2,	0,	2,	''),
(51,	'',	'Badezimmer unten',	'ZIMMER',	0,	0,	'Vorratskammer',	'1.OG',	'402',	'',	'',	0,	0,	0,	0,	'R11',	0,	23,	2,	0,	0,	''),
(53,	'',	'Wohnzimmer',	'ZIMMER',	0,	0,	'Vorratskammer',	'1.OG',	'405',	'',	'',	0,	0,	0,	0,	'R14',	0,	23,	2,	2,	2,	''),
(54,	'',	'Terasse',	'ZIMMER',	0,	0,	'Vorratskammer',	'2.ZG',	'501',	'',	'',	0,	0,	0,	0,	'R15',	0,	33,	2,	0,	0,	''),
(55,	'',	'Badezimmer oben',	'ZIMMER',	0,	0,	'Vorratskammer',	'2.OG',	'601',	'',	'',	0,	0,	0,	0,	'R17',	0,	33,	2,	0,	0,	''),
(56,	'',	'Schlafzimmer',	'ZIMMER',	0,	0,	'Vorratskammer',	'2.OG',	'602',	'',	'',	0,	0,	0,	0,	'R18',	0,	33,	2,	5,	7,	''),
(21,	'',	'Kinderzimmer',	'ZIMMER',	0,	0,	'Vorratskammer',	'2.OG',	'603',	'',	'',	0,	0,	0,	0,	'R19',	0,	33,	3,	0,	0,	''),
(36,	'',	'Schreibtisch',	'MOEBEL',	0,	0,	'Arbeitszimmer',	'',	'',	'',	'',	0,	31,	0,	0,	'S09',	0,	0,	0,	0,	0,	''),
(713,	'',	'Wandregal',	'MOEBEL',	0,	0,	'',	'',	'',	'',	'',	0,	31,	0,	0,	'S10',	0,	0,	0,	0,	0,	''),
(723,	'',	'Decke',	'MOEBEL',	0,	0,	'',	'',	'',	'',	'',	0,	31,	0,	0,	'S11',	0,	0,	0,	0,	0,	''),
(233,	'',	'Decke',	'MOEBEL',	0,	0,	'Arbeitszimmer',	'',	'',	'',	'',	0,	51,	0,	0,	'S01',	0,	0,	0,	0,	0,	''),
(243,	'',	'Computertisch',	'MOEBEL',	0,	0,	'Arbeitszimmer',	'',	'',	'',	'',	0,	31,	0,	0,	'S12',	0,	0,	0,	0,	0,	''),
(253,	'',	'Arbeitsplatte',	'MOEBEL',	0,	0,	'Arbeitszimmer',	'',	'',	'',	'',	0,	31,	0,	0,	'S13',	0,	0,	0,	0,	0,	''),
(343,	'',	'Kommode links',	'MOEBEL',	0,	0,	'Wohnzimmer',	'',	'',	'',	'',	0,	53,	0,	0,	'',	0,	0,	0,	0,	0,	''),
(353,	'',	'Kommode rechts',	'MOEBEL',	0,	0,	'Wohnzimmer',	'',	'',	'',	'',	0,	53,	0,	0,	'',	0,	0,	0,	0,	0,	''),
(363,	'',	'Decke',	'MOEBEL',	0,	0,	'Badezimmer unten',	'',	'',	'',	'',	0,	21,	0,	0,	'',	0,	0,	0,	0,	0,	''),
(383,	'',	'Spiegelschrank',	'MOEBEL',	0,	0,	'Badezimmer unten',	'',	'',	'',	'',	0,	51,	0,	0,	'S02',	0,	0,	0,	0,	0,	''),
(443,	'',	'Wickeltisch',	'MOEBEL',	0,	0,	'Kinderzimmer',	'',	'',	'',	'',	0,	21,	0,	0,	'',	0,	0,	0,	0,	0,	''),
(513,	'',	'Regalschrank',	'MOEBEL',	0,	0,	'',	'',	'',	'',	'',	0,	41,	0,	0,	'',	0,	0,	0,	0,	0,	''),
(523,	'',	'Schuhschrank',	'MOEBEL',	0,	0,	'',	'',	'',	'',	'',	0,	41,	0,	0,	'',	0,	0,	0,	0,	0,	''),
(743,	'',	'Schuhregal',	'MOEBEL',	0,	0,	'',	'',	'',	'',	'',	0,	41,	0,	0,	'',	0,	0,	0,	0,	0,	''),
(753,	'',	'Boden',	'MOEBEL',	0,	0,	'',	'',	'',	'',	'',	0,	41,	0,	0,	'',	0,	0,	0,	0,	0,	''),
(763,	'',	'SchirmstÃƒÂ¤nder',	'MOEBEL',	0,	0,	'',	'',	'',	'',	'',	0,	41,	0,	0,	'',	0,	0,	0,	0,	0,	''),
(813,	'',	'schwarzes Regal',	'MOEBEL',	0,	0,	'',	'',	'',	'',	'',	0,	31,	0,	0,	'S08',	0,	0,	0,	0,	0,	''),
(1783,	'',	'DVD-Boxen',	'MOEBEL',	0,	0,	'',	'',	'',	'',	'',	0,	52,	0,	0,	'S07',	0,	0,	0,	0,	0,	''),
(1253,	'',	'Boden',	'MOEBEL',	0,	0,	'',	'',	'',	'',	'',	0,	46,	0,	0,	'S01',	0,	0,	0,	0,	0,	''),
(1153,	'',	'Boden',	'MOEBEL',	0,	0,	'',	'',	'',	'',	'',	0,	73,	0,	0,	'S01',	0,	0,	0,	0,	0,	''),
(44,	'',	'Boden (R08/S01)',	'MOEBEL',	0,	0,	'Arbeitszimmer',	'',	'',	'',	'',	0,	31,	0,	0,	'S01',	0,	0,	0,	0,	0,	''),
(1043,	'',	'Boden (R12/S01)',	'MOEBEL',	0,	0,	'',	'',	'',	'',	'',	0,	19,	0,	0,	'S01',	0,	0,	0,	0,	0,	''),
(1103,	'',	'Boden (R09/S01)',	'MOEBEL',	0,	0,	'',	'',	'',	'',	'',	0,	12,	0,	0,	'S01',	0,	0,	0,	0,	0,	''),
(1263,	'',	'Boden',	'MOEBEL',	0,	0,	'',	'',	'',	'',	'',	0,	48,	0,	0,	'S01',	0,	0,	0,	0,	0,	''),
(1363,	'',	'Boden',	'MOEBEL',	0,	0,	'',	'',	'',	'',	'',	0,	49,	0,	0,	'S01',	0,	0,	0,	0,	0,	''),
(1403,	'',	'Boden',	'MOEBEL',	0,	0,	'',	'',	'',	'',	'',	0,	23,	0,	0,	'S01',	0,	0,	0,	0,	0,	''),
(1733,	'',	'Erker',	'MOEBEL',	0,	0,	'',	'',	'',	'',	'',	0,	52,	0,	0,	'S01',	0,	0,	0,	0,	0,	''),
(1813,	'',	'Wandregal',	'MOEBEL',	0,	0,	'',	'',	'',	'',	'',	0,	50,	0,	0,	'S01',	0,	0,	0,	0,	0,	''),
(93,	'',	'Wand',	'MOEBEL',	0,	0,	'Vorkeller',	'',	'',	'',	'',	0,	23,	0,	0,	'S02',	0,	0,	0,	0,	0,	''),
(263,	'',	'Einbauschrank (R12/S02)',	'MOEBEL',	0,	0,	'KÃƒÂ¼che',	'',	'',	'',	'',	0,	19,	0,	0,	'S02',	0,	0,	0,	0,	0,	''),
(293,	'',	'Regal01 (R08/S02)',	'MOEBEL',	0,	0,	'Vorkeller',	'',	'',	'',	'',	0,	31,	0,	0,	'S02',	0,	0,	0,	0,	0,	''),
(563,	'',	'Regal01',	'MOEBEL',	0,	0,	'',	'',	'',	'',	'',	0,	12,	0,	0,	'S02',	0,	0,	0,	0,	0,	''),
(1273,	'',	'Wandregal links',	'MOEBEL',	0,	0,	'',	'',	'',	'',	'',	0,	48,	0,	0,	'S02',	0,	0,	0,	0,	0,	''),
(1373,	'',	'Schacht',	'MOEBEL',	0,	0,	'',	'',	'',	'',	'',	0,	49,	0,	0,	'S02',	0,	0,	0,	0,	0,	''),
(1743,	'',	'Vitrine',	'MOEBEL',	0,	0,	'',	'',	'',	'',	'',	0,	52,	0,	0,	'S02',	0,	0,	0,	0,	0,	''),
(783,	'',	'Geschirrschrank',	'MOEBEL',	0,	0,	'',	'',	'',	'',	'',	0,	52,	0,	0,	'S03',	0,	0,	0,	0,	0,	''),
(553,	'',	'Regal001',	'MOEBEL',	0,	0,	'',	'',	'',	'',	'',	0,	23,	0,	0,	'S03',	0,	0,	0,	0,	0,	''),
(11,	'',	'KÃ¼hlschrank',	'MOEBEL',	0,	0,	'KÃƒÂ¼che',	'',	'001',	'',	'',	0,	19,	0,	0,	'S03',	0,	0,	0,	0,	0,	''),
(303,	'',	'Regal02 (R08/S03)',	'MOEBEL',	0,	0,	'Vorkeller',	'',	'',	'',	'',	0,	31,	0,	0,	'S03',	0,	0,	0,	0,	0,	''),
(1193,	'',	'Wandregal (R09/S03)',	'MOEBEL',	0,	0,	'',	'',	'',	'',	'',	0,	12,	0,	0,	'S03',	0,	0,	0,	0,	0,	''),
(1283,	'',	'KÃ¼hlschrank',	'MOEBEL',	0,	0,	'',	'',	'',	'',	'',	0,	48,	0,	0,	'S03',	0,	0,	0,	0,	0,	''),
(1293,	'',	'Regal 02',	'MOEBEL',	0,	0,	'',	'',	'',	'',	'',	0,	48,	0,	0,	'S03',	0,	0,	0,	0,	0,	''),
(1383,	'',	'Schrank',	'MOEBEL',	0,	0,	'',	'',	'',	'',	'',	0,	49,	0,	0,	'S03',	0,	0,	0,	0,	0,	''),
(573,	'',	'Regal002',	'MOEBEL',	0,	0,	'',	'',	'',	'',	'',	0,	23,	0,	0,	'S04',	0,	0,	0,	0,	0,	''),
(43,	'',	'Gefrierschrank',	'MOEBEL',	0,	0,	'KÃƒÂ¼che',	'',	'',	'',	'',	0,	19,	0,	0,	'S04',	0,	0,	0,	0,	0,	''),
(313,	'',	'Regal03 (R08/S04)',	'MOEBEL',	0,	0,	'Vorkeller',	'',	'',	'',	'',	0,	31,	0,	0,	'S04',	0,	0,	0,	0,	0,	''),
(1203,	'',	'Fensterbank (R09/S04)',	'MOEBEL',	0,	0,	'',	'',	'',	'',	'',	0,	12,	0,	0,	'S04',	0,	0,	0,	0,	0,	''),
(1303,	'',	'Regal 03',	'MOEBEL',	0,	0,	'',	'',	'',	'',	'',	0,	48,	0,	0,	'S04',	0,	0,	0,	0,	0,	''),
(1393,	'',	'Rollwagen',	'MOEBEL',	0,	0,	'',	'',	'',	'',	'',	0,	49,	0,	0,	'S04',	0,	0,	0,	0,	0,	''),
(1753,	'',	'Kommode',	'MOEBEL',	0,	0,	'',	'',	'',	'',	'',	0,	52,	0,	0,	'S04',	0,	0,	0,	0,	0,	''),
(583,	'',	'Regal003',	'MOEBEL',	0,	0,	'',	'',	'',	'',	'',	0,	23,	0,	0,	'S05',	0,	0,	0,	0,	0,	''),
(543,	'',	'Regal04 (R08/S05)',	'MOEBEL',	0,	0,	'',	'',	'',	'',	'',	0,	31,	0,	0,	'S05',	0,	0,	0,	0,	0,	''),
(1023,	'',	'Wand (R12/S05)',	'MOEBEL',	0,	0,	'',	'',	'',	'',	'',	0,	19,	0,	0,	'S05',	0,	0,	0,	0,	0,	''),
(1213,	'',	'Wand (R09/S05)',	'MOEBEL',	0,	0,	'',	'',	'',	'',	'',	0,	12,	0,	0,	'S05',	0,	0,	0,	0,	0,	''),
(1313,	'',	'Schacht',	'MOEBEL',	0,	0,	'',	'',	'',	'',	'',	0,	48,	0,	0,	'S05',	0,	0,	0,	0,	0,	''),
(1763,	'',	'DVD-Regal',	'MOEBEL',	0,	0,	'',	'',	'',	'',	'',	0,	52,	0,	0,	'S05',	0,	0,	0,	0,	0,	''),
(273,	'',	'KÃ¼chenschrank',	'MOEBEL',	0,	0,	'KÃƒÂ¼che',	'',	'',	'',	'',	0,	19,	0,	0,	'S06',	0,	0,	0,	0,	0,	''),
(1323,	'',	'Regal 04',	'MOEBEL',	0,	0,	'',	'',	'',	'',	'',	0,	48,	0,	0,	'S06',	0,	0,	0,	0,	0,	''),
(1773,	'',	'Regal',	'MOEBEL',	0,	0,	'',	'',	'',	'',	'',	0,	52,	0,	0,	'S06',	0,	0,	0,	0,	0,	''),
(1033,	'',	'Fensterbank (R12/S07)',	'MOEBEL',	0,	0,	'',	'',	'',	'',	'',	0,	19,	0,	0,	'S07',	0,	0,	0,	0,	0,	''),
(1013,	'',	'Wandregal (R12/S08)',	'MOEBEL',	0,	0,	'',	'',	'',	'',	'',	0,	19,	0,	0,	'S08',	0,	0,	0,	0,	0,	''),
(1793,	'',	'Beistelltisch',	'MOEBEL',	0,	0,	'',	'',	'',	'',	'',	0,	52,	0,	0,	'S08',	0,	0,	0,	0,	0,	''),
(1053,	'',	'Decke (R12/S09)',	'MOEBEL',	0,	0,	'',	'',	'',	'',	'',	0,	19,	0,	0,	'S09',	0,	0,	0,	0,	0,	''),
(1453,	'',	'Fach01',	'FACH',	0,	0,	'',	'',	'',	'',	'',	0,	19,	11,	0,	'F01',	0,	0,	0,	0,	0,	''),
(1463,	'',	'Fach02',	'FACH',	0,	0,	'',	'',	'',	'',	'',	0,	19,	11,	0,	'F02',	0,	0,	0,	0,	0,	''),
(1473,	'',	'Fach03',	'FACH',	0,	0,	'',	'',	'',	'',	'',	0,	19,	11,	0,	'F03',	0,	0,	0,	0,	0,	''),
(1483,	'',	'Fach04',	'FACH',	0,	0,	'',	'',	'',	'',	'',	0,	19,	11,	0,	'F04',	0,	0,	0,	0,	0,	''),
(1493,	'',	'Fach05',	'FACH',	0,	0,	'',	'',	'',	'',	'',	0,	19,	11,	0,	'F05',	0,	0,	0,	0,	0,	''),
(1503,	'',	'Fach06',	'FACH',	0,	0,	'',	'',	'',	'',	'',	0,	19,	11,	0,	'F06',	0,	0,	0,	0,	0,	''),
(1513,	'',	'Fach07',	'FACH',	0,	0,	'',	'',	'',	'',	'',	0,	19,	11,	0,	'F07',	0,	0,	0,	0,	0,	''),
(1533,	'',	'Fach01',	'FACH',	0,	0,	'',	'',	'',	'',	'',	100,	19,	43,	0,	'F01',	0,	0,	0,	0,	0,	''),
(1543,	'',	'Fach02',	'FACH',	0,	0,	'',	'',	'',	'',	'',	0,	19,	43,	0,	'F02',	0,	0,	0,	0,	0,	''),
(1553,	'',	'Fach03',	'FACH',	0,	0,	'',	'',	'',	'',	'',	0,	19,	43,	0,	'F03',	0,	0,	0,	0,	0,	''),
(1563,	'',	'Fach01',	'FACH',	0,	0,	'',	'',	'',	'',	'',	0,	19,	273,	0,	'F01',	0,	0,	0,	0,	0,	''),
(1573,	'',	'Fach02',	'FACH',	0,	0,	'',	'',	'',	'',	'',	0,	19,	273,	0,	'F02',	0,	0,	0,	0,	0,	''),
(1583,	'',	'Fach03',	'FACH',	0,	0,	'',	'',	'',	'',	'',	0,	19,	273,	0,	'F03',	0,	0,	0,	0,	0,	''),
(1593,	'',	'Fach04',	'FACH',	0,	0,	'',	'',	'',	'',	'',	0,	19,	273,	0,	'F04',	0,	0,	0,	0,	0,	''),
(1603,	'',	'Fach05',	'FACH',	0,	0,	'',	'',	'',	'',	'',	0,	19,	273,	0,	'F05',	0,	0,	0,	0,	0,	''),
(1613,	'',	'Fach06',	'FACH',	0,	0,	'',	'',	'',	'',	'',	0,	19,	273,	0,	'F06',	0,	0,	0,	0,	0,	''),
(1623,	'',	'Fach07',	'FACH',	0,	0,	'',	'',	'',	'',	'',	0,	19,	273,	0,	'F07',	0,	0,	0,	0,	0,	''),
(1633,	'',	'Fach08',	'FACH',	0,	0,	'',	'',	'',	'',	'',	0,	19,	273,	0,	'F08',	0,	0,	0,	0,	0,	''),
(1643,	'',	'Fach09',	'FACH',	0,	0,	'',	'',	'',	'',	'',	100,	19,	273,	0,	'F09',	0,	0,	0,	0,	0,	''),
(1423,	'',	'Fach01',	'FACH',	0,	0,	'',	'',	'',	'',	'',	100,	12,	563,	0,	'F01',	0,	0,	0,	0,	0,	''),
(1433,	'',	'Fach02',	'FACH',	0,	0,	'',	'',	'',	'',	'',	100,	12,	563,	0,	'F02',	0,	0,	0,	0,	0,	''),
(1443,	'',	'Fach03',	'FACH',	0,	0,	'',	'',	'',	'',	'',	100,	12,	563,	0,	'F03',	0,	0,	0,	0,	0,	''),
(1523,	'',	'Fach04',	'FACH',	0,	0,	'',	'',	'',	'',	'',	100,	12,	563,	0,	'F04',	0,	0,	0,	0,	0,	''),
(1653,	'',	'Fach01',	'FACH',	0,	0,	'',	'',	'',	'',	'',	0,	52,	783,	0,	'F01',	0,	0,	0,	0,	0,	''),
(1663,	'',	'Fach02',	'FACH',	0,	0,	'',	'',	'',	'',	'',	0,	52,	783,	0,	'F02',	0,	0,	0,	0,	0,	''),
(1673,	'',	'Schublade01',	'FACH',	0,	0,	'',	'',	'',	'',	'',	0,	52,	783,	0,	'F03',	0,	0,	0,	0,	0,	''),
(1683,	'',	'Schublade02',	'FACH',	0,	0,	'',	'',	'',	'',	'',	0,	52,	783,	0,	'F04',	0,	0,	0,	0,	0,	''),
(1693,	'',	'Arbeitsplatte (R13/S03/F05)',	'FACH',	0,	0,	'',	'',	'',	'',	'',	100,	52,	783,	0,	'F05',	0,	0,	0,	0,	0,	''),
(1703,	'',	'Fach06',	'FACH',	0,	0,	'',	'',	'',	'',	'',	0,	52,	783,	0,	'F06',	0,	0,	0,	0,	0,	''),
(1713,	'',	'Fach07',	'FACH',	0,	0,	'',	'',	'',	'',	'',	0,	52,	783,	0,	'F07',	0,	0,	0,	0,	0,	''),
(1723,	'',	'Oben',	'FACH',	0,	0,	'',	'',	'',	'',	'',	0,	52,	783,	0,	'F08',	0,	0,	0,	0,	0,	''),
(1413,	'',	'Boden',	'FACH',	0,	0,	'',	'',	'',	'',	'',	0,	12,	1103,	0,	'F01',	0,	0,	0,	0,	0,	''),
(1333,	'',	'Unter Lichtschalter',	'FACH',	0,	0,	'',	'',	'',	'',	'',	0,	48,	1263,	0,	'F01',	0,	0,	0,	0,	0,	''),
(1343,	'',	'Links neben Regal',	'FACH',	0,	0,	'',	'',	'',	'',	'',	0,	48,	1263,	0,	'F02',	0,	0,	0,	0,	0,	''),
(1353,	'',	'Hinter TÃƒÂ¼r',	'FACH',	0,	0,	'',	'',	'',	'',	'',	10,	48,	1263,	0,	'F03',	0,	0,	0,	0,	0,	''),
(1803,	'',	'Reihe01',	'FACH',	0,	0,	'',	'',	'',	'',	'',	100,	52,	1783,	0,	'F01',	0,	0,	0,	0,	0,	''),
(1833,	'',	'Fach01',	'FACH',	0,	0,	'',	'',	'',	'',	'',	100,	50,	1813,	0,	'F01',	0,	0,	0,	0,	0,	''),
(1834,	'',	'Regal05',	'MOEBEL',	0,	0,	'',	'',	'',	'',	'',	0,	31,	0,	0,	'S06',	0,	0,	0,	0,	0,	''),
(1835,	'',	'Regal006',	'MOEBEL',	0,	0,	'',	'',	'',	'',	'',	0,	31,	0,	0,	'S07',	0,	0,	0,	0,	0,	''),
(473,	'',	'(ohne)',	'FREMD',	0,	0,	'',	'',	'',	'',	'',	0,	0,	0,	0,	'',	0,	0,	0,	0,	0,	''),
(3,	'ALDI',	'Aldi',	'FREMD',	0,	0,	'',	'',	'',	'',	'',	0,	0,	0,	0,	'',	0,	0,	0,	0,	0,	''),
(1243,	'',	'Amazon',	'FREMD',	0,	0,	'',	'',	'',	'',	'',	0,	0,	0,	0,	'',	0,	0,	0,	0,	0,	''),
(1173,	'',	'Apotheke',	'FREMD',	0,	0,	'',	'',	'',	'',	'',	0,	0,	0,	0,	'',	0,	0,	0,	0,	0,	''),
(823,	'',	'ATU',	'FREMD',	0,	0,	'',	'',	'',	'',	'',	0,	0,	0,	0,	'',	0,	0,	0,	0,	0,	''),
(24,	'BAUMARKT',	'Baumarkt',	'FREMD',	0,	0,	'',	'',	'',	'',	'',	0,	0,	0,	0,	'',	0,	0,	0,	0,	0,	''),
(493,	'',	'cafe',	'FREMD',	0,	0,	'',	'',	'',	'',	'',	0,	0,	0,	0,	'',	0,	0,	0,	0,	0,	''),
(42,	'',	'Deiters',	'FREMD',	0,	0,	'',	'',	'',	'',	'',	0,	0,	0,	0,	'',	0,	0,	0,	0,	0,	''),
(6,	'DM',	'DM',	'FREMD',	0,	0,	'',	'',	'',	'',	'',	0,	0,	0,	0,	'',	0,	0,	0,	0,	0,	''),
(1123,	'',	'Ernstings_Family',	'FREMD',	0,	0,	'',	'',	'',	'',	'',	0,	0,	0,	0,	'',	0,	0,	0,	0,	0,	''),
(423,	'',	'Kaufhof',	'FREMD',	0,	0,	'Arbeitszimmer',	'',	'',	'',	'',	0,	0,	0,	0,	'',	0,	0,	0,	0,	0,	''),
(5,	'KAUFLAND',	'Kaufland',	'FREMD',	0,	0,	'',	'',	'',	'',	'',	0,	0,	0,	0,	'',	0,	0,	0,	0,	0,	''),
(463,	'',	'Kaufland Ehrenfeld',	'FREMD',	0,	0,	'',	'',	'',	'',	'',	0,	0,	0,	0,	'',	0,	0,	0,	0,	0,	''),
(1143,	'',	'McPaper',	'FREMD',	0,	0,	'',	'',	'',	'',	'',	0,	0,	0,	0,	'',	0,	0,	0,	0,	0,	''),
(7,	'PENNY',	'Penny',	'FREMD',	0,	0,	'',	'',	'',	'',	'',	0,	0,	0,	0,	'',	0,	0,	0,	0,	0,	''),
(1133,	'',	'Post_Chorweiler',	'FREMD',	0,	0,	'',	'',	'',	'',	'',	0,	0,	0,	0,	'',	0,	0,	0,	0,	0,	''),
(4,	'REAL',	'REAL',	'FREMD',	0,	0,	'',	'',	'',	'',	'',	0,	0,	0,	0,	'',	0,	0,	0,	0,	0,	''),
(413,	'',	'Reformhaus',	'FREMD',	0,	0,	'Arbeitszimmer',	'',	'',	'',	'',	0,	0,	0,	0,	'',	0,	0,	0,	0,	0,	''),
(403,	'',	'REWE',	'FREMD',	0,	0,	'Arbeitszimmer',	'',	'',	'',	'',	0,	0,	0,	0,	'',	0,	0,	0,	0,	0,	''),
(483,	'',	'rewe',	'FREMD',	0,	0,	'',	'',	'',	'',	'',	0,	0,	0,	0,	'',	0,	0,	0,	0,	0,	''),
(1113,	'',	'Rewe_Bruehl',	'FREMD',	0,	0,	'',	'',	'',	'',	'',	0,	0,	0,	0,	'',	0,	0,	0,	0,	0,	''),
(8,	'SCHLECKER',	'Schlecker',	'FREMD',	0,	0,	'',	'',	'',	'',	'',	0,	0,	0,	0,	'',	0,	0,	0,	0,	0,	''),
(833,	'',	'zuhause',	'FREMD',	0,	0,	'',	'',	'',	'',	'',	0,	0,	0,	0,	'',	0,	0,	0,	0,	0,	''),
(1836,	'',	'Grosses Bett',	'MOEBEL',	0,	0,	'',	'',	'',	'',	'',	0,	56,	0,	0,	'S01',	0,	0,	0,	0,	0,	''),
(1837,	'',	'Wandregal',	'MOEBEL',	0,	0,	'',	'',	'',	'',	'',	0,	56,	0,	0,	'S02',	0,	0,	0,	0,	0,	''),
(1838,	'',	'Kleiderschrank',	'MOEBEL',	0,	0,	'',	'',	'',	'',	'',	0,	56,	0,	0,	'S03',	0,	0,	0,	0,	0,	''),
(1839,	'',	'Bueroschrank',	'MOEBEL',	0,	0,	'',	'',	'',	'',	'',	0,	56,	0,	0,	'S04',	0,	0,	0,	0,	0,	''),
(1840,	'',	'Grosser Kleiderschrank',	'MOEBEL',	0,	0,	'',	'',	'',	'',	'',	0,	56,	0,	0,	'S05',	0,	0,	0,	0,	0,	''),
(1841,	'',	'Kommode',	'MOEBEL',	0,	0,	'',	'',	'',	'',	'',	0,	56,	0,	0,	'S06',	0,	0,	0,	0,	0,	''),
(1842,	'',	'Schreibtisch',	'MOEBEL',	0,	0,	'',	'',	'',	'',	'',	0,	56,	0,	0,	'S07',	0,	0,	0,	0,	0,	''),
(1843,	'',	'Wuerfelregale',	'MOEBEL',	0,	0,	'',	'',	'',	'',	'',	0,	56,	0,	0,	'S08',	0,	0,	0,	0,	0,	''),
(1844,	'',	'Buecherregale',	'MOEBEL',	0,	0,	'',	'',	'',	'',	'',	0,	56,	0,	0,	'S09',	0,	0,	0,	0,	0,	''),
(1845,	'',	'Einfacher Schrank',	'MOEBEL',	0,	0,	'',	'',	'',	'',	'',	0,	56,	0,	0,	'S10',	0,	0,	0,	0,	0,	''),
(1846,	'',	'Nachtkommode',	'MOEBEL',	0,	0,	'',	'',	'',	'',	'',	0,	56,	0,	0,	'S11',	0,	0,	0,	0,	0,	''),
(1847,	'',	'Nachttisch',	'MOEBEL',	0,	0,	'',	'',	'',	'',	'',	0,	56,	0,	0,	'S12',	0,	0,	0,	0,	0,	''),
(1848,	'',	'Auf dem Bett',	'FACH',	0,	0,	'',	'',	'',	'',	'',	100,	56,	1836,	0,	'F01',	0,	0,	0,	0,	0,	''),
(1849,	'',	'Unterm Bett',	'FACH',	0,	0,	'',	'',	'',	'',	'',	0,	56,	1836,	0,	'F02',	0,	0,	0,	0,	0,	''),
(1850,	'',	'Boden',	'FACH',	0,	0,	'',	'',	'',	'',	'',	0,	56,	1838,	0,	'F01',	0,	0,	0,	0,	0,	''),
(1851,	'',	'Kistenstapel',	'MOEBEL',	0,	0,	'',	'',	'',	'',	'',	0,	56,	0,	0,	'S13',	0,	0,	0,	0,	0,	''),
(1852,	'',	'Alnatura',	'FREMD',	0,	0,	'',	'',	'',	'',	'',	0,	0,	0,	0,	'',	0,	0,	0,	0,	0,	''),
(1853,	'',	'Schublade (R12/S02/F02)',	'FACH',	0,	0,	'',	'',	'',	'',	'',	1,	19,	263,	0,	'F02',	0,	0,	0,	0,	0,	''),
(1854,	'',	'Schublade (R12/S02/F01)',	'FACH',	0,	0,	'',	'',	'',	'',	'',	1,	19,	263,	0,	'F01',	0,	0,	0,	0,	0,	''),
(1855,	'',	'Kiosk',	'FREMD',	0,	0,	'',	'',	'',	'',	'',	0,	0,	0,	0,	'',	0,	0,	0,	0,	0,	''),
(1856,	'',	'(leer)',	'MOEBEL',	0,	0,	'',	'',	'',	'',	'',	0,	0,	0,	0,	'',	0,	0,	0,	0,	0,	''),
(1857,	'',	'Regal001',	'MOEBEL',	0,	0,	'',	'',	'',	'',	'',	0,	47,	0,	0,	'S01',	0,	0,	0,	0,	0,	''),
(1858,	'',	'Fach001',	'FACH',	0,	0,	'',	'',	'',	'',	'',	0,	47,	1857,	0,	'F01',	0,	0,	0,	0,	0,	'');

CREATE TABLE `tblorttyp` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldbez` varchar(20) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

INSERT INTO `tblorttyp` (`fldindex`, `fldbez`) VALUES
(1,	'ZIMMER'),
(2,	'FREMD'),
(3,	'FACH'),
(4,	'MOEBEL');

CREATE TABLE `tblpoll_umfragen` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldkurz` varchar(20) COLLATE utf8_bin NOT NULL,
  `fldbez` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


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

INSERT INTO `tblprgupdate` (`fldIndex`, `fldBez`, `fldVersion`, `fldStatus`, `fldLang`, `fldModul`, `fldDatum`, `fldErldatum`, `fldBemerkung`) VALUES
(3,	'Sprache per Auswahlbox ermÃƒÂ¶glicht',	'0305',	'offen',	'de',	'Home',	'2013-03-04',	'0000-00-00',	''),
(13,	'Erledigungsdatum hinzugefÃƒÂ¼gt',	'0305',	'erledigt',	'de',	'Erledigungen',	'2013-03-04',	'2013-04-25',	''),
(23,	'logdateien durch config-Eintrag langshort nach sprachen unterschieden',	'0305',	'erledigt',	'de',	'(keins)',	'2013-03-04',	'2013-05-03',	''),
(33,	'Datumseingabe durch datepicker verbessert',	'0305',	'erledigt',	'de',	'',	'2013-03-04',	'2013-03-04',	''),
(43,	'showtab.inc.php sprachabhÃƒÂ¤ngig machen',	'0305',	'erledigt',	'de',	'',	'2013-03-04',	'2013-05-02',	'durch eintrag \"name\" aus translate-func ÃƒÂ¼bersetzt'),
(53,	'Programmupdate-Modul eingebaut',	'0305',	'erledigt',	'de',	'Programmupdate',	'2013-03-04',	'2013-03-04',	''),
(63,	'update funktion in home einbauen',	'0305',	'offen',	'de',	'Home',	'2013-03-26',	'0000-00-00',	''),
(73,	'PDF-Datei anzeigen',	'0305',	'erledigt',	'de',	'Briefverkehr',	'2013-04-25',	'2013-04-25',	''),
(83,	'Dauerauftrag einbauen',	'0305',	'erledigt',	'de',	'Erledigungen',	'2013-04-25',	'2013-05-03',	''),
(93,	'Zimmer einbauen',	'0305',	'erledigt',	'de',	'Docman',	'2013-04-25',	'2013-05-03',	''),
(103,	'Essensplan einbauen',	'0305',	'offen',	'de',	'Essensplan',	'2013-04-25',	'0000-00-00',	''),
(113,	'Monatsbericht mit Oberkonten',	'0305',	'erledigt',	'de',	'Konto',	'2013-04-25',	'2013-05-07',	''),
(123,	'Internetlink einbauen',	'0305',	'erledigt',	'de',	'Geschenkeliste',	'2013-04-25',	'2013-05-03',	''),
(153,	'Schemasync der Datenbank',	'0305',	'offen',	'de',	'',	'2013-05-13',	'0000-00-00',	''),
(143,	'Remotesync des Programmes',	'0305',	'offen',	'de',	'',	'2013-05-13',	'0000-00-00',	''),
(163,	'Rezepte verlinken',	'0305',	'offen',	'',	'Essensplan',	'2013-05-21',	'0000-00-00',	''),
(173,	'aktuelles Datum vorbelegen kÃƒÂ¶nnen',	'0305',	'offen',	'',	'',	'2013-05-21',	'0000-00-00',	'');

CREATE TABLE `tblprior` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldprior` int(11) NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

INSERT INTO `tblprior` (`fldindex`, `fldprior`) VALUES
(54,	0),
(64,	1),
(74,	2),
(84,	3),
(94,	4),
(104,	5);

CREATE TABLE `tblpublictyp` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldbez` varchar(250) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

INSERT INTO `tblpublictyp` (`fldindex`, `fldbez`) VALUES
(3,	'PUBLIC'),
(13,	'PRIVATE'),
(23,	'HOSTLIST');

CREATE TABLE `tblrechdat` (
  `fldIndex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldBez` varchar(200) COLLATE utf8_bin NOT NULL,
  `fldLink` varchar(250) COLLATE utf8_bin NOT NULL,
  `fldBemerkung` varchar(250) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldIndex`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

INSERT INTO `tblrechdat` (`fldIndex`, `fldBez`, `fldLink`, `fldBemerkung`) VALUES
(43,	'2013-01-23',	'http://localhost/wp/joorgportal30/sites/pdf/Rechnungen/Flinkster/Rechnung2013-01-23.pdf',	'Flinkster'),
(53,	'2013-02-20',	'http://localhost/wp/joorgportal30/sites/pdf/Rechnungen/Flinkster/Rechnung2013-02-20.pdf',	'Flinkster'),
(63,	'2013-03-20',	'http://localhost/wp/joorgportal30/sites/pdf/Rechnungen/Flinkster/Rechnung2013-03-20.pdf',	'Flinkster'),
(73,	'2013-04-17',	'http://localhost/wp/joorgportal30/sites/pdf/Rechnungen/Flinkster/Rechnung2013-04-17.pdf',	'Flinkster'),
(83,	'2013-05-15',	'http://localhost/wp/joorgportal30/sites/pdf/Rechnungen/Flinkster/Rechnung2013-05-15.pdf',	'Flinkster'),
(93,	'2013-06-12',	'http://localhost/wp/joorgportal30/sites/pdf/Rechnungen/Flinkster/Rechnung2013-06-12.pdf',	'Flinkster'),
(33,	'2013-07-10',	'http://localhost/wp/joorgportal30/sites/pdf/Rechnungen/Flinkster/Rechnung2013-07-10.pdf',	'Flinkster'),
(113,	'2013-08-21',	'http://localhost/wp/joorgportal30/sites/pdf/Rechnungen/Flinkster/Rechnung2013-08-21.pdf',	'Flinkster'),
(123,	'2013-09-25',	'http://localhost/wp/joorgportal30/sites/pdf/Rechnungen/Flinkster/Rechnung2013-09-25.pdf',	'Flinkster'),
(133,	'2013-11-20',	'',	'Flinkster'),
(143,	'2014-01-22',	'',	'Flinkster'),
(153,	'2014-04-23',	'',	'Flinkster'),
(163,	'2014-06-04',	'',	'Flinkster'),
(173,	'2014-07-02',	'',	'Flinkster'),
(174,	'2014-07-30',	'http://localhost/daten/Rechnungen/Flinkster/2014/Rechnung2014-07-30.pdf',	'Flinkster'),
(175,	'2014-10-22',	'http://localhost/daten/pdf/Rechnungen/Flinkster/2014/Rechnung2014-10-22.pdf',	'Flinkster');

CREATE TABLE `tblrechnungen` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldbez` varchar(250) COLLATE utf8_bin NOT NULL,
  `flddatum` date NOT NULL,
  `fldfilename` varchar(250) COLLATE utf8_bin NOT NULL,
  `fldid_adr` bigint(20) NOT NULL,
  `fldbetrag` decimal(10,2) NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

INSERT INTO `tblrechnungen` (`fldindex`, `fldbez`, `flddatum`, `fldfilename`, `fldid_adr`, `fldbetrag`) VALUES
(2,	'REWE',	'2014-08-25',	'http://localhost/daten/Bilder/IMG_20140825_205700.jpg',	972,	10.57),
(3,	'Rechnung2014-10-22',	'2014-10-22',	'http://localhost/daten/pdf/Rechnungen/Flinkster/2014/Rechnung2014-10-22.pdf',	1011,	233.71),
(4,	'Rechnung2015-01-14',	'2015-01-14',	'http://localhost/daten/pdf/Rechnungen/Flinkster/2015/Rechnung2015-01-14.pdf',	1011,	194.56),
(5,	'Rechnung2015-02-11',	'2015-02-11',	'http://localhost/daten/pdf/Rechnungen/Flinkster/2015/Rechnung2015-02-11.pdf',	1011,	201.14),
(6,	'Rechnung2015-03-11',	'2015-03-11',	'http://localhost/daten/pdf/Rechnungen/Flinkster/2015/Rechnung2015-03-11.pdf',	1011,	270.26),
(7,	'Rechnung2015-04-08',	'2015-04-08',	'http://localhost/daten/pdf/Rechnungen/Flinkster/2015/Rechnung2015-04-08.pdf',	1011,	241.01),
(8,	'Rechnung2015-05-06',	'2015-05-06',	'http://localhost/daten/pdf/Rechnungen/Flinkster/2015/Rechnung2015-05-06.pdf',	1011,	251.64),
(9,	'Rechnung2015-09-23',	'2015-09-23',	'http://localhost/daten/pdf/Rechnungen/Flinkster/2015/Rechnung2015-09-23.pdf',	1011,	168.87),
(10,	'Rechnung2015-01-10',	'2015-01-10',	'http://localhost/daten/pdf/Rechnungen/Otto/2015/Rechnung2015-01-10.pdf',	1016,	369.94);

CREATE TABLE `tblreisegrp` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldbez` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


CREATE TABLE `tblreports` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldbez` varchar(50) COLLATE utf8_bin NOT NULL,
  `fldkurz` varchar(20) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

INSERT INTO `tblreports` (`fldindex`, `fldbez`, `fldkurz`) VALUES
(1,	'Monatsbericht',	'MONRPT'),
(2,	'Anwenderreport',	'USRRPT');

CREATE TABLE `tblresyncalltyp` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldbez` varchar(250) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

INSERT INTO `tblresyncalltyp` (`fldindex`, `fldbez`) VALUES
(3,	'ALL'),
(13,	'ACT');

CREATE TABLE `tblrezepte` (
  `fldIndex` int(11) NOT NULL AUTO_INCREMENT,
  `fldBez` varchar(250) NOT NULL,
  `fldLink` varchar(250) NOT NULL,
  `fldid_status` bigint(20) NOT NULL,
  `fldfilename` varchar(250) NOT NULL,
  PRIMARY KEY (`fldIndex`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

INSERT INTO `tblrezepte` (`fldIndex`, `fldBez`, `fldLink`, `fldid_status`, `fldfilename`) VALUES
(1,	'Falafel',	'',	0,	'http://localhost/daten/pdf/Rezepte/vegane_falafel.pdf');

CREATE TABLE `tblsel` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldbez` varchar(1) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


CREATE TABLE `tblstamm_typ` (
  `fldIndex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldBez` varchar(200) COLLATE utf8_bin NOT NULL,
  `fldTyp` varchar(20) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldIndex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


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
(27,	'Neu',	'');

CREATE TABLE `tblstat_grp` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldbezgrp` varchar(250) NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

INSERT INTO `tblstat_grp` (`fldindex`, `fldbezgrp`) VALUES
(3,	'Erledigungen'),
(13,	'Prgupdate'),
(33,	'Stundenplan'),
(43,	'Zimmer'),
(53,	'Adressliste'),
(54,	'(ohne)');

CREATE TABLE `tblstat_zuord` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldid_grp` bigint(20) NOT NULL,
  `fldid_status` bigint(20) NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

INSERT INTO `tblstat_zuord` (`fldindex`, `fldid_grp`, `fldid_status`) VALUES
(1,	53,	2),
(2,	53,	25),
(3,	43,	7),
(4,	53,	26),
(5,	3,	2),
(6,	3,	4),
(8,	53,	27),
(11,	3,	7);

CREATE TABLE `tblstdplan` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldid_std` bigint(20) NOT NULL,
  `fldid_wotag` bigint(20) NOT NULL,
  `fldbez` varchar(250) NOT NULL,
  `fldid_user` bigint(20) NOT NULL,
  `fldnr` varchar(3) NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `tblstdplan` (`fldindex`, `fldid_std`, `fldid_wotag`, `fldbez`, `fldid_user`, `fldnr`) VALUES
(42,	2,	12,	'Physik',	1,	''),
(43,	13,	22,	'Tanzen',	3,	'999'),
(63,	33,	12,	'Basis-Unterricht',	3,	'001'),
(73,	33,	22,	'Basis/Unterricht',	3,	'002'),
(83,	33,	32,	'Unterricht',	3,	'004'),
(103,	33,	52,	'Unterricht',	3,	'006'),
(104,	43,	12,	'Basis-Unterricht',	3,	'002'),
(105,	53,	12,	'Basis-Unterricht',	3,	'003'),
(106,	33,	22,	'Basis-Unterricht',	3,	'004'),
(107,	43,	22,	'Basis-Unterricht (F&oumlrderunterricht)',	3,	'005'),
(108,	53,	22,	'Basis-Unterricht',	3,	'006'),
(109,	33,	32,	'Basis-Unterricht',	3,	'007'),
(110,	43,	32,	'Basis-Unterricht',	3,	'008'),
(111,	53,	32,	'Basis-Unterricht',	3,	'009'),
(112,	33,	42,	'Sport',	3,	'010'),
(113,	43,	42,	'Sport',	3,	'011'),
(114,	53,	42,	'Basis-Unterricht',	3,	'012'),
(115,	43,	52,	'Basis-Unterricht',	3,	'013'),
(116,	53,	52,	'Basis-Unterricht',	3,	'014'),
(117,	55,	12,	'Musik',	3,	''),
(118,	55,	22,	'Basis-Unterricht',	3,	''),
(119,	57,	22,	'Englisch',	3,	''),
(120,	55,	32,	'Basis-Unterricht',	3,	''),
(121,	57,	32,	'Englisch',	3,	''),
(122,	55,	42,	'Basis-Unterricht',	3,	''),
(123,	55,	52,	'Basis-Unterricht',	3,	''),
(124,	57,	52,	'Religion',	3,	'');

CREATE TABLE `tblstdwotag` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldspalte` varchar(5) NOT NULL,
  `fldbez` varchar(250) NOT NULL,
  `fldfarbe` varchar(8) NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `tblstdwotag` (`fldindex`, `fldspalte`, `fldbez`, `fldfarbe`) VALUES
(2,	'0',	'Uhrzeit',	''),
(12,	'1',	'Montag',	'#aaaaff'),
(22,	'2',	'Dienstag',	'#aaaaff'),
(32,	'3',	'Mittwoch',	'#aaaaff'),
(42,	'4',	'Donnerstag',	'#aaaaff'),
(52,	'5',	'Freitag',	'#aaaaff');

CREATE TABLE `tblstdzeit` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldbez` varchar(20) NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `tblstdzeit` (`fldindex`, `fldbez`) VALUES
(13,	'16:45 - 17:30'),
(23,	'15:30 - 16:15'),
(33,	'08:15 - 09:00'),
(43,	'09:15 - 10:00'),
(53,	'10:15 - 11:00'),
(55,	'11:00 - 11:45'),
(56,	'11:45 - 12:00'),
(57,	'12:00 - 12:45'),
(58,	'12:45 - 13:30');

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

INSERT INTO `tblsynccomp` (`fldIndex`, `fldHost`, `fldIPAddr`, `fldSyncart`, `fldaktiv`, `flddbname`, `fldusername`, `fldpassword`, `fldcloud`, `fldlocal`, `fldremotepfad`, `flddbtyp`) VALUES
(34,	'horst-laptop',	'192.168.0.133',	'auto',	'J',	'dbWebportal',	'',	'',	'N',	'N',	'',	''),
(44,	'horst',	'192.168.0.104',	'auto',	'J',	'dbWebportal',	'root',	'mysql',	'N',	'N',	'',	''),
(54,	'horald-joorgportal',	'192.168.0.133',	'auto',	'J',	'dbjoorgportal',	'root',	'mysql',	'N',	'N',	'',	''),
(55,	'dbjoorgportal312',	'localhost',	'auto',	'J',	'dbjoorgportal312',	'root',	'mysql',	'N',	'N',	'',	''),
(56,	'dbsqlite',	'localhost',	'auto',	'J',	'joorgsqlite.db',	'',	'',	'N',	'N',	'',	'sqlite');

CREATE TABLE `tblsynctyp` (
  `fldIndex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldBez` varchar(100) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldIndex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

INSERT INTO `tblsynctyp` (`fldIndex`, `fldBez`) VALUES
(3,	'(ohne)'),
(13,	'NEW'),
(23,	'OK');

CREATE TABLE `tbltables` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldbez` varchar(250) NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `tbltables` (`fldindex`, `fldbez`) VALUES
(1,	'tblktosal');

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

INSERT INTO `tbltabletten` (`fldindex`, `fldbez`, `fldvondatum`, `fldanztage`, `fldbisdatum`, `fldAnztab`, `fldDosierung`, `flddosmorgens`, `flddosmittags`, `flddosabends`, `flddosnachts`, `fldid_user`, `fldme`) VALUES
(3,	'Ramipril 2,5 mg',	'2014-04-08',	0,	'0000-00-00',	130,	2.00,	1.00,	0.00,	1.00,	0.00,	1,	''),
(13,	'Metoprololsuccinat 47,5 mg',	'2015-03-02',	0,	'0000-00-00',	74,	0.50,	0.50,	0.00,	0.00,	0.00,	1,	''),
(14,	'Novaminsulfon - 1A 500mg pro ml',	'0000-00-00',	0,	'0000-00-00',	0,	90.00,	30.00,	30.00,	30.00,	0.00,	50008,	'Tropfen'),
(15,	'Tilidin AL comp. 50mg / 4mg',	'0000-00-00',	0,	'0000-00-00',	0,	2.00,	1.00,	0.00,	1.00,	0.00,	50008,	'Tab.'),
(16,	'Dolormin 400mg Ibuprofen',	'0000-00-00',	0,	'0000-00-00',	0,	0.00,	0.00,	0.00,	0.00,	0.00,	50008,	'bei Bedarf');

CREATE TABLE `tbltc_gepaeck` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldbez` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


CREATE TABLE `tbltc_grund` (
  `fldIndex` int(11) NOT NULL AUTO_INCREMENT,
  `fldBez` varchar(250) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldIndex`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

INSERT INTO `tbltc_grund` (`fldIndex`, `fldBez`) VALUES
(3,	'Schulung'),
(13,	'Urlaub'),
(23,	'50. Geburtstag');

CREATE TABLE `tbltc_kosten` (
  `fldIndex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldid_reise` bigint(20) NOT NULL,
  `fldBez` varchar(250) NOT NULL,
  `fldPreis` decimal(18,2) NOT NULL,
  `fldLink` varchar(250) NOT NULL,
  PRIMARY KEY (`fldIndex`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


CREATE TABLE `tbltc_liste` (
  `fldIndex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldBez` varchar(250) COLLATE utf8_bin NOT NULL,
  `fldVondatum` date NOT NULL,
  `fldBisdatum` date NOT NULL,
  `fldid_grund` bigint(20) NOT NULL,
  PRIMARY KEY (`fldIndex`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

INSERT INTO `tbltc_liste` (`fldIndex`, `fldBez`, `fldVondatum`, `fldBisdatum`, `fldid_grund`) VALUES
(13,	'Tagesausflug Holland',	'2013-07-20',	'0000-00-00',	13),
(23,	'Pariswochenende',	'2014-04-19',	'0000-00-00',	23),
(24,	'Eifelurlaub',	'2015-07-11',	'2015-07-25',	13);

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


CREATE TABLE `tbltc_status` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldbez` varchar(20) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


CREATE TABLE `tbltermine_grp` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldbez` varchar(250) COLLATE utf8_bin NOT NULL,
  `fldfarbe` varchar(10) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

INSERT INTO `tbltermine_grp` (`fldindex`, `fldbez`, `fldfarbe`) VALUES
(3,	'Geburtstag',	'#378006'),
(13,	'Jahresurlaub Horst',	''),
(23,	'Krankheit',	''),
(33,	'Feier',	''),
(43,	'Freizeit',	''),
(53,	'Kita',	''),
(63,	'MÃ¼llabfuhr',	''),
(73,	'Feiertag',	'#CD0000'),
(83,	'beweglicher Ferientag',	''),
(84,	'Urlaub Christiane',	'');

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

INSERT INTO `tbltermine_liste` (`fldindex`, `fldbez`, `fldkurz`, `fldvondatum`, `fldvonuhrzeit`, `fldbisdatum`, `fldbisuhrzeit`, `fldid_terminegrp`, `fldfarbe`, `fldid_terminserie`) VALUES
(73,	'Geburtstag Iris Burgmeister',	'Iris',	'2014-01-04',	'00:00:00',	'0000-00-00',	'00:00:00',	3,	'',	33),
(83,	'Geburtstag Manfred Losse',	'Manfred',	'2014-01-16',	'00:00:00',	'0000-00-00',	'00:00:00',	3,	'',	33),
(93,	'Geburtstag Rachel Gessat',	'Rachel',	'2014-01-19',	'00:00:00',	'0000-00-00',	'00:00:00',	3,	'',	33),
(103,	'Geburtstag Sabine  Dreger',	'Sabine',	'2014-01-25',	'00:00:00',	'0000-00-00',	'00:00:00',	3,	'',	33),
(113,	'Geburtstag Ruth Krabbe',	'Ruth',	'2014-01-29',	'00:00:00',	'0000-00-00',	'00:00:00',	3,	'',	33),
(123,	'Geburtstag Phoebe Grau',	'Phoebe',	'2014-02-26',	'00:00:00',	'0000-00-00',	'00:00:00',	3,	'',	33),
(133,	'Geburtstag Dagmar LiÃƒÅ¸ke',	'Dagmar',	'2014-03-04',	'00:00:00',	'0000-00-00',	'00:00:00',	3,	'',	33),
(143,	'Geburtstag Orell Schulte',	'Orell',	'2014-03-15',	'00:00:00',	'0000-00-00',	'00:00:00',	3,	'',	33),
(153,	'Geburtstag Heinz Meyer',	'Opa Heinz',	'2014-05-05',	'00:00:00',	'0000-00-00',	'00:00:00',	3,	'',	33),
(163,	'Geburtstag Horst Meyer',	'Horst',	'2014-05-18',	'00:00:00',	'0000-00-00',	'00:00:00',	3,	'',	33),
(173,	'Geburtstag Edgar Meyer',	'Edgar',	'2014-05-24',	'00:00:00',	'0000-00-00',	'00:00:00',	3,	'',	33),
(183,	'Geburtstag Brigitte  Schulte',	'Oma Brigitte',	'2014-05-26',	'00:00:00',	'0000-00-00',	'00:00:00',	3,	'',	33),
(193,	'Geburtstag Erna Meyer',	'Oma Erna',	'2014-06-11',	'00:00:00',	'0000-00-00',	'00:00:00',	3,	'',	33),
(203,	'Geburtstag Ralf Beckers',	'Ralf',	'2014-06-15',	'00:00:00',	'0000-00-00',	'00:00:00',	3,	'',	33),
(213,	'Geburtstag Frieda Lina Meyer',	'Frieda',	'2014-07-09',	'00:00:00',	'0000-00-00',	'00:00:00',	3,	'',	33),
(223,	'Geburtstag Damaris Dreger',	'Damaris',	'2014-08-01',	'00:00:00',	'0000-00-00',	'00:00:00',	3,	'',	33),
(233,	'Geburtstag Sylvia Schulte',	'Sylvia',	'2014-08-30',	'00:00:00',	'0000-00-00',	'00:00:00',	3,	'',	33),
(243,	'Geburtstag Antonia Dreger',	'Antonia',	'2014-09-10',	'00:00:00',	'0000-00-00',	'00:00:00',	3,	'',	33),
(253,	'Geburtstag Louis Dreger',	'Louis',	'2014-09-14',	'00:00:00',	'0000-00-00',	'00:00:00',	3,	'',	33),
(263,	'Geburtstag Christiane Meyer',	'Christiane',	'2014-09-20',	'00:00:00',	'0000-00-00',	'00:00:00',	3,	'',	33),
(273,	'Geburtstag Andrea Dahmann',	'Andrea',	'2014-09-30',	'00:00:00',	'0000-00-00',	'00:00:00',	3,	'',	33),
(283,	'Geburtstag Gerrit Schulte',	'Gerrit',	'2014-10-23',	'00:00:00',	'0000-00-00',	'00:00:00',	3,	'',	33),
(293,	'Geburtstag Hartmut Schulte',	'Opa Hartmut',	'2014-11-21',	'00:00:00',	'0000-00-00',	'00:00:00',	3,	'',	33),
(303,	'Geburtstag Angelika Weber',	'Angelika',	'2014-12-01',	'00:00:00',	'0000-00-00',	'00:00:00',	3,	'',	33),
(313,	'Geburtstag Miriam Grau',	'Miriam',	'2014-12-11',	'00:00:00',	'0000-00-00',	'00:00:00',	3,	'',	33),
(323,	'Geburtstag Sigrid PlÃƒÂ¼ckhahn',	'Sigrid',	'2014-12-24',	'00:00:00',	'0000-00-00',	'00:00:00',	3,	'',	33),
(343,	'Goldhochzeit meine Eltern',	'',	'2014-01-25',	'00:00:00',	'0000-00-00',	'00:00:00',	33,	'',	0),
(353,	'Urlaub',	'',	'2014-05-19',	'00:00:00',	'0000-00-00',	'00:00:00',	13,	'',	63),
(363,	'AuffÃƒÂ¼hrung Kita',	'',	'2014-03-19',	'00:00:00',	'0000-00-00',	'00:00:00',	53,	'',	53),
(373,	'Geburtstag Iris Burgmeister',	'',	'2015-01-04',	'00:00:00',	'0000-00-00',	'00:00:00',	3,	'',	33),
(383,	'Geburtstag Manfred Losse',	'',	'2015-01-16',	'00:00:00',	'0000-00-00',	'00:00:00',	0,	'',	0),
(393,	'Geburtstag Rachel Gessat',	'',	'2015-01-19',	'00:00:00',	'0000-00-00',	'00:00:00',	0,	'',	0),
(403,	'Geburtstag Sabine  Dreger',	'',	'2015-01-25',	'00:00:00',	'0000-00-00',	'00:00:00',	0,	'',	0),
(413,	'Geburtstag Ruth Krabbe',	'',	'2015-01-29',	'00:00:00',	'0000-00-00',	'00:00:00',	0,	'',	0),
(423,	'Geburtstag Phoebe Grau',	'',	'2015-02-26',	'00:00:00',	'0000-00-00',	'00:00:00',	0,	'',	0),
(433,	'Geburtstag Lewin Gessat',	'',	'2015-03-02',	'00:00:00',	'0000-00-00',	'00:00:00',	0,	'',	0),
(443,	'Geburtstag Dagmar LiÃƒÅ¸ke',	'',	'2015-03-04',	'00:00:00',	'0000-00-00',	'00:00:00',	0,	'',	0),
(453,	'Geburtstag Orell Schulte',	'',	'2015-03-15',	'00:00:00',	'0000-00-00',	'00:00:00',	0,	'',	0),
(473,	'Geburtstag Horst Meyer',	'',	'2015-05-18',	'00:00:00',	'0000-00-00',	'00:00:00',	3,	'',	33),
(513,	'Geburtstag Ralf Beckers',	'',	'2015-06-15',	'00:00:00',	'0000-00-00',	'00:00:00',	0,	'',	0),
(523,	'Geburtstag Frieda Lina Meyer',	'',	'2015-07-09',	'00:00:00',	'0000-00-00',	'00:00:00',	0,	'',	0),
(533,	'Geburtstag Damaris Dreger',	'',	'2015-08-01',	'00:00:00',	'0000-00-00',	'00:00:00',	0,	'',	0),
(543,	'Geburtstag Sylvia Schulte',	'',	'2015-08-30',	'00:00:00',	'0000-00-00',	'00:00:00',	0,	'',	0),
(553,	'Geburtstag Antonia Dreger',	'',	'2015-09-10',	'00:00:00',	'0000-00-00',	'00:00:00',	0,	'',	0),
(563,	'Geburtstag Louis Dreger',	'',	'2015-09-14',	'00:00:00',	'0000-00-00',	'00:00:00',	0,	'',	0),
(573,	'Geburtstag Christiane Meyer',	'',	'2015-09-20',	'00:00:00',	'0000-00-00',	'00:00:00',	0,	'',	0),
(583,	'Geburtstag Andrea Dahmann',	'',	'2015-09-30',	'00:00:00',	'0000-00-00',	'00:00:00',	0,	'',	0),
(593,	'Geburtstag Gerrit Schulte',	'',	'2015-10-23',	'00:00:00',	'0000-00-00',	'00:00:00',	0,	'',	0),
(603,	'Geburtstag Hartmut Schulte',	'',	'2015-11-21',	'00:00:00',	'0000-00-00',	'00:00:00',	0,	'',	0),
(613,	'Geburtstag Angelika Weber',	'',	'2015-12-01',	'00:00:00',	'0000-00-00',	'00:00:00',	0,	'',	0),
(623,	'Geburtstag Miriam Grau',	'',	'2015-12-11',	'00:00:00',	'0000-00-00',	'00:00:00',	0,	'',	0),
(633,	'Geburtstag Sigrid PlÃƒÂ¼ckhahn',	'',	'2015-12-24',	'00:00:00',	'0000-00-00',	'00:00:00',	0,	'',	0),
(643,	'graue Tonne',	'',	'2014-03-06',	'00:00:00',	'0000-00-00',	'00:00:00',	63,	'',	13),
(723,	'graue Tonne',	'',	'2014-03-12',	'00:00:00',	'0000-00-00',	'00:00:00',	63,	'',	13),
(733,	'graue Tonne',	'',	'2014-03-19',	'00:00:00',	'0000-00-00',	'00:00:00',	63,	'',	13),
(743,	'graue Tonne',	'',	'2014-03-26',	'00:00:00',	'0000-00-00',	'00:00:00',	63,	'',	13),
(753,	'Rosenmontag',	'',	'2014-03-03',	'00:00:00',	'0000-00-00',	'00:00:00',	73,	'',	0),
(763,	'graue Tonne',	'',	'2014-04-02',	'00:00:00',	'0000-00-00',	'00:00:00',	63,	'',	13),
(773,	'graue Tonne',	'',	'2014-04-09',	'00:00:00',	'0000-00-00',	'00:00:00',	63,	'',	13),
(783,	'graue Tonne',	'',	'2014-04-15',	'00:00:00',	'0000-00-00',	'00:00:00',	63,	'',	13),
(793,	'graue Tonne',	'',	'2014-04-24',	'00:00:00',	'0000-00-00',	'00:00:00',	63,	'',	13),
(803,	'graue Tonne',	'',	'2014-04-30',	'00:00:00',	'0000-00-00',	'00:00:00',	63,	'',	13),
(813,	'graue Tonne',	'',	'2014-05-07',	'00:00:00',	'0000-00-00',	'00:00:00',	63,	'',	13),
(823,	'graue Tonne',	'',	'2014-05-14',	'00:00:00',	'0000-00-00',	'00:00:00',	63,	'',	13),
(833,	'graue Tonne',	'',	'2014-05-21',	'00:00:00',	'0000-00-00',	'00:00:00',	63,	'',	13),
(843,	'graue Tonne',	'',	'2014-05-28',	'00:00:00',	'0000-00-00',	'00:00:00',	63,	'',	13),
(853,	'graue Tonne',	'',	'2014-06-04',	'00:00:00',	'0000-00-00',	'00:00:00',	63,	'',	13),
(863,	'graue Tonne',	'',	'2014-06-12',	'00:00:00',	'0000-00-00',	'00:00:00',	63,	'',	13),
(873,	'graue Tonne',	'',	'2014-06-18',	'00:00:00',	'0000-00-00',	'00:00:00',	63,	'',	13),
(883,	'graue Tonne',	'',	'2014-06-25',	'00:00:00',	'0000-00-00',	'00:00:00',	63,	'',	13),
(893,	'graue Tonne',	'',	'2014-07-02',	'00:00:00',	'0000-00-00',	'00:00:00',	63,	'',	13),
(903,	'graue Tonne',	'',	'2014-07-09',	'00:00:00',	'0000-00-00',	'00:00:00',	63,	'',	13),
(913,	'graue Tonne',	'',	'2014-07-16',	'00:00:00',	'0000-00-00',	'00:00:00',	63,	'',	13),
(923,	'graue Tonne',	'',	'2014-07-23',	'00:00:00',	'0000-00-00',	'00:00:00',	63,	'',	13),
(933,	'graue Tonne',	'',	'2014-07-30',	'00:00:00',	'0000-00-00',	'00:00:00',	63,	'',	13),
(943,	'graue Tonne',	'',	'2014-08-06',	'00:00:00',	'0000-00-00',	'00:00:00',	63,	'',	13),
(953,	'graue Tonne',	'',	'2014-08-13',	'00:00:00',	'0000-00-00',	'00:00:00',	63,	'',	13),
(963,	'graue Tonne',	'',	'2014-08-20',	'00:00:00',	'0000-00-00',	'00:00:00',	63,	'',	13),
(973,	'graue Tonne',	'',	'2014-08-27',	'00:00:00',	'0000-00-00',	'00:00:00',	63,	'',	13),
(983,	'graue Tonne',	'',	'2014-09-03',	'00:00:00',	'0000-00-00',	'00:00:00',	63,	'',	13),
(993,	'graue Tonne',	'',	'2014-09-10',	'00:00:00',	'0000-00-00',	'00:00:00',	63,	'',	13),
(1003,	'graue Tonne',	'',	'2014-09-17',	'00:00:00',	'0000-00-00',	'00:00:00',	63,	'',	13),
(1013,	'graue Tonne',	'',	'2014-09-24',	'00:00:00',	'0000-00-00',	'00:00:00',	63,	'',	13),
(1023,	'graue Tonne',	'',	'2014-09-30',	'00:00:00',	'0000-00-00',	'00:00:00',	63,	'',	13),
(1033,	'graue Tonne',	'',	'2014-10-08',	'00:00:00',	'0000-00-00',	'00:00:00',	63,	'',	13),
(1043,	'graue Tonne',	'',	'2014-10-15',	'00:00:00',	'0000-00-00',	'00:00:00',	63,	'',	13),
(1053,	'graue Tonne',	'',	'2014-10-22',	'00:00:00',	'0000-00-00',	'00:00:00',	63,	'',	13),
(1063,	'graue Tonne',	'',	'2014-10-29',	'00:00:00',	'0000-00-00',	'00:00:00',	63,	'',	13),
(1163,	'graue Tonne',	'',	'2014-01-02',	'00:00:00',	'0000-00-00',	'00:00:00',	63,	'',	13),
(1173,	'graue Tonne',	'',	'2014-01-08',	'00:00:00',	'0000-00-00',	'00:00:00',	63,	'',	13),
(1183,	'graue Tonne',	'',	'2014-01-15',	'00:00:00',	'0000-00-00',	'00:00:00',	63,	'',	13),
(1193,	'graue Tonne',	'',	'2014-01-22',	'00:00:00',	'0000-00-00',	'00:00:00',	63,	'',	13),
(1203,	'graue Tonne',	'',	'2014-01-29',	'00:00:00',	'0000-00-00',	'00:00:00',	63,	'',	13),
(1213,	'graue Tonne',	'',	'2014-02-05',	'00:00:00',	'0000-00-00',	'00:00:00',	63,	'',	13),
(1223,	'graue Tonne',	'',	'2014-02-12',	'00:00:00',	'0000-00-00',	'00:00:00',	63,	'',	13),
(1233,	'graue Tonne',	'',	'2014-02-19',	'00:00:00',	'0000-00-00',	'00:00:00',	63,	'',	13),
(1243,	'graue Tonne',	'',	'2014-02-26',	'00:00:00',	'0000-00-00',	'00:00:00',	63,	'',	13),
(1253,	'gelbe Tonne',	'',	'2014-01-02',	'00:00:00',	'0000-00-00',	'00:00:00',	63,	'',	3),
(1263,	'gelbe Tonne',	'',	'2014-01-16',	'00:00:00',	'0000-00-00',	'00:00:00',	63,	'',	3),
(1273,	'gelbe Tonne',	'',	'2014-01-30',	'00:00:00',	'0000-00-00',	'00:00:00',	63,	'',	3),
(1283,	'gelbe Tonne',	'',	'2014-02-13',	'00:00:00',	'0000-00-00',	'00:00:00',	63,	'',	3),
(1293,	'gelbe Tonne',	'',	'2014-02-27',	'00:00:00',	'0000-00-00',	'00:00:00',	63,	'',	3),
(1303,	'gelbe Tonne',	'',	'2014-03-13',	'00:00:00',	'0000-00-00',	'00:00:00',	63,	'',	3),
(1313,	'gelbe Tonne',	'',	'2014-03-27',	'00:00:00',	'0000-00-00',	'00:00:00',	63,	'',	3),
(1323,	'gelbe Tonne',	'',	'2014-04-10',	'00:00:00',	'0000-00-00',	'00:00:00',	63,	'',	3),
(1333,	'gelbe Tonne',	'',	'2014-04-25',	'00:00:00',	'0000-00-00',	'00:00:00',	63,	'',	3),
(1343,	'gelbe Tonne',	'',	'2014-05-08',	'00:00:00',	'0000-00-00',	'00:00:00',	63,	'',	3),
(1353,	'gelbe Tonne',	'',	'2014-05-22',	'00:00:00',	'0000-00-00',	'00:00:00',	63,	'',	3),
(1363,	'gelbe Tonne',	'',	'2014-06-05',	'00:00:00',	'0000-00-00',	'00:00:00',	63,	'',	3),
(1373,	'gelbe Tonne',	'',	'2014-06-20',	'00:00:00',	'0000-00-00',	'00:00:00',	63,	'',	3),
(1383,	'gelbe Tonne',	'',	'2014-07-03',	'00:00:00',	'0000-00-00',	'00:00:00',	63,	'',	3),
(1393,	'gelbe Tonne',	'',	'2014-07-17',	'00:00:00',	'0000-00-00',	'00:00:00',	63,	'',	3),
(1403,	'gelbe Tonne',	'',	'2014-07-31',	'00:00:00',	'0000-00-00',	'00:00:00',	63,	'',	3),
(1413,	'gelbe Tonne',	'',	'2014-08-14',	'00:00:00',	'0000-00-00',	'00:00:00',	63,	'',	3),
(1423,	'gelbe Tonne',	'',	'2014-08-28',	'00:00:00',	'0000-00-00',	'00:00:00',	63,	'',	3),
(1433,	'gelbe Tonne',	'',	'2014-09-11',	'00:00:00',	'0000-00-00',	'00:00:00',	63,	'',	3),
(1443,	'gelbe Tonne',	'',	'2014-09-25',	'00:00:00',	'0000-00-00',	'00:00:00',	63,	'',	3),
(1453,	'gelbe Tonne',	'',	'2014-10-09',	'00:00:00',	'0000-00-00',	'00:00:00',	63,	'',	3),
(1463,	'gelbe Tonne',	'',	'2014-10-23',	'00:00:00',	'0000-00-00',	'00:00:00',	63,	'',	3),
(1473,	'gelbe Tonne',	'',	'2014-11-06',	'00:00:00',	'0000-00-00',	'00:00:00',	63,	'',	3),
(1483,	'gelbe Tonne',	'',	'2014-11-20',	'00:00:00',	'0000-00-00',	'00:00:00',	63,	'',	3),
(1493,	'gelbe Tonne',	'',	'2014-12-04',	'00:00:00',	'0000-00-00',	'00:00:00',	63,	'',	3),
(1503,	'gelbe Tonne',	'',	'2014-12-18',	'00:00:00',	'0000-00-00',	'00:00:00',	63,	'',	3),
(1513,	'graue Tonne',	'',	'2014-11-05',	'00:00:00',	'0000-00-00',	'00:00:00',	63,	'',	13),
(1523,	'graue Tonne',	'',	'2014-11-12',	'00:00:00',	'0000-00-00',	'00:00:00',	63,	'',	13),
(1533,	'graue Tonne',	'',	'2014-11-19',	'00:00:00',	'0000-00-00',	'00:00:00',	63,	'',	13),
(1543,	'graue Tonne',	'',	'2014-11-26',	'00:00:00',	'0000-00-00',	'00:00:00',	63,	'',	13),
(1553,	'graue Tonne',	'',	'2014-12-03',	'00:00:00',	'0000-00-00',	'00:00:00',	63,	'',	13),
(1563,	'graue Tonne',	'',	'2014-12-10',	'00:00:00',	'0000-00-00',	'00:00:00',	63,	'',	13),
(1573,	'graue Tonne',	'',	'2014-12-17',	'00:00:00',	'0000-00-00',	'00:00:00',	63,	'',	13),
(1583,	'graue Tonne',	'',	'2014-12-23',	'00:00:00',	'0000-00-00',	'00:00:00',	63,	'',	13),
(1593,	'graue Tonne',	'',	'2014-12-31',	'00:00:00',	'0000-00-00',	'00:00:00',	63,	'',	13),
(1603,	'blaue Tonne',	'',	'2014-01-08',	'00:00:00',	'0000-00-00',	'00:00:00',	63,	'',	23),
(1613,	'blaue Tonne',	'',	'2014-01-22',	'00:00:00',	'0000-00-00',	'00:00:00',	63,	'',	23),
(1623,	'blaue Tonne',	'',	'2014-02-05',	'00:00:00',	'0000-00-00',	'00:00:00',	63,	'',	23),
(1633,	'blaue Tonne',	'',	'2014-02-19',	'00:00:00',	'0000-00-00',	'00:00:00',	63,	'',	23),
(1643,	'blaue Tonne',	'',	'2014-03-06',	'00:00:00',	'0000-00-00',	'00:00:00',	63,	'',	23),
(1653,	'blaue Tonne',	'',	'2014-03-19',	'00:00:00',	'0000-00-00',	'00:00:00',	63,	'',	23),
(1663,	'blaue Tonne',	'',	'2014-04-02',	'00:00:00',	'0000-00-00',	'00:00:00',	63,	'',	23),
(1673,	'blaue Tonne',	'',	'2014-04-15',	'00:00:00',	'0000-00-00',	'00:00:00',	63,	'',	23),
(1683,	'blaue Tonne',	'',	'2014-04-30',	'00:00:00',	'0000-00-00',	'00:00:00',	63,	'',	23),
(1693,	'blaue Tonne',	'',	'2014-05-14',	'00:00:00',	'0000-00-00',	'00:00:00',	63,	'',	23),
(1703,	'blaue Tonne',	'',	'2014-05-28',	'00:00:00',	'0000-00-00',	'00:00:00',	63,	'',	23),
(1713,	'blaue Tonne',	'',	'2014-06-12',	'00:00:00',	'0000-00-00',	'00:00:00',	63,	'',	23),
(1723,	'blaue Tonne',	'',	'2014-06-25',	'00:00:00',	'0000-00-00',	'00:00:00',	63,	'',	23),
(1733,	'blaue Tonne',	'',	'2014-07-09',	'00:00:00',	'0000-00-00',	'00:00:00',	63,	'',	23),
(1743,	'blaue Tonne',	'',	'2014-07-23',	'00:00:00',	'0000-00-00',	'00:00:00',	63,	'',	23),
(1753,	'blaue Tonne',	'',	'2014-08-06',	'00:00:00',	'0000-00-00',	'00:00:00',	63,	'',	23),
(1763,	'blaue Tonne',	'',	'2014-08-20',	'00:00:00',	'0000-00-00',	'00:00:00',	63,	'',	23),
(1773,	'blaue Tonne',	'',	'2014-09-03',	'00:00:00',	'0000-00-00',	'00:00:00',	63,	'',	23),
(1783,	'blaue Tonne',	'',	'2014-09-17',	'00:00:00',	'0000-00-00',	'00:00:00',	63,	'',	23),
(1793,	'blaue Tonne',	'',	'2014-09-30',	'00:00:00',	'0000-00-00',	'00:00:00',	63,	'',	23),
(1803,	'blaue Tonne',	'',	'2014-10-15',	'00:00:00',	'0000-00-00',	'00:00:00',	63,	'',	23),
(1813,	'blaue Tonne',	'',	'2014-10-29',	'00:00:00',	'0000-00-00',	'00:00:00',	63,	'',	23),
(1823,	'blaue Tonne',	'',	'2014-11-12',	'00:00:00',	'0000-00-00',	'00:00:00',	63,	'',	23),
(1833,	'blaue Tonne',	'',	'2014-11-26',	'00:00:00',	'0000-00-00',	'00:00:00',	63,	'',	23),
(1843,	'blaue Tonne',	'',	'2014-12-10',	'00:00:00',	'0000-00-00',	'00:00:00',	63,	'',	23),
(1853,	'blaue Tonne',	'',	'2014-12-23',	'00:00:00',	'0000-00-00',	'00:00:00',	63,	'',	23),
(1863,	'Arzttermin Langzeit EKG anlegen lassen',	'',	'2014-03-20',	'00:00:00',	'0000-00-00',	'00:00:00',	23,	'',	43),
(1873,	'Arzttermin Langzeit EKG abnhemen lassen',	'',	'2014-03-21',	'00:00:00',	'0000-00-00',	'00:00:00',	23,	'',	43),
(1883,	'07:30 Dr. Mortsiefer NachgesprÃƒÂ¤ch',	'',	'2014-03-27',	'00:00:00',	'0000-00-00',	'00:00:00',	23,	'',	43),
(1893,	'Geburtstag Iris Burgmeister',	'',	'2015-01-04',	'00:00:00',	'0000-00-00',	'00:00:00',	3,	'',	33),
(1903,	'Geburtstag Manfred Losse',	'',	'2015-01-16',	'00:00:00',	'0000-00-00',	'00:00:00',	0,	'',	0),
(1913,	'Geburtstag Rachel Gessat',	'',	'2015-01-19',	'00:00:00',	'0000-00-00',	'00:00:00',	0,	'',	0),
(1923,	'Geburtstag Sabine  Dreger',	'',	'2015-01-25',	'00:00:00',	'0000-00-00',	'00:00:00',	0,	'',	0),
(1933,	'Geburtstag Ruth Krabbe',	'',	'2015-01-29',	'00:00:00',	'0000-00-00',	'00:00:00',	0,	'',	0),
(1943,	'Geburtstag Phoebe Grau',	'',	'2015-02-26',	'00:00:00',	'0000-00-00',	'00:00:00',	0,	'',	0),
(1953,	'Geburtstag Lewin Gessat',	'',	'2015-03-02',	'00:00:00',	'0000-00-00',	'00:00:00',	0,	'',	0),
(1963,	'Geburtstag Dagmar LiÃƒÅ¸ke',	'',	'2015-03-04',	'00:00:00',	'0000-00-00',	'00:00:00',	0,	'',	0),
(1973,	'Geburtstag Orell Schulte',	'',	'2015-03-15',	'00:00:00',	'0000-00-00',	'00:00:00',	0,	'',	0),
(1983,	'Geburtstag Heinz Meyer',	'',	'2015-05-05',	'00:00:00',	'0000-00-00',	'00:00:00',	3,	'',	33),
(2003,	'Geburtstag Edgar Meyer',	'',	'2015-05-24',	'00:00:00',	'0000-00-00',	'00:00:00',	3,	'',	33),
(2013,	'Geburtstag Brigitte  Schulte',	'',	'2015-05-26',	'00:00:00',	'0000-00-00',	'00:00:00',	3,	'',	33),
(2023,	'Geburtstag Erna Meyer',	'',	'2015-06-11',	'00:00:00',	'0000-00-00',	'00:00:00',	0,	'',	0),
(2043,	'Geburtstag Frieda Lina Meyer',	'',	'2015-07-09',	'00:00:00',	'0000-00-00',	'00:00:00',	0,	'',	0),
(2053,	'Geburtstag Damaris Dreger',	'',	'2015-08-01',	'00:00:00',	'0000-00-00',	'00:00:00',	0,	'',	0),
(2063,	'Geburtstag Sylvia Schulte',	'',	'2015-08-30',	'00:00:00',	'0000-00-00',	'00:00:00',	0,	'',	0),
(2073,	'Geburtstag Antonia Dreger',	'',	'2015-09-10',	'00:00:00',	'0000-00-00',	'00:00:00',	0,	'',	0),
(2083,	'Geburtstag Louis Dreger',	'',	'2015-09-14',	'00:00:00',	'0000-00-00',	'00:00:00',	0,	'',	0),
(2093,	'Geburtstag Christiane Meyer',	'',	'2015-09-20',	'00:00:00',	'0000-00-00',	'00:00:00',	0,	'',	0),
(2103,	'Geburtstag Andrea Dahmann',	'',	'2015-09-30',	'00:00:00',	'0000-00-00',	'00:00:00',	0,	'',	0),
(2113,	'Geburtstag Gerrit Schulte',	'',	'2015-10-23',	'00:00:00',	'0000-00-00',	'00:00:00',	0,	'',	0),
(2123,	'Geburtstag Hartmut Schulte',	'',	'2015-11-21',	'00:00:00',	'0000-00-00',	'00:00:00',	0,	'',	0),
(2133,	'Geburtstag Angelika Weber',	'',	'2015-12-01',	'00:00:00',	'0000-00-00',	'00:00:00',	0,	'',	0),
(2143,	'Geburtstag Miriam Grau',	'',	'2015-12-11',	'00:00:00',	'0000-00-00',	'00:00:00',	0,	'',	0),
(2153,	'Geburtstag Sigrid PlÃƒÂ¼ckhahn',	'',	'2015-12-24',	'00:00:00',	'0000-00-00',	'00:00:00',	0,	'',	0),
(2163,	'beweglicher Ferientag',	'Ferien',	'2014-06-20',	'00:00:00',	'0000-00-00',	'00:00:00',	83,	'',	73),
(2173,	'Ostersonntag\r',	'Ostersonntag\r',	'2014-04-20',	'00:00:00',	'2014-04-20',	'00:00:00',	73,	'',	0),
(2183,	'Ostermontag\r',	'Ostermontag\r',	'2014-04-21',	'00:00:00',	'2014-04-21',	'00:00:00',	73,	'',	0),
(2193,	'Karfreitag\r',	'Karfreitag\r',	'2014-04-18',	'00:00:00',	'2014-04-18',	'00:00:00',	73,	'',	0),
(2203,	'Christi Himmelfahrt\r',	'Christi Himmelfahrt\r',	'2014-05-29',	'00:00:00',	'2014-05-29',	'00:00:00',	73,	'',	0),
(2213,	'Pfingstsonntag\r',	'Pfingstsonntag\r',	'2014-06-08',	'00:00:00',	'2014-06-08',	'00:00:00',	73,	'',	0),
(2223,	'Pfingstmontag\r',	'Pfingstmontag\r',	'2014-06-09',	'00:00:00',	'2014-06-09',	'00:00:00',	73,	'',	0),
(2233,	'Fronleichnam\r',	'Fronleichnam\r',	'2014-06-19',	'00:00:00',	'2014-06-19',	'00:00:00',	73,	'',	0),
(2243,	'Faschingsdienstag\r',	'Faschingsdienstag\r',	'2014-03-04',	'00:00:00',	'2014-03-04',	'00:00:00',	73,	'',	0),
(2253,	'Rosenmontag\r',	'Rosenmontag\r',	'2014-03-03',	'00:00:00',	'2014-03-03',	'00:00:00',	73,	'',	0),
(2263,	'Weiberfastnacht\r',	'Weiberfastnacht\r',	'2014-02-27',	'00:00:00',	'2014-02-27',	'00:00:00',	73,	'',	0),
(2273,	'Vatertag\r',	'Vatertag\r',	'2014-05-29',	'00:00:00',	'2014-05-29',	'00:00:00',	73,	'',	0),
(2283,	'Weltspartag\r',	'Weltspartag\r',	'2014-10-30',	'00:00:00',	'2014-10-30',	'00:00:00',	73,	'',	0),
(2293,	'4. Advent\r',	'4. Advent\r',	'2014-12-21',	'00:00:00',	'2014-12-21',	'00:00:00',	73,	'',	0),
(2303,	'3. Advent\r',	'3. Advent\r',	'2014-12-14',	'00:00:00',	'2014-12-14',	'00:00:00',	73,	'',	0),
(2313,	'2. Advent\r',	'2. Advent\r',	'2014-12-07',	'00:00:00',	'2014-12-07',	'00:00:00',	73,	'',	0),
(2323,	'1. Advent\r',	'1. Advent\r',	'2014-11-30',	'00:00:00',	'2014-11-30',	'00:00:00',	73,	'',	0),
(2333,	'Aschermittwoch\r',	'Aschermittwoch\r',	'2014-03-05',	'00:00:00',	'2014-03-05',	'00:00:00',	73,	'',	0),
(2343,	'Volkstrauertag\r',	'Volkstrauertag\r',	'2014-11-16',	'00:00:00',	'2014-11-16',	'00:00:00',	73,	'',	0),
(2353,	'Ostersonntag\r',	'Ostersonntag\r',	'2015-04-05',	'00:00:00',	'2015-04-05',	'00:00:00',	73,	'',	0),
(2363,	'Ostermontag\r',	'Ostermontag\r',	'2015-04-06',	'00:00:00',	'2015-04-06',	'00:00:00',	73,	'',	0),
(2373,	'Karfreitag\r',	'Karfreitag\r',	'2015-04-03',	'00:00:00',	'2015-04-03',	'00:00:00',	73,	'',	0),
(2383,	'Christi Himmelfahrt\r',	'Christi Himmelfahrt\r',	'2015-05-14',	'00:00:00',	'2015-05-14',	'00:00:00',	73,	'',	0),
(2393,	'Pfingstsonntag\r',	'Pfingstsonntag\r',	'2015-05-24',	'00:00:00',	'2015-05-24',	'00:00:00',	73,	'',	0),
(2403,	'Pfingstmontag\r',	'Pfingstmontag\r',	'2015-05-25',	'00:00:00',	'2015-05-25',	'00:00:00',	73,	'',	0),
(2413,	'Fronleichnam\r',	'Fronleichnam\r',	'2015-06-04',	'00:00:00',	'2015-06-04',	'00:00:00',	73,	'',	0),
(2423,	'Faschingsdienstag\r',	'Faschingsdienstag\r',	'2015-02-17',	'00:00:00',	'2015-02-17',	'00:00:00',	73,	'',	0),
(2433,	'Rosenmontag\r',	'Rosenmontag\r',	'2015-02-16',	'00:00:00',	'2015-02-16',	'00:00:00',	73,	'',	0),
(2443,	'Weiberfastnacht\r',	'Weiberfastnacht\r',	'2015-02-12',	'00:00:00',	'2015-02-12',	'00:00:00',	73,	'',	0),
(2453,	'Vatertag\r',	'Vatertag\r',	'2015-05-14',	'00:00:00',	'2015-05-14',	'00:00:00',	73,	'',	0),
(2463,	'Weltspartag\r',	'Weltspartag\r',	'2015-10-30',	'00:00:00',	'2015-10-30',	'00:00:00',	73,	'',	0),
(2473,	'4. Advent\r',	'4. Advent\r',	'2015-12-20',	'00:00:00',	'2015-12-20',	'00:00:00',	73,	'',	0),
(2483,	'3. Advent\r',	'3. Advent\r',	'2015-12-13',	'00:00:00',	'2015-12-13',	'00:00:00',	73,	'',	0),
(2493,	'2. Advent\r',	'2. Advent\r',	'2015-12-06',	'00:00:00',	'2015-12-06',	'00:00:00',	73,	'',	0),
(2503,	'1. Advent\r',	'1. Advent\r',	'2015-11-29',	'00:00:00',	'2015-11-29',	'00:00:00',	73,	'',	0),
(2513,	'Aschermittwoch\r',	'Aschermittwoch\r',	'2015-02-18',	'00:00:00',	'2015-02-18',	'00:00:00',	73,	'',	0),
(2523,	'Volkstrauertag\r',	'Volkstrauertag\r',	'2015-11-15',	'00:00:00',	'2015-11-15',	'00:00:00',	73,	'',	0),
(2533,	'Ostersonntag\r',	'Ostersonntag\r',	'2016-03-27',	'00:00:00',	'2016-03-27',	'00:00:00',	73,	'',	0),
(2543,	'Ostermontag\r',	'Ostermontag\r',	'2016-03-28',	'00:00:00',	'2016-03-28',	'00:00:00',	73,	'',	0),
(2553,	'Karfreitag\r',	'Karfreitag\r',	'2016-03-25',	'00:00:00',	'2016-03-25',	'00:00:00',	73,	'',	0),
(2563,	'Christi Himmelfahrt\r',	'Christi Himmelfahrt\r',	'2016-05-05',	'00:00:00',	'2016-05-05',	'00:00:00',	73,	'',	0),
(2573,	'Pfingstsonntag\r',	'Pfingstsonntag\r',	'2016-05-15',	'00:00:00',	'2016-05-15',	'00:00:00',	73,	'',	0),
(2583,	'Pfingstmontag\r',	'Pfingstmontag\r',	'2016-05-16',	'00:00:00',	'2016-05-16',	'00:00:00',	73,	'',	0),
(2593,	'Fronleichnam\r',	'Fronleichnam\r',	'2016-05-26',	'00:00:00',	'2016-05-26',	'00:00:00',	73,	'',	0),
(2603,	'Faschingsdienstag\r',	'Faschingsdienstag\r',	'2016-02-09',	'00:00:00',	'2016-02-09',	'00:00:00',	73,	'',	0),
(2613,	'Rosenmontag\r',	'Rosenmontag\r',	'2016-02-08',	'00:00:00',	'2016-02-08',	'00:00:00',	73,	'',	0),
(2623,	'Weiberfastnacht\r',	'Weiberfastnacht\r',	'2016-02-04',	'00:00:00',	'2016-02-04',	'00:00:00',	73,	'',	0),
(2633,	'Vatertag\r',	'Vatertag\r',	'2016-05-05',	'00:00:00',	'2016-05-05',	'00:00:00',	73,	'',	0),
(2643,	'Weltspartag\r',	'Weltspartag\r',	'2016-10-28',	'00:00:00',	'2016-10-28',	'00:00:00',	73,	'',	0),
(2653,	'4. Advent\r',	'4. Advent\r',	'2016-12-18',	'00:00:00',	'2016-12-18',	'00:00:00',	73,	'',	0),
(2663,	'3. Advent\r',	'3. Advent\r',	'2016-12-11',	'00:00:00',	'2016-12-11',	'00:00:00',	73,	'',	0),
(2673,	'2. Advent\r',	'2. Advent\r',	'2016-12-04',	'00:00:00',	'2016-12-04',	'00:00:00',	73,	'',	0),
(2683,	'1. Advent\r',	'1. Advent\r',	'2016-11-27',	'00:00:00',	'2016-11-27',	'00:00:00',	73,	'',	0),
(2693,	'Aschermittwoch\r',	'Aschermittwoch\r',	'2016-02-10',	'00:00:00',	'2016-02-10',	'00:00:00',	73,	'',	0),
(2703,	'Volkstrauertag\r',	'Volkstrauertag\r',	'2016-11-13',	'00:00:00',	'2016-11-13',	'00:00:00',	73,	'',	0),
(2713,	'Tag der deutschen Einheit',	'dt. Einheit',	'2014-10-03',	'00:00:00',	'0000-00-00',	'00:00:00',	73,	'',	0),
(2733,	'08:30 Arm trotzt Arbeit',	'',	'2014-07-31',	'00:00:00',	'0000-00-00',	'00:00:00',	0,	'',	0),
(2743,	'Jahresurlaub Horst',	'',	'2014-07-28',	'00:00:00',	'2014-08-24',	'00:00:00',	13,	'',	63),
(2744,	'Familienurlaub',	'',	'2016-07-18',	'00:00:00',	'2016-08-07',	'00:00:00',	0,	'',	63),
(2745,	'Osterferien Christiane',	'',	'2016-03-21',	'00:00:00',	'2016-04-01',	'00:00:00',	84,	'',	63),
(2746,	'Sommerferien Christiane',	'',	'2016-07-18',	'00:00:00',	'2016-08-07',	'00:00:00',	84,	'',	63),
(2747,	'Herbstferien Christiane',	'',	'2016-10-10',	'00:00:00',	'2016-10-16',	'00:00:00',	84,	'',	63),
(2751,	'Rachel Geburtstag',	'Rachel geb',	'2016-01-19',	'00:00:00',	'2016-01-19',	'00:00:00',	3,	'',	33);

CREATE TABLE `tbltermine_serie` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldbez` varchar(250) COLLATE utf8_bin NOT NULL,
  `fldfarbe` varchar(10) COLLATE utf8_bin NOT NULL,
  `fldimagepfad` varchar(250) COLLATE utf8_bin NOT NULL,
  `fldsel` varchar(1) COLLATE utf8_bin NOT NULL DEFAULT 'J',
  PRIMARY KEY (`fldindex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

INSERT INTO `tbltermine_serie` (`fldindex`, `fldbez`, `fldfarbe`, `fldimagepfad`, `fldsel`) VALUES
(3,	'gelbe Tonne',	'#FFFF00',	'/daten/image/tonne_gelb_trans.png',	'N'),
(13,	'graue Tonne',	'#CD0000',	'/daten/image/tonne_grau_trans.png',	'N'),
(23,	'blaue Tonne',	'',	'/daten/image/tonne_blau_trans.png',	'N'),
(33,	'Geburtstag',	'',	'/daten/image/torte.png',	'J'),
(43,	'Arzttermin',	'',	'',	'N'),
(53,	'AuffÃ¼hrung',	'',	'',	'N'),
(63,	'Urlaub',	'#aaffaa',	'/daten/image/urlaub.jpeg',	'J'),
(73,	'beweglicher Ferientag',	'',	'',	'J');

CREATE TABLE `tbltranslate` (
  `fldIndex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldLang` varchar(5) COLLATE utf8_bin NOT NULL,
  `fldBez` varchar(250) COLLATE utf8_bin NOT NULL,
  `fldName` varchar(200) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldIndex`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


CREATE TABLE `tbltrigger` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldbez` varchar(100) COLLATE utf8_bin NOT NULL,
  `fldid_computer` bigint(20) NOT NULL,
  `fldsettrigger` varchar(1) COLLATE utf8_bin NOT NULL,
  `fldtxttrigger` varchar(4096) COLLATE utf8_bin NOT NULL,
  `fldAnz` int(11) NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


CREATE TABLE `tbluserrotate` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldid_vonuser` bigint(20) NOT NULL,
  `fldid_nachuser` bigint(20) NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

INSERT INTO `tbluserrotate` (`fldindex`, `fldid_vonuser`, `fldid_nachuser`) VALUES
(34,	1,	2),
(44,	2,	3),
(54,	3,	1);

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

INSERT INTO `tblverbesserung` (`fldindex`, `flddatum`, `flduser`, `fldbez`, `fldstatus`, `flddsstatus`, `flddelete`, `fldvorschlag`, `fldprior`, `fldloesung`, `flderldat`, `fldarchivdat`) VALUES
(73,	'2012-08-31 18:00:00',	'Christiane',	'ich fÃƒÂ¤nde es schÃƒÂ¶n, wenn der Tisch abends im Wohnzimmer freigerÃƒÂ¤umt ist, damit man auch mal was abstellen kann. ',	'konflikt',	'NEW',	'N',	'Ich fÃƒÂ¤nde es schÃƒÂ¶n, wenn jeder dazu betrÃƒÂ¤gt, daÃƒÅ¸ abends aufgerÃƒÂ¤umt ist/wird.Jeder hilft mit bei allem - soweit es in seinen FÃƒÂ¤higkeiten und MÃƒÂ¶glichkeiten liegen ( Zeit,Alter,Kraft etc )',	0,	'',	'1900-01-01',	'1900-01-01'),
(74,	'2012-09-01 11:00:00',	'Christiane',	'Ich fÃƒÂ¤nde es schÃƒÂ¶n, wenn das schmutzige Geschirr nach dem essen direkt in die SpÃƒÂ¼lmaschine gerÃƒÂ¤umt wÃƒÂ¼rde ( auch morgens )',	'konflikt',	'NEW',	'N',	'Ich fÃƒÂ¤nde es schÃƒÂ¶n, wenn wir uns bei Haushaltsarbeiten abwechseln, und einer den Tisch deckt und alles wieder abrÃƒÂ¤umt. (Horst)',	0,	'',	'1900-01-01',	'1900-01-01'),
(83,	'2012-09-01 12:12:00',	'Horst',	'Ich fÃƒÂ¤nde es schÃƒÂ¶n, wenn Frieda in Ihrem Bett schlÃƒÂ¤ft und wenn sie rÃƒÂ¼berkommt, nett wieder in Ihr Bett bringt, damit sie sich an ihr Bett gewÃƒÂ¶hnt. Ausnahmen sind Krankheit oder groÃƒÅ¸e Furcht.',	'konflikt',	'NEW',	'N',	'Ich fÃƒÂ¤nde es schÃƒÂ¶n, wenn Frieda so lange in unserem Bett schlafen kÃƒÂ¶nnte bis sie selber entscheidet in ihrem Bett zu schlafen.',	0,	'',	'1900-01-01',	'1900-01-01'),
(93,	'2012-08-31 18:19:00',	'Horst',	'Ich fÃƒÂ¤nde es schÃƒÂ¶n, wenn wir ein gemeinsames Ordnungssystem erarbeiten, dass ÃƒÂ¼ber den Computer erfasst werden kann.',	'erledigt',	'NEW',	'N',	'',	5,	'Ein todo-Liste der Dinge/Ecken die ausgemistet werden sollen, anschliessend Termine ausmachen. Liste der unklaren-Dinge erstellen und absprechen wohin. Hinweis welcher Schrank gerade erfasst wird.',	'2012-09-18',	'1900-01-01'),
(103,	'2012-09-05 18:15:00',	'Horst',	'Ich fÃƒÂ¤nde es schÃƒÂ¶n, wenn Frieda lernt, alleine einzuschlafen.',	'konflikt',	'NEW',	'N',	'',	0,	'',	'1900-01-01',	'1900-01-01'),
(113,	'2012-09-05 18:19:00',	'Horst',	'Ich fÃƒÂ¤nde es schÃƒÂ¶n, wenn die aufgelaufenen Briefe nicht ignoriert wÃƒÂ¼rden, sondern gemeinsam geÃƒÂ¶ffnet wÃƒÂ¼rden, damit wir unsere Probleme gemeinsam lÃƒÂ¶sen und ich nicht damit alleine gelassen werden.',	'konflikt',	'NEW',	'N',	'',	0,	'',	'1900-01-01',	'1900-01-01'),
(123,	'2012-09-05 22:20:00',	'Horst',	'Ich wÃƒÂ¼rde mir wÃƒÂ¼nschen, einen eigenen privaten Bereich zu haben. Z.b. den Schreibtisch im Arbeitszimmer. Dazu gehÃƒÂ¶rt auch das dieser nicht als Ablage benutzt wird!',	'offen',	'NEW',	'N',	'',	0,	'',	'1900-01-01',	'1900-01-01'),
(133,	'2012-09-18 07:07:00',	'Horst',	'Ich fÃƒÂ¤nde es schÃƒÂ¶n, wenn ich einmal in der Woche die Gelegenheit hÃƒÂ¤tte um unsere Rechnungen zu kÃƒÂ¼mmern, ohne das dabei der Fernseher laut lÃƒÂ¤uft, da ich mich dann nicht konzentrieren kann.',	'offen',	'NEW',	'N',	'',	0,	'',	'1900-01-01',	'1900-01-01'),
(134,	'2012-09-23 18:06:00',	'Christiane',	'Ich fÃƒÂ¤nde es schÃƒÂ¶n, wenn alle Familienmitglieder  beim Tischdecken, Tisch abrÃƒÂ¤umen und Tisch abwischen helfen. Jeden Tag.',	'offen',	'NEW',	'N',	'',	0,	'',	'1900-01-01',	'1900-01-01');

CREATE TABLE `tblverpack` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldbez` varchar(250) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


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

INSERT INTO `tblvorrat` (`fldIndex`, `fldv01bez`, `fldv01ort`, `fldv01wo`, `fldv01fach`, `fldv01barcode`, `fldv01menge`, `fldv01me`, `fldv01anzahl`, `fldv01anzme`, `fldv01haltbar`, `fldv01verpack`, `fldv01erfassdat`, `fldv01konto`, `fldv01bild`, `fldv01bemerk`, `fldv01gekauftam`, `fldv01status`, `fldid_me`, `fldid_grundartikel`, `fldmindestmenge`, `fldartikelnr`, `fldid_anzme`) VALUES
(1,	'Kaffeesahne',	19,	11,	0,	'',	4.000,	'DÃƒÂ¶schen',	1,	'',	'2010-11-21',	'Neu',	'2015-05-04 06:06:28',	3,	4,	'',	'0000-00-00',	'(ohne)',	2,	0,	0,	0,	4),
(3,	'Kroketten',	19,	10,	14,	'28595816',	1.000,	'Packung',	0,	'',	'2012-03-12',	'Offen',	'2013-04-08 16:28:47',	3,	0,	'',	'0000-00-00',	'',	0,	0,	0,	0,	0),
(5,	'Lasagne Spinat',	12,	45,	14,	'20217136',	0.500,	'Kg',	1,	'Packung(en)',	'2013-03-01',	'Offen',	'2012-02-23 21:35:57',	3,	5,	'',	'0000-00-00',	'',	0,	0,	0,	0,	0),
(6,	'Klappkiste blau',	12,	44,	14,	'',	1.000,	'StÃƒÂ¼ck',	0,	'',	'1980-01-01',	'Neu',	'2012-06-19 16:16:06',	1,	0,	'',	'0000-00-00',	'',	0,	0,	0,	0,	0),
(7,	'Teppichreiniger',	12,	44,	14,	'7610928070646',	2.000,	'Liter',	0,	'',	'1980-01-01',	'Offen',	'2012-06-19 16:16:06',	1,	0,	'',	'0000-00-00',	'',	0,	0,	0,	0,	0),
(8,	'KÃƒÂ¼chentÃƒÂ¼cher 3 lagig',	12,	44,	14,	'22115669',	3.000,	'StÃƒÂ¼ck',	0,	'',	'1980-01-01',	'Offen',	'2012-06-19 16:16:06',	1,	0,	'',	'0000-00-00',	'',	0,	0,	0,	0,	0),
(9,	'Toilettenpapier 3 lagig',	12,	44,	14,	'',	8.000,	'StÃƒÂ¼ck',	0,	'',	'1980-01-01',	'Offen',	'2012-06-19 16:16:06',	1,	0,	'',	'0000-00-00',	'',	0,	0,	0,	0,	0),
(10,	'Toilettenpapier 3 lagig recycl',	12,	44,	14,	'',	5.000,	'StÃƒÂ¼ck',	0,	'',	'1980-01-01',	'Offen',	'2012-06-19 16:16:06',	1,	0,	'',	'0000-00-00',	'',	0,	0,	0,	0,	0),
(11,	'Speisezwiebeln',	12,	44,	14,	'',	1.000,	'Kg',	0,	'',	'2010-10-16',	'Offen',	'2012-02-23 21:47:52',	3,	0,	'',	'0000-00-00',	'',	0,	0,	0,	0,	0),
(12,	'Bio-Kartoffeln',	12,	44,	14,	'',	2.000,	'Kg',	0,	'',	'2010-09-16',	'Offen',	'2012-02-23 21:47:52',	3,	0,	'',	'0000-00-00',	'',	0,	0,	0,	0,	0),
(13,	'HandgeschirrspÃƒÂ¼lmittel',	12,	44,	14,	'',	1.000,	'Liter',	0,	'',	'1980-01-01',	'Neu',	'2012-06-19 16:16:06',	1,	0,	'',	'0000-00-00',	'',	0,	0,	0,	0,	0),
(14,	'KlarspÃƒÂ¼ler',	12,	44,	14,	'',	1.000,	'Liter',	0,	'',	'1980-01-01',	'Neu',	'2012-06-19 16:16:06',	1,	0,	'',	'0000-00-00',	'',	0,	0,	0,	0,	0),
(15,	'Antifrostmittel',	12,	44,	14,	'',	1.000,	'Liter',	0,	'',	'1980-01-01',	'Neu',	'2012-06-19 16:16:06',	16,	0,	'',	'0000-00-00',	'',	0,	0,	0,	0,	0),
(16,	'Sofix fÃƒÂ¼r alle BÃƒÂ¶den',	12,	44,	14,	'',	1.000,	'Liter',	0,	'',	'1980-01-01',	'Neu',	'2012-06-19 16:16:06',	1,	0,	'',	'0000-00-00',	'',	0,	0,	0,	0,	0),
(18,	'SpÃƒÂ¼lmschinensalz',	12,	44,	14,	'',	2.000,	'Kg',	0,	'',	'1980-01-01',	'Neu',	'2012-06-19 16:16:06',	1,	0,	'',	'0000-00-00',	'',	0,	0,	0,	0,	0),
(19,	'SpÃƒÂ¼lmaschinentabs',	12,	44,	14,	'',	1.000,	'Packung',	0,	'',	'1980-01-01',	'Neu',	'2012-06-19 16:16:06',	1,	0,	'',	'0000-00-00',	'',	0,	0,	0,	0,	0),
(20,	'Hautschutzseife',	12,	45,	14,	'',	9.000,	'StÃƒÂ¼ck',	0,	'',	'1980-01-01',	'Neu',	'2012-06-19 16:16:06',	10,	0,	'',	'0000-00-00',	'',	0,	0,	0,	0,	0),
(21,	'Backpapier',	12,	14,	14,	'',	25.000,	'Blatt',	1,	'Packung(en)',	'1980-01-01',	'Neu',	'2012-06-19 16:16:06',	1,	0,	'',	'0000-00-00',	'',	0,	0,	0,	0,	0),
(22,	'Backpapier',	12,	14,	14,	'',	20.000,	'Meter',	1,	'Packung(en)',	'1980-01-01',	'Neu',	'2012-06-19 16:16:06',	1,	0,	'',	'0000-00-00',	'',	0,	0,	0,	0,	0),
(23,	'Gabelspaghetti',	12,	14,	14,	'',	0.250,	'Kg',	1,	'Packung(en)',	'2012-01-22',	'Neu',	'2012-01-16 17:56:36',	3,	0,	'',	'0000-00-00',	'',	0,	0,	0,	0,	0),
(24,	'Tomatensaft',	12,	14,	14,	'',	1.000,	'Liter',	1,	'Glas',	'2010-05-25',	'Neu',	'2012-01-16 17:56:36',	3,	0,	'',	'0000-00-00',	'',	0,	0,	0,	0,	0),
(25,	'TaschentÃƒÂ¼cher',	12,	14,	14,	'22120731',	21.000,	'PÃƒÂ¤ckchen',	10,	'StÃƒÂ¼ck',	'1980-01-01',	'Neu',	'2012-06-19 16:16:06',	1,	0,	'',	'0000-00-00',	'',	0,	0,	0,	0,	0),
(26,	'Reis',	12,	14,	14,	'',	1.000,	'Kg',	1,	'Packung(en)',	'2011-01-17',	'Offen',	'2012-01-16 17:56:36',	3,	0,	'',	'0000-00-00',	'',	0,	0,	0,	0,	0),
(27,	'Vorratsdose Paniermehl',	12,	14,	14,	'',	0.800,	'Liter',	1,	'Dose',	'2011-09-04',	'Neu',	'2012-01-16 17:56:36',	3,	0,	'',	'0000-00-00',	'',	0,	0,	0,	0,	0),
(28,	'Bienenhonig',	12,	14,	14,	'',	0.500,	'Kg',	1,	'Glas',	'2010-11-01',	'Neu',	'2012-01-16 17:56:36',	3,	0,	'',	'0000-00-00',	'',	0,	0,	0,	0,	0),
(29,	'Kaffeesahne',	12,	15,	14,	'',	20.000,	'DÃƒÂ¶schen',	10,	'g',	'2011-11-21',	'Neu',	'2012-01-16 17:56:36',	3,	4,	'',	'0000-00-00',	'',	0,	0,	0,	0,	0),
(30,	'Haferflocken',	12,	15,	14,	'',	800.000,	'ml',	1,	'Vorratsdose',	'1980-01-01',	'Neu',	'2012-06-19 16:16:06',	1,	0,	'',	'0000-00-00',	'',	0,	0,	0,	0,	0),
(31,	'SemmelknÃƒÂ¶del',	12,	15,	14,	'',	4.000,	'StÃƒÂ¼ck',	0,	'',	'2011-03-01',	'Offen',	'2012-01-16 17:56:36',	3,	0,	'',	'0000-00-00',	'',	0,	0,	0,	0,	0),
(32,	'Reis',	12,	15,	14,	'',	1.000,	'Kg',	1,	'Vorratsglas',	'2011-08-16',	'Offen',	'2012-01-16 17:56:36',	3,	0,	'',	'0000-00-00',	'',	0,	0,	0,	0,	0),
(34,	'Sambal Oelek',	12,	15,	14,	'',	0.200,	'Kg',	1,	'Glas',	'2012-01-19',	'Neu',	'2012-01-16 17:56:36',	3,	0,	'',	'0000-00-00',	'',	0,	0,	0,	0,	0),
(35,	'Multivitaminsaft',	12,	15,	14,	'',	0.500,	'Liter',	1,	'Glas',	'2011-10-01',	'Neu',	'2012-01-16 17:56:36',	3,	0,	'',	'0000-00-00',	'',	0,	0,	0,	0,	0),
(36,	'Kaffee Magenmild',	12,	15,	14,	'',	0.500,	'Kg',	1,	'Packung(en)',	'2011-10-28',	'Neu',	'2012-01-16 17:56:36',	3,	0,	'',	'0000-00-00',	'',	0,	0,	0,	0,	0),
(37,	'Spiralinudeln',	12,	15,	14,	'',	0.500,	'Kg',	1,	'Packung(en)',	'2013-09-13',	'Neu',	'2012-01-16 17:56:36',	3,	21,	'',	'0000-00-00',	'',	0,	0,	0,	0,	0),
(38,	'passierte tomaten',	12,	15,	14,	'',	0.500,	'Kg',	1,	'Packung(en)',	'2012-05-29',	'Neu',	'2012-01-16 17:56:36',	3,	6,	'',	'0000-00-00',	'',	0,	0,	0,	0,	0),
(39,	'Kondensmilch',	12,	15,	14,	'',	0.312,	'Liter',	1,	'Packung(en)',	'2010-08-15',	'Neu',	'2012-01-16 17:56:36',	3,	0,	'',	'0000-00-00',	'',	0,	0,	0,	0,	0),
(40,	'Carokaffee',	12,	15,	14,	'',	0.200,	'Kg',	1,	'Packung(en)',	'2011-09-01',	'Neu',	'2012-01-16 17:56:36',	3,	0,	'',	'0000-00-00',	'',	0,	0,	0,	0,	0),
(41,	'Kakao Tropengold',	19,	17,	14,	'22115164',	0.800,	'Kg',	1,	'Packung(en)',	'2012-06-01',	'Offen',	'2012-01-16 17:56:36',	3,	0,	'',	'0000-00-00',	'',	0,	0,	0,	0,	0),
(42,	'Risottoreis',	12,	15,	14,	'',	0.250,	'Kg',	1,	'Packung(en)',	'2011-12-01',	'Offen',	'2012-01-16 17:56:36',	3,	0,	'',	'0000-00-00',	'',	0,	0,	0,	0,	0),
(43,	'Sesam',	12,	15,	14,	'',	0.200,	'Kg',	1,	'Packung(en)',	'2011-05-28',	'Offen',	'2012-01-16 17:56:36',	3,	0,	'',	'0000-00-00',	'',	0,	0,	0,	0,	0),
(44,	'Spaghetti',	12,	15,	14,	'',	0.500,	'Kg',	1,	'Packung(en)',	'2012-12-01',	'Neu',	'2012-01-16 17:56:36',	3,	0,	'',	'0000-00-00',	'',	0,	0,	0,	0,	0),
(45,	'Cinzano Sekt',	12,	15,	14,	'',	0.750,	'Liter',	1,	'Flasche',	'2020-08-14',	'Neu',	'2012-01-16 17:56:36',	17,	0,	'',	'0000-00-00',	'',	0,	0,	0,	0,	0),
(46,	'Brauner Zucker',	12,	15,	14,	'',	0.500,	'Kg',	2,	'Packung(en)',	'2015-08-14',	'Neu',	'2012-01-16 17:56:36',	3,	0,	'',	'0000-00-00',	'',	0,	0,	0,	0,	0),
(47,	'Linsen',	12,	15,	14,	'',	0.200,	'Kg',	1,	'Packung(en)',	'2011-12-31',	'Offen',	'2012-01-16 17:56:36',	3,	0,	'',	'0000-00-00',	'',	0,	0,	0,	0,	0),
(48,	'EierspÃƒÂ¤tzle',	12,	15,	14,	'',	0.500,	'Kg',	1,	'Packung(en)',	'2013-06-15',	'Neu',	'2012-01-16 17:56:36',	3,	0,	'',	'0000-00-00',	'',	0,	0,	0,	0,	0),
(49,	'Partybecher',	12,	14,	14,	'',	50.000,	'StÃƒÂ¼ck',	0,	'',	'1980-01-01',	'Neu',	'2012-06-19 16:16:06',	1,	0,	'',	'0000-00-00',	'',	0,	0,	0,	0,	0),
(50,	'Partybecher',	12,	14,	14,	'',	9.000,	'StÃƒÂ¼ck',	0,	'',	'1980-01-01',	'Offen',	'2012-06-19 16:16:06',	1,	0,	'',	'0000-00-00',	'',	0,	0,	0,	0,	0),
(51,	'Partybecher',	12,	14,	14,	'',	11.000,	'StÃƒÂ¼ck',	0,	'',	'1980-01-01',	'Offen',	'2012-06-19 16:16:06',	1,	0,	'',	'0000-00-00',	'',	0,	0,	0,	0,	0),
(52,	'Partybecher',	12,	14,	14,	'',	15.000,	'StÃƒÂ¼ck',	0,	'',	'1980-01-01',	'Neu',	'2012-06-19 16:16:06',	1,	0,	'',	'0000-00-00',	'',	0,	0,	0,	0,	0),
(53,	'Partybecher',	12,	14,	14,	'',	16.000,	'StÃƒÂ¼ck',	0,	'',	'1980-01-01',	'Offen',	'2012-06-19 16:16:06',	1,	0,	'',	'0000-00-00',	'',	0,	0,	0,	0,	0),
(54,	'Backmischung',	12,	15,	14,	'',	1.000,	'Kg',	1,	'Packung(en)',	'2011-03-10',	'Neu',	'2012-01-16 17:56:36',	3,	0,	'',	'0000-00-00',	'',	0,	0,	0,	0,	0),
(55,	'Bambussprossen',	12,	15,	14,	'',	0.175,	'Kg',	1,	'Glas',	'2011-07-16',	'Neu',	'2012-01-16 17:56:36',	3,	0,	'',	'0000-00-00',	'',	0,	0,	0,	0,	0),
(56,	'Brotaufstrich Joghurt-GemÃƒÂ¼se',	12,	14,	14,	'',	0.125,	'Kg',	2,	'Packung(en)',	'2011-06-11',	'Neu',	'2012-01-16 17:56:36',	3,	0,	'',	'0000-00-00',	'',	0,	0,	0,	0,	0),
(57,	'champignons',	12,	14,	14,	'',	0.000,	'',	0,	'',	'2011-06-17',	'Neu',	'2012-01-16 17:56:36',	3,	0,	'',	'0000-00-00',	'',	0,	0,	0,	0,	0),
(108,	'Kartoffeln',	12,	44,	14,	'4049928647757',	2.000,	'Kg',	1,	'Sack',	'2010-09-25',	'Neu',	'2012-02-23 21:47:52',	3,	22,	'',	'0000-00-00',	'',	0,	0,	0,	0,	0),
(107,	'Trauben kernlos',	19,	20,	14,	'4049929629042',	0.500,	'Kg',	1,	'Packung(en)',	'2010-09-04',	'Neu',	'2012-01-16 17:56:36',	3,	8,	'',	'0000-00-00',	'',	0,	0,	0,	0,	0),
(106,	'Broccoli',	19,	0,	0,	'4049928161185',	0.500,	'Kg',	1,	'StÃ¼ck',	'2010-09-04',	'Neu',	'2015-05-04 05:28:45',	3,	9,	'',	'0000-00-00',	'(ohne)',	0,	0,	0,	0,	0),
(105,	'Sojaschnitzel',	19,	11,	0,	'22130259',	0.175,	'Kg',	4,	'StÃ¼ck',	'2010-11-05',	'Neu',	'2015-05-04 05:57:44',	3,	11,	'',	'0000-00-00',	'(ohne)',	2,	0,	0,	0,	0),
(104,	'GemÃƒÂ¼sebrÃƒÂ¼he',	12,	15,	14,	'22113139',	0.140,	'Kg',	1,	'Glas',	'2011-09-01',	'Neu',	'2012-01-16 17:56:36',	1,	20,	'',	'0000-00-00',	'',	0,	0,	0,	0,	0),
(102,	'Toastbrot',	19,	11,	14,	'22136084',	0.500,	'Kg',	1,	'Packung(en)',	'2010-09-04',	'Neu',	'2012-01-16 17:56:36',	3,	13,	'',	'0000-00-00',	'',	0,	0,	0,	0,	0),
(103,	'Windeln',	21,	13,	14,	'22125927',	44.000,	'StÃƒÂ¼ck',	1,	'Verpackung(en)',	'1980-01-01',	'Neu',	'2012-06-19 16:16:06',	5,	0,	'',	'0000-00-00',	'',	0,	0,	0,	0,	0),
(101,	'Spiralinudeln',	12,	14,	14,	'22111326',	0.500,	'Kg',	1,	'Verpackung(en)',	'2013-07-26',	'Neu',	'2012-01-16 17:56:36',	3,	21,	'',	'0000-00-00',	'',	0,	0,	0,	0,	0),
(100,	'Rahmspinat',	19,	10,	14,	'22113566',	0.450,	'Kg',	1,	'Packung(en)',	'2011-08-24',	'Neu',	'2012-01-16 17:56:36',	3,	17,	'',	'0000-00-00',	'',	0,	0,	0,	0,	0),
(99,	'O-Saft',	23,	13,	14,	'22131201',	1.500,	'Liter',	6,	'Flasche(n)',	'2011-03-31',	'Neu',	'2012-01-16 17:56:36',	3,	18,	'',	'0000-00-00',	'',	0,	0,	0,	0,	0),
(98,	'Milch (Frischmilch)',	19,	11,	14,	'22130112',	1.000,	'Liter',	1,	'Packung(en)',	'2010-09-13',	'Neu',	'2012-01-16 17:56:36',	3,	12,	'',	'0000-00-00',	'',	0,	0,	0,	0,	0),
(97,	'kleines Brot - Hannover Schnitten',	19,	11,	14,	'29706938',	0.500,	'Kg',	1,	'Packung(en)',	'2010-09-01',	'Neu',	'2012-01-16 17:56:36',	3,	14,	'',	'0000-00-00',	'',	0,	0,	0,	0,	0),
(96,	'Kiwi',	19,	20,	14,	'4020959000001',	4.000,	'StÃƒÂ¼ck',	1,	'Packung(en)',	'2010-09-04',	'Neu',	'2012-01-16 17:56:36',	3,	7,	'',	'0000-00-00',	'',	0,	0,	0,	0,	0),
(95,	'Butter',	19,	11,	14,	'22116505',	0.250,	'Kg',	1,	'Packung(en)',	'2010-09-27',	'Neu',	'2012-01-16 17:56:36',	3,	15,	'',	'0000-00-00',	'',	0,	0,	0,	0,	0),
(94,	'Ãƒâ€pfel Braeburn',	19,	20,	14,	'4020959000001',	6.000,	'StÃƒÂ¼ck',	1,	'Packung(en)',	'2010-09-04',	'Neu',	'2012-01-16 17:56:36',	3,	10,	'',	'0000-00-00',	'',	0,	0,	0,	0,	0),
(93,	'Apfelschorle',	23,	13,	14,	'001',	1.500,	'Liter',	6,	'Flasche(n)',	'2011-02-01',	'Neu',	'2012-01-16 17:56:36',	3,	19,	'',	'0000-00-00',	'',	0,	0,	0,	0,	0),
(109,	'Schokolade Orange',	19,	11,	14,	'22133540',	0.125,	'Kg',	1,	'Packung(en)',	'2010-12-01',	'Neu',	'2012-01-16 17:56:36',	17,	16,	'',	'0000-00-00',	'',	0,	0,	0,	0,	0),
(110,	'Pheromonfalle',	19,	25,	14,	'',	1.000,	'Stck',	0,	'',	'1980-01-01',	'Offen',	'2012-06-19 16:16:06',	1,	0,	'',	'0000-00-00',	'',	0,	0,	0,	0,	0),
(113,	'Laserdrucker Samsung CLP-300',	31,	36,	37,	'',	1.000,	'StÃƒÂ¼ck',	0,	'',	'1980-01-01',	'Defekt',	'2012-06-19 16:16:06',	1,	0,	'',	'0000-00-00',	'',	0,	0,	0,	0,	0),
(123,	'HP-Farblaserdrucker Laserjet 1525n',	31,	36,	37,	'',	1.000,	'StÃƒÂ¼ck',	0,	'',	'1980-01-01',	'Neu',	'2013-05-13 21:26:53',	1,	0,	'',	'0000-00-00',	'',	0,	0,	0,	0,	0),
(173,	'Badeschuhe Chris',	23,	573,	0,	'',	0.000,	'',	0,	'',	'0000-00-00',	'Neu',	'2013-04-19 05:16:18',	12,	0,	'',	'0000-00-00',	'',	0,	0,	0,	0,	0),
(183,	'Badeschuhe Horst',	23,	553,	0,	'',	0.000,	'',	0,	'',	'0000-00-00',	'Neu',	'2013-04-19 05:15:27',	12,	0,	'',	'0000-00-00',	'',	0,	0,	0,	0,	0),
(193,	'GlÃƒÂ¼hbirne 350 lm E27 LED',	23,	93,	373,	'',	1.000,	'StÃƒÂ¼ck',	0,	'',	'0000-00-00',	'Neu',	'2012-10-21 08:33:10',	33,	0,	'',	'2012-08-30',	'',	0,	0,	0,	0,	0),
(203,	'Butterbrotspapier',	19,	32,	14,	'',	0.000,	'',	0,	'',	'0000-00-00',	'Fehlt',	'2012-09-11 16:27:54',	1,	0,	'',	'0000-00-00',	'',	0,	0,	0,	0,	0),
(213,	'Energiesparlampe 440lm E27',	51,	233,	373,	'',	1.000,	'StÃƒÂ¼ck',	0,	'',	'0000-00-00',	'Neu',	'2012-10-21 08:32:17',	33,	0,	'',	'2012-10-21',	'',	0,	0,	0,	0,	0),
(223,	'Lampe MR11 12V 20W',	51,	383,	393,	'',	1.000,	'StÃƒÂ¼ck',	0,	'',	'0000-00-00',	'Neu',	'2012-10-21 08:35:36',	33,	0,	'',	'2012-10-21',	'',	0,	0,	0,	0,	0),
(233,	'Kaffeevollautomat',	49,	263,	0,	'',	1.000,	'',	0,	'',	'0000-00-00',	'Defekt',	'2014-12-27 16:06:15',	1,	1,	'',	'0000-00-00',	'(ohne)',	0,	0,	0,	0,	0),
(243,	'Bohrmaschine',	23,	293,	453,	'',	1.000,	'StÃƒÂ¼ck',	0,	'',	'0000-00-00',	'Neu',	'2013-01-03 21:05:18',	1,	0,	'',	'0000-00-00',	'',	0,	0,	0,	0,	0),
(253,	'Halogenlampe E14',	21,	363,	14,	'',	1.000,	'',	0,	'',	'0000-00-00',	'Neu',	'2013-04-17 19:17:55',	33,	0,	'',	'2013-03-27',	'',	0,	0,	0,	0,	0),
(263,	'Schuh',	41,	523,	0,	'',	0.000,	'',	0,	'',	'0000-00-00',	'',	'2013-04-17 19:12:24',	12,	0,	'',	'0000-00-00',	'',	0,	0,	0,	0,	0),
(273,	'Unterlagen',	31,	293,	14,	'',	0.000,	'',	0,	'',	'0000-00-00',	'',	'2013-05-08 17:11:17',	53,	0,	'',	'0000-00-00',	'',	0,	0,	0,	0,	0),
(283,	'Halogenstrahler',	31,	723,	733,	'',	0.000,	'',	0,	'',	'0000-00-00',	'',	'2013-05-10 05:32:13',	33,	0,	'',	'0000-00-00',	'',	0,	0,	0,	0,	0),
(284,	'Schere',	19,	263,	1853,	'',	1.000,	'',	1,	'',	'0000-00-00',	'',	'2014-12-27 14:28:53',	1,	24,	'',	'0000-00-00',	'OK',	0,	0,	0,	0,	0),
(285,	'Tesafilm',	19,	263,	1853,	'',	0.000,	'',	0,	'',	'0000-00-00',	'',	'2014-12-27 15:20:39',	1,	25,	'',	'0000-00-00',	'offen',	0,	0,	0,	0,	0),
(286,	'Schneekugel',	52,	783,	1693,	'',	0.000,	'',	0,	'',	'0000-00-00',	'',	'2014-12-27 16:35:06',	0,	27,	'',	'0000-00-00',	'(ohne)',	0,	0,	0,	0,	0);

CREATE TABLE `tblvorschlaege` (
  `fldIndex` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `fldBez` char(80) DEFAULT '0',
  `fldBenutzer` char(20) DEFAULT NULL,
  `fldDatum` char(16) DEFAULT NULL,
  `fldStatus` char(10) DEFAULT 'Neu',
  PRIMARY KEY (`fldIndex`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

INSERT INTO `tblvorschlaege` (`fldIndex`, `fldBez`, `fldBenutzer`, `fldDatum`, `fldStatus`) VALUES
(2,	'Kochplan einbauen',	'Christiane',	'04.03.2010 19:40',	'in Bearbei'),
(3,	'wÃ¶chentliche Aufgabenverteilung Haushalt',	'Christiane',	'25.01.2010 20:19',	'Neu'),
(4,	'Neuigkeiten eintragen',	'Horst',	'05.04.2010 20:16',	'erledigt'),
(5,	'Seitenhintergrund gestalten',	'Christiane',	'23.01.2010 23:55',	'Schwierig'),
(6,	'Familienphotos einfÃ¼gen',	'Christiane',	'25.01.2010 20:19',	'Neu'),
(7,	'monatliche Besonderheiten, Erlebnisse festhalten ( Jahresrundbrief )',	'Christiane',	'23.01.2010 23:31',	'erledigt'),
(8,	'Neuigkeiten Ã¼ber Frieda, Entwicklung, Anekdoten etc',	'Christiane',	'25.01.2010 20:19',	'Neu'),
(9,	'Geburtstagskalender mit Erinnerung einbauen',	'Christiane',	'25.01.2010 20:19',	'Neu'),
(10,	'Kindergarten Termine zum eintragen',	'Horst',	'07.04.2010 22:34',	'Neu');

CREATE TABLE `tblvo_category` (
  `fldIndex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldBez` varchar(250) NOT NULL,
  `fldSort` varchar(20) NOT NULL,
  `fldProz` int(11) NOT NULL,
  `fldid_obercat` bigint(20) NOT NULL,
  PRIMARY KEY (`fldIndex`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


CREATE TABLE `tblvo_obercategory` (
  `fldIndex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldBez` varchar(250) NOT NULL,
  `fldSort` varchar(20) NOT NULL,
  `fldProz` int(11) NOT NULL,
  PRIMARY KEY (`fldIndex`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


CREATE TABLE `tblvo_usercategory` (
  `fldIndex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldid_user` bigint(20) NOT NULL,
  `fldid_category` bigint(20) NOT NULL,
  `fldProz` int(11) NOT NULL,
  `fldid_zimmer` bigint(20) NOT NULL,
  PRIMARY KEY (`fldIndex`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


CREATE TABLE `tblwaehrungen` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldwaehrung` varchar(10) COLLATE utf8_bin NOT NULL,
  `fldbez` varchar(250) COLLATE utf8_bin NOT NULL,
  `fldkurs` decimal(10,2) NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


CREATE TABLE `tblwunschliste` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldbez` varchar(250) COLLATE utf8_bin NOT NULL,
  `fldlink` varchar(250) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

INSERT INTO `tblwunschliste` (`fldindex`, `fldbez`, `fldlink`) VALUES
(3,	'Joomla Programmierbuch',	'http://localhost/webportal/wunschliste/index.php'),
(13,	'raspberry pi',	''),
(23,	'gehÃƒÂ¤use fÃƒÂ¼r raspberry pi',	''),
(33,	'GeldzÃƒÂ¤hlmaschine',	''),
(43,	'Riemen fÃƒÂ¼r Akkordeon',	''),
(53,	'DLan Adapter (ÃƒÂ¼ber Steckdose)',	''),
(63,	'Folk-CD z.B. Loreena Mc Kennit',	'');

CREATE TABLE `tblzeitpunkt` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldbez` varchar(100) COLLATE utf8_bin NOT NULL,
  `fldvonuhrzeit` time NOT NULL,
  `fldbisuhrzeit` time NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

INSERT INTO `tblzeitpunkt` (`fldindex`, `fldbez`, `fldvonuhrzeit`, `fldbisuhrzeit`) VALUES
(1,	'morgens',	'05:00:00',	'12:00:00'),
(2,	'abends',	'17:00:00',	'20:00:00');

CREATE TABLE `tblzeitraum` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldbez` varchar(10) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


CREATE TABLE `tblzutaten` (
  `fldindex` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldid_rezepte` bigint(20) NOT NULL,
  `fldid_grundartikel` bigint(20) NOT NULL,
  `fldmenge` varchar(50) NOT NULL,
  `fldid_me` bigint(20) NOT NULL,
  `fldbez` varchar(250) NOT NULL,
  PRIMARY KEY (`fldindex`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


CREATE TABLE `tblzwieart` (
  `fldart` varchar(20) COLLATE utf8_bin NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

INSERT INTO `tblzwieart` (`fldart`) VALUES
('Kritik'),
('Frage');

CREATE TABLE `viewrechtsschutz` (`fldlastname` varchar(255), `fldstreet` varchar(250), `fldplz` varchar(10), `fldtown` varchar(250));


CREATE TABLE `viewstatuszimmer` (`fldindex` bigint(20), `fldbez` varchar(20));


CREATE TABLE `zlux_categories` (
  `category_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(40) COLLATE utf8_bin NOT NULL DEFAULT '',
  `sequence` int(2) unsigned NOT NULL DEFAULT '1',
  `rpeat` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `public` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `color` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `background` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `check1` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `label1` varchar(40) COLLATE utf8_bin NOT NULL DEFAULT 'approved',
  `mark1` varchar(10) COLLATE utf8_bin NOT NULL DEFAULT 'ok',
  `check2` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `label2` varchar(40) COLLATE utf8_bin NOT NULL DEFAULT 'complete',
  `mark2` varchar(10) COLLATE utf8_bin NOT NULL DEFAULT '&#10003;',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


CREATE TABLE `zlux_events` (
  `event_id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `event_type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `title` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `description` text COLLATE utf8_bin,
  `category_id` int(4) unsigned NOT NULL DEFAULT '1',
  `venue` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `user_id` int(6) unsigned DEFAULT NULL,
  `editor` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `private` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `checked` text COLLATE utf8_bin,
  `s_date` date DEFAULT NULL,
  `e_date` date NOT NULL DEFAULT '9999-00-00',
  `x_dates` text COLLATE utf8_bin,
  `s_time` time DEFAULT NULL,
  `e_time` time NOT NULL DEFAULT '99:00:00',
  `r_type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `r_interval` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `r_period` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `r_month` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `r_until` date NOT NULL DEFAULT '9999-00-00',
  `notify` tinyint(1) NOT NULL DEFAULT '-1',
  `not_mail` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `a_date` date NOT NULL DEFAULT '9999-00-00',
  `m_date` date NOT NULL DEFAULT '9999-00-00',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`event_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


CREATE TABLE `zlux_settings` (
  `name` varchar(15) COLLATE utf8_bin NOT NULL DEFAULT '',
  `value` text COLLATE utf8_bin,
  `description` text COLLATE utf8_bin
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


CREATE TABLE `zlux_users` (
  `user_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `user_name` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `password` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `temp_password` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `sedit` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `privs` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `login_0` date NOT NULL DEFAULT '9999-00-00',
  `login_1` date NOT NULL DEFAULT '9999-00-00',
  `login_cnt` int(8) NOT NULL DEFAULT '0',
  `language` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `color` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


DROP TABLE IF EXISTS `viewrechtsschutz`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `viewrechtsschutz` AS select `tbladr_liste`.`fldlastname` AS `fldlastname`,`tbladr_liste`.`fldstreet` AS `fldstreet`,`tbladr_liste`.`fldplz` AS `fldplz`,`tbladr_liste`.`fldtown` AS `fldtown` from (`tbladr_liste` join `tbladr_lstgrp`) where ((`tbladr_lstgrp`.`fldid_group` = 13) and (`tbladr_lstgrp`.`fldid_liste` = `tbladr_liste`.`fldindex`));

DROP TABLE IF EXISTS `viewstatuszimmer`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `viewstatuszimmer` AS select `stat`.`fldindex` AS `fldindex`,`stat`.`fldbez` AS `fldbez` from ((`tblstatus` `stat` join `tblstat_grp` `grp`) join `tblstat_zuord` `zuord`) where ((`stat`.`fldindex` = `zuord`.`fldid_status`) and (`grp`.`fldindex` = `zuord`.`fldid_grp`) and (`grp`.`fldindex` = 43));

-- 2016-01-22 21:47:42
