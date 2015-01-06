<?php
$this->breadcrumbs=array(
	'Menu Nesteds'=>array('index'),
	$model->title=>array('view','id'=>$model->id),
	'Update',
);

$this->menu=array(
	array('label'=>'List MenuNested', 'url'=>array('index')),
	array('label'=>'Create MenuNested', 'url'=>array('create')),
	array('label'=>'View MenuNested', 'url'=>array('view', 'id'=>$model->id)),
	array('label'=>'Manage MenuNested', 'url'=>array('admin')),
);
?>

<h1>Update MenuNested <?php echo $model->id; ?></h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>