class Tipo < ActiveRecord::Base
	attr_accessible :descricao
	has_many :leituras
	has_many :apartamentos_leituras
	validates :descricao, :presence => true

	alias_attribute :to_label, :descricao

	alias_attribute :name, :to_label
	rails_admin do
		
		label "Tipos de leituras"
	end
end
