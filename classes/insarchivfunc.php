<?php
header("content-type: text/html; charset=utf-8");
session_start();

function insarchivsave($pararray,$archivtable,$menu) {
//  echo "<a class='btn btn-primary' href='showtab.php?menu=".$menu."'>zurueck</a><br>";
  $chkarchiv = $_POST['chkarchiv'];
  $datum=$_POST['datum'];
  if ($chkarchiv==1) {
    $dbselarr = $_SESSION['DBSELARR'];
    $count=sizeof($dbselarr);
    for ( $zaehl = 0; $zaehl < $count; $zaehl++ ) {
      $idwert = $dbselarr[$zaehl];
      $query="UPDATE ".$pararray['dbtable']." SET ".$pararray['fldarchivdat']."='".$datum."' WHERE ".$pararray['fldindex']."=".$idwert;
      //echo $query."<br>";
      mysql_query($query) or die("Error using mysql_query($sql): ".mysql_error());
    } 
    //$query="UPDATE ".$pararray['dbtable']." SET ".$pararray['fldarchivdat']."='".$datum."' WHERE ".$pararray['fldarchivdat']."=''";
    //  echo $query."<br>";
    echo "<div class='alert alert-success'>";
    echo "Daten f&uumlr den ".$datum." ins Archiv verschoben.";
    echo "</div>";
//    mysql_query($query) or die("Error using mysql_query($sql): ".mysql_error());
  }  

  $chkbarcode = $_POST['chkbarcode'];
  if ($chkbarcode==1) {
    $query = "SELECT * FROM ".$pararray['dbtable']." WHERE fldArchivDat='' AND fldBarcode<>''";
    $result = mysql_query($query) or die("Error using mysql_query($query): ".mysql_error());
    while ($line = mysql_fetch_array($result)) {
      $qrybarcode = "SELECT * FROM tblbarcode WHERE fldbarcode='".$line[fldBarcode]."'";
      $resbarcode = mysql_query($qrybarcode) or die("Error using mysql_query($qryvorrat): ".mysql_error());
      if ($linbarcode = mysql_fetch_array($resbarcode)) {
      } else {	
        $qryins="INSERT tblbarcode (fldbez,fldbarcode) VALUES('".$line[fldBez]."','".$line[fldBarcode]."')";
        echo $qryins."<br>";
        $insresult = mysql_query($qryins) or die("Error using mysql_query($qryins): ".mysql_error());
      }	
    }
  }

  $chkpreis = $_POST['chkpreis'];
  if ($chkpreis==1) {
    $query = "SELECT * FROM ".$pararray['dbtable']." WHERE fldArchivDat='' AND fldBarcode<>''";
    //echo $query."<br>";     
    $result = mysql_query($query) or die("Error using mysql_query($query): ".mysql_error());
    while ($line = mysql_fetch_array($result)) {
      $qryartikel = "SELECT * FROM tblartikel WHERE fldBarcode='".$line[fldBarcode]."'";
      //echo $qryartikel."<br>";      
      $resartikel = mysql_query($qryartikel) or die("Error using mysql_query($qryvorrat): ".mysql_error());
      if ($linartikel = mysql_fetch_array($resartikel)) {
        if ($linartikel[fldPreis]<$line[fldPreis]) { 
          echo "<div class='alert alert-warning'>";
          echo $linartikel[fldBez]." bei ".$linartikel[fldOrt]." von ".$linartikel[fldPreis]." € auf ".$line[fldPreis]." € erhöht.";
          echo "</div>";
        }
        if ($linartikel[fldPreis]>$line[fldPreis]) { 
          echo "<div class='alert alert-info'>";
          echo $linartikel[fldBez]." bei ".$linartikel[fldOrt]." von ".$linartikel[fldPreis]." € auf ".$line[fldPreis]." € herabgesetzt.";
          echo "</div>";
        }
        $updquery="UPDATE tblartikel SET fldPreis=$line[fldPreis] WHERE fldBarcode='".$line[fldBarcode]."'";  
        $updresult = mysql_query($updquery) or die("Error using mysql_query($query): ".mysql_error());
      } else {
        echo "<div class='alert alert-info'>";
        echo $line[fldBez]." bei ".$line[fldOrt]." von ".$line[fldPreis]." eingef&uumlgt.";
        echo "</div>";
        $insquery="INSERT INTO tblartikel (fldBez,fldTyp,fldAbteilung,fldOrt,fldPreis,fldAnz,fldKonto,fldBarcode) VALUES ('".$line['fldBez']."','','".$line['fldAbteilung']."','".$line['fldOrt']."','".$line['fldPreis']."','".$line['fldAnz']."','".$line['fldKonto']."','".$line['fldBarcode']."')";  
        $insresult = mysql_query($insquery) or die("Error using mysql_query($insquery): ".mysql_error());
      }	 
    } 
  }	

  $chkvorrat = $_POST['chkvorrat'];
  if ($chkvorrat==1) {

//   $query = "SELECT * FROM ".$pararray['dbtable']." WHERE fldArchivDat='' AND fldBarcode<>'' AND flde01vorrat=0";
   $query = "SELECT * FROM ".$pararray['dbtable']." WHERE fldArchivDat='' AND fldBarcode<>''";
   //echo $query."<br>";
   $result = mysql_query($query) or die("Error using mysql_query($query): ".mysql_error());
   $count=0;
   while ($line = mysql_fetch_array($result)) {
     $count=$count+1;	 
     $qryvorrat = "SELECT * FROM tblvorrat WHERE fldv01barcode='".$line[fldBarcode]."'";
     $resvorrat = mysql_query($qryvorrat) or die("Error using mysql_query($qryvorrat): ".mysql_error());
     $menge=number_format($line[fldAnz],0);
     $linvorrat = mysql_fetch_array($resvorrat);   
//     if ($linvorrat = mysql_fetch_array($resvorrat)) {
       //echo $line[fldBarcode].",".$line[fldAnz]." gefunden.<br>";  
//       $qryupd="UPDATE tblvorrat SET fldv01verpack='Neu',fldv01gekauftam='$datum', fldv01anzahl=fldv01anzahl+".$menge." WHERE fldv01barcode='".$line[fldBarcode]."'";
//       echo $qryupd."<br>";        
//       $resupd = mysql_query($qryupd) or die("Error using mysql_query($qryupd): ".mysql_error());
//       $lindex = $linvorrat[fldv01index];  
//     } else {
     	 //echo $line[fldBarcode]." nicht gefunden.";
       $query = "INSERT INTO tblvorrat (fldv01bez,fldv01barcode,fldv01ort,fldv01verpack,fldv01anzahl,fldv01gekauftam) VALUES ('$line[fldBez]','$line[fldBarcode]','18','Neu',$menge,$datum)";
       echo $query."<br>";       
       $resin = mysql_query($query) or die("Error using mysql_query($query): ".mysql_error());
       $query = "SELECT fldv01index FROM tblvorrat ORDER BY fldv01index DESC LIMIT 1";
       $resid = mysql_query($query) or die("Error using mysql_query($sql): ".mysql_error());
       $liid = mysql_fetch_array($resid);
       $lindex = $liid[fldv01index];
//     } 		
	  //echo "$line[fldIndex] $line[fldBez] $liid[fldv01index] <br>";
	  $query = "UPDATE ".$pararray['dbtable']." SET flde01vorrat='$lindex' WHERE fldIndex='$line[fldIndex]'";
     $resort = mysql_query($query) or die("Error using mysql_query($query): ".mysql_error());
   }

    echo "<div class='alert alert-success'>";
    echo $count." Daten in den Vorrat verschoben.";
    echo "</div>";
  }  


  $count = $_POST['count'];
  $cnt=0;
  $pos=9;
  if ($count>0) {
    for($zaehl = 1; $zaehl <= $count; $zaehl++)
    {
      $idcheck = $_POST['cbutton'.$zaehl];
	   if ($idcheck==1) {
	     $cnt=$cnt+1;
        $kaufort=$_POST['idwert'.$zaehl];
        $ktoart=$_POST['ktoart'.$zaehl];
        $konto=$_POST['konto'.$zaehl];
        if ($ktoart=="Lastschrift") {
          $pos=$pos+1;
          $qrysum = "SELECT sum(fldPreis * fldAnz) AS sumpreis FROM ".$pararray['dbtable']." WHERE fldOrt='".$kaufort."' AND ".$pararray['fldarchivdat']."='".$datum."'";
          //echo $qrysum."<br>";
          $ressum = mysql_query($qrysum) or die(mysql_error());
          $linsum = mysql_fetch_array($ressum);
          $sumpreis = $linsum['sumpreis'];
          //echo $sumpreis."lastschrift erkannt.<br>";
          $qryins="INSERT tblktosal (fldPos,fldDatum,fldBez,fldKonto,fldBetrag,fldInhaber) VALUES(".$pos.",'".$datum."','".$kaufort." Lastschrift','LASTSCHRIFT','".$sumpreis."','".$konto."')";
          echo $qryins."<br>";
          $resins = mysql_query($qryins) or die(mysql_error());
        }
        //echo $kaufort.",".$ktoart.",".$konto."<br>"; 
        $qrypreis = "SELECT fldKonto, SUM(fldPreis*fldAnz) AS SumPreis FROM ".$pararray['dbtable']." WHERE fldOrt='".$kaufort."' AND fldArchivDat='".$datum."' GROUP BY fldKonto";
        //echo $qrypreis."=qrypreis<br>";
        $respreis = mysql_query($qrypreis) or die(mysql_error());
        $sumpreis=0;
        while ($linpreis = mysql_fetch_array($respreis)) {
          $pos=$pos+1;
          $preis=$linpreis[SumPreis];
          $preis=$preis*-1; 
          $sumpreis=$sumpreis+$linpreis[SumPreis];
          //echo $linpreis[fldKonto].",".$linpreis[SumPreis]."=konto,preis<br>";
          $qryort="SELECT * FROM tblorte WHERE fldBez='".$kaufort."'";
          $resort = mysql_query($qryort) or die(mysql_error());
          $linort = mysql_fetch_array($resort);
          $ortid=$linort['fldIndex'];
          $qryins="INSERT tblktosal (fldPos,fldDatum,fldBez,fldKonto,fldBetrag,fldInhaber,fldid_ort) VALUES(".$pos.",'".$datum."','".$kaufort." Einkauf','".$linpreis[fldKonto]."','".$preis."','".$konto."',".$ortid.")";
          echo $qryins."<br>";
          $resins = mysql_query($qryins) or die(mysql_error());
        }
      }
    }
  }    

  mysql_close();
}

