<?php
session_start();
include("../config.php");
$dbselarr = $_SESSION['DBSELARR'];
$count=sizeof($dbselarr);

$query="SELECT * FROM tblarrange WHERE fldindex=".$dbselarr[0];
$result = mysql_query($query) or die(mysql_error());
$line = mysql_fetch_array($result);
$qrymusic="SELECT * FROM tblmusic_liste WHERE fldindex=".$line['fldid_music'];
$resmusic = mysql_query($qrymusic) or die(mysql_error());
$linmusic = mysql_fetch_array($resmusic);
echo "<h3>".$linmusic['fldnr']." ".$linmusic['fldbez']."</h3>";
$arrstimmen = array();
$arrid = array();
$qrystimmen="SELECT * FROM tblstimmen";
$resstimmen=mysql_query($qrystimmen) or die(mysql_error());
while ($linstimmen = mysql_fetch_array($resstimmen)) {
  $arrstimmen[]=$linstimmen['fldbez'];
  $arrid[]=$linstimmen['fldindex'];	 
}
$arrzlbez = array();
$arrzlid = array();
$qryzl="SELECT * FROM tblarrzl";
$reszl=mysql_query($qryzl) or die(mysql_error());
while ($linzl = mysql_fetch_array($reszl)) {
  $arrzlbez[]=$linzl['fldbez'];
  $arrzlid[]=$linzl['fldindex'];	 
}
echo "<table border=1>";
echo "<tr>";
echo "<td>Zeile</td>";
$nAnz=count($arrstimmen);
for ( $i = 0; $i < $nAnz; $i++ ) {
  echo "<td>".$arrstimmen[$i]."</td>";
}  
echo "</tr>";  
$indzl=0;
$zlfirst='true';
for ( $x = 0; $x < $count; $x++ ) {
//while ($line = mysql_fetch_array($result)) {
  $query="SELECT * FROM tblarrange WHERE fldindex=".$dbselarr[$x]." ORDER BY fldnr";
  $result = mysql_query($query) or die(mysql_error());
  $line = mysql_fetch_array($result);
  $zlclose='false';
//echo $zlfirst.",".$line['fldid_arrzl'].",".$arrzlid[$indzl]."<br>";
  if ($zlfirst=='true') {
  	 //$zlclose='true';
  	 $zlfirst='false'; 	 
    echo "<tr>";
    echo "<td>".$arrzlbez[$indzl]."</td>";
  }  
  if ($line['fldid_arrzl']<>$arrzlid[$indzl]) {
  	 $zlclose='true'; 	 
    echo "</tr>";
    echo "<tr>";
    $indzl=$indzl+1;
    while ($line['fldid_arrzl']<>$arrzlid[$indzl]) {
    	$indzl=$indzl+1;
    }
//    $qryzl="SELECT * FROM tblarrzl WHERE fldindex=".$line['fldid_arrzl'];
//    $reszl=mysql_query($qryzl) or die(mysql_error());
//    $linzl = mysql_fetch_array($reszl);
    echo "<td>".$arrzlbez[$indzl]."</td>";
//    echo "<td>".$linzl['fldbez']."</td>";
  } else {
//  	 echo "<td>".$arrzlbez[$indzl]."</td>";
  } 
  for ( $i = 0; $i < $nAnz; $i++ ) {
  	 $qryinstr="SELECT * FROM tblinstrument WHERE fldindex=".$line['fldid_instrument'];
    $resinstr=mysql_query($qryinstr) or die(mysql_error());
    $lininstr = mysql_fetch_array($resinstr);
    if ($arrid[$i]==$line['fldid_stimmen']) {
    	if ($lininstr['fldfarbe']<>'') {
        echo "<td style='background-color:".$lininstr['fldfarbe'].";'>".$lininstr['fldbez']."</td>";
      } else {
        echo "<td>".$lininstr['fldbez']."</td>";
      }  
    } else {
//      echo "<td> </td>";
    }  
  }  
  if ($zlclose=='true') {
//    echo "</tr>";
  }    
}
echo "</tr>";
echo "</table>";
?>