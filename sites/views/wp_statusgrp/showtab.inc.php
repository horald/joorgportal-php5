<?php
$listarray = array ( 
                     array ( 'label' => 'ID',
                             'name' => 'bez', 
                             'width' => 20, 
                             'type' => 'text',
                             'dbfield' => 'fldindex' ),
                     array ( 'label' => 'Bezeichnung',
                             'name' => 'bez', 
                             'width' => 100, 
                             'type' => 'text',
                             'dbfield' => 'fldbezgrp' ));

$pararray = array ( 'headline' => 'Statusgruppe',
                    'dbtable' => 'tblstat_grp',
                    'orderby' => '',
                    'strwhere' => '',
                    'fldindex' => 'fldindex');
?>