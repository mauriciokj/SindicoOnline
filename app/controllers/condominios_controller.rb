class CondominiosController < ApplicationController
	layout 'principal'
	before_filter :authenticate_usuario!

	def lancar_condominios
		@usuario = current_usuario
		@condominio = @usuario.imovel
		render  formats: [:js]
	end
end