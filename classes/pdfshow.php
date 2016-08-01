<?php
$pfad = urldecode($_GET['pfad']);
$pfad = str_replace("/var/www/html","http://localhost",$pfad);
$filename = $pfad.urldecode($_GET['filename']);
//echo $filename."<br>";

header('Content-Type: application/pdf');
$pdf = file_get_contents($filename);
echo $pdf;
?>