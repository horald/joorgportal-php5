<?php

function neue_version_pruefen($neueVersion) {
  include("../config.php");
  echo "<div class='alert alert-info'>Neue Version pr&uumlfen</div>";
  
  if ($neueVersion=="") {
    echo "<div class='alert alert-info'>";
    echo "Verbindungsfehler! Ermittlung der aktuellen Version nicht m&oumlglich.<br>";
    if ($proxy<>"") { 
      echo "Proxy:".$proxy;
	}  
    echo "</div>";
  } else {
    if ($neueVersion>$updvers) {
      echo "<div class='alert alert-info'>";
      echo "Aktuelle Version:".$updvers."<br>";
      echo "Neue Version....:".$neueVersion."<br>";
      echo $txtupdatemessage."<br>";
      //$nver=substr($neueVersion,3,1);
      //$gver=substr($gversion,2,4).$nver;
      $gver=$neueVersion;
      echo "<a class='btn btn-primary' href='prgupdate.php?prgupdate=6&neueversion=".$gver."&file=joorgportal-alpha-".$gver."-update.zip'>Download Update</a> ";
      echo "<a class='btn btn-primary' href='prgupdate.php?file=joorgportal-alpha-".$gver."-update.zip'>Unzip File</a><br>";
      echo "</div>";
    } else {
      echo "<div class='alert alert-success'>";
      echo "Sie haben die aktuelle Programmversion. (".$version.")";
      echo "</div>";
    }
  }  
}

function manueller_download() {
include("../config.php");
  echo "<form class='form-horizontal' method='post' action='prgupdate.php?prgupdate=7'>";
  echo "<fieldset>";
  echo "<div class='control-group'>";
  echo "Version: ";
  echo "<input type='text' name='updvers' value='".$updvers."'>";
  echo "  <div class='form-actions'>";
  echo "     <button type='submit' name='submit' class='btn btn-primary'>OK</button>";
  echo "     <button class='btn'>Abbruch</button>";
  echo "  </div>";
  echo "</div>";
  echo "</fieldset>";
  echo "</form>";
}

function update_download($neueversion,$datei) {
  echo "<div class='alert alert-success'>";
  echo "Neue Version: ".$neueversion;
  echo "</div>";
  $datei="http://sourceforge.net/projects/joorgportal/files/joorgportal30/alpha/".$datei."/download";
  echo "<a class='btn btn-primary' href='".$datei."' target='_blank'>Update herunterladen</a>";
}

function download_entpacken($datei) {
include("../config.php");
  $pfad=$_SERVER['SCRIPT_NAME'];
  $pfad=substr($pfad,0,strlen($pfad)-21);
  $pfad=$_SERVER['DOCUMENT_ROOT'].$pfad;
  echo "<div class='alert alert-info'>";
  echo "Entpacken wird gestartet...<br>";
  echo "nach ".$pfad;
  echo "</div>";
  
$zip = new ZipArchive;
if ($zip->open($downloadpath.$datei) === TRUE) {
    $zip->extractTo($pfad);
    $zip->close();
    echo "<div class='alert alert-success'>";
    echo 'Erfolgreich entpacken!';
    echo "</div>";
} else {
    echo "<div class='alert alert-warning'>";
    echo 'Fehler beim entpacken!';
    echo "</div>";
}  
}

?>