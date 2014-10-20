<?php
header("content-type: text/html; charset=utf-8");
session_start();
require_once('DbDiff.php');
$finalstr="<br>";

function createtrigger($dbname,$dbtable) {
  include("../config.php");
  $host=gethostname();
  $ipaddr=gethostbyname($host);

  $qrycomputer = "SELECT * FROM tblcomputer WHERE fldaktiv='J' AND fldlocal<>'J'";
  $rescomputer = mysql_query($qrycomputer) or die(mysql_error());
  $menge = mysql_num_rows ( $rescomputer );
  if ($menge>0) {
    $queryins="DROP TRIGGER IF EXISTS `".$dbtable."_ai` ";    $result = mysql_query($queryins) or die(mysql_error());    $queryupd="DROP TRIGGER IF EXISTS `".$dbtable."_au` ";    $result = mysql_query($queryupd) or die(mysql_error());    $querydel="DROP TRIGGER IF EXISTS `".$dbtable."_ad` ";    $result = mysql_query($querydel) or die(mysql_error());
    $queryins="CREATE TRIGGER `".$dbtable."_ai` AFTER INSERT ON `".$dbtable."` FOR EACH ROW BEGIN ";
    $queryupd="CREATE TRIGGER `".$dbtable."_au` AFTER UPDATE ON `".$dbtable."` FOR EACH ROW BEGIN ";
    $querydel="CREATE TRIGGER `".$dbtable."_ad` AFTER DELETE ON `".$dbtable."` FOR EACH ROW BEGIN ";
    while ($lincomputer = mysql_fetch_array($rescomputer)) { 
      $computer = $lincomputer['fldHost'];
      $queryins=$queryins."insert into tbldbsync(fldtblindex,flddbname,fldtblname,fldstatus,fldcompid) values (new.fldIndex,'".$dbname."','".$dbtable."','INS',".$lincomputer['fldIndex']."); ";
      $queryupd=$queryupd."insert into tbldbsync(fldtblindex,flddbname,fldtblname,fldstatus,fldcompid) values (new.fldIndex,'".$dbname."','".$dbtable."','UPD',".$lincomputer['fldIndex']."); ";
      $querydel=$querydel."insert into tbldbsync(fldtblindex,flddbname,fldtblname,fldstatus,fldcompid) values (old.fldIndex,'".$dbname."','".$dbtable."','DEL',".$lincomputer['fldIndex']."); ";
    }
    $queryins=$queryins."END";
    echo $queryins."<br>";
    $result = mysql_query($queryins) or die(mysql_error());    $queryupd=$queryupd."END";
    echo $queryupd."<br>";
    $result = mysql_query($queryupd) or die(mysql_error());    $querydel=$querydel."END";
    echo $querydel."<br>";
    $result = mysql_query($querydel) or die(mysql_error());
    echo "<div class='alert alert-success'>";
    echo "Trigger wurden in der Table ".$dbtable." angelegt.";
    echo "</div>";
  } else {
    echo "<div class='alert alert-warning'>";
    echo "Keine Computer angelegt.";
    echo "</div>";
  }	  
}

function synccreatetrigger($pararray,$dbname) {
  
//  if ($modus=="local") {
//    changetolocal();
//  } else {
//    changetoremote();
//  }

  $query="CREATE TRIGGER `".$pararray['dbtable']."_ai` AFTER INSERT ON `".$pararray['dbtable']."` ";
  $query=$query."FOR EACH ROW insert into tbldbsync(fldtblindex,flddbname,fldtblname,fldstatus) values (new.fldIndex,'".$dbname."','".$pararray['dbtable']."','INS'); ";
  //echo $query."<br>";
  $result = mysql_query($query);

  $query="CREATE TRIGGER `".$pararray['dbtable']."_au` AFTER UPDATE ON `".$pararray['dbtable']."` ";
  $query=$query."FOR EACH ROW insert into tbldbsync(fldtblindex,flddbname,fldtblname,fldstatus) values (new.fldIndex,'".$dbname."','".$pararray['dbtable']."','UPD'); ";
  //echo $query."<br>";
  $result = mysql_query($query);

  $query="CREATE TRIGGER `".$pararray['dbtable']."_ad` AFTER DELETE ON `".$pararray['dbtable']."` ";
  $query=$query."FOR EACH ROW insert into tbldbsync(fldtblindex,flddbname,fldtblname,fldstatus) values (old.fldIndex,'".$dbname."','".$pararray['dbtable']."','DEL'); ";
  //echo $query."<br>";
  $result = mysql_query($query);
  echo "<div class='alert alert-success'>";
  echo "Trigger in der ".$modus." Datenbank wurden angelegt.";
  echo "</div>";

}

