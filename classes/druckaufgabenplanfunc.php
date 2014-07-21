<?php
header("content-type: text/html; charset=utf-8");

function druckaufgabenplan($datum,$dbtable,$prtfield,$prtuser,$orderby,$hoehe,$anzzl) {
include ("../config.php");
if ($orderby<>"") {
  $orderby=" ORDER BY ".$orderby;
}
if ($hoehe=="") {
  $hoehe=110;
}
if ($anzzl=="") {
  $anzzl=4;
}
echo "<html>";
echo "<link rel='stylesheet' type='text/css' href='css/style.css' />";
echo "<body>";
echo "<table border='1'>";
echo "<tr height='50'>";
echo "<td width='200'> </td>";
echo "<td width='200' class='tabWotag'>User</td>";
echo "<td width='200' class='tabWotag'>Montag</td>";
echo "<td width='200' class='tabWotag'>Dienstag</td>";
echo "<td width='200' class='tabWotag'>Mittwoch</td>";
echo "<td width='200' class='tabWotag'>Donnerstag</td>";
echo "<td width='200' class='tabWotag'>Freitag</td>";
echo "<td width='200' class='tabWotag'>Samstag</td>";
echo "<td width='200' class='tabWotag'>Sonntag</td>";
echo "</tr>";
//$datum=$_GET['datum'];
$date = explode('-', $datum);
$Y = $date[0];
$M = $date[1];
$D = $date[2];  
$t = mktime(0,0,0,$M,$D,$Y);
$wt = date('w',$t);
if (isset($date)) {
  if ($wt == 0) {
    $D = $D - 6;
  } else {
    $D = $D - $wt + 1;
  }  
  $t = mktime(0,0,0,$M,$D,$Y);
  $datum = date('Y-m-d',$t);
  //echo "Übergabedatum:".$wt.":".$datum."<br>";
}
$date = $datum;
$date = explode('-',$date);
//  $date = explode('-', $line[flddatum]);
$Y = $date[0];
$M = $date[1];
$D = $date[2];
$t = mktime(0,0,0,$M,$D,$Y);
for ($ikw = 1; $ikw <= $anzzl; $ikw++) {
  $vondatum = date('d.m.',$t);
  $bisD = $D + 6;
  $t = mktime(0,0,0,$M,$bisD,$Y);
  $bisdatum = date('d.m.',$t);
  $qryuser="SELECT tblbenutzer.fldindex as benutzerid,tblbenutzer.fldbez as fldbez,tblaufgabenbenutzer.fldfarbe as fldfarbe, tblaufgabenbenutzer.fldfarbeWE as fldfarbeWE FROM tblbenutzer,tblaufgabenbenutzer WHERE tblbenutzer.fldindex=fldid_benutzer";
  $resuser = mysql_query($qryuser) or die(mysql_error());
  while ($linuser = mysql_fetch_array($resuser)) {
    echo "<tr height='".$hoehe."'>";
    echo "<td>".$vondatum."-".$bisdatum."</td>";
    echo "<td style='background-color:".$linuser['fldfarbe'].";'>".strtoupper($linuser['fldbez'])."</td>";
    for ($i = 1; $i <= 7; $i++) {
      $t = mktime(0,0,0,$M,$D,$Y);
      $wheredatum = date('Y-m-d',$t);
      $t = mktime(0,0,0,$M,$D+1,$Y);
      $query = "SELECT * FROM ".$dbtable." WHERE fldid_benutzer=".$linuser[benutzerid]." AND flddatum='$wheredatum'".$orderby;
      //echo $query."=qry<br>";
      $result = mysql_query($query) or die(mysql_error());
      $D = $D + 1;
      if ($i == 7) {
        echo "<td style='background-color:".$linuser['fldfarbeWE'].";' class='tabSonntag'>";
      } else {  
        if ($i == 6) {
          echo "<td style='background-color:".$linuser['fldfarbeWE'].";' class='tabSamstag'>";
        } else {
          echo "<td style='background-color:".$linuser['fldfarbe'].";'>";
        }  
      }  
      //$line = mysql_fetch_array($result);
      $olduserid="";
      while ($line = mysql_fetch_array($result)) {
        $wert=$line[$prtfield];
//        if ($wert == '') {
//          $id=$line[fldid_rezepte];
//          if ($id!="") {
//            $fquery = "SELECT * FROM tblrezepte WHERE fldIndex=".$id;
            //echo $fquery."<br>";
//            $fresult = mysql_query($fquery) or die(mysql_error().$fquery);//            $fline = mysql_fetch_array($fresult);
//            $wert=$fline['fldBez'];       
//          } else {
//            $wert=".";
//          }  
//        }  
        echo "<div>".$wert."</div>";
      }  
      echo "</td>";
    }
    $D = $D - 7;  
  }
  echo "</tr>";
  echo "<tr style='background-color:#AAAAAA'>";
  for ($i = 1; $i <= 9; $i++) {
    echo "<td> </td>";
  }  
  echo "</tr>";
  $D = $D + 7;
}  
echo "</table>";
echo "</body>";
echo "</html>";
}

function druckaufgabenplanauswahl($dbtable,$prtfield,$prtuser,$orderby) {
  echo "<form name='eingabe' class='form-horizontal' method='post' action='druckaufgabenplan.php?drucken=1' enctype='multipart/form-data'>";
  echo "  <fieldset>";
      echo "          <div class='control-group'>";
      echo "            <label class='control-label' style='text-align:left' for='input01'>Datum</label>";
        $datum=date("Y-m-d");
?>
        <input type="Text" id=druckdatum name=druckdatum value='<?php echo $datum; ?>' >
        <img src="images2/cal.gif" onclick="javascript:NewCssCal('druckdatum','yyyyMMdd','ARROW')" style="cursor:pointer"/>
<?php 
      echo "          </div>";
  echo "  <div class='control-group'>";
  echo "    <label class='control-label' style='text-align:left' for='input01'>H&oumlhe</label>";
  echo "    <input type='text' name=hoehe value='50' >";
  echo "  </div>";
  echo "  <div class='control-group'>";
  echo "    <label class='control-label' style='text-align:left' for='input01'>Anzahl Zeilen</label>";
  echo "    <input type='text' name=anzzl value='4' >";
  echo "  </div>";
  echo "  <input type='hidden' name=dbtable value='".$dbtable."' >";
  echo "  <input type='hidden' name=prtfield value='".$prtfield."' >";
  echo "  <input type='hidden' name=prtuser value='".$prtuser."' >";
  echo "  <input type='hidden' name=orderby value='".$orderby."' >";
  echo "  <div class='form-actions'>";
  echo "     <button type='submit' name='submit' class='btn btn-primary'>Speichern</button>";
  echo "     <button class='btn'>Abbruch</button>";
  echo "  </div>";
  echo "  </fieldset>";
  echo "</form>";
}


?>