<?php
  session_start();
  echo "senddata<br>";
  include("../config.php");
  $dbselarr = $_SESSION['DBSELARR'];
  $count=sizeof($dbselarr);
  echo $count."=count<br>";
  $ipaddr="10.37.84.119";
  echo $ipaddr."=ipaddr<br>";
?>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8"/>
<title>Wertuebergabe mittels window.name - Sendendes Dokument</title>
</head>
<body>
<script type="text/javascript" src="http://<?php echo $ipaddr; ?>:8080/own/joorgportal/classes/storage.js"></script>
<script type="text/javascript">
function sichern (uebergabe,anz) {
	//storage.set("uebergabe", uebergabe);
        var arr = uebergabe.split(',');
        var zaehl=0;
        for (var i = 0; i <= anz; i=i+2) {
          zaehl++;
	  storage.set("fldBez"+zaehl, arr[i]);
	  storage.set("fldOrt"+zaehl, arr[i+1]);
        }
	location.href = "http://<?php echo $ipaddr; ?>:8080/own/joorgportal/classes/empfangen.html";
}
</script>
<?php
  $arr = array();
  for ( $x = 0; $x < $count; $x++ ) {
    $query="SELECT * FROM tblEinkauf_liste WHERE fldindex=".$dbselarr[$x]." ORDER BY fldOrt, fldAbteilung, fldSort, fldBez";	
    $result = mysql_query($query) or die(mysql_error().$query);
    $line = mysql_fetch_array($result);
    $arr[]=$line['fldBez'];
    $arr[]=$line['fldOrt'];
  }
$uebarr=implode(",", $arr);
?>
Uebergabe<br>
<form name="formular" action="" onsubmit="sichern('<?php echo $uebarr; ?>',<?php echo $count; ?>); return false;">

  <p><input type="submit" value="Senden"></p>
</form>

</body>
</html>