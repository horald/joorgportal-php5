<?php
header("content-type: text/html; charset=utf-8");

function statusvorauswahl($menu,$filterarray) {
  echo "<form class='form-horizontal' method='post' action='status.php?status=1&menu=".$menu."'>";

  $count=sizeof($filterarray);
  echo "<select name='auswahltyp' size='1'>";
  for ( $x = 0; $x < $count; $x++ ) {
    echo "<option style='background-color:#c0c0c0;' value='".$filterarray[$x]['dbfield']."'>".$filterarray[$x]['label']."</option>";
  }
//  echo "<option style='background-color:#c0c0c0;' >Status</option>";
//  echo "<option style='background-color:#c0c0c0;' >Rechdatum</option>";
//  echo "<option style='background-color:#c0c0c0;' >Einkaufsort</option>";
  echo "<option style='background-color:#c0c0c0;' value='NOSYNC'>NOSYNC</option>";
  echo "</select>";

  echo "<dd><input type='submit' value='Weiter' /></dd>";
  echo "</form>";
}

function statusauswahl($menu,$auswahltyp) {
//echo $auswahltyp."=auswahltyp<br>";	
  //$db = new SQLite3('../data/joorgsqlite.db');
  echo "<form class='form-horizontal' method='post' action='status.php?status=2&menu=".$menu."'>";
  echo "<input type='hidden' name='auswahltyp' value='".$auswahltyp."' />";

  echo "<table>";

  if ($auswahltyp<>"Einkaufsort") {
  $default = date('Y-m-d');
  echo "<tr>";
  echo "<td><label >Von Datum:</label></td>";
  echo "<td><div class='input-group date form_date col-md-12' data-date='' data-date-format='yyyy-mm-dd' data-link-field='dtp_input2' data-link-format='yyyy-mm-dd'>";
  echo "<input class='form-control' size='8' type='text' name='vondatum' value='".$default."' >";
  echo "<span class='input-group-addon'><span class='glyphicon glyphicon-calendar'></span></span>";
  echo "</div></td>";
  echo "<input type='hidden' id='dtp_input2' value='' />";
  echo "</tr>";

  $default = date('Y-m-d');
  echo "<tr>";
  echo "<td><label >Bis Datum:</label></td>";
  echo "<td><div class='input-group date form_date col-md-12' data-date='' data-date-format='yyyy-mm-dd' data-link-field='dtp_input2' data-link-format='yyyy-mm-dd'>";
  echo "<input class='form-control' size='8' type='text' name='bisdatum' value='".$default."' >";
  echo "<span class='input-group-addon'><span class='glyphicon glyphicon-calendar'></span></span>";
  echo "</div></td>";
  echo "<input type='hidden' id='dtp_input2' value='' />";
  echo "</tr>";
  }
  
//echo $auswahltyp."*<br>";
  if (($auswahltyp=="Status") or ($auswahltyp=='fldStatus')) {
    $sql="SELECT * FROM tblstatus";
    //$results = $db->query($sql);
    $results = mysql_query($sql) or die(mysql_error());
    echo "<tr>";
    echo "<td><label >Von Status:</label></td>";
    echo "<td><select name='vonstatus' size='1'>";
    echo "<option style='background-color:#c0c0c0;' >(ohne)</option>";
    while ($row = mysql_fetch_array($results)) {
    //while ($row = $results->fetchArray()) {
      echo "<option style='background-color:#c0c0c0;' >".$row['fldbez']."</option>";
    }
    echo "</select></td>";
    echo "</tr>";

    $sql="SELECT * FROM tblstatus";
    //$results = $db->query($sql);
    $results = mysql_query($sql) or die(mysql_error());
    echo "<tr>";
    echo "<td><label >Nach Status:</label></td>";
    echo "<td><select name='nchstatus' size='1'>";
    echo "<option style='background-color:#c0c0c0;' >(ohne)</option>";
    while ($row = mysql_fetch_array($results)) {
    //while ($row = $results->fetchArray()) {
//    echo "<option style='background-color:#c0c0c0;'  value=".$row['fldindex'].">".$row['fldbez']."</option>";
      echo "<option style='background-color:#c0c0c0;' >".$row['fldbez']."</option>";
    }
    echo "</select></td>";
    echo "</tr>";
  }  
  if ($auswahltyp=="Einkaufsort") {
    $sql="SELECT * FROM tblorte WHERE fldo01typ='FREMD'";
    //$results = $db->query($sql);
    $results = mysql_query($sql) or die(mysql_error());
    echo "<tr>";
    echo "<td><label >Von Ort:</label></td>";
    echo "<td><select name='vonort' size='1'>";
    echo "<option style='background-color:#c0c0c0;' >(ohne)</option>";
    while ($row = mysql_fetch_array($results)) {
    //while ($row = $results->fetchArray()) {
      echo "<option style='background-color:#c0c0c0;' >".$row['fldBez']."</option>";
    }
    echo "</select></td>";
    echo "</tr>";

    $sql="SELECT * FROM tblorte WHERE fldo01typ='FREMD'";
    //$results = $db->query($sql);
    $results = mysql_query($sql) or die(mysql_error());
    echo "<tr>";
    echo "<td><label >Nach Ort:</label></td>";
    echo "<td><select name='nchort' size='1'>";
    echo "<option style='background-color:#c0c0c0;' >(ohne)</option>";
    while ($row = mysql_fetch_array($results)) {
    //while ($row = $results->fetchArray()) {
//    echo "<option style='background-color:#c0c0c0;'  value=".$row['fldindex'].">".$row['fldbez']."</option>";
      echo "<option style='background-color:#c0c0c0;' >".$row['fldBez']."</option>";
    }
    echo "</select></td>";
    echo "</tr>";
  }  
  if ($auswahltyp=="Rechdatum") {
    $sql="SELECT * FROM tblrechdat";
    //$results = $db->query($sql);
    $results = mysql_query($sql) or die(mysql_error());
    echo "<tr>";
    echo "<td><label >Rechdatum:</label></td>";
    echo "<td><select name='rechdat' size='1'>";
    echo "<option style='background-color:#c0c0c0;' >(ohne)</option>";
    while ($row = mysql_fetch_array($results)) {
    //while ($row = $results->fetchArray()) {
    echo "<option style='background-color:#c0c0c0;'  value=".$row['fldindex'].">".$row['flddatum']."</option>";
//      echo "<option style='background-color:#c0c0c0;' >".$row['fldbez']."</option>";
    }
    echo "</select></td>";
    echo "</tr>";
  }
  if ($auswahltyp=="fldKonto") {
    $sql="SELECT * FROM tblktokonten ";
    //$results = $db->query($sql);
    $results = mysql_query($sql) or die(mysql_error());
    echo "<tr>";
    echo "<td><label >Von Konto:</label></td>";
    echo "<td><select name='vonkonto' size='1'>";
    echo "<option style='background-color:#c0c0c0;' >(ohne)</option>";
    while ($row = mysql_fetch_array($results)) {
    //while ($row = $results->fetchArray()) {
      echo "<option style='background-color:#c0c0c0;' >".$row['fldKurz']."</option>";
    }
    echo "</select></td>";
    echo "</tr>";

    //$results = $db->query($sql);
    $results = mysql_query($sql) or die(mysql_error());
    echo "<tr>";
    echo "<td><label >Nach Konto:</label></td>";
    echo "<td><select name='nchkonto' size='1'>";
    echo "<option style='background-color:#c0c0c0;' >(ohne)</option>";
    while ($row = mysql_fetch_array($results)) {
    //while ($row = $results->fetchArray()) {
      echo "<option style='background-color:#c0c0c0;' >".$row['fldKurz']."</option>";
    }
    echo "</select></td>";
    echo "</tr>";

  }
  echo "</table>";

  echo "<dd><input type='submit' value='Speichern' /></dd>";
  echo "</form>";
}

