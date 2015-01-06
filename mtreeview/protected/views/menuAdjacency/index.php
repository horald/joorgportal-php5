<?php
$this->breadcrumbs=array(
	'Menu Adjacencys',
);

$this->menu=array(
	array('label'=>'Create MenuAdjacency', 'url'=>array('create')),
	array('label'=>'Manage MenuAdjacency', 'url'=>array('admin')),
);
?>

<h1>Menu Adjacencys</h1>

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
