class AddPertenceAoCondominioToApartamento < ActiveRecord::Migration
  def change
    add_column :apartamentos, :pertence_ao_condominio, :boolean
  end
end