function statusfunc($vondatum,$bisdatum,$vonstatus,$nchstatus,$auswahltyp,$rechdat,$vonort,$nchort,$vonkonto,$nchkonto,$dbtable) {
  //$db = new SQLite3('../data/joorgsqlite.db');
  //echo $auswahltyp."=auswahltyp<br>";
  if (($auswahltyp=="Status") or ($auswahltyp=="fldStatus")) {
    $sql="UPDATE tblfahrtenbuch SET fldStatus='".$nchstatus."' WHERE fldStatus='".$vonstatus."' AND fldVondatum>='".$vondatum."' AND fldVondatum<='".$bisdatum."'";
  } else {
    if ($auswahltyp=="Einkaufsort") {
      $sql="UPDATE tblEinkauf_liste SET fldOrt='".$nchort."' WHERE fldOrt='".$vonort."'";
    } else {
      if ($auswahltyp=="fldKonto") {
        $sql="UPDATE tblEinkauf_liste SET fldKonto='".$nchkonto."' WHERE fldKonto='".$vonkonto."' AND fldEinkaufDatum>='".$vondatum."' AND fldEinkaufDatum<='".$bisdatum."'";
      } else  {	
        if ($auswahltyp=="NOSYNC") {
        	 $sql="UPDATE ".$dbtable." SET flddbsyncstatus='NOSYNC'";
        } else {	
          $sql="UPDATE tblfahrtenbuch SET fldind_datum=".$rechdat." WHERE fldVondatum>='".$vondatum."' AND fldVondatum<='".$bisdatum."'";
        }
      }
    }  
  }
  //$reserr = $db->exec($sql);
  mysql_query($sql) or die("Error using mysql_query($sql): ".mysql_error());
  echo "<div class='alert alert-success'>";
  echo $auswahltyp."<br>";
  echo $sql."<br>";
  echo "</div>";
}
?>