<?php
$listarray = array ( array ( 'label' => 'Benutzer',
                             'name' => 'benutzer',
                             'width' => 50, 
                             'type' => 'selectid',
                             'dbtable' => 'tblbenutzer',
                             'seldbfield' => 'fldbez',
                             'seldbindex' => 'fldindex',
                             'dbfield' => 'fldid_benutzer' ),
                     array ( 'label' => 'Farbe',
                             'name' => 'farbe',
                             'width' => 50, 
                             'type' => 'text',
                             'dbfield' => 'fldfarbe' ),
                     array ( 'label' => 'Farbe WE',
                             'name' => 'farbewe',
                             'width' => 50, 
                             'type' => 'text',
                             'dbfield' => 'fldfarbeWE' ));


$pararray = array ( 'headline' => 'Aufgabenbenutzer',
                    'dbtable' => 'tblaufgabenbenutzer',
                    'orderby' => '',
                    'strwhere' => '',
                    'fldindex' => 'fldindex');
?>