<?PHP
header('Last-Modified: '.date('D, d M Y H:i:s T'));   // always modified
header('Expires: 0');   // always already expired
header('Pragma: no-cache');   // HTTP/1.0
header('Cache-Control: private, no-store, no-cache, must-revalidate, max-age=0');   // HTTP/1.1
header('Cache-Control: post-check=0, pre-check=0', false);   // for IE 5+  

include("connection.php");
include("calendar.php");

$objCalendar = new calendar();

$objCalendar->setMode($_GET['nMode']);
$objCalendar->setKW($_GET['nKW'], $_GET['nJahr']);
$objCalendar->setAnzZeilenProStunde($_GET['nAnzZeilenProStunde']);
$objCalendar->setZeilenHoehe($_GET['nZeilenHoehe']);
$objCalendar->setStunden($_GET['nDisplayStundenVon'],$_GET['nDisplayStundenBis']);

if ($_GET['aktion']=='refreshHeader') {
	$objCalendar->fetchTableHeader();
}

if ($_GET['aktion']=='refreshBody') {
	$objCalendar->fetchEvents();
}

if ($_GET['aktion']=='move') {
	$aUpdate = array();
	
	$aTage = $objCalendar->getDays();
		
	$aDaySplit  = explode('.', $aTage[$_GET['nTag']]['formatiert']);
	
	$nHeight = (substr(trim($_GET['nHeight']), 0, -2)-1);
	$nTop    = (substr(trim($_GET['nTop']), 0, -2)-1);
	
	// Timestamps
	$nTimeStampTag   = mktime(0, 0, 0, $aDaySplit[1], $aDaySplit[0], $aDaySplit[2]);
	$nStart          = ($nTop / $_GET['nZeilenHoehe'] / $_GET['nAnzZeilenProStunde'] * 60*60) + ($_GET['nDisplayStundenVon']*60*60);
	$nEnde           = $nStart + ($nHeight / $_GET['nZeilenHoehe'] / $_GET['nAnzZeilenProStunde'] * 60*60);
	
	$nStartTimeStamp = $nTimeStampTag+$nStart;
	$nEndTimeStamp   = $nTimeStampTag+$nEnde;
	
	$dtStart = date('Y-m-d H:i:s',$nStartTimeStamp);
	$dtEnde  = date('Y-m-d H:i:s',$nEndTimeStamp);
	
	$aColumn['dtvon'] = $dtStart;
	$aColumn['dtbis'] = $dtEnde;
	
	if (($nStartTimeStamp<$nEndTimeStamp) && (date('Y-m-d',$nStartTimeStamp) == date('Y-m-d',$nEndTimeStamp))) {
	  $objCalendar->updateEvent($_GET['nId'], $aColumn);
	}
}

if ($_GET['aktion']=='resize') {
	$aUpdate = array();
	$aEvent  = $objCalendar->getEventDetails($_GET['nId']);
	
	$nHeight = (substr(trim($_GET['nHeight']), 0, -2)-1);
	$nTop    = (substr(trim($_GET['nTop']), 0, -2)-1);
	
	// Timestamps
	$nTimeStampTag   = mktime(0, 0, 0, $aEvent['monat'], $aEvent['tag'], $aEvent['jahr']);
	$nStart          = ($nTop / $_GET['nZeilenHoehe'] / $_GET['nAnzZeilenProStunde'] * 60*60) + ($_GET['nDisplayStundenVon']*60*60);
	$nEnde           = $nStart + ($nHeight / $_GET['nZeilenHoehe'] / $_GET['nAnzZeilenProStunde'] * 60*60);
	
	$nStartTimeStamp = $nTimeStampTag+$nStart;
	$nEndTimeStamp   = $nTimeStampTag+$nEnde;
	
	$dtStart = date('Y-m-d H:i:s',$nStartTimeStamp);
	$dtEnde  = date('Y-m-d H:i:s',$nEndTimeStamp);
	
	$aColumn['dtvon'] = $dtStart;
	$aColumn['dtbis'] = $dtEnde;
	
	if (($nStartTimeStamp<$nEndTimeStamp) && (date('Y-m-d',$nStartTimeStamp) == date('Y-m-d',$nEndTimeStamp)) && (date('H:i',$nEndTimeStamp) != '00:00')) {
	  $objCalendar->updateEvent($_GET['nId'], $aColumn);
	}	
}

