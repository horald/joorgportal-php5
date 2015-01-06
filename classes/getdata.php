<?php
  echo "getdata";

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
<form id="updateForm" class="form-horizontal" action="javascript:updatefunc()">
        <script type="text/javascript">
          var einkaufsliste = JSON.parse(localStorage.getItem("einkaufsliste"));
          var AnzDaten = einkaufsliste.daten.length;
          var zaehl=0;
          einkaufsliste.daten.forEach(function(entry) {
            var strVar="daten["+zaehl.toString()+"].fldBez"; 
            document.write('<input type="hidden" name="'+strVar+'"   value="'+entry.fldBez+'"/>');
            var strVar="daten["+zaehl.toString()+"].fldOrt"; 
            document.write('<input type="hidden" name="'+strVar+'"   value="'+entry.fldOrt+'"/>');
            var strVar="daten["+zaehl.toString()+"].fldAnz"; 
            document.write('<input type="hidden" name="'+strVar+'"   value="'+entry.fldAnz+'"/>');
            var strVar="daten["+zaehl.toString()+"].fldPreis"; 
            document.write('<input type="hidden" name="'+strVar+'"   value="'+entry.fldPreis+'"/>');
            zaehl=zaehl+1;
          });


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