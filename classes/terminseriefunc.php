<?php

function terminserieauswahl($menu) {

  $vondatum='2014-03-06';
  $bisdatum='2014-03-06';
  echo "<form name='eingabe' class='form-horizontal' method='post' action='terminserie.php?terminserie=1&menu=".$menu."' enctype='multipart/form-data'>";
  echo "  <fieldset>";
  echo "    <div class='control-group'>";
  echo "      <label class='control-label' style='text-align:left' for='inputbez'>Bezeichnung</label>";
  echo "      <input name=bez value='' >";
  echo "    </div>";
  echo "    <div class='control-group'>";
  echo "      <label class='control-label' style='text-align:left' for='inputvondatum'>Von Datum</label>";
?>
        <input type="Text" id=vondatum name=vondatum value='<?php echo $vondatum; ?>' >
        <img src="images2/cal.gif" onclick="javascript:NewCssCal('vondatum','yyyyMMdd','ARROW')" style="cursor:pointer"/>
<?php 
  echo "    </div>";
  echo "    <div class='control-group'>";
  echo "      <label class='control-label' style='text-align:left' for='inputbisdatum'>Bis Datum</label>";
?>
        <input type="Text" id=bisdatum name=bisdatum value='<?php echo $bisdatum; ?>' >
        <img src="images2/cal.gif" onclick="javascript:NewCssCal('bisdatum','yyyyMMdd','ARROW')" style="cursor:pointer"/>
<?php 
  echo "    </div>";

  $fquery = "SELECT * FROM tbltermine_grp";
  //echo $fquery."=query<br>";
  $fresult = mysql_query($fquery) or die(mysql_error()." ".$fquery);
  echo "<div class='control-group'>";
  echo "  <label class='control-label' style='text-align:left' for='input01'>Gruppe</label>";
  echo "  <select name='termingrp' size='1'>";
  echo "<option style='background-color:#c0c0c0;' value=0 >(ohne)</option>";
  while ($fline = mysql_fetch_array($fresult)) {
    $strstatus = $fline['fldbez'];
    $strvalue = $fline['fldindex'];
    echo "<option style='background-color:#c0c0c0;' value=".$strvalue." >".$strstatus."</option>";
  }
  echo "  </select>";
  echo "</div>";

  $fquery = "SELECT * FROM tbltermine_serie";
  //echo $fquery."=query<br>";
  $fresult = mysql_query($fquery) or die(mysql_error()." ".$fquery);
  echo "<div class='control-group'>";
  echo "  <label class='control-label' style='text-align:left' for='input01'>Serie</label>";
  echo "  <select name='terminserie' size='1'>";
  echo "<option style='background-color:#c0c0c0;' value=0 >(ohne)</option>";
  while ($fline = mysql_fetch_array($fresult)) {
    $strstatus = $fline['fldbez'];
    $strvalue = $fline['fldindex'];
    echo "<option style='background-color:#c0c0c0;' value=".$strvalue." >".$strstatus."</option>";
  }
  echo "  </select>";
  echo "</div>";

  echo "    <div class='control-group'>";
  echo "      <label class='control-label' style='text-align:left' for='inputanztage'>Anzahl Tage</label>";
  echo "      <input name=anztage value=7 >";
  echo "    </div>";
  echo "    <div class='form-actions'>";
  echo "      <button type='submit' name='submit' class='btn btn-primary'>Speichern</button>";
  echo "      <button class='btn'>Abbruch</button>";
  echo "    </div>";
  echo "  </fieldset>";
  echo "</form>";

}

function terminserieausfuehren($pararray) {
  $bez=$_POST['bez'];  
  $vondatum=$_POST['vondatum'];
  $bisdatum=$_POST['bisdatum'];
  $anztage=$_POST['anztage'];
  $termingrp=$_POST['termingrp'];
  $terminserie=$_POST['terminserie'];

  $tag = substr($vondatum,8,2);
  $monat = substr($vondatum,5,2);
  $jahr = substr($vondatum,0,4);
  $vondate = mktime (0,0,0,$monat,$tag,$jahr);
  $tag = substr($bisdatum,8,2);
  $monat = substr($bisdatum,5,2);
  $jahr = substr($bisdatum,0,4);
  $bisdate = mktime (0,0,0,$monat,$tag,$jahr);
  $itage = ($bisdate - $vondate) / (60*60*24);
  echo $bez.",".$vondatum.",".$bisdatum.",".$anztage.",".$itage."<br>";

  for ($cnttag = 0; $cnttag <= $itage; $cnttag=$cnttag+$anztage) {
    $date = $vondate+(60*60*24*$cnttag); 
    $datum = date("Y-m-d",$date);
    //echo $datum."=datum<br>";
    $query="INSERT INTO ".$pararray['dbtable']." (fldbez,fldvondatum,fldid_terminegrp,fldid_terminserie) VALUES ('".$bez."','".$datum."',$termingrp,$terminserie)";
    echo $query."<br>";
    mysql_query($query) or die(mysql_error().$query);
  }
  
}

?>