function changetoremote($dbremotehost,$dbremoteuser,$dbremotepass,$dbremotename) {

  echo "changetoremote-1<br>";
  echo $dbremotehost."=dbremotehost<br>";
  echo $dbremoteuser."=dbuser<br>";
  echo $dbremotepass."=dbpass<br>";
  echo $dbremotename."=dbname<br>";
  echo "--------------------<br>";

  mysql_close();
  //echo "changetoremote-2<br>";
  $res = mysql_connect($dbremotehost,$dbremoteuser,$dbremotepass) or die(mysql_error());
  //echo "changetoremote-3<br>";
  $res = mysql_select_db($dbremotename) or die(mysql_error());
  //echo "changetoremote-4<br>";
}

function changetolocal($dbname) {
  if ($dbname=="") {
    $dblocalname="dbWebportal";
  } else {
    $dblocalname=$dbname;
  }  
  $dblocalhost=$dbhost;
  $dblocaluser=$dbuser;
  $dblocalpass=$dbpass;

  //echo "changetolocal<br>";
  //echo $dblocalhost."=dbhost<br>";
  //echo $dblocaluser."=dbuser<br>";
  //echo $dblocalpass."=dbpass<br>";
  //echo $dblocalname."=dbname<br>";
  //echo "--------------------<br>";

  mysql_close();
  $res = mysql_connect($dblocalhost,$dblocaluser,$dblocalpass) or die(mysql_error());
  $res = mysql_select_db($dblocalname) or die(mysql_error());
}

