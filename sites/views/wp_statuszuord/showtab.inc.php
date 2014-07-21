<?php
$listarray = array ( array ( 'label' => 'Gruppe',
                             'name' => 'bez', 
                             'width' => 100, 
                             'type' => 'text',
                             'dbfield' => 'fldid_grp' ),
                    array ( 'label' => 'Status',
                             'name' => 'status', 
                             'width' => 100, 
                             'type' => 'text',
                             'dbfield' => 'fldid_status' ));

$pararray = array ( 'headline' => 'Statuszuordnung',
                    'dbtable' => 'tblstat_zuord',
                    'orderby' => '',
                    'strwhere' => '',
                    'fldindex' => 'fldindex');
?>