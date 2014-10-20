<?php
$listarray = array ( array ( 'label' => 'Von',
                             'name' => 'von', 
                             'width' => 100, 
                             'type' => 'selectid',
                             'sign' => '=',
                             'dbtable' => 'tblbenutzer',
                             'seldbfield' => 'fldbez',
                             'seldbindex' => 'fldindex',
                             'dbfield' => 'fldid_vonuser' ),
                     array ( 'label' => 'Nach',
                             'name' => 'typ', 
                             'width' => 100, 
                             'type' => 'selectid',
                             'sign' => '=',
                             'dbtable' => 'tblbenutzer',
                             'seldbfield' => 'fldbez',
                             'seldbindex' => 'fldindex',
                             'dbfield' => 'fldid_nachuser' ));


$pararray = array ( 'headline' => 'Benutzerwechsel',
                    'dbtable' => 'tbluserrotate',
                    'orderby' => '',
                    'strwhere' => '',
                    'fldindex' => 'fldindex');
?>