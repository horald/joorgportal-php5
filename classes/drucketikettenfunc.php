<?php

function etikettenauswahl($menu,$idwert) {
  echo "<form class='form-horizontal' method='post' action='drucketiketten.php?menu=".$menu."&idwert=".$idwert."&etiketten=1'>";
  echo "<fieldset>";
  echo "<div class='control-group'>";

  echo "<input type='hidden' name='count' value=".$cnt."/>";
  echo "  <div class='form-actions'>";
  echo "     <button type='submit' name='submit' class='btn btn-primary'>OK</button>";
  echo "     <button class='btn'>Abbruch</button>";
  echo "  </div>";
  echo "</div>";
  echo "</fieldset>";
  echo "</form>";

}

function etikettendrucken() {
  $query="SELECT * FROM tbletiketten";
  $result = mysql_query($query) or die(mysql_error());
  $line = mysql_fetch_array($result);
  echo $line['fldanzsp'].",".$line['fldanzzl'];  
  echo "<table>";
  for($zaehl = 1; $zaehl <= $line['fldanzzl']; $zaehl++) {
  	 echo "<tr>";
    for($zaehlsp = 1; $zaehlsp <= $line['fldanzsp']; $zaehlsp++) {
    	 echo "<td>ARTIKEL-NUMMER<img src='http://localhost/tools/phpqrcode/temp/QRd9b6a6e259ca048c15e58ae931e8ed2c.png' alt='Bild'></td>";
    }	 
  	 echo "</tr>";
  }  
  echo "</table>";
}

?>