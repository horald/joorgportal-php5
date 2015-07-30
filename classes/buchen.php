<?php
$idwert=$_GET[idwert];
$menu=$_GET[menu];
include("../config.php");
include("bootstrapfunc.php");
include("buchenfunc.php");
//include("exportfunc.php");
include("../sites/views/wp_".$menu."/showtab.inc.php");
bootstraphead();
bootstrapbegin($pararray['headline']);
$buchen = $_GET['buchen'];
if ($buchen==1) {
  if (isset($_REQUEST['submit'])) {
    echo "<a class='btn btn-primary' href='showtab.php?menu=".$menu."&idwert=".$idwert."'>zurueck</a><br>";
    //sqlexportfunc($exportpfad,$pararray,$listarray,$menu);
    buchfunc($menu,$idwert,$pararray,$listarray,$exportpfad);
  } else {
    echo "<div class='alert alert-warning'>";
    echo "Der Vorgang wurde abgebrochen.<br>"; 
    echo "</div>";
    echo "<meta http-equiv='refresh' content='0; URL=showtab.php?menu=".$menu."&idwert=".$idwert."'>";
  }  
} else {
  bucheninsert($menu,$idwert);	
}
bootstrapend();
?>