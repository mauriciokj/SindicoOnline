class Cidade < ActiveRecord::Base
	belongs_to :estado
	attr_accessible :nome, :estado_id
	delegate :sigla, :to => :estado, :allow_nil => true
	alias_attribute :name, :to_label

	validates :cidade, :presence => true
	validates :estado, :presence => true

	def to_label
		"#{nome} - #{sigla}"
	end
	rails_admin do
		label "Cidades"

		edit do
			field :nome
			field :estado
		end

		list do
			field :nome
			field :estado
		end

	end
end
