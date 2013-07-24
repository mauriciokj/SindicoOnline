class Apartamento < ActiveRecord::Base
  attr_accessible :bloco, :numero, :imovel_id, :usuario_ids
  has_many :apartamentos_leituras
  belongs_to :imovel
  alias_attribute :name, :to_label
  has_many :usuario

  def to_label
    "Bloco: #{bloco} - Numero: #{numero}"
  end

  rails_admin do
		label "Apartamento"

		edit do
			field :bloco
			field :numero
			field :imovel
			field :usuario
			
		end

		list do
			field :bloco
			field :numero
			field :imovel
			field :usuario
		end

	end
end
