class AddDiaVencimentoDoCondominioToImovel < ActiveRecord::Migration
  def change
    add_column :imoveis, :dia_de_vencimento_do_condominio, :integer
  end
end
