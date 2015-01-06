<?php
$this->breadcrumbs=array(
	'Menu Nesteds'=>array('index'),
	$model->title,
);

$this->menu=array(
	array('label'=>'List MenuNested', 'url'=>array('index')),
	array('label'=>'Create MenuNested', 'url'=>array('create')),
	array('label'=>'Update MenuNested', 'url'=>array('update', 'id'=>$model->id)),
	array('label'=>'Delete MenuNested', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage MenuNested', 'url'=>array('admin')),
);
?>

<h1>View MenuNested #<?php echo $model->id; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'id',
		'title',
		'lft',
		'rgt',
		'url',
		'visible',
		'task',
		'htmlOptions',
	),
)); ?>
