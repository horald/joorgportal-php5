<?PHP
session_start();

function druckauswahl($menu,$idwert) {
  echo "<form class='form-horizontal' method='post' action='druckliste.php?menu=".$menu."&idwert=".$idwert."&druck=1'>";
  echo "<fieldset>";
  echo "<div class='control-group'>";

  echo "          <div class='control-group'>";
  echo "            <label class='control-label' style='text-align:left' for='input01'>Anzahl Leerzeilen:</label>";
  echo "            <div class='input'>";
  echo "              <input type='text' id='input01' name='anzleerzl' value='0'>";
  echo "            </div>";
  echo "          </div>";

  echo "  <div class='form-actions'>";
  echo "     <button type='submit' name='submit' class='btn btn-primary'>OK</button>";
  echo "     <button class='btn'>Abbruch</button>";
  echo "  </div>";
  echo "</div>";
  echo "</fieldset>";
  echo "</form>";
}

function druckliste($anzleerzl) {
$menu=$_GET[menu];
include("../sites/views/wp_".$menu."/showtab.inc.php");
include ("../config.php");
echo "<html>";
echo "<link rel='stylesheet' type='text/css' href='style.css' />";
echo "<body>";
$timestamp = time();
$datum = date("d.m.Y",$timestamp);
$uhrzeit = date("H:i",$timestamp);
$dbselarr = $_SESSION['DBSELARR'];
$count=sizeof($dbselarr);
$query="SELECT * FROM ".$pararray['dbtable']." WHERE fldindex=".$dbselarr[0];	
//echo $query."<br>";
$result = mysql_query($query) or die(mysql_error().$query);
$line = mysql_fetch_array($result);
$vondatum=$line['flddatum'];
$vondatum=substr($vondatum,8,2).".".substr($vondatum,5,2).".".substr($vondatum,0,4);
$query="SELECT * FROM ".$pararray['dbtable']." WHERE fldindex=".$dbselarr[$count-1];	
//echo $query."<br>";
$result = mysql_query($query) or die(mysql_error().$query);
$line = mysql_fetch_array($result);
$bisdatum=$line['flddatum'];
$bisdatum=substr($bisdatum,8,2).".".substr($bisdatum,5,2).".".substr($bisdatum,0,4);
//echo "<h2>Liste vom ".$datum." - ".$uhrzeit." Uhr</h2>";
echo "<h3>Liste vom ".$vondatum." - ".$bisdatum." </h3>";
echo "<table border'3'>";
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
        case 'calc':
          echo "<td style='text-align:right' width='".$width."'>".$line[$arrelement['dbfield']]."</td>";
        break;
        default:
          echo "<td width='".$width."'>".$line[$arrelement['dbfield']]."</td>";
        break;
      }
    }  
  }  
  echo "</tr>";
  if ($x==30) {
    for ( $y = 0; $y < $anzleerzl; $y++ ) {
      echo "<tr height='35'>";
      foreach ( $listarray as $arrelement )
      {
        if (($arrelement['fieldhide']<>"true") && ($arrelement['fieldprthide']<>"true")) {
          $width=strval($arrelement['width']);
          echo "<td width='".$width."'>.</td>";
        }
      }  
      echo "</tr>";
    }
  }	
}
for ( $x = 0; $x < $anzleerzl; $x++ ) {
  echo "<tr height='35'>";
  foreach ( $listarray as $arrelement )
  {
    if (($arrelement['fieldhide']<>"true") && ($arrelement['fieldprthide']<>"true")) {
      $width=strval($arrelement['width']);
      echo "<td width='".$width."'>.</td>";
    }
  }  
  echo "</tr>";
}
mysql_free_result($result);
mysql_close();
echo "</table><br>";
echo "</body>";
echo "</html>";
}

?>