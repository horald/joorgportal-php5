<?php
$menu=$_GET[menu];
$idwert=$_GET[idwert];
include("../config.php");
include("terminseriefunc.php");
include("bootstrapfunc.php");
include("../sites/views/wp_".$menu."/showtab.inc.php");
bootstraphead();
bootstrapbegin($pararray['headline']." - Terminserie");
$terminserie = $_GET['terminserie'];
if ($terminserie==1) {
  terminserieausfuehren($pararray);
} else {
  terminserieauswahl($menu);
}  
bootstrapend();
?>