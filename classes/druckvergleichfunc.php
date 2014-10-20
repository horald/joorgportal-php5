<?php

function druckauswahl($menu,$menuid) {
  echo "<form method='post' action='druckvergleich.php?druckvergleich=1&menu=".$menu."&menuid=".$menuid."'>";

  echo "<table>";
  echo "<tr>";
  echo "<td>Altes Jahr:</td>";
  //echo "<input type='Text' name='altjahr' value='2012'/>";
  //echo "</div>";
  echo "<td>";

        $fquery = "SELECT * FROM tbljahr";
        $fresult = mysql_query($fquery) or die(mysql_error());
        echo "<select name='altjahr' size='1'>";
        while ($fline = mysql_fetch_array($fresult)) {
          $strbez = $fline[fldjahr];
          echo "<option style='background-color:#c0c0c0;' value=".$strbez." >".$strbez."</option>";
        }
        echo "</select>";
  echo "</td></tr>";

  echo "<tr>";
  echo "<td>Vergleichsjahr:</td>";
  echo "<td>";

        $fquery = "SELECT * FROM tbljahr";
        $fresult = mysql_query($fquery) or die(mysql_error());
        echo "<select name='vergljahr' size='1'>";
        while ($fline = mysql_fetch_array($fresult)) {
          $strbez = $fline[fldjahr];
          echo "<option style='background-color:#c0c0c0;' value=".$strbez." >".$strbez."</option>";
        }
        echo "</select>";

//  echo "<input type='Text' name='vergljahr' value='2013'/>";
  echo "</td></tr></table>";
  echo "  <div class='form-actions'>";
  echo "     <button type='submit' name='submit' class='btn btn-primary'> Vergleich </button>";
//  echo "     <button class='btn'>Abbruch</button>";
  echo "  </div>";
  echo "</form>";

}

function druckvergleich() {
include ("../config.php");
$altjahr=$_POST['altjahr'];
$vergljahr=$_POST['vergljahr'];
//echo $altjahr.",".$vergljahr."<br>";
$query="SELECT * FROM tblgeraet";
$result = mysql_query($query) or die(mysql_error());
echo "<table border=1>";
echo "<tr>";
echo "<td>Bez</td>";
echo "<td>Verbrauch ".$altjahr."</td>";
echo "<td>Preis ".$altjahr."</td>";
echo "<td>Verbrauch ".$vergljahr."</td>";
echo "<td>Preis ".$vergljahr."</td>";
echo "<td>Diff Verbrauch</td>";
echo "<td>Diff Preis</td>";
echo "</tr>";
$sumpreisalt=0;
$sumpreisneu=0;
$sumverglalt=0;
$sumverglneu=0;
while ($line = mysql_fetch_array($result)) {
  $qryheiz="SELECT * FROM tblheizung WHERE fldid_geraet=".$line['fldindex']." AND fldAbrJahr='".$altjahr."'";
  $resheiz = mysql_query($qryheiz) or die(mysql_error());
  $linheiz = mysql_fetch_array($resheiz);
  if ($linheiz['fldok']=="N") {
  	 echo "<tr style='border-color:#111100; border-width:4px; border-style:solid; padding:4px'  >";
  	 echo "<td>Zwischensumme:</td>";
  	 echo "<td>.</td>";
  	 echo "<td style='text-align:right'>".sprintf("%.2f",$sumpreisalt)."</td>";
  	 echo "<td>.</td>";
  	 echo "<td style='text-align:right'>".sprintf("%.2f",$sumpreisneu)."</td>";
  	 echo "<td>.</td>";
  	 echo "<td style='text-align:right'>".sprintf("%.2f",$sumpreisalt-$sumpreisneu)."</td>";
  	 echo "</tr>";
  }
  echo "<tr>";
  echo "<td>".$line['fldbez']."</td>";
  $altwert=$linheiz['fldAnz'];
  if ($linheiz['fldok']=="J") {
    $sumverglalt=$sumverglalt+$altwert;	
    echo "<td style='text-align:right'>".sprintf("%.0f",$altwert)."</td>";
  } else {
  	 echo "<td>.</td>";
  }  
  $preisalt=$line['fldfaktor'] * $altwert * $linheiz['fldPreis'];
  $sumpreisalt=$sumpreisalt + $preisalt;
  echo "<td style='text-align:right'>".sprintf("%.2f",$preisalt)."</td>";
  $qryheiz="SELECT * FROM tblheizung WHERE fldid_geraet=".$line['fldindex']." AND fldAbrJahr='".$vergljahr."'";
  $resheiz = mysql_query($qryheiz) or die(mysql_error());
  $linheiz = mysql_fetch_array($resheiz);
  $neuwert = $linheiz['fldAnz'];
  if ($linheiz['fldok']=="J") {
    $sumverglneu=$sumverglneu+$neuwert;
    echo "<td style='text-align:right'>".sprintf("%.0f",$linheiz['fldAnz'])."</td>";
  } else {
  	 echo "<td>.</td>";
  }  
  $preisneu=$line['fldfaktor'] * $neuwert * $linheiz['fldPreis'];
  $sumpreisneu=$sumpreisneu + $preisneu;
  echo "<td style='text-align:right'>".sprintf("%.2f",$preisneu)."</td>";
  $diffwert=$altwert-$linheiz['fldAnz'];
  if ($linheiz['fldok']=="J") {
    echo "<td style='text-align:right'>".sprintf("%.0f",$diffwert)."</td>";
  } else {
  	 echo "<td>.</td>";
  }  
  $diffpreis=$preisalt-$preisneu;
  echo "<td style='text-align:right'>".sprintf("%.2f",$diffpreis)."</td>";
  echo "</tr>";
}
$wert=0;
echo "<tr style='border-color:#111100; border-width:4px; border-style:solid; padding:4px'  >";
echo "<td>Summe</td>";
echo "<td  style='text-align:right'>".sprintf("%.0f",$sumverglalt)."</td>";
echo "<td  style='text-align:right'>".sprintf("%.2f",$sumpreisalt)."</td>";
echo "<td  style='text-align:right'>".sprintf("%.0f",$sumverglneu)."</td>";
echo "<td  style='text-align:right'>".sprintf("%.2f",$sumpreisneu)."</td>";
echo "<td  style='text-align:right'>".sprintf("%.0f",$sumverglalt-$sumverglneu)."</td>";
echo "<td  style='text-align:right'>".sprintf("%.2f",$sumpreisalt-$sumpreisneu)."</td>";
echo "</tr>";
echo "</table>";
}
?>