function synctable($modus,$synchost,$syncuser,$syncpass,$localdbname,$remotedbname,$pararray,$compid,$checkmysqlsend,$cloud) {

$tblname=$pararray['dbtable'];

if ($checkmysqlsend==1) {
  echo "mysqlsend erkannt.<br>";
}

//echo $modus.":<br>";
if ($modus=="local") {
  changetolocal("");
  $dbname=$localdbname;
  $updatedb=$remotedbname;
  $query = "SELECT * FROM tbldbsync WHERE fldtblname='$tblname' AND flddbname='$dbname' AND flddbsync='NEW' AND fldcompid=".$compid." ORDER BY fldindex";
} else {
  //echo $synchost."=host-1-<br>";
  //echo $syncuser."=user<br>";
  //echo $syncpass."=pass<br>";
  //echo $remotedbname."=dbname<br>";
  changetoremote($synchost,$syncuser,$syncpass,$remotedbname);
  $dbname=$remotedbname;
  $updatedb=$localdbname;
  $query = "SELECT * FROM tbldbsync WHERE fldtblname='$tblname' AND flddbname='$dbname' AND flddbsync='NEW' ORDER BY fldindex";
}

//$query = "SELECT * FROM tbldbsync WHERE fldtblname='$tblname' AND flddbname='$dbname' AND flddbsync='NEW' AND fldcompid=".$compid." ORDER BY fldindex";
echo $query."<br>";
if ($checkmysqlsend==1) {
   $_SESSION['NUM_ROWS']=3;
   $showconnect="J";
   $typ="SELECT";
//	mysqlsend($synchost,$syncuser,$syncpwd,$dbname,$tblname,"SELECT",$query,"J");
//   echo "<script type='text/javascript'>startcntdn(0,'".$synchost."','".$syncuser."','".$syncpwd."','".$dbname."','".$tblname."','".$query."','".$showconnect."','".$typ."');</script>";
   $num_rows = $_SESSION['NUM_ROWS'];
	echo $num_rows."=num_rows<br>";
}
$result = mysql_query($query) or die(mysql_error());
$num_rows = mysql_num_rows($result);

echo "<div class='alert alert-success'>";
echo $modus." Daten werden &Uumlbertragen. (database=".$dbname.", Anzahl=".$num_rows.")";
echo "</div>";

echo "<table border='1'>";
if ($num_rows>0) {
  echo "<tr>";
  echo "<td width='10'>Index</td>";
  echo "<td width='50'>Status</td>";
  echo "<td widht='500'>SQL-Befehl</td>";
  echo "</tr>";
}  

$qrycol = "SHOW COLUMNS FROM $dbname.$tblname";
//echo $qrycol."<br>";
$rescol = mysql_query($qrycol) or die(mysql_error());
$lincol = mysql_fetch_array($rescol);
$getcol = $lincol[0];
$cntcol = 0;
while ($lincol = mysql_fetch_array($rescol)) {
   $cntcol++;
   if ($getcol == "") {
     $getcol = $lincol[0];
   } else {
     $getcol = $getcol . "," . $lincol[0];
   }       
}

while ($line = mysql_fetch_array($result)) {
  echo "<tr>";
  echo "<td width='10'>".$line[fldtblindex]."</td>";
  echo "<td width='50'>".$line[fldstatus]."</td>";
  echo "<td width='500'>";
  $syncact="TRUE";

    if ($line['fldstatus'] == 'INS') {
    
      $qryval = "SELECT ".$getcol." FROM ".$line['flddbname'].".".$line['fldtblname']." WHERE fldIndex=".$line['fldtblindex'];
      //echo $qryval."=qryval<br>";
      $resval = mysql_query($qryval) or die(mysql_error());
      $linval = mysql_fetch_array($resval);
      if (!$linval) {
        echo $line['fldtblindex'] . " ist leer (INSERT).".$finalstr;    
      } else {
        $val = "'".$linval[0]."'";
        for($count = 1; $count <= $cntcol; $count++) {
          $val = $val . ",'".$linval[$count]."'";
        }

        $qry = "REPLACE INTO ".$updatedb.".".$line['fldtblname']."(".$getcol.") VALUES (".$val.")";
        echo $qry."<br>";
      }  
    }
    if ($line['fldstatus'] == 'DEL') {
       //$syncact="FALSE";
      $qry = "DELETE FROM ".$updatedb.".".$line['fldtblname']." WHERE fldIndex='".$line['fldtblindex']."'";
      echo $qry.$finalstr;
    }
    if ($line['fldstatus'] == 'UPD') {

      $qrycol = "SHOW COLUMNS FROM $dbname.$tblname";
      $rescol = mysql_query($qrycol) or die(mysql_error());
      $lincol = mysql_fetch_array($rescol);

      $qryval = "SELECT ".$getcol." FROM ".$line['flddbname'].".".$line['fldtblname']." WHERE fldIndex=".$line['fldtblindex'];
      $resval = mysql_query($qryval) or die(mysql_error());
      $linval = mysql_fetch_array($resval);
      if (!$linval) {
        echo $line['fldtblindex'] . " ist leer (UPDATE).".$finalstr;    
      } else {
        $col = $lincol[0];
        $val = $col . "='".$linval[0]."'";
        $pruef=strtoupper($col);
        if ($pruef == "FLDINDEX") {
          $val = "";
        } 
        for($count = 1; $count < $cntcol; $count++) {
          $lincol = mysql_fetch_array($rescol);
          $col = $lincol[0];
          if ($val == "") {
            $val = $col."='".$linval[$count]."'";
          } else {
            $val = $val . ",".$col."='".$linval[$count]."'";
          }  
        }

        $qry = "UPDATE ".$updatedb.".".$line['fldtblname']." SET ".$val." WHERE fldIndex='".$line['fldtblindex']."'";
        echo $qry."<br>";
      }  
    }

  if ($syncact=="TRUE") {
    $qrydb = "UPDATE tbldbsync SET flddbsync='OK' WHERE fldindex='".$line['fldindex']."'";
    //echo $qrydb."<br>";
    $reserr = mysql_query($qrydb) or die(mysql_error());
    if ($modus=="local") {
      //echo $synchost."=host-2-<br>";
      //echo $syncuser."=user<br>";
      //echo $syncpass."=pass<br>";
      //echo $remotedbname."=dbname<br>";
      changetoremote($synchost,$syncuser,$syncpass,$remotedbname);
    } else {
      changetolocal($localdbname);
    }
    $reserr = mysql_query($qry) or die(mysql_error());
    $qryupd="SELECT max(fldindex) AS fldid FROM tbldbsync";  
    $resupd = mysql_query($qryupd) or die(mysql_error());
    $linupd = mysql_fetch_array($resupd);
    $qryupd="DELETE FROM tbldbsync WHERE fldindex='".$linupd['fldid']."'";
    //echo $qryupd."<br>";
    $reserr = mysql_query($qryupd) or die(mysql_error());
    if ($cloud=="J") {
      $qryins="INSERT ".$remotedbname.".tbldbsync (flddbname,fldtblname,fldtblindex,fldstatus,flddbsync,fldcompid) VALUES('".$remotedbname."','".$tblname."',".$line[fldtblindex].",'INS','NEW',0)";
      echo $qryins."=cloud<br>";
      $resins = mysql_query($qryins) or die(mysql_error());
    }
  }  
  if ($modus=="local") {
    changetolocal("");
  } else {
    //echo $synchost."=host-3-<br>";
    //echo $syncuser."=user<br>";
    //echo $syncpass."=pass<br>";
    //echo $remotedbname."=dbname<br>";
    changetoremote($synchost,$syncuser,$syncpass,$remotedbname);
  }
  echo "</td></tr>";
  
}
echo "</table>";

}

