<?php
header("content-type: text/html; charset=utf-8");
function importdelete() {
  $query = "DELETE FROM tblktosal WHERE fldArt='I'";
  $result = mysql_query($query) or die(mysql_error());
  echo "Import gelöscht.<br>";
}

function importabfrage($menu,$importpfad,$menuid) {
  echo "<form method='post' action='import.php?import=1&menu=".$menu."&menuid=".$menuid."'>";

  $datum="";
  echo "<div>";
  echo "Datum: ";
?>
        <input type="Text" id="datum" name="datum" value="<?php echo $datum; ?>"/>
        <img src="images2/cal.gif" onclick="javascript:NewCssCal('datum','yyyyMMdd','ARROW')" style="cursor:pointer"/>
<?php 
  echo "</div>";
  echo "<div>";
  echo "Jahr: ";
  $jahr=date("Y");
  echo "<input type='Text' name='jahr' value='".$jahr."'/>";
  echo "</div>";
  echo "<div>";
  echo "CSV-Konto: ";
  echo "<input type='Text' name='csvkto' value=''/>";
  echo "</div>";

$pfad = $importpfad;
echo "Pfad:".$pfad."<br>";
$verz = dir ( $pfad );

//echo 'Handle: ' . $verz->handle . '<br>';
//echo 'Pfad: ' . $verz->path . '<br>';

        echo "<select name='monat' size='1'>";
        echo "<option style='background-color:#c0c0c0;' value='1' >Januar</option>";
        echo "<option style='background-color:#c0c0c0;' value='2' >Februar</option>";
        echo "<option style='background-color:#c0c0c0;' value='3' >März</option>";
        echo "<option style='background-color:#c0c0c0;' value='4' >April</option>";
        echo "<option style='background-color:#c0c0c0;' value='5' >Mai</option>";
        echo "<option style='background-color:#c0c0c0;' value='6' >Juni</option>";
        echo "<option style='background-color:#c0c0c0;' value='7' >Juli</option>";
        echo "<option style='background-color:#c0c0c0;' value='8' >August</option>";
        echo "<option style='background-color:#c0c0c0;' value='9' >September</option>";
        echo "<option style='background-color:#c0c0c0;' value='10' >Oktober</option>";
        echo "<option style='background-color:#c0c0c0;' value='11' >November</option>";
        echo "<option style='background-color:#c0c0c0;' value='12' >Dezember</option>";
        echo "</select>";

        $fquery = "SELECT * FROM tblktotyp";
        $fresult = mysql_query($fquery) or die(mysql_error());
        echo "<select name='ktotyp' size='1'>";
        while ($fline = mysql_fetch_array($fresult)) {
          $strindex = $fline[fldIndex];
          $strbez = $fline[fldBez];
          echo "<option style='background-color:#c0c0c0;' value=".$strindex." >".$strbez."</option>";
        }
        echo "</select>";


        $fquery = "SELECT * FROM tblktobanken";
        $fresult = mysql_query($fquery) or die(mysql_error());
        echo "<select name='konto' size='1'>";
        while ($fline = mysql_fetch_array($fresult)) {
          $strindex = $fline[fldIndex];
          $strbez = $fline[fldBez];
          if ($strbez=="Bank_Horst") {
            echo "<option style='background-color:#c0c0c0;' value=".$strindex." selected>".$strbez."</option>";
          } else {
            echo "<option style='background-color:#c0c0c0;' value=".$strindex." >".$strbez."</option>";
          }  
        }
        echo "</select>";

echo " <input type='checkbox' name='zeroignore' value='1'> Nullwerte ignorieren.<br>";
echo "<table class='table table-hover'>";
echo "<thead>";
echo "<th width='5'><input type='checkbox' name='cbuttonAll' value='1'></th>";
echo "<th>Datei</th>";
echo "</thead>";  
$count = 0;
while ( $entry = $verz->read () )
{
  if (($entry!=".") AND ($entry!="..")) {
    $count = $count + 1; 
    echo "<tr>";
    echo "<input type='hidden' name='idwert".$count."' value=".$entry.">";
    echo "<td width='5'><input type='checkbox' name='cbutton".$count."' value='1'></td>";
    echo "<td>".$entry ."</td>";
    echo "</tr>";
  }  
}
echo "<input type='hidden' name='count' value=".$count."/>";
echo "</table>";
$verz->close ();

  echo "  <div class='form-actions'>";
  echo "     <button type='submit' name='submit' class='btn btn-primary'> Import </button>";
  echo "     <button class='btn'>Abbruch</button>";
  echo "  </div>";
  echo "</form>";
}

