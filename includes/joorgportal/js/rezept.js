$(document).ready(function(){
  /* Hier der jQuery-Code */
 
  $('#einausblendenbild').click(function(){
   	$('#collapseOne').toggle('slow');
  })  
  $('#einausblendenzutaten').click(function(){
   	$('#collapseTwo').toggle('slow');
  })  
  $('#einausblendenzubereitung').click(function(){
   	$('#collapseThree').toggle('slow');
  })  
  
});