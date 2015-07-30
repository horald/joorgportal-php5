<?php
header("content-type: text/html; charset=utf-8");

function mod($a, $n) {
    return ($a % $n) + ($a < 0 ? $n : 0);
}

function insertinput($pararray,$listarray,$filterarray,$filter,$idwert,$menu,$iddetail,$menuid,$krit) {

  mysql_query("SET NAMES 'utf8'");
  $strdetail="";
  if ($iddetail!="") {
    $strdetail="&detail=".$iddetail;
  }
  
  echo "<form name='eingabe' class='form-horizontal' method='post' action='insert.php?insert=1&idwert=".$idwert."&menu=".$menu.$strdetail."&menuid=".$menuid."' enctype='multipart/form-data'>";
  echo "  <fieldset>";

  foreach ( $listarray as $arrelement )  
  {
 
    $defwert='';
    if ($arrelement['name']<>"") {
      if ($arrelement['getdefault']=="true") {
        $defquery="SELECT * FROM tblfilter WHERE fldmaske='".strtoupper($menu)."_DEFAULT' AND fldName='".$arrelement['name']."'";
//echo $defquery."=defquery<br>";        
        $defresult = mysql_query($defquery) or die(mysql_error());
        $defline = mysql_fetch_array($defresult);
        $defwert=$defline['fldwert'];
        //echo $defquery."=query,".$defwert."<br>";
      }  
    }  
    if ($arrelement['type']=='select') {
        if ($arrelement['defaultfilter']=='true') {
          $fquery = "SELECT * FROM tblfilter WHERE fldName='".$arrelement['filtervalue']."' AND fldfeld='".$arrelement['dbfield']."'";
          $fresult = mysql_query($fquery) or die(mysql_error());
          $fline = mysql_fetch_array($fresult);
          $wert=$fline[$arrelement['filterfield']];
        } 
        if ($arrelement['default']<>'') {
          $wert=$arrelement['default'];
        }
        if ($defwert<>'') {
          $wert=$defwert;
        }
        $selwhere=""; 
        if ($arrelement['seldbwhere']!="") {
          if ($selwhere=="") {
            $selwhere = " WHERE ".$arrelement['seldbwhere'];
          } else {
            $selwhere = $selwhere." AND ".$arrelement['seldbwhere'];
          } 
        }  
        $fquery = "SELECT * FROM ".$arrelement['dbtable'].$selwhere;
        if ($arrelement['seldborder']<>"") {
          $fquery=$fquery." ORDER BY ".$arrelement['seldborder'];
        }
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
    }
    if ($arrelement['type']=='liste') {
        $selwhere=""; 
        if ($arrelement['seldbwhere']!="") {
          if ($selwhere=="") {
            $selwhere = " WHERE ".$arrelement['seldbwhere'];
          } else {
            $selwhere = $selwhere." AND ".$arrelement['seldbwhere'];
          } 
        }  
        $fquery = "SELECT * FROM ".$arrelement['dbtable'].$selwhere;
        $fresult = mysql_query($fquery) or die(mysql_error());
        echo "<div class='control-group'>";
        echo "  <label class='control-label' style='text-align:left' for='input01'>".$arrelement['label']."</label>";
        echo "  <select name='".$arrelement['name']."' size='1'>";
        while ($fline = mysql_fetch_array($fresult)) {
          $strstatus = $fline[$arrelement['seldbfield']];
          $index = $fline[$arrelement['seldbindex']];
          if ($wert == $strstatus) {
            echo "<option style='background-color:#c0c0c0;' value=".$index." selected>".$strstatus."</option>";
          } else {
            echo "<option style='background-color:#c0c0c0;' value=".$index.">".$strstatus."</option>";
          }  
        }
        echo "  </select>";
        echo "</div>";
    }
    if ($arrelement['type']=='selectid') {
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
        if ($arrelement['default']!="") {
          if ($selwhere=="") {
            $defaultwhere = " WHERE ".$arrelement['seldbfield']."='".$arrelement['default']."'";
            $fquery = "SELECT * FROM ".$arrelement['dbtable'].$defaultwhere;
            //echo $fquery."<br>";
            $fresult = mysql_query($fquery) or die(mysql_error().$fquery);
            $fline = mysql_fetch_array($fresult);
            $wert=$fline[$arrelement['seldbindex']];
          }           
        }
        if ($defwert<>'') {
          //if ($selwhere=="") {
            $defaultwhere = " WHERE ".$arrelement['seldbindex']."='".$defwert."'";
            $fquery = "SELECT * FROM ".$arrelement['dbtable'].$defaultwhere;
            //echo $fquery."<br>";
            $fresult = mysql_query($fquery) or die(mysql_error().$fquery);
            $fline = mysql_fetch_array($fresult);
            $wert=$fline[$arrelement['seldbindex']];
            //echo $wert."=wert<br>";
          //}           
        }	

        if ($arrelement['selchild']=="true") {
          if ($selwhere=="") {
          	if ($krit<>"") {
              $selwhere = " WHERE fldid_ktogrp=".$krit;
            }  
          } else {
            $selwhere = $selwhere." AND fldid_ktogrp=".$krit;
          } 
        }  
        $selorder="";
        if ($arrelement['seldborder']<>"") {
        	 $selorder=" ORDER BY ".$arrelement['seldborder'];
        }
        $fquery = "SELECT * FROM ".$arrelement['dbtable'].$selwhere.$selorder;
        //echo $fquery."<br>";
        $fresult = mysql_query($fquery) or die(mysql_error().$fquery);
        echo "<div class='control-group'>";
        echo "  <label class='control-label' style='text-align:left' for='input01'>".$arrelement['label']."</label>";
        echo "  <select name='".$arrelement['name']."' size='1'>";
        echo "<option style='background-color:#c0c0c0;' value='' >(ohne)</option>";
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
    }
    if ($arrelement['type']=='date') {
      //echo $defwert.",".$wert."def,wert<br>";
      if ($wert=="") {
        //$wert="2013-06-09";
        $wert=date("Y-m-d");
      }
      if ($defwert<>'') {
        $wert=$defwert;
      }
      if ($arrelement['default']<>"") {
        $wert=date("Y-m-d");
      } else {	
        if (isset($_GET['fldvondatum'])) {
          //echo $_GET['fldvondatum']."=fldvondatum<br>";
          $wert=$_GET['fldvondatum'];	
        } else {
          $wert='';
        }
      }
      echo "          <div class='control-group'>";
      echo "            <label class='control-label' style='text-align:left' for='input01'>".$arrelement['label']."</label>";
?>
        <input type="Text" id="<?php echo $arrelement['name']; ?>" name="<?php echo $arrelement['name']; ?>" value="<?php echo $wert; ?>"/>
        <img src="images2/cal.gif" onclick="javascript:NewCssCal('<?php echo $arrelement['name']; ?>','yyyyMMdd','ARROW')" style="cursor:pointer"/>
<?php 
      echo "          </div>";
    }
    if ($arrelement['type']=='text') {
      echo "          <div class='control-group'>";
      echo "            <label class='control-label' style='text-align:left' for='input01'>".$arrelement['label']."</label>";
      echo "            <div class='input'>";
      echo "              <input type='text' id='input01' name='".$arrelement['name']."' value='".$arrelement['default']."'>";
      echo "            </div>";
      echo "          </div>";
    }	
    if ($arrelement['type']=='textarea') {
      echo "          <div class='control-group'>";
      echo "            <label class='control-label' style='text-align:left' for='input01'>".$arrelement['label']."</label>";
      echo "            <div class='input'>";
      echo "              <textarea rows='10' name='".$arrelement['name']."'>".$arrelement['default']."</textarea>";
      echo "            </div>";
      echo "          </div>";
    }
    if ($arrelement['type']=='pos') {
      echo "          <div class='control-group'>";
      echo "            <label class='control-label' style='text-align:left' for='input01'>".$arrelement['label']."</label>";
      echo "            <div class='input'>";
      echo "              <input type='text' id='input01' name='".$arrelement['name']."' value='".$arrelement['default']."'>";
      echo "            </div>";
      echo "          </div>";
    }	
    if ($arrelement['type']=='anzproz') {
      echo "          <div class='control-group'>";
      echo "            <label class='control-label' style='text-align:left' for='input01'>".$arrelement['label']."</label>";
      echo "            <div class='input'>";
      echo "              <input type='text' id='input01' name='".$arrelement['name']."' value='".$arrelement['default']."'>";
      echo "            </div>";
      echo "          </div>";
    }	
    if ($arrelement['type']=='calctext') {
      echo "          <div class='control-group'>";
      echo "            <label class='control-label' style='text-align:left' for='input01'>".$arrelement['label']."</label>";
      echo "            <div class='input'>";
      echo "              <input type='text' id='input01' name='".$arrelement['name']."' value='".$arrelement['default']."'>";
      echo "            </div>";
      echo "          </div>";
    }	
    if ($arrelement['type']=='calc') {
      echo "          <div class='control-group'>";
      echo "            <label class='control-label' style='text-align:left' for='input01'>".$arrelement['label']."</label>";
      echo "            <div class='input'>";
      echo "              <input type='text' id='input01' name='".$arrelement['name']."' value='".$arrelement['default']."'>";
      echo "            </div>";
      echo "          </div>";
    }	
    if ($arrelement['type']=='zahl') {
      echo "          <div class='control-group'>";
      echo "            <label class='control-label' style='text-align:left' for='input01'>".$arrelement['label']."</label>";
      echo "            <div class='input'>";
      echo "              <input type='text' id='input01' name='".$arrelement['name']."' value='".$arrelement['default']."'>";
      echo "            </div>";
      echo "          </div>";
    }	
    if ($arrelement['type']=='average') {
      echo "          <div class='control-group'>";
      echo "            <label class='control-label' style='text-align:left' for='input01'>".$arrelement['label']."</label>";
      echo "            <div class='input'>";
      echo "              <input type='text' id='input01' name='".$arrelement['name']."' value='".$arrelement['default']."'>";
      echo "            </div>";
      echo "          </div>";
    }	
    if ($arrelement['type']=='blutdruck') {
      echo "          <div class='control-group'>";
      echo "            <label class='control-label' style='text-align:left' for='input01'>".$arrelement['label']."</label>";
      echo "            <div class='input'>";
      echo "              <input type='text' id='input01' name='".$arrelement['name']."' value='".$arrelement['default']."'>";
      echo "            </div>";
      echo "          </div>";
    }	
    if ($arrelement['type']=='blob') {
      echo "          <div class='control-group'>";
      echo "            <label class='control-label' style='text-align:left' for='input01'>".$arrelement['label']."</label>";
      echo "            <div class='input'>";
      echo "              <input type='file' name='datei'>";
      echo "            </div>";
      echo "          </div>";
    }	
    if ($arrelement['type']=='YN') {
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
     }

  }

  echo "</table>";

  echo "          <div class='control-group'>";
  echo "            <div class='checkbox'>";
  echo "              <input type='checkbox' name='errmsg'> Zeig Fehlermeldung";
  echo "            </div>";
  echo "          </div>";

  echo "  <div class='form-actions'>";
  echo "     <button type='submit' name='submit' class='btn btn-primary'>Speichern</button>";
  echo "     <button class='btn'>Abbruch</button>";
  if ($pararray['updateaktual']=="true") {
    echo "     <button type='submit' name='aktual' value='aktual' class='btn btn-primary'>Aktualisieren</button>";
  }  
  echo "  </div>";
  echo "  </fieldset>";
  echo "</form>";

}

