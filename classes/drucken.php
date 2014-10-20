<?PHP
header("content-type: text/html; charset=utf-8");
session_start();
$menu=$_GET[menu];
include("../sites/views/wp_".$menu."/showtab.inc.php");
echo "<html>";
echo "<link rel='stylesheet' type='text/css' href='style.css' />";
echo "<body>";
$timestamp = time();
$datum = date("d.m.Y",$timestamp);
$uhrzeit = date("H:i",$timestamp);
$headline=$prtarray['headline'];
echo "<h3>".$headline." vom ".$datum." - ".$uhrzeit." Uhr</h3>";
//echo "<h2>Liste vom ".$datum." - ".$uhrzeit." Uhr</h2>";

$dbselarr = $_SESSION['DBSELARR'];
$count=sizeof($dbselarr);

echo "<table border'2' style='font-size: 12px;'>";
include ("../config.php");

echo "<tr height='20'>";
foreach ( $listarray as $arrelement ) {
  if ($arrelement['fieldprthide']<>"true") {	
    echo "<td>".$arrelement['label']."</td>";
  }  	
}
echo "</tr>";
for ( $x = 0; $x < $count; $x++ ) {
  echo "<tr height='20'>";
  $indstr=$dbselarr[$x];
  $query="SELECT * FROM ".$pararray['dbtable']." WHERE fldindex=".$indstr;	
  $result = mysql_query($query) or die(mysql_error().$query);
  $line = mysql_fetch_array($result);
  foreach ( $listarray as $arrelement ) {
  	 if ($arrelement['fieldprthide']<>"true") {
      echo "<td width='".$arrelement['width']."'>".$line[$arrelement['dbfield']]."</td>";
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