# -*- encoding : utf-8 -*-
class Pessoa < ActiveRecord::Base
	belongs_to :cidade
	belongs_to :apartamento
	attr_accessible :nome, :tipo, :cpf_cnpj, :email, :rg_ie, :rua, :bairro, :cep, :cidade_id, :telefone, :celular

	validates :nome, :presence => true
	validates :cpf_cnpj, :uniqueness => true, :format => { :with => /^(\d{14})$/}, :allow_blank => true, :if => :juridica?
	validates :cpf_cnpj, :uniqueness => true, :format => { :with => /^(\d{11})$/}, :allow_blank => true, :if => :fisica?
	validates :tipo, :format => { :with => /\A+F|J\z/, :message => "O tipo deve ser F (física) ou J (jurídica)"}
	alias_attribute(:name, :nome)

	def juridica?
		tipo == 'J'
	end

	def fisica?
		tipo == 'F'
	end

	def tipo_enum
		[[ 'F - Física', 'F' ], [ 'J - Jurídica', 'J' ]]
	end

	def autocomplete_pessoa
		"#{nome} - #{cpf_cnpj}"
	end  

	rails_admin do
		edit do 
			field :nome
			field :tipo  do
				help ""
			end
			field :cpf_cnpj do
				label "CPF / CNPJ"
				help "11 ou 14 dígitos (sem máscara)"
			end
			field :rg_ie do
				label "RG / IE"
				help ""
			end
			field :cep
			field :rua
			field :bairro
			field :cidade
			field :email
			field :telefone
			field :celular
		end

		list do
			field :nome
			field :tipo
			field :cpf_cnpj do
				label "CPF / CNPJ"
			end
			field :rg_ie do
				label "RG / IE"
			end
			field :email
		end

	end
end
