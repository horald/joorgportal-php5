<?php
$listarray = array ( array ( 'label' => 'Nr',
                             'width' => 20, 
                             'type' => 'nummer',
                             'dbfield' => 'dummy' ),
                     array ( 'label' => 'Bezeichnung',
                             'name' => 'bez', 
                             'width' => 500, 
                             'type' => 'text',
                             'dbfield' => 'fldBez' ),
                     array ( 'label' => 'Typ',
                             'name' => 'typ',
                             'fieldhide' => 'true',
                             'default' => 'ZIMMER', 
                             'width' => 500, 
                             'type' => 'text',
                             'dbfield' => 'fldo01typ' ));

$pararray = array ( 'headline' => 'Raum',
                    'dbtable' => 'tblorte',
                    'orderby' => 'fldid_benutzer,fldsort',
                    'strwhere' => "fldo01typ='ZIMMER'",
                    'fldindex' => 'fldIndex');
?>