function importfilename($menu) {
  echo "<form method='post' action='import.php?import=1&menu=".$menu."'>";
  echo "Dateiname: <input type='file' name='datei'><br>";
  echo "<input type='submit' name='button' value=' Import '>";
  echo "</form>";
}

function importxmlfile($importarray,$datei,$importpfad,$konto,$monat) {
  echo "xml-import<br>";
  $xml_datei=$importpfad.$datei;
  echo $xml_datei."=datei<br>";
  $lines = file( $xml_datei);
  $ort="";
  $sqlupd="UPDATE tblEinkauf_liste SET ";
  $sqlins="INSERT INTO tblEinkauf_liste (fldOrt,fldBez,fldAnz,fldPreis) VALUES(";
  $ins="J";
  foreach ($lines as $line_num => $textline) {
    //$ausgabe=str_replace(array("<",">"),array("#","#"),$textline);
    echo $textline."=textline<br>";
    $intpos=strpos($textline,"<Listenname>");
    if ($intpos>0) {
    	if ($ort<>"") {
        $sqlupd="UPDATE tblEinkauf_liste SET ";
        $sqlins="INSERT INTO tblEinkauf_liste (fldOrt,fldBez,fldAnz,fldPreis) VALUES(";
    	}	
      $ort=str_replace(array("<Listenname>","</Listenname>"),array("",""),$textline);
      $ort=trim($ort);
      $sqlupd=$sqlupd."fldOrt='".$ort."'";
      $sqlins=$sqlins."'".$ort."'";
    }
    $intpos=strpos($textline,"<name>");
    if ($intpos>0) {
      $name=str_replace(array("<name>","</name>"),array("",""),$textline);
      $name=trim($name);
      $sqlupd=$sqlupd.",fldBez='".$name."'";
      $sqlins=$sqlins.",'INS:".$name."'";
    }
    $intpos=strpos($textline,"<anzahl>");
    if ($intpos>0) {
      $name=str_replace(array("<anzahl>","</anzahl>"),array("",""),$textline);
      $name=trim($name);
      $sqlupd=$sqlupd.",fldAnz='".$name."'";
      $sqlins=$sqlins.",'".$name."'";
    }
    $intpos=strpos($textline,"<preis>");
    if ($intpos>0) {
      $name=str_replace(array("<preis>","</preis>"),array("",""),$textline);
      $name=trim($name);
      $sqlupd=$sqlupd.",fldPreis='".$name."'";
      $sqlins=$sqlins.",'".$name."'";
    }
    $intpos=strpos($textline,"<notiz>id:");
    if ($intpos>0) {
      $name=str_replace(array("<notiz>id:","</notiz>"),array("",""),$textline);
      $name=trim($name);
      $sqlupd=$sqlupd." WHERE fldIndex=".$name;
      $ins="N";
    }
    $intpos=strpos($textline,"</Element>");
    if ($intpos>0) {
    	if ($ins=="N") {
    	  $sqlqry=$sqlupd;	
    	} else {	
    	  $sqlqry=$sqlins.")";
    	}
      $ins="J";
      echo $sqlqry."<br>";
      $result = mysql_query($sqlqry) or die(mysql_error());
      $sqlupd="UPDATE tblEinkauf_liste SET ";
      $sqlins="INSERT INTO tblEinkauf_liste (fldOrt,fldBez,fldAnz,fldPreis) VALUES(";
    	if ($ort<>"") {
        $sqlupd=$sqlupd."fldOrt='".$ort."'";
        $sqlins=$sqlins."'".$ort."'";
    	}
    }
  }
  echo $sqlins."=ins<br>";     
   
}

