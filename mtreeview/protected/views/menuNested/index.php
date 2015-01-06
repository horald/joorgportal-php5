<?php
$this->breadcrumbs=array(
	'Menu Nesteds',
);

$this->menu=array(
	array('label'=>'Create MenuNested', 'url'=>array('create')),
	array('label'=>'Manage MenuNested', 'url'=>array('admin')),
);
?>

<h1>Menu Nesteds</h1>

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
