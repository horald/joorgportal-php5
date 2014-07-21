<?php

function kostenauswahl($menu) {
  echo "<form class='form-horizontal' method='post' action='kosten.php?kosten=1&menu=".$menu."'>";
  echo "  <fieldset>";
  echo "Von Datum: ";
  $vondatum="2014-01-01";
?>
        <input type="Text" id="vondatum" name="vondatum" value="<?php echo $vondatum; ?>"/>
        <img src="images2/cal.gif" onclick="javascript:NewCssCal('vondatum','yyyyMMdd','ARROW')" style="cursor:pointer"/>
<?php 
  echo "</div>";
  echo "<div>";
  echo "Bis Datum: ";
  $bisdatum="2014-03-31";
?>
        <input type="Text" id="bisdatum" name="bisdatum" value="<?php echo $bisdatum; ?>"/>
        <img src="images2/cal.gif" onclick="javascript:NewCssCal('bisdatum','yyyyMMdd','ARROW')" style="cursor:pointer"/>
<?php 
  echo "</div>";
  echo "Leere ignorierern <input type='checkbox' name='chknotempty' value='1' ><br>";  echo "Kontokurz anzeigen <input type='checkbox' name='chkkontokurz' value='1' ><br>";  echo "Fehlende Konto anzeigen <input type='checkbox' name='chkfehlendekonten' value='1' ><br>";        
  echo "     <button type='submit' name='submit' class='btn btn-primary'>Ok</button>";
  echo "</div>";
  echo "  </fieldset>";
  echo "</form>";
  
}

