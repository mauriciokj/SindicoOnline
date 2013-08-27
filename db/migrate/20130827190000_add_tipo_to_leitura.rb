class AddTipoToLeitura < ActiveRecord::Migration
  def change
    add_column :leituras, :tipo_id, :integer
    add_column :apartamentos_leituras, :tipo_id, :integer
  end
end
