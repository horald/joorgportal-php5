<?php
$menu=$_GET[menu];
$idwert=$_GET[idwert];
include("../config.php");
include("ausarchivfunc.php");
include("bootstrapfunc.php");
include("../sites/views/wp_".$menu."/showtab.inc.php");
bootstraphead();
bootstrapbegin($pararray['headline']);
//$archivtable="tblEinkauf_liste";
$archivtable=$pararray['dbtable'];
$ausarchiv = $_GET['ausarchiv'];
if ($ausarchiv==1) {
  if (isset($_REQUEST['submit'])) { 
    echo "<a class='btn btn-primary' href='showtab.php?menu=".$menu."&idwert=".$idwert."'>zurück</a><br><br>";    ausarchivuebernehmen($archivtable);
  } else {
    echo "<meta http-equiv='refresh' content='0; URL=showtab.php?menu=".$menu."&idwert=".$idwert."'>";  
  }  
} else {
  ausarchivauswahl($menu,$idwert,$archivtable);
}  

bootstrapend();
?>