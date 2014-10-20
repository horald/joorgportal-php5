<?php
session_start();
include ("../config.php");
echo "Kalorien ermitteln.";
$dbselarr = $_SESSION['DBSELARR'];
$count=sizeof($dbselarr);
for ( $x = 0; $x < $count; $x++ ) {
  $query="SELECT * FROM tblrezepte WHERE fldIndex=".$dbselarr[$x];	
  //echo $query."<br>";	
  $result = mysql_query($query) or die(mysql_error().$query);
  $line = mysql_fetch_array($result);
  $qryzutat="SELECT * FROM tblzutaten WHERE fldid_rezepte=".$dbselarr[$x];	
  $reszutat = mysql_query($qryzutat) or die(mysql_error().$qryzutat);
  $kcal=0;
  while ($linzutat = mysql_fetch_array($reszutat)) {
  	 $qryart="SELECT * FROM tblgrundartikel WHERE fldindex=".$linzutat['fldid_grundartikel']; 
    $resart = mysql_query($qryart) or die(mysql_error().$qryart);
    $linart = mysql_fetch_array($resart);
    $kcal=$kcal+$linart['fldkalorien']*$linart['fldfaktor']*$linzutat['fldmenge'];
  }  
  echo $line['fldBez']." | Neue Kalorien: ".$kcal."<br>";
  $qryins="UPDATE tblrezepte SET fldkalorien=".$kcal." WHERE fldIndex=".$dbselarr[$x];
  $resins = mysql_query($qryins) or die(mysql_error().$qryins);
}
?>