<?php
session_start();
$sprache = isset($_POST['sprache']) ? $_POST['sprache'] : 'english';

include "language/lang_".$sprache.".php";

function db_connect() {
	$conn = mysql_connect($_SESSION['dbhost'], $_SESSION['dbuser'], $_SESSION['dbpass']);
	return $conn;
}

$db_file="config.php";
echo "<table cellpadding=4 cellspacing=4 bgcolor=#DDEEDD width=400 height=300><tr valign=top><td>";
if (isset($_REQUEST['step'])) {
  echo "<b>Step " . $_REQUEST['step'] . "</b><br>";
  switch ($_REQUEST['step']) {
    case 1:
    if (isset($_REQUEST['dbcred'])) {
      $_SESSION['dbhost'] = $_REQUEST['dbhost'];
      $_SESSION['dbname'] = $_REQUEST['dbname'];
      $_SESSION['dbuser'] = $_REQUEST['dbuser'];
      $_SESSION['dbpass'] = $_REQUEST['dbpass'];
      echo "verify account: ";
      if (!db_connect()) {
        echo "wrong. Please correct.";
	     exit;
      }
      echo "OK<br>";
      $file_size = filesize($db_file);
      if ($file_size != '0' || ((mysql_query("USE ".$_SESSION['dbname'])))) {
        echo "<br>Installation alread complete.<br> Please <a href=uninstall.php>uninstall</a> all.</i>";
        exit();
      }
      echo "</td></tr><tr><td align=right>";
      echo "<input type=button value=Next onclick=\"window.location.href='?step=2'\">";
    } else {
      echo "Account for database administrator:<p>";
      echo "<form method=post action=".$_SERVER['PHP_SELF']."?step=1>";
      echo "<tab>"; 
      echo "<tr><td>Host:</td><td><input type=text size=12 name=dbhost value='localhost'></td></tr>";
      echo "<tr><td>Database:</td><td><input type=text size=12 name=dbname value='dbJoorgportal'></td></tr>";
      echo "<tr><td>User:</td><td><input type=text size=12 name=dbuser value='root'></td></tr>";
      echo "<tr><td>Password:</td><td><input type=password size=12 name=dbpass></td></tr>";
      echo "<tr><td align=right>";
      echo "<input type=submit name=dbcred value=Next>";
      echo "</td></tr>";
      echo "</tab>";
      echo "</form>";
    }
    break;
    case 2:

      $conf = "\$dbhost=\"".$_SESSION['dbhost']."\";\r\n";
      $conf = $conf."\$dbuser=\"".$_SESSION['dbuser']."\";\r\n";
      $conf = $conf."\$dbpass=\"".$_SESSION['dbpass']."\";\r\n";         
      $conf = $conf."\$dbname=\"".$_SESSION['dbname']."\";\r\n";
      $conf = $conf."\$res = mysql_connect(\$dbhost,\$dbuser,\$dbpass) or die(mysql_error());\r\n";
      $conf = $conf."\$res = mysql_select_db(\$dbname) or die(mysql_error());\r\n";

	  $content = "<?php\r\n";
      $content = $content.$conf."?>";         

      if (!is_writable($db_file)) {
	     echo "Database file ".$db_file." not writeable. Please modify perms to 777.<br>";
         echo "<a href='index.php'>Restart</a><br>";
		 echo "Or modify the sample file 'config_sample.php' and rename it to the database file.<br>";
	     //exit;
      } else {
        $handle = fopen($db_file,'w');
        if (fwrite($handle,$content)) {
          echo "write successfully.<br>";
        } else {
          echo "$db_file not created!<br>";
          exit;
        }
        fclose($handle);
      }

      $conn = mysql_connect($_SESSION['dbhost'], $_SESSION['dbuser'], $_SESSION['dbpass']) or die('Could not connect: ' . mysql_error());
      $sql = "CREATE Database ".$_SESSION['dbname'];
      $retval = mysql_query( $sql, $conn ) or die('Could not create database: ' . mysql_error());
      echo "<br>Database ".$_SESSION['dbname']." created successfully.<br>";      
      
      echo "</td></tr><tr><td align=right>";
      echo "<input type=button value=Next onclick=\"window.location.href='?step=3'\">";
    break;
    case 3:
	  echo "dbhost:".$_SESSION['dbhost']."<br>";
//      mysql_connect($_SESSION['dbhost'],$_SESSION['dbuser'],$_SESSION['dbpass']);
//      if ( mysql_create_db ( $_SESSION['dbname'] ) ) {
//        echo 'Datenbank ' . $_SESSION['dbname'] . ' wurde erstellt!<br>';
//      } else {
//        echo 'Datenbank ' . $_SESSION['dbname'] . ' konnte NICHT erstellt werden!<br>';
//        echo "<a href='index.php'>Restart</><br>";
//        echo "<a href='install.php?step=3'>Try again</><br>";
//        exit;
//      }    
      mysql_connect($_SESSION['dbhost'],$_SESSION['dbuser'],$_SESSION['dbpass']);
      mysql_select_db($_SESSION['dbname']);
      $lines = file('install.sql');
      $newquery="";
      $remark='false';
      $cntlin=0;
      foreach ($lines as $line_num => $query) {
      	$cntlin=$cntlin+1;
         //echo "query:".$query.",remark=".$remark.",".substr(rtrim($query),-3)."<br>";
      	if ($remark=='false') {
           if (trim($query)=="" || substr($query,0,2)=="--" || substr($query,0,2)=="/*") {
           } else {
             $newquery=$newquery.$query;
             //echo $query."<br>";
             if (substr(trim($query),-1)==";") {
               //echo "query:".$newquery."<br>";
               $result = @mysql_query($newquery) or die(mysql_error().",cntlin=".$cntlin);
               $newquery=""; 
             }
           }   
         }
      	if (substr(ltrim($query),0,2)=="/*") {
      	  $remark='true';	
      	}
      	if (substr(rtrim($query),-3)=="*/;") {
      	  $remark='false';	
      	}
      	if (substr(rtrim($query),-2)=="*/") {
      	  $remark='false';	
         }
      }
      echo "Database successful created.<br>";
      echo "<input type=button value=Next onclick=\"window.location.href='?step=final'\">";
    break; 
    case "final":
      session_destroy();
      echo "Installation completed.<br>";
      echo "<a href='index.php'>Finished</>";
    break;
  }
} else {
  echo $txtinstall1."<br>";
//  echo $txtinstall2."<br>";
//  echo $txtinstall3."<br>";
//  echo $txtinstall4."<br>";
  echo "</td></tr><tr><td align=right>";
  echo "<input type=button value='".$txtnext."' onclick=\"window.location.href='?step=1'\">";
}
echo "</td></tr></table>";
?>