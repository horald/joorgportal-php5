<h2>Nested Set Model Examples (<?php echo __FILE__; ?>):</h2>
<p>
Basic AJAX tree.
</p>
<?php
	$this->widget('application.extensions.MTreeView.MTreeView',
	array('url'=>array('ajaxFillTree'),
		'animated'=>'fast',
		)
	);
?>
<p>&nbsp;</p>
<hr>
<p>
AJAX Tree with links, no tooltips and no icons.
</p>
<?php
	$this->widget('application.extensions.MTreeView.MTreeView',
	array('url'=>array('ajaxFillTree2'),
		'animated'=>'fast',
		)
	);
?>
<p>&nbsp;</p>
<hr>
<p>
AJAX Tree with links and icons, with the template set to '{icon}Text:{text}'.<br>
UPDATED: considered the htmlOptions (which is saved in the `options` field) for the node
</p>
<?php
	$this->widget('application.extensions.MTreeView.MTreeView',
	array('url'=>array('ajaxFillTree3'),
		'animated'=>'fast',
		)
	);
?>
