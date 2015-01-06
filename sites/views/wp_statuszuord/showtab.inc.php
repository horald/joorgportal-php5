<?php
$listarray = array ( array ( 'label' => 'Gruppe',
                             'name' => 'bez', 
                             'width' => 100, 
                             'type' => 'selectid',
                             'dbtable' => 'tblstat_grp',
                             'seldbfield' => 'fldbezgrp',
                             'seldbindex' => 'fldindex',
                             'dbfield' => 'fldid_grp' ),
                    array ( 'label' => 'Status',
                             'name' => 'status', 
                             'width' => 100, 
                             'type' => 'selectid',
                             'dbtable' => 'tblstatus',
                             'seldbfield' => 'fldbez',
                             'seldbindex' => 'fldindex',
                             'dbfield' => 'fldid_status' ));

$pararray = array ( 'headline' => 'Statuszuordnung',
                    'dbtable' => 'tblstat_zuord',
                    'orderby' => '',
                    'strwhere' => '',
                    'fldindex' => 'fldindex');
?>