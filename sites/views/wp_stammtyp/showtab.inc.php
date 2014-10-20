<?php
$listarray = array ( array ( 'label' => 'Bezeichnung',
                             'name' => 'bez',
                             'width' => 100, 
                             'type' => 'text',
                             'dbfield' => 'fldBez' ),
                     array ( 'label' => 'Typ',
                             'name' => 'typ',
                             'width' => 100, 
                             'type' => 'text',
                             'dbfield' => 'fldTyp' ));


$pararray = array ( 'headline' => 'Stammdatentyp',
                    'dbtable' => 'tblstamm_typ',
                    'orderby' => 'fldBez',
                    'strwhere' => '',
                    'fldindex' => 'fldIndex');
                    
?>