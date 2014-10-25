var map;
var infowindow;
var service;
var markers=[];
var geocoder;
var input;
var posLat;
var posLng;
var radio = 100;
var color_circulo = '#FF0000';
var pos;
var directionsService = new google.maps.DirectionsService();
var directionsDisplay;
var cross;
var zoom=14;
var InstitucionesEdu=1;
var Hospitales=0;
var Gas=0;
var Muni=0;
function initialize() {
directionsDisplay = new google.maps.DirectionsRenderer();
map = new google.maps.Map(document.getElementById('map-canvas'), {
    zoom: zoom
	,streetViewControl:false
	//,zoomControl:false
	,mapTypeControl:false
  });
directionsDisplay.setMap(map);
        
  findMe();
	
  infowindow = new google.maps.InfoWindow();
  service = new google.maps.places.PlacesService(map);
    var but = /** @type {HTMLInputElement} */(
      document.getElementById('but'));
  map.controls[google.maps.ControlPosition.TOP_RIGHT].push(but);
  var butMe = /** @type {HTMLInputElement} */(
      document.getElementById('butMe'));
  map.controls[google.maps.ControlPosition.TOP_RIGHT].push(butMe);
  var combo = /** @type {HTMLInputElement} */(
      document.getElementById('combo'));
  map.controls[google.maps.ControlPosition.RIGHT_BOTTOM].push(combo);
  
      input = /** @type {HTMLInputElement} */(
      document.getElementById('pac-input'));
  map.controls[google.maps.ControlPosition.TOP_CENTER].push(input);
  
    var km = /** @type {HTMLInputElement} */(
      document.getElementById('km'));
  map.controls[google.maps.ControlPosition.BOTTOM_LEFT].push(km);
    var range = /** @type {HTMLInputElement} */(
      document.getElementById('range'));
  map.controls[google.maps.ControlPosition.LEFT_BOTTOM].push(range);
  
  
  
  range.value=10;
  km.value="100 M"
  
  var searchBox = new google.maps.places.SearchBox(
    /** @type {HTMLInputElement} */(input));
 google.maps.event.addListener(searchBox, 'places_changed', function() {
    var places = searchBox.getPlaces();

    if (places.length == 0) {
      return;
    }
    for (var i = 0, marker; marker = markers[i]; i++) {
      marker.setMap(null);
    }

    
    markers = [];
    var bounds = new google.maps.LatLngBounds();
    for (var i = 0, place; place = places[i]; i++) {
      bounds.extend(place.geometry.location);
    }
    map.fitBounds(bounds);
	map.setZoom(zoom);
	find(true);
  });
  cross = new google.maps.Marker({
		map: map,
		position: map.center,
		icon: 'images/cross.png'
	});
  google.maps.event.addListener(map, 'bounds_changed', function() {
    cross.setPosition(map.center);
	var bounds = map.getBounds();
    searchBox.setBounds(bounds);
	
  });
  
  }
	function findMe(){
	deleteMarkers();
	if(navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(function(position) {
      var posi = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
	  geocoder = new google.maps.Geocoder();
	  codeLatLng(position.coords.latitude, position.coords.longitude)

	  locate(posi);
	  },function() {
      errloc();
    });
	}else{
		errloc();
	}
	}
  function codeLatLng(lat, lng) {

    var latlng = new google.maps.LatLng(lat, lng);
    geocoder.geocode({'latLng': latlng}, function(results, status) {
      if (status == google.maps.GeocoderStatus.OK) {
      
	  
       if (results[1]) {
         
         
		input.value="";
        for (var i=0; i<results[0].address_components.length; i++) {
            for (var b=0;b<results[0].address_components[i].types.length;b++) {

                if (results[0].address_components[i].types[b] == "administrative_area_level_2") {
                
                    city= results[0].address_components[i];
					input.value=city.long_name;
                    break;
                }
            }
        }
        } 
      } 
    });
  }
function errloc(){
alert("La geolocalizaci&oacute;n tuvo un error");
var posi = new google.maps.LatLng(14.605,-90.520);
		locate(posi);
}
function locate(posit){
pos=posit;
map.setCenter(posit);
 var populationOptions = {
      strokeColor: color_circulo,
      strokeOpacity: 0.9,
      strokeWeight: 1,
      fillColor: color_circulo,
      fillOpacity: 0.15,
      map: map,
      center: map.center,
      radius: radio
	  ,clickable:false
	  };
    var cityCircle = new google.maps.Circle(populationOptions);
	markers.push(cityCircle);
	  search(posit);

	var marker = new google.maps.Marker({
		map: map,
		position: posit,
		icon: 'images/punto.png'
	});markers.push(marker);
}


