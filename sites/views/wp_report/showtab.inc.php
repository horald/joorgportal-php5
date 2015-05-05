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
                     array ( 'label' => 'Kurz',
                             'name' => 'kurz',
                             'width' => 100, 
                             'type' => 'text',
                             'dbfield' => 'fldkurz' ));



$pararray = array ( 'headline' => 'Reports',
                    'dbtable' => 'tblreports',
                    'orderby' => '',
                    'strwhere' => '',
                    'fldindex' => 'fldindex');

?>