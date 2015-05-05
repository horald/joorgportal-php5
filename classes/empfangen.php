<?php
//error_reporting(-1);
//ini_set('display_errors', true);
include("bootstrapfunc.php");
include("empfangenfunc.php");
$menu=$_GET['menu'];
bootstraphead();
bootstrapbegin("Einkaufsliste");
echo "<a href='showtab.php?menu=shopping' class='btn btn-primary btn-sm active' role='button'>Zurück</a>"; 
$empfangen = $_GET['empfangen'];
if ($empfangen==1) {
  datenholen();
} else {
  datenauswahl($menu);
}
bootstrapend();
?> 