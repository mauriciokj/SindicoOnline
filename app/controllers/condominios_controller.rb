class CondominiosController < ApplicationController
  layout 'principal'
  before_filter :authenticate_usuario!

  def lancar_condominios
    @usuario = current_usuario
    @condominio = @usuario.imovel
    render  formats: [:js]
  end

  def gerar_condominios
  	@usuario = current_usuario
    @condominio = @usuario.imovel
    valor = params[:valor]
    data = params[:data]
    apartamentos = Apartamento.where(:id => params[:apartamento_ids])
    total = valor.to_f * apartamentos.size
    mes = I18n.t('date.month_names')[data.to_date.month]
    @conta = Conta.new(
      descricao: "condominio do mes de #{mes}",
      paga: false,
      valor: total,
      vencimento: data,
      imovel: @condominio

    )
    apartamentos.each do |apartamento|
    	conta_por_apartamento = ContaPorApartamento.new(
    		paga: false,
    		valor: valor,
    		apartamento: apartamento,
    		imovel: @condominio
    		)
    	@conta.contas_por_apartamentos << conta_por_apartamento
    end
    @conta.save

    render :js => "window.location = '#{principal_path}'"
  end
end
