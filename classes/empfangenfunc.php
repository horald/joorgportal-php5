<?php

function datenauswahl($menu) {
  echo "<form class='form-horizontal' method='post' action='empfangen.php?empfangen=1&menu=".$menu."'>";
  echo "<dd><input type='text' name='urladr' value=''/></dd>";
  echo "<dd><input type='submit' value='Daten holen' /></dd>";
  echo "</form>";
}

function datenholen1() {
  echo $_POST['urladr'];
}

function datenholen() {
  echo "<br>Daten werden geholt...<br>";
  $urladr=$_POST['urladr'];
  ob_start();
  include("http://".$urladr.":8080/own/joorgsqlite/classes/senden.php");
  flush();
  $json=ob_get_contents();
  ob_end_clean();  

  $db = new SQLite3('../data/joorgsqlite.db');
  $obj=json_decode($json,true);
  foreach ( $obj['data'] as $datenarray ) {
    $sqlins="INSERT INTO ".$obj['table']." ('fldBez','fldanz','fldpreis','fldort') VALUES ('".$datenarray['fldBez']."','".$datenarray['fldanz']."','".$datenarray['fldpreis']."','".$datenarray['fldort']."')";
    echo $sqlins."<br>";
    $db->exec($sqlins);
  }
}

?>