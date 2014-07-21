<?php
$menu=$_GET[menu];
include("../config.php");
include("druckaufgabenplanfunc.php");
include("bootstrapfunc.php");
include("../sites/views/wp_".$menu."/showtab.inc.php");
$drucken = $_GET['drucken'];
if ($drucken==1) {
  bootstraphead('NO');
} else {
  bootstraphead();
}  
bootstrapbegin($pararray['headline']);

$idwert = $_GET['idwert'];
if ($drucken==1) {
  $datum=$_POST[druckdatum];
  $dbtable=$_POST[dbtable];
  $prtfield=$_POST[prtfield];
  $prtuser=$_POST[prtuser];
  $orderby=$_POST[orderby];
  $hoehe=$_POST[hoehe];
  $anzzl=$_POST[anzzl];
  druckaufgabenplan($datum,$dbtable,$prtfield,$prtuser,$orderby,$hoehe,$anzzl);
} else {
  $dbtable=$pararray['dbtable'];
  $prtfield=$pararray['prtfield'];
  if ($prtfield=='') {
    $prtfield='fldbez';
  }
  $prtuser=$pararray['prtuser'];
  $orderby=$pararray['orderby'];
  druckaufgabenplanauswahl($dbtable,$prtfield,$prtuser,$orderby);
}  

bootstrapend();
?>