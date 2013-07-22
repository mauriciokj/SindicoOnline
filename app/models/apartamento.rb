class Apartamento < ActiveRecord::Base
  attr_accessible :bloco, :numero
  has_many :apartamentos_leituras
  belongs_to :imovel

  def to_label
    "Bloco: #{bloco} - Numero: #{numero}"
  end
end
