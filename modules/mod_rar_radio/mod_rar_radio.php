<?php

// no acceso directo
defined( '_JEXEC' ) or die( 'Restricted access' );
 
// incluir al helper que devolverá los datos, solo una vez

if(!defined('DS')){ // Soluciona el problema de DS en Joomla 3.0
    define('DS',DIRECTORY_SEPARATOR);
}

require_once( dirname(__FILE__).DS.'helper.php' );
$moduleclass_sfx = htmlspecialchars($params->get('moduleclass_sfx')); /// 2.5
$radio = modRARRadioHelper::getRADIO( $params );
require( JModuleHelper::getLayoutPath( 'mod_rar_radio','default') );
?>
