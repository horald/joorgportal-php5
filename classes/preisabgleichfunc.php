<?php
header("content-type: text/html; charset=utf-8");

function preisuebernehmen($preistable) {
  $count = $_POST['count'];
  $cnt=0;
  if ($count>0) {
    for($zaehl = 1; $zaehl <= $count; $zaehl++)
    {
      $idcheck = $_POST['check'.$zaehl];
      if ($idcheck==1) {
	     $cnt=$cnt+1;
        $preis = $_POST['preis'.$zaehl];
        $barcode = $_POST['barcode'.$zaehl];
        $bez = $_POST['bez'.$zaehl];
        $query = "UPDATE ".$preistable." SET fldPreis='".$preis."', fldStatus='offen', fldBarcode='".$barcode."' WHERE fldArchivdat='' AND fldBez='".$bez."'";
        //echo $query."<br>";        
        $result = mysql_query($query) or die(mysql_error()." ".$query);
        $query = "UPDATE ".$preistable." SET fldPreis='".$preis."', fldStatus='offen' WHERE fldArchivdat='' AND fldBarcode='".$barcode."'";
        //echo $query."<br>";        
        $result = mysql_query($query) or die(mysql_error()." ".$query);
      }
    }
  echo "<div class='alert alert-success'>";
  if ($cnt==1) {
  	 echo "Preis übernommen.";
  } else {	 
    echo $cnt." Preise übernommen.";
  }
  echo "</div>";
  }
}

function preisauswahl($menu,$idwert,$preistable) {

  echo "<form class='form-horizontal' method='post' action='preisabgleich.php?menu=".$menu."&idwert=".$idwert."&preisabgleich=1'>";
  echo "<fieldset>";
  echo "<div class='control-group'>";
  echo "<table class='table table-hover'>";
  echo "<thead>";
  echo "<th><input type='checkbox' name='checkall'></th>";
  echo "<th>Bezeichnung</th>";
  echo "<th>Barcode</th>";
  echo "<th>Preis</th>";
  echo "</thead>";
  $query = "SELECT tblartikel.fldBarcode as Barcode, tblartikel.fldBez as Bez,tblartikel.fldPreis as Preis FROM ".$preistable.", tblartikel WHERE tblartikel.fldBarcode=".$preistable.".fldBarcode AND tblartikel.fldBarcode<>'' AND ".$preistable.".fldArchivdat=''";
  $result = mysql_query($query) or die(mysql_error());
  $cnt=0;
  while ($line = mysql_fetch_array($result)) { 
    $cnt=$cnt+1;
    echo "<tr>"; 
    echo "<input type='hidden' name='preis".$cnt."' value=".$line[Preis].">";
    echo "<input type='hidden' name='barcode".$cnt."' value=".$line[Barcode].">";
    echo "<td><input type='checkbox' name='check".$cnt."' value='1' checked></td>";
    echo "<td>".$line['Bez']."</td>";
    echo "<td>".$line['Barcode']."</td>";
    echo "<td>".$line['Preis']."</td>";
    echo "</tr>";    
  }
  $query = "SELECT tblartikel.fldBarcode as Barcode, tblartikel.fldBez as Bez,tblartikel.fldPreis as Preis FROM ".$preistable.", tblartikel WHERE tblartikel.fldBez = ".$preistable.".fldBez AND tblartikel.fldBarcode<>'' AND ".$preistable.".fldBarcode='' AND ".$preistable.".fldArchivdat=''";
  $result = mysql_query($query) or die(mysql_error());
  while ($line = mysql_fetch_array($result)) { 
    $cnt=$cnt+1;
    echo "<tr>"; 
    echo "<input type='hidden' name='preis".$cnt."' value=".$line[Preis].">";
    echo "<input type='hidden' name='barcode".$cnt."' value=".$line[Barcode].">";
    echo "<input type='hidden' name='bez".$cnt."' value=".$line[Bez].">";
    echo "<td><input type='checkbox' name='check".$cnt."' value='1' checked></td>";
    echo "<td>".$line['Bez']."</td>";
    echo "<td>".$line['Barcode']."</td>";
    echo "<td>".$line['Preis']."</td>";
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
?>