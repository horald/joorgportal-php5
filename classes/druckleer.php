<?PHP
session_start();
$menu=$_GET[menu];
include("../sites/views/wp_".$menu."/showtab.inc.php");
echo "<html>";
echo "<link rel='stylesheet' type='text/css' href='style.css' />";
echo "<body>";
$timestamp = time();
$datum = date("d.m.Y",$timestamp);
$uhrzeit = date("H:i",$timestamp);
echo "<h2>Liste vom ".$datum." - ".$uhrzeit." Uhr</h2>";
echo "<table border'3'>";
include ("../config.php");
echo "<tr class='tabAuswahl'>";
foreach ( $listarray as $arrelement )
{
  if (($arrelement['fieldhide']<>"true") && ($arrelement['fieldprthide']<>"true")) {
  	 $width=strval($arrelement['width'])+103;
    echo "<td width='".$width."'>".$arrelement['label']."</td>";
  }  
}
echo "</tr>";
echo "</table>";
echo "<table border='3'>";
$count=20;
for ( $x = 0; $x < $count; $x++ ) {
  echo "<tr height='35'>";
  foreach ( $listarray as $arrelement )
  {
    if (($arrelement['fieldhide']<>"true") && ($arrelement['fieldprthide']<>"true")) {
    	$breite=$arrelement['width']+100;
      echo "<td width='".$breite."'>|</td>";
    }  
  }  
  echo "</tr>";
}
mysql_free_result($result);
mysql_close();
echo "</table><br>";
echo "</body>";
echo "</html>";
?>