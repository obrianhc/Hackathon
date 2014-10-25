function carga(){
	var municipio = document.getElementById('pac-input').value;
	municipio = municipio.toUpperCase();
	var valor = { "municipio" : municipio };
	$.ajax({
		data:	valor,
		url:	'data.php',
		type:	'post',
		beforeSend: function(){
			$("#list_result").html("Espere por favor...");
		},
		success:	function(response){
			$("#list_result").html(response);
		}
	});
}
function info(id){
	showEstablecimiento();
	var valor = { "id" : id };
	$.ajax({
		data:	valor,
		url:	'data.php',
		type:	'post',
		beforeSend: function(){
			$("#EBody").html("Espere por favor...");
		},
		success:	function(response){
			$("#EBody").html(response);
		}
	});
}

function showEstablecimiento(){
	document.getElementById('Emergente').style.display = "block";
}

function hideEstablecimiento(){
	document.getElementById('Emergente').style.display = "none";
}

function comparar(){
	showEstablecimiento();
	var idArray = new Array();
	$.each($("input[name='centros[]']:checked"), function() {
		idArray.push($(this).val());
	});
	var valor = {"idArray":idArray};
	$.ajax({
		data:	valor,
		url:	'data.php',
		type:	'post',
		beforeSend: function(){
			$("#EBody").html("Espere por favor...");
		},
		success:	function(response){
			$("#EBody").html(response);
		}
	});
}

