<?php
/* @var $this SiteController */

$this->pageTitle=Yii::app()->name;
?>

<h1>Willkommen1 bei <i><?php echo CHtml::encode(Yii::app()->name); ?></i></h1>


<div class="btn-toolbar">
<?php $this->widget('bootstrap.widgets.TbButton', array(
    'label'=>'Einfügen',
    'type'=>'primary', // null, 'primary', 'info', 'success', 'warning', 'danger' or 'inverse'
    'size'=>'', // null, 'large', 'small' or 'mini'
)); ?>

    <?php $this->widget('bootstrap.widgets.TbButtonGroup', array(
        'type'=>'primary', // '', 'primary', 'info', 'success', 'warning', 'danger' or 'inverse'
        'buttons'=>array(
            array('label'=>'Action', 'items'=>array(
                array('label'=>'Action', 'url'=>'#'),
                array('label'=>'Another action', 'url'=>'#'),
                array('label'=>'Something else', 'url'=>'#'),
                '---',
                array('label'=>'Separate link', 'url'=>'#'),
            )),
        ),
    )); ?>
</div>

<?php $this->widget('bootstrap.widgets.TbProgress', array(
    'type'=>'danger', // 'info', 'success' or 'danger'
    'percent'=>90, // the progress
    'striped'=>true,
    'animated'=>true,
)); 

$gridDataProvider = new CArrayDataProvider(array(
    array('id'=>1, 'firstName'=>'Mark', 'lastName'=>'Otto', 'language'=>'CSS'),
    array('id'=>2, 'firstName'=>'Jacob', 'lastName'=>'Thornton', 'language'=>'JavaScript'),
    array('id'=>3, 'firstName'=>'Stu', 'lastName'=>'Dent', 'language'=>'HTML'),
));


?>

