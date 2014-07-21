<?php
header("content-type: text/html; charset=utf-8");
session_start();
include("translatefunc.php");

echo "<script type='text/javascript'>";
echo "function handleClick(cb,wert) {";
//echo "  alert('Clicked, new value = ' + cb.checked + ' meincookie' + wert);";

echo "var a = new Date();";
echo "a = new Date(a.getTime() +1000*60*60*24*365);";
echo "document.cookie = 'meincookie" +wert + "=' + cb.checked + '; expires='+a.toGMTString()+';';"; 

echo "document.cookie = 'meincookie=123; expires='+a.toGMTString()+';';";

echo "}";
echo "</script>";

function addfunc($menu) {
  include("../config.php");
  include("../sites/views/wp_".$menu."/showtab.inc.php");
  $count=$_POST['count'];   
  $group=$_POST['gruppe'];
  $addfunc=$_POST['addfunc'];
  $inputwert=$_POST['inputwert'];
  $inputfield=$_POST['inputfield'];
  $inputfieldstatus=$_POST['inputfieldstatus'];
  $inputlabel=$_POST['inputlabel'];
  $inputname=$_POST['inputname'];
  $inputdbtableref=$_POST['dbtableref'];
  $inputseldbrefindex=$_POST['seldbrefindex'];
  $inputdbfield=$_POST['dbfield'];
  $cnt=0;
  $pos=0;
//  echo $addfunc.",".$count."=addfunc,count<br>";
  if ($count>0) {
    for($zaehl = 1; $zaehl <= $count; $zaehl++)
    {
      $idcheck = $_POST['cbutton'.$zaehl];
      $idwert=$_POST['idwert'.$zaehl];
	   if ($idcheck==1) {
	     $cnt=$cnt+1;
	     $query="";
        if ($addfunc==1) {
          //$query="INSERT tbladr_lstgrp (fldid_liste,fldid_group) VALUES(".$idwert.",".$group.")";
          $query="INSERT ".$inputdbtableref." (".$inputseldbrefindex.",".$inputdbfield.") VALUES(".$idwert.",".$group.")";
        }
        if ($addfunc==2) {
          $query="DELETE FROM tbladr_lstgrp WHERE fldid_liste=".$idwert." AND fldid_group=".$group;
        }
        if ($query<>"") {
	       //echo $query."<br>";
          $result=mysql_query($query) or die(mysql_error().$query);
        }  
	   }
	   if ($addfunc==3) {
	     $status=$_POST['status'];
	     //$query="UPDATE tblEinkauf_liste SET fldstatus='".$status."' WHERE fldindex=".$idwert;
	     $query="UPDATE ".$pararray['dbtable']." SET ".$inputfieldstatus."='".$status."' WHERE ".$pararray['fldindex']."=".$idwert;
	     //echo $query."<br>";
        $result=mysql_query($query) or die(mysql_error().$query);
	   }
	   if ($addfunc==4) {
	     $query="UPDATE ".$pararray['dbtable']." SET ".$inputfield."='".$inputwert."' WHERE ".$pararray['fldindex']."=".$idwert;
	     //echo $query."<br>";
        $result=mysql_query($query) or die(mysql_error().$query);
	   }
	   if ($addfunc==5) {
        $inputwert=$_POST[$inputname];
	     $query="UPDATE ".$pararray['dbtable']." SET ".$inputfield."='".$inputwert."' WHERE ".$pararray['fldindex']."=".$idwert;
	     //echo $query."<br>";
        $result=mysql_query($query) or die(mysql_error().$query);
	   }
	 }
    if ($addfunc==1) { 
      echo "<div class='alert alert-success'>";
      echo $cnt." Daten wurden zugeordnet.";
      echo "</div>";
    }  
    if ($addfunc==2) { 
      echo "<div class='alert alert-success'>";
      echo $cnt." Zuordnung entfernt.";
      echo "</div>";
    }  
    if ($addfunc==3) { 
      echo "<div class='alert alert-success'>";
      echo $count." mal Status gesetzt.";
      echo "</div>";
    }  
    if ($addfunc==4) { 
      echo "<div class='alert alert-success'>";
      echo $count." mal ".$inputlabel." gesetzt.";
      echo "</div>";
    }  
    if ($addfunc==5) { 
      echo "<div class='alert alert-success'>";
      echo $count." mal ".$inputlabel." gesetzt.";
      echo "</div>";
    }  
  }	     
}

