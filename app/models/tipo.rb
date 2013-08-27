class Tipo < ActiveRecord::Base
	attr_accessible :descricao
	has_many :leituras
	has_many :apartamentos_leituras
	validates :descricao, :presence => true
end
