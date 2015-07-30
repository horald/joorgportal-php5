<?php
$menu=$_GET[menu];
$idwert=$_GET[idwert];
$druck = $_GET['druck'];
include("drucklistefunc.php");
include("bootstrapfunc.php");
include("../sites/views/wp_".$menu."/showtab.inc.php");
bootstraphead();
if ($druck==1) {
  $headline="";
} else {
  $headline=$pararray['headline'];
}
bootstrapbegin($headline);
if ($druck==1) {
  $anzleerzl=$_POST['anzleerzl'];	
  druckliste($anzleerzl);
} else {
  druckauswahl($menu,$idwert);	
}
bootstrapend();
?>