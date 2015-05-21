<?php
$listarray = array ( array ( 'label' => 'Aufgabe',
                             'name' => 'bez', 
                             'width' => 100, 
                             'type' => 'text',
                             'dbfield' => 'fldbez' ),
                     array ( 'label' => 'Beschreibung',
                             'name' => 'beztxt', 
                             'width' => 100, 
                             'type' => 'textarea',
                             'dbfield' => 'fldtext' ));

$pararray = array ( 'headline' => 'Aufgaben',
                    'dbtable' => 'tblaufgabenliste',
                    'orderby' => 'fldbez',
                    'strwhere' => '',
                    'fldindex' => 'fldindex');

?>