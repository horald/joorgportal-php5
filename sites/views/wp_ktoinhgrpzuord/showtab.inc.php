<?php
$listarray = array ( array ( 'label' => 'Konteninhabergruppe',
                             'name' => 'inhabergruppe',
                             'fieldhide' => 'true1', 
                             'default' => '(ohne)',
                             'width' => 100, 
                             'type' => 'selectid',
                             'dbtable' => 'tblktoinhgrp_liste',
                             'seldbfield' => 'fldbez',
                             'seldbindex' => 'fldindex',
                             'dbfield' => 'fldid_ktoinhgrp' ),
                     array ( 'label' => 'Konteninhaber',
                             'name' => 'kontengruppe',
                             'fieldhide' => 'true1', 
                             'default' => '(ohne)',
                             'width' => 100, 
                             'type' => 'selectid',
                             'dbtable' => 'tblktobanken',
                             'seldbfield' => 'fldBez',
                             'seldbindex' => 'fldIndex',
                             'dbfieldset' => 'fldInhaber',
                             'dbfield' => 'fldid_ktoinhaber' ));

$filterarray = array (array ( 'label' => 'Gruppe:',
                              'name' => 'gruppe', 
                              'width' => 10, 
                              'type' => 'selectid',
                              'sign' => '=',
                              'dbtable' => 'tblktoinhgrp_liste',
                              'seldbfield' => 'fldbez',
                              'seldbindex' => '',
                              'dbfield' => 'fldid_ktoinhgrp' ));
                              
$filterarray = array ( array ( 'label' => 'Gruppe:',
                               'name' => 'fltktoinhgrp', 
                               'value' => '',
                               'width' => 10, 
                               'type' => 'selectid',
                               'dbtable' => 'tblktoinhgrp_liste',
                               'seldbfield' => 'fldbez',
                               'seldbindex' => 'fldindex',
                               'sign' => '=',
                               'dbfield' => 'fldid_ktoinhgrp' ));
                              


$pararray = array ( 'headline' => 'Konteninhaberzuordnung',
                    'dbtable' => 'tblktoinhgrpzuord',
                    'orderby' => 'fldid_ktoinhgrp',
                    'strwhere' => '',
                    'fldindex' => 'fldindex');
?>