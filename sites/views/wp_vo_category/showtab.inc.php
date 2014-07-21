<?php
$listarray = array ( array ( 'label' => 'Bezeichnung',
                             'name' => 'bez', 
                             'width' => 100, 
                             'type' => 'text',
                             'dbfield' => 'fldBez' ),
                     array ( 'label' => 'Sort',
                             'name' => 'sort', 
                             'width' => 100, 
                             'type' => 'text',
                             'dbfield' => 'fldSort' ),
                     array ( 'label' => 'Prozent',
                             'name' => 'proz', 
                             'width' => 100, 
                             'type' => 'procent',
                             'dbfield' => 'fldProz' ));

$pararray = array ( 'headline' => 'Kategorie',
                    'dbtable' => 'tblvo_obercategory',
                    'orderby' => 'fldSort',
                    'strwhere' => '',
                    'fldindex' => 'fldIndex');

?>