<?php
/**
 * Element: codifica
 * codifica las URL
 *
 * @package    rar_radio
 * @version    v0.4
 *
 * @author     Roberto Arias <info@rarcompucion.com>
 * @link       http://www.rarcomputacion.com
 * @copyright  Copyright (C) 2010-2013 RARComputacion.com All Rights Reserved
 * @license    http://www.gnu.org/licenses/gpl-2.0.html GNU/GPL
 */

/***************** decodificado de variables **************************/

function base64_url_decode($input) {
	    
	return limpiarCadena(base64_decode(strtr($input, '-_,', '+/=')));
    }
    
function base64_url_encode($input) {

    return limpiarCadena(strtr(base64_encode($input), '+/=', '-_,'));

    }

function limpiarCadena($valor)
{
/*
*	Limpia la cadena de SQL injection
*
*
*/
	$valor = str_ireplace("SELECT","",$valor);
	$valor = str_ireplace("COPY","",$valor);
	$valor = str_ireplace("DELETE","",$valor);
	$valor = str_ireplace("DROP","",$valor);
	$valor = str_ireplace("DUMP","",$valor);
	$valor = str_ireplace(" OR ","",$valor);
	$valor = str_ireplace("%","",$valor);
	$valor = str_ireplace("LIKE","",$valor);
	$valor = str_ireplace("--","",$valor);
	$valor = str_ireplace("^","",$valor);
	$valor = str_ireplace("[","",$valor);
	$valor = str_ireplace("]","",$valor);
	$valor = str_ireplace("\\","",$valor);
	$valor = str_ireplace("!","",$valor);
	$valor = str_ireplace("¡","",$valor);
	$valor = str_ireplace("?","",$valor);
 	$valor = str_ireplace("iframe","",$valor);
	$valor = str_ireplace("&","",$valor);
	$valor = strip_tags($valor);
	return $valor;
}
?>
