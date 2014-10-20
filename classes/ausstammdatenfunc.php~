<?php
header("content-type: text/html; charset=utf-8");

function ausstammdateninput($menu,$idwert) {
 
  echo "<form class='form-horizontal' method='post' action='ausstammdaten.php?menu=".$menu."&idwert=".$idwert."&stammdaten=1'>";
  echo "<fieldset>";
  echo "<div class='control-group'>";
  echo "<table class='table table-hover'>";
  echo "<thead>";
  echo "<th><input type='checkbox' name='checkall'></th>";
  echo "<th>Bezeichnung</th>";
  echo "<th>Kaufort</th>";
  echo "</thead>";
  $query = "SELECT * FROM tblartikel WHERE fldTyp='STAMM' ORDER BY fldOrt,fldBez";
  $result = mysql_query($query) or die(mysql_error());
  $cnt=0;
  while ($line = mysql_fetch_array($result)) { 
    $cnt=$cnt+1;
    echo "<tr>"; 
    echo "<input type='hidden' name='idwert".$cnt."' value=".$line[fldIndex].">";
    echo "<td><input type='checkbox' name='check".$cnt."' value='1'></td>";
    echo "<td>".$line['fldBez']."</td>";
    echo "<td>".$line['fldOrt']."</td>";
    echo "</tr>";    
  }
  echo "</table>";
  
  echo "<input type='hidden' name='count' value=".$cnt."/>";
  echo "  <div class='form-actions'>";
  echo "     <button type='submit' name='submit' class='btn btn-primary'>OK</button>";
  echo "     <button class='btn'>Abbruch</button>";
  echo "  </div>";
  echo "</div>";
  echo "</fieldset>";
  echo "</form>";
  
}

function stammdatenimportieren($einkauftable) {
  $count = $_POST['count'];
  $cnt=0;
  if ($count>0) {
    $datum = date("Y-m-d");
    for($zaehl = 1; $zaehl <= $count; $zaehl++)
    {
      $idcheck = $_POST['check'.$zaehl];
      if ($idcheck==1) {
	     $cnt=$cnt+1;
        $idwert = $_POST['idwert'.$zaehl];
        $query = "SELECT * FROM tblartikel WHERE fldIndex=".$idwert;
        $result = mysql_query($query) or die(mysql_error()." ".$query);
        $line = mysql_fetch_array($result);
        echo $line[fldBez]."<br>";
        $qryins="INSERT INTO ".$einkauftable." (fldBez,fldAbteilung,fldOrt,fldKonto,fldAnz,fldPreis,fldStatus,fldBarcode,fldEinkaufDat) VALUES('$line[fldBez]','$line[fldAbteilung]','$line[fldOrt]','$line[fldKonto]','$line[fldAnz]',$line[fldPreis],'offen','$line[fldBarcode]','$datum')";
        $resins = mysql_query($qryins) or die(mysql_error()." ".$qryins);
      }
    }
  echo "<div class='alert alert-success'>";
  echo $cnt." Stammdaten wurden übernommen.";
  echo "</div>";
  }
}

?>