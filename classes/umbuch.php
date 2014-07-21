<?php
$menu=$_GET[menu];
$menuid=$_GET[menuid];
include("../config.php");
include("umbuchfunc.php");
include("bootstrapfunc.php");
include("../sites/views/wp_".$menu."/showtab.inc.php");
bootstraphead();
bootstrapbegin($pararray['headline']);

$umbuch = $_GET['umbuch'];
if ($umbuch==1) {
  echo "<a class='btn btn-primary' href='showtab.php?menu=".$menu."&idwert=".$menuid."'>zur&uumlck</a><br>";
  if (isset($_REQUEST['submit'])) { 
    umbuchung();
  } else {
    echo "Der Vorgang wurde abgebrochen.<br>"; 
    echo "<meta http-equiv='refresh' content='0; URL=showtab.php?menu=".$menu."&idwert=".$menuid."'>";
  }  
} else {
  umbuchabfrage($menu,$menuid);
}  

bootstrapend();

?>