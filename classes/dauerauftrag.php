<?php
$menu=$_GET[menu];
$idwert=$_GET[idwert];
include("../config.php");
include("dauerauftragfunc.php");
include("bootstrapfunc.php");
include("../sites/views/wp_".$menu."/showtab.inc.php");
bootstraphead();
bootstrapbegin($pararray['headline']);
$dauerauftrag = $_GET['dauerauftrag'];
if ($dauerauftrag==1) {
  if (isset($_REQUEST['submit'])) { 
    echo "<a class='btn btn-primary' href='showtab.php?menu=".$menu."&idwert=".$idwert."'>zurück</a><br><br>";    //ausarchivuebernehmen();
  } else {
    echo "<meta http-equiv='refresh' content='0; URL=showtab.php?menu=".$menu."&idwert=".$idwert."'>";  
  }  
} else {
  echo "<a class='btn btn-primary' href='showtab.php?menu=".$menu."&idwert=".$idwert."'>zurück</a><br><br>";  dauerauftragauswahl($menu,$idwert);
}  

bootstrapend();

?>