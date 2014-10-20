<?php
$menu=$_GET[menu];
$idwert=$_GET[idwert];
include("../config.php");
include("ausarchivfunc.php");
include("bootstrapfunc.php");
include("../sites/views/wp_".$menu."/showtab.inc.php");

$dbfield=$_GET['dbfield'];
$dbwert=$_GET['dbwert'];
$query="UPDATE ".$pararray['dbtable']." SET ".$dbfield."='".$dbwert."' WHERE ".$pararray['fldindex']."=".$idwert;
$result=mysql_query($query) or die(mysql_error().$query);
bootstraphead();
bootstrapbegin($pararray['headline']);
//echo $query."<br>";
echo "<meta http-equiv='refresh' content='0; URL=showtab.php?menu=".$menu."&idwert=".$idwert."'>";  

bootstrapend();
?>