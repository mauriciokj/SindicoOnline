module ApplicationHelper
	def apartamentos
		current_usuario.imovel.apartamentos
	end

	def imovel
		current_usuario.imovel
	end
end
