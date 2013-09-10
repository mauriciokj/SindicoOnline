class PrincipalController < ApplicationController
	before_filter :authenticate_usuario!
	def index
		@usuario = current_usuario
		@apartamento = current_usuario.apartamento
		@apartamentos = @apartamento.imovel.apartamentos
		@leituras_em_aberto = Apartamento.do_bloco(@apartamento.bloco).do_numero(@apartamento.numero).leituras_em_aberto.first.apartamentos_leituras rescue []
		@contas_em_aberto = Apartamento.do_bloco(@apartamento.bloco).do_numero(@apartamento.numero).contas_em_aberto.first.contas_por_apartamentos rescue []
		@tota_a_pagar = @apartamento.total_a_pagar
		@enviadas = @apartamento.mensagens_enviadas
		@lidas = @apartamento.mensagens_recebidas.lidas
		@nao_lidas = @apartamento.mensagens_recebidas.nao_lidas
		@contas = []

		@leituras_em_aberto.each do |l|
			@contas << {"tipo" =>  l.tipo.descricao, "vencimento" => (l.leitura.data_vencimento rescue "10/#{Date.today.month + 1}/#{Date.today.year}"), "valor" => l.valor, "status" => l.status}
		end

		@contas_em_aberto.each do |l|
			@contas << {"tipo" =>  l.descricao, "vencimento" => l.vencimento, "valor" => l.valor, "status" => l.status}
		end
		
	end

	def totais_apartamento
		@total_a_pagar = 0
		@usuario = current_usuario
		@apartamentos = @usuario.imovel.apartamentos
		@totais = []
		@apartamentos.each do |apartamento| 
			@total_a_pagar += apartamento.total_a_pagar
			@totais << {'apartamento' => apartamento.to_label, 'valor' => apartamento.total_a_pagar}
		end
		render  formats: [:js]
	end
end