function do_directcompare($config,$table) {

  echo "<link rel='stylesheet' href='css/stylediff.css' type='text/css' media='screen' />";
//  echo "<h3>Directcompare<h3>";
  $config1 = $config['config1'];
  $config2 = $config['config2'];
  echo "<ul>";
  echo "<li>database -1- :".$config1['name']."</li>";
  echo "<li>database -2- :".$config2['name']."</li>";
  if ($table<>"") {
    echo "<li>table : ".$table."</li>";
  }	
  echo "</ul>";
  $result1 = DbDiff::export($config['config1'], $config['name']);
  if ($result1 == null) {
		echo_error('Couldn\'t connect to database: ' . mysql_error());
		return;
  }
  $schema1 = base64_encode(serialize($result1));

  $result2 = DbDiff::export($config['config2'], $config['name']);
  if ($result2 == null) {
		echo_error('Couldn\'t connect to database: ' . mysql_error());
		return;
  }
  $schema2 = base64_encode(serialize($result2));

  $unserialized_schema1 = unserialize(base64_decode($schema1));
  $unserialized_schema2 = unserialize(base64_decode($schema2));
	
  $results = DbDiff::compare($unserialized_schema1, $unserialized_schema2, $table);
  if (count($results) > 0) {
		
		echo '<h4>Found differences in ' . count($results) . ' table(s):</h4>';
		
		echo '<ul id="differences">';
		foreach ($results as $table_name => $differences) {
			
			echo '<li><strong>' . $table_name . '</strong><ul>';
			foreach ($differences as $difference) {
				echo '<li>' . $difference . '</li>';
			}
			echo '</ul></li>';
		}
		echo '</ul>';
		
  } else {
		echo '<p>No differences found.</p>';
  }
  
  
}

