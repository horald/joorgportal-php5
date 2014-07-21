<?php
$listarray = array ( array ( 'label' => 'Bezeichnung',
                             'name' => 'bez', 
                             'width' => 100, 
                             'type' => 'text',
                             'dbfield' => 'fldbez' ),
                     array ( 'label' => 'Farbe',
                             'name' => 'farbe', 
                             'width' => 100, 
                             'type' => 'text',
                             'dbfield' => 'fldfarbe' ));

$pararray = array ( 'headline' => 'Instrument',
                    'dbtable' => 'tblinstrument',
                    'orderby' => '',
                    'strwhere' => '',
                    'fldindex' => 'fldindex');
?>