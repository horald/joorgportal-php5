<?php
include("../../../config.php");
include("bootstrapfunc.php");
bootstraphead();
bootstrapbegin("Google Calendar");
$idwert=$_GET[idwert];
$query="SELECT * FROM tblmenu_liste AS l,tblmenu_modul AS m WHERE l.fldid_modul=m.fldindex AND l.fldindex=".$idwert;
$result = mysql_query($query) or die(mysql_error());
if ($line = mysql_fetch_array($result)) {
  $source=$line['fldsource'];	
  echo $source;
} else {
  echo $idwert." nicht gefunden!";
}	  
bootstrapend();
?>