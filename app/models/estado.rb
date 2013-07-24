class Estado < ActiveRecord::Base
	has_many :cidades
	attr_accessible :nome, :sigla

	alias_attribute :to_label, :sigla
	alias_attribute :name, :to_label

	validates :nome, :presence => true
	validates :sigla, :presence => true


	rails_admin do
		label "Estados"

		edit do
			field :nome
			field :sigla 
		end

		list do
			field :nome
			field :sigla 
		end

	end
end
