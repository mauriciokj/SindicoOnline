class CreateContas < ActiveRecord::Migration
	def change
		create_table :contas do |t|
			t.integer :imovel_id
			t.string :descricao
			t.boolean :paga
			t.float :valor
			t.date :vencimento

			t.timestamps
		end
	end
end
