<?php

function bootstraphead() {
  echo "<!DOCTYPE html>";
  echo "<html lang='de'>";
  echo "<head>";
  echo "<meta charset='utf-8'>";
  echo "<link href='../../../includes/bootstrap/css/bootstrap.css' rel='stylesheet'>";
  echo "<script type='text/javascript' src='../../../includes/bootstrap/js/bootstrap-datepicker.js' charset='UTF-8'></script>";
  echo "<script src='datetimepicker_css.js'></script>";
  echo "</head>";
}

function bootstrapbegin($headline) {
  echo "<body>";
  echo "<div class='row-fluid'>";
  echo "<div class='span12'>";
  echo "<legend>".$headline."</legend>";
}

function bootstrapend() {
  echo "</div>";
  echo "</div>";
  echo "</body>";
  echo "</html>";
}

?>