<?php
/* @var $this SiteController */

$this->pageTitle=Yii::app()->name . ' - Graph';
$this->breadcrumbs=array(
	'Graph',
);

echo "<legend>Graph</legend>";

/*
$array=array(array(200,'jun'),array(129,'jul'),array(143,'aug'),array(159,'sep'),array(67,'oct'));
$this->widget('jqBarGraph',
array('values'=>$array,
'type'=>'simple',
'width'=>200,
'color1'=>'#122A47',
//'color2'=>'#1B3E69',
'color2'=>'#ddddff',
'space'=>5,
'title'=>'simple graph'));
*/

/*
$array3=array(array(array(5,15,26),2008),array(array(14,6,26),2009),array(array(17,3,29),2010));
$colors2=array('#242424','#437346','#97D95C');
$legends2=array('legend1','legend2','legend3');
$this->widget('jqBarGraph',
array('values'=>$array3,
'type'=>'stacked',
'width'=>500,
'colors'=>$colors2,
'legend'=>true,
'legends'=>$legends2,
'title'=>'stacked graph'));
*/

/*
 $this->widget(
            'chartjs.widgets.ChBars', 
            array(
                'width' => 600,
                'height' => 300,
                'htmlOptions' => array(),
                'labels' => array("January","February","March","April","May","June"),
                'datasets' => array(
                    array(
                        "fillColor" => "#ff00ff",
                        "strokeColor" => "rgba(220,220,220,1)",
                        "data" => array(10, 20, 30, 40, 50, 60)
                    )       
                ),
                'options' => array()
            )
        ); 
*/

        $this->widget('ext.Hzl.google.HzlVisualizationChart', array('visualization' => 'ColumnChart',
            'data' => array(
                array('Task', 'ACT 2014','BUD 2015'),
                array('Jan', 11,25),
                array('Feb', 3.50,4),
                array('Mar', 2,1),
                array('Apr', 5,4),
                array('May', 15,14),
                array('Jun', 7,6)
            ),
            'options' => array('title' => 'EBIT',
			                   'legend' => array('position' => 'right')   
			)));

		
?>

<div class="row"> 
    <div class="span6" >  
        <?php
/*		
//very useful google chart
        $this->widget('ext.Hzl.google.HzlVisualizationChart', array('visualization' => 'PieChart',
            'data' => array(
                array('Task', 'Hours per Day'),
                array('Work', 11),
                array('Eat', 2),
                array('Commute', 2),
                array('Watch TV', 2),
                array('Sleep', 7)
            ),
            'options' => array('title' => 'My Daily Activity')));
        
        $this->widget('ext.Hzl.google.HzlVisualizationChart', array('visualization' => 'LineChart',
            'data' => array(
                array('Task', 'Hours per Day'),
                array('Work', 11),
                array('Eat', 2),
                array('Commute', 2),
                array('Watch TV', 2),
                array('Sleep', 7)
            ),
            'options' => array('title' => 'My Daily Activity',
			                   'legend' => array('position' => 'bottom')  
			)));
*/			
			
        ?>

    </div>
</div>