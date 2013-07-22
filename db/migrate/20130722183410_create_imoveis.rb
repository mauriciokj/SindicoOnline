class CreateImoveis < ActiveRecord::Migration
  def change
    create_table :imoveis do |t|
      t.string :nome

      t.timestamps
    end
  end
end
