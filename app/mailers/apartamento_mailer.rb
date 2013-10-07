class ApartamentoMailer < ActionMailer::Base  

	def enviar_email(apartamento) 
		@apartamento = apartamento
		puts "entrou no enviar email"
		mail(:to => @apartamento.usuario.email, :subject => "Valores de condominio", :from => 'naoresponda@sindicoonline.com') do |format|
			format.html { render 'enviar_email' }
		end
	end

end  