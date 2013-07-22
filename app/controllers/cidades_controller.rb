class CidadesController < ApplicationController
	before_filter :authenticate_usuario!
	active_scaffold :cidade do |conf|
		conf.columns = [:nome, :estado]
		conf.columns[:estado].clear_link
		conf.columns[:estado].form_ui = :select
	end
end