function selectcomputer($menu,$idwert) {
  echo "<form class='form-horizontal' method='post' action='showtab.php?menu=".$menu."&idwert=".$idwert."&showtab=1'>";
  echo "<fieldset>";
  echo "<div class='control-group'>";
  echo "Computer: ";
  echo "<select name='selcomputer'>";
  $query = "SELECT * FROM tblcomputer WHERE fldaktiv='J'";
  $result = mysql_query($query) or die(mysql_error());
  $cnt=0;
  while ($line = mysql_fetch_array($result)) { 
    $cnt=$cnt+1;
    echo "<option value='".$line[fldIndex]."'>".$line['fldHost']."</option>";
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

function getcomputer($computerid) {
  include("syncfunc.php");
  changetolocal();
  $query = "SELECT * FROM tblcomputer WHERE fldIndex=".$computerid;
  $result = mysql_query($query) or die(mysql_error());
  $line = mysql_fetch_array($result);
  $dbremotehost=$line['fldIPAddr'];
  $dbremoteuser=$line['fldusername'];
  $dbremotepass=$line['fldpassword'];
  $dbremotedb=$line['flddbname'];
  changetoremote($dbremotehost,$dbremoteuser,$dbremotepass,$dbremotedb);
  //$query="SELECT * FROM tblcomputer";
  //$result = mysql_query($query) or die(mysql_error());
  //echo "Anzahl:".mysql_num_rows ( $result ); 
  echo "<div class='alert alert-success'>";
  echo "Mit '".$dbremotehost."' verbunden.";
  echo "</div>";
}	

function getremotecomputer($remotehost) {
  include("syncfunc.php");
  changetolocal();
  $query = "SELECT * FROM tblcomputer WHERE fldHost='".$remotehost."'";
  $result = mysql_query($query) or die(mysql_error());
  $line = mysql_fetch_array($result);
  $dbremotehost=$line['fldIPAddr'];
  $dbremoteuser=$line['fldusername'];
  $dbremotepass=$line['fldpassword'];
  $dbremotedb=$line['flddbname'];
  changetoremote($dbremotehost,$dbremoteuser,$dbremotepass,$dbremotedb);
  echo "<div class='alert alert-success'>";
  echo "Mit '".$dbremotehost."' verbunden.";
  echo "</div>";
}	

function callshowtab($menu,$strwhere,$iddetail,$idwert,$drucken,$computerid,$user) {
  include("../config.php");
  include("bootstrapfunc.php");
  bootstraphead();
  include("../sites/views/wp_".$menu."/showtab.inc.php");
  if ($drucken=="J") {
    echo "<br>";
  }
  $bez=$pararray['headline'];
  $name=$pararray['name'];
  $bez=translate($name,$bez,$langshort);
  if ($user<>"") {
    $bez=$bez." (angemeldet als ".$user.")";
  }  
  bootstrapbegin($bez);
  if (isset($pararray['dbtable'])) {
    $filter="";
    if ($_GET[filter]==1) {
      $filter=1;
    }
    if ($strwhere!="") {
      $pararray['strwhere']=$strwhere;
    }
    if ($computerid===0) {
      if (isset($pararray['selectcomputer'])) {
        if ($pararray['selectcomputer']==="true") {
          selectcomputer($menu,$idwert);	
        } 	
      }
      if (isset($pararray['remotehost'])) {
        $remotehost=$pararray['remotehost'];
        //echo $remotehost."=remotehost<br>";
        getremotecomputer($remotehost);
      }
    } else {
    	getcomputer($computerid);
    } 	
//  $qrycomp="SELECT * FROM tblcomputer";
//  $rescomp = mysql_query($qrycomp) or die(mysql_error());
//  echo "Anzahl-1:".mysql_num_rows ( $rescomp )."<br>"; 
    showtablist($pararray,$listarray,$filterarray,$filter,$menu,$iddetail,$idwert,$drucken,$langshort,$computerid);
  }  
  bootstrapend();
}

function showlist() {
//echo "showlist<br>";
}

function showtablist($pararray,$listarray,$filterarray,$getfilter,$menu,$iddetail,$idwert,$drucken,$langshort,$computerid) {
include("../config.php");

$korrektur=false;
$strwhere="";
$sumwhere="";
$query="";
//if ($filter==1) {
//echo "#".$iddetail."=iddetail<br>";

foreach ( $listarray as $arrelement ) {
  if ($arrelement['type']=='checkbox') {
    $dbselarr = $_SESSION['DBSELARR'];
    $count=sizeof($dbselarr);
    if ($_GET[addfunc]==1) {
      for ( $x = 0; $x < $count; $x++ ) {
        $qrysel="UPDATE ".$pararray['dbtable']." SET ".$arrelement['dbfield']."='N' WHERE ".$pararray['fldindex']."=".$dbselarr[$x];
        $ressel = mysql_query($qrysel) or die(mysql_error()." qrysel:".$qrysel);        //echo $qrysel."<br>";
      }  
    }
  	 //echo "checkbox erkannt:".$count."<br>";
    for ( $x = 0; $x < $count; $x++ ) {
    	//$chk=$_POST[$arrelement['name'].$dbselarr[$x]];
    	$nr=$x+1;
    	$chk=$_POST['cbutton'.$nr];
    	if ($chk==1) {
    	  $qrysel="UPDATE ".$pararray['dbtable']." SET ".$arrelement['dbfield']."='J' WHERE ".$pararray['fldindex']."=".$dbselarr[$x];
        $ressel = mysql_query($qrysel) or die(mysql_error()." qrysel:".$qrysel);    	  //echo $qrysel."<br>";
    	}  
    	//echo $dbselarr[$x].",".$chk.",".$arrelement['name']."=x<br>";
    }	
  }
}

if ($iddetail=="") {
  $filter="";
  $sumfilter="";
  $fltcnt=0;
  foreach ( $filterarray as $arrelement )
  {
    $fltcnt++;
    $name=$arrelement['name'];
    if ($arrelement['type']!="checkbox") {
    $dbfield=$arrelement['dbfield'];
    $dbtableref=$arrelement['dbtableref'];
    $sign=$arrelement['sign'];

    //$qryflt = "SELECT COUNT(*) as ncount FROM tblfilter WHERE fldfeld='".$dbfield."' AND fldName='".$idwert.$name."' AND fldmaske='SHOWTAB'";
    $qryflt = "SELECT COUNT(*) as ncount FROM tblfilter WHERE fldfeld='".$dbfield."' AND fldName='".$name."' AND fldmaske='SHOWTAB'";
    //echo $qryflt."<br>";    $resflt = mysql_query($qryflt) or die(mysql_error()." sql001:".$aryflt);    $linflt = mysql_fetch_array($resflt);    $ncountfilter=$linflt[ncount];
    //echo $ncountfilter."=count<br>";

    if ($getfilter==1) {
      $wert=$_POST[$name];
      if ($ncountfilter==0) {
        //$qryflt = "INSERT INTO tblfilter (fldfeld,fldwert,fldmaske,fldName) VALUES('".$dbfield."','".$wert."','SHOWTAB','".$idwert.$name."')";
        $qryflt = "INSERT INTO tblfilter (fldfeld,fldwert,fldmaske,fldName) VALUES('".$dbfield."','".$wert."','SHOWTAB','".$name."')";
      } else {
        //$qryflt = "UPDATE tblfilter SET fldwert='".$wert."' WHERE fldfeld='".$dbfield."' AND fldName='".$idwert.$name."' AND fldmaske='SHOWTAB'";
        $qryflt = "UPDATE tblfilter SET fldwert='".$wert."' WHERE fldfeld='".$dbfield."' AND fldName='".$name."' AND fldmaske='SHOWTAB'";
      }
      //echo $qryflt."<br>";      mysql_query($qryflt) or die("Error using mysql_query($sql): ".mysql_error()." sql002:".$qryflt);
    } else {
      if ($ncountfilter==0) {
        $wert="";
      } else {
        //$qryflt = "SELECT * FROM tblfilter WHERE fldfeld='".$dbfield."' AND fldName='".$idwert.$name."' AND fldmaske='SHOWTAB'";
        $qryflt = "SELECT * FROM tblfilter WHERE fldfeld='".$dbfield."' AND fldName='".$name."' AND fldmaske='SHOWTAB'";
        $resflt = mysql_query($qryflt) or die(mysql_error()." sql003:".$qryflt);        $linflt = mysql_fetch_array($resflt);        $wert=$linflt[fldwert];
      }
    }  
    if ($filterarray[$fltcnt-1][type]=="search") {
      $wert="%".$wert."%";
    }
    $checkwert="";
    if ($filterarray[$fltcnt-1][type]=="checkempty") {
//      echo "checkempty:".$wert."<br>";
      $checkwert=$wert;
      $wert="";
    }
    
    $filterarray[$fltcnt-1]['value']=$wert;
    $wertid="";
    if (($filterarray[$fltcnt-1][type]=="selectid") and ($wert<>"")) {
//echo $wert."=wert<br>";
      if ($wert=="(leer)") {
        $wertid="(leer)";       
      }
      if ($wert=="(ohne)") {
        $wertid="(ohne)";
      } else {
    	  $fldas="";
    	  if ($filterarray[$fltcnt-1][dbasfield]<>"") {
    		  $fldas=$filterarray[$fltcnt-1][dbasfield].".";
    	  }
        $sqlqrywhere="";
        if ($filterarray[$fltcnt-1][selwhere]<>"") {
      	  $sqlqrywhere=$filterarray[$fltcnt-1][selwhere]." AND ";
        } 
        $seldbstr="*";
        if ($filterarray[$fltcnt-1][seldbstr]<>"") {
      	  $seldbstr=$filterarray[$fltcnt-1][seldbstr];
        } 
        $qrysel="SELECT ".$seldbstr." FROM ".$filterarray[$fltcnt-1][dbtable]." WHERE ".$sqlqrywhere.$fldas.$filterarray[$fltcnt-1][seldbindex]."=".$wert;
        //echo $qrysel."=query<br>";
        $ressel = mysql_query($qrysel) or die(mysql_error()." sql003b:".$qrysel);        $linsel=mysql_fetch_array($ressel);
        $wertid=$linsel[$filterarray[$fltcnt-1][seldbfield]];
      }
      if ($wertid<>"(ohne)") {
        if ($filterarray[$fltcnt-1][seldbid]<>"") {
          $wertid=$linsel[$filterarray[$fltcnt-1][seldbid]];
        } else {	
          $wertid=$linsel[$filterarray[$fltcnt-1][seldbindex]];
        }  
      }
      //echo $wertid.",".$filterarray[$fltcnt-1][seldbfield]."=wertid<br>";
    }
    if (($filterarray[$fltcnt-1][type]=="selectref") and ($wert<>"")) {
//echo "filterarray selectref<br>";
//      $query = $filterarray[$fltcnt-1]['dbtableref'].",";
//      echo $query."=query-ref,fltcnt=".$fltcnt."<br>";
      $qrysel="SELECT * FROM ".$filterarray[$fltcnt-1][dbtable]." WHERE ".$filterarray[$fltcnt-1][seldbfield]."='".$wert."'";
      $ressel=mysql_query($qrysel) or die(mysql_error()." sql003c:".$qrysel);
      $linsel=mysql_fetch_array($ressel);
      $wertid=$linsel[$filterarray[$fltcnt-1][seldbindex]];
    }    
    //echo $wert."=wert, ".$wertid."=id, ".$fltcnt."=fltcnt, ".$dbfield."=dbfield <br>";
    if (($wert!="(ohne)") and ($wertid!="(ohne)")) {
      if ($fltcnt==1) {
        if ($filterarray[$fltcnt-1][type]=="selectref") {
        	 if ($filterarray[$fltcnt-1][reftype]=="2") {
            $query = $filterarray[$fltcnt-1]['dbtableref'].",".$filterarray[$fltcnt-1][dbtable].",";
            $filter=$dbtableref.".".$filterarray[$fltcnt-1][seldbrefindex]."=".$pararray['dbtable'].".".$filterarray[$fltcnt-1][seldbreffld]." AND ".$filterarray[$fltcnt-1][dbtable].".".$filterarray[$fltcnt-1][seldbindex].$sign.$wertid." AND ".$filterarray[$fltcnt-1]['dbtableref'].".".$filterarray[$fltcnt-1]['selrefid'].$sign.$filterarray[$fltcnt-1][dbtable].".".$filterarray[$fltcnt-1][seldbindex];
            //echo $filterarray[$fltcnt-1]['dbtableref'].".".$filterarray[$fltcnt-1]['selrefid'].$sign.$filterarray[$fltcnt-1][dbtable].".".$filterarray[$fltcnt-1][seldbindex]."'=ref<br>";
          } else {
            $query = $filterarray[$fltcnt-1]['dbtableref'].",";
            $filter=$dbtableref.".".$filterarray[$fltcnt-1][seldbrefindex]."=".$pararray['dbtable'].".".$filterarray[$fltcnt-1][seldbreffld]." AND ".$dbtableref.".".$dbfield.$sign."'".$wertid."'";
          }
        } else {
          $filter=$dbfield.$sign."'".$wert."'";
        }  
        if ($filterarray[$fltcnt-1][type]=="(leer)") {
          $filter=$dbfield.$sign."''";
        }
        if (($sign==">") or ($sign==">=")) {
          if ($sign==">") {
            $sumfilter=$dbfield."<='".$wert."'";
          } else {
            $sumfilter=$dbfield."<'".$wert."'";
          }
        } else {
          if ($wert!="") {
            if ($filterarray[$fltcnt-1][type]=="selectref") {
              if ($filterarray[$fltcnt-1][seldbrefbez]<>"") {
                $sumfilter=$dbtableref.".".$filterarray[$fltcnt-1][seldbrefbez].$sign."'".$wertid."'";
              } else {	
                $sumfilter=$dbtableref.".".$dbfield.$sign."'".$wertid."'";
              }
            } else {
              $sumfilter=$dbfield.$sign."'".$wert."'";
            }  
          }
        }
      } else {
        if ($filter=="") {
          if ($filterarray[$fltcnt-1][type]=="selectid") {
            //if ($wertid="(leer)") {
            //	$wert="";
            //}
          }
          if ($wert == "(leer)") {
          	$wert="";
          }          
          $filter=$dbfield.$sign."'".$wert."'";
          if (($sign==">") or ($sign==">=")) {
            if ($sign==">") {
              $sumfilter=$dbfield."<='".$wert."'";
            } else {
              $sumfilter=$dbfield."<'".$wert."'";
            }  
          } else {
            $sumfilter=$dbfield.$sign."'".$wert."'";
          }
        } else {
        	 $filteradd = $dbfield.$sign."'".$wert."'";
//          if ($filterarray[$fltcnt-1][type]=="(leer)") {
//          	if ($checkwert=="1") {
//              $filteradd=$dbfield.$sign."''";
//              $wert="1";
//            }
//          }
          if ($wert!="") { 
            if ($wert == "(leer)") {
              $filter=$filter." AND ".$dbfield.$sign."''";
            } else {	
              $filter=$filter." AND ".$filteradd;
            }  
          }
          if (($sign==">") or ($sign==">=")) {
            if ($sign==">") {
              if ($sumfilter<>'') { 
                $sumfilter=$sumfilter." AND ".$dbfield."<='".$wert."'";
              } else {
                $sumfilter=$dbfield."<='".$wert."'";
              }  
            } else {
              if ($sumfilter<>'') { 
                $sumfilter=$sumfilter." AND ".$dbfield."<'".$wert."'";
              } else {
                $sumfilter=$dbfield."<'".$wert."'";
              }  
            }
          } else {
            if ($wert!="") {
              if ($sumfilter<>'') { 
                $sumfilter=$sumfilter." AND ".$dbfield.$sign."'".$wert."'";
              } else {
                $sumfilter=$dbfield.$sign."'".$wert."'";
              }  
            }
          }
        }  
      }
    }
    } else {
      if ($getfilter==1) {
        $wert=$_POST[$name];
        if ($wert==true) {
          $korrektur=true;
        }  
      }
    }
  }
  $sumwhere = $sumfilter;
  $strwhere = $filter;
  //echo $strwhere."=strwhere<br>";
  if ($pararray['flddetail']!="") {
    $strwhere = $strwhere." AND ".$pararray['flddetail']."=0";
  }  
  //echo $strwhere."<br>";
} else {
  //$strwhere = $pararray['flddetail']."=".$iddetail;
}
//  $qrycomp="SELECT * FROM tblcomputer";
//  $rescomp = mysql_query($qrycomp) or die(mysql_error());
//  echo "Anzahl-2:".mysql_num_rows ( $rescomp )."<br>"; 

if (is_array($filterarray)) {
  $strdetail="";
  if ($iddetail!="") {
    $strdetail="&detail=".$iddetail;
  }
  echo "<form class='form-horizontal' method='post' action='showtab.php?filter=1&menu=".$menu.$strdetail."&idwert=".$idwert."'>";
  echo "  <fieldset>";
  echo "          <div class='control-group'>";

  foreach ( $filterarray as $arrelement )
  {
    $bez=$arrelement['label'];
    $name=$arrelement['name'];
    $bez=translate($name,$bez,$langshort);

    switch ( $arrelement['type'] )
    {
      case 'multiselect':
        echo "multiselect-";
        $strfilter=$_POST[$name];
        $selwhere="";
        if ($arrelement['selwhere']!="") {
          $selwhere=" WHERE ".$arrelement['selwhere'];
        }
        $selorder="";
        if ($arrelement['selorder']!="") {
          $selorder=" ORDER BY ".$arrelement['selorder'];
        }
        $fquery = "SELECT * FROM ".$arrelement['dbtable'].$selwhere.$selorder;
        $fresult = mysql_query($fquery) or die(mysql_error()." sql004:".$fquery);
        echo $bez." ";
//        echo "<select multiple='multiple' name='".$arrelement['name']."' size='1'>";
        echo "<select class='multiselect' multiple='multiple' name='".$arrelement['name']."' size='1'>";
//        echo "<select name='".$arrelement['name']."' size='1'>";
        echo "<option style='background-color:#c0c0c0;' >(leer)</option>";
        $selectstatus=false;
        while ($fline = mysql_fetch_array($fresult)) {
          $strstatus = $fline[$arrelement['seldbfield']];
          if ($strstatus<>'(ohne)') {
            if ($arrelement['value'] == $strstatus) {
              $selectstatus=true;
              echo "<option style='background-color:#c0c0c0;' selected>".$strstatus."</option>";
            } else {
              if ($strstatus=="" and $arrelement['value']=="(leer)") {
                echo "<option style='background-color:#c0c0c0;' >(leer)</option>";
              } else {
                echo "<option style='background-color:#c0c0c0;' >".$strstatus."</option>";
              }  
            }
          }     
        }
        if ($selectstatus) {
          echo "<option style='background-color:#c0c0c0;' >(ohne)</option>";
        } else {
          echo "<option style='background-color:#c0c0c0;' selected>(ohne)</option>";
        }  
        echo "</select>";

      break;
      case 'select':

        $strfilter=$_POST[$name];
        $selwhere="";
        if ($arrelement['selwhere']!="") {
          $selwhere=" WHERE ".$arrelement['selwhere'];
        }
        $selorder="";
        if ($arrelement['selorder']!="") {
          $selorder=" ORDER BY ".$arrelement['selorder'];
        }
        if ($arrelement['seldborder']!="") {
          $selorder=" ORDER BY ".$arrelement['seldborder'];
        }
        $fquery = "SELECT * FROM ".$arrelement['dbtable'].$selwhere.$selorder;
        $fresult = mysql_query($fquery) or die(mysql_error()." sql004:".$fquery);
        echo $bez." ";
        echo "<select name='".$arrelement['name']."' size='1'>";
        echo "<option style='background-color:#c0c0c0;' >(leer)</option>";
        $selectstatus=false;
        while ($fline = mysql_fetch_array($fresult)) {
          $strstatus = $fline[$arrelement['seldbfield']];
          if ($strstatus<>'(ohne)') {
            if ($arrelement['value'] == $strstatus) {
              $selectstatus=true;
              echo "<option style='background-color:#c0c0c0;' selected>".$strstatus."</option>";
            } else {
              if ($strstatus=="" and $arrelement['value']=="(leer)") {
                echo "<option style='background-color:#c0c0c0;' >(leer)</option>";
              } else {
                echo "<option style='background-color:#c0c0c0;' >".$strstatus."</option>";
              }  
            }
          }     
        }
        if ($selectstatus) {
          echo "<option style='background-color:#c0c0c0;' >(ohne)</option>";
        } else {
          echo "<option style='background-color:#c0c0c0;' selected>(ohne)</option>";
        }  
        echo "</select>";
      break;
      case 'selectid':

        $strfilter=$_POST[$name];
        $selwhere="";
        if ($arrelement['name']=="moebel") {
          $idort=""; 
          if (isset($_POST['zimmer'])) {
            $idort=$_POST['zimmer'];
          }  
          if ($idort<>"") {
          	if ($idort<>"ohne" && $idort<>"(ohne)") {
              $selwhere = " WHERE fldind_zimmer=".$idort;
            }
          }  
        }
        if ($arrelement['selwhere']!="") {
          if ($selwhere=="") {
            $selwhere=" WHERE ".$arrelement['selwhere'];
          } else {
            $selwhere=$selwhere." AND ".$arrelement['selwhere'];
          } 
        }
        if ($arrelement['viewtable']!="") {
          $dbtable=$arrelement['viewtable'];
        } else {
          $dbtable=$arrelement['dbtable'];
        }
        $selorder="";
        if ($arrelement['seldborder']<>'') {
        	 $selorder=" ORDER BY ".$arrelement['seldborder'];
        }
        $fquery = "SELECT * FROM ".$dbtable.$selwhere.$selorder;
        //echo $fquery."=fquery<br>";
        $fresult = mysql_query($fquery) or die(mysql_error()." sql004b:".$fquery);
        //$fresult=-1;
        echo $arrelement['label']." ";
        echo "<select name='".$arrelement['name']."' size='1'>";
        echo "<option style='background-color:#c0c0c0;' value='(ohne)' >(ohne)</option>";
        //echo "<option style='background-color:#c0c0c0;' value='(leer)' >(leer)</option>";
        while ($fline = mysql_fetch_array($fresult)) {
          $strindex = $fline[$arrelement['seldbindex']];
          $strbez = $fline[$arrelement['seldbfield']];
          if ($arrelement['value'] == $strindex) {
            echo "<option style='background-color:#c0c0c0;' value=".$strindex." selected>".$strbez."</option>";
          } else {
            echo "<option style='background-color:#c0c0c0;' value=".$strindex." >".$strbez."</option>";
          }  
        }
        if ($arrelement['name']=="moebel") {
          echo "<option style='background-color:#c0c0c0;' value=0 >(ohne)</option>";
        }
        echo "</select>";
      break;
      case 'selectref':

        $strfilter=$_POST[$name];
        $selwhere="";
        $zusatz="";
        if ($arrelement['selwhere']!="") {
          $selwhere=" WHERE ".$arrelement['selwhere'];
        }
        $fquery = "SELECT * FROM ".$arrelement['dbtable'].$selwhere;
        $fresult = mysql_query($fquery) or die(mysql_error()." sql005:".$fquery);
        echo $arrelement['label']." ";
        echo "<select name='".$arrelement['name']."' size='1'>";
        echo "<option style='background-color:#c0c0c0;' >(ohne)</option>";
        while ($fline = mysql_fetch_array($fresult)) {
          $strstatus = $fline[$arrelement['seldbfield']];
          if ($arrelement['reftype']=="2") {
//          	$qryref="SELECT * FROM ".$arrelement['dbtableref2']." WHERE ".$arrelement['seldbindex2']."=".$fline[$arrelement['seldbindex2']];
//          	echo $qryref."=qryref<br>";
//          	$zusatz=" (zusatz)";
          }
          if ($arrelement['value'] == $strstatus) {
            echo "<option style='background-color:#c0c0c0;' selected>".$strstatus.$zusatz."</option>";
          } else {
            echo "<option style='background-color:#c0c0c0;' >".$strstatus.$zusatz."</option>";
          }  
        }
        echo "</select>";
      break;
      case 'search':
        echo $arrelement['label']." ";
        echo "<input type='text' name='".$arrelement['name']."' value=''>";
      break;
      case 'YN':
        echo $arrelement['label']." ";
        echo "<select name='".$arrelement['name']."' size='1'>";
        echo "<option style='background-color:#c0c0c0;' >(ohne)</option>";
        echo "<option style='background-color:#c0c0c0;' >J</option>";
        echo "<option style='background-color:#c0c0c0;' >N</option>";
        echo "</select>";
      break;
      case 'checkbox':
        echo "<label class='checkbox'>";
        echo "<input type='checkbox' name='".$arrelement['name'].$line['fldIndex']."' value='true'> ".$arrelement['label'];
        echo "</label>";      
      break;
      case 'checkempty':
        echo "<label class='checkbox'>";
        echo "<input type='checkbox' name='".$arrelement['name']."' value='1'> ".$arrelement['label'];
        echo "</label>";      
      break;
      case 'date':
        echo $arrelement['label']." ";
//        echo "<input class='xlarge' type='text' id='datepicker' name='".$arrelement['name']."' value='".$arrelement['value']."'>";
?>
        <input type="Text" id="<?php echo $arrelement['name']; ?>" name="<?php echo $arrelement['name']; ?>" value="<?php echo $arrelement['value']; ?>"/>
        <img src="images2/cal.gif" onclick="javascript:NewCssCal('<?php echo $arrelement['name']; ?>','yyyyMMdd','ARROW')" style="cursor:pointer"/>
<?php 
      break;
      case 'text':
        echo $arrelement['label']." ";
        echo "<input type='text' id='input01' name='".$arrelement['name']."' value=''>";
      break;
      case 'show':
        echo $arrelement['label']." ";
        echo "<input type='text' id='input01' name='".$arrelement['name']."' value=''>";
      break;
    }      
  }

  if ($drucken=="N") {
    echo "     <button type='submit' name='submit' class='btn btn-primary'>Ok</button>";
  }  
  echo "</div>";
  echo "  </fieldset>";
  echo "</form>";
}  
//$uebfilter=$_POST[bankkonto];
//echo $uebfilter."<br>";
if ($drucken=="N") {
  $bez=translate("INSERT","Einf&uumlgen",$langshort);
  if ($pararray['editonlogin']=="true") {
  } else {
    echo "<a class='btn btn-primary' href='insert.php?menu=".$menu.$strdetail."&idwert=".$idwert."&menuid=".$idwert."'>".$bez."</a> ";
  }  
  $qryfunc = "SELECT * FROM tblfunc WHERE fldTyp='MENUALL' AND fldAktiv='J'";
  //echo $qryfunc."=qryfunc,idwert=".$idwert."<br>";
  $resfunc = mysql_query($qryfunc) or die(mysql_error()." sql006:".$qryfunc);
  while ($linfunc = mysql_fetch_array($resfunc)) { 
    $bez=$linfunc['fldBez'];
    $name=$linfunc['fldName'];
    $bez=translate($name,$bez,$langshort);
    $para=$linfunc['fldParam'];
    if ($para!="") {
      echo "<a class='btn btn-primary' href='".$linfunc['fldphp']."?menu=".$menu.$para."&menuid=".$idwert."'>".$linfunc['fldBez']."</a> ";
    } else { 	
      echo "<a class='btn btn-primary' href='".$linfunc['fldphp']."?menu=".$menu."&menuid=".$idwert."'>".$linfunc['fldBez']."</a> ";
    }  
  }

  if (isset($idwert)) { 
    if ($idwert<>"") {
      $qryfunc = "SELECT * FROM tblfunc WHERE fldAktiv='J' AND (fldTyp='MENU' OR fldTyp='REPORT') AND fldMenuID=".$idwert;
      $resfunc = mysql_query($qryfunc) or die(mysql_error()." sql006b:".$qryfunc);
      while ($linfunc = mysql_fetch_array($resfunc)) { 
        if ($linfunc['fldAktiv']=="J") {
          $bez=$linfunc['fldBez'];
          $name=$linfunc['fldName'];
          $bez=translate($name,$bez,$langshort);
          if ($linfunc['fldTarget']<>"") {
            $param="";
            if ($linfunc['fldParam']=="&wert=") {
              $param=$wert;
            }
            //echo "=fldTyp<br>";
            if ($linfunc['fldTyp']=="REPORT") {
               echo "<a class='btn btn-primary' href='".$linfunc['fldphp']."' target='".$linfunc['fldTarget']."'>".$bez."</a> ";
              //echo "<a class='btn btn-primary' href='../../../tools/reportico/jreporticofunc.php' target='".$linfunc['fldTarget']."'>".$bez."</a> ";
            } else {
              echo "<a class='btn btn-primary' href='".$linfunc['fldphp']."?menu=".$menu.$linfunc['fldParam'].$param."&menuid=".$idwert."' target='".$linfunc['fldTarget']."'>".$bez."</a> ";
            }  
          } else { 
            $param="";
            if ($linfunc['fldParam']!="") {
              $param=$linfunc['fldParam'];
            }
            if ($linfunc['fldTyp']=="REPORT") {
              echo "<a class='btn btn-primary' href='".$linfunc['fldphp'];
            } else {
              echo "<a class='btn btn-primary' href='".$linfunc['fldphp']."?menu=".$menu."&idwert=".$idwert.$param."&menuid=".$idwert."'>".$bez."</a> ";
            }  
          }        
        }
      }    
    }
  }
  $bez=translate("PRINT","Drucken",$langshort);
  echo "<a class='btn btn-primary' href='showtab.php?menu=".$menu."&drucken=J&menuid=".$idwert."' target='_blank' >".$bez."</a> ";
  $bez=translate("HELP","Hilfe",$langshort);
  if ($mediawikimain=="") {
    echo "<a class='btn btn-primary' href='help.php?menu=".$menu."&idwert=".$idwert."&menuid=".$idwert."'>".$bez."</a><br>";
  } else {
  	 if ($idwert<>"") {
      $qrymen="SELECT * FROM tblmenu_liste WHERE fldIndex=".$idwert;
      $resmen = mysql_query($qrymen) or die(mysql_error());
      $linmen = mysql_fetch_array($resmen); 
      if ($linmen['fldhelplink']<>"") {
        echo "<a class='btn btn-primary' href='".$mediawikipath.$linmen['fldhelplink']."'>".$bez."</a><br>";
      } else {
        echo "<a class='btn btn-primary' href='".$mediawikipath.$mediawikimain."'>".$bez."</a><br>";
      }
    }  
  }    
}
if ($pararray['subtitle']<>"") {
  $qrygf = "SELECT * FROM tblfilter WHERE fldfeld='fldid_rezepte'";	
  $resgf = mysql_query($qrygf) or die(mysql_error());
  $lingf = mysql_fetch_array($resgf); 
  $qryrez="SELECT * FROM ".$pararray['subdbtable']." WHERE fldIndex=".$lingf['fldwert'];
  $resrez = mysql_query($qryrez) or die(mysql_error());
  $linrez = mysql_fetch_array($resrez); 
  $anzpers=$linrez['fldanzpers'];
  echo "<legend>F&uumlr ".$anzpers." Person(en)</legend><br>";
}  
echo "<form class='form-horizontal' method='post' action='showtab.php?addfunc=1&menu=".$menu.$strdetail."&idwert=".$idwert."'>";
echo "<table class='table table-hover'>";
echo "<thead>";
foreach ( $listarray as $arrelement )
{
  if ($arrelement['fieldhide']!="true") {
    switch ( $arrelement['type'] )
    {
      case 'checkbox':
        echo "<th wdith='5'><input type='checkbox' value='0'></th>";
      break;
      case 'icon':
        $bez=$arrelement['label'];
        $name=$arrelement['name'];
        $bez=translate($name,$bez,$langshort);
        echo "<th> </th>";
        echo "<th width='".$arrelement['width']."'>".$bez."</th>";
      break;
      default: 
        $bez=$arrelement['label'];
        $name=$arrelement['name'];
        //echo $name.",".$bez."<br>";
        $bez=translate($name,$bez,$langshort);
        echo "<th width='".$arrelement['width']."'>".$bez."</th>";
    }
  }  
}
echo "</thead>";
$query = $query.$pararray['dbtable'];
$sumquery = $query;
if ($pararray['strwhere']<>'') {
  if ($strwhere<>'') {
    $query=$query." WHERE ".$strwhere." AND ".$pararray['strwhere'];
    if ($sumwhere<>'') {
      $sumquery=$sumquery." WHERE ".$sumwhere." AND ".$pararray['strwhere'];
    } else {
      $sumquery=$sumquery." WHERE ".$pararray['strwhere'];
    }  
  } else {
    $query=$query." WHERE ".$pararray['strwhere'];
    $sumquery=$sumquery." WHERE ".$pararray['strwhere'];
  }  
} else {
  if ($strwhere<>'') {
    $query=$query." WHERE ".$strwhere;
  }  
  if ($sumwhere<>'') {
    $sumquery=$sumquery." WHERE ".$sumwhere;
  }  
}
if ($pararray['orderby']<>'') {
  $query=$query." ORDER BY ".$pararray['orderby'];
}
//echo $query."<br>";
//echo $sumquery."=sumquery<br>";
$calcsum=0;
if ($pararray['startdbfield']!="") {
  $startquery = "SELECT sum(".$pararray['markdbfield'].") as summe FROM ".$sumquery;
  //echo $startquery."<br>";
  $ressum = mysql_query($startquery) or die(mysql_error()." sql007:".$startquery);
  $linsum = mysql_fetch_array($ressum);
  $startsum = $linsum['summe'];
  $startsum = 0;
  //echo $startsum."=startsumme<br>";
}
if ($pararray['markdbfield']!="") {
  $sumquery = "SELECT sum(".$pararray['markdbfield'].") as summe FROM ".$sumquery;
  //echo $sumquery."=sumquery<br>";
//  echo "<div class='alert alert-error'>";
  $ressum = mysql_query($sumquery) or die(mysql_error()." sql007:".$sumquery);
//  echo "</div>";
  $linsum = mysql_fetch_array($ressum);
  //$calcsum=$calcsum + number_format($linsum['summe'],2);
  $calcsum = $calcsum + $linsum['summe'];
  //echo $linsum['summe'].",".$calcsum."=calcsum<br>";
}

if ($korrektur==true) {
  //echo $calcsum."=korrektur<br>";
  $calckorr=$calcsum;
  $calcquery = "SELECT * FROM ".$query;
  //echo $calcquery."<br>";
  $rescalc = mysql_query($calcquery) or die(mysql_error()." sql008:".$calcquery);
  while ($lincalc = mysql_fetch_array($rescalc)) {
    $calckorr=$calckorr+$lincalc['fldBetrag'];
    //echo $lincalc['fldBetrag']."<br>"; 
    $calcfix=$lincalc['fldFix'];
    if ($calcfix<>0) {
      //echo $calckorr.",".$calcfix."=fix<br>";
      $korrbetrag=round($calcfix-$calckorr,2);
      if ($korrbetrag<>0) {
        $korrbetrag=$korrbetrag+$lincalc[fldBetrag];
        $qrykorr="UPDATE ".$pararray['dbtable']." SET fldBetrag=".$korrbetrag." WHERE fldIndex=".$lincalc['fldIndex'];
        //echo $qrykorr."<br>";
        mysql_query($qrykorr) or die("Error using mysql_query($sql): ".mysql_error()." sql009:".$qrykorr);
        echo "<div class='alert alert-success'>";
        echo "Korrekturbetrag ".$korrbetrag." erfolgreich gebucht.";
        echo "</div>";
      }  
    }  
  } 
}

if ($computerid>0) {
  getcomputer($computerid);
}  
$query = "SELECT * FROM ".$query;
//echo $query."=query<br>";
$result = mysql_query($query) or die(mysql_error()." sql010:".$query);
//$nr=0;
$sum=0;
$diffsum=0;
$addsum=0;
$dbsum=array(0,0);
$count=0;
$procsum=0;
$average=0;
$systole=0;
$diastole=0;
$anzsum=0;
$dbselarr=array();
  //$qrycomp="SELECT * FROM tblcomputer";
  //$rescomp = mysql_query($qrycomp) or die(mysql_error());
  //echo "Anzahl-3:".mysql_num_rows ( $rescomp )."<br>"; 
while ($line = mysql_fetch_array($result)) { 
  $nr=$nr+1;
  $count=$count+1;
//echo $count."=count<br>";
  if ($pararray['markfield']!="") {
    //echo $pararray['markfield'].",".$line[$pararray['markfield']].",".$pararray['marksuccess']."<br>";
    switch ( $pararray['marktype'] )
    {
      case 'date':
        $Datum = $line[$pararray['markfield']];        $tag = substr($Datum,8,2);        $monat = substr($Datum,5,2);        $jahr = substr($Datum,0,4);        $Datum = $tag.".".$monat.".".$jahr;        $jetzt = mktime(0,0,0,date("m"),date("d"),date("Y"));        $DatVergleich = mktime(0,0,0,$monat,$tag,date("Y"));
        $bool = false;        if ($jetzt < $DatVergleich) {
          $bool = true;        }
      break;
      
      case 'zahl':
        $dbsum = number_format($calcsum + $line[$pararray['markdbfield']],2);
        $Wert = number_format($line[$pararray['markfield']],2);
        //echo $pararray['markfield']."=".$dbsum.",".$Wert."#"; 
        $bool = false;       
        if ($Wert == $dbsum) {
          $bool = true;
        } else {
          if ($Wert != 0) {
            $bool = true;
            $pararray['markbgcolor']=$pararray['markerrbgcolor'];
          }
        }           break;
        
      default:
        if ($pararray['marksign']=="=") {
          $bool = ($line[$pararray['markfield']]==$pararray['marksuccess']);
        }
        if ($pararray['marksign']==">") {
          $bool = ($line[$pararray['markfield']]>$pararray['marksuccess']);
        }
    }  

    if ($bool) {
      echo "<tr bgcolor=".$pararray['markbgcolor'].">";
    } else {
      echo "<tr bgcolor=".$pararray['unmarkbgcolor'].">";
    }  
  } else {
    echo "<tr>";
  }

  //$qrycomp="SELECT * FROM tblcomputer";
  //$rescomp = mysql_query($qrycomp) or die(mysql_error());
  //echo "Anzahl-4:".mysql_num_rows ( $rescomp )."<br>"; 
  $nsp=0;
  $arrZahl = array();
  $nCount=count($listarray);
  for ($nZaehl=0;$nZaehl<=$nCount+1;$nZaehl++) {
    $arrZahl[] = 0; 
  }
  foreach ( $listarray as $arrelement )
  {
    if ($arrelement['fieldhide']!="true") {
    $nsp=$nsp+1;	
    echo "<input type='hidden' name='idwert".$count."' value='".$line[$pararray['fldindex']]."' />";
    switch ( $arrelement['type'] )
    {
      case 'wday':
        $datum = $line[$arrelement['dbfield']];
        $tag = substr($datum,8,2);
        $monat = substr($datum,5,2);
        $jahr = substr($datum,0,4);
        $datum = mktime(0,0,0,$monat,$tag,$jahr);
        $datum = getdate ( $datum );
        switch ($datum[wday])
        {
          case 0: $wotag="SO"; break;
          case 1: $wotag="MO"; break;
          case 2: $wotag="DI"; break;
          case 3: $wotag="MI"; break;
          case 4: $wotag="DO"; break;
          case 5: $wotag="FR"; break;
          case 6: $wotag="SA"; break;
        }
        echo "<td width='".$arrelement['width']."'>".$wotag."</td>";
      break;
      case 'calweek':
        $datum = $line[$arrelement['dbfield']];
        $tag = substr($datum,8,2);
        $monat = substr($datum,5,2);
        $jahr = substr($datum,0,4);
        $datum = mktime(0,0,0,$monat,$tag,$jahr);
        $week = date ("W", $datum );
        echo "<td width='".$arrelement['width']."'>".$week."</td>";
      break;
      case 'cntind':
        $wertid=$line[$pararray['fldindex']];
        $qryfch="SELECT COUNT(*) AS anz FROM ".$pararray['dbtable']." WHERE ".$arrelement['dbselfield']."='".$arrelement['dbselwert']."' AND ".$arrelement['dbfldind']."=".$wertid;
        //echo $line['fldBez'].":".$qryfch."<br>";
        $resfch = mysql_query($qryfch) or die(mysql_error()." sql004b2:".$qryfch);
        $linfch = mysql_fetch_array($resfch);
        $anz=$linfch['anz'];
        $anzsum=$anzsum+$anz;
        echo "<td width='".$arrelement['width']."'>".$anz."</td>";
      break;
      case 'proccalc':
        $wertid=$line[$pararray['fldindex']];
        $qryfch="SELECT SUM(fldproz) AS summe, COUNT(*) AS anz FROM ".$pararray['dbtable']." WHERE ".$arrelement['dbselfield']."='".$arrelement['dbselwert']."' AND ".$arrelement['dbfldind']."=".$wertid;
        //echo $line['fldBez'].":".$qryfch."<br>";
        $resfch = mysql_query($qryfch) or die(mysql_error()." sql004b1:".$qryfch);
        $linfch = mysql_fetch_array($resfch);
        $prozwert=0;
        if ($linfch['anz']>0) {
        	 $anz2=1;
        	 if ($arrelement['dbselwert2']<>"") {
            $qrycnt="SELECT COUNT(*) AS anz FROM ".$pararray['dbtable']." WHERE ".$arrelement['dbselfield']."='".$arrelement['dbselwert2']."' AND ".$arrelement['dbfldind']."=".$wertid;
            //echo $line['fldBez'].":".$qryfch."<br>";
            $rescnt = mysql_query($qrycnt) or die(mysql_error()." sql004b2:".$qrycnt);
            $lincnt = mysql_fetch_array($rescnt);
            $anz2=$lincnt['anz'];
        	 }
          $prozwert=$linfch['summe'] / $linfch['anz'] / $anz2;
        }
        $proz=$prozwert;
        $procsum=$procsum+$proz;
        $prozpos=number_format($proz, 0, '', '');
        $prozneg=100-$prozpos;
        $prozposdif=100-$prozpos;
        $proznegdif=100-$prozneg;
        echo "<td style='width:240px'>";
        echo "<div style='float:left; background-color:darkgreen; color:lightgreen; height:16px; width:".$prozpos."px; top:0; left:0;' align=center></div>";
        echo "<div style='float:left; background-color:lightgreen; color:white; height:16px; width:".$prozposdif."px; top:0; left:0;' align=center></div>";
        echo "<div style='float:right; background-color:white; color:white; height:16px; width:40px; top:0; left:0;' align=center><font color='#000000' size='2'>".$prozpos."%</font></div>";
        echo "</td>";
      break;
      case 'procent':
        $proz=strval($line[$arrelement['dbfield']]);
        $procsum=$procsum+$proz;
        $prozpos=number_format($proz, 0, '', '');
        $prozneg=100-$prozpos;
        $prozposdif=100-$prozpos;
        $proznegdif=100-$prozneg;
        echo "<td style='width:240px'>";
        echo "<div style='float:left; background-color:darkgreen; color:lightgreen; height:16px; width:".$prozpos."px; top:0; left:0;' align=center></div>";
        echo "<div style='float:left; background-color:lightgreen; color:white; height:16px; width:".$prozposdif."px; top:0; left:0;' align=center></div>";
        echo "<div style='float:right; background-color:white; color:white; height:16px; width:40px; top:0; left:0;' align=center><font color='#000000' size='2'>".$prozpos."%</font></div>";
        echo "</td>";
      break;
      case 'procpoll':
        $qryproz="SELECT SUM(".$arrelement['dbfield'].") AS summe FROM ".$pararray['dbtable']." WHERE ".$arrelement['dbfldind']."=".$line[$arrelement['dbfldind']];
        //echo $qryproz."<br>";        
        $resproz = mysql_query($qryproz) or die(mysql_error()." sql004b2:".$qryproz);
        $linproz = mysql_fetch_array($resproz);
        //$proz=strval($linproz[$arrelement['dbfield']]);
        $proz=$line[$arrelement['dbfield']] / strval($linproz['summe']) * 100;
        //$proz=50;
        $procsum=$procsum+$proz;
        $prozpos=number_format($proz, 0, '', '');
        $prozneg=100-$prozpos;
        $prozposdif=100-$prozpos;
        $proznegdif=100-$prozneg;
        echo "<td style='width:".$arrelement['width']."px'>";
        echo "<div style='float:left; background-color:darkgreen; color:lightgreen; height:16px; width:".$prozpos."px; top:0; left:0;' align=center></div>";
        echo "<div style='float:left; background-color:lightgreen; color:white; height:16px; width:".$prozposdif."px; top:0; left:0;' align=center></div>";
        echo "<div style='float:right; background-color:white; color:white; height:16px; width:40px; top:0; left:0;' align=center><font color='#000000' size='2'>".$prozpos."%</font></div>";
        echo "</td>";
      break;
      case 'checkbox':
        echo "<td width='5'><input type='checkbox' name='cbutton".$count."' value='1' onclick='handleClick(this,".$line[$pararray['fldindex']].");'></td>";
        //echo $line[$pararray['fldindex']]."=index<br>";
        //echo "<input type='hidden' name='idwert".$count."' value='".$line[$pararray['fldindex']]."' />";
      break; 
      case 'nummer':
        echo "<td width='".$arrelement['width']."'>".$nr."</td>";
      break;
      case 'calc':
        //$wert=$line[$arrelement['dbfield']]*$line['fldAnz'];
        $wert=strval($line[$arrelement['dbfield']]);
        if ($arrelement['calcfield']!="") {
          $wert=$wert * strval($line[$arrelement['calcfield']]);
        }
        if ($arrelement['calcfix']!="") {
          $wert=$wert * strval($arrelement['calcfix']);
        }
        $nachkomma='2';
        if ($arrelement['nachkomma']<>"") {
          $nachkomma=$arrelement['nachkomma'];
        }
        $sum=$sum+$wert;
        echo "<td style='text-align:right;padding-right:10px;' width='".$arrelement['width']."'>".sprintf("%.".$nachkomma."f",$wert)."</td>";
      break;
      case 'calctext':
        //$wert=$line[$arrelement['dbfield']]*$line['fldAnz'];
        $wert=strval($line[$arrelement['dbfield']]);
        if ($arrelement['calcfield']!="") {
          $wert=$wert * strval($line[$arrelement['calcfield']]);
        }
        if ($arrelement['calcfix']!="") {
          $wert=$wert * strval($arrelement['calcfix']);
        }
        $sum=$sum+$wert;
        echo "<td class='align-right' width='".$arrelement['width']."'>".sprintf("%.2f",$wert)."</td>";
      break;
      case 'calcdiff':
        $wert=strval($line[$arrelement['dbfield']]);
        if ($arrelement['calcfield']!="") {
          $wert=$wert - strval($line[$arrelement['calcfield']]);
        }
        echo "<td style='text-align:right;padding-right:10px;' width='".$arrelement['width']."'>".sprintf("%.0f",$wert)."</td>";
      break;
      case 'calcdiffsum':
        $wert=strval($line[$arrelement['dbfield']]);
        if ($arrelement['calcfield']!="") {
          $wert=$wert - strval($line[$arrelement['calcfield']]);
        }
        if ($arrelement['calcfix']!="") {
          $wert=$wert * strval($arrelement['calcfix']);
        }
        $diffsum=$diffsum+$wert;
        echo "<td style='text-align:right;padding-right:10px;' width='".$arrelement['width']."'>".sprintf("%.2f",$wert)."</td>";
      break;
      case 'calcaddsum':
        $wert=strval($line[$arrelement['dbfield']]);
        if ($arrelement['calcfield']!="") {
          $wert=$wert - strval($line[$arrelement['calcfield']]);
        }
        if ($arrelement['calcfix']!="") {
          $wert=$wert * strval($arrelement['calcfix']);
        }
        if ($arrelement['calcaddfix']!="") {
          $wert=$wert + strval($arrelement['calcaddfix']) * strval($line[$arrelement['calcaddfield']]);
        }
        if ($arrelement['calcadddbfield']!="") {
          $wert=$wert + strval($line[$arrelement['calcadddbfield']]) * strval($line[$arrelement['calcaddfield']]);
        }
        $addsum=$addsum+$wert;
        echo "<td style='text-align:right;padding-right:10px;' width='".$arrelement['width']."'>".sprintf("%.2f",$wert)."</td>";
      break;
      case 'calcsum':
        //$wert=$line[$arrelement['dbfield']]*$line['fldAnz'];
        $wert=strval($line[$arrelement['dbfield']]);
        if ($arrelement['calcfield']!="") {
          $wert=$wert * strval($line[$arrelement['calcfield']]);
        }
        //echo $calcsum.",".$wert.",".$startsum."=wert<br>";
        $calcsum=$calcsum+$wert+$startsum;
        $startsum=0;
        echo "<td style='text-align:right;padding-right:10px;' width='".$arrelement['width']."'>".sprintf("%.2f",$calcsum)."</td>";
      break;
      case 'calcanz':
        if ($arrelement['calcfield']!="") {
          if ($arrelement['calcteiler']!="") {
            $wert=strval($line[$arrelement['calcfield']]) / strval($line[$arrelement['calcteiler']]);
          }
        }
        echo "<td style='text-align:right;padding-right:10px;' width='".$arrelement['width']."'>".sprintf("%.2f",$wert)."</td>";
      break;
      case 'calcdb':
        $wert=strval($line[$arrelement['calcfield']]);
        $index=$line[$arrelement['dbindex']];
        $fquery="SELECT * FROM ".$arrelement['calctable']." WHERE ".$arrelement['calcindex']."=".$index;
        $fresult = mysql_query($fquery) or die(mysql_error().$fquery);        $fline = mysql_fetch_array($fresult);
        $wert=$wert * strval($fline[$arrelement['calcfaktor']]);
        if ($arrelement['calcmultfield']!="") {
          $wert=$wert * strval($line[$arrelement['calcmultfield']]);
        }
        $dbsum[$arrelement['arrind']]=$dbsum[$arrelement['arrind']]+$wert;
        echo "<td style='text-align:right;padding-right:10px;' width='".$arrelement['width']."'>".sprintf("%.2f",$wert)."</td>";
      break;  
      case 'zahl':
        $prenumber=2; 
        $preformat="%.2f";
        if ($arrelement['prenumber']!="") {
          $prenumber=$arrelement['prenumber'];
          if ($prenumber=='0') {
            $preformat = "%d";
          } else {
            $preformat = "%.".$prenumber."f";
          }
        }
        echo "<td style='text-align:right;padding-right:10px;' width='".$arrelement['width']."' align='right'>".sprintf($preformat,$line[$arrelement['dbfield']])."</td>";
        $arrZahl[$nsp]=$line[$arrelement['dbfield']];
      break;
      case 'zahlid':
        $prenumber=2; 
        $preformat="%.2f";
        if ($arrelement['prenumber']!="") {
          $prenumber=$arrelement['prenumber'];
          if ($prenumber=='0') {
            $preformat = "%d";
          } else {
            $preformat = "%.".$prenumber."f";
          }
        }
        $wert=$line[$arrelement['dbfield']];

        if ($arrelement['ifemptyselectid']!="") {
          if ($wert=="") {
            $fquery = "SELECT * FROM ".$arrelement['dbtable']." WHERE ".$arrelement['seldbindex']."=".$line[$arrelement['ifemptyselectid']];
            $fresult = mysql_query($fquery) or die(mysql_error().$fquery);            $fline = mysql_fetch_array($fresult);
            $wert=$fline[$arrelement['seldbfield']];       
            if ($arrelement['seldblink']!="") {
              $linkfield=$arrelement['seldblink'];
              $linkwert=$fline[$linkfield];        
            }
          }
        }

        echo "<td style='text-align:right;padding-right:10px;' width='".$arrelement['width']."' align='right'>".sprintf($preformat,$wert)."</td>";
        $arrZahl[$nsp]=$line[$arrelement['dbfield']];
        $sum=$sum+$wert;
      break;
      case 'zahlmult':
        $prenumber=2; 
        $preformat="%.2f";
        if ($arrelement['prenumber']!="") {
          $prenumber=$arrelement['prenumber'];
          if ($prenumber=='0') {
            $preformat = "%d";
          } else {
            $preformat = "%.".$prenumber."f";
          }
        }
        $spArray = explode(',', $arrelement['columnarr']);
        $count=count($spArray);
        $mult=$arrZahl[$spArray[0]];
        //$cnt=count($arrZahl);
        //for ($zaehl=1;$zaehl<$cnt;$zaehl++) {
        //	 echo $zaehl.",".$arrZahl[$zaehl]."|";
        //} 
        //echo $spArray[0].",".$mult."|";
        for($zaehl = 1; $zaehl < $count; $zaehl++)
        {
        	 $mult=$mult * $arrZahl[$spArray[$zaehl]];
        }
        if ($anzpers=="") {
        	 $anzpers=1;
        }
        $mult=$mult / $anzpers;
        $sum=$sum+$mult;
        echo "<td style='text-align:right;padding-right:10px;' width='".$arrelement['width']."' align='right'>".number_format($mult,$prenumber, ",", ".")."</td>";
      break;
      case 'anzds':
        $prenumber=2; 
        $preformat="%.2f";
        if ($arrelement['prenumber']!="") {
          $prenumber=$arrelement['prenumber'];
          if ($prenumber=='0') {
            $preformat = "%d";
          } else {
            $preformat = "%.".$prenumber."f";
          }
        }
        $anzds=0;
        if ($line[$pararray['fldindex']]<>"") {
          $qryds="SELECT count(*) AS anzds FROM tblorte WHERE fldo01typ='MOEBEL' AND fldind_zimmer=".$line[$pararray['fldindex']];
          //echo $qryds."<br>";          
          $resds = mysql_query($qryds) or die(mysql_error().$qryds);          $linds = mysql_fetch_array($resds);
          $anzds=$linds['anzds'];
        }
        $sum=$sum+$anzds;
        echo "<td style='text-align:right;padding-right:10px;' width='".$arrelement['width']."' align='right'>".number_format($anzds,$prenumber, ",", ".")."</td>";
      break;
      case 'icon':
        if ($drucken=="N") {
        	 if ($arrelement['funcpara']<>"") {
            echo "<td width='5'><a class='btn' href='".$arrelement['func']."?".$arrelement['funcpara']."&idwert=".$line[$pararray['fldindex']]."&menu=".$menu."'><i class='".$arrelement['dbfield']."'></i></a></td>";
        	 } else { 	
        	   if ($arrelement['target']<>"") {
              echo "<td width='5'><a class='btn' href='".$arrelement['func']."?idwert=".$line[$pararray['fldindex']]."&menu=".$menu."' target='_blank'><i class='".$arrelement['dbfield']."'></i></a></td>";
        	   } else {
        	     if ($line['fldfilename']<>'') {	
        	       echo "<td><img src='../images/gruen-icon.jpg'></td>";
        	     } else {
        	       echo "<td><img src='../images/rot-icon.jpg'></td>";
        	     }	
              echo "<td width='5'><a class='btn' href='".$arrelement['func']."?idwert=".$line[$pararray['fldindex']]."&menu=".$menu."'><i class='".$arrelement['dbfield']."'></i></a></td>";
            }  
          }  
        }  
      break;
      case 'choise':
        echo "<td width='".$arrelement['width']."'>".$wert."</td>";
      break;
      case 'average':
        $wert=strval($line[$arrelement['dbfield']]);
        $average=$average+$wert;
        echo "<td width='".$arrelement['width']."'>".$wert."</td>";
      break;
      case 'blutdruck':
        $wert=$line[$arrelement['dbfield']];
        $pos=strpos($wert,"/");
        $systole=$systole+strval(substr($wert,0,$pos));
        $diastole=$diastole+strval(substr($wert,$pos+1));
        echo "<td width='".$arrelement['width']."'>".$wert."</td>";
      break;
      case 'blob':
          echo "<td><img src='meinbild.php?id=". $line[$pararray['fldindex']] ."' alt='test' /></td>";      break;
      case 'date':
        $Datum = $line[$arrelement['dbfield']];
        $tag = substr($Datum,8,2);
        $monat = substr($Datum,5,2);
        $jahr = substr($Datum,0,4);
        $std = substr($Datum,11,2);
        $min = substr($Datum,14,2);
        $Datum = $tag.".".$monat.".".$jahr;
        $Zeit = $std.":".$min;
        if ($arrelement['inctime']<>"") {
          echo "<td width='".$arrelement['width']."'>".$Datum." ".$Zeit."</td>";
        } else {
          echo "<td width='".$arrelement['width']."'>".$Datum."</td>";
        }  
      break;
      case 'todate':
        if ($arrelement['calcfield']!="") {
          $wert=strval($line[$arrelement['calcfield']]);
        }
        if ($arrelement['calcteiler']!="") {
          $wert=$wert / strval($line[$arrelement['calcteiler']]);
        }
        $Datum = $line[$arrelement['calcdate']];
        $tag = substr($Datum,8,2);
        $monat = substr($Datum,5,2);
        $jahr = substr($Datum,0,4);
        $date = mktime (0,0,0,$monat,$tag,$jahr);
        $date = $date+(60*60*24*$wert); 
        $Datum = date("d.m.Y",$date); 
        
        echo "<td width='".$arrelement['width']."'>".$Datum."</td>";
      break;
      case 'age':
        $Datum = $line[$arrelement['dbfield']];
        $tag = substr($Datum,8,2);
        $monat = substr($Datum,5,2);
        $jahr = substr($Datum,0,4);
        $jetzt = mktime(0,0,0,date("m"),date("d"),date("Y"));
        $geburt = mktime(0,0,0,$monat,$tag,$jahr);
        $age   = intval(($jetzt - $geburt) / (3600 * 24 * 365)); 
        echo "<td style='text-align:right;padding-right:10px;' width='".$arrelement['width']."'>".$age."</td>";
      break;
      case 'selectid':
        $qwhere = $arrelement['seldbindex']."=".$line[$arrelement['dbfield']];
        if ($arrelement['seldbwhere']<>"") {
        	 $qwhere = $qwhere . " AND " . $arrelement['seldbwhere'];
        }	
        $qrysel = "SELECT * FROM ".$arrelement['dbtable']." WHERE ".$qwhere;
        $ressel = mysql_query($qrysel) or die(mysql_error()." sql004b:".$qrysel);
        $linsel = mysql_fetch_array($ressel);
        $bez=$linsel[$arrelement['seldbfield']];
        if ($arrelement['seldbaddfield']<>"") {
        	 $bez=$bez." (".$linsel[$arrelement['seldbaddfield']].")";
        }
        if ($arrelement['reftable']<>"") {
        	 $qryref = "SELECT * FROM ".$arrelement['reftable'].",".$arrelement['dbtable']." WHERE ".$arrelement['dbtable'].".".$arrelement['refdbid']."=".$arrelement['reftable'].".".$arrelement['refindex']." AND ".$arrelement['dbtable'].".".$arrelement['seldbindex']."=".$linsel[$arrelement['seldbindex']];
        	 //echo $qryref."<br>";
          $resref = mysql_query($qryref) or die(mysql_error()." sql004b2:".$qryref);
          $linref = mysql_fetch_array($resref);
          echo "<td width='".$arrelement['width']."'>".$linsel[$arrelement['seldbfield']]." (".$linref[$arrelement['reffield']].")</td>";
        } else {
          echo "<td width='".$arrelement['width']."'>".$bez."</td>";
        }  
        $arrZahl[$nsp]=$linsel[$arrelement['seldbfield']];
      break;
      case 'image':
        echo "<td width='".$arrelement['width']."'>".$line[$arrelement['dbfield']]."</td>";
      break; 
      case 'ref':
          $qrysel = "SELECT * FROM  WHERE ";
          echo "<td width='".$arrelement['width']."'>".$qrysel."</td>";
      break;
      default:
  //$qrycomp="SELECT * FROM tblcomputer";
  //$rescomp = mysql_query($qrycomp) or die(mysql_error());
  //echo "Anzahl-5:".mysql_num_rows ( $rescomp )."<br>"; 
        $wert=$line[$arrelement['dbfield']];  
        $linkwert="";
        $linkfield="";
        if (isset($arrelement['linkfield'])) {
          $linkfield=$arrelement['linkfield'];        
        }
        $targetfield="";
        if (isset($arrelement['targetfield'])) {
          $targetfield=$arrelement['targetfield'];        
        }
        if ($arrelement['ifemptyselectid']!="") {
          if ($wert=="") {
            $fquery = "SELECT * FROM ".$arrelement['dbtable']." WHERE ".$arrelement['seldbindex']."=".$line[$arrelement['ifemptyselectid']];
            //echo $fquery."<br>";
            $fresult = mysql_query($fquery) or die(mysql_error().$fquery);            $fline = mysql_fetch_array($fresult);
            $wert=$fline[$arrelement['seldbfield']];       
            if ($arrelement['seldblink']!="") {
              $linkfield=$arrelement['seldblink'];
              $linkwert=$fline[$linkfield];        
            }
            //echo $linkfield."=".."<br>";
          }
        }
  //$qrycomp="SELECT * FROM tblcomputer";
  //$rescomp = mysql_query($qrycomp) or die(mysql_error());
  //echo "Anzahl-6:".mysql_num_rows ( $rescomp )."<br>"; 
        if ($linkfield!="") {
          if ($linkwert=="") {
            $linkwert=$line[$linkfield];
          }
          if ($linkwert!="") {
            if ($line[$targetfield]!="") {
              echo "<td width='".$arrelement['width']."'><a href='".$linkwert."' target='".$targetfield."'>".$wert."</a></td>";
            } else {
              echo "<td width='".$arrelement['width']."'><a href='".$linkwert."' >".$wert."</a></td>";
            }  
          } else {
            echo "<td width='".$arrelement['width']."'>".$wert."</td>";
          }  
        } else {
        	 if ($arrelement['chklink']<>'') {
        	 	$datei=$line[$arrelement['fldlink']];
        	 	//echo $datei."=link<br>";
            $exists=file_get_contents($datei,0,null,0,1);
            if ($exists) { 
              echo "<td width='".$arrelement['width']."'>".$wert."</td>";
        	 	} else {
              echo "<td width='".$arrelement['width']."' bgcolor=#ff0000>".$wert."</td>";
            }  
          } else {
            echo "<td width='".$arrelement['width']."'>".$wert."</td>";
          }  
        }  
      break;
    }
    }  
  }
  if ($drucken=="N") {
  	 if ($pararray['hideupdate']!="true") {
      if ($bootstrapver==3) { 
        echo "<td width='5'><a class='btn' href='update.php?idwert=".$line[$pararray['fldindex']]."&menu=".$menu."&menuid=".$idwert."'><span class='glyphicon glyphicon-home'></span></a></td>";
        echo "<td width='5'><a class='btn' href='delete.php?idwert=".$line[$pararray['fldindex']]."&menu=".$menu."&menuid=".$idwert."'><i class='glyphicon glyphicon-home'></i></a></td>";
      } else { 
        echo "<td width='5'><a class='btn' href='update.php?idwert=".$line[$pararray['fldindex']]."&menu=".$menu."&menuid=".$idwert."'><i class='icon-edit'></i></a></td>";
        echo "<td width='5'><a class='btn' href='delete.php?idwert=".$line[$pararray['fldindex']]."&menu=".$menu."&menuid=".$idwert."'><i class='icon-remove'></i></a></td>";
      }  
    }  
  }  
  echo "</tr>";
  $menge = array_push ( $dbselarr, $line[$pararray['fldindex']] );
}  
  $_SESSION['DBSELARR']=$dbselarr;
  echo "<tr>";
  foreach ( $listarray as $arrelement )
  {
    if ($arrelement['fieldhide']!="true") {
    switch ( $arrelement['type'] )
    {
      case 'calc':
        $nachkomma='2';
        if ($arrelement['nachkomma']<>"") {
          $nachkomma=$arrelement['nachkomma'];
        }
        echo "<td style='text-align:right;padding-right:10px;' width='".$arrelement['width']."'>".sprintf("%.".$nachkomma."f",$sum)."</td>";
      break;
      case 'zahlid':
        $nachkomma='2';
        if ($arrelement['prenumber']<>"") {
          $nachkomma=$arrelement['prenumber'];
        }
        echo "<td style='text-align:right;padding-right:10px;' width='".$arrelement['width']."'>".number_format($sum,$nachkomma, ",", ".")."</td>";
      break;
      case 'zahlmult':
        $nachkomma='2';
        if ($arrelement['nachkomma']<>"") {
          $nachkomma=$arrelement['nachkomma'];
        }
        echo "<td style='text-align:right;padding-right:10px;' width='".$arrelement['width']."'>".number_format($sum,$nachkomma, ",", ".")."</td>";
      break;
      case 'cntind':
        echo "<td style='text-align:right;padding-right:10px;' width='".$arrelement['width']."'>".sprintf("%.0f",$anzsum)."</td>";
      break; 
      case 'procent':
        $proz=$procsum / $count;
        $prozpos=number_format($proz, 0, '', '');
        $prozneg=100-$prozpos;
        $prozposdif=100-$prozpos;
        $proznegdif=100-$prozneg;
        echo "<td style='width:240px'>";
        echo "<div style='float:left; background-color:darkgreen; color:lightgreen; height:16px; width:".$prozpos."px; top:0; left:0;' align=center></div>";
        echo "<div style='float:left; background-color:lightgreen; color:white; height:16px; width:".$prozposdif."px; top:0; left:0;' align=center></div>";
        echo "<div style='float:right; background-color:white; color:white; height:16px; width:40px; top:0; left:0;' align=center><font color='#000000' size='2'>".$prozpos."%</font></div>";
        echo "</td>";
      break;
      case 'proccalc':
        $proz=$procsum / $count;
        $prozpos=number_format($proz, 0, '', '');
        $prozneg=100-$prozpos;
        $prozposdif=100-$prozpos;
        $proznegdif=100-$prozneg;
        echo "<td style='width:240px'>";
        echo "<div style='float:left; background-color:darkgreen; color:lightgreen; height:16px; width:".$prozpos."px; top:0; left:0;' align=center></div>";
        echo "<div style='float:left; background-color:lightgreen; color:white; height:16px; width:".$prozposdif."px; top:0; left:0;' align=center></div>";
        echo "<div style='float:right; background-color:white; color:white; height:16px; width:40px; top:0; left:0;' align=center><font color='#000000' size='2'>".$prozpos."%</font></div>";
        echo "</td>";
      break;
      case 'calctext':
        echo "<tr><td>Summe</td><td>: ".sprintf("%.2f",$sum)."</td></tr>";
        $soll=24;
        echo "<tr><td>Soll-Std</td><td>: ".sprintf("%.2f",$soll)."</td></tr>";
        $diff=$soll-$sum;
        echo "<tr><td>Rest</td><td>: ".sprintf("%.2f",$diff)."</td></tr>";
      break;
      case 'calcdiffsum':
        echo "<td style='text-align:right;padding-right:10px;' width='".$arrelement['width']."'>".sprintf("%.2f",$diffsum)."</td>";
      break;
      case 'calcaddsum':
        echo "<td style='text-align:right;padding-right:10px;' width='".$arrelement['width']."'>".sprintf("%.2f",$addsum)."</td>";
      break;
      case 'calcdb':
        echo "<td style='text-align:right;padding-right:10px;' width='".$arrelement['width']."'>".sprintf("%.2f",$dbsum[$arrelement['arrind']])."</td>";
      break;
      case 'average':
        $average=$average / $count;
        echo "<td width='".$arrelement['width']."'>".sprintf("%.0f",$average)."</td>";
      break;
      case 'blutdruck':
        $systole=$systole / $count;
        $diastole=$diastole / $count;
        echo "<td width='".$arrelement['width']."'>".sprintf("%.0f",$systole)."/".sprintf("%.0f",$diastole)."</td>";
      break;
      default:
        echo "<td width='".$arrelement['width']."'> </td>";
      break;
    }  
    }
  }
  echo "<input type='hidden' name='count' value=".$count." />";
  echo "</tr>";
echo "</table>";
if ($drucken=="N") {
  if ($pararray['addfunc']=="true") {
    if (is_array($filterarray)) {
      foreach ( $filterarray as $arrelement )
      {
        switch ( $arrelement['type'] )
        {
      case 'select':
        if ($arrelement['addfunc']=='true') {
        $name=$arrelement['name'];
        $strfilter=$_POST[$name];
        $selwhere="";
        if ($arrelement['selwhere']!="") {
          $selwhere=" WHERE ".$arrelement['selwhere'];
        }
        $fquery = "SELECT * FROM ".$arrelement['dbtable'].$selwhere;
        $fresult = mysql_query($fquery) or die(mysql_error()." sql004:".$fquery);
        echo $arrelement['label']." ";
        echo "<select name='".$arrelement['name']."' size='1'>";
        while ($fline = mysql_fetch_array($fresult)) {
          $strstatus = $fline[$arrelement['seldbfield']];
          if ($arrelement['value'] == $strstatus) {
            echo "<option style='background-color:#c0c0c0;' selected>".$strstatus."</option>";
          } else {
            echo "<option style='background-color:#c0c0c0;' >".$strstatus."</option>";
          }  
        }
        echo "</select>";
        }
      break;
          case 'selectref':
            $name=$arrelement['name'];
            $strfilter=$_POST[$name];
            $selwhere="";
            if ($arrelement['selwhere']!="") {
              $selwhere=" WHERE ".$arrelement['selwhere'];
            }
            $fquery = "SELECT * FROM ".$arrelement['dbtable'].$selwhere;
            $fresult = mysql_query($fquery) or die(mysql_error()." sql005:".$fquery);
            echo $arrelement['label']." ";
            echo "<select name='".$arrelement['name']."' size='1'>";
            while ($fline = mysql_fetch_array($fresult)) {
              $strstatus = $fline[$arrelement['seldbfield']];
              $strindex = $fline[$arrelement['seldbindex']];
              if ($arrelement['value'] == $strstatus) {
                echo "<option style='background-color:#c0c0c0;' value='".$strindex."' selected>".$strstatus."</option>";
              } else {
                echo "<option style='background-color:#c0c0c0;' value='".$strindex."' >".$strstatus."</option>";
              }  
            }
            echo "</select>";
          break;
        }
        if ($arrelement['funcgruppe']=='true') {
          echo "<input type='hidden' name='dbtableref' value='".$arrelement['dbtableref']."'>";
          echo "<input type='hidden' name='seldbrefindex' value='".$arrelement['seldbrefindex']."'>";
          echo "<input type='hidden' name='dbfield' value='".$arrelement['dbfield']."'>";
          echo "     <button type='submit' name='addfunc' class='btn btn-primary' value='1'>Hinzufügen</button>";
          echo "     <button type='submit' name='addfunc' class='btn btn-primary' value='2'>Entfernen</button>";
        } 
        if ($arrelement['funcsetstatus']=='true') {
          echo "<input type='hidden' name='inputfieldstatus' value='".$arrelement['dbfield']."'>";
          echo "     <button type='submit' name='addfunc' class='btn btn-primary' value='3'>setze Status</button>";
        }
        if ($arrelement['funcsetbutton']=='true') {
          echo "<input type='hidden' name='inputfield' value='".$arrelement['dbfield']."'>";
          echo "<input type='hidden' name='inputlabel' value='".$arrelement['label']."'>";
          echo "<input type='hidden' name='inputname' value='".$arrelement['name']."'>";
          echo "     <button type='submit' name='addfunc' class='btn btn-primary' value='5'>setze ".$arrelement['label']."</button>";
        }
        if ($arrelement['funcsettext']=='true') {
          echo "<input type='text' name='inputwert' value=''>";
          echo "<input type='hidden' name='inputfield' value='".$arrelement['dbfield']."'>";
          echo "<input type='hidden' name='inputlabel' value='".$arrelement['label']."'>";
          echo "     <button type='submit' name='addfunc' class='btn btn-primary' value='4'>setze ".$arrelement['label']."</button>";
        }
        if ($arrelement['funcsetchkbox']=='true') {
          echo "     <button type='submit' name='addchkbox' class='btn btn-primary' value='0'>setze ".$arrelement['label']."</button>";
        }
      }    
    }  
  }
}  
if ($pararray['funcsetchkbox']=='true') {
  echo "     <button type='submit' name='addchkbox' class='btn btn-primary' value='0'>setze checkbox</button>";
}

echo "</form>";

}
?>