<?php
$menu=$_GET[menu];
$idwert=$_GET[idwert];
include("../config.php");
include("chart/grafikfunc.php");
include("bootstrapfunc.php");
include("../sites/views/wp_".$menu."/showtab.inc.php");
bootstraphead();
bootstrapbegin($pararray['headline']);
//echo "grafik<br>";
showgrafik(11,12);

bootstrapend();
?>