class LeiturasController < ApplicationController
	before_filter :authenticate_usuario!
	active_scaffold :leitura do |conf|
		conf.list.columns.exclude   [:apartamentos_leituras, :created_at, :updated_at]
		conf.create.columns.exclude   [:apartamentos_leituras]
		conf.nested.add_link :apartamentos_leituras
		conf.list.sorting = { :data_leitura => :desc }
	end
end
