<?php
header("content-type: text/html; charset=utf-8");
session_start();

function exportabfrage($menu,$menuid) {
//  echo "exportabfrage";
  echo "<form method='post' action='export.php?export=1&menu=".$menu."&menuid=".$menuid."'>";

//  echo "<table class='table table-hover'>";
//  echo "<thead>";
//  echo "<th><input type='checkbox' name='checkall'></th>";
//  echo "<th>Typ</th>";
//  echo "</thead>";
//  $query = "SELECT * FROM tblresyncalltyp";
//  $result = mysql_query($query) or die(mysql_error());
//  $cnt=0;
//  while ($line = mysql_fetch_array($result)) { 
//    $cnt=$cnt+1;
//    echo "<tr>"; 
//    echo "<input type='hidden' name='idwert".$cnt."' value=".$line[fldindex].">";
//    echo "<td><input type='checkbox' name='check".$cnt."' value='1'></td>";
//    echo "<td>".$line['fldbez']."</td>";
//    echo "</tr>";    
//  }
//  echo "</table>";

  echo "<input name='datnam' value=''><br>";
  echo "<select name='auswahl' size='1'>";
  echo "<option style='background-color:#c0c0c0;' value=1 selected>Flatfile</option>";
  echo "<option style='background-color:#c0c0c0;' value=2 >SQL-File</option>";
  echo "<option style='background-color:#c0c0c0;' value=3 >RSS-File</option>";
  echo "<option style='background-color:#c0c0c0;' value=4 >Einkaufsliste</option>";
  echo "<option style='background-color:#c0c0c0;' value=5 >HTML-File</option>";
  echo "<option style='background-color:#c0c0c0;' value=6 >SQL-File selected data</option>";
  echo "</select>";
  echo "  <div class='form-actions'>";
  echo "     <button type='submit' name='submit' class='btn btn-primary'> Export </button>";
  echo "     <button class='btn'>Abbruch</button>";
  echo "  </div>";
  echo "</form>";
}

function exportlog() {
  $slash="/";       
  if (substr($_SERVER['DOCUMENT_ROOT'],-1)=="/") {
    $slash="";
  }
  $today = date('Y-m-d-H-i-s');
  //$pfad = $_SERVER['DOCUMENT_ROOT'].$slash."webportal30/";
  $tmpfile = $pfad."flatfile-".$pararray['dbtable']."-".$today.".tmp";
  echo $tmpfile."#<br>";

}

function sqlexportfunc($pfad,$pararray,$menu) {
  include("../config.php");
  $datnam=$_POST['datnam'];
  $slash="/";
  if (substr($_SERVER['DOCUMENT_ROOT'],-1)=="/") {
    $slash="";
  }
  $today = date('Y-m-d-H-i-s');
  $tmpfile = $pfad."mysql-in-".$pararray['dbtable']."-".$today.".tmp";
  echo $tmpfile."#<br>";
  $datei = fopen($tmpfile,"w");

  $qrycol = "SHOW COLUMNS FROM ".$pararray['dbtable'];
  $rescol = mysql_query($qrycol) or die(mysql_error());
  $lincol = mysql_fetch_array($rescol);

  $col = "";
  $lincnt = 1;
  while ($lincol = mysql_fetch_array($rescol)) {
  	 $lincnt = $lincnt + 1;
    if ($col=="") {
      $col = $lincol[0];
    } else {
      $col = $col . "," . $lincol[0];
    }     
  }

  $dbselarr = $_SESSION['DBSELARR'];
  $count=sizeof($dbselarr);
  echo $count."=count<br>";
  for ( $zaehl = 0; $zaehl < $count; $zaehl++ ) {
  
    $cnt=$cnt+1;
    $idwert = $arrid[$zaehl];
       
    $qryval = "SELECT ".$col." FROM ".$pararray['dbtable']." WHERE fldIndex=".$dbselarr[$zaehl];
    echo $qryval."<br>";
    $resval = mysql_query($qryval) or die(mysql_error());
    $linval = mysql_fetch_array($resval);
    if (!$linval) {
      echo " ist leer (INSERT).<br>";    
    } else {
      $val = "'".$linval[0]."'";
      for($lincount = 1; $lincount+1 < $lincnt; $lincount++) {
        $val = $val . ",'".$linval[$lincount]."'";
      }

      $qry = "INSERT INTO ".$pararray['dbtable']."(".$col.") VALUES (".$val.")";
      echo $qry."<br>";
      fwrite($datei, $qry.";\n");
    }  
  }
  fclose($datei);  
  $sqlfile = $pfad."mysql-in-".$datnam."-".$pararray['dbtable']."-".$today.".sql";
  rename($tmpfile,$sqlfile);
  echo $sqlfile."#<br>";
}

