<?php
$menu=$_GET[menu];
$idwert=$_GET[idwert];
include("../config.php");
include("installerzeugenfunc.php");
include("bootstrapfunc.php");
bootstraphead();
bootstrapbegin("Install erzeugen");

installerzeugen();

bootstrapend();
?>