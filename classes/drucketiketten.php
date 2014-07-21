<?php
$menu=$_GET[menu];
$idwert=$_GET[idwert];
include("drucketikettenfunc.php");
include("bootstrapfunc.php");
include("../sites/views/wp_".$menu."/showtab.inc.php");
bootstraphead();
bootstrapbegin($pararray['headline']);
$etiketten = $_GET['etiketten'];
if ($etiketten==1) {
  etikettendrucken();	
} else {
  etikettenauswahl($menu,$idwert);		
}
bootstrapend();
?>