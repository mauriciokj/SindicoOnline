class ContaPorApartamento < ActiveRecord::Base
	belongs_to :conta
	belongs_to :apartamento
	belongs_to :imovel
	attr_accessible :paga, :valor, :apartamento_id, :imovel_id

	delegate :vencimento, :to => :conta
	delegate :descricao, :to => :conta

	def name
		"#{self.apartamento.bloco} - #{self.apartamento.numero}: #{self.valor}" rescue nil
	end

	def status
		paga? ? "PAGA" : "PENDENTE"
	end

	rails_admin do
		label "Conta por apartamento"
		edit do
			field :contado do
				visible do
					false
				end
			end
			field :imovel_id, :enum do
				enum do
					Imovel.where(:id => bindings[:view]._current_user.imovel_id).collect { |c| [c.nome, c.id] }	
				end
			end
			field :apartamento
			field :valor
			field :paga
		end

		list do
			field :conta
			field :imovel
			field :apartamento
			field :valor
			field :paga
		end
	end
end
