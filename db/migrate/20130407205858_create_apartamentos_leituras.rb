class CreateApartamentosLeituras < ActiveRecord::Migration
  def change
    create_table :apartamentos_leituras do |t|
      t.references :apartamento
      t.references :leitura
      t.float :leitura_apartamento
      t.float :consumo
      t.float :valor
      t.date :data

      t.timestamps
    end
    add_index :apartamentos_leituras, :apartamento_id
    add_index :apartamentos_leituras, :leitura_id
  end
end
