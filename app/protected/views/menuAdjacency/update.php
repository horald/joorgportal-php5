<?php
$this->breadcrumbs=array(
	'Menu Adjacencys'=>array('index'),
	$model->title=>array('view','id'=>$model->id),
	'Update',
);

$this->menu=array(
	array('label'=>'List MenuAdjacency', 'url'=>array('index')),
	array('label'=>'Create MenuAdjacency', 'url'=>array('create')),
	array('label'=>'View MenuAdjacency', 'url'=>array('view', 'id'=>$model->id)),
	array('label'=>'Manage MenuAdjacency', 'url'=>array('admin')),
);
?>

<h1>Update MenuAdjacency <?php echo $model->id; ?></h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>