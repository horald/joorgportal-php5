<?php
header("content-type: text/html; charset=utf-8");
echo "<html>";
echo "<link rel='stylesheet' type='text/css' href='style.css' />";
echo "<body>";
$timestamp = time();
$datum = date("d.m.Y",$timestamp);
$uhrzeit = date("H:i",$timestamp);
echo "<h3>Adressliste vom ".$datum." - ".$uhrzeit." Uhr</h3><br>";
echo "<table border='3'>";
include ("../config.php");
$query = "SELECT * FROM tbladr_liste ORDER BY fldlastname";
$result = mysql_query($query);
echo "<tr class='tabAuswahl'>";
echo "<td width='20'>Nr</td>";
echo "<td width='100'>Vorname</td>";
echo "<td width='100'>Name</td>";
echo "<td width='400'>Gruppe</td>";
echo "</tr>";
echo "</table>";
echo "<table border='3'>";
$count=0;
while ($line = mysql_fetch_array($result)) { 
 $count++;
 echo "<tr height='35'>";
 echo "<td width='20'>".$count."</td>";
 echo "<td width='100'>".$line[fldfirstname]."</td>";
 echo "<td width='100'>".$line[fldlastname]."</td>";
 echo "<td width='400'></td>";
 echo "</tr>";
 $qrygrp = "SELECT * FROM tbladr_group AS gr, tbladr_lstgrp WHERE fldid_group=gr.fldindex AND fldid_liste=".$line[fldindex];
 $resgrp = mysql_query($qrygrp);
 while ($lingrp = mysql_fetch_array($resgrp)) {
   echo "<tr height='35'>";
   echo "<td width='20'>.</td>";
   echo "<td width='100'>.</td>";
   echo "<td width='100'>.</td>";
   echo "<td width='400'>".$lingrp[fldbez]."</td>";
   echo "</tr>";
 } 
}
mysql_free_result($result);
mysql_close();
echo "</table><br>";
echo "</body>";
echo "</html>";
?>
