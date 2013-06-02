class ApartamentoLeitura < ActiveRecord::Base
	belongs_to :apartamento
	belongs_to :leitura
	attr_accessible :consumo, :data, :leitura_apartamento, :valor,:diferenca_ajustada, :porcentagem
	

	validates :apartamento, :presence => true
	validates :data, :presence => true

	def calcula_consumo(apartamento)
		self.consumo = self.leitura_apartamento - (apartamento.apartamentos_leituras.last.leitura_apartamento rescue 0)
	end	


end
