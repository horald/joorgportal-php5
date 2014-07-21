<?php
$menu=$_GET[menu];
$idwert=$_GET[idwert];
include("../config.php");
include("setreihenfolgefunc.php");
include("bootstrapfunc.php");
include("../sites/views/wp_".$menu."/showtab.inc.php");
bootstraphead();
bootstrapbegin($pararray['headline']);
$reihenfolge = $_GET['reihenfolge'];
if ($reihenfolge==1) {
  if (isset($_REQUEST['submit'])) { 
    echo "<a class='btn btn-primary' href='showtab.php?menu=".$menu."&idwert=".$idwert."'>zurück</a><br><br>";    reihenfolgesetzen($pararray);
  } else {
    echo "<meta http-equiv='refresh' content='0; URL=showtab.php?menu=".$menu."&idwert=".$idwert."'>";  
  }  
} else {
  reihenfolgeauswahl($menu,$idwert);
}  

bootstrapend();

?>