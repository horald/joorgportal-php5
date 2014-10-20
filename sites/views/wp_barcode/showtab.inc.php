<?php
$listarray = array ( array ( 'label' => 'Bezeichnung',
                             'name' => 'bez',
                             'width' => 100, 
                             'type' => 'text',
                             'dbfield' => 'fldbez' ),
                     array ( 'label' => 'Barcode',
                             'name' => 'barcode',
                             'width' => 100, 
                             'type' => 'text',
                             'dbfield' => 'fldbarcode' ));

$filterarray = array ( array ( 'label' => 'Barcode suchen',
                               'name' => 'suchen', 
                               'width' => 10, 
                               'sign' => ' like ',
                               'type' => 'search',
                               'dbfield' => 'fldbarcode' ));

$pararray = array ( 'headline' => 'Barcode',
                    'dbtable' => 'tblbarcode',
                    'orderby' => 'fldbez',
                    'strwhere' => '',
                    'fldindex' => 'fldindex');
?>