function insarchivinput($pararray,$archivtable,$eingdatum,$strort,$idwert,$menu) {
  echo "<form class='form-horizontal' method='post' action='insarchiv.php?insarchiv=1&menu=".$menu."&idwert=".$idwert."'>";
  echo "  <fieldset>";
  echo "          <div class='control-group'>";
  echo "<div>";
  if ($eingdatum<>"") {
    $dbselarr = $_SESSION['DBSELARR'];
    $idwert = $dbselarr[0];
    $query = "SELECT DISTINCT ".$eingdatum." FROM ".$archivtable." WHERE ".$pararray['fldindex']."=".$idwert;
    $result = mysql_query($query) or die(mysql_error());
    $line = mysql_fetch_array($result);
    $datum=$line[$eingdatum];
  } 
  echo "Datum: ";
?>
        <input type="Text" id="datum" name="datum" value="<?php echo $datum; ?>"/>
        <img src="images2/cal.gif" onclick="javascript:NewCssCal('datum','yyyyMMdd','ARROW')" style="cursor:pointer"/>
<?php 
  echo "</div>";
  echo "<div>";
  echo "<br>";
  echo "<input type='checkbox' name='chkarchiv' value='1' >ins Archiv übertragen ";
  echo "<input type='checkbox' name='chkvorrat' value='1' >in den Vorrat übertragen ";
  echo "<input type='checkbox' name='chkpreis' value='1' >Preise in Stammdaten aktualisieren ";
  echo "<input type='checkbox' name='chkbarcode' value='1' >Barcode &uumlbertragen<br><br>";
  if ($strort<>"") {
    echo "<table class='table table-hover'>";
    echo "<thead>";
    echo "<th width='5'><input type='checkbox' name='cbuttonAll' value='1'></th>";    echo "<th> Kaufort</th>";
    echo "<th>Kontenart</th>";
    echo "<th>Konto</th>";
    echo "</thead>";  
    $query = "SELECT DISTINCT fldOrt FROM ".$archivtable." WHERE fldArchivDat=''";
    $result = mysql_query($query) or die(mysql_error());
    $count=0;
    while ($line = mysql_fetch_array($result)) {
      $count = $count + 1;
      $entry=$line[fldOrt]; 
      echo "<tr>";
      echo "<input type='hidden' name='idwert".$count."' value=".$entry.">";
      echo "<td width='5'><input type='checkbox' name='cbutton".$count."' value='1'></td>";
      echo "<td> ".$entry ."</td>";

      echo "<td>";
      $fquery = "SELECT * FROM tblktoart";
      $fresult = mysql_query($fquery) or die(mysql_error());
      echo "<select name='ktoart".$count."' size='1'>";
      while ($fline = mysql_fetch_array($fresult)) {
        $strindex = $fline[fldIndex];
        $strbez = $fline[fldBez];
        echo "<option style='background-color:#c0c0c0;' value=".$strbez." >".$strbez."</option>";
      }
      echo "</select>";
      echo "</td>";
      echo "<td>";
      $fquery = "SELECT * FROM tblktobanken";
      $fresult = mysql_query($fquery) or die(mysql_error());
      echo "<select name='konto".$count."' size='1'>";
      while ($fline = mysql_fetch_array($fresult)) {
        $strbez = $fline[fldBez];
        if ($strbez=="HORST") {
          echo "<option style='background-color:#c0c0c0;' value=".$strbez." selected>".$strbez."</option>";
        } else {
          echo "<option style='background-color:#c0c0c0;' value=".$strbez." >".$strbez."</option>";
        }  
      }
      echo "</select>";
      echo "</td>";

      echo "</tr>";
    }
    echo "<input type='hidden' name='count' value=".$count."/>";
    echo "</table>";
  }
  echo "</div>";
  echo "  <div class='form-actions'>";
  echo "     <button type='submit' name='submit' class='btn btn-primary'>OK</button>";
  echo "     <button class='btn'>Abbruch</button>";
  echo "  </div>";
  echo "</div>";
  echo "  </fieldset>";
  echo "</form>";
}