function exportfunc($pfad,$pararray,$menu) {
  include("../config.php");
  $slash="/";       
  if (substr($_SERVER['DOCUMENT_ROOT'],-1)=="/") {
    $slash="";
  }
  $today = date('Y-m-d-H-i-s');
  //$pfad = $_SERVER['DOCUMENT_ROOT'].$slash."webportal30/";
  $tmpfile = $pfad."mysql-in-".$pararray['dbtable']."-".$today.".tmp";
  echo $tmpfile."#<br>";
  $datei = fopen($tmpfile,"w");

  $query = $pararray['dbtable'];
  if ($pararray['strwhere']<>'') {
    $query=$query." WHERE ".$pararray['strwhere'];
  }
  $query = "SELECT count(*) as Anz FROM ".$query;
  //echo $query."<br>";
  $result = mysql_query($query) or die(mysql_error());
  $line = mysql_fetch_array($result);
  $count = $line['Anz'];
  //echo $count."=Anz<br>";

  $query = $pararray['dbtable'];
  $qrywhere = "";
  if ($pararray['strwhere']<>'') {
    $qrywhere = " WHERE ".$pararray['strwhere']; 
    $query=$query.$qrywhere;
  }
  $query = "SELECT ".$pararray['fldindex']." FROM ".$query;
  //echo $query."<br>";
  $result = mysql_query($query) or die(mysql_error());
  $arrid=array();
  $arrid[]=0;
  while ($line = mysql_fetch_array($result)) {
    $arrid[]=$line[$pararray['fldindex']];
  }
  
  $qry = "SELECT count(*) FROM information_schema.COLUMNS WHERE table_name = '".$pararray['dbtable']."' AND table_schema='".$dbname."'";  
  $res = mysql_query($qry) or die(mysql_error());
  $lin = mysql_fetch_array($res);

  $qrycol = "SHOW COLUMNS FROM ".$pararray['dbtable'];
  $rescol = mysql_query($qrycol) or die(mysql_error());
  $lincol = mysql_fetch_array($rescol);

  $col = "";
  $lincnt = 1;
  while ($lincol = mysql_fetch_array($rescol)) {
  	 $lincnt = $lincnt + 1;
    if ($col=="") {
      $col = $lincol[0];
    } else {
      $col = $col . "," . $lincol[0];
    }     
  }
  
  //delete first
  $qry = "DELETE FROM ".$pararray['dbtable'].$qrywhere.";\n";
  echo $qry."<br>";
  fwrite($datei, $qry);

  for($zaehl = 1; $zaehl <= $count; $zaehl++)
  {
    $cnt=$cnt+1;
    $idwert = $arrid[$zaehl];
    //echo $cnt." export erkannt ".$idwert." <br>";
       
    $qryval = "SELECT ".$col." FROM ".$pararray['dbtable']." WHERE fldIndex=".$idwert;
    echo $qryval."<br>";
    $resval = mysql_query($qryval) or die(mysql_error());
    $linval = mysql_fetch_array($resval);
    if (!$linval) {
      echo " ist leer (INSERT).<br>";    
    } else {
      $val = "'".$linval[0]."'";
      for($lincount = 1; $lincount+1 < $lincnt; $lincount++) {
        $val = $val . ",'".$linval[$lincount]."'";
      }

      $qry = "INSERT INTO ".$pararray['dbtable']."(".$col.") VALUES (".$val.")";
      echo $qry."<br>";
      fwrite($datei, $qry.";\n");
    }  
  }
  fclose($datei);  
  $sqlfile = $pfad."mysql-in-".$pararray['dbtable']."-".$today.".sql";
  rename($tmpfile,$sqlfile);
  echo $sqlfile."#<br>";

}

