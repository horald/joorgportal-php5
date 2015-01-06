<h2>Nested Set Model Examples (<?php echo __FILE__; ?>):</h2>
<b>NEW: </b> ajaxLink-enabled Tree, viewing the details of every node's link
</p>
<div id="mtreeview" style="width: 250px;border: 1px solid GRAY;float:left">
<?php
	$this->widget('application.extensions.MTreeView.MTreeView',array(
		'collapsed' => true,
		'animated' => 'fast',
		'htmlOptions' => array(
			'class' => 'treeview-famfamfam', //there are some classes that ready to use
		),
		'table' => 'menu_nested', //what table the menu would come from
		'hierModel' => 'nestedSet', //hierarchy model of the table
		'conditions' => array('t1.visible=:visible', array(':visible' => 1)), //other conditions if any. Each fields should be prefixed with 't1.' to avoid query errors
		//declaration of fields
		'fields' => array(
			'text' => 'title',
			'alt' => false,
			'icon' => false,
			'tooltip' => false,
			'task' => false,
			'url' => array('/menuNested/view', array('id' => 'id'))
		),
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
    'alt','icon','tooltip' is set to false because there's no corresponding field in the table,and 'task' field is disregarded.Class of the tree is set to 'treeview-famfamfam'
</p>
<?php
$this->widget('application.extensions.MTreeView.MTreeView', array(
    'collapsed' => true,
    'animated' => 'fast',
    'htmlOptions' => array(
        'class' => 'treeview-famfamfam', //there are some classes that ready to use
    ),
    'table' => 'menu_nested', //what table the menu would come from
    'hierModel' => 'nestedSet', //hierarchy model of the table
    'conditions' => array('t1.visible=:visible', array(':visible' => 1)), //other conditions if any. Each fields should be prefixed with 't1.' to avoid query errors
    //declaration of fields
    'fields' => array(
        'text' => 'title',
        'alt' => false,
        'icon' => false,
        'tooltip' => false,
        'task' => false,
        'url' => false
    ),
));
?>
<p>&nbsp;</p>
<hr>
<p>
    'tooltip' will be the same as the 'text', 'icons' and 'alt' are set to false because there's no corresponding field in the table,and task is disregarded
</p>
<?php
$this->widget('application.extensions.MTreeView.MTreeView', array(
    'collapsed' => true,
    'animated' => 'fast',
    'table' => 'menu_nested', //what table the menu would come from
    'hierModel' => 'nestedSet', //hierarchy model of the table
    'conditions' => array('t1.visible=:visible', array(':visible' => 1)), //other conditions if any. Each fields should be prefixed with 't1.' to avoid query errors
    //declaration of fields
    'fields' => array(
        'text' => 'title',
        'alt' => 'title',
        'icon' => false,
        'tooltip' => 'title',
        'task' => false,
    ),
));
?>

<p>&nbsp;</p>
<hr>
<p>
    With contoller<br>
    UPDATED: considered the htmlOptions (which is saved in the `htmlOptions` field) for the node
</p>

<div id='treeviewcontrol_nav'>
    <a title="Collapse the tree below" href="#">Collapse</a>
    <a title="Expand the tree below" href="#">Expand</a>
    <a title="Toggle the tree below, opening closed branches, closing open branches" href="#">Toggle</a>
</div><!-- treeviewcontrol_nav -->

<?php
$this->widget('application.extensions.MTreeView.MTreeView', array(
    'collapsed' => true,
    'animated' => 'fast',
    'table' => 'menu_nested', //what table the menu would come from
    'hierModel' => 'nestedSet', //hierarchy model of the table
    'conditions' => array('t1.visible=:visible', array(':visible' => 1)), //other conditions if any. Each fields should be prefixed with 't1.' to avoid query errors
    //declaration of fields
    'fields' => array(
        'text' => 'title',
        'alt' => 'title',
        'icon' => false,
        'tooltip' => 'title',
        'task' => false,
        'options' => 'htmlOptions'
    ),
    'control' => '#treeviewcontrol_nav',
));
?>
<p>&nbsp;</p>
<hr>
<p>
    <b>NEW:</b> 'url' field can be declared in array in the format <b>array(string $route,array $params)</b>. $params is in ('field name'=>'field that has the value') format, like ('id'=>'id'). 
</p>
<?php
$this->widget('application.extensions.MTreeView.MTreeView', array(
    'collapsed' => true,
    'animated' => 'fast',
    'htmlOptions' => array(
        'class' => 'treeview-famfamfam', //there are some classes that ready to use
    ),
    'table' => 'menu_nested', //what table the menu would come from
    'hierModel' => 'nestedSet', //hierarchy model of the table
    'conditions' => array('t1.visible=:visible', array(':visible' => 1)), //other conditions if any. Each fields should be prefixed with 't1.' to avoid query errors
    //declaration of fields
    'fields' => array(
        'text' => 'title',
        'alt' => false,
        'icon' => false,
        'tooltip' => false,
        'task' => false,
        'url' => array('/menuNested/view', array('id' => 'id'))
    ),
));
?>