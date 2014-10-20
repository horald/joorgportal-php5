<?php
$listarray = array ( array ( 'label' => '',
                             'name' => 'chkbox', 
                             'width' => 5, 
                             'type' => 'checkbox',
                             'dbfield' => 'flddummy' ),
                     array ( 'label' => 'Bezeichnung',
                             'name' => 'bez', 
                             'width' => 100, 
                             'type' => 'text',
                             'dbfield' => 'fldbez' ),
                     array ( 'label' => 'Typ',
                             'name' => 'typ', 
                             'width' => 20, 
                             'type' => 'text',
                             'dbfield' => 'fldtyp' ));

$filterarray = array ( array ( 'label' => 'Gruppe:',
                             'name' => 'gruppe', 
                             'funcgruppe' => 'true',
                             'width' => 10, 
                             'type' => 'selectref',
                             'sign' => '=',
                             'dbtable' => 'tblstat_grp',
                             'dbtableref' => 'tblstat_zuord',
                             'seldbrefindex' => 'fldid_status',
                             'seldbfield' => 'fldbezgrp',
                             'seldbindex' => 'fldindex',
                             'seldbreffld' => 'fldindex',
                             'dbfield' => 'fldid_grp' ));

$pararray = array ( 'headline' => 'Status',
                    'dbtable' => 'tblstatus',
                    'addfunc' => 'true',
                    'orderby' => '',
                    'strwhere' => '',
                    'fldindex' => 'fldindex');
?>