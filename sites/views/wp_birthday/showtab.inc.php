<?php
$listarray = array ( array ( 'label' => 'Vorname',
                             'name' => 'vorname', 
                             'width' => 150, 
                             'type' => 'text',
                             'dbfield' => 'fldVorname' ),
                     array ( 'label' => 'Nachname',
                             'name' => 'nachname', 
                             'width' => 150, 
                             'type' => 'text',
                             'dbfield' => 'fldNachname' ),
                     array ( 'label' => 'Geburtstag',
                             'name' => 'geburtstag', 
                             'width' => 100, 
                             'type' => 'date',
                             'dbfield' => 'fldGebDatum' ),
                     array ( 'label' => 'Alter',
                             'name' => 'alter', 
                             'width' => 40, 
                             'type' => 'age',
                             'dbfield' => 'fldGebDatum' ));

$filterarray = array (array ( 'label' => 'nur aktuelle',
                             'name' => 'nuraktuelle', 
                             'width' => 10, 
                             'type' => 'text',
                             'default' => 'now()',
                             'sign' => '>=',
                             'dbfield' => 'fldSort' ));


$pararray = array ( 'headline' => 'Geburtstage',
                    'dbtable' => 'tblgeburtstage',
                    'orderby' => 'month(fldGebDatum),day(fldGebDatum),fldSort',
//                    'strwhere' => 'fldSort>=substr(current_date(),6,5)',
                    'fldindex' => 'fldIndex',
                    'marktype' => 'date',
                    'markbgcolor' => '88ffff',
                    'unmarkbgcolor' => '999fff',
                    'marksuccess' => '1938-01-16',
                    'marksign' => '=',
                    'markfield' => 'fldGebDatum');
?>