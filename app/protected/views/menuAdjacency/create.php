<?php
$this->breadcrumbs=array(
	'Menu Adjacencys'=>array('index'),
	'Create',
);

$this->menu=array(
	array('label'=>'List MenuAdjacency', 'url'=>array('index')),
	array('label'=>'Manage MenuAdjacency', 'url'=>array('admin')),
);
?>

<h1>Create MenuAdjacency</h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>