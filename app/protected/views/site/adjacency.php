<h2>Adjacency Model Examples (<?php echo __FILE__; ?>):</h2>

<b>NEW: </b> ajaxLink-enabled Tree, viewing the details of every node's link
</p>
<div id="mtreeview" style="width: 250px;border: 1px solid GRAY;float:left">
<?php
	$this->widget('application.extensions.MTreeView.MTreeView',array(
		'collapsed'=>true,
		'animated'=>'fast',
		//---MTreeView options from here
		'table'=>'menu_adjacency',//what table the menu would come from
		'hierModel'=>'adjacency',//hierarchy model of the table
		'conditions'=>array('visible=:visible',array(':visible'=>1)),//other conditions if any                                    
		'fields'=>array(//declaration of fields
			'text'=>'title',//no `text` column, use `title` instead
			'alt'=>'title',//skip using `alt` column
			'id_parent'=>'parent_id',//no `id_parent` column,use `parent_id` instead
			'position'=>'title',
			'task'=>false,
			'options'=>'options',
			'url'=>array('/menuAdjacency/view',array('id'=>'id'))
		),
		'template'=>'{icon}&nbsp;{text}',
		'ajaxOptions'=>array('update'=>'#mtreeview-target')
	));
?>
</div>
<div id="mtreeview-target" style="border: 1px solid gray;margin-left: 260px;min-height: 300px">
Click on any link of the tree at the left...
</div>
<p>&nbsp;</p>
<hr>

<p>
No 'alt','icon' and 'task' fields.<br>
<b>NEW:</b> 'url' field can be declared in array in the format <b>array(string $route,array $params)</b>. $params is in ('field name'=>'field that has the value') format, like ('id'=>'id'). <br>
<b>NEW:</b> added the option 'encode' (bool), which will CHtml::encode() the node if set to true
</p>
<?php
	$this->widget('application.extensions.MTreeView.MTreeView',array(
		'collapsed'=>true,
		'animated'=>'fast',
		//---MTreeView options from here
		'table'=>'menu_adjacency',//what table the menu would come from
		'hierModel'=>'adjacency',//hierarchy model of the table
		'conditions'=>array('visible=:visible',array(':visible'=>1)),//other conditions if any                                    
		'fields'=>array(//declaration of fields
			'text'=>'title',//no `text` column, use `title` instead
			'alt'=>false,//skip using `alt` column
			'id_parent'=>'parent_id',//no `id_parent` column,use `parent_id` instead
			'task'=>false,
			'icon'=>false,
			'url'=>array('/menuAdjacency/view',array('id'=>'id'))
			//'url'=>"CONCAT('/',title,'/id',id)"
		),
	));
?>
<p>&nbsp;</p>
<hr>
<p>
'Alt' field will be the same with the 'text', and will be ordered by the 'text' of the node in descending order:
</p>
<?php
	$this->widget('application.extensions.MTreeView.MTreeView',array(
		'collapsed'=>true,
		'animated'=>'fast',
		//---MTreeView options from here
		'table'=>'menu_adjacency',//what table the menu would come from
		'hierModel'=>'adjacency',//hierarchy model of the table
		'conditions'=>array('visible=:visible',array(':visible'=>1)),//other conditions if any                                    
		'fields'=>array(//declaration of fields
			'text'=>'title',//no `text` column, use `title` instead
			'alt'=>'title',//skip using `alt` column
			'id_parent'=>'parent_id',//no `id_parent` column,use `parent_id` instead
			'position'=>'title DESC',
			'task'=>false,
			'url'=>'url'
		),
	));
?>
<p>&nbsp;</p>
<hr>
<p>
'Alt' field will be the same with the 'text', and will be ordered by the 'text' of the node, and 'icon' will come after the 'text' and 3 spaces:<br>
UPDATED: considered the htmlOptions (which is saved in the `options` field) for the node
</p>
<?php
	$this->widget('application.extensions.MTreeView.MTreeView',array(
		'collapsed'=>true,
		'animated'=>'fast',
		//---MTreeView options from here
		'table'=>'menu_adjacency',//what table the menu would come from
		'hierModel'=>'adjacency',//hierarchy model of the table
		'conditions'=>array('visible=:visible',array(':visible'=>1)),//other conditions if any                                    
		'fields'=>array(//declaration of fields
			'text'=>'title',//no `text` column, use `title` instead
			'alt'=>'title',//skip using `alt` column
			'id_parent'=>'parent_id',//no `id_parent` column,use `parent_id` instead
			'position'=>'title',
			'task'=>false,
			'options'=>'options'
		),
		'template'=>'{text}&nbsp;&nbsp;&nbsp;{icon}',
	));
?>

