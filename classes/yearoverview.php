<?php
header("content-type: text/html; charset=utf-8");
$menu=$_GET[menu];
$idwert=$_GET[idwert];
include("../config.php");
include("yearoverviewfunc.php");
include("bootstrapfunc.php");
bootstraphead("NO");
bootstrapbegin("Jahres&uumlbersicht 2014");

yearoverview();

bootstrapend();
?>