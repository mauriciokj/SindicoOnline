class AddPessoaToUsuario < ActiveRecord::Migration
  def change
    add_column :usuarios, :pessoa_id, :integer
  end
end
