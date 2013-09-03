class CreateMensagens < ActiveRecord::Migration
  def change
    create_table :mensagens do |t|
      t.integer :de
      t.integer :para
      t.text :mensagem
      t.boolean :lida

      t.timestamps
    end
  end
end
