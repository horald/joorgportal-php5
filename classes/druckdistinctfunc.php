<?php
header("content-type: text/html; charset=utf-8");

function druckdistinctauswahl($menu,$idwert) {
  echo "<form class='form-horizontal' method='post' action='druckdistinct.php?menu=".$menu."&idwert=".$idwert."&druckdistinct=1'>";
  echo "<fieldset>";
  echo "<div class='control-group'>";

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

  echo "<div>";
  $fquery = "SELECT * FROM tblktobanken";
  $fresult = mysql_query($fquery) or die(mysql_error());
  echo "Kontoinhaber: ";
  echo "<select name='ktoinh' size='1'>";
  while ($fline = mysql_fetch_array($fresult)) {
    $strbez = $fline[fldBez];
    echo "<option style='background-color:#c0c0c0;' value=".$strbez." >".$strbez."</option>";
  }
  echo "</select>";
  echo "<br>";
  echo "</div>";  

  echo "<div>";
  $fquery = "SELECT * FROM tblktogrp_liste";
  $fresult = mysql_query($fquery) or die(mysql_error());
  echo "Kontengruppe: ";
  echo "<select name='ktogrp' size='1'>";
  while ($fline = mysql_fetch_array($fresult)) {
    $strbez = $fline[fldbez];
    $strind = $fline[fldindex];
    echo "<option style='background-color:#c0c0c0;' value=".$strind." >".$strbez."</option>";
  }
  echo "</select>";
  echo "<br>";
  echo "</div>";  

  echo "</div>";  
  
  echo "  <div class='form-actions'>";
  echo "     <button type='submit' name='submit' class='btn btn-primary'>OK</button>";
  echo "     <button class='btn'>Abbruch</button>";
  echo "  </div>";
  echo "</div>";
  echo "</fieldset>";
  echo "</form>";
	
}

function druckdistinctausfuehren($vondatum,$bisdatum,$ktoinh,$ktogrp) {
  //echo "druckdistinct ausfuehren:".$vondatum.",".$bisdatum.",".$ktoinh."<br>";
  $query="SELECT DISTINCT fldKonto FROM tblktosal WHERE fldDatum>='".$vondatum."' AND fldDatum<='".$bisdatum."' AND fldInhaber='".$ktoinh."'";
  //echo $query."<br>";
  $result = mysql_query($query) or die(mysql_error());
  echo "<table border=1>";
  echo "<tr>";
  echo "<td>Nr</td>";
  echo "<td>Konto</td>";
  echo "<td>JN</td>";
  echo "</tr>";
  $cnt=0;
  while ($line = mysql_fetch_array($result)) {
    $strbez = $line[fldKonto];
  	 $qrygrp="SELECT * FROM tblktogrpzuord WHERE fldKurz='".$strbez."' AND fldid_ktogrp=".$ktogrp; 
    $resgrp = mysql_query($qrygrp) or die(mysql_error());
    $lingrp = mysql_fetch_array($resgrp);
    $cnt=$cnt+1;
    if ($lingrp['fldKurz']==$strbez) {
      echo "<tr>";
      $jn="J";
    } else {	
      echo "<tr bgcolor='#ff0000'>";
      $jn="N";
    }  
    echo "<td>".$cnt."</td>";
    echo "<td>".$strbez."</td>";
    echo "<td>".$jn."</td>";
    echo "</tr>";
  }
  echo "</table>";
}

?>