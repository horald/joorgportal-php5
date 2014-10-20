<?php
header("content-type: text/html; charset=utf-8");
session_start();

function resyncallinput($menu,$menuid) {
 
  echo "<form class='form-horizontal' method='post' action='resyncall.php?menu=".$menu."&menuid=".$menuid."&resyncall=1'>";
  echo "<fieldset>";
  echo "<div class='control-group'>";
  echo "<table class='table table-hover'>";
  echo "<thead>";
  echo "<th><input type='checkbox' name='checkall'></th>";
  echo "<th>Typ</th>";
  echo "</thead>";
  $query = "SELECT * FROM tblresyncalltyp";
  $result = mysql_query($query) or die(mysql_error());
  $cnt=0;
  while ($line = mysql_fetch_array($result)) { 
    $cnt=$cnt+1;
    echo "<tr>"; 
    echo "<input type='hidden' name='idwert".$cnt."' value=".$line[fldindex].">";
    echo "<td><input type='checkbox' name='check".$cnt."' value='1'></td>";
    echo "<td>".$line['fldbez']."</td>";
    echo "</tr>";    
  }
  echo "</table>";
  
  echo "<input type='hidden' name='count' value=".$cnt."/>";
  echo "  <div class='form-actions'>";
  echo "     <button type='submit' name='submit' class='btn btn-primary'>OK</button>";
  echo "     <button class='btn'>Abbruch</button>";
  echo "  </div>";
  echo "</div>";
  echo "</fieldset>";
  echo "</form>";
  
}

function resynctypall($dbtable) {
  $query="INSERT tbldbsync (flddbname,fldtblname,fldtblindex,fldstatus,flddbsync,fldcompid) (SELECT 'dbWebportal','".$dbtable."',tab.".$pararray['fldindex'].",'INS','NEW',comp.fldIndex FROM ".$dbtable." AS tab,tblcomputer AS comp WHERE comp.fldaktiv='J')";
  $result = mysql_query($query) or die(mysql_error()." ".$query);
 //echo $query."<br>";
  echo "<div class='alert alert-success'>";
  echo "Resync-all wurde für table ".$dbtable." durchgeführt.";
  echo "</div>";
}

function resynctypact($dbtable,$dbname,$fldindex) {
  $dbselarr = $_SESSION['DBSELARR'];
  $count=sizeof($dbselarr);
  for ( $x = 0; $x < $count; $x++ )
  {
    $query="SELECT * FROM ".$dbtable." WHERE ".$fldindex."=".$dbselarr[$x];	
    //echo $query."=query<br>";
    $result = mysql_query($query) or die(mysql_error()." ".$query);
    $line = mysql_fetch_array($result);
    $qrycmp="SELECT * FROM tblcomputer WHERE fldaktiv='J'";
    $rescmp = mysql_query($qrycmp) or die(mysql_error()." ".$qrycmp);
    $cnt=0;
    while ($lincmp = mysql_fetch_array($rescmp)) {
      $cnt=$cnt+1; 
      $qryins="INSERT tbldbsync (flddbname,fldtblname,fldtblindex,fldstatus,flddbsync,fldcompid) VALUES('".$dbname."','".$dbtable."',".$line[$fldindex].",'INS','NEW',".$lincmp['fldIndex'].");";
      $resins = mysql_query($qryins) or die(mysql_error()." ".$qryins);
      echo "<div class='alert alert-info'>";
      echo $count.".".$cnt.") ".$qryins."<br>";
      echo "</div>";
    }  
  }
  echo "<div class='alert alert-success'>";
  echo $count." DS Resync-act wurde für table ".$dbtable." durchgeführt.";
  echo "</div>";
}

function resyncallfunc($pararray,$menu,$idwert,$dbname) {
  $dbtable=$pararray['dbtable'];
  $strwhere=$pararray['strwhere'];
  $fldindex=$pararray['fldindex'];
  $count = $_POST['count'];
  $cnt=0;
  if ($count>0) {
    for($zaehl = 1; $zaehl <= $count; $zaehl++)
    {
      $idcheck = $_POST['check'.$zaehl];
      if ($idcheck==1) {
	     $cnt=$cnt+1;
        $idwert = $_POST['idwert'.$zaehl];
        $query = "SELECT * FROM tblresyncalltyp WHERE fldindex=".$idwert;
        $result = mysql_query($query) or die(mysql_error()." ".$query);
        $line = mysql_fetch_array($result);
        //echo $line[fldbez]."<br>";
        if ($line[fldbez]==="ALL") {
          resynctypall($dbtable);         	
        }
        if ($line[fldbez]==="ACT") {
        	 resynctypact($dbtable,$dbname,$fldindex);
        }		
      }
    }
  }    
}