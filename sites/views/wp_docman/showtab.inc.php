<?php
$listarray = array ( array ( 'label' => 'Ordner',
                             'name' => 'ordner', 
                             'width' => 350, 
                             'type' => 'text',
                             'dbfield' => 'fldbez' ),
                     array ( 'label' => 'Zimmer',
                             'name' => 'zimmer', 
                             'width' => 500, 
                             'type' => 'selectid',
                             'sign' => '=',
                             'dbtable' => 'tblorte',
                             'seldbfield' => 'fldBez',
                             'seldbindex' => 'fldIndex',
                             'seldbwhere' => "fldo01typ='ZIMMER'",
                             'dbfield' => 'fldind_zimmer' ),
                     array ( 'label' => 'Regal',
                             'name' => 'regal', 
                             'width' => 250, 
                             'type' => 'text',
                             'dbfield' => 'fldregal' ));

$pararray = array ( 'headline' => 'Docman',
                    'dbtable' => 'tbldocman_liste',
                    'orderby' => '',
                    'strwhere' => '',
                    'fldindex' => 'fldindex');
?>