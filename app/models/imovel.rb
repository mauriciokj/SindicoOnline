# -*- encoding : utf-8 -*-
class Imovel < ActiveRecord::Base
	has_many :apartamentos
	attr_accessible :nome, :cidade_id, :bairro,:rua, :cep, :numero, :responsavel, :telefone_responsavel, :email_responsavel, :apartamento_ids

	belongs_to :cidade
	alias_attribute :to_label, :nome
	alias_attribute :name, :to_label

	validates :nome, :presence => true
	validates :cidade, :presence => true

	rails_admin do
		label "Imóveis"

		edit do
			field :nome
			field :cidade 
			field :bairro 
			field :rua 
			field :cep 
			field :numero do
				label "Número"
			end
			field :responsavel do
				label "Responsável"
			end
			field :telefone_responsavel do
				label "Telefone responsável"
			end
			field :email_responsavel do
				label "E-mail responsável"
			end

			field :apartamentos
			

		end

		list do
			field :nome
			field :cidade 
			field :apartamentos
			
		end

	end
end
