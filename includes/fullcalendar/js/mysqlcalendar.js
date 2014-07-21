$(document).ready(function() {
 

  var date = new Date();
  var d = date.getDate();
  var m = date.getMonth();
  var y = date.getFullYear();

  var calendar = $('#calendar').fullCalendar({
   editable: true,
   header: {
    left: 'prev,next today',
    center: 'title',
    right: 'month,agendaWeek,agendaDay'
   },
   
   events: "http://localhost/joorgportal30/includes/fullcalendar/cal.json",
   
   // Convert the allDay from string to boolean
   eventRender: function(event, element, view) {
    if (event.allDay === 'true') {
     event.allDay = true;
    } else {
     event.allDay = false;
    }
   },
   selectable: true,
   selectHelper: true,
   select: function(start, end, allDay) {
   var title = prompt('Event Title:');
   //var url = prompt('Type Event url, if exits:');
   var url='';
   if (title) {
   start = $.fullCalendar.formatDate(start, "yyyy-MM-dd HH:mm:ss");
   end = $.fullCalendar.formatDate(end, "yyyy-MM-dd HH:mm:ss");

//   $.ajax({
//   url: 'http://localhost/joorgportal30/includes/fullcalendar/add_events.php',
//   data: 'title='+ title+'&start='+ start +'&end='+ end +'&url='+ url ,
//   type: "POST",
//   success: function(json) {
//   alert('Added Successfully');
//   }
//   });

alert('insert-1');
var mysql      = require('mysql');
alert('insert-2');
var connection = mysql.createConnection({
  host     : 'localhost',
  user     : 'root',
  password : 'mysql',
  database : 'dbjoorgportal'
});
alert('insert-3');

connection.connect();

alert('insert-4');
var post  = {title: title, start: start, end:end, url:url};
alert('insert-5');
var query = connection.query('INSERT INTO posts SET ?', post, function(err, result) {
  // Neat!
});
console.log(query.sql);
alert('insert-6');

connection.end();

alert('insert-7');

   calendar.fullCalendar('renderEvent',
   {
   title: title,
   start: start,
   end: end,
   allDay: allDay
   },
   true // make the event "stick"
   );
   }
   calendar.fullCalendar('unselect');
   },
   
   editable: true,
   eventDrop: function(event, delta) {
   start = $.fullCalendar.formatDate(event.start, "yyyy-MM-dd HH:mm:ss");
   end = $.fullCalendar.formatDate(event.end, "yyyy-MM-dd HH:mm:ss");
   $.ajax({
   url: 'http://localhost/joorgportal30/includes/fullcalendar/update_events.php',
   data: 'title='+ event.title+'&start='+ start +'&end='+ end +'&id='+ event.id ,
   type: "POST",
   success: function(json) {
    alert("Updated Successfully");
   }
   });
   },
   eventResize: function(event) {
   start = $.fullCalendar.formatDate(event.start, "yyyy-MM-dd HH:mm:ss");
   end = $.fullCalendar.formatDate(event.end, "yyyy-MM-dd HH:mm:ss");
   $.ajax({
    url: 'http://localhost/joorgportal30/includes/fullcalendar/update_events.php',
    data: 'title='+ event.title+'&start='+ start +'&end='+ end +'&id='+ event.id ,
    type: "POST",
    success: function(json) {
     alert("Updated Successfully");
    }
   });

}
   
  });
  
 });