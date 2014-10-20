<?php
$menu=$_GET[menu];
$menuid=$_GET[menuid];
include("../config.php");
include("resyncallfunc.php");
include("bootstrapfunc.php");
include("../sites/views/wp_".$menu."/showtab.inc.php");
bootstraphead();
bootstrapbegin($pararray['headline']);


$table = $pararray['dbtable'];
$resyncall = $_GET['resyncall'];
if ($resyncall==1) {
  if (isset($_REQUEST['submit'])) { 
    echo "<a class='btn btn-primary' href='showtab.php?menu=".$menu."&idwert=".$menuid."'>zur&uumlck</a><br>";    resyncallfunc($pararray,$menu,$idwert,$gdbname);
  } else {
    echo "<meta http-equiv='refresh' content='0; URL=showtab.php?menu=".$menu."&idwert=".$menuid."'>";  
  }  
} else {
  resyncallinput($menu,$menuid);
}
bootstrapend();
?>