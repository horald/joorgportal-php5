<?php
$menu=$_GET[menu];
include("../config.php");
include("ratenfunc.php");
include("bootstrapfunc.php");
include("../sites/views/wp_".$menu."/showtab.inc.php");
bootstraphead();
bootstrapbegin($pararray['headline']);

$idwert = $_GET['idwert'];
$insert = $_GET['insert'];
if ($insert==1) {
  ratensave($pararray,$listarray,$filterarray,$filter,$idwert,$menu);
  //echo "<meta http-equiv='refresh' content='0; URL=showtab.php?menu=".$menu.$strdetail."'>";  
} else {
  rateninput($pararray,$listarray,$filterarray,$filter,$idwert,$menu);
}  

bootstrapend();


?>