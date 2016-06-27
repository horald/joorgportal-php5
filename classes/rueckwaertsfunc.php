<?php
//header("content-type: text/html; charset=utf-8");
//header("content-type: text/html; charset=iso-8859-1");

function auswahl($menue) {
  echo "<form method='post' action='rueckwaerts.php?menue=".$menue."&rueckwaerts=1'>";
  echo "<textarea id='text' name='text' cols='35' rows='4'></textarea><br>";
  echo "<input type='checkbox' name='verstecken' checked> verstecken";
  echo "  <div class='form-actions'>";
  echo "     <button type='submit' name='submit' class='btn btn-primary'> Rückwärts </button>";
//  echo "     <button class='btn'>Abbruch</button>";
  echo "  </div>";
  echo "</form>";
  
}

function rueckwaerts($menue) {
  $text=$_POST['text'];
  $orgtext=$text;	
  $von   = array('ä', 'ö','ü','Ä','Ö','Ü','ß');
  $dch   = array('#ae#', '#oe#','#ue#','#Ae#','#Oe#','#Ue#','#ss#');
  $text  = str_replace($von, $dch, $text);  
  $count=strlen($text);
  $rueck="";
  for ( $x = 0; $x <= $count; $x++ ) {
  	 $rueck=$rueck.substr($text,$count-$x,1);
  }	
  $von   = array('#ea#', '#eo#','#eu#','#eA#','#eO#','#eU#','#ss#');
  $dch   = array('ä', 'ö','ü','Ä','Ö','Ü','ß');
  $rueck  = str_replace($von, $dch, $rueck);  
  echo "<a class='btn btn-primary' href='rueckwaerts.php?menue=".$menue."'>Nochmal</a><br>";
  $verstecken=$_POST['verstecken'];
  if ($verstecken==false) {
    echo "<textarea cols='35' rows='4'>"; 
    echo $orgtext;
    echo "</textarea>"; 
  }
  echo "<form method='post' action='rueckwaerts.php?menue=".$menue."&rueckwaerts=1'>";
  echo "<textarea id='text' name='text' cols='35' rows='4'>";
  echo $rueck;
  echo "</textarea>"; 
  echo "  <div class='form-actions'>";
  echo "     <button type='submit' name='submit' class='btn btn-primary'> Rückwärts </button>";
  echo "  </div>";
  echo "</form>";
}

?>