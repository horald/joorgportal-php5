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
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
	<title>Form Test</title>
        <!-- Bootstrap -->
        <link href="../includes/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <script type="text/javascript" src="js/get.js"></script>
</head>

<body>
<a href="einkaufsliste.html" class="btn btn-primary btn-sm active" role="button">Zurück</a> 
<form id="updateForm" class="form-horizontal" action="senddata.html">
        <script type="text/javascript">
          var einkaufsliste = JSON.parse(localStorage.getItem("einkaufsliste"));
          var AnzDaten = einkaufsliste.daten.length;
          var zaehl=0;

<?php
  for ( $x = 0; $x < $count; $x++ ) {
    $query="SELECT * FROM tblEinkauf_liste WHERE fldindex=".$dbselarr[$x]." ORDER BY fldOrt, fldAbteilung, fldSort, fldBez";	
    $result = mysql_query($query) or die(mysql_error().$query);
    $line = mysql_fetch_array($result);
?>

            var strVar="daten["+zaehl.toString()+"].fldBez"; 
            document.write('<input type="hidden" name="'+strVar+'"   value="<?php echo $line['fldBez']; ?>"/>');
            var strVar="daten["+zaehl.toString()+"].fldOrt"; 
            document.write('<input type="hidden" name="'+strVar+'"   value="<?php echo $line['fldOrt']; ?>"/>');
            var strVar="daten["+zaehl.toString()+"].fldAnz"; 
            document.write('<input type="hidden" name="'+strVar+'"   value="<?php echo $line['fldAnz']; ?>"/>');
            var strVar="daten["+zaehl.toString()+"].fldPreis"; 
            document.write('<input type="hidden" name="'+strVar+'"   value="<?php echo $line['fldPreis']; ?>"/>');
            zaehl=zaehl+1;
<?php
  }
?>

        </script>

	<dl>
		<dt></dt>
		<dd><input type="submit" value="Anzeigen" /></dd>
	</dl>
</form>

<pre><code id="showdata">
</code></pre>

<script type="text/javascript" src="js/form2object.js"></script>
<script type="text/javascript" src="js/json2.js"></script>
<script type="text/javascript">
	function updatefunc()
	{
		var einkaufsliste = form2object('updateForm', '.', true,
				function(node)
				{
					if (node.id && node.id.match(/callbackTest/))
					{
						return { name: node.id, value: node.innerHTML };
					}
				});

                localStorage.setItem('einkaufsliste', JSON.stringify(einkaufsliste));
		document.getElementById('showdata').innerHTML = JSON.stringify(einkaufsliste, null, '\t');
	}
</script>
</body>
</html>