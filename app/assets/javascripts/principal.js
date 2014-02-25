$(document).ready(function () {
	// $('.data_picker').datepicker({ dateFormat:"dd/mm/yy" });
	$("#link-valores").on("click", function (event){
		$.ajax({
			type: "GET",
			url: "/totais_apartamento/"
		});
	});

	$("#link-lancamentos").on("click", function (event){

		$.ajax({
			type: "GET",
			url: "/leituras/"
		});
	});

$("#link-lancar-condominios").on("click", function (event){
		$.ajax({
			type: "GET",
			url: "/lancar_condominios/"
		});
	});

	$("#pagar").on("click", function (event){
		if (confirm('Você tem certeza que deseja fazer isso?')) {
			apartamento_id = $(this).attr("value")
			$.ajax({
				type: "GET",
				url: "/pagar/" + apartamento_id


			});}
		});


});

$(document).ajaxComplete(function () {
	
	$('.data_picker').datepicker({ dateFormat:"dd/mm/yy" });
	$(".pagar_conta").unbind( "click" );
	$(".pagar_conta").on("click", function (event){
		
		if (confirm('Você tem certeza que deseja fazer isso?')) {
			apartamento_id = $(this).attr("value")
			$.ajax({
				type: "GET",
				url: "/pagar/" + apartamento_id


			});}
		});

});