function do_directcreatescript($config,$table,$createdirect) {

  echo "<link rel='stylesheet' href='css/stylediff.css' type='text/css' media='screen' />";
  $config1 = $config['config1'];
  $config2 = $config['config2'];
  echo "<ul>";
  echo "<li>database -1- :".$config1['name']."</li>";
  echo "<li>database -2- :".$config2['name']."</li>";
  if ($table<>"") {
    echo "<li>table : ".$table."</li>";
  }	
  echo "</ul>";
  $result1 = DbDiff::export($config['config1'], $config['name']);
  if ($result1 == null) {
		echo_error('Couldn\'t connect to database: ' . mysql_error());
		return;
  }
  $schema1 = base64_encode(serialize($result1));

  $result2 = DbDiff::export($config['config2'], $config['name']);
  if ($result2 == null) {
		echo_error('Couldn\'t connect to database: ' . mysql_error());
		return;
  }
  $schema2 = base64_encode(serialize($result2));

  $unserialized_schema1 = unserialize(base64_decode($schema1));
  $unserialized_schema2 = unserialize(base64_decode($schema2));
	
  $results = DbDiff::createscript($unserialized_schema1, $unserialized_schema2, $table);
  if (count($results) > 0) {
     $host2=$config['config2']['host'];
     $user2=$config['config2']['user'];
     $pass2=$config['config2']['password'];
     $dbname2=$config['config2']['name'];
     $conn2 = mysql_connect($host2,$user2,$pass2) or die(mysql_error());
     $res2 = mysql_select_db($dbname2) or die(mysql_error());

     //echo '<textarea cols="100" rows="20" onclick="this.focus();this.select();">';
		foreach ($results as $table_name => $differences) {
			foreach ($differences as $difference) {
				echo $difference . '<br>';
				//echo $difference;
				if ($createdirect==1) {
              $resdiff = mysql_query($difference) or die(mysql_error());
            }  
				
			}
		}
	  //echo '</textarea>';
  } else {
		echo '<p>No differences found.</p>';
  }
  
  
}



function altertable($pararray,$remotehost,$remoteuser,$remotepass,$remotedbname,$dbalter,$createdirect) {
  include("../config.php");
  $dbtable=$pararray['dbtable'];	
  //echo "alter table ".$dbtable;
  $dbconfig = array(
	 array(
	 	'name' => 'dbwebportal database',
	 	'config1' => array(
	 		'host'		=> $gdbhost,
	 		'user'		=> $gdbuser,
	 		'password'	=> $gdbpass,
	 		'name'		=> $gdbname,
	 	),
	 	'config2' => array(
	 		'host'		=> $remotehost,
	 		'user'		=> $remoteuser,
	 		'password'	=> $remotepass,
	 		'name'		=> $remotedbname
		)
	 )
  );

  echo "<br>";
  if ($dbalter=="show") {
    do_directcompare($dbconfig[0],$dbtable);
  } else {   		
    do_directcreatescript($dbconfig[0],$dbtable,$createdirect);
  }  
}

