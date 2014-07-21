<?php

function changesausfuehren() {
include("../config.php");
  $auswahl=$_POST['auswahl'];
  //echo $auswahl."=Auswahl<br>";
  switch ( $auswahl )
  {
    case 'logfile':
      $datei="changes";
    break;
    case 'Buglist':
      $datei="bug";
    break;
    case 'Newlist':
      $datei="new";
    break;
  }
  $datei="../admin/logs/".$datei.".".$langshort.".log";  
  if ( file_exists ( $datei ) )
  {
    $lines = file($datei);
    foreach ($lines as $line_num => $query) {
      echo $query."<br>";
    }
  } else {
    echo "<div class='alert alert-warning'>";
    echo "Datei ".$datei." nicht gefunden!";
    echo "</div>";
  }	 
}

function changesinput() {
  echo "<form class='form-horizontal' method='post' action='changes.php?menu=".$menu."&idwert=".$idwert."&changes=1'>";
  echo "<fieldset>";
  echo "<div class='control-group'>";
  echo "<select name='auswahl' size='1'>";
  echo "<option style='background-color:#c0c0c0;'>logfile</option>";
  echo "<option style='background-color:#c0c0c0;'>Buglist</option>";
  echo "<option style='background-color:#c0c0c0;'>Newlist</option>";
  echo "</select>";
  echo "  <div class='form-actions'>";
  echo "     <button type='submit' name='submit' class='btn btn-primary'>OK</button>";
  echo "     <button class='btn'>Abbruch</button>";
  echo "  </div>";
  echo "</div>";
  echo "</fieldset>";
  echo "</form>";
}
?>