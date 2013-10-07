# -*- encoding : utf-8 -*-
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

	def pagar
		puts ">>>>>>>>>>>>>>>"
		puts "ENTROU NO PAGAR"
		if current_usuario.admin? || current_usuario.sindico?
			puts "O usuario é admin ou sindico"
			apartamento = Apartamento.find(params['apartamento_id'])
			puts "Apartamento carregado = #{apartamento.inspect}"
			Apartamento.do_bloco(apartamento.bloco).do_numero(apartamento.numero).leituras_em_aberto.first.apartamentos_leituras.each do |al|
				puts "Leituras"
				puts al.inspect
				al.paga = true
				puts al.save
			end
			(Apartamento.do_bloco(apartamento.bloco).do_numero(apartamento.numero).contas_em_aberto.first.contas_por_apartamentos rescue []).each do |al|
				puts "contas"
				puts al.inspect
				al.paga = true
				puts al.save
			end
		end
		redirect_to totais_apartamento_path
	end

	def totais_apartamento
		if current_usuario.admin? || current_usuario.sindico?
			@total_a_pagar = 0
			@usuario = current_usuario
			@apartamentos = @usuario.imovel.apartamentos
			@apartamento = current_usuario.apartamento
			@enviadas = @apartamento.mensagens_enviadas
			@lidas = @apartamento.mensagens_recebidas.lidas
			@nao_lidas = @apartamento.mensagens_recebidas.nao_lidas
			@totais = []
			@total = []
			@apartamentos.each do |apartamento| 
				@total[apartamento.id] = []
				@total_a_pagar += apartamento.total_a_pagar
				(Apartamento.do_bloco(apartamento.bloco).do_numero(apartamento.numero).leituras_em_aberto.first.apartamentos_leituras rescue []).each do |l|
					@total[apartamento.id] << {'apartamento' => apartamento.to_label ,"tipo" =>  l.tipo.descricao, "vencimento" => (l.leitura.data_vencimento rescue "10/#{Date.today.month + 1}/#{Date.today.year}"), "valor" => l.valor, "status" => l.status}
				end
				(Apartamento.do_bloco(apartamento.bloco).do_numero(apartamento.numero).contas_em_aberto.first.contas_por_apartamentos rescue []).each do |l|
					@total[apartamento.id] << {'apartamento' => apartamento.to_label ,"tipo" =>  l.descricao, "vencimento" => l.vencimento, "valor" => l.valor, "status" => l.status}
				end
				@totais << {'pessoas' => apartamento.nome_das_pessoas, 'contas' => @total[apartamento.id] , 'id' => apartamento.id, 'apartamento' => apartamento.to_label, 'valor' => apartamento.total_a_pagar}

			end
		end
		puts ">>>>>>>>>>>>>>>>"
		puts @totais.count
		puts @totais.inspect
		render  formats: [:js]
	end
end
