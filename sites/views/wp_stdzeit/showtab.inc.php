<?php
$listarray = array ( array ( 'label' => 'Bezeichnung',
                             'name' => 'bez', 
                             'width' => 100, 
                             'type' => 'text',
                             'dbfield' => 'fldbez' ));

$pararray = array ( 'headline' => 'Zeit',
                    'dbtable' => 'tblstdzeit',
                    'orderby' => 'fldbez',
                    'strwhere' => '',
                    'fldindex' => 'fldindex');
?>