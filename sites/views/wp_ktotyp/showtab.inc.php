<?php
$listarray = array ( array ( 'label' => 'Bezeichnung',
                             'name' => 'bez', 
                             'width' => 100, 
                             'type' => 'text',
                             'dbfield' => 'fldBez' ),
                     array ( 'label' => 'Typ',
                             'name' => 'typ', 
                             'fieldhide' => 'true',
                             'width' => 100, 
                             'type' => 'text',
                             'dbfield' => 'fldTyp' ));

$pararray = array ( 'headline' => 'Kontotyp',
                    'dbtable' => 'tblktotyp',
                    'orderby' => '',
                    'strwhere' => '',
                    'fldindex' => 'fldIndex');
?>