class AddImovelAndApartamentoToUsuario < ActiveRecord::Migration
  def change
  	add_column :usuarios, :imovel_id, :integer
  	add_column :usuarios, :apartamento_id, :integer
  end
end
