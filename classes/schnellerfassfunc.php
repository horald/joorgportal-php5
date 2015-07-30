<?php

function schnellerfassauswahl($menu,$idwert) {
  
  echo "<form class='form-horizontal' method='post' action='schnellerfass.php?menu=".$menu."&idwert=".$idwert."&erfass=1'>";
  echo "<fieldset>";
  echo "<div class='control-group'>";

      echo "          <div class='control-group'>";
      echo "            <label class='control-label' style='text-align:left' for='input01'>Wo:</label>";
      echo "            <div class='input'>";
      echo "              <input type='text' id='input01' name='fldwo' value=''>";
      echo "            </div>";
      echo "          </div>";

  
  echo "  <div class='form-actions'>";
  echo "     <button type='submit' name='submit' class='btn btn-primary'>Hinzu</button>";
  echo "     <button class='btn'>Ändern</button>";
  echo "     <button class='btn'>Löschen</button>";
  echo "  </div>";
  echo "</div>";
  echo "</fieldset>";
  echo "</form>";

  
}
 
function schnellerfassspeichern() {
  echo "speichern<br>";
  $fldwo=$_POST['fldwo'];
  echo $fldwo;
} 

?>