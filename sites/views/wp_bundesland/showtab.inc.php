<?php
$listarray = array ( array ( 'label' => 'Nr',
                             'width' => 10, 
                             'type' => 'nummer',
                             'dbfield' => 'dummy' ),
                     array ( 'label' => 'Bezeichnung',
                             'name' => 'bez', 
                             'width' => 100, 
                             'type' => 'text',
                             'dbfield' => 'fldbez' ));

$pararray = array ( 'headline' => 'Bundesland',
                    'dbtable' => 'tblbundesland',
                    'orderby' => '',
                    'strwhere' => '',
                    'fldindex' => 'fldindex');
?>