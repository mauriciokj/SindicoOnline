class EstadosController < ApplicationController
	before_filter :authenticate_usuario!
	active_scaffold :estado do |conf|
		conf.columns = [:sigla, :nome]
	end
end
