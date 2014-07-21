<?php
$menu=$_GET[menu];
$idwert=$_GET[idwert];
include("../config.php");
include("preisabgleichfunc.php");
include("bootstrapfunc.php");
include("../sites/views/wp_".$menu."/showtab.inc.php");
bootstraphead();
bootstrapbegin($pararray['headline']);
$preistable = $pararray['dbtable'];
$preisabgleich = $_GET['preisabgleich'];
if ($preisabgleich==1) {
  if (isset($_REQUEST['submit'])) { 
    echo "<a class='btn btn-primary' href='showtab.php?menu=".$menu."&idwert=".$idwert."'>zurück</a><br><br>";    echo "Preistable:".$preistable."<br>"; 
    preisuebernehmen($preistable);
  } else {
    echo "<meta http-equiv='refresh' content='0; URL=showtab.php?menu=".$menu."&idwert=".$idwert."'>";  
  }  
} else {
  preisauswahl($menu,$idwert,$preistable);
}  

bootstrapend();
?>