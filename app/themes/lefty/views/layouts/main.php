<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="language" content="en" />

	<!-- blueprint CSS framework -->
	<link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/css/screen.css" media="screen, projection" />
	<link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/css/print.css" media="print" />
	<!--[if lt IE 8]>
	<link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/css/ie.css" media="screen, projection" />
	<![endif]-->

	<link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/css/main.css" />
	<link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/css/form.css" />

	<title><?php echo CHtml::encode($this->pageTitle); ?></title>
</head>

<body>
<div class="containerxx" id="pagexx">
	<div id="header">
		<div id="logo"><?php echo CHtml::encode(Yii::app()->name); ?></div>
	</div><!-- header -->

	<div>
	<table>
	<tr>
	<td width='80'>
	<div id="mainmenuxx">
	<?php 

//include("pagemenu.php");
//include("menu.php");
echo "<legend>Navigation</legend>";

/*
    require_once("treemenu.class.php");

    // create TreeMenu object
    $treeMenu = new TreeMenu();
    $treeMenu->SetPath("/var/www/html/own/joorgportal/");
    $treeMenu->SetHtmlPath("http://localhost/own/joorgportal/");
    $treeMenu->SetStyle("joomportal");
    //$treeMenu->SetCaption("Navigation");

    page_menu($treeMenu,'0');
    //mysql_close();

    $treeMenu->Debug(false);
    ## *** set form submission type: "get" or "post"
    $treeMenu->SetSubmissionType("post");

    $treeMenu->Display();
*/

//$vaterid='0';
//pagemenu($vaterid);

$arrmenu=array();
array_push($arrmenu, array('label'=>'Home1', 'url'=>array('/site/index'),
                 'items'=>array(
                    array('label'=>'sub 1 contact', 'url'=>array('/site/index')),
                    array('label'=>'sub 2 contact', 'url'=>array('/site/index')),
				array('label'=>'About', 'url'=>array('/site/about')),
				array('label'=>'Contact', 'url'=>array('/site/contact')),
				array('label'=>'Login', 'url'=>array('site/login'), 'visible'=>Yii::app()->user->isGuest),
				array('label'=>'Logout ('.Yii::app()->user->name.')', 'url'=>array('site/logout'), 'visible'=>!Yii::app()->user->isGuest),
				array('label'=>'admin', 'url'=>array('/admin'), 'visible'=>!Yii::app()->user->isGuest)



                  ),));
array_push($arrmenu, array('label'=>'Home1', 'url'=>array('/site/index')));

//$this->widget('application.extensions.mbmenu.MbMenu',array(
                $this->widget('zii.widgets.CMenu',array(
//                $this->widget('zii.widgets.TbMenu',array(
			'items'=>$arrmenu,
		)); 

/*
                   $this->widget('zii.widgets.CMenu',array(
			'items'=>array(
        			array('label'=>'Home', 'url'=>array('/site/index')),
				array('label'=>'Adjacency', 'url'=>array('/site/adjacency')),
			       	array('label'=>'Nested Set', 'url'=>array('/site/nestedSet')),				
				array('label'=>'AJAX Set', 'url'=>array('/site/ajaxTree')),				
			),
		)); 
*/

/*
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
*/

if (!Yii::app()->user->isGuest) {
  echo "<ul class='nav nav-pills nav-stacked'>";
  echo "<li>";
  echo CHtml::link('Logout ('.Yii::app()->user->name.')', array('site/logout')); 
  echo "</li>";
  echo "<ul>";
}

		?>
	</div><!-- mainmenu -->
	
	</td>
	<td>
	
	<?php echo $content; ?>
	
	</td>
	</tr>
	</table>
	</div>
	
	<div id="footer">
		<?php echo Yii::powered(); ?>
	</div><!-- footer -->

</div><!-- page -->

</body>
</html>
