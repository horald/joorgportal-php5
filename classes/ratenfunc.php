<?php
header("content-type: text/html; charset=utf-8");

function rateninput($pararray,$listarray,$filterarray,$filter,$idwert,$menu) {
  
  echo "<form name='eingabe' class='form-horizontal' method='post' action='raten.php?insert=1&idwert=".$idwert."&menu=".$menu."'>";
  echo "  <fieldset>";

      echo "          <div class='control-group'>";
      echo "            <label class='control-label' style='text-align:left' >Index</label>";
      echo "            <div class='input'>";
      echo "              <input type='text' name='index' value='1483'>";
      echo "            </div>";
      echo "          </div>";

      echo "          <div class='control-group'>";
      echo "            <label class='control-label' style='text-align:left' >Rate</label>";
      echo "            <div class='input'>";
      echo "              <input type='text' name='rate' value='100'>";
      echo "            </div>";
      echo "          </div>";

      echo "          <div class='control-group'>";
      echo "            <label class='control-label' style='text-align:left' >1.Rate</label>";
      echo "            <div class='input'>";
      echo "              <input type='text' name='firstrate' value='350'>";
      echo "            </div>";
      echo "          </div>";

  echo "  <div class='form-actions'>";
  echo "     <button type='submit' name='submit' class='btn btn-primary'>Speichern</button>";
  echo "     <button class='btn'>Abbruch</button>";
  echo "  </div>";
  echo "  </fieldset>";
  echo "</form>";
  
}

function ratensave($pararray,$listarray,$filterarray,$filter,$idwert,$menu) {
  //echo "ratensave<br>";
  $index=$_POST['index'];
  $rate=$_POST['rate'];
  $firstrate=$_POST['firstrate'];
  //echo $index."<br>";
  //echo $rate."<br>";
  $query="SELECT * FROM ".$pararray['dbtable']." WHERE ".$pararray['fldindex']."=".$index;
  //echo $query."<br>";
  $result = mysql_query($query) or die(mysql_error());  $line = mysql_fetch_array($result);  $nBetrag=$line[fldBetrag];
  $nBetrag=$nBetrag+$firstrate;
  echo "Schulden..:".$line[fldBetrag]."<br>";  
  echo "Erste Rate:".$nBetrag."<br>";
  $nMonat=4;
  $strmonat="03";
  $nJahr=2013; 
  $strdatum=$nJahr."-".$strmonat."-01";
  $qryrate="INSERT ".$pararray['dbtable']." (fldDatum,fldBez,fldKonto,fldBetrag,fldInhaber) VALUES('".$strdatum."','Rate','TELEFON',".$firstrate.",'Netcologne')";
  //echo $query."<br>";
  $resrate = mysql_query($qryrate) or die(mysql_error().$qryrate);  while ($nBetrag+$rate<0) {
    $nBetrag=$nBetrag+$rate;
    echo "1.".$nMonat.".".$nJahr.": ".$nBetrag."<br>";
    if ($nMonat<10) {
      $strmonat="0".$nMonat;
    } else {
      $strmonat=$nMonat;
    }
    $strdatum=$nJahr."-".$strmonat."-01";
    $qryrate="INSERT ".$pararray['dbtable']." (fldDatum,fldBez,fldKonto,fldBetrag,fldInhaber) VALUES('".$strdatum."','Rate','TELEFON',".$rate.",'Netcologne')";
    //echo $query."<br>";
    $resrate = mysql_query($qryrate) or die(mysql_error().$qryrate);    $nMonat=$nMonat+1;
    if ($nMonat>12) {
      $nMonat=1;
      $nJahr=$nJahr+1;
    } 
  }
}

?>