<?php
header("content-type: text/html; charset=utf-8");
//echo "<script type='text/javascript'>";
//echo "function FensterOeffnen (Adresse) {";
//echo "  MeinFenster = window.open(Adresse, 'Zweitfenster', 'width=300,height=400,left=100,top=200');";
//echo "  MeinFenster.focus();";
//echo "}";
//echo "</script>";

function updateinput($pararray,$listarray,$filterarray,$filter,$idwert,$menu) {
  include("../config.php");
  $query = "SELECT * FROM ".$pararray['dbtable']." WHERE ".$pararray['fldindex']."='$idwert'";
  $result = mysql_query($query) or die("Error using mysql_query($sql): ".mysql_error());
  $line = mysql_fetch_array($result);

  echo "<table><tr><td width='500px'>";
  echo "<form name='eingabe' class='form-horizontal' method='post' action='update.php?update=1&idwert=".$idwert."&menu=".$menu."' enctype='multipart/form-data'>";
  echo "  <fieldset>";

  foreach ( $listarray as $arrelement )  
  {
    $wert=$line[$arrelement['dbfield']];
    switch ( $arrelement['type'] )
    {
      case 'select':
        $fquery = "SELECT * FROM ".$arrelement['dbtable'];
        $fresult = mysql_query($fquery) or die(mysql_error());
        echo "<div class='control-group'>";
        echo "  <label class='control-label' style='text-align:left' for='input01'>".$arrelement['label']."</label>";
        echo "  <select name='".$arrelement['name']."' size='1'>";
        while ($fline = mysql_fetch_array($fresult)) {
          $strstatus = $fline[$arrelement['seldbfield']];
          if ($wert == $strstatus) {
            echo "<option style='background-color:#c0c0c0;' selected>".$strstatus."</option>";
          } else {
            echo "<option style='background-color:#c0c0c0;' >".$strstatus."</option>";
          }  
        }
        echo "  </select>";
        echo "</div>";
      break; 
      case 'selectid':
        $selwhere=""; 
        if ($arrelement['name']=="moebel") {
          //$idort=$line['fldv01ort'];
          $idort=$line[$arrelement['fldort']];
          if (isset($_POST['zimmer'])) {
            $idort=$_POST['zimmer'];
          }  
          if ($idort<>"") {
            $selwhere = " WHERE fldind_zimmer=".$idort;
          }  
        }
        if ($arrelement['name']=="zimmer") {
          if (isset($_POST['zimmer'])) {
            if ($_POST['zimmer']<>"") {
              $wert=$_POST['zimmer'];
            }  
          }  
        }     
        if ($arrelement['seldbwhere']!="") {
          if ($selwhere=="") {
            $selwhere = " WHERE ".$arrelement['seldbwhere'];
          } else {
            $selwhere = $selwhere." AND ".$arrelement['seldbwhere'];
          } 
        }  
        if ($arrelement['viewtable']<>"") {
          $dbtable=$arrelement['viewtable'];
        } else {
          $dbtable=$arrelement['dbtable'];
        }
//        echo $arrelement['viewtable']."=viewtable<br>";
//        echo $dbtable."=dbtable<br>";
        $fquery = "SELECT * FROM ".$dbtable.$selwhere;
        //echo $fquery."=query<br>";
        $fresult = mysql_query($fquery) or die(mysql_error()." ".$fquery);
        echo "<div class='control-group'>";
        echo "  <label class='control-label' style='text-align:left' for='input01'>".$arrelement['label']."</label>";
        echo "  <select name='".$arrelement['name']."' size='1'>";
        echo "<option style='background-color:#c0c0c0;' value=0 >(ohne)</option>";
        while ($fline = mysql_fetch_array($fresult)) {
          $strstatus = $fline[$arrelement['seldbfield']];
          $strvalue = $fline[$arrelement['seldbindex']];
          if ($strstatus!="") {
            if ($wert == $strvalue) {
              echo "<option style='background-color:#c0c0c0;' value=".$strvalue." selected>".$strstatus."</option>";
            } else {
              echo "<option style='background-color:#c0c0c0;' value=".$strvalue." >".$strstatus."</option>";
            }
          }    
        }
        echo "  </select>";
        echo "</div>";
      break;
      case 'blob': 
        echo "          <div class='control-group'>";
        echo "            <label class='control-label' style='text-align:left' for='input01'>".$arrelement['label']."</label>";
        echo "            <div class='input'>";
        echo "              <input type='file' name='datei'>";
        echo "            </div>";
        echo "          </div>";
      break;      
      case 'procent':
        echo "          <div class='control-group'>";
        echo "            <label class='control-label' style='text-align:left' for='input01'>".$arrelement['label']."</label>";
        echo "            <div class='input'>";
        echo "              <input type='text' id='input01' name='".$arrelement['name']."' value='".$wert."'>";
        echo "            </div>";
        echo "          </div>";
      break;
      case 'text':
        echo "          <div class='control-group'>";
        echo "            <label class='control-label' style='text-align:left' for='input01'>".$arrelement['label']."</label>";
        echo "            <div class='input'>";
        echo "              <input type='text' id='input01' name='".$arrelement['name']."' value='".$wert."'>";
        echo "            </div>";
        echo "          </div>";
      break;
      case 'pos':
        echo "          <div class='control-group'>";
        echo "            <label class='control-label' style='text-align:left' for='input01'>".$arrelement['label']."</label>";
        echo "            <div class='input'>";
        echo "              <input type='text' id='input01' name='".$arrelement['name']."' value='".$wert."'>";
        echo "            </div>";
        echo "          </div>";
      break;
      case 'anzproz':
        echo "          <div class='control-group'>";
        echo "            <label class='control-label' style='text-align:left' for='input01'>".$arrelement['label']."</label>";
        echo "            <div class='input'>";
        echo "              <input type='text' id='input01' name='".$arrelement['name']."' value='".$wert."'>";
        echo "            </div>";
        echo "          </div>";
      break;
      case 'average':
        echo "          <div class='control-group'>";
        echo "            <label class='control-label' style='text-align:left' for='input01'>".$arrelement['label']."</label>";
        echo "            <div class='input'>";
        echo "              <input type='text' id='input01' name='".$arrelement['name']."' value='".$wert."'>";
        echo "            </div>";
        echo "          </div>";
      break;
      case 'blutdruck':
        echo "          <div class='control-group'>";
        echo "            <label class='control-label' style='text-align:left' for='input01'>".$arrelement['label']."</label>";
        echo "            <div class='input'>";
        echo "              <input type='text' id='input01' name='".$arrelement['name']."' value='".$wert."'>";
        echo "            </div>";
        echo "          </div>";
      break;
      case 'calc':
        echo "          <div class='control-group'>";
        echo "            <label class='control-label' style='text-align:left' for='input01'>".$arrelement['label']."</label>";
        echo "            <div class='input'>";
        echo "              <input type='text' id='input01' name='".$arrelement['name']."' value='".$wert."'>";
        echo "            </div>";
        echo "          </div>";
      break;
      case 'choise':
        echo "          <div class='control-group'>";
        echo "            <label class='control-label' style='text-align:left' for='input01'>".$arrelement['label']."</label>";
        echo "            <div class='input-append'>";
        echo "              <input type='text' id='input01' name='".$arrelement['name']."' value='".$wert."'>";
        echo "              <button class='btn' type='button'><a href='datei.htm' onclick='FensterOeffnen(this.href); return false'>...</a></button>";
//        echo "<a href='datei.htm' onclick='FensterOeffnen(this.href); return false'>...</a>";
        echo "            </div>";
        echo "          </div>";
      break;
      case 'textarea':
        echo "          <div class='control-group'>";
        echo "            <label class='control-label' style='text-align:left' for='input01'>".$arrelement['label']."</label>";
        echo "            <div class='input'>";
        echo "              <textarea rows='10' name='".$arrelement['name']."'>".$wert."</textarea>";
        echo "            </div>";
        echo "          </div>";
      break;
      case 'image':
        echo "          <div class='control-group'>";
        echo "            <label class='control-label' style='text-align:left' for='input01'>".$arrelement['label']."</label>";
        echo "            <div class='input'>";
        echo "              <input type='text' id='input01' name='".$arrelement['name']."' value='".$wert."'>";
        echo "<div><br><img src='../includes/images/".$wert."' alt='bild'></div>";
        echo "            </div>";
        echo "          </div>";
      break;
      case 'blobid':
        echo "          <div class='control-group'>";
        echo "            <label class='control-label' style='text-align:left' for='input01'>".$arrelement['label']."</label>";
        echo "            <div class='input'>";
        echo "              <input type='text' id='input01' name='".$arrelement['name']."' value='".$wert."'>  ";
//        if ($wert>0) { 
//          echo '<img src="meinbild.php?id='. $wert .'" alt="test" />';
//        } else {
//          echo " Keine Bild";
//        } 
        echo "            </div>";
        echo "          </div>";
      
      break;
      case 'calc':
        //echo "          <div class='control-group'>";
        //echo "            <label class='control-label' style='text-align:left' for='input01'>".$arrelement['label']."</label>";
        //echo "            <div class='input'>";
        //echo "              <input type='text' id='input01' name='".$arrelement['name']."' value='".$wert."'>";
        //echo "            </div>";
        //echo "          </div>";
      break;
      case 'calcsum':
        echo "          <div class='control-group'>";
        echo "            <label class='control-label' style='text-align:left' for='input01'>".$arrelement['label']."</label>";
        echo "            <div class='input'>";
        echo "              <input type='text' id='input01' name='".$arrelement['name']."' value='".$wert."'>";
        echo "            </div>";
        echo "          </div>";
      break;
      case 'calctext':
        echo "          <div class='control-group'>";
        echo "            <label class='control-label' style='text-align:left' for='input01'>".$arrelement['label']."</label>";
        echo "            <div class='input'>";
        echo "              <input type='text' id='input01' name='".$arrelement['name']."' value='".$wert."'>";
        echo "            </div>";
        echo "          </div>";
      break;
      case 'zahl':
        echo "          <div class='control-group'>";
        echo "            <label class='control-label' style='text-align:left' for='input01'>".$arrelement['label']."</label>";
        echo "            <div class='input'>";
        echo "              <input type='text' id='input01' name='".$arrelement['name']."' value='".$wert."'>";
        echo "            </div>";
        echo "          </div>";
      break;
      case 'date':
        echo "          <div class='control-group'>";
        echo "            <label class='control-label' style='text-align:left' for='input01'>".$arrelement['label']."</label>";
        echo "            <div class='input'>";
?>
        <input type="Text" id="<?php echo $arrelement['name']; ?>" name="<?php echo $arrelement['name']; ?>" value="<?php echo $wert; ?>"/>
        <img src="images2/cal.gif" onclick="javascript:NewCssCal('<?php echo $arrelement['name']; ?>','yyyyMMdd','ARROW')" style="cursor:pointer"/>
<?php 
        echo "            </div>";
        echo "          </div>";
      break;
      case 'liste':
        echo "          <div class='control-group'>";
        echo "            <label class='control-label' style='text-align:left' for='input01'>".$arrelement['label']."</label>";

        echo "<select name='top5' size='4'>";
        $qrygrp = "SELECT gr.fldbez FROM tbladr_group AS gr, tbladr_lstgrp AS lg WHERE lg.fldid_group=gr.fldindex AND lg.fldid_liste=".$line[$pararray['fldindex']];
        $resgrp = mysql_query($qrygrp);
        while ($lingrp = mysql_fetch_array($resgrp)) {
          echo "<option>".$lingrp[$arrelement['seldbfield']]."</option>";
        }  
        echo "</select>";

        echo "          </div>";
      break;
      case 'YN';
        echo "          <div class='control-group'>";
        echo "            <label class='control-label' style='text-align:left' for='input01'>".$arrelement['label']."</label>";
        echo "<select name='".$arrelement['name']."' size='1'>";
        if ($wert=="J") {
          echo "<option selected>J</option>";
        } else {
          echo "<option>J</option>";
        }  
        if ($wert=="N") {
          echo "<option selected>N</option>";
        } else {
          echo "<option>N</option>";
        }  
        echo "</select>";
        echo "          </div>";
      break;
    }  	
  }

        echo "          <div class='control-group'>";
        //echo "            <label class='control-label' >Resync</label>";
        echo "            <div class='checkbox'>";
        echo "              <input type='checkbox' name='dscopy'> Kopieren";
        echo "            </div>";
        echo "          </div>";

        echo "          <div class='control-group'>";
        //echo "            <label class='control-label' >Resync</label>";
        echo "            <div class='checkbox'>";
        echo "              <input type='checkbox' name='resync'> Resync";
        echo "            </div>";
        echo "          </div>";


  echo "  <div class='form-actions'>";
  echo "     <button type='submit' name='submit' value='save' class='btn btn-primary'>Speichern</button>";
  echo "     <button class='btn'>Abbruch</button>";
  if ($pararray['updateaktual']=="true") {
    echo "     <button type='submit' name='aktual' value='aktual' class='btn btn-primary'>Aktualisieren</button>";
  }  
  echo "  </div>";
  echo "  </fieldset>";
  echo "</form>";
  echo "</td>";
  echo "<td valign='top'>";

  foreach ( $listarray as $arrelement )  
  {
    $wert=$line[$arrelement['dbfield']];
    switch ( $arrelement['type'] )
    {
      case 'blobid':

        if ($wert>0) { 
          echo '<img src="meinbild.php?id='. $wert .'" alt="Keine Bildanzeige" />';
        } else {
          echo " Keine Bild";
        } 

      break;
      case 'imagemap':

        if ($wert>0) { 

          echo '<style type="text/css">';
          echo 'ul, li {';
          echo 'list-style: none;';
          echo '}';

  echo '#kaart {';
  echo 'float: left;';
  echo 'margin: 30px;';
  echo 'position: relative;';
  echo 'width: '.$line['fldwidth'].'px;';
  echo 'height: '.$line['fldheight'].'px;';
  echo 'background: url('.$imagepath.'MerkenicherHauptstr-1Stock.png) 0 0 no-repeat;';
  echo '}';
  echo '#kaart li a {';
  echo 'position: absolute;';
  echo 'text-decoration: none;';
  echo 'background: url('.$imagepath.'MerkenicherHauptstr-1Stock-auswahl.png) 297px 0 no-repeat;';
  echo '}';
  echo '#kaart li a:hover {';
  echo '	  visibility: visible;';
  echo '}';

  echo '#kaart a span {';
  echo 'position: absolute;'; 
  echo 'left: -9000em;';
  echo 'padding:  2px 5px;'; 
  echo 'color: #000;';
  echo 'text-align: center;';
  echo 'font: normal .8em/1em palatino, georgia, "times new roman", serif;';
  echo 'background-color: #fbeb92;';
  echo 'border: 1px solid #000;';
  echo 'white-space: nowrap;';
  echo '}';
  echo '#kaart a:hover span, #kaart a:focus span, #kaart a:active span {';
  echo 'left: 60px;';
  echo 'top: 10px;';
  echo '}';
  echo '#kaart a#oz:focus span, #kaart a#oz:hover span, #kaart a#oz:active span {';
  echo 'left: -65px;';
  echo 'top: 40px;';
  echo '}'; 

  echo 'a#kueche {';
  echo '	  width: 130px;';
  echo '	  height:105px;';
  echo '	  top: 20px;';
  echo '	  left:45px;';
  echo '}';
  echo 'a#kueche:hover, a#kueche:focus, a#kueche:active {';
  echo '	  background-position: -45px -20px;';
  echo '}';

  echo 'a#esszimmer {';
  echo '	  width: 130px;';
  echo '	  height:105px;';
  echo '	  top: 150px;';
  echo '	  left:145px;';
  echo '}';
  echo 'a#esszimmer:hover, a#esszimmer:focus, a#esszimmer:active {';
  echo '	  background-position: -145px -150px;';
  echo '}';

  echo 'a#bad {';
  echo '	  width: 130px;';
  echo '	  height:105px;';
  echo '	  top: 150px;';
  echo '	  left:45px;';
  echo '}';
  echo 'a#bad:hover, a#bad:focus, a#bad:active {';
  echo '	  background-position: -45px -150px;';
  echo '}';

  echo '</style>';

  echo '<ul id="kaart">';
  echo '  <li><a id="kueche" href="#"><span>Küche</span></a></li>';
  echo '  <li><a id="esszimmer" href="update.php?idwert=51&menu=rooms"><span>Esszimmer</span></a></li>';
  echo '  <li><a id="bad" href="update.php?idwert=51&menu=rooms"><span>Badezimmer</span></a></li>';
  echo '</ul>';
        } else {
          echo " Keine Bild";
        } 

      break;
    }  	
  }

  echo "</td></tr></table>";


}

