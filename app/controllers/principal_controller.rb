class PrincipalController < ApplicationController
	before_filter :authenticate_usuario!
	def index
		@usuario = current_usuario
		@apartamento = current_usuario.apartamento
		@leituras_em_aberto = Apartamento.do_bloco(@apartamento.bloco).do_numero(@apartamento.numero).leituras_em_aberto.first.apartamentos_leituras
		@contas_em_aberto = Apartamento.do_bloco(@apartamento.bloco).do_numero(@apartamento.numero).contas_em_aberto.first.contas_por_apartamentos
		@tota_a_pagar = @apartamento.total_a_pagar

		@contas = []

		@leituras_em_aberto.each do |l|
			@contas << {"tipo" =>  "Agua", "vencimento" => l.data, "valor" => l.valor, "status" => l.status}
		end

		@contas_em_aberto.each do |l|
			@contas << {"tipo" =>  l.descricao, "vencimento" => l.vencimento, "valor" => l.valor, "status" => l.status}
		end
		
	end
end
