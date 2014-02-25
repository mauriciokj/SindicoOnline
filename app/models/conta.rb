class Conta < ActiveRecord::Base
	has_many :contas_por_apartamentos
	belongs_to :imovel
	attr_accessible :descricao, :paga, :valor, :vencimento, :imovel_id, :conta_por_apartamento_ids, :imovel
	

	def status
		paga? ? "PAGA" : "PENDENTE"
	end
	
	def calcular_valores
		numero_de_apartamentos_pagantes = self.contas_por_apartamentos.count
		valor_por_apartamento = (valor.to_f / numero_de_apartamentos_pagantes)

		self.contas_por_apartamentos.each do |ca|
			ca.valor = valor_por_apartamento
			ca.save
		end 
		
	end	

	def name
		self.descricao
	end

	rails_admin do
		label "Conta"
		edit do
			field :descricao
			field :vencimento 
			field :valor
			field :paga
			field :imovel_id, :enum do
				enum do
					Imovel.where(:id => bindings[:view]._current_user.imovel_id).collect { |c| [c.nome, c.id] }	
				end
			end
			field :contas_por_apartamentos
		end

		list do
			field :imovel
			field :descricao
			field :valor
			field :paga
			field :vencimento
			field :contas_por_apartamentos
		end
	end
end
