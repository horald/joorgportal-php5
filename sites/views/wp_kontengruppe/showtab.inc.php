<?php
$listarray = array ( array ( 'label' => 'Bezeichnung',
                             'name' => 'bez',
                             'width' => 100, 
                             'type' => 'text',
                             'dbfield' => 'fldBez' ),
                     array ( 'label' => 'Calc',
                             'name' => 'calc',
                             'width' => 10, 
                             'type' => 'text',
                             'dbfield' => 'fldcalc' ),                     
                     array ( 'label' => '',
                             'width' => 5, 
                             'type' => 'icon',
                             'func' => 'mark.php',
                             'dbfield' => 'icon-book' ) );

$pararray = array ( 'headline' => 'Kontengruppe',
                    'dbtable' => 'tblktobanken',
                    'orderby' => '',
                    'strwhere' => '',
                    'markseldb' => 'JA',
                    'markselno' => 'NEIN',
                    'marktoggle' => 'true',
                    'markfield' => 'fldcalc',
                    'fldindex' => 'fldIndex');
?>