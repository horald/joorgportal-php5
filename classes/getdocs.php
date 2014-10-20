<?php
$menu=$_GET[menu];
$idwert=$_GET[idwert];
include("../config.php");
include("getdocsfunc.php");
include("bootstrapfunc.php");
include("../sites/views/wp_".$menu."/showtab.inc.php");
bootstraphead();
bootstrapbegin($pararray['headline']);
$getdoc = $_GET['getdoc'];
if ($getdoc==1) {
  //echo "getdoc...";
  getdocausfuehren();
//  if (isset($_REQUEST['submit'])) { 
//    echo "<a class='btn btn-primary' href='showtab.php?menu=".$menu."&idwert=".$idwert."'>zurück</a><br><br>";//    ausarchivuebernehmen($archivtable);
//  } else {
//    echo "<meta http-equiv='refresh' content='0; URL=showtab.php?menu=".$menu."&idwert=".$idwert."'>";  
//  }  
} else {
  getdocauswahl($menu,$idwert);
}  

bootstrapend();

?>