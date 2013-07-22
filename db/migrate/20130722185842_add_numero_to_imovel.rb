class AddNumeroToImovel < ActiveRecord::Migration
  def change
    add_column :imoveis, :numero, :string
  end
end