function importcsvfile($importarray,$datei,$importpfad,$konto,$monat,$jahr,$csvkto) {
  $pfad = $importpfad;
  $lines = file( $pfad.$datei);
  $count=0;
  $startline=0;
  $datum=$_POST['datum'];
  if ($datum<>"") {
    $query="DELETE FROM tblktosal WHERE fldDatum>='".$datum."' AND fldInhaber='".$konto."' AND fldtyp='CSVIMPORT'";
  } else {
    $query="DELETE FROM tblktosal WHERE month(fldDatum)=".$monat." AND year(fldDatum)=".$jahr." AND fldInhaber='".$konto."' AND fldtyp='CSVIMPORT'";
  }  
  //echo $query."=del<br>";
  $result = mysql_query($query) or die(mysql_error());
  foreach ($lines as $line_num => $textline) {
    $sql="INSERT INTO tblktosal (fldDatum,fldUhrzeit,fldBetrag,fldKonto,fldBez,fldInhaber,fldtyp) VALUES(";
    $count=$count+1;
    $textline=trim($textline);
    //var_dump($textline);
    if ($count==1) {
      $textline=substr($textline,3,strlen($textline)-1);
    } else {
      $textline=substr($textline,0,strlen($textline)-1);
    }  
    echo $textline."=line<br>";
    $teilstr=$textline;    
    $pos=strpos($teilstr,";");
    $teilcnt=1;
    $kto="";
    while ($pos>0) {
    	$getstr=substr($teilstr,0,$pos);
    	$teilstr=substr($teilstr,$pos+1);
    	//if (trim($teilstr)<>"") {
    	  //echo ">".$getstr."=getstr<br>";
    	  //echo ">".$teilstr."=teilstr<br>";
    	  switch ($teilcnt) {
          case 1:
            $sql=$sql."date('".$getstr."'),";
          break;     	
          case 2:
            $sql=$sql."'".$getstr."',";
          break;
          case 3:
            $kto=$getstr;
            echo $kto."=kto<br>";
          break;     	
          case 4:
            $sql=$sql."'".$getstr."',";
          break;     	
          case 8:
            $qrykto="SELECT * FROM tblktokonten WHERE fldBez LIKE '%".$getstr."%'";
            $reskto = mysql_query($qrykto) or die(mysql_error());
            if ($linkto = mysql_fetch_array($reskto)) {
              $sql=$sql."'".$linkto['fldKurz']."',";
            } else {
              $sql=$sql."'UMBUCH',";
            }
          break;
          case 10:
            $sql=$sql."'".$getstr."',";
          break;     	
    	  }
    	//}  
      $pos=strpos($teilstr,";");
      $teilcnt=$teilcnt+1;
    }
    if ($kto==$csvkto) {
      $sql=$sql."'".$konto."',";
      $sql=$sql."'CSVIMPORT');";
      echo $sql."=sql<br>";
      $result = mysql_query($sql) or die(mysql_error());
    }  
  }
  echo "<div class='alert alert-success'>";
  echo $count." Daten werden importiert.";
  echo "</div>";
}


function importsqlfile($importarray,$datei,$importpfad) {
  $pfad = $importpfad;
  $lines = file( $pfad.$datei);
  $count=0;
  $startline=0;
  foreach ($lines as $line_num => $textline) {
    $count=$count+1;
    $result = mysql_query($textline) or die(mysql_error());
  }
  echo "<div class='alert alert-success'>";
  echo $count." Daten werden importiert.";
  echo "</div>";
}

