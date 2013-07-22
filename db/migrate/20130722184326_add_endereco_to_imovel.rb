class AddEnderecoToImovel < ActiveRecord::Migration
  def change
  	add_column :imoveis, :rua, :string
  	add_column :imoveis, :bairro, :string
  	add_column :imoveis, :cidade_id, :integer
  	add_column :imoveis, :cep, :string
  	add_column :imoveis, :responsavel, :string
  	add_column :imoveis, :telefone_responsavel, :string
  end
end
