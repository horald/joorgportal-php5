<?php
header("content-type: text/html; charset=utf-8");
session_start();

function bucheninsert($menu,$idwert) {
  echo "<form class='form-horizontal' method='post' action='buchen.php?buchen=1&menu=".$menu."&idwert=".$idwert."'>";
  echo "  <fieldset>";

  $fquery = "SELECT * FROM tblktoart";
  $fresult = mysql_query($fquery) or die(mysql_error());
  echo "<select name='ktoart".$count."' size='1'>";
  while ($fline = mysql_fetch_array($fresult)) {
    $strindex = $fline[fldIndex];
    $strbez = $fline[fldBez];
    echo "<option style='background-color:#c0c0c0;' value=".$strbez." >".$strbez."</option>";
  }
  echo "</select>";

  echo "  <div class='control-group'>";
  echo "    <div class='form-actions'>";
  echo "      <button type='submit' name='submit' class='btn btn-primary'>OK</button>";
  echo "      <button class='btn'>Abbruch</button>";
  echo "    </div>";
  echo "  </div>";
  echo "  </fieldset>";
  echo "</form>";
}

function array_find($listarray, $lincol)
{
  $export="J";
  foreach ($listarray as $arrelement)
  {
    if ($arrelement['dbfield']==$lincol) {
      if (array_key_exists('export', $arrelement)) {
        $export=$arrelement['export'];
      }
    }
  }
  return $export;
}

function buchfunc($menu,$idwert,$pararray,$listarray,$exportpfad) {
  //$today = date('Y-m-d-H-i-s');
  //$datei="result-".$today.".txt";
  //echo "<div class='alert alert-success'>";
  //echo "Exportpfad:".$exportpfad.$datei."<br>";
  //echo "</div>";
  $fldkto=$_POST['ktoart'];
  $fldbez="Lastschrift";
  $konto="CHRIS";
  $qryort = "SELECT DISTINCT fldOrt,fldEinkaufDatum FROM ".$pararray['dbtable']." WHERE ".$pararray['fldarchivdat']."=''";
  //echo $qryort."<br>";
  $pos=0;
  $resort = mysql_query($qryort) or die(mysql_error());
  while ($linort = mysql_fetch_array($resort)) {
    $kaufort=$linort['fldOrt'];
    $datum=$linort['fldEinkaufDatum'];
    $qrydel = "DELETE FROM tblktosal WHERE fldtyp='BUCHEN' and fldInhaber='".$konto."' and fldDatum='".$datum."'";
    //echo $qrydel."<br>";
    $resdel = mysql_query($qrydel) or die(mysql_error());

    $qryort="SELECT * FROM tblorte WHERE fldBez='".$kaufort."'";
    //echo $qryort."=kaufort<br>";
    $resort = mysql_query($qryort) or die(mysql_error());
    $linort = mysql_fetch_array($resort);
    $ortid=$linort['fldIndex'];

    if ($fldkto=="LASTSCHRIFT") {
      $qrysum = "SELECT sum(fldPreis * fldAnz) AS sumpreis FROM ".$pararray['dbtable']." WHERE ".$pararray['fldarchivdat']."=''";
      //echo $qrysum."<br>";
      $ressum = mysql_query($qrysum) or die(mysql_error());
      $linsum = mysql_fetch_array($ressum);
      $sumpreis = $linsum['sumpreis'];
      $pos=$pos+1;
      $qryins="INSERT tblktosal (fldPos,fldDatum,fldBez,fldKonto,fldBetrag,fldInhaber,fldid_ort,fldtyp) VALUES(".$pos.",'".$datum."','".$kaufort." ".$fldbez."','".$fldkto."','".$sumpreis."','".$konto."',".$ortid.",'BUCHEN')";
      echo "<div class='alert alert-success'>";
      echo $qryins."<br>";  
      echo "</div>";
      $resins = mysql_query($qryins) or die(mysql_error());
    } 
    $qrypreis = "SELECT fldKonto, SUM(fldPreis*fldAnz) AS SumPreis FROM ".$pararray['dbtable']." WHERE fldArchivDat='' GROUP BY fldKonto";
    $respreis = mysql_query($qrypreis) or die(mysql_error());
    $sumpreis=0;
    while ($linpreis = mysql_fetch_array($respreis)) {
      $pos=$pos+1;
      $preis=$linpreis[SumPreis];
      $preis=$preis*-1; 
      $sumpreis=$sumpreis+$linpreis[SumPreis];
      $qryins="INSERT tblktosal (fldPos,fldDatum,fldBez,fldKonto,fldBetrag,fldInhaber,fldid_ort,fldtyp) VALUES(".$pos.",'".$datum."','".$kaufort." Einkauf','".$linpreis[fldKonto]."','".$preis."','".$konto."',".$ortid.",'BUCHEN')";
      echo "<div class='alert alert-success'>";
      echo $qryins."<br>";
      echo "</div>";
      $resins = mysql_query($qryins) or die(mysql_error());
    }
  }
}

function xbuchfunc($menu,$idwert,$pararray,$listarray,$exportpfad) {
  $today = date('Y-m-d-H-i-s');
  $datei="result-".$today.".txt";
  echo "<a class='btn btn-primary' href='showtab.php?menu=".$menu."&idwert=".$idwert."'>zurueck</a><br>";
  $dbtable=$pararray['dbtable'];
  //$query="SELECT * INTO OUTFILE '/tmp/result.txt' FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '".chr(39)."' LINES TERMINATED BY '\n' FROM ".$dbtable." WHERE fldArchivDat=''";
  $query="SELECT * INTO OUTFILE '/tmp/result.txt' FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' FROM ".$dbtable." WHERE fldArchivDat=''";
  //echo $query."=query<br>";
  echo "<div class='alert alert-success'>";
  echo "Exportpfad:".$exportpfad.$datei."<br>";
  //$result = mysql_query($query) or die(mysql_error());
  echo "</div>";
  //copy("/tmp/result.txt",$exportpfad.$datei);
  //unlink('/tmp/result.txt');

  $qrycol = "SHOW COLUMNS FROM ".$pararray['dbtable'];
  $rescol = mysql_query($qrycol) or die(mysql_error());
  $lincol = mysql_fetch_array($rescol);

  $col = "";
  $lincnt = 1;
  while ($lincol = mysql_fetch_array($rescol)) {
  	 $lincnt = $lincnt + 1;
    $colarr=array_find($listarray,$lincol[0]);
    if ($colarr<>"N") {
      if ($col=="") {
        $col = $lincol[0];
      } else {
        $col = $col . "," . $lincol[0];
      }
    }     
  }

  $dbselarr = $_SESSION['DBSELARR'];
  $count=sizeof($dbselarr);
  //echo $count."=count<br>";
  for ( $zaehl = 0; $zaehl < $count; $zaehl++ ) {
  
    //$cnt=$cnt+1;
    //$idwert = $arrid[$zaehl];
       
    $qryval = "SELECT ".$col." FROM ".$pararray['dbtable']." WHERE fldIndex=".$dbselarr[$zaehl];
    echo $qryval."<br>";
  }  
  
}

?>