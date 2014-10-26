<html>
<head>
<title>Prueba</title>
	<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="style/estilo.css">
    <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&libraries=places"></script>
    <script src="js/mapa.js"></script>
    <script>
		google.maps.event.addDomListener(window, 'load', initialize);
    </script>
	<script src="js/jquery-1.11.1.js"></script>
	<script src="js/ajax.js"></script>
</head>

<body>
	<script>
      window.fbAsyncInit = function() {
        FB.init({
          appId      : '1526953774213191',
          xfbml      : true,
          version    : 'v2.1'
        });
      };

      (function(d, s, id){
         var js, fjs = d.getElementsByTagName(s)[0];
         if (d.getElementById(id)) {return;}
         js = d.createElement(s); js.id = id;
         js.src = "//connect.facebook.net/en_US/sdk.js";
         fjs.parentNode.insertBefore(js, fjs);
       }(document, 'script', 'facebook-jssdk'));
    </script>
	<header>
		<input type="text" name="edad" id="edad"/>
		<input type="checkbox" name="repite" id="repite"/>
		<select name="grado" id="grado">
			<option></option>
			<option value="2">Parvulos</option>
			<option value="3">Primero Primaria</option>
			<option value="3">Segundo Primaria</option>
			<option value="3">Tercero Primaria</option>
			<option value="3">Cuarto Primaria</option>
			<option value="3">Quinto Primaria</option>
			<option value="3">Sexto Primaria</option>
			<option value="3">Primero B&aacute;sico</option>
			<option value="3">Segundo B&aacute;sico</option>
			<option value="4">Tercero B&aacute;sico</option>
			<option value="4">Cuarto Diversificado</option>
			<option value="4">Quinto Diversificado</option>
			<option value="5">Sexto Diversificado</option>
		</select>
		<input type="text" name="municipio" id="municipio" />
		<input type="button" value="Enviar" onClick="carga();" />
	</header>
	
	<div id="map-canvas"></div>
	<input id="butMe" type="button"  onclick="findMe()"  value="">
	<input id="but" type="button"  onclick="find()"  value="">
	<select id="combo"  list=browsers onchange="Cambio();">
		   <option value="1"> Establecimientos Educativos </option>
		   <option value="2"> Hospitales </option>
		   <option value="3"> Gasolineras </option>
		</select>
	<input id="pac-input" class="controls" type="text" placeholder="Search Box">
	
	</form>
	<footer>
		<input type="button" value="Comparar" onclick="comparar();"/>
		<div id="list_result"></div>
	</footer>
	
	<div id="Emergente">
		<a href="#" onclick="hideEstablecimiento();">x</a>
		<div id="EBody"></div>
	</div>
</body>
</html>