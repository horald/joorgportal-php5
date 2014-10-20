<?php
$menu=$_GET[menu];
$idwert=$_GET[idwert];
include("../config.php");
include("bootstrapfunc.php");
include("../sites/views/wp_".$menu."/showtab.inc.php");
bootstraphead();
bootstrapbegin($pararray['headline']);
//echo $idwert."=idwert<br>";
$query="SELECT * FROM tblmusic_liste WHERE fldindex=".$idwert;
//echo $query."<br>";
$result = mysql_query($query) or die(mysql_error());
$line = mysql_fetch_array($result); 
echo $line['fldlink']."<br>";
//echo "<embed type='application/mplayerplug-in' src='".$line['fldlink']."' width='140' height='60'>";

//echo "<div>";
//echo "<audio controls>";
//echo "  <source src='".$line['fldlink']."' type='audio/mpeg'>";
//echo "  Your browser does not support this audio format.";
//echo "</audio>";
//echo "</div>";
?>

<?xml version='1.0' encoding='UTF-8'?>
<playlist version='1' xmlns='http://xspf.org/ns/0/'>
<trackList>
<track>
<creator>WNPR - Online Services</creator>
<title>WNPR - Connecticut Public Broadcasting - Listen Live -</title>
<location>http://sc7.lga.llnw.net:80/stream/cptv_mp3live?mp3</location>

<image>http://cpbn.org/files/wnpr_listen_live.jpg</image>
<duration></duration>

</track>
</trackList>
</playlist>

<?php

bootstrapend();
?>