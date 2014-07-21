<?php
header("content-type: text/html; charset=utf-8");
//echo "<link href='../includes/datpicker/css/datepicker.css' rel='stylesheet' />";
//echo "<script type='text/javascript' src='../includes/bootstrap/js/bootstrap-datepicker.js' charset='UTF-8'></script>";
//echo "<script src='../includes/js/datepicker.js'></script>";

function monatsberichtauswahl($menu,$drucken) {
  $druckparam="";
  if ($drucken=="J") {
    $druckparam="&drucken=J";
  }
  echo "<form class='form-horizontal' method='post' action='monatsbericht.php?save=1&menu=".$menu.$druckparam."'>";
  echo "  <fieldset>";
  echo "          <div class='control-group'>";

        $fquery = "SELECT * FROM tblktobanken";
        $fresult = mysql_query($fquery) or die(mysql_error());
        
        //echo "<div class='input-append date' id='dp3' data-date-format='dd-mm-yyyy'>";
        //echo "<input class='span2' size='80' type='text' value='12-02-2013' readonly><span class='add-on'><i class='icon-th'></i></span>";
        //echo "</div><br>";        
        
  echo "<div>";
  echo "Von Datum: ";
  $vondatum="2014-01-01";
?>
        <input type="Text" id="vondatum" name="vondatum" value="<?php echo $vondatum; ?>"/>
        <img src="images2/cal.gif" onclick="javascript:NewCssCal('vondatum','yyyyMMdd','ARROW')" style="cursor:pointer"/>
<?php 
  echo "</div>";
  echo "<div>";
  echo "Bis Datum: ";
  $bisdatum="2014-01-31";
?>
        <input type="Text" id="bisdatum" name="bisdatum" value="<?php echo $bisdatum; ?>"/>
        <img src="images2/cal.gif" onclick="javascript:NewCssCal('bisdatum','yyyyMMdd','ARROW')" style="cursor:pointer"/>
<?php 
  echo "</div>";
        
        
        echo "Kontogruppe: ";
        echo "<select name='ktogrp' size='1'>";
        while ($fline = mysql_fetch_array($fresult)) {
          $strstatus = $fline[fldBez];
          echo "<option style='background-color:#c0c0c0;' >".$strstatus."</option>";
        }
        echo "</select>";
        echo "<label class='checkbox'>";
        echo "<input type='checkbox' name='calc'> nur calc-konten";
        echo "</label>";

        $fquery = "SELECT * FROM tblktoinhgrp_liste";
        $fresult = mysql_query($fquery) or die(mysql_error());
        echo "Inhabergruppe: ";
        echo "<select name='ktoinhgrp' size='1'>";
        while ($fline = mysql_fetch_array($fresult)) {
          $strstatus = $fline[fldbez];
          $index = $fline[fldindex];
          echo "<option style='background-color:#c0c0c0;' value=".$index." >".$strstatus."</option>";
        }
        echo "</select>";
        echo "<br>";

        echo "<label class='checkbox'>";
        echo "<input type='checkbox' name='oberkonten'> nur Oberkonten";
        echo "</label>";

        $fquery = "SELECT * FROM tblktogrp_liste";
        $fresult = mysql_query($fquery) or die(mysql_error());
        echo "Kontoobergruppe: ";
        echo "<select name='ktoogr' size='1'>";
        while ($fline = mysql_fetch_array($fresult)) {
          $strstatus = $fline[fldbez];
          $index = $fline[fldindex];
          echo "<option style='background-color:#c0c0c0;' value=".$index." >".$strstatus."</option>";
        }
        echo "</select>";
        echo "<br>";
 
  echo "     <button type='submit' name='submit' class='btn btn-primary'>Ok</button>";
  echo "</div>";
  echo "  </fieldset>";
  echo "</form>";
}

