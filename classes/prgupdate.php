<?php
include("bootstrapfunc.php");
include("prgupdatefunc.php");
bootstraphead();
bootstrapbegin("Programmupdate");

$version=$_POST['version'];
if ($version<>"") {
  neue_version_pruefen($version);
} else {

$prgupdate=$_GET['prgupdate'];
switch ($prgupdate) {
  case 1:
    echo "<a class='btn btn-primary' href='prgupdate.php?prgupdate=0'>Zur&uumlck zur Auswahl</a><br><br>";
	//neue_version_pruefen();
  break;
  case 2:
    manueller_download();
  break;
  case 3:
    $datei="joorgportal-alpha-0311-update.zip";
    download_entpacken($datei);
  break;
  case 6:
    echo "<a class='btn btn-primary' href='prgupdate.php?prgupdate=0'>Zur&uumlck zur Auswahl</a><br>";
    update_download($_GET['neueversion'],$_GET['file']);

  break;
  case 7:
    if (isset($_REQUEST['submit'])) {
    	$gver=$_POST['updvers'];
    	$datei="joorgportal-alpha-".$gver."-update.zip";
      update_download($gver,$datei);
    } else {	 
      echo "<a class='btn btn-primary' href='prgupdate.php?prgupdate=0'>Zur&uumlck zur Auswahl</a><br>";
    }  
  
  break;
  default:
    //$datei="http://sourceforge.net/projects/joorgportal/files/latest/download?source=directory"; 
    $startseite=$_SERVER['PHP_SELF'];
    $startseite=substr($startseite,0,strlen($startseite)-21);

    $servername=$_SERVER['SERVER_NAME'];
    $port=$_SERVER['SERVER_PORT'];
    $pfad="http://".$servername.":".$port.$_SERVER['PHP_SELF'];
    echo "<form method='POST' action='http://www.horald.de/joorgportal/joorgportalversion.php'>";
    echo "<input type='hidden' name='pfad' value='".$pfad."'>";
    echo "<div class='row-fluid'><div class='span3'><button class='btn btn-primary btn-lg btn-block' type='submit' name='submit' class='btn btn-primary'>Auf neue Version prüfen</button></div><div class='span8'>Es wird geprüft, ob eine neue Version bereit steht und ggfs. heruntergeladen.</div></div>";
    echo "</form>";

//    echo "<div class='row-fluid'><div class='span3'><a class='btn btn-primary btn-lg btn-block' href='prgupdate.php?prgupdate=1'>Auf neue Version prüfen</a></div><div class='span8'>Es wird geprüft, ob eine neue Version bereit steht und ggfs. heruntergeladen.</div></div>";
    echo "<div class='row-fluid'><div class='span3'><a class='btn btn-primary btn-lg btn-block' href='prgupdate.php?prgupdate=2'>Manueller Download</a></div><div class='span8'>Mit angabe der Versionsnummer kann das Update direkt heruntergeladen werden.</div></div>";
    echo "<div class='row-fluid'><div class='span3'><a class='btn btn-primary btn-lg btn-block' href='prgupdate.php?prgupdate=3'>Download entpacken</a></div><div class='span8'>Eine heruntergeladene Version entpacken.</div></div>";
    echo "<div class='row-fluid'><div class='span3'><a class='btn btn-primary btn-lg btn-block' href='".$startseite."' target='_blank'>Restart für Update</a></div><div class='span8'>Joorgportal neu starten um den Aktualisierungsprozess zu starten.</div></div>";
    echo "<div class='row-fluid'><div class='span3'><a class='btn btn-primary btn-lg btn-block' href='../welcome.php'>Zurück zur Startseite</a></div><div class='span8'> </div></div>";
}
}

bootstrapend();
?>