<?php
$menu=$_GET[menu];
$idwert=$_GET[idwert];
include("bootstrapfunc.php");
include("schnellerfassfunc.php");
//include("../sites/views/wp_".$menu."/showtab.inc.php");
bootstraphead();
//bootstrapbegin($pararray['headline']);
bootstrapbegin("Schnellerfass");
$erfass = $_GET['erfass'];
if ($erfass==1) {
  schnellerfassspeichern();	
} else {
  schnellerfassauswahl($menu,$idwert);
}  
bootstrapend();
?>