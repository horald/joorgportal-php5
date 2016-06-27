<?php
$menu=$_GET['menu'];
$idwert=$_GET['idwert'];
include("../config.php");
include("mksqlstrucfunc.php");
include("bootstrapfunc.php");
bootstraphead();
bootstrapbegin("Make SQL-Structure");

$mksqlstruc = $_GET['mksqlstruc'];
if ($mksqlstruc==1) {
  mksqlstruc_ausfuehren();
} else {
  mksqlstruc_abfrage($menu,$idwert);
}

bootstrapend();
?>