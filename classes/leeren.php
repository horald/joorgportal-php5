<?php
$menu=$_GET[menu];
$menuid=$_GET[menuid];
include("../config.php");
$sql="DELETE FROM tblEinkauf_liste WHERE fldArchivDat=''";
//echo $sql."<br>";
mysql_query($sql) or die("Error using mysql_query($sql): ".mysql_error());
echo "<meta http-equiv='refresh' content='0; URL=showtab.php?menu=".$menu."&idwert=".$menuid."'>";  
?>