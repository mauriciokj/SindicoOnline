class CreatePessoas < ActiveRecord::Migration
  def change
    create_table :pessoas do |t|
      t.string :nome
      t.string :tipo
      t.string :cpf_cnpj
      t.string :email
      t.string :rg_ie
      t.string :rua
      t.string :bairro
      t.string :cep
      t.references :cidade
      t.string :telefone
      t.string :celular
      t.date :nascimento
      t.references :apartamento

      t.timestamps
    end
    add_index :pessoas, :cidade_id
    add_index :pessoas, :apartamento_id
  end
end