function neu_monatsberichtanzeigen($menu,$calc,$oberkonten) {
$vondatum=$_POST['vondatum'];
$bisdatum=$_POST['bisdatum'];
$vonmonat=substr($vondatum,5,2);
$bismonat=substr($bisdatum,5,2);
echo $vondatum."=von<br>";
echo $bisdatum."=bis<br>";
echo $vonmonat."=vonmonat<br>";
echo $bismonat."=bismonat<br>";
}

function monatsberichtanzeigen($menu,$calc,$oberkonten,$ktoogr,$ktoinhgrp) {
$vondatum=$_POST['vondatum'];
$bisdatum=$_POST['bisdatum'];
$vonmonat=substr($vondatum,5,2);
$bismonat=substr($bisdatum,5,2);
$jahr=substr($vondatum,0,4);
$ktogrp = $_POST['ktogrp'];
$strwhere="";
$SumVortrag=0;
if ($ktogrp!="(ohne)") {
  $strwhere=" AND fldInhaber='".$ktogrp."'";
  if ($calc==true) {
    $strwhere = $strwhere." AND tblktobanken.fldcalc='JA'";
  }
  echo "<div class='alert alert-info'>";
  echo "Zeitraum: ".$vondatum." - ".$bisdatum." Kontogruppe: ".$ktogrp;
  echo "</div>";
} else {
//  if ($calc==true) {
//    $strwhere = " AND tblktobanken.fldcalc='JA'";
//  }
  echo "<div class='alert alert-info'>";
  if ($calc==true) {
  	 $qryinh="SELECT * FROM tblktobanken,tblktoinhgrpzuord WHERE tblktoinhgrpzuord.fldid_ktoinhaber=tblktobanken.fldIn AND fldid_ktoinhgrp=".$ktoinhgrp;
    $inhaber="".$ktoinhgrp;
    echo "Jahr: ".$jahr." Inhaber:".$inhaber;
  } else {
    echo "Jahr: ".$jahr;
  }  
  echo "</div>";
}
echo "<table class='table table-hover'>";
echo "<thead>";
echo "<th width='15'>Konto</th>";
for ( $mon = $vonmonat; $mon <= $bismonat; $mon++ )
{
  echo "<th style='text-align:right' width='25'>".$mon."</th><td width='5'> </td>";
}
echo "</thead>";

if ($oberkonten==true) {
  $query = "SELECT * FROM tblktooberkonten,tblktogrp_liste WHERE fldTyp='EINNAHME' and tblktooberkonten.fldid_ktogrp=tblktogrp_liste.fldindex and tblktogrp_liste.fldindex=".$ktoogr;
} else {
  $query = "SELECT * FROM `tblktokonten` WHERE fldTyp='EINNAHME'";
}  
//echo $query."<br>";
$result = mysql_query($query);
$arrKonten = array();
$arrKtoBez = array();
$arrKtoInd = array();
while ($line = mysql_fetch_array($result)) { 
  $arrKonten[] = $line[fldKurz];
  $arrKtoBez[] = $line[fldBez];
  $arrKtoInd[] = $line[fldIndex];
}
$nAnz = count($arrKonten);

for ($nMonat=0;$nMonat<12;$nMonat++) { 
    $SumEinnahmeBetrag[] = 0; 
}

for ( $kto = 0; $kto < $nAnz; $kto++ )
{
  $istnull="J";
  for ( $mon = 1; $mon < $vonmonat; $mon++ ) {
    if ($oberkonten==true) {
      //$query = "SELECT sum(fldBetrag) AS Betrag, month(fldDatum) as Monat FROM tblktosal,tblktobanken,tblktooberkonten,tblktogrp_liste AS ober,tblktokonten AS konto WHERE fldInhaber=tblktobanken.fldBez AND month(fldDatum)=".$mon." AND konto.fldKurz='".$arrKonten[$kto]."' AND fldKonto=konto.fldKurz AND ober.fldIndex=konto.fldid_oberkonto  AND year(fldDatum)=".$jahr.$strwhere." and tblktooberkonten.fldid_ktogrp=tblktogrp_liste.fldindex and tblktogrp_liste.fldindex=".$ktoogr." GROUP BY month(fldDatum)";
      $query = "SELECT sum(fldBetrag) AS Betrag,year(fldDatum) as Jahr, month(fldDatum) as Monat,fldInhaber FROM tblktosal,tblktogrpzuord WHERE tblktogrpzuord.fldKurz=tblktosal.fldKonto AND fldid_oberkonto=".$arrKtoInd[$kto]." AND fldDetailInd=0 AND month(fldDatum)=".$mon." AND year(fldDatum)=".$jahr." AND fldInhaber='".$ktogrp."' GROUP BY month(fldDatum),year(fldDatum),fldInhaber";
    } else {
      $query = "SELECT sum(fldBetrag) AS Betrag, month(fldDatum) as Monat FROM tblktosal,tblktobanken WHERE fldInhaber=tblktobanken.fldBez AND month(fldDatum)=".$mon." AND fldKonto='".$arrKonten[$kto]."' AND year(fldDatum)=".$jahr.$strwhere." GROUP BY month(fldDatum)";
    }   
    //echo $query."<br>";
    $result = mysql_query($query) or die("Error using mysql_query($query): ".mysql_error());
    $line = mysql_fetch_array($result);
    $SumVortrag=$SumVortrag+$line[Betrag];
  }
  for ( $mon = $vonmonat; $mon <= $bismonat; $mon++ )
  {
    if ($oberkonten==true) {
      //$query = "SELECT sum(fldBetrag) AS Betrag, month(fldDatum) as Monat FROM tblktosal,tblktobanken,tblktooberkonten AS ober,tblktokonten AS konto WHERE fldInhaber=tblktobanken.fldBez AND month(fldDatum)=".$mon." AND konto.fldKurz='".$arrKonten[$kto]."' AND fldKonto=konto.fldKurz AND ober.fldIndex=konto.fldid_oberkonto  AND year(fldDatum)=".$jahr.$strwhere." GROUP BY month(fldDatum)";
      if ($calc==true) {
        $query = "SELECT sum(fldBetrag) AS Betrag,year(fldDatum) as Jahr, month(fldDatum) as Monat FROM tblktosal,tblktogrpzuord,tblktoinhgrpzuord,tblktobanken WHERE tblktobanken.fldIndex=tblktoinhgrpzuord.fldid_ktoinhaber AND tblktoinhgrpzuord.fldid_ktoinhgrp=".$ktoinhgrp." AND tblktogrpzuord.fldKurz=tblktosal.fldKonto AND tblktosal.fldInhaber=tblktobanken.fldBez AND fldid_oberkonto=".$arrKtoInd[$kto]." AND fldDetailInd=0 AND month(fldDatum)=".$mon." AND year(fldDatum)=".$jahr." GROUP BY month(fldDatum),year(fldDatum)";
      } else { 
        $query = "SELECT sum(fldBetrag) AS Betrag,year(fldDatum) as Jahr, month(fldDatum) as Monat,fldInhaber FROM tblktosal,tblktogrpzuord WHERE tblktogrpzuord.fldKurz=tblktosal.fldKonto AND fldid_oberkonto=".$arrKtoInd[$kto]." AND fldDetailInd=0 AND month(fldDatum)=".$mon." AND year(fldDatum)=".$jahr." AND fldInhaber='".$ktogrp."' GROUP BY month(fldDatum),year(fldDatum),fldInhaber";
      }  
    } else {
      if ($calc==true) {
        $query = "SELECT sum(fldBetrag) AS Betrag, month(fldDatum) as Monat FROM tblktosal,tblktoinhgrpzuord,tblktobanken WHERE tblktobanken.fldIndex=tblktoinhgrpzuord.fldid_ktoinhaber AND tblktoinhgrpzuord.fldid_ktoinhgrp=".$ktoinhgrp." AND tblktosal.fldInhaber=tblktobanken.fldBez AND fldDetailInd=0 AND month(fldDatum)=".$mon." AND fldKonto='".$arrKonten[$kto]."' AND year(fldDatum)=".$jahr.$strwhere." GROUP BY month(fldDatum)";
      } else {	
        $query = "SELECT sum(fldBetrag) AS Betrag, month(fldDatum) as Monat FROM tblktosal,tblktobanken WHERE fldInhaber=tblktobanken.fldBez AND month(fldDatum)=".$mon." AND fldKonto='".$arrKonten[$kto]."' AND year(fldDatum)=".$jahr.$strwhere." GROUP BY month(fldDatum)";
      }  
    }  
    //echo $query."<br>";
    $result = mysql_query($query) or die("Error using mysql_query($query): ".mysql_error());
    if ($line = mysql_fetch_array($result)) {
      $istnull="N";
      $Betrag[$mon] = $line[Betrag]; 
    } else {
      $Betrag[$mon] = 0; 
    } 
  }  
  if ($istnull=="N") {
    echo "<tr>";
    echo "<td width='15'>".$arrKtoBez[$kto]."</td>";
    for ( $mon = $vonmonat; $mon <= $bismonat; $mon++ )
    {
      $SumEinnahmeBetrag[$mon]=$SumEinnahmeBetrag[$mon]+$Betrag[$mon];
      echo "<td style='text-align:right' width='25'>".sprintf("%.2f",$Betrag[$mon])."</td><td width='5'> </td>";
    }
    echo "</tr>";
  }  
}  
echo "<tr bgcolor=lightgreen>";
echo "<td width='15'>Summe Einnahmen</td>";
for ( $mon = $vonmonat; $mon <= $bismonat; $mon++ )
{
  echo "<td style='text-align:right' width='5'>".sprintf("%.2f",$SumEinnahmeBetrag[$mon])."</td><td width='5'> </td>";
}
echo "</tr>";
echo "<tr><td>.</td></tr>"; // leerzeile

if ($oberkonten==true) {
  $query = "SELECT * FROM tblktooberkonten,tblktogrp_liste WHERE fldTyp='AUSGABE' and tblktooberkonten.fldid_ktogrp=tblktogrp_liste.fldindex and tblktogrp_liste.fldindex=".$ktoogr;
} else {
  $query = "SELECT * FROM `tblktokonten` WHERE fldTyp='AUSGABE'";
}  
//echo $query."<br>";
$result = mysql_query($query);
$arrKonten = array();
$arrKtoBez = array();
$arrKtoInd = array();
while ($line = mysql_fetch_array($result)) { 
  $arrKonten[] = $line[fldKurz];
  $arrKtoBez[] = $line[fldBez];
  $arrKtoInd[] = $line[fldIndex];
}
$nAnz = count($arrKonten);

for ($nMonat=0;$nMonat<12;$nMonat++) { 
    $SumAusgabeBetrag[] = 0; 
}

for ( $kto = 0; $kto < $nAnz; $kto++ )
{
  $istnull="J";
  for ( $mon = 1; $mon < $vonmonat; $mon++ ) {
    if ($oberkonten==true) {
      //$query = "SELECT sum(fldBetrag) AS Betrag, month(fldDatum) as Monat FROM tblktosal,tblktobanken,tblktooberkonten AS ober,tblktogrp_liste,tblktokonten AS konto WHERE fldInhaber=tblktobanken.fldBez AND fldDetailInd=0 AND month(fldDatum)=".$mon." AND konto.fldKurz='".$arrKonten[$kto]."' AND fldKonto=konto.fldKurz AND ober.fldIndex=konto.fldid_oberkonto  AND year(fldDatum)=".$jahr.$strwhere." and ober.fldid_ktogrp=tblktogrp_liste.fldindex and tblktogrp_liste.fldindex=".$ktoogr." GROUP BY month(fldDatum)";
      $query = "SELECT sum(fldBetrag) AS Betrag,year(fldDatum) as Jahr, month(fldDatum) as Monat,fldInhaber FROM tblktosal,tblktogrpzuord WHERE tblktogrpzuord.fldKurz=tblktosal.fldKonto AND fldid_oberkonto=".$arrKtoInd[$kto]." AND fldDetailInd=0 AND month(fldDatum)=".$mon." AND year(fldDatum)=".$jahr." AND fldInhaber='".$ktogrp."' GROUP BY month(fldDatum),year(fldDatum),fldInhaber";
    } else {
      $query = "SELECT sum(fldBetrag) AS Betrag, month(fldDatum) as Monat FROM tblktosal,tblktobanken WHERE fldInhaber=tblktobanken.fldBez AND fldDetailInd=0 AND month(fldDatum)=".$mon." AND fldKonto='".$arrKonten[$kto]."' AND year(fldDatum)=".$jahr.$strwhere." GROUP BY month(fldDatum)";
    }  
    //echo $query."<br>";
    $result = mysql_query($query) or die("Error using mysql_query 3:($query): ".mysql_error());
    $line = mysql_fetch_array($result);
    $SumVortrag=$SumVortrag+$line[Betrag];
//    	echo $SumVortrag.",".$mon."=sumvortrag ausgabe<br>";
  }
  $zwiesum=0;
  for ( $mon = $vonmonat; $mon <= $bismonat; $mon++ )
  {
    if ($oberkonten==true) {
      //$query = "SELECT sum(fldBetrag) AS Betrag, month(fldDatum) as Monat FROM tblktosal,tblktobanken,tblktooberkonten AS ober,tblktogrp_liste,tblktokonten AS konto WHERE fldInhaber=tblktobanken.fldBez AND fldDetailInd=0 AND month(fldDatum)=".$mon." AND konto.fldKurz='".$arrKonten[$kto]."' AND fldKonto=konto.fldKurz AND ober.fldIndex=konto.fldid_oberkonto  AND year(fldDatum)=".$jahr.$strwhere." and ober.fldid_ktogrp=tblktogrp_liste.fldindex and tblktogrp_liste.fldindex=".$ktoogr." GROUP BY month(fldDatum)";
      if ($calc==true) {
        $query = "SELECT sum(fldBetrag) AS Betrag,year(fldDatum) as Jahr, month(fldDatum) as Monat FROM tblktosal,tblktogrpzuord,tblktoinhgrpzuord,tblktobanken WHERE tblktobanken.fldIndex=tblktoinhgrpzuord.fldid_ktoinhaber AND tblktoinhgrpzuord.fldid_ktoinhgrp=".$ktoinhgrp." AND tblktogrpzuord.fldKurz=tblktosal.fldKonto AND tblktosal.fldInhaber=tblktobanken.fldBez AND fldid_oberkonto=".$arrKtoInd[$kto]." AND fldDetailInd=0 AND month(fldDatum)=".$mon." AND year(fldDatum)=".$jahr." GROUP BY month(fldDatum),year(fldDatum)";
      } else { 
        $query = "SELECT sum(fldBetrag) AS Betrag,year(fldDatum) as Jahr, month(fldDatum) as Monat,fldInhaber FROM tblktosal,tblktogrpzuord WHERE tblktogrpzuord.fldKurz=tblktosal.fldKonto AND fldid_oberkonto=".$arrKtoInd[$kto]." AND fldDetailInd=0 AND month(fldDatum)=".$mon." AND year(fldDatum)=".$jahr." AND fldInhaber='".$ktogrp."' GROUP BY month(fldDatum),year(fldDatum),fldInhaber";
      }  
    } else {
      if ($calc==true) {
        $query = "SELECT sum(fldBetrag) AS Betrag, month(fldDatum) as Monat FROM tblktosal,tblktoinhgrpzuord,tblktobanken WHERE tblktobanken.fldIndex=tblktoinhgrpzuord.fldid_ktoinhaber AND tblktoinhgrpzuord.fldid_ktoinhgrp=".$ktoinhgrp." AND tblktosal.fldInhaber=tblktobanken.fldBez AND fldDetailInd=0 AND month(fldDatum)=".$mon." AND fldKonto='".$arrKonten[$kto]."' AND year(fldDatum)=".$jahr.$strwhere." GROUP BY month(fldDatum)";
      } else {	
        $query = "SELECT sum(fldBetrag) AS Betrag, month(fldDatum) as Monat FROM tblktosal,tblktobanken WHERE fldInhaber=tblktobanken.fldBez AND fldDetailInd=0 AND month(fldDatum)=".$mon." AND fldKonto='".$arrKonten[$kto]."' AND year(fldDatum)=".$jahr.$strwhere." GROUP BY month(fldDatum)";
      }  
    }  
    //echo $query."<br>";
    $result = mysql_query($query) or die("Error using mysql_query 4:($query): ".mysql_error());
    if ($line = mysql_fetch_array($result)) {
      $istnull="N";
      $Betrag[$mon] = $line[Betrag]; 
      $zwiesum = $line[Betrag]; 
    } else {
      $Betrag[$mon] = 0; 
    } 
  }  
  if ($zwiesum==0) {
    $istnull="J";  
  }
  if ($istnull=="N") {
    echo "<tr>";
    echo "<td width='15'>".$arrKtoBez[$kto]."</td>";
    for ( $mon = $vonmonat; $mon <= $bismonat; $mon++ )
    {
      $SumAusgabeBetrag[$mon]=$SumAusgabeBetrag[$mon]+$Betrag[$mon];
      echo "<td style='text-align:right' width='25'>".sprintf("%.2f",$Betrag[$mon])."</td><td width='5'> </td>";
    }
    echo "</tr>";
  }
}  
echo "<tr bgcolor=lightgreen>";
echo "<td width='15'>Summe Ausgaben</td>";
for ( $mon = $vonmonat; $mon <= $bismonat; $mon++ )
{
  echo "<td style='text-align:right' width='25'>".sprintf("%.2f",$SumAusgabeBetrag[$mon])."</td><td width='5'> </td>";
}
echo "</tr>";

echo "<tr><td>.</td></tr>"; // leerzeile
echo "<tr bgcolor=lightgreen>";
echo "<td width='15'>Saldo</td>";
for ( $mon = $vonmonat; $mon <= $bismonat; $mon++ )
{
  $saldo=$SumEinnahmeBetrag[$mon]+$SumAusgabeBetrag[$mon];
  echo "<td style='text-align:right' width='25'>".sprintf("%.2f",$saldo)."</td><td width='5'> </td>";
}
echo "</tr>";
echo "<tr><td>.</td></tr>"; // leerzeile


if ($oberkonten==true) {
  $query = "SELECT * FROM tblktooberkonten,tblktogrp_liste WHERE fldTyp='UMBUCH' and tblktooberkonten.fldid_ktogrp=tblktogrp_liste.fldindex and tblktogrp_liste.fldindex=".$ktoogr;
} else {
  $query = "SELECT * FROM `tblktokonten` WHERE fldTyp='UMBUCH'";
}  
//echo $query."<br>";
$result = mysql_query($query);
$arrKonten = array();
$arrKtoBez = array();
$arrKtoInd = array();
while ($line = mysql_fetch_array($result)) { 
  $arrKonten[] = $line[fldKurz];
  $arrKtoBez[] = $line[fldBez];
  $arrKtoInd[] = $line[fldIndex];
}
$nAnz = count($arrKonten);

for ($nMonat=0;$nMonat<12;$nMonat++) { 
    $SumUmbuchBetrag[] = 0; 
}

for ( $kto = 0; $kto < $nAnz; $kto++ )
{
  $istnull="J";
  for ( $mon = 1; $mon < $vonmonat; $mon++ ) {
    if ($oberkonten==true) {
      //$query = "SELECT sum(fldBetrag) AS Betrag, month(fldDatum) as Monat FROM tblktosal,tblktobanken,tblktooberkonten AS ober,tblktokonten AS konto WHERE fldInhaber=tblktobanken.fldBez AND month(fldDatum)=".$mon." AND ober.fldKurz='".$arrKonten[$kto]."' AND fldKonto=konto.fldKurz AND ober.fldIndex=konto.fldid_oberkonto  AND year(fldDatum)=".$jahr.$strwhere." GROUP BY month(fldDatum)";
      $query = "SELECT sum(fldBetrag) AS Betrag,year(fldDatum) as Jahr, month(fldDatum) as Monat,fldInhaber FROM tblktosal,tblktogrpzuord WHERE tblktogrpzuord.fldKurz=tblktosal.fldKonto AND fldid_oberkonto=".$arrKtoInd[$kto]." AND fldDetailInd=0 AND month(fldDatum)=".$mon." AND year(fldDatum)=".$jahr." AND fldInhaber='".$ktogrp."' GROUP BY month(fldDatum),year(fldDatum),fldInhaber";
    } else {
      $query = "SELECT sum(fldBetrag) AS Betrag, month(fldDatum) as Monat FROM `tblktosal`,tblktobanken WHERE fldInhaber=tblktobanken.fldBez AND month(fldDatum)=".$mon." AND fldKonto='".$arrKonten[$kto]."' AND year(fldDatum)=".$jahr.$strwhere." GROUP BY month(fldDatum)";
    }  
    //echo $query."<br>";
    $result = mysql_query($query) or die("Error using mysql_query($sql): ".mysql_error());
    if ($line = mysql_fetch_array($result)) {
      $SumVortrag=$SumVortrag+$line[Betrag];
//    echo $query."<br>";
      if ($line[Betrag]!=0) {
        //echo $SumVortrag.",".$line[Betrag].",".$mon."=sumvortrag umbuch<br>";
      }
    }    
  }
  $zwiesum=0;
  for ( $mon = $vonmonat; $mon <= $bismonat; $mon++ )
  {
    if ($oberkonten==true) {
      //$query = "SELECT sum(fldBetrag) AS Betrag, month(fldDatum) as Monat FROM tblktosal,tblktobanken,tblktooberkonten AS ober,tblktokonten AS konto WHERE fldInhaber=tblktobanken.fldBez AND month(fldDatum)=".$mon." AND ober.fldKurz='".$arrKonten[$kto]."' AND fldKonto=konto.fldKurz AND ober.fldIndex=konto.fldid_oberkonto  AND year(fldDatum)=".$jahr.$strwhere." GROUP BY month(fldDatum)";
      if ($calc==true) {
        $query = "SELECT sum(fldBetrag) AS Betrag,year(fldDatum) as Jahr, month(fldDatum) as Monat FROM tblktosal,tblktogrpzuord,tblktoinhgrpzuord,tblktobanken WHERE tblktobanken.fldIndex=tblktoinhgrpzuord.fldid_ktoinhaber AND tblktoinhgrpzuord.fldid_ktoinhgrp=".$ktoinhgrp." AND tblktogrpzuord.fldKurz=tblktosal.fldKonto AND tblktosal.fldInhaber=tblktobanken.fldBez AND fldid_oberkonto=".$arrKtoInd[$kto]." AND fldDetailInd=0 AND month(fldDatum)=".$mon." AND year(fldDatum)=".$jahr." GROUP BY month(fldDatum),year(fldDatum)";
      } else { 
        $query = "SELECT sum(fldBetrag) AS Betrag,year(fldDatum) as Jahr, month(fldDatum) as Monat,fldInhaber FROM tblktosal,tblktogrpzuord WHERE tblktogrpzuord.fldKurz=tblktosal.fldKonto AND fldid_oberkonto=".$arrKtoInd[$kto]." AND fldDetailInd=0 AND month(fldDatum)=".$mon." AND year(fldDatum)=".$jahr." AND fldInhaber='".$ktogrp."' GROUP BY month(fldDatum),year(fldDatum),fldInhaber";
      }  
    } else {
      if ($calc==true) {
        $query = "SELECT sum(fldBetrag) AS Betrag, month(fldDatum) as Monat FROM tblktosal,tblktoinhgrpzuord,tblktobanken WHERE tblktobanken.fldIndex=tblktoinhgrpzuord.fldid_ktoinhaber AND tblktoinhgrpzuord.fldid_ktoinhgrp=".$ktoinhgrp." AND tblktosal.fldInhaber=tblktobanken.fldBez AND fldDetailInd=0 AND month(fldDatum)=".$mon." AND fldKonto='".$arrKonten[$kto]."' AND year(fldDatum)=".$jahr.$strwhere." GROUP BY month(fldDatum)";
      } else {	
        $query = "SELECT sum(fldBetrag) AS Betrag, month(fldDatum) as Monat FROM `tblktosal`,tblktobanken WHERE fldInhaber=tblktobanken.fldBez AND month(fldDatum)=".$mon." AND fldKonto='".$arrKonten[$kto]."' AND year(fldDatum)=".$jahr.$strwhere." GROUP BY month(fldDatum)";
      }  
    }  
    //echo $query."<br>";
    $result = mysql_query($query) or die("Error using mysql_query($sql): ".mysql_error());
    if ($line = mysql_fetch_array($result)) {
      $istnull="N";
      $Betrag[$mon] = $line[Betrag];
      $zwiesum = $line[Betrag]; 
    } else {
      $Betrag[$mon] = 0; 
    } 
  }  
  if ($zwiesum==0) {
    $istnull="J";  
  }
  if ($istnull=="N") {
    echo "<tr>";
    echo "<td width='15'>".$arrKtoBez[$kto]."</td>";
    for ( $mon = $vonmonat; $mon <= $bismonat; $mon++ )
    {
      $SumUmbuchBetrag[$mon]=$SumUmbuchBetrag[$mon]+$Betrag[$mon];
      echo "<td style='text-align:right' width='25'>".sprintf("%.2f",$Betrag[$mon])."</td><td width='5'> </td>";
    }
    echo "</tr>";
  }
}  
$Betrag=0;
for ( $mon = $vonmonat; $mon <= $bismonat; $mon++ )
{
  $Betrag=$Betrag+$SumUmbuchBetrag[$mon];	
}
if ($Betrag<>0) {
  echo "<tr bgcolor=lightblue>";
  echo "<td width='15'>Summe Umbuch</td>";
  for ( $mon = $vonmonat; $mon <= $bismonat; $mon++ )
  {
    echo "<td style='text-align:right' width='25'>".sprintf("%.2f",$SumUmbuchBetrag[$mon])."</td><td width='5'> </td>";
  }
  echo "</tr>";
  echo "<tr><td>.</td></tr>"; // leerzeile
}  
echo "<tr bgcolor=lightblue>";
echo "<td width='15'>Saldo Umbuch</td>";
for ( $mon = $vonmonat; $mon <= $bismonat; $mon++ )
{
  $saldo=$SumEinnahmeBetrag[$mon]+$SumAusgabeBetrag[$mon]+$SumUmbuchBetrag[$mon];
  echo "<td style='text-align:right' width='25'>".sprintf("%.2f",$saldo)."</td><td width='5'> </td>";
}
echo "</tr>";
echo "<tr><td>.</td></tr>"; // leerzeile
echo "<tr bgcolor=lightblue>";
echo "<td width='15'>Summe Betrag</td>";
$summeBetrag=$SumVortrag;
for ( $mon = $vonmonat; $mon <= $bismonat; $mon++ )
{
  $summeBetrag=$summeBetrag+$SumEinnahmeBetrag[$mon]+$SumAusgabeBetrag[$mon]+$SumUmbuchBetrag[$mon];
  echo "<td style='text-align:right' width='25'>".sprintf("%.2f",$summeBetrag)."</td><td width='5'> </td>";
}
echo "</tr>";

echo "</table>";

}

?>