<?php

$listarray = array ( array ( 'label' => 'Nr',
                             'width' => 10, 
                             'type' => 'nummer',
                             'dbfield' => 'dummy' ),
                     array ( 'label' => 'Bezeichnung',
                             'name' => 'bez',
                             'width' => 100, 
                             'type' => 'text',
                             'dbfield' => 'fldbez' ),
                     array ( 'label' => 'Spielplatz',
                             'name' => 'spielplatz', 
                             'width' => 100, 
                             'type' => 'selectid',
                             'dbtable' => 'tblmarkers',
                             'seldbfield' => 'fldname',
                             'seldbindex' => 'fldindex',
                             'dbfield' => 'fldid_spielplatz' ));

$filterarray = array (array ( 'label' => 'Spielplatz',
                              'name' => 'fltspielplatz', 
                              'width' => 1, 
                              'type' => 'selectid',
                              'sign' => '=',
                              'dbtable' => 'tblmarkers',
                              'seldbfield' => 'fldname',
                              'seldbindex' => 'fldindex',
                              'dbfield' => 'fldid_spielplatz' ));


$pararray = array ( 'headline' => 'Spielger&aumlte',
                    'dbtable' => 'tblspielgeraete',
                    'orderby' => '',
                    'strwhere' => '',
                    'fldindex' => 'fldindex');

?>