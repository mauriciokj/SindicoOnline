class ApartamentoLeitura < ActiveRecord::Base

	belongs_to :apartamento
	belongs_to :leitura
	belongs_to :imovel
	belongs_to :tipo
	attr_accessible :consumo, :data, :leitura_apartamento, :valor,:diferenca_ajustada, :porcentagem,
	:apartamento_id, :leitura_id, :paga, :tipo_id
	

	validates :apartamento, :presence => true
	validates :data, :presence => true
	validates :leitura_apartamento, :presence => true

	scope :do_tipo, lambda {|tipo|
		{
			:conditions => ['tipo_id = ?', tipo.id]
		}
	}

	before_save :calcula_consumo, :if => :new_record?

	alias_attribute :name, :to_label


	def to_label
		"#{self.apartamento.to_label rescue ''} - #{self.leitura.to_label rescue ''}" 
	end

	def calcula_consumo
		self.consumo = self.leitura_apartamento - (self.apartamento.apartamentos_leituras.do_tipo(self.tipo).last.leitura_apartamento rescue 0)
	end	

	def status
		paga? ? "PAGA" : "PENDENTE"
	end

	rails_admin do
		
		label "Leituras dos apartamentos"

		edit do
			field :tipo
			field :apartamento
			field :leitura
			field :data
			field :leitura_apartamento
			field :paga
		end

		list do
			field :apartamento
			field :tipo
			field :data
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
