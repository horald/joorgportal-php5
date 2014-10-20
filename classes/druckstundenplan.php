<?php
$menu=$_GET[menu];
include("../config.php");
include("druckstundenplanfunc.php");

$idwert = $_GET['idwert'];
$drucken = $_GET['drucken'];
if ($drucken==1) {
  $benutzer=$_POST[benutzer];
  druckstundenplan($benutzer);
} else {
  include("bootstrapfunc.php");
  include("../sites/views/wp_".$menu."/showtab.inc.php");
  bootstraphead();
  bootstrapbegin($pararray['headline']);
  druckstundenplanauswahl($arrelement);
  bootstrapend();
}  

?>