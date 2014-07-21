<?php
$listarray = array ( array ( 'label' => 'Bezeichnung',
                             'name' => 'bez', 
                             'width' => 100, 
                             'type' => 'text',
                             'dbfield' => 'fldbez' ),
                     array ( 'label' => 'Typ',
                             'name' => 'typ', 
                             'width' => 100, 
                             'type' => 'text',
                             'dbfield' => 'fldtyp' ));

$pararray = array ( 'headline' => 'Adressgruppe',
                    'dbtable' => 'tbladr_group',
                    'orderby' => '',
                    'strwhere' => '',
                    'fldindex' => 'fldindex');
?>