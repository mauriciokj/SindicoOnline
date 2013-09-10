$(document).ready(function () {
	$("#link-valores").on("click", function (event){
		$.ajax({
			type: "GET",
			url: "/totais_apartamento/",
			data: {
				total: 1
			}
		});
	});


});