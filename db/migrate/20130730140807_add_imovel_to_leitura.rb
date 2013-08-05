class AddImovelToLeitura < ActiveRecord::Migration
	def change
		def change
			add_column :leituras, :imovel_id, :integer
			add_column :apartamentos_leituras, :imovel_id, :integer
		end
	end
end
