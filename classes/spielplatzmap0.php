	

    <?php
    //$dbname            ='testgooglemaps'; //Name of the database
    //$dbuser            ='root'; //Username for the db
    //$dbpass            =''; //Password for the db
    //$dbserver          ='localhost'; //Name of the mysql server
     
    //$dbcnx = mysql_connect ("$dbserver", "$dbuser", "$dbpass");
    //mysql_select_db("$dbname") or die(mysql_error());
    include("../config.php");
    ?>
    <html>
     <head>
     <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
     <title>Google Map API V3 with markers</title>
     <style type="text/css">
     body { font: normal 10pt Helvetica, Arial; }
     #map { width: 640px; height: 480px; border: 0px; padding: 0px; }
     </style>
     <script src="http://maps.google.com/maps/api/js?v=3&sensor=false" type="text/javascript"></script>
     <script type="text/javascript">
     //Sample code written by August Li
     var blue_icon = new google.maps.MarkerImage("http://maps.google.com/mapfiles/ms/micons/blue.png",
             new google.maps.Size(32, 32), new google.maps.Point(0, 0),
             new google.maps.Point(16, 32)
     );
      var red_icon = new google.maps.MarkerImage("http://maps.google.com/mapfiles/ms/micons/red.png",
             new google.maps.Size(32, 32), new google.maps.Point(0, 0),
             new google.maps.Point(16, 32)
     );
     var center = null;
     var map = null;
     var currentPopup;
     var bounds = new google.maps.LatLngBounds();

     function addMarker(lat, lng, info, complete) {
             var pt = new google.maps.LatLng(lat, lng);
             bounds.extend(pt);
             var marker = null;
             if( complete == 0 ){
                      marker = new google.maps.Marker({
                             position: pt,
                             icon: blue_icon,
                             map: map
                     });
            }
            else{
                    marker = new google.maps.Marker({
                             position: pt,
                             icon: red_icon,
                             map: map
                     });
            }
             var popup = new google.maps.InfoWindow({
                     content: info,
                     maxWidth: 300
             });
            google.maps.event.addListener(marker, "click", function() {
                     if (currentPopup != null) {
                             currentPopup.close();
                             currentPopup = null;
                     }
                     popup.open(map, marker);
                     currentPopup = popup;
            });
             google.maps.event.addListener(popup, "closeclick", function() {
             map.panTo(center);
             currentPopup = null;
             });
    }

     function initMap() {
     	alert("initmap");
             map = new google.maps.Map(document.getElementById("map"), {
                     center: new google.maps.LatLng(50.93664488843189, 6.961641311645508),
                     zoom: 11,
                     mapTypeId: google.maps.MapTypeId.ROADMAP,
                     mapTypeControl: false,
                     mapTypeControlOptions: {
                            style: google.maps.MapTypeControlStyle.HORIZONTAL_BAR
                     },
                     navigationControl: true,
                     navigationControlOptions: {
                            style: google.maps.NavigationControlStyle.SMALL
                    }
            });
             <?php
             $query = mysql_query("SELECT * FROM tblmarkers");
             while ($row = mysql_fetch_array($query)){
                     $name=$row['fldname'];
                     $lat=$row['fldlat'];
                     $lon=$row['fldlng'];
                     $desc="";
                     $complete="";
                     //$desc=$row['desc'];
                     //$complete = $row['complete'];
                     echo ("addMarker($lat, $lon,'<b>$name</b><br/>$desc', $complete );\n");
             }
             ?>
             center = bounds.getCenter();
             map.fitBounds(bounds);
     
     }
     </script>
     </head>
     <body onload="initMap()" style="margin:0px; border:0px; padding:0px;">
     <div id="map"></div>
     </html>

