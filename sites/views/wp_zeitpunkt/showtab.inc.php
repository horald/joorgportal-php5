<?php
$listarray = array ( array ( 'label' => 'Zeitpunkt',
                             'name' => 'zeitpunkt', 
                             'width' => 50, 
                             'type' => 'text',
                             'dbfield' => 'fldbez' ),
                     array ( 'label' => 'Von Uhrzeit',
                             'name' => 'vonuhrzeit', 
                             'width' => 50, 
                             'type' => 'text',
                             'dbfield' => 'fldvonuhrzeit' ),
                     array ( 'label' => 'Bis Uhrzeit',
                             'name' => 'bisuhrzeit', 
                             'width' => 50, 
                             'type' => 'text',
                             'dbfield' => 'fldbisuhrzeit' ));

$pararray = array ( 'headline' => 'Zeitpunkt',
                    'dbtable' => 'tblzeitpunkt',
                    'orderby' => '',
                    'strwhere' => '',
                    'fldindex' => 'fldindex');

?>