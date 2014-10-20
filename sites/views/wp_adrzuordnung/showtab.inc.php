<?php
$listarray = array ( array ( 'label' => 'Liste',
                             'name' => 'liste', 
                             'width' => 100, 
                             'type' => 'text',
                             'dbfield' => 'fldid_liste' ),
                     array ( 'label' => 'Gruppe',
                             'name' => 'group', 
                             'width' => 100, 
                             'type' => 'text',
                             'dbfield' => 'fldid_group' ));

$pararray = array ( 'headline' => 'Adresszuordnung',
                    'dbtable' => 'tbladr_lstgrp',
                    'orderby' => '',
                    'strwhere' => '',
                    'fldindex' => 'fldindex');
?>