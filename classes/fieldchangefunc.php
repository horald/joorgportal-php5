<?php
header("content-type: text/html; charset=utf-8");
session_start();

function fieldchangesave($pararray) {
  $name = "preis";	
  $wert = $_POST[$name];
  $dbselarr = $_SESSION['DBSELARR'];
  $dbselchk = $_SESSION['DBSELCHK'];
  $count=sizeof($dbselarr);
  for ( $x = 0; $x < $count; $x++ )
  {
    //$query = "UPDATE ".$pararray['dbtable']." SET fldPreis='".$wert."'";
    $query = "UPDATE ".$pararray['dbtable']." SET fldPreis='".$wert."' WHERE ".$pararray['fldindex']."=".$_SESSION['DBSELARR'][$x];
    $result = mysql_query($query) or die(mysql_error()." ".$query);
  }  
  echo "<div class='alert alert-success'>";
  echo "Preis wurde auf ".$wert." € ge&aumlndert.";
  echo "</div>";
}	

function fieldchangeinput($menu,$menuid) {
  echo "<form class='form-horizontal' method='post' action='fieldchange.php?menu=".$menu."&menuid=".$menuid."&fieldchange=1'>";
  echo "<fieldset>";
  echo "Preis ";
  echo "<input type='text' name='preis' value=''>";
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