<?php
header("content-type: text/html; charset=utf-8");

function showgrafik($vonmonat,$bismonat) {
include("../config.php");

  unlink('chart/ausgaben.html');
  $fh = fopen('chart/ausgaben.html', 'w+');
  fwrite($fh, "<html>\n");
  fwrite($fh, "<body>\n");
  fwrite($fh, "<applet code='Chart.class' width=500 height=400>\n");
  fwrite($fh, "<param name='title' value='Kontenübersicht Ausgaben'/>\n");
  $vondatum="2013-12-01";
  $bisdatum="2013-12-04";

  $query="SELECT fldKonto AS anz FROM tblktosal WHERE fldInhaber='HORST' and fldDatum>='".$vondatum."' and fldDatum<='".$bisdatum."' group by fldKonto";
  $result = mysql_query($query) or die("Error using mysql_query($query): ".mysql_error());
  $anz = mysql_num_rows ( $result );
  $anz = $anz + 1;
  fwrite($fh, "<param name='values' value='".$anz."'/>\n");
  echo "Anz:".$anz."<br>";

  $query="SELECT sum(fldBetrag) as betrag, fldKonto FROM tblktosal WHERE fldInhaber='HORST' and fldDatum>='".$vondatum."' and fldDatum<='".$bisdatum."' group by fldKonto";
  $result = mysql_query($query) or die("Error using mysql_query($query): ".mysql_error());
  $count=0;
  $sum=0;
  while ($line = mysql_fetch_array($result)) {
  	 $count=$count+1; 
    $qrykto="SELECT * FROM tblktokonten WHERE fldKurz='".$line['fldKonto']."'";
    $reskto = mysql_query($qrykto) or die("Error using mysql_query($qrykto): ".mysql_error());
    $linkto = mysql_fetch_array($reskto);
    if ($linkto['fldfarbe']=="") {
      $farbe="#1100FF";
    } else {
      $farbe=$linkto['fldfarbe'];    
    }  
    echo $count.":".$line['fldKonto'].",".$line['betrag'].",".$farbe."<br>";

    $betrag=$line['betrag']*-1;
    $sum=$sum+$betrag;
    fwrite($fh, "<param name='name.".$count."' value='".$line['fldKonto']."'/>\n");
    fwrite($fh, "<param name='value.".$count."' value='".$betrag."'/>\n");
    fwrite($fh, "<param name='color.".$count."' value='".$farbe."'/>\n");
  }  
  $count=$count+1;
  fwrite($fh, "<param name='name.".$count."' value='Summe'/>\n");
  fwrite($fh, "<param name='value.".$count."' value='".$betrag."'/>\n");
  fwrite($fh, "<param name='color.".$count."' value='#222222'/>\n");

  fwrite($fh, "</applet>\n");
  fwrite($fh, "</body>\n");
  fwrite($fh, "</html>\n");
  fclose($fh);
  echo "<div class='alert alert-info'>";
  echo "Einen Augenblick! Auswertung wird erstellt.<br>"; 
  echo "</div>";
  echo "<a href='chart/ausgaben.html'>Ausgaben</a>";	
//  echo "<meta http-equiv='refresh' content='0; URL=chart/ausgaben.html'>";  
}

function showgrafik1($vonmonat,$bismonat) {
include("../config.php");

echo "<html>";
echo "<body>";
echo "<applet code='Chart.class' width=400 height=300>";
echo "<param name='title' value='Ausgaben'/>";
echo "<param name='values' value='3'/>";
echo "<param name='name.1' value='Lebensmittel'/>";
echo "<param name='name.2' value='Haushalt'/>";
echo "<param name='name.3' value='Strom'/>";
echo "<param name='value.1' value='310'/>";
echo "<param name='value.2' value='500'/>";
echo "<param name='value.3' value='800'/>";
echo "<param name='color.1' value='#AA00FF'/>";
echo "<param name='color.2' value='#EE82EE'/>";
echo "<param name='color.3' value='#FF8200'/>";
echo "</applet>";
echo "</body>";
echo "</html>";

}

?>