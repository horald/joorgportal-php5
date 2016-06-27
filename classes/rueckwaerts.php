<?php
include("rueckwaertsfunc.php");
include("bootstrapfunc.php");
bootstraphead();
bootstrapbegin('Rückwärts');
echo "<title>Rückwärts</title>";
$menue = $_GET['menue'];
if ($menue=="J") {
  echo "<a class='btn btn-primary' href='../index.php'>Menü</a><br><br>";
} else {
  $menue="N";
}

$rueckwaerts = $_GET['rueckwaerts'];
if ($rueckwaerts==1) {
  rueckwaerts($menue);
} else {
  auswahl($menue);
}	
bootstrapend();
?>