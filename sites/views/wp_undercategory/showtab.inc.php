<?php
$listarray = array ( array ( 'label' => 'Bezeichnung',
                             'name' => 'bez', 
                             'width' => 100, 
                             'type' => 'text',
                             'dbfield' => 'fldBez' ),
                     array ( 'label' => 'Oberkonten',
                             'name' => 'gruppe',
                             'width' => 20, 
                             'type' => 'selectid',
                             'dbtable' => 'tblvo_obercategory',
                             'seldbfield' => 'fldBez',
                             'seldbindex' => 'fldIndex',
                             'dbfield' => 'fldid_obercat' ),
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

$filterarray = array ( array ( 'label' => 'Oberkategorie:',
                             'name' => 'oberkategorie', 
                             'width' => 10, 
                             'type' => 'selectid',
                             'sign' => '=',
                             'dbtable' => 'tblvo_obercategory',
                             'seldbfield' => 'fldBez',
                             'seldbindex' => 'fldIndex',
                             'selorderby' => 'fldSort',
                             'selwhere' => '',
                             'dbfield' => 'fldid_obercat' ));

$pararray = array ( 'headline' => 'Kategorie',
                    'dbtable' => 'tblvo_category',
                    'orderby' => 'fldSort',
                    'strwhere' => '',
                    'fldindex' => 'fldIndex');

?>