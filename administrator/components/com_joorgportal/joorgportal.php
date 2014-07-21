<?php

// No direct access to this file
defined('_JEXEC') or die('Restricted access');
 
// Access check.
if (!JFactory::getUser()->authorise('core.manage', 'com_joorgportal')) 
{
	return JError::raiseWarning(404, JText::_('JERROR_ALERTNOAUTHOR'));
}

if(!defined('DS')){
define('DS',DIRECTORY_SEPARATOR);
}
 
// require helper file
JLoader::register('joorgportalHelper', dirname(__FILE__) . DS . 'helpers' . DS . 'joorgportal.php');
 
// import joomla controller library
jimport('joomla.application.component.controller');
 
// Get an instance of the controller prefixed by joorgportal
$controller = JControllerLegacy::getInstance('joorgportal');
 
// Perform the Request task
$controller->execute(JRequest::getCmd('task'));
 
// Redirect if set by the controller
$controller->redirect();
