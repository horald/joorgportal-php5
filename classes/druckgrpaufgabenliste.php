<?php
header("content-type: text/html; charset=utf-8");
session_start();
$menu=$_GET['menu'];
include("../sites/views/wp_".$menu."/showtab.inc.php");
include ("../config.php");
$dbselarr = $_SESSION['DBSELARR'];
$count=sizeof($dbselarr)-1;
$frstdat="9999-99-99";
$lastdat="0000-00-00";
for ( $x = 0; $x <= $count; $x++ ) {
  $qrysel = "SELECT * FROM tblaufgabenplan WHERE fldindex=".$dbselarr[$x];
  $ressel = mysql_query($qrysel) or die(mysql_error().$qrysel);
  $linsel = mysql_fetch_array($ressel);
  if ($linsel['flddatum']<$frstdat) {
    $frstdat=$linsel['flddatum'];
  }
  if ($linsel['flddatum']>$lastdat) {
    $lastdat=$linsel['flddatum'];
  }
}
echo "<html>";
echo "<link rel='stylesheet' type='text/css' href='style.css' />";
echo "<body>";
$timestamp = time();
$datum = date("d.m.Y",$timestamp);
$uhrzeit = date("H:i",$timestamp);
echo "<h4>".$pararray['headline']." am ".$datum." um ".$uhrzeit." Uhr<br>";
echo "von ".substr($frstdat,8,2).".".substr($frstdat,5,2)." bis ".substr($lastdat,8,2).".".substr($lastdat,5,2)."</h4><br>";
echo "<table border='3'>";
echo "<tr class='tabAuswahl'>";
echo "<td width='20'>Nr</td>";
echo "<td width='200'>Aufgabe</td>";
echo "<td width='400'>Benutzer</td>";
echo "</tr>";
echo "</table>";
echo "<table border='3'>";
$count=0;
mysql_query("SET NAMES 'utf8'");
 $query = "SELECT * FROM tblaufgabenliste ";
 $result = mysql_query($query) or die(mysql_error().$query);
while ($line = mysql_fetch_array($result)) { 
 echo "<tr height='35'>";
 $nr=$x+1;
 echo "<td width='20'>".$nr."</td>";
 echo "<td width='200'>".$line['fldbez']."</td>";
 echo "<td width='400'></td>";
 echo "</tr>";
 $qrygrp = "SELECT DISTINCT fldid_benutzer FROM tblaufgabenplan WHERE fldid_aufgabe=".$line['fldindex']." AND flddatum>='".$frstdat."' AND flddatum<='".$lastdat."'";

 $resgrp = mysql_query($qrygrp);
 while ($lingrp = mysql_fetch_array($resgrp)) {
   echo "<tr height='35'>";
   echo "<td width='20'>.</td>";
   echo "<td width='200'>.</td>";
//   echo "<td width='100'>.</td>";
//   echo "<td width='400'>".$lingrp[fldbez]."</td>";
   $qryusr="SELECT * FROM tblbenutzer WHERE fldindex=".$lingrp['fldid_benutzer'];
   $resusr = mysql_query($qryusr);
   $linusr = mysql_fetch_array($resusr);
   echo "<td width='400'>".$linusr['fldbez']."</td>";
   echo "</tr>";
 }
 
}
mysql_free_result($result);
mysql_close();
echo "</table><br>";
echo "</body>";
echo "</html>";
?>
