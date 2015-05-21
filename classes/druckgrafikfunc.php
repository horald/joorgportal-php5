<?php
session_start();
header("Content-type: image/png");
include ("../config.php");
$menu=$_GET[menu];
include("../sites/views/wp_".$menu."/showtab.inc.php");

// erstellen eines leeren Bildes mit 400px Breite und 300px Höhe
$breite=1350;
$hoehe=500;
$bild = imagecreatetruecolor($breite, $hoehe);

// Hintergrundfarbe erstellen
$hintergrundfarbe = imagecolorallocate ($bild, 255, 255, 50);
imagefill($bild, 0, 0, $hintergrundfarbe);

// Farben festlegen
$schwarz = imagecolorallocate($bild, 0, 0, 0);
$gruen = imagecolorallocate($bild, 0, 255, 0);
$blau = imagecolorallocate($bild, 0, 0, 255);
$rot = imagecolorallocate($bild, 255, 0, 0);
$weiss = imagecolorallocate($bild, 255, 255, 255);


$zeile=450;
$spalte=50;
$abstand=50;
$faktor=2;
imageline($bild,$spalte,$zeile,$breite-10,$zeile,$schwarz);
imageline($bild,$spalte,10,$spalte,$zeile,$schwarz);

imageline($bild,$spalte,$zeile-(130*$faktor),$breite-10,$zeile-(130*$faktor),$blau);
imageline($bild,$spalte,$zeile-(140*$faktor),$breite-10,$zeile-(140*$faktor),$blau);
imageline($bild,$spalte,$zeile-(160*$faktor),$breite-10,$zeile-(160*$faktor),$blau);
imageline($bild,$spalte,$zeile-(90*$faktor),$breite-10,$zeile-(90*$faktor),$gruen);
imageline($bild,$spalte,$zeile-(100*$faktor),$breite-10,$zeile-(100*$faktor),$gruen);
imageline($bild,$spalte,$zeile-(110*$faktor),$breite-10,$zeile-(110*$faktor),$gruen);
imageline($bild,$spalte,$zeile-(80*$faktor),$breite-10,$zeile-(80*$faktor),$rot);

$dbselarr = $_SESSION['DBSELARR'];
$count=sizeof($dbselarr);
//imagestring($bild,16,15,15,$count,$schwarz);
$query="SELECT * FROM ".$pararray['dbtable']." WHERE fldindex=".$dbselarr[0];	
$result = mysql_query($query) or die(mysql_error().$query);
$line = mysql_fetch_array($result);
imageline($bild,$spalte,$zeile,$spalte,$zeile+5,$schwarz);
$grafdatum=substr($line['flddatum'],-5,2);
$grafdatum=substr($line['flddatum'],-2).".".$grafdatum;
imagestring($bild,16,$spalte-5,$zeile+5,$grafdatum,$schwarz);
$qryzp="SELECT * FROM tblzeitpunkt WHERE fldindex=".$line['fldid_zeitpunkt'];	
$reszp = mysql_query($qryzp) or die(mysql_error().$qryzp);
$linzp = mysql_fetch_array($reszp);
$zeitpunkt=substr($linzp['fldbez'],0,5);
imagestring($bild,16,$spalte-5,$zeile+20,$zeitpunkt,$schwarz);
$vongrafzldia=$zeile-(intval($line['fldblutdia'])*$faktor);
$vongrafzlsys=$zeile-(intval($line['fldblutdruck'])*$faktor);
$vongrafzlpls=$zeile-(intval($line['fldpuls'])*$faktor);
imagestring($bild,16,$breite-50,05,"Sys.",$blau);
imagestring($bild,16,$breite-50,25,"Dia.",$gruen);
imagestring($bild,16,$breite-50,45,"Puls",$rot);
for ( $x = 0; $x < $hoehe-300; $x=$x+10 ) {
  $xpos=$x*$faktor;
  imagestring($bild,16,5,$zeile-$xpos-8,$x,$schwarz);
  imageline($bild,$spalte,$zeile-$xpos,$spalte-10,$zeile-$xpos,$schwarz);
}
$spalte=$spalte+$abstand; 

for ( $x = 1; $x < $count; $x++ ) {
  $query="SELECT * FROM ".$pararray['dbtable']." WHERE fldindex=".$dbselarr[$x];	
  $result = mysql_query($query) or die(mysql_error().$query);
  $line = mysql_fetch_array($result);
  imageline($bild,$spalte,$zeile,$spalte,$zeile+5,$schwarz);
  $grafdatum=substr($line['flddatum'],-5,2);
  $grafdatum=substr($line['flddatum'],-2).".".$grafdatum;
  $qryzp="SELECT * FROM tblzeitpunkt WHERE fldindex=".$line['fldid_zeitpunkt'];	
  $reszp = mysql_query($qryzp) or die(mysql_error().$qryzp);
  $linzp = mysql_fetch_array($reszp);
  $zeitpunkt=substr($linzp['fldbez'],0,5);
  imagestring($bild,16,$spalte-5,$zeile+5,$grafdatum,$schwarz);
  imagestring($bild,16,$spalte-5,$zeile+20,$zeitpunkt,$schwarz);

  $bisspalte=$spalte;
  $spalte=$spalte+$abstand; 
  $startspalte=$bisspalte-$abstand;
  $grafzldia=$zeile-(intval($line['fldblutdia'])*$faktor);
  $grafzlsys=$zeile-(intval($line['fldblutdruck'])*$faktor);
  $grafzlpls=$zeile-(intval($line['fldpuls'])*$faktor);
  imageline($bild,$startspalte,$vongrafzldia,$bisspalte,$grafzldia,$gruen);
  imageline($bild,$startspalte,$vongrafzldia+1,$bisspalte,$grafzldia+1,$gruen);

  imageline($bild,$startspalte,$vongrafzlsys,$bisspalte,$grafzlsys,$blau);
  imageline($bild,$startspalte,$vongrafzlsys+1,$bisspalte,$grafzlsys+1,$blau);

  imageline($bild,$startspalte,$vongrafzlpls,$bisspalte,$grafzlpls,$rot);
  imageline($bild,$startspalte,$vongrafzlpls+1,$bisspalte,$grafzlpls+1,$rot);
  $vongrafzldia=$grafzldia;
  $vongrafzlsys=$grafzlsys;
  $vongrafzlpls=$grafzlpls;
}

// Ausgabe des Bildes
imagepng($bild);

?>