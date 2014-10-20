<?php
$listarray = array ( array ( 'label' => 'Benutzer',
                             'name' => 'USER', 
                             'width' => 100, 
                             'type' => 'text',
                             'dbfield' => 'fldbez' ),
                     array ( 'label' => 'vollst&aumlndiger Name',
                             'name' => 'fullname', 
                             'width' => 100, 
                             'type' => 'text',
                             'dbfield' => 'fldfullname' ));

$pararray = array ( 'headline' => 'Benutzer',
                    'name' => 'USER', 
                    'dbtable' => 'tblbenutzer',
                    'orderby' => '',
                    'strwhere' => '',
                    'fldindex' => 'fldindex');
?>