function search(posit){
if(InstitucionesEdu==1){
var request = {
    location: posit,
    radius: radio,
    types: ['university']
  };
  entityType="U";
  service.nearbySearch(request, callback);
 var request = {
    location: posit,
    radius: radio,
    types: ['school']
  };
  entityType="E";
  service.nearbySearch(request, callback);
  }else
  if(Hospitales==1){
	var request = {
    location: posit,
    radius: radio,
    types: ['hospital']
  };
  entityType="H";
  service.nearbySearch(request, callback);
  }else 
  if(Gas==1){
	var request = {
    location: posit,
    radius: radio,
    types: ['gas_station']
  };
  entityType="G";
  service.nearbySearch(request, callback);
  }else
  if(Muni==1){
	var request = {
    location: posit,
    radius: radio,
    types: ['city-hall']
  };
  entityType="M";
  service.nearbySearch(request, callback);
  }
  
}
function callback(results, status) {
  if (status == google.maps.places.PlacesServiceStatus.OK) {
    for (var i = 0; i < results.length; i++) {
      create(results[i]);
    }
  }
}
function create(place) {
  var placeLoc = place.geometry.location;
  var icony;
  var htmly;
  switch(entityType){
  case "E":
  icony='images/escuela.png';
  htmly="images/e.png width = 20> Escuela";
  break;
  case "M":
  icony='images/muni.png';
  htmly="images/m.png width = 20> Municipalidad";
  break;
  case "H":
  icony='images/Hospital.png';
  htmly="images/H.png width = 20> Hospital";
  break;
  case "U":
  icony='images/universidad.png';
  htmly="images/u.png width = 20> Universidad";
  break;
  case "G":
  icony='images/gasolinera.png';
  htmly="images/g.png width = 20> Gasolinera";
  break;
  }
  var marker = new google.maps.Marker({
    map: map,
    position: place.geometry.location,
	icon: icony
  });
  markers.push(marker);
  
google.maps.event.addListener(marker, 'click', function() {
    var contentHtml = "<center><table><tr><td><center><img src='images/copret.jpg' width=100%></center></td></tr></table><table border=3 width=100%><tr><th colspan=2><center>"+place.name+"</center></th><tr><td width=50%><b>Tipo</b></td><td width=50%><center><img src="+htmly+"</center></td></tr><tr><td width=50%><b>Direccion</b></td><td width=50%><center>"+place.vicinity+"</center></td></tr><tr><td width=50%><b>Posicion(latitud,longitud)</b></td><td width=50%><center>"+marker.position+"</center></td></tr></table>";
	infowindow.setContent(contentHtml);
    infowindow.open(map, this);
	calcRoute(marker.position,pos);
  });
}
function setAllMap(map) {
  for (var i = 0; i < markers.length; i++) {
    markers[i].setMap(map);
  }
}
function clearMarkers() {
  setAllMap(null);
}
function deleteMarkers() {
  clearMarkers();
  markers = [];
}
function find(relocate){
	deleteMarkers();
	if(relocate==true){
	pos=map.center;
	}
	locate(pos);
	codeLatLng(pos.lat(),pos.lng());
}
function calcRoute(latlngD,latlngO) {
  var request = {
    origin:latlngO,
    destination:latlngD,
    travelMode: google.maps.TravelMode.WALKING
  };
  directionsService.route(request, function(result, status) {
    if (status == google.maps.DirectionsStatus.OK) {
      directionsDisplay.setDirections(result);
	  
	  google.maps.event.addListener(result, 'click', function() {
    infowindow.setContent("soy una ruta");
    infowindow.open(map, this);
  });
	  
    }
	
  });
  
}
function Cambio(){
		InstitucionesEdu=0;
		Hospitales=0;
		Gas=0;
		Muni=0;
	if(combo.value==1){
		InstitucionesEdu=1;
	}else if(combo.value==2){
		Hospitales=1;
	}else if(combo.value==3){
		Gas=1;
	}else if(combo.value==4){
		Muni=1;
	}
	find(false);
}
function changeRatio(){
	km.value=range.value*10+" M";
	radio=range.value*10;
	find(false);
}