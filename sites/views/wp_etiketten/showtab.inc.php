<?php
$listarray = array ( array ( 'label' => 'Bezeichnung',
                             'name' => 'bez', 
                             'width' => 100, 
                             'type' => 'text',
                             'dbfield' => 'fldbez' ),
                     array ( 'label' => 'Anz Sp',
                             'name' => 'anzsp', 
                             'width' => 20, 
                             'type' => 'text',
                             'dbfield' => 'fldanzsp' ),
                     array ( 'label' => 'Anz Zl',
                             'name' => 'anzzl', 
                             'width' => 20, 
                             'type' => 'text',
                             'dbfield' => 'fldanzzl' ));

$pararray = array ( 'headline' => 'Etiketten',
                    'dbtable' => 'tbletiketten',
                    'orderby' => '',
                    'strwhere' => '',
                    'fldindex' => 'fldindex');
?>