class ApartamentoLeitura < ActiveRecord::Base

	belongs_to :apartamento
	belongs_to :leitura
	belongs_to :imovel
	attr_accessible :consumo, :data, :leitura_apartamento, :valor,:diferenca_ajustada, :porcentagem,
	:apartamento_id, :leitura_id, :paga
	

	validates :apartamento, :presence => true
	validates :data, :presence => true

	before_save :calcula_consumo, :if => :new_record?

	alias_attribute :name, :to_label

	def to_label
		"#{self.apartamento.to_label rescue ""} - #{self.leitura.to_label rescue ""}" 
	end

	def calcula_consumo
		self.consumo = self.leitura_apartamento - (self.apartamento.apartamentos_leituras.last.leitura_apartamento rescue 0)
	end	

	def status
		paga? ? "PAGA" : "PENDENTE"
	end

	rails_admin do
		
		label "Leituras dos apartamentos"

		edit do
			field :apartamento
			field :leitura
			field :data
			field :leitura_apartamento
			field :paga
		end

		list do
			field :apartamento
			field :data
			field :leitura
			field :consumo do
				pretty_value do # used in list view columns and show views, defaults to formatted_value for non-association fields
					value.round(2) rescue value
				end
			end
			field :leitura_apartamento
			field :valor do
				pretty_value do # used in list view columns and show views, defaults to formatted_value for non-association fields
					ActionController::Base.helpers.number_to_currency(value)
				end
			end
			field :paga

		end

	end

end
