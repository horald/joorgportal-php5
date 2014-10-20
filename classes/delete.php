<?php
$menu=$_GET[menu];
$menuid=$_GET[menuid];
$idwert=$_GET[idwert];
include("../config.php");
include("showtabfunc.php");
include("deletefunc.php");
include("bootstrapfunc.php");
include("../sites/views/wp_".$menu."/showtab.inc.php");
bootstraphead($pfad);
bootstrapbegin($pararray['headline']);

$delete = $_GET['delete'];
if ($delete==1) {
  deleteexec($pararray,$listarray,$filterarray,$filter,$idwert,$menu);
  echo "<meta http-equiv='refresh' content='0; URL=showtab.php?menu=".$menu."&idwert=".$menuid."'>";  
} else {
  showlist(); 
  deleteask($pararray,$listarray,$filterarray,$filter,$idwert,$menu,$menuid);
}  

bootstrapend();

?>