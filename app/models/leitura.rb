class Leitura < ActiveRecord::Base
	has_many :apartamentos_leituras, :dependent => :delete_all
	belongs_to :tipo
	belongs_to :imovel
	attr_accessible :consumo, :data_leitura, :data_vencimento, :leitura_anterior, :leitura_atual, :matricula, :valor, :paga, :apartamento_leitura_ids, :tipo_id
	

	def to_label
		"#{I18n.l(data_leitura) rescue ""}, valor: #{valor}"
	end

	alias_attribute :name, :to_label

	def calcular_valores
		soma_das_diferencas = self.apartamentos_leituras.where("consumo >= 1").sum(:consumo).round(2)
		
		puts "SOMA DAS DIFERENCAS #{soma_das_diferencas}"
		diferenca_geral = (soma_das_diferencas - self.consumo rescue 0) / self.apartamentos_leituras.where("consumo >= 1").count
		puts "DIFERENCA GERAL #{diferenca_geral}"
		self.apartamentos_leituras.each do |al|
			al.diferenca_ajustada =  al.consumo.round(2) - diferenca_geral.round(2)
			puts "al.diferenca_ajustada #{al.diferenca_ajustada}"
			self.consumo = soma_das_diferencas.round(2) if (self.consumo.blank? || self.consumo == 0)
			puts "self.consumo #{self.consumo}"
			al.porcentagem = (al.diferenca_ajustada.round(2) * 100) / self.consumo.round(2)
			puts "al.porcentagem #{al.porcentagem}"
			puts "self #{self}"
			puts "self.valor #{self.valor}"
			al.valor = al.consumo >= 1 ? (self.valor.round(2) * al.porcentagem.round(2))/100 : 0
			al.save
		end 
		self.save
	end	

	def status
		paga? ? "PAGA" : "PENDENTE"
	end

	rails_admin do
		label "Leituras"

		edit do
			field :tipo
			field :matricula
			field :data_leitura
			field :data_vencimento
			field :consumo
			field :leitura_anterior
			field :leitura_atual
			field :valor
			field :paga
			field :apartamentos_leituras
		end

		list do
			field :tipo
			field :data_leitura
			field :data_vencimento
			field :consumo
			field :leitura_anterior
			field :leitura_atual
			field :valor
			field :paga
		end

	end


end
