<?php
$listarray = array ( array ( 'label' => 'Liste',
                             'name' => 'liste', 
                             'width' => 100, 
                             'type' => 'selectid',
                             'dbtable' => 'tbladr_liste',
                             'seldbfield' => 'fldlastname',
                             'seldbindex' => 'fldindex',
                             'dbfield' => 'fldid_liste' ),
                     array ( 'label' => 'Gruppe',
                             'name' => 'group', 
                             'width' => 100, 
                             'type' => 'selectid',
                             'dbtable' => 'tbladr_group',
                             'seldbfield' => 'fldbez',
                             'seldbindex' => 'fldindex',
                             'dbfield' => 'fldid_group' ));

$filterarray = array (
                     array ( 'label' => 'Gruppe:',
                             'name' => 'fltgruppe', 
                             'width' => 1, 
                             'type' => 'selectid',
                             'sign' => '=',
                             'dbtable' => 'tbladr_group',
                             'seldbfield' => 'fldbez',
                             'seldbindex' => 'fldindex',
                             'dbfield' => 'fldid_group' ));

$pararray = array ( 'headline' => 'Adresszuordnung',
                    'dbtable' => 'tbladr_lstgrp',
                    'orderby' => '',
                    'strwhere' => '',
                    'fldindex' => 'fldindex');
?>