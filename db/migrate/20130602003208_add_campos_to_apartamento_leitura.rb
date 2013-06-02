class AddCamposToApartamentoLeitura < ActiveRecord::Migration
  def change
    add_column :apartamentos_leituras, :diferenca_ajustada, :float
    add_column :apartamentos_leituras, :porcentagem, :float
  end
end
