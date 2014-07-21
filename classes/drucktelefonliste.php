<?php
session_start();
header("content-type: text/html; charset=utf-8");
echo "<html>";
echo "<link rel='stylesheet' type='text/css' href='style.css' />";
echo "<body>";
$timestamp = time();
$datum = date("d.m.Y",$timestamp);
$uhrzeit = date("H:i",$timestamp);
echo "<h3>Adressliste vom ".$datum." - ".$uhrzeit." Uhr</h3><br>";
$wert=$_GET['wert'];
if ($wert<>"(ohne)") {
  echo "Gruppe: ".$wert."<br><br>";
}  
echo "<table border='3'>";
include ("../config.php");
if ($wert<>"(ohne)") {
  $qrygrp = "SELECT * FROM tbladr_group WHERE fldbez='".$wert."'";
  $resgrp = mysql_query($qrygrp) or die(mysql_error().$qrygrp);
  $lingrp = mysql_fetch_array($resgrp);
  $fldindex = $lingrp[fldindex];
  //echo $fldindex."=index<br>";
  $query = "SELECT * FROM tbladr_liste,tbladr_lstgrp WHERE tbladr_liste.fldindex=tbladr_lstgrp.fldid_liste AND tbladr_lstgrp.fldid_group=".$fldindex." ORDER BY fldlastname";
  //echo $query."<br>";
  //$query = "SELECT * FROM tbladr_liste ORDER BY fldlastname";
} else { 
  $query = "SELECT * FROM tbladr_liste ORDER BY fldlastname";
}  
$result = mysql_query($query) or die(mysql_error().$query);
echo "<tr class='tabAuswahl'>";
echo "<td width='100'>Vorname</td>";
echo "<td width='100'>Name</td>";
echo "<td width='300'>Telefonnummer</td>";
echo "</tr>";
echo "</table>";
echo "<table border='3'>";
$dbselarr = $_SESSION['DBSELARR'];
$count=sizeof($dbselarr);
for ( $x = 0; $x < $count; $x++ ) {
//while ($line = mysql_fetch_array($result)) { 
  $query="SELECT * FROM tbladr_liste WHERE fldindex=".$dbselarr[$x];	
  $result = mysql_query($query) or die(mysql_error().$query);
  $line = mysql_fetch_array($result);
 echo "<tr height='35'>";
 echo "<td width='100'>".$line[fldfirstname]."</td>";
 echo "<td width='100'>".$line[fldlastname]."</td>";
 echo "<td width='300'>".$line[fldtelefon]."</td>";
 echo "</tr>";
}
mysql_free_result($result);
mysql_close();
echo "</table><br>";
echo "</body>";
echo "</html>";
?>
