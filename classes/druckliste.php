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
  $ueberschrift=$_POST['Ueberschrift'];
  $gruppe = $_POST['gruppe'];
  druckliste($anzleerzl,$ueberschrift,$gruppe);
} else {
  $ueberschrift=$pararray['headline'];	
  druckauswahl($menu,$idwert,$ueberschrift);	
}
bootstrapend();
?>