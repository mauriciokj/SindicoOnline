class AddValorDoCondominioToImovel < ActiveRecord::Migration
  def change
    add_column :imoveis, :valor_do_condominio, :float
  end
end
