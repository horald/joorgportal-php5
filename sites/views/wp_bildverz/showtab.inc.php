<?php
$listarray = array ( array ( 'label' => 'Verzeichnis',
                             'name' => 'verz',
                             'width' => 100, 
                             'type' => 'text',
                             'dbfield' => 'fldverz' ),
                     array ( 'label' => 'Bild',
                             'name' => 'bild', 
                             'width' => 20, 
                             'type' => 'blob',
                             'dbfield' => 'fldbild' ));

$pararray = array ( 'headline' => 'Bildverzeichnis',
                    'dbtable' => 'tblbildverz',
                    'orderby' => '',
                    'strwhere' => '',
                    'fldindex' => 'fldindex');
?>