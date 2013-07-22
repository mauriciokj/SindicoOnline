class ImoveisController < ApplicationController
	before_filter :authenticate_usuario!
    active_scaffold :imovel do |conf|
      conf.columns = [:nome, :cidade, :cep, :bairro, :rua, :numero, :responsavel, :telefone_responsavel]
      conf.columns[:cidade].clear_link
  end
end
