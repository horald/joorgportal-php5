<?php
$autosync=$_GET[autosync];
//echo "autosync:".$autosync."<br>";
include("../config.php");
include("bootstrapfunc.php");
//include("autosyncfunc.php");
include("../sites/views/wp_".$autosync."/showtab.inc.php");
bootstraphead();
bootstrapbegin($pararray['headline']);

  echo "<div class='alert alert-success'>";
  echo "autosync => autosync";
  echo "</div>";

  $vondbname="dbjoorgportal";
  $vontblname=$pararray['dbtable'];
  $nchdbname="dbjoorgportal312";
  $nchtblname=$pararray['dbtable'];

  $query="SELECT * FROM tblautosyncstatus WHERE flddbname='".$vondbname."' AND fldtblname='".$vontblname."' ORDER BY fldtimestamp desc LIMIT 1";
  //echo $query."<br>";
  $result = mysql_query($query) or die(mysql_error());
  $line = mysql_fetch_array($result);
  $timestamp=$line[fldtimestamp];
  //echo $timestamp."=timestamp<br>";

  if ($timestamp=="") {
    $query="SELECT * FROM ".$vontblname." WHERE fldcomputer='".gethostname()."'";
  } else {
    $query="SELECT * FROM ".$vontblname." WHERE fldcomputer='".gethostname()."' AND fldtimestamp>='".$timestamp."'";
  }
  //echo $query."<br>";

  $qrycol = "SHOW COLUMNS FROM $vondbname.$vontblname";
  //echo $qrycol."<br>";
  $rescol = mysql_query($qrycol) or die(mysql_error());
  $lincol = mysql_fetch_array($rescol);
  $getcol = $lincol[0];
  $cntcol = 0;
  while ($lincol = mysql_fetch_array($rescol)) {
    $cntcol++;
    if ($getcol == "") {
      $getcol = $lincol[0];
    } else {
      $getcol = $getcol . "," . $lincol[0];
    }       
  }

  $count=0;
  $result = mysql_query($query) or die(mysql_error());
  while ($line = mysql_fetch_array($result)) { 
    $count=$count+1;

    foreach ( $listarray as $arrelement )  
    {
  
      if ($arrelement['autosync']=="true") {
        echo "<div class='alert alert-info'>";
        echo $count.". ".$line[$arrelement['dbfield']]."<br>";
        echo "</div>";
      }    

    }


        $val = "'".$line[0]."'";
        for($count = 1; $count <= $cntcol; $count++) {
          $val = $val . ",'".$line[$count]."'";
        }

        $qryrep = "REPLACE INTO ".$nchdbname.".".$nchtblname."(".$getcol.") VALUES (".$val.")";
        //echo $qry."<br>";
        mysql_query($qryrep) or die(mysql_error());


  }

  $qryins="REPLACE INTO tblautosyncstatus (flddbname,fldtblname) VALUES ('".$vondbname."','".$vontblname."')";
  //echo $qryins."<br>";
  mysql_query($qryins) or die(mysql_error());

bootstrapend();
?>