<?php
header("content-type: text/html; charset=utf-8");

function updateauswahl() {
  echo "<form class='form-horizontal' method='post' action='updateerzeugen.php?update=1'>";
  echo "<fieldset>";
  echo "<div class='control-group'>";

  //echo "Verzeichnis: <input type='text' name='verz' value=''><br>";
  echo "<input type='checkbox' name='updateverz' value='1'> update verzeichnis <br>";

  echo "Version: ";
  echo "<select name='updateversion'>";

  $query = "SELECT * FROM tblversion";
  $result = mysql_query($query) or die(mysql_error());
  $cnt=0;
  while ($line = mysql_fetch_array($result)) { 
    $cnt=$cnt+1;
    echo "<option value='".$line[fldindex]."'>".$line['fldbez']."</option>";
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

function sqlinserterzeugen($datei,$dbtable,$query,$firstfield) {
  include("../config.php");
  $result = mysql_query($query) or die(mysql_error()." ".$query);
  $resfld = mysql_list_fields ( $gdbname, $dbtable, $gdbcon );
  $menge = mysql_num_fields ( $resfld );
  $fldname="";
  $fldarr=array();
  $startx=1;
  if ($firstfield=="JA") {
  	 $startx=0;
  }
  for ( $x = $startx; $x < $menge-1; $x++ )
  {
    $mysqlname = mysql_field_name ( $resfld, $x );
    $fldname = $fldname . $mysqlname .",";
    $arrmeng=array_push($fldarr,$mysqlname);
  }  
  $mysqlname = mysql_field_name ( $resfld, $menge-1 );
  $fldname = $fldname . $mysqlname;
  $arrmeng=array_push($fldarr,$mysqlname);
  if ($vers<>"") {
    $qryfld="REPLACE INTO ".$dbtable." (".$fldname.") VALUES (";
  } else {
    $qryfld="INSERT INTO ".$dbtable." (".$fldname.") VALUES (";
  }
  
  $count=0;
  $fldwert="";
  while ($line = mysql_fetch_array($result)) {
  	 $count=$count+1;
    for ( $x = $startx; $x < $menge-1; $x++ ) {
  	   $fldwert=$fldwert."'".$line[$fldarr[$x-$startx]]."',";
  	 }  
	 $fldwert=$fldwert."'".$line[$fldarr[$menge-1-$startx]]."');";
	 $qryins=$qryfld.$fldwert;
    fwrite($datei, $qryins."\n");
	 $fldwert="";
  }  
  echo "<div class='alert alert-success'>";
  echo $count." Datens&aumltze erzeugen f&uumlr ".$dbtable.".";
  echo "</div>";
}

function updateinserterzeugen($vers) {
  include("../config.php");

  $today = date('Y-m-d-H-i-s');
  $tmpfile = "../installation/update-".$today.".tmp";
//  echo $tmpfile."#<br>";
  $datei = fopen($tmpfile,"w");

  $dbtable="tblmenu_modul";
  if ($vers<>"") {
    $query="SELECT * FROM ".$dbtable." WHERE fldversion='".$vers."'";
  } else {
    $query="SELECT * FROM ".$dbtable;
  }  
  sqlinserterzeugen($datei,$dbtable,$query,"JA");

  fwrite($datei, "\n");
  $dbtable="tblmenu_liste";
  if ($vers<>"") {
    $query="SELECT * FROM ".$dbtable." WHERE fldversion='".$vers."'";
  } else {
    $query="SELECT * FROM ".$dbtable." WHERE fldid_publictyp=3 OR fldid_publictyp=0";
  }  
  sqlinserterzeugen($datei,$dbtable,$query,"JA");

  fwrite($datei, "\n");
  $dbtable="tblfunc";
  if ($vers<>"") {
    $query="SELECT * FROM ".$dbtable." WHERE fldversion='".$vers."'";
  } else {
    $query="SELECT * FROM ".$dbtable;
  }  
  sqlinserterzeugen($datei,$dbtable,$query,"");

  fwrite($datei, "\n");
  $dbtable="tblversion";
  if ($vers<>"") {
    $query="SELECT * FROM ".$dbtable." WHERE fldversion='".$vers."'";
  } else {
    $query="SELECT * FROM ".$dbtable;
  }  
  sqlinserterzeugen($datei,$dbtable,$query,"");

  fclose($datei);  
  $intvers=intval($vers);
//  $sqlfile = "../../joorgportal".$intvers."update/installation/update-".$today.".sql";
  $sqlfile = "../installation/update-".$today.".sql";
  rename($tmpfile,$sqlfile);
  echo "<div class='alert alert-info'>";
  echo "Update-Datei erzeugen in ".$sqlfile;
  echo "</div>";

}

function updateverzkomplett($verz,$nchvers) {
  $ordner="/var/www/wp/joorgportal".$verz;
  $newdir="/var/www/wp/joorgportal".$nchvers.$verz;
}

function updateverzabgleich($verz,$vonvers,$nchvers) {
  $ordner="/var/www/wp/joorgportal30".$verz;
  $verglordner="/var/www/wp/joorgportal".$vonvers.$verz;
  $newdir="/var/www/wp/joorgportal".$nchvers."update".$verz;
  $handle=opendir ($ordner);

  while ($datei = readdir ($handle)) {
    if (is_dir($ordner."/".$datei)) {
      if ((strcmp ( $datei, "." )==0) || (strcmp ( $datei, ".." )==0) || (strcmp($verz."/".$datei,"/sites/export")==0) || (strcmp($verz."/".$datei,"/sites/import")==0) || (strcmp($verz."/".$datei,"/includes/temp")==0) ) {
      } else {   
        updateverzabgleich($verz."/".$datei,$vonvers,$nchvers);
      }  
    } else { 	
      if ( (strcmp ( $datei, "." )==0) || (strcmp ( $datei, ".." )==0) || (strcmp(substr($datei,-1),"~")==0) || (strcmp(substr($datei,1),".")==0) || (strcmp($datei,"config.php")==0) ) {
      } else {    
        $ausgabe="$verz/$datei";
        if (file_exists($verglordner."/".$datei)) {
     	    $lcopy=false;
     	    $zeit = filemtime ( $ordner."/".$datei );
     	    $zeitstr = gmdate ( 'Y-m-d H:i:s', $zeit );
          $ausgabe=$ausgabe." " . gmdate ( 'd M Y H:i:s', $zeit );
     	    $verglzeit = filemtime ( $verglordner."/".$datei );
     	    $verglzeitstr = gmdate ( 'Y-m-d H:i:s', $verglzeit );
          $ausgabe=$ausgabe." | " . gmdate ( 'd M Y H:i:s', $verglzeit );
          if ($zeitstr>$verglzeitstr) {
     	      echo "$ausgabe <br>";
            $lcopy=true;
      	 }  
        } else {	
     	    $ausgabe=$ausgabe." neu";
          echo "$ausgabe <br>";
          $lcopy=true;
        }  
     if ($lcopy) {     
       if (!is_dir($newdir."/")) {
         if (!mkdir($newdir."/", 0777, true)) {
           echo 'Erstellung der Verzeichnisse schlug fehl...:<br>'; 
         }
       }  
       if ( @ copy ($ordner."/".$datei, $newdir."/".$datei ) ) {
       	echo "copy erfolgreich.<br>"; 
       } else {
       	echo $ordner."/".$datei."<br>";
       	echo $newdir."/".$datei."<br>";
       	echo "copy-ERROR.<br>"; 
       }	  
     }	
      }
    }  
  }
  closedir($handle);  	

}


function updateverzvergleich($verz,$vonvers,$nchvers) {
$ordner="/var/www/wp/joorgportal".$nchvers.$verz;
$verglordner="/var/www/wp/joorgportal".$vonvers.$verz;
$newdir="/var/www/wp/joorgportal".$nchvers."update".$verz;
//echo $ordner."=ordner<br>";
//echo $verglordner."=vonvers<br>";
//echo $newdir."=nchvers<br>";
$handle=opendir ($ordner);

while ($datei = readdir ($handle)) {

 if (is_dir($ordner."/".$datei)) {
   if ((strcmp ( $datei, "." )==0) || (strcmp ( $datei, ".." )==0) || (strcmp($verz."/".$datei,"/sites/export")==0) || (strcmp($verz."/".$datei,"/sites/import")==0) || (strcmp($verz."/".$datei,"/includes/temp")==0) ) {
   } else {   
     updateverzvergleich($verz."/".$datei,$vonvers,$nchvers);
   }  
 } else { 	
   if ( (strcmp ( $datei, "." )==0) || (strcmp ( $datei, ".." )==0) || (strcmp(substr($datei,-1),"~")==0) || (strcmp(substr($datei,1),".")==0) || (strcmp($datei,"config.php")==0) ) {
   } else {    
     $ausgabe="$verz/$datei";
     if (file_exists($verglordner."/".$datei)) {
     	 $lcopy=false;
     	 $zeit = filemtime ( $ordner."/".$datei );
     	 $zeitstr = gmdate ( 'Y-m-d H:i:s', $zeit );
       $ausgabe=$ausgabe." " . gmdate ( 'd M Y H:i:s', $zeit );
     	 $verglzeit = filemtime ( $verglordner."/".$datei );
     	 $verglzeitstr = gmdate ( 'Y-m-d H:i:s', $verglzeit );
       $ausgabe=$ausgabe." | " . gmdate ( 'd M Y H:i:s', $verglzeit );
       if ($zeitstr>$verglzeitstr) {
     	   echo "$ausgabe ";
         //echo $newdir."/".$datei."<br>";
         $lcopy=true;
     	 }  
     } else {	
     	 $ausgabe=$ausgabe." neu";
       echo "$ausgabe ";
       $lcopy=true;
     }  
     if ($lcopy) {     
       if (!is_dir($newdir."/")) {
         if (!mkdir($newdir."/", 0777, true)) {
           echo 'Erstellung der Verzeichnisse schlug fehl...:<br>'; 
         }
       }  
       if ( @ copy ($ordner."/".$datei, $newdir."/".$datei ) ) {
       	echo "copy erfolgreich.<br>"; 
       } else {
       	echo $ordner."/".$datei."<br>";
       	echo $newdir."/".$datei."<br>";
       	echo "copy-ERROR.<br>"; 
       }	  
     }	
   }
 }  

}

closedir($handle);  	
}

?>