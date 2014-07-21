<?php
$menu=$_GET[menu];
$menuid=$_GET[menuid];
include("../config.php");
include("birthdaytoterminfunc.php");
include("bootstrapfunc.php");
include("../sites/views/wp_".$menu."/showtab.inc.php");
bootstraphead();
bootstrapbegin($pararray['headline']);

$birthday = $_GET['birthday'];
if ($birthday==1) {
  echo "<a class='btn btn-primary' href='showtab.php?menu=".$menu."&idwert=".$menuid."'>zur&uumlck</a><br>";
  if (isset($_REQUEST['submit'])) { 
    birthdayexec();
  } else {
    echo "Der Vorgang wurde abgebrochen.<br>"; 
    echo "<meta http-equiv='refresh' content='0; URL=showtab.php?menu=".$menu."&idwert=".$menuid."'>";
  }  
} else {
  birthdayabfrage($menu,$menuid);
}  

bootstrapend();
?>