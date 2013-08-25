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

$('#search_field').bind('keypress', function(e) {
  if(e.keyCode==13){
    $('#search_submit').trigger('click');
  }
});


$('#search_submit').click(function() {
    var search = $('#search_field').val(); //defined var search to the value input by the user inside the search box

    $.ajax({

        dataType: 'json',
        data: {
          'location': search //the data sent via ajax is in a hash so created a :location key for the search variable
        },
        type: 'post',
        url: '/search/', //change the routes to make this url go to the correct controller which is home and create a method called search inside of it
    }).done(function(data) { //function(data) is getting back the shit we got from the controller
        var lat = data.latitude //the data we got is the variables we set in the controller
        var longi = data.longitude
      // $('#map_canvas').empty(); //empty the map area you were on
     center_map(lat, longi)

      });
     });//call the display map function above which displays it with the lat and long we got from the controller


  var center_map = function (lat,long,zoom){
    var latlong = new google.maps.LatLng(lat, long);
    map.setCenter(latlong);
  }




})