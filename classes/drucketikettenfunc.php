<?php

function etikettenauswahl($menu,$idwert) {
  echo "<form class='form-horizontal' method='post' action='drucketiketten.php?menu=".$menu."&idwert=".$idwert."&etiketten=1'>";
  echo "<fieldset>";
  echo "<div class='control-group'>";

  echo "<input type='hidden' name='count' value=".$cnt."/>";
  echo "  <div class='form-actions'>";
  echo "     <button type='submit' name='submit' class='btn btn-primary'>OK</button>";
  echo "     <button class='btn'>Abbruch</button>";
  echo "  </div>";
  echo "</div>";
  echo "</fieldset>";
  echo "</form>";

}

function etikettenkopf() {
  echo "<head>"; 
  echo "<style>";
  echo "@page { margin: 12mm 0; }";
  //echo "table, td, th { border: 1px solid black; }";
  //echo "td, th { border: 1px solid black; }";
  //echo "table { border-spacing: 2.54mm 0; }";
  echo "table { border-spacing: 3mm 0; }";
  echo "td, th {width: 63.5mm; height: 29.63mm; text-align:center; vertical-align:middle;}";
  echo "</style>"; 
  echo "</head>";
}

function etikettendrucken() {
  $query="SELECT * FROM tblgrperl WHERE fldbez='Etikett'";
  //echo $query."<br>";
  $result = mysql_query($query) or die(mysql_error());
  $line = mysql_fetch_array($result);
  $idetikett=$line['fldindex'];
  //echo $idetikett."<br>";
  $query="SELECT * FROM tbletiketten";
  $result = mysql_query($query) or die(mysql_error());
  $line = mysql_fetch_array($result);
  //echo $line['fldanzsp'].",".$line['fldanzzl'];  
  echo "<table>";
  $nr=0;
  for($zaehl = 1; $zaehl <= $line['fldanzzl']; $zaehl++) {
  	 echo "<tr>";
    for($zaehlsp = 1; $zaehlsp <= $line['fldanzsp']; $zaehlsp++) {
    	 //echo "<td>ARTIKEL-NUMMER<img src='http://localhost/tools/phpqrcode/temp/QRd9b6a6e259ca048c15e58ae931e8ed2c.png' alt='Bild'></td>";
    	 $nr=$nr+1;
       $qrynotiz="SELECT * FROM tblnotiz WHERE fldid_gruppe=".$idetikett." AND fldnr='".$nr."'";
       //echo $qrynotiz."<br>";
       $resnotiz = mysql_query($qrynotiz) or die(mysql_error());
       if ($linnotiz = mysql_fetch_array($resnotiz)) {
           //$jpgbild="marmelade.jpg";
           $jpgbild="kamele.jpg";
    	   echo "<td style='background-image:url(http://localhost/daten/images/".$jpgbild.");background-repeat: no-repeat;background-position: center;'><elem style='padding-left:25px;'>".$linnotiz['fldbez']."</elem></td>";
    	   //echo "<td style='background-repeat: no-repeat;background-position: center;'>".$linnotiz['fldbez']."</td>";
       } else {
    	   //echo "<td>".$nr."</td>";
    	   echo "<td> </td>";
    	 }  
    }	 
  	 echo "</tr>";
  }  
  echo "</table>";
}

?>