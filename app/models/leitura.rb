class Leitura < ActiveRecord::Base
	has_many :apartamentos_leituras
	attr_accessible :consumo, :data_leitura, :data_vencimento, :leitura_anterior, :leitura_atual, :matricula, :valor, :paga, :apartamento_leitura_ids
	

	def to_label
		"#{I18n.l(data_leitura) rescue ""}, valor: #{valor}"
	end

	alias_attribute :name, :to_label

	def calcular_valores
		soma_das_diferencas = self.apartamentos_leituras.sum(:consumo)
		diferenca_geral = (soma_das_diferencas - self.consumo) / self.apartamentos_leituras.count
		self.apartamentos_leituras.each do |al|
			al.diferenca_ajustada =  al.consumo - diferenca_geral
			al.porcentagem = (al.diferenca_ajustada * 100) / self.consumo
			al.valor = (self.valor * al.porcentagem)/100
			al.save
		end 
		self.save
	end	

	def status
		paga? ? "PAGA" : "PENDENTE"
	end

	rails_admin do
		label "Leituras"

		edit do
			field :matricula
			field :data_leitura
			field :data_vencimento
			field :consumo
			field :leitura_anterior
			field :leitura_atual
			field :valor
			field :paga
			field :apartamentos_leituras
		end

		list do
			field :data_leitura
			field :data_vencimento
			field :consumo
			field :leitura_anterior
			field :leitura_atual
			field :valor
			field :paga
		end

	end


end
