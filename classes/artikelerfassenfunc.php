<?php

function artikelerfasseninput() {
  echo "<form class='form-horizontal' method='post' action='ausstammdaten.php?menu=".$menu."&idwert=".$idwert."&stammdaten=1'>";
  echo "<fieldset>";
  echo "<div class='control-group'>";

  echo "          <div class='control-group'>";
  echo "            <label class='control-label' style='text-align:left' for='input01'>Artikel</label>";
  echo "            <div class='input'>";
  echo "              <input type='text' id='input01' name='artikelnr' value=''>";
  echo "            </div>";
  echo "          </div>";

  echo "          <div class='control-group'>";
  echo "            <label class='control-label' style='text-align:left' for='input02'>Barcode</label>";
  echo "            <div class='input'>";
  echo "              <input type='text' id='input02' name='barcode' value=''>";
  echo "            </div>";
  echo "          </div>";

  echo "  <div class='form-actions'>";
  echo "     <button type='submit' name='submit' class='btn btn-primary'>OK</button>";
  echo "     <button class='btn'>Abbruch</button>";
  echo "  </div>";
  echo "</div>";
  echo "</fieldset>";
  echo "</form>";

}

?>