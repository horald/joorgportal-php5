<?php
header("content-type: text/html; charset=utf-8");

function schedulecopyausfuehren($vondatum,$bisdatum,$neudatum,$dbtable) {

  $tag = substr($vondatum,8,2);
  $monat = substr($vondatum,5,2);
  $jahr = substr($vondatum,0,4);
  $vondate = mktime (0,0,0,$monat,$tag,$jahr);
  $tag = substr($bisdatum,8,2);
  $monat = substr($bisdatum,5,2);
  $jahr = substr($bisdatum,0,4);
  $bisdate = mktime (0,0,0,$monat,$tag,$jahr);
  $tag = substr($neudatum,8,2);
  $monat = substr($neudatum,5,2);
  $jahr = substr($neudatum,0,4);
  $neudate = mktime (0,0,0,$monat,$tag,$jahr);
  $anztage = ($bisdate - $vondate) / (60*60*24);
  //echo $anztage."=anztage<br>";

  $qrycol = "SHOW COLUMNS FROM ".$dbtable;
  //echo $qrycol."<br>";
  $rescol = mysql_query($qrycol) or die(mysql_error());
  //$lincol = mysql_fetch_array($rescol);
  //$getcol = $lincol[0];
  $cntcol = 0;
  while ($lincol = mysql_fetch_array($rescol)) {
    $cntcol++;
    $field=$lincol[0];
    if ($field<>"fldindex") {
      if ($getcol == "") {
        $getcol = $field;
      } else {
        $getcol = $getcol . "," . $field;
      }
    }         
  }

  for ($itag = 0; $itag <= $anztage; $itag++) {
    $date = $vondate+(60*60*24*$itag); 
    $wheredatum = date("Y-m-d",$date);
    $date = $neudate+(60*60*24*$itag); 
    $datum = date("Y-m-d",$date); 
    $setcol = str_replace('flddatum',"'".$datum."'",$getcol);

    $query="INSERT INTO ".$dbtable."(".$getcol.") SELECT ".$setcol." FROM ".$dbtable." WHERE flddatum='".$wheredatum."' ";
    mysql_query($query) or die(mysql_error().$query);
  	 //echo $itag.":".$datum.":".$query."<br>";
    
    $qryuser = "UPDATE ".$dbtable.",tbluserrotate SET ".$dbtable.".fldid_benutzer=(SELECT fldid_nachuser FROM tbluserrotate WHERE fldid_vonuser=".$dbtable.".fldid_benutzer) WHERE flddatum='".$datum."' AND fldrotate<>'N'";
    //echo $qryuser."=qryuser<br>";    mysql_query($qryuser) or die(mysql_error().$qryuser);
  }
  $anztage=$anztage+1;
  echo "<div class='alert alert-success'>";
  echo $anztage." Tage kopiert.";
  echo "</div>";
}

function schedulecopyauswahl($dbtable,$menu,$menuid) {
  $datum=date("Y-m-d");
  $date = explode('-', $datum);
  $Y = $date[0];
  $M = $date[1];
  $D = $date[2];  
  $t = mktime(0,0,0,$M,$D,$Y);
  $wt = date('w',$t);
  if (isset($date)) {
    if ($wt == 0) {
      $vonD = $D - 6;
    } else {
      $vonD = $D - $wt + 1;
    }  
    $t = mktime(0,0,0,$M,$vonD,$Y);
    $vondatum = date('Y-m-d',$t);

    $bisD = $D + $wt +1;
    $t = mktime(0,0,0,$M,$bisD,$Y);
    $bisdatum = date('Y-m-d',$t);

    $neuD = $D + $wt +2;
    $t = mktime(0,0,0,$M,$neuD,$Y);
    $neudatum = date('Y-m-d',$t);
    //echo "Übergabedatum:".$wt.":".$datum."<br>";
  }

  echo "<form name='eingabe' class='form-horizontal' method='post' action='schedulecopy.php?schedulecopy=1&menu=".$menu."&menuid=".$menuid."' enctype='multipart/form-data'>";
  echo "  <fieldset>";
      echo "          <div class='control-group'>";
      echo "            <label class='control-label' style='text-align:left' for='input01'>Von Datum</label>";
//        $datum=date("Y-m-d");
?>
        <input type="Text" id=vondatum name=vondatum value='<?php echo $vondatum; ?>' >
        <img src="images2/cal.gif" onclick="javascript:NewCssCal('vondatum','yyyyMMdd','ARROW')" style="cursor:pointer"/>
<?php 
      echo "          </div>";
      echo "          <div class='control-group'>";
      echo "            <label class='control-label' style='text-align:left' for='input01'>Bis Datum</label>";
        $datum=date("Y-m-d");
?>
        <input type="Text" id=bisdatum name=bisdatum value='<?php echo $bisdatum; ?>' >
        <img src="images2/cal.gif" onclick="javascript:NewCssCal('bisdatum','yyyyMMdd','ARROW')" style="cursor:pointer"/>
<?php 
      echo "          </div>";
      echo "          <div class='control-group'>";
      echo "            <label class='control-label' style='text-align:left' for='input01'>Neues Datum</label>";
        $datum=date("Y-m-d");
?>
        <input type="Text" id=neudatum name=neudatum value='<?php echo $neudatum; ?>' >
        <img src="images2/cal.gif" onclick="javascript:NewCssCal('neudatum','yyyyMMdd','ARROW')" style="cursor:pointer"/>
<?php 
      echo "          </div>";
  echo "  <input type='hidden' name=dbtable value='".$dbtable."' >";
  echo "  <div class='form-actions'>";
  echo "     <button type='submit' name='submit' class='btn btn-primary'>Speichern</button>";
  echo "     <button class='btn'>Abbruch</button>";
  echo "  </div>";
  echo "  </fieldset>";
  echo "</form>";
}

?>
