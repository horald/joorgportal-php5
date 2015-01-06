<?php
$menu=$_GET[menu];
$menuid=$_GET[menuid];
include("../config.php");
include("senddatafunc.php");
include("bootstrapfunc.php");
include("../sites/views/wp_".$menu."/showtab.inc.php");
bootstraphead($pfad);
bootstrapbegin($pararray['headline']);
echo "<script src='senddata.js'></script>";
echo "<a class='btn btn-primary' href='showtab.php?menu=".$menu."&idwert=".$menuid."'>zur&uumlck</a><br>";

if ($_GET[id]==1) {
  senddata();
} else {
  getdata();
}

bootstrapend();
?>