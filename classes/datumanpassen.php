<?php
$menu=$_GET[menu];
$idwert=$_GET[idwert];
include("../config.php");
include("datumanpassenfunc.php");
include("bootstrapfunc.php");
include("../sites/views/wp_".$menu."/showtab.inc.php");
bootstraphead();
bootstrapbegin($pararray['headline']);
$anpassen = $_GET['anpassen'];
if ($anpassen==1) {
  if (isset($_REQUEST['submit'])) { 
    echo "<a class='btn btn-primary' href='showtab.php?menu=".$menu."&idwert=".$idwert."'>zur&uumlck</a><br><br>";    datumanpassenausfuehren($pararray);
  } else {
    echo "<meta http-equiv='refresh' content='0; URL=showtab.php?menu=".$menu."&idwert=".$idwert."'>";  
  }  
} else {
  datumanpassenauswahl($menu,$idwert);
}  

bootstrapend();

?>