class AddEmailResponsavelToImovel < ActiveRecord::Migration
  def change
    add_column :imoveis, :email_responsavel, :string
  end
end
