<?php
$listarray = array ( array ( 'label' => 'Sprache',
                             'name' => 'lang', 
                             'width' => 100, 
                             'type' => 'text',
                             'dbfield' => 'fldLang' ),
                     array ( 'label' => 'Bezeichnung',
                             'name' => 'bez', 
                             'width' => 100, 
                             'type' => 'text',
                             'dbfield' => 'fldBez' ),
                     array ( 'label' => 'Name',
                             'name' => 'name', 
                             'width' => 100, 
                             'type' => 'text',
                             'dbfield' => 'fldName' ));

$pararray = array ( 'headline' => 'Sprache',
                    'dbtable' => 'tbltranslate',
                    'orderby' => '',
                    'strwhere' => '',
                    'fldindex' => 'fldIndex');
?>