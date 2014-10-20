<?php

defined('_JEXEC') or die;

$doc = JFactory::getDocument();

$doc->addStyleSheet('templates/' . $this->template . '/css/bootstrap.css');
$doc->addStyleSheet('templates/' . $this->template . '/css/bootstrap-responsive.css');
$doc->addStyleSheet('templates/' . $this->template . '/css/style.css');
$doc->addScript('/templates/' . $this->template . '/js/main.js', 'text/javascript');

?>
<!DOCTYPE html>
<html>

<head>

    <jdoc:include type="head" />

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

</head>

<body>

    <!-- main container -->
    <div class='container-fluid'>

        <!-- header -->
	<div class='row'>
	        <div class='span12'>
			<jdoc:include type="modules" name="header" style="xhtml" />
		</div>
	</div>
    
        <!-- mid container - includes main content area and right sidebar -->
        <div class='row'>

            <!-- links sidebar -->
            <div class='span3'>
                <div style="padding=10;">
                <!-- <link href='css/bootstrap.css' rel='stylesheet'> -->
                <!-- <legend>Navigation1</legend> -->
                </div>
                <jdoc:include type="modules" name="pos-left" style="xhtml" />
            </div>
		
            <!-- main content area -->
            <div class='span12'>
                <jdoc:include type="modules" name="pos-mainleft" style="xhtml" />
                <jdoc:include type="message" />
                <jdoc:include type="component" />
                <jdoc:include type="modules" name="pos-mainright" style="none" />
            </div>
    
            <!-- right sidebar -->
            <div class='span3'>
                <jdoc:include type="modules" name="pos-right" style="well" />
            </div>
            
        </div>
    
        <!-- footer -->
	<div class='row'>
	        <div class='span12'>
			<jdoc:include type="modules" name="footer" style="xhtml" />
		</div>
	</div>
        
    </div>

</body>

</html>
