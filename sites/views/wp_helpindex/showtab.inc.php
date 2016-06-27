<?php
$listarray = array ( array ( 'label' => 'Bezeichnung',
                             'name' => 'bez', 
                             'width' => 100, 
                             'type' => 'text',
                             'dbfield' => 'fldbez' ),
                     array ( 'label' => 'Seitennummer',
                             'name' => 'pagenno', 
                             'width' => 100, 
                             'type' => 'text',
                             'dbfield' => 'fldpageno' ),
                     array ( 'label' => 'Menu-ID',
                             'name' => 'menuid', 
                             'width' => 100, 
                             'type' => 'text',
                             'dbfield' => 'fldmenu' ));

$pararray = array ( 'headline' => 'Hilfe-Menu-Index',
                    'dbtable' => 'tblhelpindex',
                    'orderby' => '',
                    'strwhere' => '',
                    'fldindex' => 'fldindex');
?>