<?php
$listarray = array ( array ( 'label' => 'Benutzer',
                             'name' => 'USER', 
                             'width' => 100, 
                             'type' => 'text',
                             'dbfield' => 'fldbez' ),
                     array ( 'label' => 'Bundesland',
                             'name' => 'bundesland',
                             'width' => 50, 
                             'type' => 'selectid',
                             'dbtable' => 'tblbundesland',
                             'seldbfield' => 'fldbez',
                             'seldbindex' => 'fldindex',
                             'dbfield' => 'fldid_bundesland' ),
                     array ( 'label' => 'Datei',
                             'name' => 'backgroundfilename', 
                             'width' => 100, 
                             'type' => 'text',
                             'fieldhide' => 'true',
                             'dbfield' => 'fldbackgroundfilename' ));

$pararray = array ( 'headline' => 'Benutzer',
                    'name' => 'USER', 
                    'dbtable' => 'tblbenutzer',
                    'orderby' => '',
                    'strwhere' => '',
                    'fldindex' => 'fldindex');
?>