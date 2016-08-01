<?php
header("content-type: text/html; charset=utf-8");
session_start();
echo "<html>";
echo "<link rel='stylesheet' type='text/css' href='style.css' />";
echo "<body>";
$timestamp = time();
$datum = date("d.m.Y",$timestamp);
$uhrzeit = date("H:i",$timestamp);
echo "<h3>Reiseliste vom ".$datum." - ".$uhrzeit." Uhr</h3><br>";
echo "<table border='3'>";
include ("../config.php");
//$query = "SELECT * FROM tbltc_reiseliste ORDER BY fldgepaeck";
//$result = mysql_query($query) or die(mysql_error().$query);
echo "<tr class='tabAuswahl'>";
echo "<td width='20'>A</td>";
echo "<td width='300'>Bezeichnung</td>";
echo "<td width='200'>Gepaeck</td>";
echo "<td width='80'>Status</td>";
echo "<td width='100'>Benutzer</td>";
echo "</tr>";
echo "</table>";
echo "<br>";
echo "<table border='3'>";
$dbselarr = $_SESSION['DBSELARR'];
$count=sizeof($dbselarr);
$gepaeckid=-1;
for ( $x = 0; $x < $count; $x++ )
{
 $query="SELECT * FROM tbltc_reiseliste WHERE fldindex=".$dbselarr[$x];	
 //$query = "SELECT * FROM tbltc_reiseliste ORDER BY fldgepaeck";
 $result = mysql_query($query) or die(mysql_error().$query);
 $line = mysql_fetch_array($result);
 if ($x>0) {
   if ($gepaeckid!=$line['fldid_gepaeck']) {
     echo "</table>";
     echo "<br>";
     echo "<table border='3'>";
   } 
 }	
//while ($line = mysql_fetch_array($result)) { 
 echo "<tr height='35'>";
 echo "<td width='20'>".$line[fldAnz]."</td>";
 echo "<td width='300'>".$line[fldbez]."</td>";
 $gepaeckid=$line[fldid_gepaeck];
 $qrygepaeck = "SELECT * FROM tblgepaeck WHERE fldindex=".$line[fldid_gepaeck];
 $resgepaeck = mysql_query($qrygepaeck) or die(mysql_error().$qrygepaeck);
 $lingepaeck = mysql_fetch_array($resgepaeck);
 echo "<td width='200'>".$lingepaeck['fldbez']."</td>";
 echo "<td width='80'>".$line[fldstatus]."</td>";
 $qryuser = "SELECT * FROM tblbenutzer WHERE fldindex=".$line[fldid_benutzer];
 $resuser = mysql_query($qryuser) or die(mysql_error().$qryuser);
 $linuser = mysql_fetch_array($resuser);
 echo "<td width='100'>".$linuser[fldbez]."</td>";
 echo "</tr>";
}
mysql_free_result($result);
mysql_close();
echo "</table><br>";
echo "</body>";
echo "</html>";
?>