function syncmysqlsend($remotepfad,$pararray,$dbname,$compid,$synchost,$syncuser,$syncpwd,$remotedbname) {
  include("mysqlsendfunc.php");
  $tblname=$pararray['dbtable'];
  $query = "SELECT * FROM tbldbsync WHERE fldtblname='$tblname' AND flddbname='$dbname' AND flddbsync='NEW' AND fldcompid=".$compid." ORDER BY fldindex";
  //echo $query."=query<br>";
  $result = mysql_query($query) or die(mysql_error());
  $num_rows = mysql_num_rows($result);

  echo "<div class='alert alert-success'>";
  echo "mysqlsend-Daten werden &Uumlbertragen. (database=".$dbname.", Anzahl=".$num_rows.")";
  echo "</div>";

  $qrycol = "SHOW COLUMNS FROM $dbname.$tblname";
  //echo $qrycol."<br>";
  $rescol = mysql_query($qrycol) or die(mysql_error());
  $lincol = mysql_fetch_array($rescol);
  $getcol = $lincol[0];
  $cntcol = 0;
  $arrlincol = array();
  while ($lincol = mysql_fetch_array($rescol)) {
    $cntcol++;
    $arrlincol[] = $lincol[0];
    if ($getcol == "") {
      $getcol = $lincol[0];
    } else {
      $getcol = $getcol . "," . $lincol[0];
    }       
  }

  while ($line = mysql_fetch_array($result)) {
//  	 echo $line[1]."=wert<br>";
    $tblname=$line['fldtblname'];
    $qryval = "SELECT ".$getcol." FROM ".$line['flddbname'].".".$line['fldtblname']." WHERE fldIndex=".$line['fldtblindex'];
//    echo $qryval."=qryval<br>";
    $resval = mysql_query($qryval) or die(mysql_error());
    $linval = mysql_fetch_array($resval);
    if (!$linval) {
      echo $line['fldtblindex'] . " ist leer (INSERT).".$finalstr;    
    } else {
      $val = "'".$linval[0]."'";
      for($count = 1; $count <= $cntcol; $count++) {
        $val = $val . ",'".$linval[$count]."'";
        $qry = "INSERT INTO tblaustausch (fldtablename,fldtype,fldcolumnname,fldwert) VALUES('".$line['fldtblname']."','','".$arrlincol[$count-1]."','".$linval[$count]."')";
        //echo $qry."=qry<br>";    
      }

      echo "-----<br>"; 
    } 
  mysqlsend($remotepfad,$synchost,$syncuser,$syncpwd,$remotedbname,$tblname,"INSERT",$qry,"J");

  }	
}

function syncausfuehren($menu,$pararray) {
  include("../config.php");
  $count = $_POST['count'];
  $cnt=0;
  if ($count>0) {
    for($zaehl = 1; $zaehl <= $count; $zaehl++)
    {
      $idcheck = $_POST['check'.$zaehl];
      if ($idcheck==1) {
	     $cnt=$cnt+1;
        $idwert = $_POST['idwert'.$zaehl];
        $query = "SELECT * FROM tblcomputer WHERE fldIndex=".$idwert;
        $result = mysql_query($query) or die(mysql_error()." ".$query);
        $line = mysql_fetch_array($result);
        $dbname=$gdbname;
        $remotedbname=$line['flddbname'];
        $remoteuser=$line['fldusername'];
        $remotepass=$line['fldpassword'];
        $remotedbname=$line['flddbname'];  
        $remotepfad=$line['fldremotepfad'];
        if ($remotedbname=="") {
          $remotedbname=$gdbname;
        }
        $synchost=$line['fldIPAddr'];
  //      echo $_POST['checklocal']."=checklocal<br>";
  //      echo $_POST['checkremote']."=checkremote<br>";
  //      echo $_POST['checkalter']."=checkalter<br>";
        $checkmysqlsend=$_POST['checkmysqlsend'];
        if ($_POST['checklocal']==1) {
          synctable("local", $synchost,$remoteuser,$remotepass,$dbname,$remotedbname,$pararray,$idwert,$checkmysqlsend,"J");
        }
        if ($_POST['checkremote']==1) {
          synctable("remote",$synchost,$remoteuser,$remotepass,$dbname,$remotedbname,$pararray,$idwert,$checkmysqlsend,"N");
        }
        if ($_POST['checkaltertable']==1) {
          altertable($pararray,$synchost,$remoteuser,$remotepass,$remotedbname,"alter",$_POST['checkupdatedirect']);            
        }
        if ($_POST['checkshowtable']==1) {
          altertable($pararray,$synchost,$remoteuser,$remotepass,$remotedbname,"show",0);            
        }
        if ($_POST['checkmysqlsend']==1) {
        	 syncmysqlsend($remotepfad,$pararray,$dbname,$idwert,$synchost,$remoteuser,$remotepass,$remotedbname);
        }
      }
    }
  }
}

