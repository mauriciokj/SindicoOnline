class Estado < ActiveRecord::Base
	has_many :cidades
	attr_accessible :nome, :sigla

	alias_attribute :to_label, :sigla
end
