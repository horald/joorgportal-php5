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
  	 $width=strval($arrelement['width'])+3;
    echo "<td width='".$width."'>".$arrelement['label']."</td>";
  }  
}
echo "</tr>";
echo "</table>";
echo "<table border='3'>";
$dbselarr = $_SESSION['DBSELARR'];
$count=sizeof($dbselarr);
//echo $count."=count<br>";
for ( $x = 0; $x < $count; $x++ ) {
  $query="SELECT * FROM ".$pararray['dbtable']." WHERE fldindex=".$dbselarr[$x];	
  //echo $query."<br>";
  $result = mysql_query($query) or die(mysql_error().$query);
  $line = mysql_fetch_array($result);
  echo "<tr height='35'>";
  foreach ( $listarray as $arrelement )
  {
    if (($arrelement['fieldhide']<>"true") && ($arrelement['fieldprthide']<>"true")) {
      $width=strval($arrelement['width']);
      switch ( $arrelement['type'] )
      {
        case 'todate':
          if ($arrelement['calcfield']!="") {
            $wert=strval($line[$arrelement['calcfield']]);
          }
          if ($arrelement['calcteiler']!="") {
            $wert=$wert / strval($line[$arrelement['calcteiler']]);
          }
          $Datum = $line[$arrelement['calcdate']];
          $tag = substr($Datum,8,2);
          $monat = substr($Datum,5,2);
          $jahr = substr($Datum,0,4);
          $date = mktime (0,0,0,$monat,$tag,$jahr);
          $date = $date+(60*60*24*$wert); 
          $Datum = date("d.m.Y",$date); 
        
          echo "<td width='".$width."'>".$Datum."</td>";
        break;
        case 'selectid':
          $qrysel="SELECT * FROM ".$arrelement['dbtable']." WHERE ".$arrelement['seldbindex']."=".$line[$arrelement['dbfield']];	
          //echo $qrysel."<br>";
          $ressel = mysql_query($qrysel) or die(mysql_error().$qrysel);
          $linsel = mysql_fetch_array($ressel);
          $wert=$linsel[$arrelement['seldbfield']];
          echo "<td width='".$width."'>".$wert."</td>";
        break;  
        default:
          echo "<td width='".$width."'>".$line[$arrelement['dbfield']]."</td>";
        break;
      }
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