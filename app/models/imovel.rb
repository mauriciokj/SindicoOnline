class Imovel < ActiveRecord::Base
  attr_accessible :nome
  has_many :apartamentos
  belongs_to :cidade
  alias_attribute :to_label, :nome

  validates :nome, :presence => true
  validates :cidade, :presence => true
end
