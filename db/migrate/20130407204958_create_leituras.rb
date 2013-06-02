class CreateLeituras < ActiveRecord::Migration
  def change
    create_table :leituras do |t|
      t.date :data_leitura
      t.date :data_vencimento
      t.float :leitura_anterior
      t.float :leitura_atual
      t.float :consumo
      t.float :valor
      t.integer :matricula

      t.timestamps
    end
  end
end
