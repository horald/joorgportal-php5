<?php
$listarray = array (array ( 'label' => 'Konto',
                            'name' => 'konto',
                            'width' => 50,
                            'type' => 'select',
                            'dbtable' => 'tblktokonten',
                            'seldbfield' => 'fldKurz',
                            'seldbindex' => 'fldIndex',
                            'seldborder' => 'fldKurz',
                            'dbfield' => 'fldKurz'), 
                    array ( 'label' => 'Kontengruppe',
                             'name' => 'kontengruppe',
                             'default' => '(ohne)',
                             'width' => 100, 
                             'type' => 'selectid',
                             'selparent' => 'true',
                             'dbtable' => 'tblktogrp_liste',
                             'seldbfield' => 'fldbez',
                             'seldbindex' => 'fldindex',
                             'dbfield' => 'fldid_ktogrp' ),
                    array ( 'label' => 'Oberkonto',
                             'name' => 'oberkonto',
                             'fieldhide' => 'true1', 
                             'default' => '(ohne)',
                             'width' => 100, 
                             'type' => 'selectid',
                             'selchild' => 'true',
                             'selfield' => 'fldid_ktogrp',
                             'dbtable' => 'tblktooberkonten',
                             'seldbfield' => 'fldBez',
                             'seldbindex' => 'fldIndex',
                             '1reftable' => 'tblktogrp_liste',
                             '1refindex' => 'fldindex',
                             '1reffield' => 'fldbez',
                             '1refdbid' => 'fldid_ktogrp',
                             'dbfield' => 'fldid_oberkonto' ));

$filterarray = array ( array ( 'label' => 'Kontengruppe:',
                               'name' => 'fltktogrp', 
                               'value' => '',
                               'width' => 10, 
                               'type' => 'selectid',
                               'dbtable' => 'tblktogrp_liste',
                               'seldbfield' => 'fldbez',
                               'seldbindex' => 'fldindex',
                               'sign' => '=',
                               'dbfield' => 'fldid_ktogrp' ));

$pararray = array ( 'headline' => 'Kontenzuordnung',
                    'dbtable' => 'tblktogrpzuord',
                    'orderby' => 'fldid_oberkonto',
                    'strwhere' => '',
                    'fldindex' => 'fldindex');
?>