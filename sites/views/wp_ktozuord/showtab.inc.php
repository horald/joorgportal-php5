<?php
$listarray = array ( array ( 'label' => 'Kurz',
                             'name' => 'kurz',
                             'width' => 50, 
                             'type' => 'select',
                             'dbtable' => 'tblktokonten',
                             'seldbfield' => 'fldKurz',
                             'dbfield' => 'fldKurz' ),
                     array ( 'label' => 'Such',
                             'name' => 'such',
                             'width' => 80, 
                             'type' => 'text',
                             'dbfield' => 'fldSuch' ));
$pararray = array ( 'headline' => 'Kontenzuordnung',
                    'dbtable' => 'tblktozuord',
                    'orderby' => '',
                    'strwhere' => '',
                    'fldbez' => 'fldBez',
                    'fldindex' => 'fldIndex');

?>