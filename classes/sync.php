<?php
header("content-type: text/html; charset=utf-8");
$menu=$_GET[menu];
$menuid=$_GET[menuid];
include("../config.php");
include("syncfunc.php");
include("bootstrapfunc.php");
include("../sites/views/wp_".$menu."/showtab.inc.php");
bootstraphead($pfad);
bootstrapbegin($pararray['headline']);

$modus = $_GET['modus'];
$sync = $_GET['sync'];

if ($sync==1) {
  if (isset($_REQUEST['submit'])) { 
    echo "<a class='btn btn-primary' href='showtab.php?menu=".$menu."&idwert=".$menuid."'>zur&uumlck</a><br>";    syncausfuehren($menu,$pararray);
  } else {
    echo "<meta http-equiv='refresh' content='0; URL=showtab.php?menu=".$menu."&idwert=".$menuid."'>";  
  }  
} else {
  syncauswahl($menu,$menuid);
}

bootstrapend();

?>