<?php
  include("../config.php");

  $jsonarr=array();
       
  $query = "SELECT * FROM tbltermine_liste";
  $result = mysql_query($query) or die(mysql_error());
  $count=0;
  while ($line = mysql_fetch_array($result)) { 
    $count=$count+1;
    $color='';
    $txtcol='';
    $qrycol = "SELECT * FROM tbltermine_grp WHERE fldindex=".$line['fldid_terminegrp'];
    $rescol = mysql_query($qrycol) or die(mysql_error());
    if ($lincol = mysql_fetch_array($rescol)) {
      //$color='#378006';
      $color=$lincol['fldfarbe'];
    }  
    $colser='';
    $fldsel='J';
    $qrycol = "SELECT * FROM tbltermine_serie WHERE fldindex=".$line['fldid_terminserie'];
    $rescol = mysql_query($qrycol) or die(mysql_error());
    if ($lincol = mysql_fetch_array($rescol)) {
      //$color='#378006';
      $colser=$lincol['fldfarbe'];
      $fldsel=$lincol['fldsel'];
    }  
    if ($colser<>'') {
      $color=$colser;
      $txtcol='#000000';    
    }
    if ($fldsel=="J") {
      $dsarr=array(      
                        'id' => $count,
                        'title' => $line['fldbez'],
                        'start' => $line['fldvondatum'],
                        'end' => $line['fldbisdatum'],
                        'backgroundColor' => $color,
                        'textColor' => $txtcol,
                        'url' => "update.php?menu=termine&idwert=".$line['fldindex']
                        );
      $menge=array_push($jsonarr,$dsarr);
    }                      
  }
  echo json_encode($jsonarr);

?>
