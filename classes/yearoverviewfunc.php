<?php

function gettermin($datum) {
  $image="";
  $qryter="SELECT * FROM tbltermine_liste WHERE fldvondatum='".$datum."'";
  //echo $qryter."<br>";
  $rester = mysql_query($qryter) or die(mysql_error()." ".$qryter);
  while ($linter = mysql_fetch_array($rester)) {
    $qryser="SELECT * FROM tbltermine_serie WHERE fldindex=".$linter['fldid_terminserie'];
    $resser = mysql_query($qryser) or die(mysql_error()." ".$qryser);
    $linser = mysql_fetch_array($resser);
  	 //echo $linser['fldimagepfad']."=imagepfad<br>";
  	 if ($linser['fldsel']=="J") {
  	 	if ($linter['fldkurz']<>"") {
        $image=$image."<img src='".$linser['fldimagepfad']."' alt='bild'>".$linter['fldkurz'];
  	 	} else {
        $image=$image."<img src='".$linser['fldimagepfad']."' alt='bild'>".$linter['fldbez'];
      }  
    }  
  }  
  return $image;
}

function getcolor($wochentag) {
  $color="";
  if ($wochentag=="So") {
//    $color="color:#FFFF00;";
    $color="background-color:#006666; color:#FFFF00;";
  }
  return $color;
}

function getbgcolor($wochentag) {
  $bgcolor="";
  if ($wochentag=="SO") {
  	 $bgcolor="class='tabsonntagsansicht'"; 
  }
  return $bgcolor;
}

function getwochentag($test_datum,$wochentage) {
  list ($jahr, $monat, $tag) = split ('[-]', $test_datum) ;
  $datum = getdate(mktime ( 0,0,0, $monat, $tag, $jahr));
  $wochentag = $datum['wday'];
  return $wochentage[$wochentag];  
}

function getdatum($jahr,$monat,$tag) {
  if ($tag<9) {
    $tag="0".$tag;
  }
  return $jahr.'-'.$monat.'-'.$tag;
}

function showday($wochentag,$image,$i,$color) {
  if ($wochentag=="So") {
    $color="background-color:#000066; color:#FFFF00;";
    echo "<td style='font-size:8px; ".$color."' height='8'>";
    echo "<canvas id='myCanvas' width='80' height='16'></canvas>";
    echo "<script>";
    echo "var canvas = document.getElementById('myCanvas');";
    echo "var context = canvas.getContext('2d');";

    echo "context.beginPath();";
    echo "context.rect(0, 4, 24, 30);";
    echo "context.fillStyle = 'blue';";
    echo "context.fill();";
    echo "context.fillStyle = 'white';";
    echo "context.font = '8px sans-serif';";
    echo "context.fillText('So 31',0,14);";
    echo "</script>";
    echo "</td>";
  } else {
    echo "<td style='font-size:8px; ".$color."' height='8'>".$wochentag." ".$i." ".$image."</td>";
  }
}

