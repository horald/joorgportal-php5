<?php
defined('_JEXEC') or die;

class modRARRadioHelper

{
static function getRADIO($params)
{
	$mostrar= $params->get('mostrar');
	if ($mostrar==1) {
		$mensaje= $params->get('mensaje'); }
	else { $mensaje ="" ; }
		return $mensaje;

	}
}
?>
