<html>
<link rel="stylesheet" type="text/css" href="style.css" />
<body>
<?PHP
session_start();
$timestamp = time();
$datum = date("d.m.Y",$timestamp);
$uhrzeit = date("H:i",$timestamp);
?>
<h1>Einkaufsliste vom <?PHP echo $datum," - ",$uhrzeit," Uhr"; ?></h1>
<table border"3">
<?PHP include ("../config.php");
//$query = "SELECT * FROM tblEinkauf_liste WHERE fldArchivDat='' ORDER BY fldOrt, fldAbteilung, fldSort, fldBez";
//$result = mysql_query($query); ?>
<tr class="tabAuswahl">
<td width="5">Nr</td>
<td width="400">Bezeichnung</td>
<td width="30">Anz</td>
<td width="40">E-Preis</td>
<td width="50">G-Preis</td>
<td width="70">Kaufort</td>
<td width="140">Abteilung</td>
</tr>
</table>
<table border="3">
<?PHP
$AlterOrt = "###";
$sum=0;
$gessum=0;
$dbselarr = $_SESSION['DBSELARR'];
$count=sizeof($dbselarr);
for ( $x = 0; $x < $count; $x++ ) {
//while ($line = mysql_fetch_array($result)) { 
 $query="SELECT * FROM tblEinkauf_liste WHERE fldindex=".$dbselarr[$x]." ORDER BY fldOrt, fldAbteilung, fldSort, fldBez";	
 $result = mysql_query($query) or die(mysql_error().$query);
 $line = mysql_fetch_array($result);
 if ($AlterOrt != "###" and $AlterOrt!=$line[fldOrt]) { 
 ?>
 <tr height="35" class="tabOhne">
 <td width="5" align="right">.</td>
 <td width="400">Zwischensumme:</td>
 <td width="30" align="right">.</td>
 <td width="40" align="right">.</td>
 <td width="50" align="right"><?PHP echo $sum;?></td>
 <td width="70">.</td>
 <td width="140">.</td>
 </tr>
 <?PHP $sum=0; } $gpreis = $line[fldAnz] * $line[fldPreis]; $sum=$sum + $gpreis; $gessum=$gessum+$gpreis?>
 <tr height="35">
 <td width="5" align="right"><?PHP echo $line[fldReihenfolge];?></td>
 <td width="400"><?PHP echo htmlentities($line[fldBez], null, 'utf-8');?></td>
 <td width="30" align="right"><?PHP echo $line[fldAnz];?></td>
 <td width="40" align="right"><?PHP echo $line[fldPreis];?></td>
 <td width="50" align="right"><?PHP echo $gpreis;?></td>
 <td width="70"><?PHP echo $line[fldOrt];?></td>
 <td width="140"><?PHP echo htmlentities($line[fldAbteilung], null, 'utf-8');?></td>
 </tr>
 <?PHP
 $AlterOrt = $line[fldOrt];
} ?>
 <tr height="35" class="tabOhne">
 <td width="5" align="right">.</td>
 <td width="400">Zwischensumme:</td>
 <td width="30" align="right">.</td>
 <td width="40" align="right">.</td>
 <td width="50" align="right"><?PHP echo $sum;?></td>
 <td width="70">.</td>
 <td width="140">.</td>
 </tr>
 <tr height="35" class="tabOhne">
 <td width="5" align="right">.</td>
 <td width="400">Gesamtsumme:</td>
 <td width="30" align="right">.</td>
 <td width="40" align="right">.</td>
 <td width="50" align="right"><?PHP echo $gessum;?></td>
 <td width="70">.</td>
 <td width="140">.</td>
 </tr>
<?PHP
mysql_free_result($result);
mysql_close();
?>
</table><br>
</body>
</html>

