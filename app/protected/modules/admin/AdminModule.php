<?php
class AdminModule extends CWebModule
{
    // Wohin soll es gehen, wenn man nur "admin" aufruft?
    public $defaultController='site/index';

    public function init()
    {
        // Den Namen der Web Application ändern
        Yii::app()->name = "Backend - My Web Application";

        // Lade mit alle Models und Komponenten aus dem Admin Modul
        $this->setImport(array(
            'admin.models.*',
            'admin.components.*',
        ));
    }
}