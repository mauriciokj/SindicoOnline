class LeiturasController < ApplicationController
	layout 'principal'
	def calcular_valores
		leitura = Leitura.find(params[:format])
		leitura.calcular_valores
		redirect_to rails_admin_path
	end	

	def leituras
		@tipos = Tipo.all
		@leitura = Leitura.new
		render  formats: [:js]
	end

	def gerar_apartamentos_leituras
		@leitura = Leitura.new
		@leitura.matricula = params[:matricula]
		@tipo = Tipo.find(params[:tipo])
		@leitura.tipo = @tipo
		@leitura.data_leitura = params[:data_leitura]
		@leitura.data_vencimento = params[:data_vencimento]
		@leitura.consumo = params[:consumo] 
		@leitura.leitura_anterior = params[:leitura_anterior]
		@leitura.leitura_atual = params[:leitura_atual]
		@leitura.valor= params[:valor]
		apartamentos =  params['leitura_apartamento']
		apartamentos_com_gastos = apartamentos.inject({}){|r,h|  r[h[0]] = h[1] if !h[1].blank?;r}

		if @leitura.valid?
			apartamentos_com_gastos.each do |k,v|
				apartamento = Apartamento.find(k)
				al = ApartamentoLeitura.new
				al.apartamento = apartamento
				al.leitura_apartamento = v
				al.paga = false
				al.tipo = @tipo
				al.data = @leitura.data_leitura
				# al.save
				@leitura.apartamentos_leituras << al
			end
			@leitura.save
			@leitura.consumo_condominio
			@leitura.calcular_valores
			render :js => "window.location = '#{principal_path}'"
		else
			render :action => 'salvar_leitura', formats: [:js]
		end
	end
end