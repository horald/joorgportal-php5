<?php
header("content-type: text/html; charset=utf-8");

function showgrafik($vonmonat,$bismonat) {
include("../config.php");
echo "<html>";
echo "<head>";

echo "    <link rel='stylesheet' href='demos.css' type='text/css' media='screen' />";
    
echo "    <script src='../../../tools/RGraph/libraries/RGraph.common.core.js' ></script>";
echo "    <script src='../../../tools/RGraph/libraries/RGraph.common.key.js' ></script>";
echo "    <script src='../../../tools/RGraph/libraries/RGraph.bar.js' ></script>";

echo "    <script src='../../../tools/RGraph/libraries/RGraph.common.dynamic.js' ></script>";
echo "    <script src='../../../tools/RGraph/libraries/RGraph.drawing.rect.js' ></script>";
echo "    <script src='../../../tools/RGraph/libraries/RGraph.line.js' ></script>";

echo "    <title>Joorgportal - Grafik</title>";

echo "</head>";

//$query = "SELECT * FROM `tblktooberkonten` AS ok WHERE ok.fldTyp='AUSGABE'";
$query = "SELECT distinct ok.fldBez AS Bez, ok.fldIndex as Ind FROM tblktosal as ks, tblktokonten as kto, tblktooberkonten as ok WHERE ks.fldKonto=kto.fldKurz and ok.fldIndex=kto.fldid_oberkonto and ks.fldDatum>='2013-12-01' and kto.fldTyp='AUSGABE'";
$result = mysql_query($query);
$arrKonten = array();
$arrKtoID = array();
$key="";
while ($line = mysql_fetch_array($result)) { 
  //$arrKonten[] = $line[fldKurz];
  $arrKtoID[] = $line[Ind];
  $arrKonten[] = $line[Bez];
  $key=$key."'".$line[Bez]."',";
}
$key=substr($key,0,strlen($key)-1);
echo $key."<br>";
$nAnz = count($arrKonten);
echo $nAnz."=nanz<br>";

  $count=$bismonat;
  $label="";
  $wert1=-6;
  $wert2=5;
  $wert3=10;
  $zahlen="";
  for($mon = $vonmonat; $mon < $count; $mon++) {

    $zahlen="[";
    for ($cnt = 1; $cnt<$nAnz; $cnt++) { 
      //$query = "SELECT sum(fldBetrag) AS Betrag, month(fldDatum) as Monat FROM `tblktosal`,tblktobanken WHERE fldInhaber=tblktobanken.fldBez AND month(fldDatum)=".$mon." AND fldKonto='LEBEN' AND year(fldDatum)=2013 GROUP BY month(fldDatum)";
      $query = "SELECT sum(fldBetrag) AS Betrag, month(fldDatum) as Monat FROM tblktosal as ks, tblktokonten as kto, tblktooberkonten as ok WHERE ks.fldKonto=kto.fldKurz and ok.fldIndex=kto.fldid_oberkonto and ks.fldDatum>='2013-12-01' and kto.fldTyp='AUSGABE' AND ok.fldIndex=".$arrKtoID[$cnt]." AND ks.fldInhaber='HORST' GROUP BY month(fldDatum)";
  //    echo $query."=query<br>";     
      $result = mysql_query($query) or die("Error using mysql_query($query): ".mysql_error());
      $line = mysql_fetch_array($result);
      $wert=$line[Betrag];
      $zahlen=$zahlen.$wert.",";
    }
    $zahlen=$zahlen.$wert."],";
    $label=$label."'".$mon."',";
  }
  $query = "SELECT sum(fldBetrag) AS Betrag, month(fldDatum) as Monat FROM `tblktosal`,tblktobanken WHERE fldInhaber=tblktobanken.fldBez AND month(fldDatum)=".$bismonat." AND fldKonto='LEBEN' AND year(fldDatum)=2013 GROUP BY month(fldDatum)";
  //echo $query."<br>";     
  $result = mysql_query($query) or die("Error using mysql_query($query): ".mysql_error());
  $line = mysql_fetch_array($result);
  $wert1=$line[Betrag];

  //$zahlen=$zahlen."[".$wert1.",".$wert2.",".$wert3."]";
  $label=$label."'".$count."'";

  //$zahlen="[-5.11,2.25,3.25],[3.25,2.25,4.25],[-14.25,3.25,4.25], [7.25,2.25,2.25], [2.25,1.25,5.25], [2.25,1.25,5.25]";
  //$label="'Januar','Februar','März','April','Mai','Juni'";

echo "<body>";
        
echo "    <canvas id='cvs' width='1450' height='350'>[No canvas support]</canvas>";

echo "    <script>";
echo "        window.onload = function ()";
echo "        {";

echo "            var bar = new RGraph.Bar('cvs', [".$zahlen."])";
echo "                .Set('labels', [".$label."])";
echo "                .Set('labels.above', true)";
echo "                .Set('labels.above.decimals', 2)";
echo "                .Set('linewidth', 1)";
echo "                .Set('strokestyle', 'white')";
echo "                .Set('colors', ['Gradient(#4572A7:#66f)','Gradient(#AA4643:white)','Gradient(#89A54E:white)'])";
echo "                .Set('shadow', true)";
echo "                .Set('shadow.offsetx', 1)";
echo "                .Set('shadow.offsety', 1)";
echo "                .Set('shadow.blue', 5)";
echo "                .Set('hmargin', 5)";
echo "                .Set('gutter.left', 55)";
echo "                .Set('units.pre', 'Eur ')";
echo "                .Set('background.grid.vlines', false)";
echo "                .Set('axis.color', '#ccc')";
echo "                .Set('noyaxis', true)";
echo "                .Set('ymax', 200)";
echo "                .Set('xmax', 180)";
echo "                .Set('xaxispos', 'center')";

//$key="'Lebensmittel','Haushalt','Strom','Miete'";                
echo "                .Set('key', [".$key."])";
echo "                .Set('key.interactive', true)";
echo "                .Set('chart.key.position.gutter.boxed', true)";
echo "                .Set('key.position', 'gutter')";
            
echo "                .Set('key.position.x', 300)";
echo "                .Set('key.position.y', 20)";
echo "                .Set('key.colors', ['blue','#c00','#0c0'])";
            
echo "               .Draw();";
echo "        }";

echo "    </script>";


echo "</body>";
echo "</html>";
}
?>
