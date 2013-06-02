class ApartamentosLeiturasController < ApplicationController
	active_scaffold :apartamento_leitura do |conf|
		conf.create.columns.exclude [:consumo, :valor,:diferenca_ajustada, :porcentagem]
		conf.list.columns.exclude [:diferenca_ajustada, :porcentagem, :created_at, :updated_at]
		conf.action_links.add 'calcular_valores', :label => 'Calcular Valores'
		conf.columns[:apartamento].clear_link
	end

	def calcular_valores
		leitura = Leitura.find(params[:leitura_id])
		leitura.calcular_valores
		render :nothing => true
	end	

	def before_create_save(record)
		if record.valid?
			apartamento =  Apartamento.find(params[:record][:apartamento][:id])
			record.calcula_consumo(apartamento)
		end
	end
end
