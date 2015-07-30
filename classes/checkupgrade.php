<?php

function getactvers() {
  include("../config.php");
  $query="SELECT * FROM tblversion ORDER BY fldversion";
  $result = mysql_query($query) or die("Error using mysql_query($sql): ".mysql_error());
  $line = mysql_fetch_array($result);
  while ($line = mysql_fetch_array($result)) {
    $arr=$line;
  }
  $versnr=$line['fldversion'];
  mysql_close();
  return $versnr;
}

function check_version() {
  $ini_array = parse_ini_file("https://github.com/horald/joorgportal/blob/master/version.txt");
  $versnr=$ini_array['versnr'];
  $ini_locarr = parse_ini_file("http://localhost/own/joorgportal/version.txt");
  $locvers=$ini_locarr['versnr'];
  $actvers=getactvers();	
  if ($locvers<$versnr) {
    echo "<div class='alert alert-info'>";
    echo "<a href='classes/checkupdate.php?actvers=".$locvers."'>Neue Version ".$versnr." verfügbar</a>";
    echo "</div>";
  } else {  
    if ($actvers<$versnr) {
      echo "<div class='alert alert-info'>";
      echo "<a href='classes/installupdate.php?newvers=".$versnr."'>Auf neue Version ".$versnr." aktualisieren</a>";
      echo "</div>";
    }
  }  
}

?>