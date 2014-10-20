<?php
$idwert=$_GET[idwert];
$menu=$_GET[menu];
include("../config.php");
include("insarchivfunc.php");
include("bootstrapfunc.php");
include("../sites/views/wp_".$menu."/showtab.inc.php");
bootstraphead();
bootstrapbegin($pararray['headline']);
//$archivtable="tblEinkauf_liste";
$archivtable=$pararray['dbtable'];
$insarchiv = $_GET['insarchiv'];
if ($insarchiv==1) {
  if (isset($_REQUEST['submit'])) { 
    echo "<a class='btn btn-primary' href='showtab.php?menu=".$menu."&idwert=".$idwert."'>zur&uumlck</a><br><br>";    insarchivsave($pararray,$archivtable,$menu);
  } else {
    echo "<meta http-equiv='refresh' content='0; URL=showtab.php?menu=".$menu."&idwert=".$idwert."'>";  
  }  
} else {
  //insarchivinput($menu,$archivtable,"fldEinkaufDat","J");
  $einkaufdat=$pararray['fldEinkaufDat'];
  //echo $einkaufdat."=einkaufdat<br>";
  $strort=$pararray['strort'];
  insarchivinput($pararray,$archivtable,$einkaufdat,$strort,$idwert,$menu);
}  

bootstrapend();
?>