<?php

function dirauslesen($pfad) {

$alledateien = scandir($pfad); //Ordner "files" auslesen
 
foreach ($alledateien as $datei) { // Ausgabeschleife
   $dateiinfo = pathinfo($pfad."/".$datei); 
   if ($datei != "." && $datei != ".."  ) {
   	//echo $pfad.'/'.$dateiinfo['basename']."<br>";
   	if (is_dir($pfad.'/'.$dateiinfo['basename'])) { 
   	  //echo $datei."=verz<br />";
   	  dirauslesen($pfad.'/'.$dateiinfo['basename']);
   	} else {
   	  if ($dateiinfo['extension']==="odt") {		
          $zeit = filectime ( $pfad.'/'.$datei );
	       echo $pfad.'/'.$datei." - ".gmdate ( 'Y-m-d H:i:s', $zeit )."<br />"; //Ausgabe Einzeldatei
	       $query="REPLACE INTO tbldocman_brfverkehr (fldbez, fldversendet, fldantwdat, fldan_ind, fldstatus, fldfilename, fldparent) VALUES ('".$dateiinfo['filename']."','".gmdate ( 'Y-m-d H:i:s', $zeit )."','0000-00-00',0,'','".$pfad.'/'.$datei."',1)";
          $result = mysql_query($query) or die(mysql_error()." ".$query);
	       //echo $query."=query<br>";
	     }
	   }  
	}   
}; 

}

function getdocausfuehren() {

  dirauslesen("/home/horald/daten");

}

function getdocauswahl($menu,$idwert) {
  echo "<form class='form-horizontal' method='post' action='getdocs.php?menu=".$menu."&idwert=".$idwert."&getdoc=1'>";
  echo "<fieldset>";
  echo "<div class='control-group'>";


//  <div style="position:relative;">
//		<a class='btn' href='javascript:;'>
//			Choose File...
//			<input type="file" style='position:absolute;z-index:2;top:0;left:0;filter: alpha(opacity=0);-ms-filter:"progid:DXImageTransform.Microsoft.Alpha(Opacity=0)";opacity:0;background-color:transparent;color:transparent;' name="file_source" size="40"  onchange='$("#upload-file-info").html($(this).val());'>
//		</a>
//		&nbsp;
//      <input id="upload-file-info" type="text" placeholder="(Pfad)">
//	</div>
?>

  <div class="input-append">
    <span class="btn btn-file">
      <input type="path" name="datei" />
    </span>
  </div>

<?php
//<div class="fileupload fileupload-new" data-provides="fileupload">
//  <div class="input-append">
//    <div class="uneditable-input span3">
//    <i class="icon-file fileupload-exists"></i> 
//    <span class="fileupload-preview"></span>
//    </div>
//    <span class="btn btn-file">
//      <span class="fileupload-new">Select file</span>
//      <span class="fileupload-exists">Change</span>
//      <input type="file" />
//    </span>
//    <a href="#" class="btn fileupload-exists" data-dismiss="fileupload">Remove</a>
//  </div>
//</div>


//      <input class='label label-info' id="upload-file-info" type="text" placeholder="(Pfad)">
  echo "  <div class='form-actions'>";
  echo "     <button type='submit' name='submit' class='btn btn-primary'>OK</button>";
  echo "     <button class='btn'>Abbruch</button>";
  echo "  </div>";
  echo "</div>";
  echo "</fieldset>";
  echo "</form>";
  
}

?>