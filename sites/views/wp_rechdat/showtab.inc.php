<?php
$listarray = array ( array ( 'label' => 'Bezeichnung',
                             'name' => 'bez', 
                             'width' => 100, 
                             'type' => 'date',
                             'dbfield' => 'fldBez' ),
                     array ( 'label' => 'Bemerkung',
                             'name' => 'bemerkung', 
                             'width' => 100, 
                             'type' => 'text',
                             'linkfield' => 'fldLink',
                             'dbfield' => 'fldBemerkung' ),
                     array ( 'label' => 'Link',
                             'fieldhide' => 'true', 
                             'name' => 'link', 
                             'width' => 100, 
                             'type' => 'text',
                             'dbfield' => 'fldLink' ));
$pararray = array ( 'headline' => 'Rechnungsdatum',
                    'dbtable' => 'tblrechdat',
                    'orderby' => 'fldBez',
                    'strwhere' => '',
                    'fldindex' => 'fldIndex');
?>