class Cidade < ActiveRecord::Base
	belongs_to :estado
	attr_accessible :nome
	delegate :sigla, :to => :estado, :allow_nil => true

	def to_label
		"#{nome} - #{sigla}"
	end
end