function importkskfile($importarray,$datei,$konto,$headerline,$zeroignore,$importpfad,$monat,$jahr) {
  $pfad = $importpfad;
//  echo $monat."=monat<br>";
//  $pfad = "/var/www/wp/webportal30/sites/import/";
  $query="DELETE FROM tblktosal WHERE month(fldDatum)=".$monat." AND year(fldDatum)=".$jahr." AND fldInhaber='".$konto."' AND fldtyp=''";
  //echo $query."<br>";
  $result = mysql_query($query) or die(mysql_error());
// echo $pfad.$datei."=file<br>";
  $lines = file( $pfad.$datei);
  $count=0;
  $startline=0;
  if ($headerline=="Y") {
    $startline=1;
  }  
  foreach ($lines as $line_num => $textline) {
    $count++;
    if ($count>$startline) {

      $betrag=0;      
      $query="INSERT INTO tblktosal (fldDatum,fldBez,fldBetrag,fldKonto,fldInhaber,fldArt) VALUES (";  
      $array = explode ( ';', $textline );
      for ( $x = 0; $x < count ( $array ); $x++ )
      {

        foreach ( $importarray as $arrelement )
        {
          //echo $arrelement['number'].",".$arrelement['dbfield']."<br>";
          if ($x+1==$arrelement['number']) {
            $wert = $array[$x];
            $wert = ereg_replace ( '"', '', $wert );
            if ($arrelement['dbfield']=="fldDatum") {
              $wert=substr($wert,-4,4)."-".substr($wert,3,2)."-".substr($wert,0,2);
            }
            if ($arrelement['fieldtype']=="both") {
              $wert2 = ereg_replace ( '"', '', $array[$x+1] );
              $wert3 = ereg_replace ( '"', '', $array[$x+4] );
              $wert = $wert . " " . $wert2 ." " . $wert3;
            }	
            if ($arrelement['dbfield']=="fldBez") {
              $ktobez=$wert;
            }
            if ($arrelement['dbfield']=="fldBetrag") {
              $pos = strpos ( $wert , '.');
              if ($pos>0) {
                $wert = substr($wert,0,$pos).substr($wert,$pos+1); 
              }
              $wert = ereg_replace ( ',', '.', $wert );
              $betrag = $wert;
              //echo $pos."#".$wert."#<br>";
              $query=$query.$wert.",";
            } else {
              $query=$query."'".$wert."',";
            }
          }    
        }      
        //echo $x.":".$array[$x].",";
      }    
      $kto="UMBUCH";      
      $fquery = "SELECT * FROM tblktozuord";
      $fresult = mysql_query($fquery) or die(mysql_error());
      while ($fline = mysql_fetch_array($fresult)) {
        //echo $fline['fldSuch'].",".$ktobez."=ktobez<br>";	
        if ( ereg ( $fline['fldSuch'], strtoupper($ktobez) ) )
        {
          $kto=$fline['fldKurz'];
        }
      }
      $query=$query."'".$kto."','".$konto."','I')";
      $writequery=true;
      if ($zeroignore==1) {
        if ($betrag==0) {
          $writequery=false;
        } 
      }
//echo $query."<br>";
      if ($writequery) {
        echo $query."<br>";
        $result = mysql_query($query) or die(mysql_error());
      }  
    }  
  }
}

function importicalfile($datei,$importpfad) {
  $pfad = $importpfad;
  
  $icsFile = file_get_contents($pfad.$datei);

  $icsData = explode("BEGIN:", $icsFile);

  foreach($icsData as $key => $value) {
      $icsDatesMeta[$key] = explode("\n", $value);
  }

  foreach($icsDatesMeta as $key => $value) {
      foreach($value as $subKey => $subValue) {
          if ($subValue != "") {
              if ($key != 0 && $subKey == 0) {
                  $icsDates[$key]["BEGIN"] = $subValue;
              } else {
                  $subValueArr = explode(":", $subValue, 2);
                  $icsDates[$key][$subValueArr[0]] = $subValueArr[1];
              }
          }
      }
  }  

  $nAnz = count($icsDates);
  for ( $ind = 1; $ind <= $nAnz; $ind++ ) {
  	 if (trim($icsDates[$ind]["BEGIN"])=="VEVENT") {
  	 	//echo $icsDates[$ind]["SUMMARY"]."<br>";
  	 	//echo $icsDates[$ind]["DTSTART;VALUE=DATE"]."<br>";
      $bez=$icsDates[$ind]["SUMMARY"];
  	 	$datum=$icsDates[$ind]["DTSTART;VALUE=DATE"];
  	 	$datum=substr($datum,0,4)."-".substr($datum,4,2)."-".substr($datum,6,2);
  	 	if ($datum>"2013-12-31") {
  	 	  $qry="INSERT tbltermine_liste (fldbez,fldkurz,fldvondatum,fldvonuhrzeit,fldbisdatum,fldbisuhrzeit,fldfarbe,fldid_terminegrp,fldid_terminserie) VALUES('".$bez."','".$bez."','".$datum."','00:00:00','".$datum."','00:00:00','',73,0) ";
  	 	  echo $qry."<br>";
        $res = mysql_query($qry) or die(mysql_error());
  	 	}  
  	 } 
  }
  
  
}


