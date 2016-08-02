<?php

function getparam() {
  echo "<form name='eingabe' class='form-horizontal' method='post' action='autoincupdate.php?parupdate=1' '>";
  echo "  <label class='control-label' style='text-align:left' >table</label>";
  echo "  <div class='input'>";
  echo "    <input type='text' name='table' value=''>";
  echo "  </div>";
  echo "  <label class='control-label' style='text-align:left' >fldindex</label>";
  echo "  <div class='input'>";
  echo "    <input type='text' name='fldindex' value=''>";
  echo "  </div>";
  echo "  <label class='control-label' style='text-align:left' >auto-inc</label>";
  echo "  <div class='input'>";
  echo "    <input type='text' name='autoinc' value=''>";
  echo "  </div>";
  echo "  <label class='control-label' style='text-align:left' >auto-step</label>";
  echo "  <div class='input'>";
  echo "    <input type='text' name='autostep' value='100'>";
  echo "  </div>";
  echo "  <div class='form-actions'>";
  echo "     <button type='submit' name='submit' class='btn btn-primary'>Starten</button>";
  echo "     <button class='btn'>Abbruch</button>";
  echo "  </div>";
  echo "</form>";	
}

function autoincupdate() {
  $table=$_POST['table'];
  $fldindex=$_POST['fldindex'];
  $autoinc=$_POST['autoinc'];
  $autostep=$_POST['autostep'];
  $maxsql="SELECT max(".$fldindex.") as fldmax FROM ".$table;
  $maxres = mysql_query($maxsql) or die(mysql_error());
  $maxlin = mysql_fetch_array($maxres);
  $fldmax=$maxlin['fldmax']+1;
  //echo $table.",".$fldindex.",".$autoinc.",".$autostep.",".$maxsql."<br>";
  //echo $fldmax."=max<br>";
  $sql="SELECT ".$fldindex." FROM ".$table;
  $res = mysql_query($sql) or die(mysql_error());
  $ind=1;
  echo "<div class='alert alert-success'>";
  while ($lin = mysql_fetch_array($res)) {
  	 $idx=$ind*$autostep+$autoinc;
  	 $ind=$ind+1;
  	 $upd="UPDATE ".$table." SET ".$fldindex."=".$idx." WHERE ".$fldindex."=".$lin[$fldindex];
    $resupd = mysql_query($upd) or die(mysql_error());
  	 echo $upd."<br>";
  }
  echo "</div>";
}

?>