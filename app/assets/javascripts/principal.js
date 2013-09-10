$(document).ready(function () {
	$("#link-valores").on("click", function (event){
		$.ajax({
			type: "GET",
			url: "/totais_apartamento/"
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
	$("#pagar").on("click", function (event){
		console.log('chegou aqui')
		console.log($(this).attr("value"))
		if (confirm('Você tem certeza que deseja fazer isso?')) {
			apartamento_id = $(this).attr("value")
			$.ajax({
				type: "GET",
				url: "/pagar/" + apartamento_id


			});}
		});

});