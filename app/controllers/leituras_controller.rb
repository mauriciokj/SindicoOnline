class LeiturasController < ApplicationController
	def calcular_valores
		leitura = Leitura.find(params[:format])
		leitura.calcular_valores
		redirect_to rails_admin_path
	end	
end