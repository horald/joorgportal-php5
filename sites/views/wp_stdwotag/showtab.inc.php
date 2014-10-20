<?php
$listarray = array ( array ( 'label' => 'Spalte',
                             'name' => 'spalte', 
                             'width' => 10, 
                             'type' => 'text',
                             'dbfield' => 'fldspalte' ),
                     array ( 'label' => 'Bezeichnung',
                             'name' => 'bez', 
                             'width' => 100, 
                             'type' => 'text',
                             'dbfield' => 'fldbez' ),
                     array ( 'label' => 'Farbe',
                             'name' => 'farbe', 
                             'width' => 100, 
                             'type' => 'text',
                             'dbfield' => 'fldfarbe' ));

$pararray = array ( 'headline' => 'Wochentag',
                    'dbtable' => 'tblstdwotag',
                    'orderby' => 'fldspalte',
                    'strwhere' => '',
                    'fldindex' => 'fldindex');
?>