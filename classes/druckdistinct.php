<?php
$menu=$_GET[menu];
$idwert=$_GET[idwert];
include("../config.php");
//include("inc/druckdistinct.inc.php");
include("druckdistinctfunc.php");
include("bootstrapfunc.php");
include("../sites/views/wp_".$menu."/showtab.inc.php");
bootstraphead();
bootstrapbegin($pararray['headline']);
$druckdistinct = $_GET['druckdistinct'];
if ($druckdistinct==1) {
  if (isset($_REQUEST['submit'])) { 
    echo "<a class='btn btn-primary' href='showtab.php?menu=".$menu."&idwert=".$idwert."'>zur&uumlck</a><br><br>";    $vondatum=$_POST['vondatum'];
    $bisdatum=$_POST['bisdatum'];
    $ktoinh=$_POST['ktoinh'];
    $ktogrp=$_POST['ktogrp'];
    druckdistinctausfuehren($vondatum,$bisdatum,$ktoinh,$ktogrp);
  } else {
    echo "<meta http-equiv='refresh' content='0; URL=showtab.php?menu=".$menu."&idwert=".$idwert."'>";  
  }  
} else {
  druckdistinctauswahl($menu,$idwert);
}  

bootstrapend();
?>