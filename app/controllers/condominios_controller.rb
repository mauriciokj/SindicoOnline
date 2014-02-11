class CondominiosController < ApplicationController
	layout 'principal'
	before_filter :authenticate_usuario!

	def lancar_condominios
		@usuario = current_usuario
		@condominio = @usuario.imovel
		render  formats: [:js]
	end

	def gerar_condominios
		valor = params[:valor]
		data = params[:data]
		apartamentos = Apartamento.where(:id => params[:apartamento_ids])
		render :nothing => true
	end
end