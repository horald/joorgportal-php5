<?php
$menu=$_GET[menu];
$idwert=$_GET[idwert];
include("../config.php");
include("ausstammdatenfunc.php");
include("bootstrapfunc.php");
include("../sites/views/wp_".$menu."/showtab.inc.php");
bootstraphead();
bootstrapbegin($pararray['headline']);
$einkauftable = $pararray['dbtable'];
$stammdaten = $_GET['stammdaten'];

if ($stammdaten==1) {
  if (isset($_REQUEST['submit'])) { 
    echo "<a class='btn btn-primary' href='showtab.php?menu=".$menu."&idwert=".$idwert."'>zurück</a><br>";    stammdatenimportieren($einkauftable);
  } else {
    echo "<meta http-equiv='refresh' content='0; URL=showtab.php?menu=".$menu."&idwert=".$idwert."'>";  
  }  
} else {
  ausstammdateninput($menu,$idwert);
}
bootstrapend();
?>