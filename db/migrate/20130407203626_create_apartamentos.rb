class CreateApartamentos < ActiveRecord::Migration
  def change
    create_table :apartamentos do |t|
      t.integer :numero
      t.integer :bloco

      t.timestamps
    end
  end
end
