<?php

function druckstundenplanauswahl($arrelement) {

  $qry="SELECT * FROM tblfilter WHERE fldfeld = 'fldid_user'";
  $res = mysql_query($qry) or die(mysql_error());
  $lin = mysql_fetch_array($res);
  $flduserid=$lin['fldwert'];
  
  echo "<form name='eingabe' class='form-horizontal' method='post' action='druckstundenplan.php?drucken=1' enctype='multipart/form-data'>";
  echo "  <fieldset>";
      echo "          <div class='control-group'>";
      echo "            <label class='control-label' style='text-align:left' for='input01'>Benutzer</label>";

        $fquery = "SELECT * FROM tblbenutzer";
        $fresult = mysql_query($fquery) or die(mysql_error());
        echo "  <select name='benutzer' size='1'>";
        while ($fline = mysql_fetch_array($fresult)) {
          $strstatus = $fline['fldbez'];
          if ($flduserid == $fline['fldindex']) {
            echo "<option style='background-color:#c0c0c0;' value=".$fline['fldindex']." selected>".$strstatus."</option>";
          } else {
            echo "<option style='background-color:#c0c0c0;' value=".$fline['fldindex']." >".$strstatus."</option>";
          }  
        }
        echo "  </select>";
	  
      echo "          </div>";
  echo "  <div class='form-actions'>";
  echo "     <button type='submit' name='submit' class='btn btn-primary'>Speichern</button>";
  echo "     <button class='btn'>Abbruch</button>";
  echo "  </div>";
  echo "  </fieldset>";
  echo "</form>";
}


function druckstundenplan($benutzerid) {
include ("../config.php");
echo "<html>";
echo "<link rel='stylesheet' type='text/css' href='css/style.css' />";
echo "<body>";
$query="SELECT * FROM tblbenutzer WHERE fldindex=".$benutzerid;
$result = mysql_query($query) or die(mysql_error().$query);
$line = mysql_fetch_array($result);
echo "<h1>Stundenplan f&uumlr ".$line['fldbez']."</h1>";
echo "<table border='1' style='background-image:url(".$line['fldbackgroundfilename'].")'>";
echo "<tr height='50'>";
$query="SELECT * FROM tblstdwotag";
$result = mysql_query($query) or die(mysql_error().$query);
$anzsp=0;
$arrSpInd = array();
while ($line = mysql_fetch_array($result)) {
  if ($line['fldfarbe']<>"") { 
    echo "<td width='200' style='background-color:".$line['fldfarbe']."; font-size:24px; text-shadow: 1px 0 black, 0 -1px black; padding-left: 5px;'>".$line['fldbez']."</td>";
  } else {
    echo "<td width='200' style='background-color:#ff0000; font-size:24px; text-shadow: 1px 0 black, 0 -1px black; padding-left: 5px;'>".$line['fldbez']."</td>";
  }	
  $arrSpInd[] = $line[fldindex];
  $anzsp=$anzsp+1;
}  
echo "</tr>";

$query="SELECT * FROM tblstdzeit ORDER BY fldbez";
$result = mysql_query($query) or die(mysql_error().$query);
while ($line = mysql_fetch_array($result)) { 
  echo "<tr height='50'>";
  echo "<td width='200' style='font-size:24px; text-shadow: 1px 0 black, 0 -1px black; padding-left: 5px;'>".$line['fldbez']."</td>";
  for ($i = 2; $i <= $anzsp; $i++) {
    $qrystd="SELECT * FROM tblstdplan WHERE fldid_user=".$benutzerid." AND fldid_wotag=".$arrSpInd[$i-1]." AND fldid_std=".$line['fldindex'];
//	echo $qrystd."<br>";
    $resstd = mysql_query($qrystd) or die(mysql_error().$qrystd);
    if ($linstd = mysql_fetch_array($resstd)) { 
      echo "<td width='200' style='font-size:24px; text-shadow: 1px 0 black, 0 -1px black; padding-left: 5px;'>".$linstd['fldbez']."</td>";
	} else {
      echo "<td width='200' class='tabWotag'>.</td>";
	}  
  }  
  echo "</tr>";
}  
echo "</table>";
echo "</body>";
echo "</html>";
}

?>