# -*- encoding : utf-8 -*-
class Usuario < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :registerable, :timeoutable and :omniauthable
  belongs_to :apartamento
  belongs_to :imovel
  devise :database_authenticatable, :lockable,
  :recoverable, :rememberable, :trackable, :validatable

  alias_attribute :name, :email


  include RoleModel
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :apartamento_id, :imovel_id,:roles_mask
  # attr_accessible :title, :body

  roles_attribute :roles_mask

  #Não mudar a ordem
  roles :admin, :sindico, :usuario

  def roles_mask_enum
    [[:admin, 1], [:sindico, 2], [:usuario, 4]]
  end

  rails_admin do
    label "Usuário"

    show do
      field :apartamento
      field :email
      field :roles_mask, :enum do
        label "Tipo de usuario"
      end
      ;
    end

    edit do

      field :email
      field :password
      field :password_confirmation
      field :apartamento_id, :enum do
        label "Apartamento"
        enum do          
          Apartamento.all.collect { |c| [c.to_label, c.id] }
        end
      end
      field :imovel_id, :enum do
        label "Imóvel"
        enum do          
          Imovel.all.collect { |c| [c.nome, c.id] }
        end
      end
      field :roles_mask, :enum do
        label "Tipo de usuário"
        enum do
          [[:admin, 1], [:sindico, 2], [:usuario, 4]]
        end
      end
    end

    list do
      field :email
    end

  end

end
