class Apartamento < ActiveRecord::Base
  attr_accessible :bloco, :numero
  has_many :apartamentos_leituras

  def to_label
    "Bloco: #{bloco} - Numero: #{numero}"
  end
end