function yearoverview() {
echo "<table class='table table-bordered' border=1>";
echo "<tr>";
echo "<th width='60' height='8'>Jan</th>";
echo "<th width='60' height='8'>Feb</th>";
echo "<th width='60' height='8'>M&aumlr</th>";
echo "<th width='60' height='8'>Apr</th>";
echo "<th width='60' height='8'>Mai</th>";
echo "<th width='60' height='8'>Jun</th>";
echo "<th width='60' height='8'>Jul</th>";
echo "<th width='60' height='8'>Aug</th>";
echo "<th width='60' height='8'>Sep</th>";
echo "<th width='60' height='8'>Okt</th>";
echo "<th width='60' height='8'>Nov</th>";
echo "<th width='60' height='8'>Dez</th>";
echo "</tr>";

$wochentage = array ('So','Mo','Di','Mi','Do','Fr','Sa');
$jahr="2014";
for ($i = 1; $i <= 31; $i++) {
  echo "<tr>";
  $tag=$i;
  $test_datum = getdatum($jahr,'01',$tag);
  $wochentag = getwochentag($test_datum,$wochentage); 
  $color=getcolor($wochentag);
  $bgcolor=getbgcolor($wochentag);
  $image=gettermin($test_datum);
//  showday($wochentag,$image,$i,$color);
  if ($bgcolor<>"") {
    echo "<td ".$bgcolor." height='8'>".$wochentag." ".$i." ".$image."</td>";
  } else {
    echo "<td ".$bgcolor." style='font-size:8px; ".$color."' height='8'>".$wochentag." ".$i." ".$image."</td>";
  }  

  if ($i>28) {
    echo "<td style='font-size:10px;' height='8'> </td>";
  } else {
    $test_datum = getdatum($jahr,'02',$tag);
    $wochentag = getwochentag($test_datum,$wochentage); 
    $color=getcolor($wochentag);
    $image=gettermin($test_datum);
    echo "<td style='font-size:8px; ".$color."' height='8'>".$wochentag." ".$i." ".$image."</td>";
  }	
  $test_datum = getdatum($jahr,'03',$tag);
  $wochentag = getwochentag($test_datum,$wochentage); 
  $color=getcolor($wochentag);
  $image=gettermin($test_datum);
  echo "<td style='font-size:8px; ".$color."' height='8'>".$wochentag." ".$i." ".$image."</td>";
  if ($i>30) {
    echo "<td style='font-size:8px;' height='8'> </td>";
  } else {
    $test_datum = getdatum($jahr,'04',$tag);
    $wochentag = getwochentag($test_datum,$wochentage); 
    $color=getcolor($wochentag);
    $image=gettermin($test_datum);
    echo "<td style='font-size:8px; ".$color."' height='8'>".$wochentag." ".$i." ".$image."</td>";
  }	
  $test_datum = getdatum($jahr,'05',$tag);
  $wochentag = getwochentag($test_datum,$wochentage); 
  $color=getcolor($wochentag);
  $image=gettermin($test_datum);
  echo "<td style='font-size:8px; ".$color."' height='8'>".$wochentag." ".$i." ".$image."</td>";
  if ($i>30) {
    echo "<td style='font-size:8px;' height='8'> </td>";
  } else {
    $test_datum = getdatum($jahr,'06',$tag);
    $wochentag = getwochentag($test_datum,$wochentage); 
    $color=getcolor($wochentag);
    $image=gettermin($test_datum);
    echo "<td style='font-size:8px; ".$color."' height='8'>".$wochentag." ".$i." ".$image."</td>";
  }
  $test_datum = getdatum($jahr,'07',$tag);
  $wochentag = getwochentag($test_datum,$wochentage); 
  $color=getcolor($wochentag);
  $image=gettermin($test_datum);
  echo "<td style='font-size:8px; ".$color."' height='8'>".$wochentag." ".$i." ".$image."</td>";
  $test_datum = getdatum($jahr,'08',$tag);
  $wochentag = getwochentag($test_datum,$wochentage); 
  $color=getcolor($wochentag);
  $image=gettermin($test_datum);
  echo "<td style='font-size:8px; ".$color."' height='8'>".$wochentag." ".$i." ".$image."</td>";
  if ($i>30) {
    echo "<td style='font-size:8px;' height='8'> </td>";
  } else {
    $test_datum = getdatum($jahr,'09',$tag);
    $wochentag = getwochentag($test_datum,$wochentage); 
    $color=getcolor($wochentag);
    $image=gettermin($test_datum);
    echo "<td style='font-size:8px; ".$color."' height='8'>".$wochentag." ".$i." ".$image."</td>";
  }	
  $test_datum = getdatum($jahr,'10',$tag);
  $wochentag = getwochentag($test_datum,$wochentage); 
  $color=getcolor($wochentag);
  $image=gettermin($test_datum);
  echo "<td style='font-size:8px; ".$color."' height='8'>".$wochentag." ".$i." ".$image."</td>";
  if ($i>30) {
    echo "<td style='font-size:10px;' height='8'> </td>";
  } else {
    $test_datum = getdatum($jahr,'11',$tag);
    $wochentag = getwochentag($test_datum,$wochentage); 
    $color=getcolor($wochentag);
    $image=gettermin($test_datum);
    echo "<td style='font-size:8px; ".$color."' height='8'>".$wochentag." ".$i." ".$image."</td>";
  }	
  $test_datum = getdatum($jahr,'12',$tag);
  $wochentag = getwochentag($test_datum,$wochentage); 
  $color=getcolor($wochentag);
  $image=gettermin($test_datum);
  echo "<td style='font-size:8px; ".$color."' height='8'>".$wochentag." ".$i." ".$image."</td>";
  echo "</tr>";
}  

echo "</table>";
}

?>