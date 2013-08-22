// var map;
// var canvas;

// var display_map = function (lat, long, zoom) {

//   canvas = $('#map_canvas')[0];

//   if (! canvas)
//     return; // I QUIT

//   var mapOptions = {
//     center: new google.maps.LatLng(lat, long),
//     zoom: zoom,
//     mapTypeId: google.maps.MapTypeId.ROADMAP
//   };

//   map = new google.maps.Map(canvas, mapOptions);
// };

//   var center_map = function (lat,long,zoom){
//     var latlong = new google.maps.LatLng(lat, long);
//     map.setCenter(latlong);
//   }


// $(document).ready(function () {
//   display_map(-33.89336, 151.217167, 13);
// });
$(document).ready(function () {



var map;
var markers = [];

function initialize() {
  var mapOptions = {
    zoom: 15,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };
  map = new google.maps.Map(document.getElementById('map_canvas'),
      mapOptions);

  // Try HTML5 geolocation
  if(navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(function(position) {
      var pos = new google.maps.LatLng(position.coords.latitude,
                                       position.coords.longitude);

      var infowindow = new google.maps.InfoWindow({
        map: map,
        position: pos,
        content: 'Location found using HTML5.'
      });

      map.setCenter(pos);
    }, function() {
      handleNoGeolocation(true);
    });
  } else {
    // Browser doesn't support Geolocation
    handleNoGeolocation(false);
  }
}

function handleNoGeolocation(errorFlag) {
  if (errorFlag) {
    var content = 'Error: The Geolocation service failed.';
  } else {
    var content = 'Error: Your browser does not support geolocation.';
  }

  var options = {
    map: map,
    position: new google.maps.LatLng(60, 105),
    content: content
  };

  var infowindow = new google.maps.InfoWindow(options);
  map.setCenter(options.position);
}

google.maps.event.addDomListener(window, 'load', initialize);




})