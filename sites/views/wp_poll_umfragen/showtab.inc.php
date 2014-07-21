<?php
$listarray = array ( array ( 'label' => 'Kurz',
                             'name' => 'kurz',
                             'width' => 25, 
                             'type' => 'text',
                             'dbfield' => 'fldkurz' ),
                     array ( 'label' => 'Umfrage',
                             'name' => 'umfrage', 
                             'width' => 200, 
                             'type' => 'text',
                             'dbfield' => 'fldbez' ));


$pararray = array ( 'headline' => 'Umfragen',
                    'name' => 'umfragen',
                    'dbtable' => 'tblpoll_umfragen',
                    'orderby' => '',
                    'strwhere' => '',
                    'fldindex' => 'fldindex');
?>