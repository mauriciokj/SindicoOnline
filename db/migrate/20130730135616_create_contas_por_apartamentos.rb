class CreateContasPorApartamentos < ActiveRecord::Migration
  def change
    create_table :contas_por_apartamentos do |t|
      t.references :conta
      t.references :apartamento
      t.float :valor
      t.references :imovel
      t.boolean :paga

      t.timestamps
    end
    add_index :contas_por_apartamentos, :conta_id
    add_index :contas_por_apartamentos, :apartamento_id
    add_index :contas_por_apartamentos, :imovel_id
  end
end
