class AddImovelToApartamento < ActiveRecord::Migration
  def change
    add_column :apartamentos, :imovel_id, :integer
  end
end
