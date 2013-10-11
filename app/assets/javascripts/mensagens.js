$(document).ready(function () {
	$('#botao_mensagem').on("click", function(){
		$('#mensagens').toggle("slow")
	});

	$('#contact-submit').on('click', function(){
		
		var mensagem = $('#message').val();
		var  apartamento = $('#seleciona-apartamento').val();
		$.post("/enviar_mensagem",
			{mensagem: mensagem,
				apartamento: apartamento
			})
	});

	$('#marcar_como_lida').on('click', function(){
		var ids = []
		$.each($('.mensagem:checked'),function(i,v){
			ids.push(v.id); 
		})
		$.post("/marcar_como_lida",
			{ids: ids
			})
	});

	$('#marcar_como_nao_lida').on('click', function(){
		var ids = []
		$.each($('.mensagem:checked'),function(i,v){
			ids.push(v.id); 
		})
		$.post("/marcar_como_nao_lida",
			{ids: ids
			})
	});

	$('#deletar_mensagens').on('click', function(){
		var ids = []
		$.each($('.mensagem:checked'),function(i,v){
			ids.push(v.id); 
		})
		$.post("/deletar_mensagens",
			{ids: ids
			})
	});
});