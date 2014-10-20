<?php
/**
 * Joomla! component sexypolling
 *
 * @version $Id: controller.php 2012-04-05 14:30:25 svn $
 * @author 2GLux.com
 * @package Sexy Polling
 * @subpackage com_sexypolling
 * @license GNU/GPL
 *
 */

// no direct access
defined('_JEXEC') or die('Restircted access');

jimport( 'joomla.application.component.controller' );
require_once( JPATH_COMPONENT.DS.'helpers'.DS.'helper.php' );

class SexypollingController extends JControllerLegacy
{
	/**
	 * @var		string	The default view.
	 * @since	1.6
	 */
	protected $default_view = 'sexypolling';

	/**
	 * Method to display a view.
	 *
	 * @param	boolean			If true, the view output will be cached
	 * @param	array			An array of safe url parameters and their variable types, for valid values see {@link JFilterInput::clean()}.
	 *
	 * @return	JController		This object to support chaining.
	 * @since	1.5
	 */
	public function display($cachable = false, $urlparams = false)
	{
		// Load the submenu.
		SexypollingHelper::addSubmenu( 'Overview', 'sexypolling');
		SexypollingHelper::addSubmenu( 'Polls', 'sexypolls');
		SexypollingHelper::addSubmenu( 'Answers', 'sexyanswers');
		SexypollingHelper::addSubmenu( 'Categories', 'sexycategories');
		SexypollingHelper::addSubmenu( 'Templates', 'sexytemplates');
		SexypollingHelper::addSubmenu( 'Statistics', 'sexystatistics');

		parent::display();

		return $this;
	}
}