function importtxtfile($importarray,$datei,$importpfad,$gdbtyp) {
  $pfad = $importpfad;
  $lines = file( $pfad.$datei);
  $count=0;
  $sqlstruc="INSERT INTO ".$importarray['dbtable']." (";
  $sqlimp="SELECT * FROM tblimport WHERE flddbtable='".$importarray['dbtable']."' ORDER BY fldspalte";
//echo $sqlimp."<br>";
  $fresult = db_query($sqlimp,"",$gdbtyp);
  while ($fline = mysql_fetch_array($fresult)) {
    $sqlstruc=$sqlstruc.$fline['fldfieldname'].",";
  }
  $len=strlen($sqlstruc);
  $sqlstruc=substr($sqlstruc,0,$len-1).") VALUES ("; 
  foreach ($lines as $line_num => $textline) {
    //echo ">".$sql."=sql<br>";
    $count=$count+1;
    $textline=trim($textline);
    //var_dump($textline);
//    $array = explode ( ',', $textline );
    $array = explode ( ';', $textline );
    //echo count($array)."=count<br>";
    $sqlins="";
    for ( $x = 0; $x < count ( $array ); $x++ )
    {
       $sqlimp="SELECT * FROM tblimport WHERE flddbtable='".$importarray['dbtable']."' AND fldspalte=".$x;
       //echo $sqlimp."<br>";
       $fresult = db_query($sqlimp,"",$gdbtyp);
       if ($fline = db_fetch($fresult,$gdbtyp)) {
         if ($fline['fldutf8']=="decode") {
           $sqlins=$sqlins."'".utf8_decode(ltrim($array[$x]))."',";
         } else {
           $sqlins=$sqlins."'".$array[$x]."',";
         }
         //echo $fline['fldfieldname']."=field,".$array[$x]."<br>";
       }
    } 
    $len=strlen($sqlins);
    $sqlins=$sqlstruc.substr($sqlins,0,$len-2)."')"; 
    $resins = db_query($sqlins,"",$gdbtyp);
    echo "<div class='alert alert-success'>";
    echo $sqlins."<br>";
    echo "</div>";
    //echo "------------------------<br>";
  }
  echo "<div class='alert alert-success'>";
  echo $count." Daten werden importiert.";
  echo "</div>";
}

function importsqlite($menu,$konto) {  
  include("../config.php");
  include("../sites/views/wp_".$menu."/showtab.inc.php");
  $fields="";
  foreach ( $listarray as $arrelement ) {
    $weiter=false;
    if ($arrelement['sqliteimport']<>"N") {
      if (($arrelement['type']=='text') OR ($arrelement['type']=='time') OR ($arrelement['type']=='calc') OR ($arrelement['type']=='select') OR ($arrelement['type']=='date') OR ($arrelement['type']=='zahl')) {
        $weiter=true;
      }
    }
    if ($weiter) {
      if ($fields=="") {
        $fields=$arrelement['dbfield'];
      } else {
        $fields=$fields.",".$arrelement['dbfield'];
      }
    } 
  }
  //echo $konto."<br>";
  //$where="fldVondatum>='2015-01-01'";
  if ($konto<>"") {
  	 $where="fldInhaber='".$konto."'";
  } else {
    $where="";
  }  
  if ($where<>"") {
    $sql="SELECT fldindex,".$fields." FROM ".$pararray['dbtable']." WHERE ".$where; 
  } else {
    $sql="SELECT fldindex,".$fields." FROM ".$pararray['dbtable']; 
  }
  echo "<div class='alert alert-success'>";
  echo $sql."<br>";
  echo "</div>";
  $db = new SQLite3('../../../android/own/joorgsqlite/data/joorgsqlite.db');
  $results = $db->query($sql);
  mysql_query("SET NAMES 'utf8'");
  while ($row = $results->fetchArray()) {
    $daten="";
    $upddaten="";
    foreach ( $listarray as $arrelement ) {
      $weiter=false;
      if ($arrelement['sqliteimport']<>"N") {
        if (($arrelement['type']=='text') OR ($arrelement['type']=='time') OR ($arrelement['type']=='calc') OR ($arrelement['type']=='select') OR ($arrelement['type']=='date') OR ($arrelement['type']=='zahl')) {
          $weiter=true;
        }
      }
      if ($weiter) {
        if ($daten=="") {
          $daten="'".$row[$arrelement['dbfield']]."'";
          $upddaten=$arrelement['dbfield']."='".$row[$arrelement['dbfield']]."'";
        } else {
          $daten=$daten.",'".$row[$arrelement['dbfield']]."'";
          $upddaten=$upddaten.",".$arrelement['dbfield']."='".$row[$arrelement['dbfield']]."'";
        }
      } 
    } 
    if ($pararray['getimportwhere']=="true") {
      $qryupd="SELECT * FROM ".$pararray['dbtable']." WHERE fldDatum='".$row['fldDatum']."' AND fldUhrzeit='".$row['fldUhrzeit'].":00' AND fldInhaber='".$row['fldInhaber']."'";
    } else {
      $qryupd="SELECT * FROM ".$pararray['dbtable']." WHERE ".$pararray['fldindex']."=".$row['fldindex'];
    } 
    $resupd = mysql_query($qryupd) or die("Error using mysql_query($qryupd): ".mysql_error());
    if ($linupd = mysql_fetch_array($resupd)) {
      //$sqlins="UPDATE ".$pararray['dbtable']." SET ".$upddaten." WHERE fldDatum='".$row['fldDatum']."' AND fldUhrzeit='".$row['fldUhrzeit'].":00' AND fldInhaber='".$row['fldInhaber']."'";
      $sqlins="UPDATE ".$pararray['dbtable']." SET ".$upddaten." WHERE ".$pararray['fldindex']."=".$row['fldindex'];
    } else {
      $sqlins="INSERT INTO ".$pararray['dbtable']." (".$fields.") VALUES (".$daten.")";
    }
    echo "<div class='alert alert-success'>";
    echo $qryupd."<br>";
    echo $sqlins."<br>";
    echo "</div>";
    mysql_query($sqlins) or die("Error using mysql_query($sqlins): ".mysql_error());
  }
}

