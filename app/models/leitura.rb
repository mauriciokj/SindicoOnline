class Leitura < ActiveRecord::Base
	attr_accessible :consumo, :data_leitura, :data_vencimento, :leitura_anterior, :leitura_atual, :matricula, :valor
	has_many :apartamentos_leituras

	def to_label
		"#{matricula}"
	end

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


end
