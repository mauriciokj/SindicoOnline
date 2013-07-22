class AddPagaToLeitura < ActiveRecord::Migration
  def change
    add_column :leituras, :paga, :boolean
    add_column :apartamentos_leituras, :paga, :boolean
  end
end
