<?php
$menu=$_GET[menu];
$menuid=$_GET[menuid];
$idwert=$_GET[idwert];
//echo $menu."=menu,".$menuid."=menuid,".$idwert."=idwert<br>";
include("../config.php");
include("updatefunc.php");
include("../classes/bootstrapfunc.php");
include("../sites/views/wp_".$menu."/showtab.inc.php");
bootstraphead();
bootstrapbegin($pararray['headline']);
$filter="";
$krit=$_GET['krit'];
//echo $krit."=krit<br>";
$update = $_GET['update'];
if ($update==1) {
  if ($_POST['checkconnect']<>"") {
  	 $checkconnect=$_POST['checkconnect'];
    updatecheckconnect($pararray,$listarray,$filterarray,$filter,$idwert,$menu,$gdbname,$menuid,$checkconnect);
    //updateinput($pararray,$listarray,$filterarray,$filter,$idwert,$menu,$menuid);
  } else {
    if ($_POST['aktual']=="aktual") {
      updatesavedirect($pararray,$listarray,$filterarray,$filter,$idwert,$menu,$gdbname);
      updateinput($pararray,$listarray,$filterarray,$filter,$idwert,$menu,$menuid);
    } else {
      updatesave($pararray,$listarray,$filterarray,$filter,$idwert,$menu,$gdbname,$menuid);
      echo "<meta http-equiv='refresh' content='0; URL=showtab.php?menu=".$menu."&idwert=".$menuid."'>";  
    }
  }  
} else {
  updateinput($pararray,$listarray,$filterarray,$filter,$idwert,$menu,$menuid,$krit);
}  
bootstrapend();
?>  
