<?php
$listarray = array ( array ( 'label' => 'Bezeichnung',
                             'name' => 'bez',
                             'width' => 100, 
                             'type' => 'text',
                             'dbfield' => 'fldBez' ),
                     array ( 'label' => 'Typ',
                             'name' => 'typ',
                             'default' => 'FREMD',
                             'width' => 20, 
                             'type' => 'text',
                             'dbfield' => 'fldo01typ' ));

$pararray = array ( 'headline' => 'Kaufort',
                    'dbtable' => 'tblorte',
                    'orderby' => 'fldBez',
                    'strwhere' => "fldo01typ='FREMD'",
                    'fldindex' => 'fldIndex');

?>