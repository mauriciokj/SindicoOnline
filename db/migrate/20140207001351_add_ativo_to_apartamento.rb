class AddAtivoToApartamento < ActiveRecord::Migration
  def change
    add_column :apartamentos, :ativo, :boolean
  end
end
