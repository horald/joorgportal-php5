<?php
$menu=$_GET[menu];
$menuid=$_GET[menuid];
include("../config.php");
include("fieldchangefunc.php");
include("bootstrapfunc.php");
include("../sites/views/wp_".$menu."/showtab.inc.php");
bootstraphead();
bootstrapbegin($pararray['headline']);
$fieldchange = $_GET['fieldchange'];
if ($fieldchange==1) {
  if (isset($_REQUEST['submit'])) { 
    echo "<a class='btn btn-primary' href='showtab.php?menu=".$menu."&idwert=".$menuid."'>zur&uumlck</a><br><br>";    fieldchangesave($pararray);
  } else {
    echo "<meta http-equiv='refresh' content='0; URL=showtab.php?menu=".$menu."&idwert=".$menuid."'>";  
  }  
} else {
  fieldchangeinput($menu,$menuid);
}  

bootstrapend();
?>