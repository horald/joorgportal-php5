<?php

function verbrauchholen() {
  echo "<a href='verbrauch.php' class='btn btn-primary btn-sm active' role='button'>zurück</a><br><br> ";

  $_url = "http://datapass.de/?d=1";
  //$_buffer = implode('', file($_url));
  //echo $_buffer; 
  $homepage = file_get_contents($_url);
  echo $homepage; 

}

?>