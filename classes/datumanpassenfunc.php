<?php
session_start();

function datumanpassenausfuehren($pararray) {
  $flddatum=$_GET['flddatum'];
  $datum=$_POST['datum'];
  //echo $datum."<br>";
  echo "<div class='row-fluid'>";
  $qrysel="SELECT * FROM ".$pararray['dbtable']." WHERE fldsel='J'";
  echo $qrysel."<br>";
  $ressel = mysql_query($qrysel) or die(mysql_error()." qrysel:".$qrysel);  while ($linsel = mysql_fetch_array($ressel)) {
  	 $qryupd="UPDATE ".$pararray['dbtable']." SET ".$flddatum."='".$datum."' WHERE ".$pararray['fldindex']."=".$linsel[$pararray['fldindex']];
  	 echo $qryupd."<br>"; 
  }
  echo "</div>";
}

function datumanpassenauswahl($menu,$idwert) {

  $flddatum=$_GET['flddatum'];
  echo "<form class='form-horizontal' method='post' action='datumanpassen.php?menu=".$menu."&idwert=".$idwert."&anpassen=1&flddatum=".$flddatum."'>";
  echo "<fieldset>";
  echo "<div class='control-group'>";

  echo "<div>";
  echo "Datum: ";
?>
        <input type="Text" id="datum" name="datum" value="<?php echo $datum; ?>"/>
        <img src="images2/cal.gif" onclick="javascript:NewCssCal('datum','yyyyMMdd','ARROW')" style="cursor:pointer"/>
<?php 
  echo "</div>";

  echo "  <div class='form-actions'>";
  echo "     <button type='submit' name='submit' class='btn btn-primary'>OK</button>";
  echo "     <button class='btn'>Abbruch</button>";
  echo "  </div>";
  echo "</div>";
  echo "</fieldset>";
  echo "</form>";
}

?>