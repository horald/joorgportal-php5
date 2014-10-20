<?php
header("content-type: text/html; charset=utf-8");
$menu=$_GET[menu];
$idwert=$_GET[idwert];
include("../config.php");
include("bootstrapfunc.php");
include("../sites/views/wp_".$menu."/showtab.inc.php");
bootstraphead();
bootstrapbegin($pararray['headline']);

echo "<a class='btn btn-primary' href='showtab.php?menu=".$menu."&idwert=".$idwert."'>zurück</a><br><br>";
$query="SELECT * FROM ".$pararray['dbtable']." WHERE ".$pararray['fldindex']."=".$idwert;
$result = mysql_query($query) or die(mysql_error()." ".$query);
$line = mysql_fetch_array($result);
$pfad=$basepfad."sites/pdf/";
echo "<a href='".$pfad.$line[fldfilename]."'>".$line['fldfilename']."</a><br>";
//echo $line['fldfilename']."pdf-func<br>";

include_once("searchFiles.inc.php");
$fileTyp = array("sql","pdf");
$pictures = array();
$Bildergalerie = scan_dir($basepfad,$fileTyp,TRUE,FALSE,TRUE,$onlyDir, $pictures);
if($Bildergalerie == false)
{
    echo "Verzeichnis ".$basepfad." existiert nicht";
}
else{
    $ausgabe = buildSites($Bildergalerie);
    //print_r($Bildergalerie);
    echo $ausgabe;
}

bootstrapend();
?>