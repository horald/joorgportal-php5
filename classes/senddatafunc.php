<?php
session_start();

function senddata() {
  echo "senddata<br>";

}

function getdata() {
  include("../config.php");
//  echo "senddata";
  $dbselarr = $_SESSION['DBSELARR'];
  $count=sizeof($dbselarr);
  echo $count."=count<br>";

  echo "<form id='einkaufslisteForm' action='senddata.php?id=1' method='POST'>";
  $json = '{';

  for ( $x = 0; $x < $count; $x++ ) {
    $query="SELECT * FROM tblEinkauf_liste WHERE fldindex=".$dbselarr[$x]." ORDER BY fldOrt, fldAbteilung, fldSort, fldBez";	
    $result = mysql_query($query) or die(mysql_error().$query);
    $line = mysql_fetch_array($result);
    //if ($x == $count) {
      //$json = $json . '"fldBez":"'+$line['fldBez']+'"';
    //} else {
      //$json = $json . '"fldBez":"'+$line['fldBez']+'",';
    //}
    $json = $json . '"daten['.$x.'].fldBez":"'.$line['fldBez'].'",';
    //echo $line['fldBez']."<br>";
  }
  $json = $json . '"ende":"0"';
  $json = $json . '}';
  echo "<input type='hidden' name='name' value='test'>";
  echo "<input type='submit' value='send'>";
  echo "</form>";

  var_dump(json_decode($json, true));
  echo "<script>localStorage.setItem('einkaufsliste', JSON.stringify('".$json."'));</script>";

}

?>