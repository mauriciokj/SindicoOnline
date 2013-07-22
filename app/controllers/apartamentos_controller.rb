class ApartamentosController < ApplicationController
	before_filter :authenticate_usuario!
	active_scaffold :apartamento do |conf|
		conf.columns = [:bloco, :numero, :imovel]
		conf.columns[:imovel].form_ui = :select
		conf.columns[:imovel].clear_link
	end
end
