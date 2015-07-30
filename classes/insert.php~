<?php
$menu=$_GET[menu];
$menuid=$_GET[menuid];
$idwert=$_GET['idwert'];
include("../config.php");
include("insertfunc.php");
include("bootstrapfunc.php");
include("../sites/views/wp_".$menu."/showtab.inc.php");
bootstraphead();
bootstrapbegin($pararray['headline']);

$krit=$_GET['krit'];
$insert = $_GET['insert'];
$iddetail="";
$strdetail="";
if (isset($_GET['detail'])) {
  $iddetail=$_GET['detail'];
  $strdetail="&detail=".$iddetail;
}
if ($insert==1) {
  if ($_POST['aktual']=="aktual") {
    insertinput($pararray,$listarray,$filterarray,$filter,$idwert,$menu,$iddetail,$menuid);
  } else {
    insertsave($pararray,$listarray,$filterarray,$filter,$idwert,$menu,$iddetail);
    if ($_POST['errmsg']<>true) {
      echo "<meta http-equiv='refresh' content='0; URL=showtab.php?menu=".$menu.$strdetail."&idwert=".$menuid."'>";
    }  
  }    
} else {
  insertinput($pararray,$listarray,$filterarray,$filter,$idwert,$menu,$iddetail,$menuid,$krit);
}  

bootstrapend();

?>