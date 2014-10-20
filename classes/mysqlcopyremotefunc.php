<?php

function mysqlcopyremote($dbtable,$fldindex,$idwert) {
  $query="SELECT * FROM ".$dbtable." WHERE ".$fldindex."=".$idwert;
  //echo $query."=query<br>"; 
  $result = mysql_query($query) or die(mysql_error());
  $line = mysql_fetch_array($result);
  //echo $query."=query<br>";
  $menge = mysql_num_fields ( $result );
  $fldarr=array();
  $fldtyp=array();
  for ( $x = 0; $x < $menge; $x++ ) {
  	 $name = mysql_field_name ( $result, $x );
  	 //echo $name."=name<br>";
  	 $arrmenge = array_push($fldarr,$name);
  	 $typ = mysql_field_type ( $result, $x );
  	 //echo $typ."=typ<br>";
  	 $typmenge = array_push($fldtyp,$typ);
  }	

  
  $qrycomp="SELECT * FROM tblcomputer WHERE fldcloud='J'";
  $rescomp = mysql_query($qrycomp) or die("qrycomp:".mysql_error());
  $lincomp = mysql_fetch_array($rescomp);
  $dbremotehost=$lincomp['fldIPAddr'];
  $dbremoteuser=$lincomp['fldusername'];
  $dbremotepass=$lincomp['fldpassword'];
  $dbremotedb=$lincomp['flddbname'];
  changetoremote($dbremotehost,$dbremoteuser,$dbremotepass,$dbremotedb);
  $fldlist=$fldarr[0];
  $vallist=$line[$fldlist];
  for ( $x = 1; $x < $menge; $x++ )
  {
  	 $fldlist=$fldlist.",".$fldarr[$x];
  	 if (($fldtyp[$x]==="string") OR ($fldtyp[$x]==="timestamp") OR ($fldtyp[$x]==="date")) {
  	   $vallist=$vallist.",'".$line[$fldarr[$x]]."'";
  	 } else {
  	   $vallist=$vallist.",".$line[$fldarr[$x]];
  	 }	
  }	
  $query = "REPLACE INTO ".$dbtable." (".$fldlist.") VALUES (".$vallist.")";
  //echo $query."=query<br>";
  $result = mysql_query($query) or die("query:".mysql_error());

  changetolocal('');

  echo "<div class='alert alert-success'>";
  echo "Datensatz kopiert.";
  echo "</div>";
}
	
?>