function importfunc($importpfad,$menu,$pararray) {
  $zeroignore = $_POST['zeroignore'];
  $count = $_POST['count'];
  $ktotyp = $_POST['ktotyp'];
  $konto = $_POST['konto'];
  $monat = $_POST['monat'];
  $jahr = $_POST['jahr'];
  $csvkto = $_POST['csvkto'];
  $query = "SELECT * FROM tblktotyp WHERE fldIndex=".$ktotyp;
  $result = mysql_query($query) or die(mysql_error());
  $line = mysql_fetch_array($result);
  $ktotyp = $line[fldTyp];
  if ($konto<>"") {
    $query = "SELECT * FROM tblktobanken WHERE fldIndex=".$konto;
    $result = mysql_query($query) or die(mysql_error());
    $line = mysql_fetch_array($result);
    $konto = $line[fldBez];
  }  
  //echo $count."=import... ".$ktotyp.",".$konto."<br>";
  $cnt=0;
  if ($count>0) {
    for($zaehl = 1; $zaehl <= $count; $zaehl++)
    {
      $idcheck = $_POST['cbutton'.$zaehl];
      if ($idcheck==1) {
	     $cnt=$cnt+1;
        $datei = $_POST['idwert'.$zaehl];
        $jahr = $_POST['jahr'];  
        echo $datei."<br>";
        if ($ktotyp=="KSK-IMPORT") {
          $importarray = array ( array ( 'number' => 3,
                                         'dbfield' => 'fldDatum' ),
                                 array ( 'number' => 4,
                                         'fieldtype' => 'both',  
                                         'dbfield' => 'fldBez' ),
                                 array ( 'number' => 6,
                                         'dbfield' => 'fldBetrag' ));
          importkskfile($importarray,$datei,$konto,"Y",$zeroignore,$importpfad,$monat,$jahr);
        }  
        if ($ktotyp=="TARGO-IMPORT") {
          $importarray = array ( array ( 'number' => 1,
                                         'dbfield' => 'fldDatum' ),
                                 array ( 'number' => 2,
                                         'dbfield' => 'fldBez' ),
                                 array ( 'number' => 3,
                                         'dbfield' => 'fldBetrag' ));
          importkskfile($importarray,$datei,$konto,"N",$zeroignore,$importpfad,$monat,$jahr);
          //echo "Targo-Import noch nicht fertig!".$jahr; 
        }
        if ($ktotyp=="SQL-IMPORT") {
          importsqlfile($importarray,$datei,$importpfad);
        }
        if ($ktotyp=="CSV-IMPORT") {
          importcsvfile($importarray,$datei,$importpfad,$konto,$monat,$jahr,$csvkto);
        }
        if ($ktotyp=="XML-IMPORT") {
          importxmlfile($importarray,$datei,$importpfad,$konto,$monat);
        }
        if ($ktotyp=="TXT-IMPORT") {
          $importarray = array ( 'dbtable' => $pararray['dbtable']);
          importtxtfile($importarray,$datei,$importpfad,$gdbtyp);
        }
        if ($ktotyp=="ICAL-IMPORT") {
          importicalfile($datei,$importpfad); 
        }
      }
    }
    if ($ktotyp=="SQLITE-IMPORT") {
      importsqlite($menu,$konto);
   }
  }     
  
}

?>