<?php
$this->breadcrumbs=array(
	'Menu Adjacencys'=>array('index'),
	$model->title,
);

$this->menu=array(
	array('label'=>'List MenuAdjacency', 'url'=>array('index')),
	array('label'=>'Create MenuAdjacency', 'url'=>array('create')),
	array('label'=>'Update MenuAdjacency', 'url'=>array('update', 'id'=>$model->id)),
	array('label'=>'Delete MenuAdjacency', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage MenuAdjacency', 'url'=>array('admin')),
);
?>

<h1>View MenuAdjacency #<?php echo $model->id; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'id',
		'parent_id',
		'title',
		'position',
		'tooltip',
		'url',
		'icon',
		'visible',
		'task',
		'options',
	),
)); ?>
