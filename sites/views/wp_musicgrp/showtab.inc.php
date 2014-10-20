<?php

$listarray = array ( array ( 'label' => 'Bezeichnung',
                             'name' => 'bez',
                             'width' => 500, 
                             'type' => 'text',
                             'linkfield' => 'fldlink',
                             'targetfield' => 'fldTarget',
                             'dbfield' => 'fldbez' ));


$pararray = array ( 'headline' => 'Album',
                    'dbtable' => 'tblmusic_grp',
                    'orderby' => 'fldbez',
                    'strwhere' => '',
                    'fldindex' => 'fldindex');

?>