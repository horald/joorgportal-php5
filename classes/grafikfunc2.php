<?php
header("content-type: text/html; charset=utf-8");

function showgrafik($vonmonat,$bismonat) {
include("../config.php");

echo "    <link rel='stylesheet' href='demos.css' type='text/css' media='screen' />";
    
echo "    <script type='text/javascript' src='../../../tools/RGraph/libraries/RGraph.common.core.js' ></script>";
echo "    <script type='text/javascript' src='../../../tools/RGraph/libraries/RGraph.bar.js' ></script>";
    
    
echo "</head>";


  $wert1=85;
  $wert2=41;
  $wert3=11;
  $count=$bismonat;
  $wert="";
  $label="";
  for($mon = $vonmonat; $mon < $count; $mon++) {

    $query = "SELECT sum(fldBetrag) AS Betrag, month(fldDatum) as Monat FROM `tblktosal`,tblktobanken WHERE fldInhaber=tblktobanken.fldBez AND month(fldDatum)=".$mon." AND fldKonto='LEBEN' AND year(fldDatum)=2013 GROUP BY month(fldDatum)";
    //echo $query."<br>";     
    $result = mysql_query($query) or die("Error using mysql_query($query): ".mysql_error());
    $line = mysql_fetch_array($result);
    $wert1=$line[Betrag];

    $wert=$wert."[".$wert1.",".$wert2.",".$wert3."],";
    $label=$label."'".$mon."',";
  }


  $query = "SELECT sum(fldBetrag) AS Betrag, month(fldDatum) as Monat FROM `tblktosal`,tblktobanken WHERE fldInhaber=tblktobanken.fldBez AND month(fldDatum)=".$bismonat." AND fldKonto='LEBEN' AND year(fldDatum)=2013 GROUP BY month(fldDatum)";
  //echo $query."<br>";     
  $result = mysql_query($query) or die("Error using mysql_query($query): ".mysql_error());
  $line = mysql_fetch_array($result);
  $wert1=$line[Betrag];

  $wert=$wert."[".$wert1.",".$wert2.",".$wert3."]";
  $label=$label."'".$count."'";
  echo $wert."=wert<br>";
  echo $label."=label<br>";


echo "<body>";
echo "    <canvas id='cvs' width='1000' height='250'>[No canvas support]</canvas>";

echo "    <script>";
echo "        window.onload = function ()";
echo "        {";
echo "            var bar4 = new RGraph.Bar('cvs', [".$wert."])";
//echo "                .Set('colors', ['#2A17B1','#3A27F1','#8AA7F1'])";
echo "                .Set('labels', [".$label."])";
echo "                .Set('labels.above', true)";
echo "                .Set('labels.above.decimals', 2)";
echo "                .Set('numyticks', 5)";
echo "                .Set('ylabels.count', 5)";
echo "                .Set('gutter.left', 55)";
echo "                .Set('variant', '3d')";
echo "                .Set('strokestyle', 'transparent')";
echo "                .Set('units.pre', ' ')";
echo "                .Set('hmargin.grouped', 0)";
echo "                .Set('scale.round', true)";

echo "                .Set('noyaxis', true)";
echo "                .Set('ymax', 80)";
echo "                .Set('xmax', 100)";
echo "                .Set('xaxispos', 'center')";

echo "                .Set('key', ['Lebensmittel','Haushalt','Strom'])";
echo "                .Set('key.colors', ['blue','#c00','#0c0'])";
echo "                .Set('chart.key.position.gutter.boxed', true)";
echo "                .Set('key.position', 'gutter')";
echo "                .Set('key.position.x', 5)";
echo "                .Set('key.position.y', 5)";
echo "                .Draw();";
echo "        }";
echo "    </script>";

echo "</body>";
echo "</html>";
}

?>