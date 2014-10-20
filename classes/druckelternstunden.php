<?php
header("content-type: text/html; charset=utf-8");
session_start();
echo "<html>";
echo "<link rel='stylesheet' type='text/css' href='style.css' />";
echo "<body>";
include ("../config.php");
$dbselarr = $_SESSION['DBSELARR'];
$count=sizeof($dbselarr);
//$query = "SELECT * FROM tblelternstunden WHERE fldarchivdat='1900-01-01' ORDER BY flddatum,fldRang";
$query="SELECT * FROM tblelternstunden WHERE fldindex=".$dbselarr[0];	
$result = mysql_query($query) or die(mysql_error().$query);
$line = mysql_fetch_array($result);
$qryktj = "SELECT * FROM tblkitajahr WHERE fldindex=".$line['fldid_kitajahr'];
$resktj = mysql_query($qryktj) or die(mysql_error().$qryktj);
$linktj = mysql_fetch_array($resktj);
echo "<h3>Elternstunden vom ".$linktj['fldbez']."</h3>";
$qryktu = "SELECT * FROM tblbenutzer WHERE fldindex=".$line['fldid_kitauser'];
$resktu = mysql_query($qryktu) or die(mysql_error().$qryktu);
$linktu = mysql_fetch_array($resktu);
echo "<h4>".$linktu['fldfullname']."</h4>";
echo "<table border='3'>";
echo "<tr class='tabAuswahl'>";
echo "<td width='100'>Datum</td>";
echo "<td width='300'>Bezeichner</td>";
echo "<td width='100'>Anwender</td>";
echo "<td width='50'>Std</td>";
echo "</tr>";
echo "</table>";
echo "<table border='3'>";
$sum=0;
for ( $x = 0; $x < $count; $x++ )
{
 $query="SELECT * FROM tblelternstunden WHERE fldindex=".$dbselarr[$x];	
 //$query = "SELECT * FROM tbltc_reiseliste ORDER BY fldgepaeck";
 $result = mysql_query($query) or die(mysql_error().$query);
 $line = mysql_fetch_array($result);
//while ($line = mysql_fetch_array($result)) {
 $sum=$sum+$line['fldstunden'];	 
 echo "<tr height='35'>";
 $datum=$line['flddatum'];
 $datum=substr($datum,8,2).".".substr($datum,5,2).".".substr($datum,0,4);
 echo "<td width='100'>".$datum."</td>";
 echo "<td width='300'>".$line[fldbez]."</td>";
 echo "<td width='100'>".$line[fldAnwender]."</td>";
 echo "<td width='50' align='right'>".$line[fldstunden]."</td>";
 echo "</tr>";
}
mysql_free_result($result);
mysql_close();
echo "</table><br>";
echo "<table border='3'>";
        echo "<tr><td>Summe </td><td align='right'> ".sprintf("%.2f",$sum)."</td></tr>";
        $soll=24;
        echo "<tr><td>Soll-Std </td><td align='right'> ".sprintf("%.2f",$soll)."</td></tr>";
        $diff=$soll-$sum;
        echo "<tr><td>Rest </td><td align='right'> ".sprintf("%.2f",$diff)."</td></tr>";
echo "</table><br>";
echo "</body>";
echo "</html>";
?>
