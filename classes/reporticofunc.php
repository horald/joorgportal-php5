<?php
  require_once('../../../tools/reportico/reportico.php'); 
//  $q = new reportico();
//  $q->initial_project = "Joorgportal";
//  $q->initial_project_password = "earth1moon";
//  $q->initial_report = "Notizen.xml";
//  $q->initial_execute_mode = "MENU";
//  $q->access_mode = "SInGLEPROJECT";
//  $q->embedded_report = true;
//  $q->user_parameters["lnumber"] =  $_POST['cmblnumber'];
//  $q->execute();

  $q = new reportico();
  $q->allow_debug = true;
  $q->initial_project = "Joorgportal";
  $q->initial_report = "Notizen.xml";
  $q->initial_execute_mode = "PREPARE";
  $q->initial_output_format = "HTML";
  $q->access_mode = "REPORTOUTPUT";
  $q->embedded_report = true;
  $q->show_refresh_button = true;
  $q->reportico_ajax_mode = true;
  $q->show_refresh_button = true;
  $q->reportico_ajax_mode = true;
  $q->external_param1 = get_reportico_session_param("external_param1");
  $q->external_param2 = get_reportico_session_param("external_param2");
  $q->execute();  
?>