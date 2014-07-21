<?php
header("content-type: text/html; charset=utf-8");

function dauerauftragauswahl($menu,$idwert) {
  //echo "dauerauftrag func<br>";
  $timestamp = time();
  $datum = date("Y-m-d",$timestamp);
  $query = "SELECT * FROM tblerl_dauer WHERE flddatum<='".$datum."' and fldaktiv='J'";
  //echo $query."<br>";
  $result = mysql_query($query) or die(mysql_error());
  $count=0;
  while ($line = mysql_fetch_array($result)) {
    $count++;      
    $strbez = $line[fldbez];
    $korr = $line[fldkorrektur];
    $zeitinter = $line[fldzeitraum];
    $pos1=strpos($strbez,"%");
    if ($pos1>0) {
      $pos2=strpos($strbez,"%",$pos1+1);
      $strteil=substr($strbez,$pos1,$pos2-$pos1+1);
      $strzeit=substr($strbez,$pos1+1,$pos2-$pos1-1);
      //$timestamp = time();
      if ($zeitinter=="Tage") {
        $timestamp  = mktime(0, 0, 0, date("m"), date("d")+$korr,  date("Y"));
      } else {
        $timestamp  = mktime(0, 0, 0, date("m")+$korr, date("d"),  date("Y"));
      }    
      $zeitraum = date($strzeit,$timestamp);
      $strbez = str_replace($strteil,$zeitraum,$strbez);
    }
    $bez="'".$strbez."'";
    $status="'".$line[fldstatus]."'";
    $benutzer="'".$line[fldbenutzer]."'";
    $datum="'".$line[flddatum]."'";
    $prior="'".$line[fldprior]."'";
    $gruppe="'".$line[fldGruppe]."'";
    $cat="'".$line[fldcategory]."'";
    $qryerl="INSERT INTO tblerledigung (fldBezeichnung,fldStatus,fldBenutzer,fldDatum,fldPrior,fldGruppe,fldcategory) VALUES ($bez,$status,$benutzer,$datum,$prior,$gruppe,$cat)";
    echo $count.". ".$bez."<br>";    
    //echo $qryerl."<br>";
    $reserl = mysql_query($qryerl) or die(mysql_error());
    $tag=substr($line[flddatum],8,2);
    $mon=substr($line[flddatum],5,2);
    if ($zeitinter=="Tage") {
      $tag=$tag+$line[fldmonat];
    } else {
      $mon=$mon+$line[fldmonat];
    }  
    $jahr=substr($line[flddatum],0,4);
    if ($tag>30) {
      $tag=1;
      $mon=$mon+1;
    }
    if ($mon>12) {
      $mon=$mon-12;
      $jahr=$jahr+1;
    }
    $datum=$jahr."-".$mon."-".$tag;
    $qryupd="UPDATE tblerl_dauer SET flddatum='".$datum."' WHERE fldindex=".$line[fldindex];
    //echo $qryupd."<br>";
    $resupd = mysql_query($qryupd) or die(mysql_error());
  }  
  echo "<div class='alert alert-success'>";
  echo $count." Daueraufträge wurden eingefügt.";
  echo "</div>";
}
?>