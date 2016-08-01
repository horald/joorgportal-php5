<?php
header("Content-type: image/png");

// erstellen eines leeren Bildes mit 400px Breite und 300px Höhe
$breite=1020;
$hoehe=120;
$bild = imagecreatetruecolor($breite, $hoehe);

// Hintergrundfarbe erstellen
$hintergrundfarbe = imagecolorallocate ($bild, 50, 50, 50);
imagefill($bild, 0, 0, $hintergrundfarbe);

// Farben festlegen
$gruen = imagecolorallocate($bild, 0, 255, 0);
$weiss = imagecolorallocate($bild, 255, 255, 255);

// Viereck zeichen
// mit folgenden Kordinaten (x1, y1, x2, y2, Farbe);
imagefilledrectangle ($bild, 10, 25, $breite-10, 35, $weiss);
imagefilledrectangle ($bild, 10, 75, $breite-10, 85, $weiss);

//$verbrauch=$_GET['verbrauch'];
$verbrauch=str_replace(",",".",$_GET['verbrauch']);
//$verbrauch=125.85;
$verbrauchproz=round($verbrauch/10,2);
$verbrauchpos=round($verbrauchproz*10)+10;
//$verbrauchpos=100*10+10;
imagefilledrectangle ($bild, 10, 25, $verbrauchpos, 35, $gruen);

$dat=$_GET['vondatum'];
$year=substr($dat,0,4);
$mon=substr($dat,5,2);
$nextday=substr($dat,8,2);
$date2 = mktime(0, 0, 0, $mon, $nextday, $year);
$date1 = time();
//echo $dat.",".$date1."<br>";
$str=$year."-".$mon."-".$day.",".$date.",".$date1;
//ImageString ($bild, 10, 50, 5, $str, $gruen);
$day1 = date('d', $date1);
$mon1 = date('m', $date1);
$nextmon=$mon;
//if ($day1<$nextday) {
//  $nextmon=$mon1;
//} else {
//  $nextmon=$mon1+1;
//}
$nextyear=2015;
if ($nextmon>12) {
  $nextmon="01";
  $nextyear=$nextyear+1;
}
//$date2 = mktime(0, 0, 0, $nextmon, $nextday, $nextyear);
$datum=date('d.m.Y',$date1);
$day2 = date('d', $date2);
$mon2 = date('m', $date2);
$maxtage=30;
if ($mon1==$mon2) {
  //$anztage=$day2-$day1-1;
  $anztage=$day2-$day1;
} else {
  $anztage=$maxtage-$day1+$day2;
}
$proztage=100-round($anztage/$maxtage*100,2);
$bis=round($proztage*10)+10;
//$bis=3.3*10+10;
imagefilledrectangle ($bild, 10, 75, $bis, 85, $gruen);

$str=$verbrauch." MB von 1 GB verbraucht (".$verbrauchproz."%)";
ImageString ($bild, 20, 50, 45, $str, $gruen);

$difftage=$maxtage-$anztage;
$moeglverb=$proztage * 10;
$str=$moeglverb." MB am ".$datum." bis ".$nextday.".".$nextmon.".".$nextyear." (".$proztage."%) ".$difftage." von ".$maxtage." Tage, Rest ".$anztage." Tage";
ImageString ($bild, 100, 50, 95, $str, $gruen);

imageline($bild,110,35,110,40,$gruen);
imageline($bild,210,35,210,40,$gruen);
imageline($bild,310,35,310,40,$gruen);
imageline($bild,410,35,410,40,$gruen);
imageline($bild,510,35,510,40,$gruen);
imageline($bild,610,35,610,40,$gruen);
imageline($bild,710,35,710,40,$gruen);
imageline($bild,810,35,810,40,$gruen);
imageline($bild,910,35,910,40,$gruen);

imageline($bild,110,85,110,90,$gruen);
imageline($bild,210,85,210,90,$gruen);
imageline($bild,310,85,310,90,$gruen);
imageline($bild,410,85,410,90,$gruen);
imageline($bild,510,85,510,90,$gruen);
imageline($bild,610,85,610,90,$gruen);
imageline($bild,710,85,710,90,$gruen);
imageline($bild,810,85,810,90,$gruen);
imageline($bild,910,85,910,90,$gruen);

// Ausgabe des Bildes
imagepng($bild);

?>