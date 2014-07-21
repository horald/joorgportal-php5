<?php
$listarray = array ( array ( 'label' => 'Datum',
                             'name' => 'datum', 
                             'width' => 100, 
                             'type' => 'date',
                             'default' => 'today',
                             'dbfield' => 'flddatum' ),
                     array ( 'label' => 'Benutzer',
                             'name' => 'benutzer',
                             'width' => 50, 
                             'type' => 'selectid',
                             'dbtable' => 'tblbenutzer',
                             'seldbfield' => 'fldbez',
                             'seldbindex' => 'fldindex',
                             'dbfield' => 'fldid_benutzer' ),
                     array ( 'label' => 'Benutzerwechsel',
                             'name' => 'rotate', 
                             'width' => 10, 
                             'type' => 'YN',
                             'dbfield' => 'fldrotate' ),
                     array ( 'label' => 'Aufgabe',
                             'name' => 'erkl', 
                             'width' => 100, 
                             'type' => 'textarea',
                             'dbfield' => 'fldtext' ));

$filterarray = array ( array ( 'label' => '<br>Zeitraum von:',
                               'name' => 'zeitraumvon',
                               'value' => '', 
                               'width' => 500, 
                               'type' => 'date',
                               'sign' => '>=',                              
                               'dbfield' => 'flddatum' ),
                       array ( 'label' => 'Zeitraum bis:',
                               'name' => 'zeitraumbis',
                               'value' => '', 
                               'width' => 500, 
                               'type' => 'date',
                               'sign' => '<=',                              
                               'dbfield' => 'flddatum' ));


$pararray = array ( 'headline' => 'Aufgabenplan',
                    'dbtable' => 'tblaufgabenplan',
                    'orderby' => 'flddatum,fldid_benutzer',
                    'strwhere' => '',
                    'prtfield' => 'fldtext',
                    'prtuser' => 'true',
                    'fldindex' => 'fldindex');
?>