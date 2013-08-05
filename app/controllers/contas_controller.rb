class ContasController < ApplicationController
	def calcular_valores
		conta = Conta.find(params[:format])
		conta.calcular_valores
		redirect_to rails_admin_path
	end	
end