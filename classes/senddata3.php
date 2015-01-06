<?php
  session_start();
  echo "senddata<br>";
  include("../config.php");
  $dbselarr = $_SESSION['DBSELARR'];
  $count=sizeof($dbselarr);
  echo $count."=count<br>";
?>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8"/>

</head>
<body>
<form action="sendto.html" method="get" >

<?php
  for ( $x = 0; $x < $count; $x++ ) {
    $query="SELECT * FROM tblEinkauf_liste WHERE fldindex=".$dbselarr[$x]." ORDER BY fldOrt, fldAbteilung, fldSort, fldBez";	
    $result = mysql_query($query) or die(mysql_error().$query);
    $line = mysql_fetch_array($result);
?>

<input name="daten[<?php echo $x; ?>].'fldBez'" value="<?php echo $line['fldBez']; ?>" /> <br>
<input name="daten[<?php echo $x; ?>].'fldOrt'" value="<?php echo $line['fldOrt']; ?>" /> <br>

<?php
  }
?>
<input type="submit" value="senden"/>

</form>

</body>
</html>