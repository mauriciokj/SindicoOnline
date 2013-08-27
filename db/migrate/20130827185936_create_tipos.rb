class CreateTipos < ActiveRecord::Migration
  def change
    create_table :tipos do |t|
      t.string :descricao

      t.timestamps
    end
  end
end
