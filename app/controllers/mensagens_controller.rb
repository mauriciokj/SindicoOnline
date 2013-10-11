class MensagensController < ApplicationController
	def enviar_mensagem
		@apartamento = current_usuario.apartamento
		@enviadas = @apartamento.mensagens_enviadas
		@lidas = @apartamento.mensagens_recebidas.lidas
		@nao_lidas = @apartamento.mensagens_recebidas.nao_lidas
		@mensagem = Mensagem.new
		@mensagem.de = current_usuario.apartamento
		@mensagem.para = Apartamento.find(params[:apartamento]) rescue nil
		@mensagem.mensagem = params[:mensagem]
		if @mensagem.valid?
			@mensagem.save
			render :js => "window.location = '#{principal_path}'"
		else
			render  formats: [:js]
		end	

		
	end


	def deletar_mensagens
		Mensagem.where(:id => params[:ids]).delete_all
		render :js => "window.location = '#{principal_path}'"
	end

	def marcar_como_lida
		Mensagem.where(:id => params[:ids]).update_all(:lida => true)
		render :js => "window.location = '#{principal_path}'"
	end

	def marcar_como_nao_lida
		Mensagem.where(:id => params[:ids]).update_all(:lida => false)
		render :js => "window.location = '#{principal_path}'"
	end

end