function syncauswahl($menu,$menuid) {
  echo "<form name='eingabe' class='form-horizontal' method='post' action='sync.php?sync=1&menu=".$menu."&menuid=".$menuid."'>";
  echo "<fieldset>";
  echo "<div class='control-group'>";

  echo "<input type='checkbox' name='checklocal' value='1'> local ";
  echo "<input type='checkbox' name='checkremote' value='1'> remote ";
  echo "<input type='checkbox' name='checkaltertable' value='1' > alter table ";
  echo "<input type='checkbox' name='checkshowtable' value='1' > show table ";
  echo "<input type='checkbox' name='checkupdatedirect' value='1' > direct update ";
  echo "<input type='checkbox' name='checkmysqlsend' value='1' > mit mysqlsend ";
  echo "<input type='checkbox' name='checkmysqlget' value='1' > mit mysqlget<br>";
  echo "<br>";
  echo "<table class='table table-hover'>";
  echo "<thead>";
  echo "<th> </th>";
  echo "<th>Hostname</th>";
  echo "<th>IP-Adresse</th>";
  echo "</thead>";
  $query = "SELECT * FROM tblcomputer WHERE fldaktiv='J' AND fldlocal<>'J'";
  $result = mysql_query($query);
  $cnt=0;
  while ($line = mysql_fetch_array($result)) {
    $cnt=$cnt+1;
    $IPAddr=$line[fldIPAddr];
//    if ($IPAddr<>"localhost") {
      echo "<tr>";
      echo "<input type='hidden' name='idwert".$cnt."' value=".$line[fldIndex].">";
      echo "<td><input type='checkbox' name='check".$cnt."' value='1'></td>";
      echo "<td>".$line[fldHost]."</td>";
      echo "<td>".$IPAddr."</td>";
      echo "</tr>";
//    }  
  }  
  echo "</table>";

  echo "<input type='hidden' name='count' value=".$cnt."/>";
  echo "  <div class='form-actions'>";
  echo "     <button type='submit' name='submit' class='btn btn-primary'>OK</button>";
  echo "     <button class='btn'>Abbruch</button>";
  echo "  </div>";
  echo "</div>";
  echo "</fieldset>";
  echo "</form>";
}

function syncchecktrigger($pararray) {
  $query = "SHOW TRIGGERS like '".$pararray['dbtable']."%'";
  $result = mysql_query($query);
  $num_rows = mysql_num_rows($result);
  if ($num_rows!=3) {
  }
}

function synccheck($modus,$pararray,$menu) {

  if ($modus=="local") {
    changetolocal();
  } else {
    changetoremote();
  }
  //echo "table=".$pararray['dbtable']."<br>";
  $query = "SHOW TRIGGERS like '".$pararray['dbtable']."%'";
  $result = mysql_query($query);
  $num_rows = mysql_num_rows($result);
  //echo $num_rows."=anz (".$modus.")<br>";
  if ($num_rows!=3) {
    echo "<div class='alert'>";
    echo "Keine Trigger in ".$modus." Datenbank vorhanden! Jetzt anlegen?";
    echo "</div>";
    echo "<form name='eingabe' class='form-horizontal' method='post' action='sync.php?sync=1&modus=".$modus."&menu=".$menu."'>";
    echo "  <div class='form-actions'>";
    echo "     <button type='submit' name='submit' class='btn btn-primary'>OK</button>";
    echo "     <button class='btn'>Abbruch</button>";
    echo "  </div>";
    echo "</form>";
    
  } else {
    $query = "SELECT * FROM tbldbsync WHERE fldtblname = '".$pararray['dbtable']."' AND flddbsync='NEW'";
    $result = mysql_query($query);
    $num_rows = mysql_num_rows($result);
    //echo $num_rows."=anz<br>";
    if ($num_rows>0) {
      echo "<div class='alert alert-success'>";
      echo $modus." Daten werden übertragen.";
      echo "</div>";
      synctable($modus,$dbname,$pararray);
    } else {
      echo "<div class='alert alert-info'>";
      echo "Keine ".$modus." Daten vorhanden!";
      echo "</div>";
    }
  }
}

?>