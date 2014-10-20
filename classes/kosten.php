<?php
$menu=$_GET[menu];
include("../config.php");
include("kostenfunc.php");
include("bootstrapfunc.php");
include("../sites/views/wp_".$menu."/showtab.inc.php");
bootstraphead();
bootstrapbegin($pararray['headline']);

$kosten = $_GET['kosten'];
if ($kosten==1) {
  kostenaufstellung();	
} else {
  kostenauswahl($menu);
}  


bootstrapend();
?>