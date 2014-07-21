<?php

	require('main.php');
   include("../../config.php");

    session_start();

    if (!isset($_SESSION['uid'])) {
       $_SESSION['uid'] = $_REQUEST['uid'];
       $_SESSION['pwd'] = $_REQUEST['pwd'];
    }

    $uid = $_SESSION['uid'];
    $pwd = $_SESSION['pwd'];

  $qrylogin=sprintf("SELECT * FROM tblbenutzer WHERE fldbez='%s' AND fldpwd='%s' and fldstatus='%s'",$uid,$pwd,'active');
  //echo $qrylogin."<br>"; 

   $res = mysql_query($qrylogin) or die("Error using mysql_query($sql): ".mysql_error()." query:".$qrylogin);
	$lin = mysql_fetch_array($res);
	//echo mysql_num_rows($res)."=anz<br>";
    if(mysql_num_rows($res) <> 0) {
    	echo "Benutzer >".$uid."< wurde angemeldet.<br>";
    } else {
      echo "Anmeldung fehlgeschlagen.<br>";
      unset($_SESSION['uid']);
      unset($_SESSION['pwd']);
    }  

?>