function insertsave($pararray,$listarray,$filterarray,$filter,$idwert,$menu,$iddetail,$errmsg) {
  $strdetail="";
  if ($iddetail!="") {
    $strdetail="&detail=".$iddetail;
  }
  echo "<a class='btn btn-primary' href='showtab.php?menu=".$menu.$iddetail."'>zurueck</a><br>";
  if (isset($_REQUEST['submit'])) { 
    $strfld="";
    $strval="";
    $lstinsid=0;    
    foreach ( $listarray as $arrelement )
    {
      if ($arrelement['type']=='liste') {
        $name=$arrelement['name'];
        $wert=$_POST[$name];
        //echo $wert."=wert,liste<br>";
        $lstqry="INSERT INTO tbladr_lstgrp (fldid_liste,fldid_group) VALUES(0,".$wert.");";
        mysql_query($lstqry) or die("Error using mysql_query($lstqry): ".mysql_error());
        $lstinsid=mysql_insert_id();      	
        //echo $lstqry.",".$lstinsid."=lstqry<br>";  
      }      
      if ($arrelement['fieldsave']<>"NO") {
        $name=$arrelement['name'];
        $wert=$_POST[$name];
        //if ($arrelement['ifemptyselectid']!="") {
        //  $fquery = "SELECT * FROM ".$arrelement['dbtable']." WHERE ".$arrelement['seldbindex']."=".$wert;
        //  $fresult = mysql_query($fquery) or die(mysql_error().$fquery);
        //  $fline = mysql_fetch_array($fresult);
        //  $wert=$fline[$arrelement['seldbfield']];       
        //}
        if (($arrelement['type']=='YN') OR ($arrelement['type']=='textarea') OR ($arrelement['type']=='pos') OR ($arrelement['type']=='calctext') OR ($arrelement['type']=='anzproz') OR ($arrelement['type']=='text') OR ($arrelement['type']=='average') OR ($arrelement['type']=='blutdruck') OR ($arrelement['type']=='blob') OR ($arrelement['type']=='calc') OR ($arrelement['type']=='date') OR ($arrelement['type']=='zahl') OR ($arrelement['type']=='select') OR ($arrelement['type']=='selectid')) {
          if ($arrelement['type']=='pos') {
            if ($wert=="+") {
          	  $dbwhere=$_POST[$arrelement['dbwherename']];
              $qrypos = "SELECT max(".$arrelement['dbfield'].") AS maxwert FROM ".$pararray['dbtable']." WHERE ".$arrelement['dbwherefield']."='".$dbwhere."'";
              //echo $qrypos."=qrypos<br>"; 
              $respos=mysql_query($qrypos) or die("Error using mysql_query($qrypos): ".mysql_error());
              $reslin = mysql_fetch_array($respos);
              $wert=$reslin['maxwert']+1;
            }  
          }
          if ($arrelement['type']=='blob') {
            $filename = $_FILES['datei']['name'];
            $filename = "/home/horald/daten/Bilder/ordnung/" . $filename;
            echo $filename."<br>";        
            //$filename = $_FILES['datei']['tmp_name'];
            //echo $filename."<br>";        
            $handle = fopen($filename, "rb");
            $wert = addslashes(fread($handle, filesize($filename)));
            fclose($handle);
          } 
          //echo $name."=".$wert."<br>";
          if ($strfld=="") {
            $strfld=$arrelement['dbfield'];
            $strval="'".$wert."'";
          } else {
            $strfld=$strfld.",".$arrelement['dbfield'];
            $strval=$strval.",'".$wert."'";
          }  
          if ($arrelement['name']<>"") {
            if ($arrelement['getdefault']=="true") {
              $defquery="DELETE FROM tblfilter WHERE fldmaske='".strtoupper($menu)."_DEFAULT' and fldName='".$arrelement['name']."'"; 
              mysql_query($defquery) or die("Error using mysql_query($sql): ".mysql_error());
//              echo $defquery."=menu<br>";
              $defquery="REPLACE INTO tblfilter (fldmaske,fldName,fldwert) VALUES ('".strtoupper($menu)."_DEFAULT','".$arrelement['name']."','".$wert."')";
              mysql_query($defquery) or die("Error using mysql_query($sql): ".mysql_error());
//              echo $defquery."=menu<br>";
            }
          }    
        }
      }  
    }

    $query = "INSERT INTO ".$pararray['dbtable']." (".$strfld.") VALUES(".$strval.") ";
    if ($errmsg==true) {
      echo $query."<br>";
    } 
    mysql_query("SET NAMES 'utf8'");
    mysql_query($query) or die("Error using mysql_query($query): ".mysql_error());
    //if ($lstinsid<>0) {
      //$insid=mysql_insert_id();
      //$qryupd = "UPDATE tbladr_lstgrp SET fldid_liste=".$insid." WHERE fldindex=".$lstinsid;      	
      //mysql_query($qryupd) or die("Error using mysql_query($qryupd): ".mysql_error());
      //echo $qryupd.",".$insid."=insid<br>";
    //}    
    mysql_close();
    echo "Die Daten wurden eingetragen<br>";
  } else {
    echo "Der Vorgang wurde abgebrochen.<br>"; 
  }

}

?>