# -*- encoding : utf-8 -*-
class Imovel < ActiveRecord::Base
	has_many :apartamentos
	attr_accessible :nome, :cidade_id, :bairro,:rua, :cep, :numero, :responsavel, :telefone_responsavel, :email_responsavel, :apartamento_ids, :valor_do_condominio

	belongs_to :cidade


	def name
		nome rescue nil
	end

	validates :nome, :presence => true
	validates :cidade, :presence => true

	def apartamentos_ativos
		self.apartamentos.where(:ativo => true)
	end

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
			field :valor_do_condominio
			

		end

		list do
			field :nome
			field :cidade 
			field :apartamentos
			field :valor_do_condominio
		end

	end
end
