<?php
$menu=$_GET[menu];
$idwert=$_GET[idwert];
$menuid=$_GET[menuid];
include("../config.php");
include("druckvergleichfunc.php");
include("bootstrapfunc.php");
include("../sites/views/wp_".$menu."/showtab.inc.php");
bootstraphead();
bootstrapbegin($pararray['headline']);

$druckvergleich = $_GET['druckvergleich'];
if ($druckvergleich==1) {
  if (isset($_REQUEST['submit'])) { 
    druckvergleich();
  }  
} else {
  druckauswahl($menu,$idwert);
}  

bootstrapend();

?>