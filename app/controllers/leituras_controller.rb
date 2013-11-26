class LeiturasController < ApplicationController
	layout 'principal'
	def calcular_valores
		leitura = Leitura.find(params[:format])
		leitura.calcular_valores
		redirect_to rails_admin_path
	end	

	def leituras
		@tipos = Tipo.all
		@leitura = Leitura.new
		render  formats: [:js]
	end
end