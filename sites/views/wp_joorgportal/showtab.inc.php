<?php
$listarray = array ( array ( 'label' => 'Bezeichnung',
                             'name' => 'bez', 
                             'width' => 100, 
                             'type' => 'text',
                             'dbfield' => 'bemvindo' ),
                     array ( 'label' => 'Link',
                             'name' => 'link', 
                             'width' => 100, 
                             'type' => 'text',
                             'dbfield' => 'fldlink' ));

$pararray = array ( 'headline' => 'Joorgportal-Komponente',
                    'dbtable' => 'jp_joorgportal',
                    'orderby' => 'bemvindo',
                    'strwhere' => '',
                    'fldindex' => 'id');
?>