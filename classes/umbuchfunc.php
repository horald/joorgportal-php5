<?php
header("content-type: text/html; charset=utf-8");

function umbuchabfrage($menu,$menuid) {
  echo "<form method='post' action='umbuch.php?umbuch=1&menu=".$menu."&menuid=".$menuid."'>";
  echo "<fieldset>";
  $vondatum="";
  $bisdatum="";
  echo "<div>";
  echo "Von Datum: ";
?>
        <input type="Text" id="vondatum" name="vondatum" value="<?php echo $vondatum; ?>"/>
        <img src="images2/cal.gif" onclick="javascript:NewCssCal('vondatum','yyyyMMdd','ARROW')" style="cursor:pointer"/>
<?php 
  echo "</div>";
  echo "<div>";
  echo "Bis Datum: ";
?>
        <input type="Text" id="bisdatum" name="bisdatum" value="<?php echo $bisdatum; ?>"/>
        <img src="images2/cal.gif" onclick="javascript:NewCssCal('bisdatum','yyyyMMdd','ARROW')" style="cursor:pointer"/>
<?php 
  echo "</div>";

  echo "<div>";
  echo "Von Bank-Konto:";
  $fquery = "SELECT * FROM tblktobanken";
  $fresult = mysql_query($fquery) or die(mysql_error());
  echo "<select name='vonkto' size='1'>";
  while ($fline = mysql_fetch_array($fresult)) {
    $strindex = $fline[fldIndex];
    $strbez = $fline[fldBez];
    echo "<option style='background-color:#c0c0c0;' value=".$strbez." >".$strbez."</option>";
  }
  echo "</select>";
  echo "</div>";
  echo "<div>";
  echo "Nach Bank-Konto:";
  $fquery = "SELECT * FROM tblktobanken";
  $fresult = mysql_query($fquery) or die(mysql_error());
  echo "<select name='nchkto' size='1'>";
  while ($fline = mysql_fetch_array($fresult)) {
    $strindex = $fline[fldIndex];
    $strbez = $fline[fldBez];
    echo "<option style='background-color:#c0c0c0;' value=".$strbez." >".$strbez."</option>";
  }
  echo "</select>";
  echo "</div>";

  echo "<div>";
  echo "Von Konto:";
  $fquery = "SELECT * FROM tblktokonten";
  $fresult = mysql_query($fquery) or die(mysql_error());
  echo "<select name='vonacc' size='1'>";
  while ($fline = mysql_fetch_array($fresult)) {
    $strindex = $fline[fldIndex];
    $strbez = $fline[fldKurz];
    echo "<option style='background-color:#c0c0c0;' value=".$strbez." >".$strbez."</option>";
  }
  echo "</select>";
  echo "</div>";
  echo "<div>";
  echo "Nach Konto:";
  $fquery = "SELECT * FROM tblktokonten";
  $fresult = mysql_query($fquery) or die(mysql_error());
  echo "<select name='nchacc' size='1'>";
  while ($fline = mysql_fetch_array($fresult)) {
    $strindex = $fline[fldIndex];
    $strbez = $fline[fldKurz];
    echo "<option style='background-color:#c0c0c0;' value=".$strbez." >".$strbez."</option>";
  }
  echo "</select>";
  echo "</div>";
  echo "  <div class='form-actions'>";
  echo "     <button type='submit' name='submit' class='btn btn-primary'> Import </button>";
  echo "     <button class='btn'>Abbruch</button>";
  echo "  </div>";
  echo "</fieldset>";
  echo "</form>";
}

function umbuchung() {
  $vondatum=$_POST['vondatum'];
  $bisdatum=$_POST['bisdatum'];
  echo $vondatum." bis ".$bisdatum."<br>";
  $vonkto=$_POST['vonkto'];
  $nchkto=$_POST['nchkto'];
  echo $vonkto." - ".$nchkto."<br>";
  $vonacc=$_POST['vonacc'];
  $nchacc=$_POST['nchacc'];
  include("../config.php");
  if ($vonkto<>$nchkto) {
    if ($bisdatum=="") {
      $qrydel="DELETE FROM tblktosal WHERE fldUmbuchInhaber='".$vonkto."' and fldInhaber='".$nchkto."' and fldDatum>='".$vondatum."'";
    } else {
      $qrydel="DELETE FROM tblktosal WHERE fldUmbuchInhaber='".$vonkto."' and fldInhaber='".$nchkto."' and fldDatum>='".$vondatum."' and fldDatum<='".$bisdatum."'";
    }
    $resdel = mysql_query($qrydel) or die(mysql_error());
    echo $qrydel."<br>";
  }  
  if ($bisdatum=="") {
    if ($vonkto<>$nchkto) {
      $query="SELECT * FROM tblktosal WHERE fldInhaber='".$vonkto."' and fldDatum>='".$vondatum."'";
    } else {
      $query="SELECT * FROM tblktosal WHERE fldInhaber='".$vonkto."' and fldKonto='".$vonacc."' and fldDatum>='".$vondatum."'";
    }  
  } else {
    $query="SELECT * FROM tblktosal WHERE fldInhaber='".$vonkto."' and fldKonto='".$vonacc."' and fldDatum>='".$vondatum."' and fldDatum<='".$bisdatum."'";
  }  
  echo $query."=query<br>";
  $result = mysql_query($query) or die(mysql_error());
  while ($line = mysql_fetch_array($result)) {
    if ($vonkto<>$nchkto) {
      $qryins="INSERT INTO tblktosal (fldDatum,fldUhrzeit,fldPos,fldBez,fldKonto,fldInhaber,fldUmbuchInhaber,fldBetrag,fldFix) VALUES('".$line['fldDatum']."','".$line['fldUhrzeit']."','".$line['fldPos']."','".$line['fldBez']."','".$line['fldKonto']."','".$nchkto."','".$vonkto."','".$line['fldBetrag']."','".$line['fldFix']."')";
     } else {   
      $qryins="UPDATE tblktosal SET fldKonto='".$nchacc."' WHERE fldIndex=".$line['fldIndex'];
    }  
    $resins = mysql_query($qryins) or die(mysql_error());
  	 echo $qryins."<br>"; 
  }
}


?>