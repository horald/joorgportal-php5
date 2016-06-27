<?php
$listarray = array ( array ( 'label' => 'Bezeichnung',
                             'name' => 'bez', 
                             'width' => 100, 
                             'type' => 'text',
                             'dbfield' => 'fldBez' ),
                     array ( 'label' => 'Tage',
                             'name' => 'tage', 
                             'width' => 100, 
                             'type' => 'text',
                             'dbfield' => 'fldTage' ));

$pararray = array ( 'headline' => 'Häufigkeit',
                    'dbtable' => 'tblhaeufigkeit',
                    'orderby' => '',
                    'strwhere' => '',
                    'fldindex' => 'fldIndex');
?>