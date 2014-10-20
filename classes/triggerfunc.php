<?php

header("content-type: text/html; charset=utf-8");

function triggerauswahl($idwert,$menu) {
  echo "<form class='form-horizontal' method='post' action='trigger.php?menu=".$menu."&idwert=".$idwert."&trigger=4'>";
  echo "<fieldset>";
  echo "<div class='control-group'>";
  echo "Computer: ";
  echo "<select name='selcomputer'>";
  $query = "SELECT * FROM tblcomputer WHERE fldaktiv='J'";
  $result = mysql_query($query) or die(mysql_error());
  $cnt=0;
  while ($line = mysql_fetch_array($result)) { 
    $cnt=$cnt+1;
    echo "<option value='".$line[fldIndex]."'>".$line['fldHost']."</option>";
  }
  echo "</select>";
  
  echo "<input type='hidden' name='count' value=".$cnt."/>";
  echo "  <div class='form-actions'>";
  echo "     <button type='submit' name='submit' class='btn btn-primary'>OK</button>";
  echo "     <button class='btn'>Abbruch</button>";
  echo "  </div>";
  echo "</div>";
  echo "</fieldset>";
  echo "</form>";

}

function triggerinsert($dbname) {
  include("syncfunc.php");
  $idwert=$_GET['idwert'];  
  $query="SELECT * FROM tbltrigger WHERE fldindex=".$idwert; 
  $result = mysql_query($query) or die(mysql_error());  $line = mysql_fetch_array($result);
  $dbtable=$line['fldbez'];
  createtrigger($dbname,$dbtable);
}

function cleardbsync() {
  echo "<a class='btn btn-primary' href='trigger.php'>zurück</a><br>";
  $query = "SELECT count(*) as ncount FROM tbldbsync WHERE flddbsync='OK'";
  $result = mysql_query($query) or die(mysql_error());  $line = mysql_fetch_array($result);
  $nCount = $line['ncount'];
  $query = "DELETE FROM tbldbsync WHERE flddbsync='OK'";
  $result = mysql_query($query) or die(mysql_error());  echo "<div class='alert alert-success'>";
  echo $nCount." Datensätze bereinigt.";
  echo "</div>";
}

function createdbtrigger() {
  echo "<a class='btn btn-primary' href='trigger.php'>zurück</a><br>";
  $dbtable = $_GET['table'];
  include("syncfunc.php");
  createtrigger($dbtable);
}

function deletetrigger($idwert) {
  $query="SELECT * FROM tbltrigger WHERE fldindex=".$idwert;
  $result = mysql_query($query) or die(mysql_error());  $line = mysql_fetch_array($result);
  $dbtable=$line['fldbez'];
  $queryins="DROP TRIGGER IF EXISTS `".$dbtable."_ai` ";  $result = mysql_query($queryins) or die(mysql_error());  $queryupd="DROP TRIGGER IF EXISTS `".$dbtable."_au` ";  $result = mysql_query($queryupd) or die(mysql_error());  $querydel="DROP TRIGGER IF EXISTS `".$dbtable."_ad` ";  $result = mysql_query($querydel) or die(mysql_error());
  $qryupd="UPDATE tbltrigger SET fldsettrigger='D' WHERE fldindex=".$idwert;
//  echo $qryupd."=upd<br>"; 
  $result = mysql_query($qryupd) or die(mysql_error());
  echo "<div class='alert alert-success'>";
  echo "Trigger f&uumlr ".$dbtable." gel&oumlscht.";
  echo "</div>";
}	

function dbfilltrigger($menu,$computerid) {
  include("syncfunc.php");
  $qrycomp="SELECT * FROM tblcomputer WHERE fldIndex=".$computerid;
  $rescomp = mysql_query($qrycomp) or die("qrycomp:".mysql_error());
  $lincomp = mysql_fetch_array($rescomp);
  if ($lincomp['fldlocal']==="J") {
    $dbremotehost="localhost";
  } else {	    $dbremotehost=$lincomp['fldIPAddr'];
  }  
  $dbremoteuser=$lincomp['fldusername'];
  $dbremotepass=$lincomp['fldpassword'];
  $dbremotedb=$lincomp['flddbname'];
  echo "<div class='alert alert-success'>";
  echo "Anmeldung an host '".$dbremotehost."' erfolgt...";
  echo "</div>";
  $qrydel = "DELETE FROM tbltrigger WHERE fldid_computer=".$computerid;
  $resdel = mysql_query($qrydel) or die("qrydel:".mysql_error());  changetoremote($dbremotehost,$dbremoteuser,$dbremotepass,$dbremotedb);
  $query = "SHOW TABLES";
  $result = mysql_query($query) or die("query:".mysql_error());
  $linarr=array();  while ($line = mysql_fetch_array($result)) { 
    $qrytrigger = "SHOW TRIGGERS like '".$line[0]."%'";
    $restrigger = mysql_query($qrytrigger);
    $num_rows = mysql_num_rows($restrigger);
    $trigger="N";
    if ($num_rows==3) {
      $trigger="J";
    }
    $qryanz="SELECT * FROM ".$line[0];
    $resanz = mysql_query($qryanz) or die(mysql_error());
    $num_rows = mysql_num_rows($resanz);
    array_push($linarr,array($line[0],$computerid,$trigger,$num_rows));
  }
  changetolocal('');
  foreach ( $linarr as $linelement )
  {
    $qryins="INSERT tbltrigger (fldbez,fldid_computer,fldsettrigger,fldAnz) VALUES('".$linelement[0]."',$linelement[1],'".$linelement[2]."',".$linelement[3].")";
    $resins = mysql_query($qryins) or die("qryins:".mysql_error());     
  }  
  echo "<div class='alert alert-success'>";
  $count=sizeof($linarr);
  echo $count." Datens�tze gefunden.<br>";
  echo "Trigger aktualisiert.";
  echo "</div>";
  echo "<meta http-equiv='refresh' content='0; URL=showtab.php?menu=".$menu."'>";
}

function triggerfunc() {

//echo "<a class='btn btn-primary' href='trigger.php?trigger=2'>dbsync bereinigen</a><br>";
echo "<select>";
echo "<option>eins</option>";
echo "<option>zwei</option>";
echo "</select>";
echo "<table class='table table-hover'>";
echo "<thead>";
echo "<th>Table</th>";
echo "<th>Trigger</th>";
echo "</thead>";
$query = "SHOW TABLES";
$result = mysql_query($query) or die(mysql_error());while ($line = mysql_fetch_array($result)) { 
  $qrytrigger = "SHOW TRIGGERS like '".$line[0]."%'";
  $restrigger = mysql_query($qrytrigger);
  $num_rows = mysql_num_rows($restrigger);
  $trigger="N";
  if ($num_rows==3) {
    $trigger="J";
  }
  echo "<tr>";
  echo "<td>".$line[0]."</td>";
  echo "<td>".$trigger."</td>";
  echo "<td width='5'><a class='btn' href='trigger.php?trigger=3&table=".$line[0]."'><i class='icon-edit'></i></a></td>";
//  echo "<td width='5'><a class='btn' href='trigger.php?trigger=1&table=".$line[0]."'><i class='icon-edit'></i></a></td>";
  echo "</tr>";
}
echo "</table>";
}

?>