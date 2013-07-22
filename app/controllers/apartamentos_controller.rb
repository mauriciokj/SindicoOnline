class ApartamentosController < ApplicationController
	before_filter :authenticate_usuario!
	active_scaffold :apartamento do |conf|
	end
end
