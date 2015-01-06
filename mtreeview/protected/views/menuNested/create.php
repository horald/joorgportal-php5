<?php
$this->breadcrumbs=array(
	'Menu Nesteds'=>array('index'),
	'Create',
);

$this->menu=array(
	array('label'=>'List MenuNested', 'url'=>array('index')),
	array('label'=>'Manage MenuNested', 'url'=>array('admin')),
);
?>

<h1>Create MenuNested</h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>