function updatesavedirect($pararray,$listarray,$filterarray,$filter,$idwert,$menu,$dbname) {
    $strset="";
    $strfld="";
    $strval="";
    foreach ( $listarray as $arrelement )
    {
//      if (($arrelement['type']=='text') OR ($arrelement['type']=='image') OR ($arrelement['type']=='calctext') OR ($arrelement['type']=='calc') OR ($arrelement['type']=='select') OR ($arrelement['type']=='selectid') OR ($arrelement['type']=='zahl') OR ($arrelement['type']=='date')) {
      if (($arrelement['type']=='blob') OR ($arrelement['type']=='pos') OR ($arrelement['type']=='anzproz') OR ($arrelement['type']=='textarea') OR ($arrelement['type']=='blutdruck') OR ($arrelement['type']=='average') OR ($arrelement['type']=='YN') OR ($arrelement['type']=='text') OR ($arrelement['type']=='procent') OR ($arrelement['type']=='calcsum') OR ($arrelement['type']=='blobid') OR ($arrelement['type']=='image') OR ($arrelement['type']=='calctext') OR ($arrelement['type']=='select') OR ($arrelement['type']=='selectid') OR ($arrelement['type']=='zahl') OR ($arrelement['type']=='date') OR ($arrelement['type']=='calc')) {
        $name=$arrelement['name'];
        $wert=$_POST[$name];
        if (($arrelement['type']=='YN') OR ($arrelement['type']=='pos') OR ($arrelement['type']=='calctext') OR ($arrelement['type']=='anzproz') OR ($arrelement['type']=='text') OR ($arrelement['type']=='average') OR ($arrelement['type']=='blutdruck') OR ($arrelement['type']=='blob') OR ($arrelement['type']=='calc') OR ($arrelement['type']=='date') OR ($arrelement['type']=='zahl') OR ($arrelement['type']=='select') OR ($arrelement['type']=='selectid')) {
          if ($arrelement['type']=='pos') {
 //           if ($wert=="+") {
//          	  $dbwhere=$_POST[$arrelement['dbwherename']];
//              $qrypos = "SELECT max(".$arrelement['dbfield'].") AS maxwert FROM ".$pararray['dbtable']." WHERE ".$arrelement['dbwherefield']."='".$dbwhere."'";
              //echo $qrypos."=qrypos<br>"; 
//              $respos=mysql_query($qrypos) or die("Error using mysql_query($qrypos): ".mysql_error());
//              $reslin = mysql_fetch_array($respos);
//              $wert=$reslin['maxwert']+1;
//            }  
          }
          if ($arrelement['type']=='blob') {
            $filename = $_FILES['datei']['tmp_name'];
            //echo ">".$filename."<=filename<br>";
            if ($filename!="") {
              $handle = fopen($filename, "rb");              $wert = addslashes(fread($handle, filesize($filename)));              fclose($handle);            }        
          } 
        
        if ($strset=="") {
          $strset=$arrelement['dbfield']."='".$wert."'";
        } else {
          $strset=$strset.",".$arrelement['dbfield']."='".$wert."'";
        }  
        if ($strfld=="") {
          $strfld=$arrelement['dbfield'];
          $strval="'".$wert."'";
        } else {
          $strfld=$strfld.",".$arrelement['dbfield'];
          $strval=$strval.",'".$wert."'";
        }          
        if ($arrelement['dbfieldset']<>'') {
          //$strfld=$strfld.",".$arrelement['dbfieldbez'];
          //$strval=$strval.",'".$wert."'";
          $qrysel = "SELECT * FROM ".$arrelement['dbtable']." WHERE ".$arrelement['seldbindex']."='$wert'";
          //echo $qrysel."<br>";
          $ressel = mysql_query($qrysel) or die("Error using mysql_query($sql): ".mysql_error());
          $linsel = mysql_fetch_array($ressel);
          $wert=$linsel[$arrelement['seldbfield']];   
        	 //echo $linsel[$arrelement['seldbfield']]."=dbfieldbez<br>";
          $strset=$strset.",".$arrelement['dbfieldset']."='".$wert."'";
          //echo $strset."=strset<br>";
        }
      }
    }

    $query = "UPDATE ".$pararray['dbtable']." SET ".$strset." WHERE ".$pararray['fldindex']."='$idwert'";
    echo $query."<br>";
    //mysql_query($query) or die("Error using mysql_query($sql): ".mysql_error());
    $resync=$_POST['resync'];
    if ($resync==true) {
      $qrysync="INSERT INTO tbldbsync (flddbname, fldtblname, fldtblindex, fldstatus, flddbsync) VALUES ('".$dbname."','".$pararray['dbtable']."','".$idwert."','INS','NEW')";
      //echo $qrysync."<br>";
      mysql_query($qrysync) or die("Error using mysql_query($sql): ".mysql_error());    }
    $dscopy=$_POST['dscopy'];
    if ($dscopy==true) {
      $qrycopy = "INSERT INTO ".$pararray['dbtable']." (".$strfld.") VALUES(".$strval.") ";
      //echo $qrysync."<br>";
      mysql_query($qrycopy) or die("Error using mysql_query($qrycopy): ".mysql_error());    }
    echo "<div class='alert alert-success'>";
    echo "Die Daten wurden eingetragen<br>";
    echo "</div>";
}

function updatesave($pararray,$listarray,$filterarray,$filter,$idwert,$menu,$dbname) {

  echo "<a class='btn btn-primary' href='showtab.php?menu=".$menu."'>zurueck</a><br>";
  if (isset($_REQUEST['submit'])) { 
    updatesavedirect($pararray,$listarray,$filterarray,$filter,$idwert,$menu,$dbname);
  } else {
    echo "<div class='alert alert-warning'>";
    echo "Der Vorgang wurde abgebrochen.<br>"; 
    echo "</div>";
  }

}

?>