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
                             'dbfield' => 'fldtyp' ),
                     array ( 'label' => 'Sort',
                             'name' => 'sort',
                             'width' => 100, 
                             'type' => 'text',
                             'dbfield' => 'fldsort' ));

$pararray = array ( 'headline' => 'Hilfe',
                    'dbtable' => 'tblhelp',
                    'orderby' => 'fldsort',
                    'strwhere' => '',
                    'fldindex' => 'fldindex');
?>