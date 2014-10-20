<?php
session_start();
$menu=$_GET[menu];
$idwert=$_GET[idwert];
include("../config.php");
include("bootstrapfunc.php");
include("../sites/views/wp_".$menu."/showtab.inc.php");
$vote=$_GET['vote'];
$query="";
$autoreturn="J";
if ($vote==1) {

    if (isset($_SESSION['uid'])) {
    	$anmeld="J";
    } else {
    	$anmeld="N";
    }

  if ($anmeld=="J") {
    $qryanz="SELECT * FROM ".$pararray['dbtable']." WHERE ".$pararray['fldindex']."=".$idwert;
    $resanz=mysql_query($qryanz) or die("Error using mysql_query($sql): ".mysql_error()." query:".$qryanz);
    $linanz = mysql_fetch_array($resanz);
    $anz=$linanz[$pararray['markfield']]+1;       
    $query="UPDATE ".$pararray['dbtable']." SET ".$pararray['markfield']."=".$anz." WHERE ".$pararray['fldindex']."=".$idwert;
    //echo $query."=vote<br>";
  } else {
    echo "<div class='alert alert-success'>";
    echo "Keine Wahl möglich! Bitte erst anmelden.";
    echo "</div>";
    $autoreturn="N";
  }  	
} else {	
  if ($pararray['markseldb']<>"") {
    if ($pararray['marktoggle']=="true") {
      $qryanz="SELECT * FROM ".$pararray['dbtable']." WHERE ".$pararray['fldindex']."=".$idwert;
      $resanz=mysql_query($qryanz) or die("Error using mysql_query($sql): ".mysql_error()." query:".$qryanz);
      $linanz = mysql_fetch_array($resanz);
      if ($pararray['markfield2']<>"") {
        $markfield=$pararray['markfield2'];	
      } else {
        $markfield=$pararray['markfield'];	
      }
      //echo $linanz[$pararray['markfield']].",".$pararray['markseldb']."=mark<br>";     	
    	if ($linanz[$markfield]==$pararray['markseldb']) {
        $query="UPDATE ".$pararray['dbtable']." SET ".$markfield."='".$pararray['markselno']."' WHERE ".$pararray['fldindex']."=".$idwert;
    	} else {
        $query="UPDATE ".$pararray['dbtable']." SET ".$markfield."='".$pararray['markseldb']."' WHERE ".$pararray['fldindex']."=".$idwert;
      }  
    } else {	
      $query="UPDATE ".$pararray['dbtable']." SET ".$pararray['markfield']."='".$pararray['markseldb']."' WHERE ".$pararray['fldindex']."=".$idwert;
    }  
  } else {
    $query="UPDATE ".$pararray['dbtable']." SET ".$pararray['markfield']."='OK' WHERE ".$pararray['fldindex']."=".$idwert;
  }
}    
echo $query."<br>";
if ($query<>"") {
  mysql_query($query) or die("Error using mysql_query($sql): ".mysql_error()." query:".$query);
  mysql_close();
}  
$include="showtab.php?menu=".$menu;
echo "<a class='btn btn-primary' href='showtab.php?menu=".$menu."&idwert=".$idwert."'>zurueck</a><br>";
if ($autoreturn=="J") {
  echo "<meta http-equiv='refresh' content='0; URL=showtab.php?menu=".$menu."&idwert=".$idwert."'>";
}    
?>