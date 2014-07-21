<?php
$menu=$_GET[menu];
include("../config.php");
include("showtabfunc.php");
include("delselfunc.php");
include("bootstrapfunc.php");
include("../sites/views/wp_".$menu."/showtab.inc.php");
bootstraphead($pfad);
bootstrapbegin($pararray['headline']);

$idwert = $_GET['idwert'];
$deletesel = $_GET['deletesel'];
if ($deletesel==1) {
  //deleteexec($pararray,$listarray,$filterarray,$filter,$idwert,$menu);
  //echo "<meta http-equiv='refresh' content='0; URL=showtab.php?menu=".$menu."'>";  
} else {
  $remotehost = "";
  if (isset($_GET['cloud'])) { 
    $remotehost = $_GET['cloud'];
  }  
  //echo $remotehost."=cloud<br>";
  delselask($pararray,$remotehost); 
}  

bootstrapend();
?>