<?php
//include("../config.php");

function translate($name,$bez,$langshort) {
  /*	
  if ($langshort=="") {
    echo $langshort."=langshort translate2<br>";
  }
  $query = "SELECT * FROM tbltranslate WHERE fldLang='".$langshort."' AND fldName='".$name."'";
  $result = mysql_query($query) or die(mysql_error());
  if ($line = mysql_fetch_array($result)) {
    $bez=$line['fldBez'];
  }
  */
  return $bez;
}
?>