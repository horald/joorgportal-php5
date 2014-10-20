<?php
$menu=$_GET[menu];
include("../config.php");
include("monatsberichtfunc.php");
include("bootstrapfunc.php");
include("../sites/views/wp_".$menu."/showtab.inc.php");
bootstraphead();

$drucken = "N";
if (isset($_GET['drucken'])) {
  $drucken = $_GET['drucken'];
}
if ($drucken=="J") {
  echo "<br>";
}

bootstrapbegin($pararray['headline']);

$save = $_GET['save'];
if ($save==1) {
  if ($drucken=="N") {
    echo "<a class='btn btn-primary' href='showtab.php?menu=".$menu."'>zurück</a> ";
  }
  $calc = $_POST['calc'];
  $oberkonten = $_POST['oberkonten'];
  $ktoogr = $_POST['ktoogr'];
  $ktoinhgrp = $_POST['ktoinhgrp'];
  //echo $ktoinhgrp."=ktoinhgrp<br>";
  //echo $ktoogr."=ktoogr<br>";
  monatsberichtanzeigen($menu,$calc,$oberkonten,$ktoogr,$ktoinhgrp);
} else {
  monatsberichtauswahl($menu,$drucken);
}  

bootstrapend();


?>