function kostenaufstellung() {
  $vondatum=$_POST['vondatum'];
  $bisdatum=$_POST['bisdatum'];
  $vonmonat=substr($vondatum,5,2);
  $bismonat=substr($bisdatum,5,2);
  $anzmon=$bismonat-$vonmonat+1;
  $jahr=2014;
  $notempty=$_POST['chknotempty'];
  $kontokurz=$_POST['chkkontokurz'];
  $fehlendekonten=$_POST['chkfehlendekonten'];
  echo "<table class='table table-hover'>";
  echo "<thead>";
  echo "<th width='5'>Nr</th>";
  echo "<th width='15'>Konto</th>";
  echo "<th style='text-align:right' width='15'>Betrag</th>";
  for ( $mon = $vonmonat; $mon <= $bismonat; $mon++ )
  {
    echo "<th style='text-align:right' width='15'>".$mon."</th>";
  }
  if ($anzmon>1) {
    echo "<th style='text-align:right' width='15'>Durchschnitt</th>";
  }
  echo "<th style='text-align:right' width='15'>Differenz</th>";
  echo "</thead>";
  $query = "SELECT * FROM `tblktodauerauftrag";
  $result = mysql_query($query);
  $nr=0;
  $sumbetrag=0;
  $arrsummon = array();
  for ( $mon = $vonmonat; $mon <= $bismonat; $mon++ ) {
    $arrsummon[] = 0;
  }
  $mengekonto="";
  while ($line = mysql_fetch_array($result)) {
    $qrykst = "SELECT sum(fldBetrag) as Betrag,fldKurz FROM tblktosal,tblktokonten WHERE tblktosal.fldKonto=tblktokonten.fldKurz AND tblktokonten.fldIndex=".$line['fldid_kto']." AND tblktosal.fldDatum>='".$vondatum."' AND tblktosal.fldDatum<='".$bisdatum."'";
    //echo $qrykst."=qrykst<br>";
    $reskst = mysql_query($qrykst);
    $linkst = mysql_fetch_array($reskst);
    $diff=$line['fldbetrag']-$linkst['Betrag'];
    $durchschnitt=0;
    for ( $mon = $vonmonat; $mon <= $bismonat; $mon++ ) {
      $qrymon = "SELECT sum(fldBetrag) as Betrag,fldKurz,year(fldDatum) as Jahr,month(fldDatum) as Monat FROM tblktosal,tblktokonten WHERE tblktosal.fldKonto=tblktokonten.fldKurz AND tblktokonten.fldIndex=".$line['fldid_kto']." AND month(fldDatum)=".$mon." AND year(fldDatum)=".$jahr." GROUP BY month(fldDatum),year(fldDatum)";
      $resmon = mysql_query($qrymon);
      $linmon = mysql_fetch_array($resmon);
      $durchschnitt=$durchschnitt+$linmon['Betrag'];
    }  
    if ($anzmon>1) {
      $durchschnitt=$durchschnitt / $anzmon;
      $diff=$line['fldbetrag']-$durchschnitt;	
    }
    $show=true;
    if ($notempty) {
    	if ($diff==0) {
    	  $show=false;	
    	}
    }
    $mengekonto="'".$linkst['fldKurz']."',".$mengekonto;      
    if ($show) {
      $nr=$nr+1; 
      echo "<tr>";
      echo "<td width='5'>".$nr."</td>";
      if ($kontokurz) {
        echo "<td width='15'>".$line['fldbez']." (".$linkst['fldKurz'].")</td>";
      } else {
        echo "<td width='15'>".$line['fldbez']." </td>";
      }  
      $betrag=$line['fldbetrag'];
      if ($line['fldanzmon']>"") {
        $betrag=$betrag / $line['fldanzmon'];	
      }
      $sumbetrag=$sumbetrag+$betrag;
      echo "<td style='text-align:right' width='15'>".sprintf("%.2f",$betrag)."</td>";
      $durchschnitt=0;
      for ( $mon = $vonmonat; $mon <= $bismonat; $mon++ ) {
        $qrymon = "SELECT sum(fldBetrag) as Betrag,fldKurz,year(fldDatum) as Jahr,month(fldDatum) as Monat FROM tblktosal,tblktokonten WHERE tblktosal.fldKonto=tblktokonten.fldKurz AND tblktokonten.fldIndex=".$line['fldid_kto']." AND month(fldDatum)=".$mon." AND year(fldDatum)=".$jahr." GROUP BY month(fldDatum),year(fldDatum)";
        $resmon = mysql_query($qrymon);
        $linmon = mysql_fetch_array($resmon);
        $durchschnitt=$durchschnitt+$linmon['Betrag'];
        $monbetrag=$linmon['Betrag'];
        $arrsummon[$mon]=$arrsummon[$mon]+$monbetrag;
        echo "<td style='text-align:right' width='15'>".sprintf("%.2f",$monbetrag)."</td>";
      }  
      if ($anzmon>1) {
        $durchschnitt=$durchschnitt / $anzmon;
        //$diff=($line['fldbetrag']/$anzmon)-$durchschnitt;	
        echo "<td style='text-align:right' width='15'>".sprintf("%.2f",$durchschnitt)."</td>";
      }
      $diff=$betrag-$durchschnitt;
      echo "<td style='text-align:right' width='15'>".sprintf("%.2f",$diff)."</td>";
      echo "</tr>";
    }  
  }	 
  echo "<tr><td>.</td></tr>";
  echo "<tr bgcolor=lightblue>";
  echo "<td width='5'> </td>";
  echo "<td width='15'>Summe</td>";
  echo "<td style='text-align:right' width='15'>".sprintf("%.2f",$sumbetrag)."</td>";
  $durchschnitt=0;
  for ( $mon = $vonmonat; $mon <= $bismonat; $mon++ ) {
    $durchschnitt=$durchschnitt+$arrsummon[$mon];
    echo "<td style='text-align:right' width='15'>".sprintf("%.2f",$arrsummon[$mon])."</td>";
  }
  $diff=($sumbetrag)-$durchschnitt;	
  if ($anzmon>1) {
    $durchschnitt=$durchschnitt / $anzmon;
    $diff=($sumbetrag/$anzmon)-$durchschnitt;	
    echo "<td style='text-align:right' width='15'>".sprintf("%.2f",$durchschnitt)."</td>";
  }
  echo "<td style='text-align:right' width='15'>".sprintf("%.2f",$diff)."</td>";
  echo "</tr>";

  if ($fehlendekonten) {
    echo "<tr><td>.</td></tr>";
    $sumbetrag=0;
    $arrsummon = array();
    for ( $mon = $vonmonat; $mon <= $bismonat; $mon++ ) {
      $arrsummon[] = 0;
    }
    $mengekonto=substr($mengekonto,0,strlen($mengekonto)-1);
    //  echo $mengekonto."<br>";
    $query="SELECT sum(fldBetrag) as Betrag,fldKonto FROM tblktosal WHERE tblktosal.fldDatum>='".$vondatum."' AND tblktosal.fldDatum<='".$bisdatum."' AND fldKonto NOT IN (".$mengekonto.") GROUP BY fldKonto";
    //  echo $query."<br>"; 
    $result = mysql_query($query);
    while ($line = mysql_fetch_array($result)) {
      echo "<tr>";
      echo "<td width='5'> </td>";
      echo "<td width='15'>".$line['fldKonto']."</td>";
      echo "<td style='text-align:right' width='15'>".sprintf("%.2f",$line['Betrag'])."</td>";
      $sumbetrag=$sumbetrag+$line['Betrag'];
      $durchschnitt=0;
      for ( $mon = $vonmonat; $mon <= $bismonat; $mon++ ) {
        $qrymon = "SELECT sum(fldBetrag) as Betrag,fldKonto,year(fldDatum) as Jahr,month(fldDatum) as Monat FROM tblktosal WHERE fldKonto='".$line['fldKonto']."' AND month(fldDatum)=".$mon." AND year(fldDatum)=".$jahr." GROUP BY month(fldDatum),year(fldDatum)";
        $resmon = mysql_query($qrymon);
        $linmon = mysql_fetch_array($resmon);
        $arrsummon[$mon]=$arrsummon[$mon]+$linmon['Betrag'];
        $durchschnitt=$durchschnitt+$linmon['Betrag'];
        echo "<td style='text-align:right' width='15'>".sprintf("%.2f",$linmon['Betrag'])."</td>";
      }
      $diff=($sumbetrag)-$durchschnitt;	
      if ($anzmon>1) {
        $durchschnitt=$durchschnitt / $anzmon;
        $diff=($line['Betrag']/$anzmon)-$durchschnitt;	
        echo "<td style='text-align:right' width='15'>".sprintf("%.2f",$durchschnitt)."</td>";
      }
      echo "<td style='text-align:right' width='15'>".sprintf("%.2f",$diff)."</td>";
      echo "</tr>";
    }

    echo "<tr><td>.</td></tr>";
    echo "<tr bgcolor=lightblue>";
    echo "<td width='5'> </td>";
    echo "<td width='15'>Summe</td>";
    echo "<td style='text-align:right' width='15'>".sprintf("%.2f",$sumbetrag)."</td>";
    $durchschnitt=0;
    for ( $mon = $vonmonat; $mon <= $bismonat; $mon++ ) {
      $durchschnitt=$durchschnitt+$arrsummon[$mon];
      echo "<td style='text-align:right' width='15'>".sprintf("%.2f",$arrsummon[$mon])."</td>";
    }
    $diff=($sumbetrag)-$durchschnitt;	
    if ($anzmon>1) {
      $durchschnitt=$durchschnitt / $anzmon;
      $diff=($sumbetrag/$anzmon)-$durchschnitt;	
      echo "<td style='text-align:right' width='15'>".sprintf("%.2f",$durchschnitt)."</td>";
    }
    echo "<td style='text-align:right' width='15'>".sprintf("%.2f",$diff)."</td>";
    echo "</tr>";
  }

  echo "</table>";
  
}

?>