function htmlexportfunc($pfad,$pararray) {
  include("../config.php");
  $slash="/";       
  if (substr($_SERVER['DOCUMENT_ROOT'],-1)=="/") {
    $slash="";
  }
  $today = date('Y-m-d-H-i-s');
  $timestamp = time();
  $datum = date("d.m.Y",$timestamp);
  $uhrzeit = date("H:i",$timestamp);
  $tmpfile = $pfad."out-".$pararray['dbtable']."-".$today.".tmp";
  $datei = fopen($tmpfile,"w");
  fwrite($datei, "<html>\n");
  fwrite($datei, "  <body>\n");
  fwrite($datei,"<h1>Einkaufsliste vom ".$datum." - ".$uhrzeit." Uhr</h1>\n");
  fwrite($datei,"<table border'3'>");
  fwrite($datei,"<tr class='tabAuswahl'>");
  fwrite($datei,"<td width='5'>Nr</td>");
  fwrite($datei,"<td width='400'>Bezeichnung</td>");
  fwrite($datei,"<td width='30'>Anz</td>");
  fwrite($datei,"<td width='40'>E-Preis</td>");
  fwrite($datei,"<td width='50'>G-Preis</td>");
  fwrite($datei,"<td width='70'>Kaufort</td>");
  fwrite($datei,"<td width='140'>Abteilung</td>");
  fwrite($datei,"</tr>");
  fwrite($datei,"</table>");

  fwrite($datei, "<table border='3'>");
  $AlterOrt = "###";
  $sum=0;
  $gessum=0;
  $dbselarr = $_SESSION['DBSELARR'];
  $count=sizeof($dbselarr);
  for ( $x = 0; $x < $count; $x++ ) {
    $query="SELECT * FROM tblEinkauf_liste WHERE fldindex=".$dbselarr[$x]." ORDER BY fldOrt, fldAbteilung, fldSort, fldBez";	
    $result = mysql_query($query) or die(mysql_error().$query);
    $line = mysql_fetch_array($result);
    if ($AlterOrt != "###" and $AlterOrt!=$line[fldOrt]) { 
      fwrite($datei, "<tr height='35' class='tabOhne'>");
      fwrite($datei, "<td width='5' align='right'>.</td>");
      fwrite($datei, "<td width='400'>Zwischensumme:</td>");
      fwrite($datei, "<td width='30' align='right'>.</td>");
      fwrite($datei, "<td width='40' align='right'>.</td>");
      fwrite($datei, "<td width='50' align='right'>".$sum."</td>");
      fwrite($datei, "<td width='70'>.</td>");
      fwrite($datei, "<td width='140'>.</td>");
      fwrite($datei, "</tr>");
      $sum=0; 
    } 
    $gpreis = $line[fldAnz] * $line[fldPreis]; 
    $sum=$sum + $gpreis;
    $gessum=$gessum+$gpreis;
    fwrite($datei, "<tr height='35'>");
    fwrite($datei, "<td width='5' align='right'>".$line[fldReihenfolge]."</td>");
    fwrite($datei, "<td width='400'>".htmlentities($line[fldBez], null, 'utf-8')."</td>");
    fwrite($datei, "<td width='30' align='right'>".$line[fldAnz]."</td>");
    fwrite($datei, "<td width='40' align='right'>".$line[fldPreis]."</td>");
    fwrite($datei, "<td width='50' align='right'>".$gpreis."</td>");
    fwrite($datei, "<td width='70'>".$line[fldOrt]."</td>");
    fwrite($datei, "<td width='140'>".htmlentities($line[fldAbteilung], null, 'utf-8')."</td>");
    fwrite($datei, "</tr>");
    $AlterOrt = $line[fldOrt];
  }
  fwrite($datei, "<tr height='35' class='tabOhne'>");
  fwrite($datei, "<td width='5' align='right'>.</td>");
  fwrite($datei, "<td width='400'>Zwischensumme:</td>");
  fwrite($datei, "<td width='30' align='right'>.</td>");
  fwrite($datei, "<td width='40' align='right'>.</td>");
  fwrite($datei, "<td width='50' align='right'>".$sum."</td>");
  fwrite($datei, "<td width='70'>.</td>");
  fwrite($datei, "<td width='140'>.</td>");
  fwrite($datei, "</tr>");
  fwrite($datei, "<tr height='35' class='tabOhne'>");
  fwrite($datei, "<td width='5' align='right'>.</td>");
  fwrite($datei, "<td width='400'>Gesamtsumme:</td>");
  fwrite($datei, "<td width='30' align='right'>.</td>");
  fwrite($datei, "<td width='40' align='right'>.</td>");
  fwrite($datei, "<td width='50' align='right'>".$gessum."</td>");
  fwrite($datei, "<td width='70'>.</td>");
  fwrite($datei, "<td width='140'>.</td>");
  fwrite($datei, "</tr>");
  mysql_free_result($result);
  mysql_close();
  fwrite($datei, "</table><br>");
  fwrite($datei, "  </body>\n");
  fwrite($datei, "</html>\n");
  fclose($datei);  

  $htmlfile = $pfad."out-".$pararray['dbtable']."-".$today.".html";
  rename($tmpfile,$htmlfile);
  echo "<div class='alert alert-success'>";
  echo $htmlfile." Datei exportiert.";
  echo "</div>";

}

