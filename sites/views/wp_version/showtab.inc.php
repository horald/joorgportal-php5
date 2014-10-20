	<?php
$listarray = array ( array ( 'label' => 'Bezeichnung',
                             'name' => 'bez',
                             'width' => 20, 
                             'type' => 'text',
                             'dbfield' => 'fldbez' ),
                     array ( 'label' => 'Kurz',
                             'name' => 'kurz',
                             'width' => 20, 
                             'type' => 'text',
                             'dbfield' => 'fldkurz' ),
                     array ( 'label' => 'Datum',
                             'name' => 'datum', 
                             'width' => 100, 
                             'type' => 'date',
                             'dbfield' => 'flddatum' ));

$pararray = array ( 'headline' => 'Versionen',
                    'dbtable' => 'tblversion',
                    'orderby' => 'fldkurz',
                    'strwhere' => '',
                    'fldindex' => 'fldindex');

?>