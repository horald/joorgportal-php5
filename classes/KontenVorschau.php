<html>
<link rel="stylesheet" type="text/css" href="style.css" />
<body>
<?PHP
$menu=$_GET[menu];
include("../sites/views/wp_".$menu."/showtab.inc.php");
$dbtable=$pararray['dbtable'];
$timestamp = time();
$datum = date("d.m.Y",$timestamp);
$uhrzeit = date("H:i",$timestamp);
echo "<h1>Kontenliste vom ".$datum." - ".$uhrzeit." Uhr</h1>";
echo "<table border'3'>";
include ("../config.php");
$query = "SELECT sum(fldPreis*fldAnz) as Betrag, fldKonto, fldOrt FROM ".$dbtable." WHERE fldArchivDat='' GROUP BY fldOrt, fldKonto ORDER BY fldOrt, fldKonto";
//echo $query."<br>";
$result = mysql_query($query); 
?>
<tr class="tabAuswahl">
<td width="400">Bezeichnung</td>
<td width="50">Betrag</td>
<td width="70">Konto</td>
</tr>
</table>
<table border="3">
<?PHP
$AlterOrt = "###";
$sum=0;
$gessum=0;
while ($line = mysql_fetch_array($result)) { 
 if ($AlterOrt != "###" and $AlterOrt!=$line[fldOrt]) { 
?>   
 <tr height="35" class="tabOhne" style="background-color:#ffff66;">
 <td width="400">Zwischensumme:</td>
 <td width="50" align="right"><?PHP echo $sum;?></td>
 <td width="70">.</td>
<?php
   $sum=0;
   } 
 $gpreis = $line[Betrag]; $sum=$sum + $gpreis; $gessum=$gessum+$gpreis?>
 <tr height="35">
 <td width="400"><?PHP echo htmlentities($line[fldOrt]." Einkauf");?></td>
 <td width="50" align="right"><?PHP echo sprintf("%.2f",$gpreis);?></td>
 <td width="70"><?PHP echo $line[fldKonto];?></td>
 </tr>
 <?PHP
 $AlterOrt = $line[fldOrt];
} ?>
 <tr height="35" class="tabOhne" style="background-color:#ffff66;">
 <td width="400">Zwischensumme:</td>
 <td width="50" align="right"><?PHP echo sprintf("%.2f",$sum);?></td>
 <td width="70">.</td>
 <tr height="35" class="tabOhne" style="background-color:#ffff66;">
 <td width="400" style="background-color:#ffff66;">Gesamtsumme:</td>
 <td width="50" align="right"><?PHP echo sprintf("%.2f",$gessum);?></td>
 <td width="70">.</td>
 </tr>
<?PHP
mysql_free_result($result);
mysql_close();
?>
</table><br>
</body>
</html>