function xmlexportfunc($pfad,$pararray) {
  include("../config.php");
  $datnam=$_POST['datnam'];
  $slash="/";       
  if (substr($_SERVER['DOCUMENT_ROOT'],-1)=="/") {
    $slash="";
  }
  $today = date('Y-m-d-H-i-s');
  $tmpfile = $pfad."out-".$pararray['dbtable']."-".$today.".tmp";
//  echo $tmpfile."#<br>";
  $datei = fopen($tmpfile,"w");
  fwrite($datei, '<?xml version="1.0" encoding="utf-8"?>\n');
  fwrite($datei, "<html>\n");
  fwrite($datei, "  <head />\n");
  fwrite($datei, "  <body>\n");
  fwrite($datei, "    <header>\n");
  fwrite($datei, "      <package>com.DramaProductions.Einkaufen5</package>\n");
  fwrite($datei, "      <version>2</version>\n");
  fwrite($datei, "      <type>lists</type>\n");
  fwrite($datei, "    </header>\n");
  fwrite($datei, "    <Liste>\n");

  $dbselarr = $_SESSION['DBSELARR'];
  $count=sizeof($dbselarr);
  $query="SELECT * FROM tblEinkauf_liste WHERE fldIndex=".$dbselarr[0]." ORDER BY fldOrt, fldAbteilung, fldSort, fldBez";	
  $result = mysql_query($query) or die(mysql_error().$query);
  $line = mysql_fetch_array($result);
  $strort = $line['fldOrt'];
  fwrite($datei, "      <Listenname>".$strort."</Listenname>\n");
  for ( $x = 0; $x < $count; $x++ ) {
    $query="SELECT * FROM tblEinkauf_liste WHERE fldIndex=".$dbselarr[$x]." ORDER BY fldOrt, fldAbteilung, fldSort, fldBez";	
    $result = mysql_query($query) or die(mysql_error().$query);
    $line = mysql_fetch_array($result);
    fwrite($datei, "        <Element>\n");
    fwrite($datei, "          <_id>1</_id>\n");
    fwrite($datei, "          <name>".$line['fldBez']."</name>\n");
    fwrite($datei, "          <status>0</status>\n");
    fwrite($datei, "          <anzahl>".$line['fldAnz']."</anzahl>\n");
    fwrite($datei, "          <einheit>stck</einheit>\n");
    fwrite($datei, "          <preis>".$line['fldPreis']."</preis>\n");
    fwrite($datei, "          <notiz>id:".$line['fldIndex']."</notiz>\n");
    fwrite($datei, "          <wichtig>0</wichtig>\n");
    fwrite($datei, "        </Element>\n");
  }

  fwrite($datei, "    </Liste>\n");
  fwrite($datei, "  </body>\n");
  fwrite($datei, "</html>\n");

  fclose($datei);  

  $xmlfile = $pfad."out-".$datnam."-".$pararray['dbtable']."-".$today.".txt";
  rename($tmpfile,$xmlfile);
  echo "<div class='alert alert-success'>";
  echo $xmlfile." Datei exportiert.";
  echo "</div>";
}

?>