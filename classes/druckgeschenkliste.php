<?php
header("content-type: text/html; charset=utf-8");
session_start();
echo "<html>";
echo "<link rel='stylesheet' type='text/css' href='style.css' />";
echo "<body>";
$timestamp = time();
$datum = date("d.m.Y",$timestamp);
$uhrzeit = date("H:i",$timestamp);
echo "<h3>Geschenkeliste vom ".$datum." - ".$uhrzeit." Uhr</h3><br>";
echo "<table border='3'>";
include ("../config.php");
echo "<tr class='tabAuswahl'>";
echo "<td width='20'>Nr</td>";
echo "<td width='300'>Bezeichnung</td>";
echo "<td width='50'>Preis</td>";
echo "<td width='100'>f&uumlr</td>";
echo "<td width='200'>von</td>";
echo "</tr>";
echo "</table>";
echo "<br>";
echo "<table border='3'>";
$dbselarr = $_SESSION['DBSELARR'];
$count=sizeof($dbselarr);
$gepaeckid=-1;
for ( $x = 0; $x < $count; $x++ )
{
 $query="SELECT * FROM tblgeschenke WHERE fldindex=".$dbselarr[$x];	
 $result = mysql_query($query) or die(mysql_error().$query);
 $line = mysql_fetch_array($result);
 echo "<tr height='35'>";
 $nr=$x+1;
 echo "<td width='20'>".$nr."</td>";
 echo "<td width='300'>".$line[fldbez];
 $wert=$line[fldimage];
 if ($wert>0) { 
   echo '<br><img src="meinbild.php?id='. $wert .'" alt="Keine Bildanzeige" />';
 }
 echo "</td>";
 echo "<td width='50'>".$line[fldpreis]."</td>";
 echo "<td width='100'>".$line[fldbeschenkter]."</td>";
 echo "<td width='200'>".$line[fldvon]."</td>";
 echo "</tr>";
}
mysql_free_result($result);
mysql_close();
echo "</table><br>";
echo "</body>";
echo "</html>";
?>
