# -*- encoding : utf-8 -*-

class ApplicationController < ActionController::Base
	protect_from_forgery

 rescue_from CanCan::AccessDenied do |exception|
    if usuario_signed_in?
      redirect_to "/  ", :alert => "Você não esta autorizado para acessar esta página."
    else
      redirect_to new_usuario_session_path, :alert => exception.message
    end
  end
	
	def current_ability
		@current_ability ||= Ability.new(current_usuario)
	end
end