if ($_GET['aktion']=='addDD') {
	$aDays = $objCalendar->getDays();
	
	// Timestamps
	$nTimeStampTag   = $aDays[$_GET['nTag']]['timestamp'];
	$nStart          = ($_GET['nTop'] / $_GET['nZeilenHoehe'] / $_GET['nAnzZeilenProStunde'] * 60*60) + ($_GET['nDisplayStundenVon']*60*60);
	$nEnde           = $nStart + ($_GET['nHeight'] / $_GET['nZeilenHoehe'] / $_GET['nAnzZeilenProStunde'] * 60*60);
	
	$nStartTimeStamp = $nTimeStampTag+$nStart;
	$nEndTimeStamp   = $nTimeStampTag+$nEnde;	
	
	$dtStart = date('Y-m-d H:i:s',$nStartTimeStamp);
	$dtEnde  = date('Y-m-d H:i:s',$nEndTimeStamp);	
	
  echo $objCalendar->addEvent($_GET['sBez'], $_GET['sBesch'], $dtStart, $dtEnde, $_GET['sColor']);
}

if ($_GET['aktion']=='add') {
	echo $objCalendar->addEvent($_GET['sBez'], $_GET['sBesch'], $_GET['dtVon'], $_GET['dtBis'], $_GET['sColor']);
}

if ($_GET['aktion']=='remove') {
	$objCalendar->removeEvent($_GET['nId']);
}

if ($_GET['aktion']=='newTermin') {
  echo '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
        <html>
          <head>
            <link rel="stylesheet" href="stylesheet.css" type="text/css">
          </head>
          <body>';
	// Timestamps
	
	if ($_GET['terminAdd']==true) {
	  $arrTag = explode('.', $_GET['dtDatum']);
	  $dtTag = $arrTag[2].'-'.$arrTag[1].'-'.$arrTag[0];
	  
	  $arrVon = explode(':', $_GET['dtVon']);
	  $dtVon = $arrVon[0].':'.$arrVon[1].':00';
	  $dtVon = $dtTag.' '.$dtVon;
	  
	  $arrBis = explode(':', $_GET['dtBis']);
	  $dtBis = $arrBis[0].':'.$arrBis[1].':00';	 
	  $dtBis = $dtTag.' '.$dtBis; 
	  
	  $objCalendar->addEvent($_GET['sBetreff'], $_GET['sText'], $dtVon, $dtBis, $_GET['sFarbe']);
	  
	  echo "<script>";
	  echo "top.getLayer(1); ";
	  echo "top.hideMe(); ";
	  echo "</script>";
	} else {  	
  	$aDays           = $objCalendar->getDays();
  	$nTimeStampTag   = $aDays[$_GET['nTag']]['timestamp'];
  	$nStart          = ($_GET['nTop'] / $_GET['nZeilenHoehe'] / $_GET['nAnzZeilenProStunde'] * 60*60) + ($_GET['nDisplayStundenVon']*60*60);
  	$nEnde           = $nStart + ($_GET['nHeight'] / $_GET['nZeilenHoehe'] / $_GET['nAnzZeilenProStunde'] * 60*60);
  		
  	$nStartTimeStamp = $nTimeStampTag+$nStart;
  	$nEndTimeStamp   = $nTimeStampTag+$nEnde;	
  	
  	$dtDatum = date('d.m.Y',$nTimeStampTag);
  	$dtStart = date('H:i',$nStartTimeStamp);
  	$dtEnde  = date('H:i',$nEndTimeStamp);	
  	$objCalendar->getNewEventLayer(1, '', '', '', $dtDatum, $dtStart, $dtEnde);  
	}
	echo '  </body>
	      </html>';
}



if ($_GET['s']!='') {
  include_once("loader_frame.html");
}

mysql_close($con);
?>