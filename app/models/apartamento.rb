class Apartamento < ActiveRecord::Base
	attr_accessible :bloco, :numero, :imovel_id, :usuario_ids
	has_many :apartamentos_leituras
	has_many :contas_por_apartamentos
	belongs_to :imovel
	alias_attribute :name, :to_label
	has_many :usuario

	scope :leituras_em_aberto, lambda {
		{
			:include => :apartamentos_leituras,
			:conditions => ['apartamentos_leituras.paga = ?', false]
		}
	}

	scope :leituras_pagas, lambda {
		{
			:include => :apartamentos_leituras,
			:conditions => ['apartamentos_leituras.paga = ?', true]
		}
	}

	scope :contas_em_aberto, lambda {
		{
			:include => :contas_por_apartamentos,
			:conditions => ['contas_por_apartamentos.paga = ?', false]
		}
	}

	scope :contas_pagas, lambda {
		{
			:include => :contas_por_apartamentos,
			:conditions => ['contas_por_apartamentos.paga = ?', true]
		}
	}

	scope :do_numero, lambda {|apartamento|
		{
			:conditions => ['numero = ?', apartamento]
		}
	}
	scope :do_bloco, lambda {|bloco|
		{
			:conditions => ['bloco = ?', bloco]
		}
	}



	def to_label
		"Bloco: #{bloco} - Nro: #{numero}"
	end

	def total_a_pagar
		total = Apartamento.do_bloco(self.bloco).do_numero(self.numero).contas_em_aberto.sum(:valor).to_f + Apartamento.do_bloco(self.bloco).do_numero(self.numero).leituras_em_aberto.sum(:valor).to_f

	end

	rails_admin do
		label "Apartamento"

		edit do
			field :bloco
			field :numero
			field :imovel
			field :usuario
			
		end

		list do
			field :bloco
			field :numero
			field :imovel
			field :usuario
		end

	end
end
