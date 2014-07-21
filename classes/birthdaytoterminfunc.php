<?php
header("content-type: text/html; charset=utf-8");
session_start();

function birthdayabfrage($menu,$menuid) {
  echo "<form method='post' action='umbuch.php?umbuch=1&menu=".$menu."&menuid=".$menuid."'>";
  echo "<fieldset>";

  echo "<div class='control-group'>";
  echo "<div>";
  echo "Von Jahr: ";
  $vonjahr="2014";
  echo "<input type='Text' name='vonjahr' value='".$vonjahr."'/>";
  echo "</div>";
  echo "<div>";
  echo "Bis Jahr: ";
  $bisjahr="2014";
  echo "<input type='Text' name='bisjahr' value='".$bisjahr."'/>";
  echo "</div>";
  echo "</div>";
  

  echo "  <div class='form-actions'>";
  echo "     <button type='submit' name='submit' class='btn btn-primary'> Import </button>";
  echo "     <button class='btn'>Abbruch</button>";
  echo "  </div>";
  echo "</fieldset>";
  echo "</form>";
}

function birthdayexec() {
  $dbselarr = $_SESSION['DBSELARR'];
  $count=sizeof($dbselarr);
  for ( $x = 0; $x < $count; $x++ ) 
  {
    $query="SELECT * FROM tblgeburtstage WHERE fldindex=".$dbselarr[$x];
    //echo $query."=query<br>";
    $result = mysql_query($query) or die(mysql_error());
    $line = mysql_fetch_array($result);
    $bez="Geburtstag ".$line['fldVorname']." ".$line['fldNachname'];
    $jahr=date("Y")+1;
    $datum=$jahr.substr($line['fldGebDatum'],4);
    $qryins="INSERT INTO tbltermine_liste (fldbez,fldvondatum) VALUES('".$bez."','".$datum."');";
    //echo $qryins."=qryins<br>";
    $resins = mysql_query($qryins) or die(mysql_error());
  }  
  echo "<div class='alert alert-success'>";
  echo $count." Geburtstagstermine eingef&uumlgt.";
  echo "</div>";
  	
}

?>