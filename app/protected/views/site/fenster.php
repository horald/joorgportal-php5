<?php
/* @var $this SiteController */
/* @var $model ContactForm */
/* @var $form CActiveForm */

$this->pageTitle=Yii::app()->name . ' - Fenster';
$this->breadcrumbs=array(
	'Fenster',
);
?>

<?php if(Yii::app()->user->hasFlash('fenster')): ?>

<div class="flash-success">
	<?php echo Yii::app()->user->getFlash('fenster'); ?>
</div>

<?php else: ?>


<?php 
echo CHtml::link('Link Text','https://www.google.de'); 
?>

<?php $this->beginWidget('zii.widgets.CPortlet'); ?>
in iframe
<iframe src="https://www.google.de">
</iframe>
<?php $this->endWidget(); ?>



<?php endif; ?>