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
$headline=$prtarray['headline'];
echo "<h3>".$headline."</h3>";
//echo "<h2>Liste vom ".$datum." - ".$uhrzeit." Uhr</h2>";

$dbselarr = $_SESSION['DBSELARR'];
$count=sizeof($dbselarr);
$cntsp=1;
if ($prtarray['maxsp']<$count) {
  $count=$prtarray['maxsp'];
  $anzsp=$prtarray['anzsp'];
}

echo "<table border'2' style='font-size: 12px;'>";
include ("../config.php");
echo "<tr class='tabAuswahl'>";
for ( $cntsp = 0; $cntsp < $anzsp; $cntsp++ ) {
  foreach ( $listarray as $arrelement )
  {
    if (($arrelement['fieldhide']<>"true") && ($arrelement['fieldprthide']<>"true")) {
  	   $width=strval($arrelement['width'])+3;
      echo "<td width='".$width."'>".$arrelement['label']."</td>";
    }  
  }
}  
echo "</tr>";
echo "</table>";
echo "<table border='2' style='font-size: 12px;'>";

for ( $x = 0; $x < $count; $x++ ) {
  echo "<tr height='20'>";
  for ( $cntsp = 0; $cntsp < $anzsp; $cntsp++ ) {
  	 $ind=$x+$cntsp*$count;
  	 $indstr=$dbselarr[$ind];
  	 $druck="false";
  	 if ($indstr<>"") {
      $query="SELECT * FROM ".$pararray['dbtable']." WHERE fldindex=".$indstr;	
      $result = mysql_query($query) or die(mysql_error().$query);
      $line = mysql_fetch_array($result);
      $druck="true";
    }  
    foreach ( $listarray as $arrelement )
    {
      if (($arrelement['fieldhide']<>"true") && ($arrelement['fieldprthide']<>"true")) {
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
            
            if ($druck=="true") {           
              echo "<td width='".$arrelement['width']."'>".$Datum."</td>";
            } else {
              echo "<td width='".$arrelement['width']."'> </td>";
            }  
          break;
          default:
            if ($druck=="true") {
              echo "<td width='".$arrelement['width']."'>".$line[$arrelement['dbfield']]."</td>";
            } else {
              echo "<td width='".$arrelement['width']."'> </td>";
            }  
          break;
        }
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