class PrincipalController < ApplicationController
	before_filter :authenticate_usuario!
	def index
		@apartamento = current_usuario.apartamento
	end
end
