<?php

function scan_dir($dir, $type=array(),$only=FALSE, $allFiles=FALSE, 
       $recursive=TRUE, $onlyDir="", &$pictures) {

    $handle = @opendir($dir);
    
    if(!$handle)
        return false;
    
    while ($file = @readdir ($handle)) {
        if (eregi("^\.{1,2}$",$file)) {
            continue;
        }
        
        if(!$recursive && $dir != $dir.$file."/") {
            if(is_dir($dir.$file))
                continue;
        }
        
        if(is_dir($dir.$file)) {
            scan_dir($dir.$file."/", $type, $only, $allFiles, $recursive, $file, $pictures);
        } else {
            if($only)
                $onlyDir = $dir;
            $pictures = buildArray($dir,$file,$onlyDir,$type,$allFiles,$pictures);
        }
    }

    @closedir($handle);

    return $pictures;
  
}

function buildArray($dir,$file,$onlyDir,$type,$allFiles,$pictures) {
    $typeFormat = FALSE;
            
    foreach ($type as $item) {
      if (strtolower($item) == substr(strtolower($file), -strlen($item)))
            $typeFormat = TRUE;
    }

    if($allFiles || $typeFormat == TRUE) {
        if(empty($onlyDir))
            $onlyDir = substr($dir, -strlen($dir), -1);

        $pictures[$dir]['name']['dir']    = $onlyDir;
        $pictures[$dir]['name']['path']    = $dir;
        $pictures[$dir][$file]['file']    = $file;
        $pictures[$dir][$file]['size']    = filesize($dir.$file) / 1024;
        $pictures[$dir][$file]['time']    = filemtime($dir.$file);
    }
    
    return $pictures;
}

function buildSites($pictures) {
   reset ($pictures);
    
   $ausgabe .= '<div id="navBar">' . "\n";
   $ausgabe .= '    <div id="sectionLinks">' . "\n";
   foreach($pictures as $key => $array) {
      $ausgabe .= '        <h3>'.$pictures[$key]['name']['dir'].'</h3>' . "\n";
      $ausgabe .= '        <ul>' . "\n";
      foreach ($array as $key2 => $array1) {
        
         if(!empty($pictures[$key][$key2]['file'])){
            $size     =    number_format($pictures[$key][$key2]['size'], 1, ',', '.');
            $date     =    date("d.m.Y, H:i:s", $pictures[$key][$key2]['time']);
            $alt      =    'Datum: ' . $date . ' / Größe: ' . $size . 'KB'; 
            $path     = $pictures[$key]['name']['path'].$pictures[$key][$key2]['file'];
            $ausgabe .= '            <li><a href="'.$path.'" target="_blank" title="'.$alt.'">';
            $ausgabe .= $pictures[$key][$key2]['file'];
            $ausgabe .= '</a></li>' . "\n"; 
         }

      }
      $ausgabe .= '        </ul>' . "\n";
   }
    
   $ausgabe .= '    </div>' . "\n";
   $ausgabe .= '</div>' . "\n";
    
   return $ausgabe;
} 

?>