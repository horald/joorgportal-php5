<?php

function reihenfolgesetzen($pararray) {
  $query="SELECT * from ".$pararray['dbtable']." WHERE fldPos=0 AND fldInhaber='Financisto_Horst' ORDER BY fldDatum,fldIndex";
  $result = mysql_query($query) or die(mysql_error());
  $lastdate="";
  while ($line = mysql_fetch_array($result)) {
  	 if ($lastdate==$line['fldDatum']) {
  	 	$cnt=$cnt+1;
  	 } else {
  	 	$cnt=1;
  	 }
  	 $lastdate=$line['fldDatum']; 
  	 $qryupd="UPDATE ".$pararray['dbtable']." SET fldPos=".$cnt." WHERE fldIndex=".$line['fldIndex'];
  	 echo $qryupd."<br>"; 
    $resupd = mysql_query($qryupd) or die(mysql_error());
  }  
}

function reihenfolgeauswahl($menu,$idwert) {

  echo "<form class='form-horizontal' method='post' action='setreihenfolge.php?menu=".$menu."&idwert=".$idwert."&reihenfolge=1'>";
  echo "<fieldset>";
  echo "<div class='control-group'>";
  
  echo "  <div class='form-actions'>";
  echo "     <button type='submit' name='submit' class='btn btn-primary'>OK</button>";
  echo "     <button class='btn'>Abbruch</button>";
  echo "  </div>";
  echo "</div>";
  echo "</fieldset>";
  echo "</form>";

}

?>