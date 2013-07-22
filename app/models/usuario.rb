class Usuario < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :registerable, :timeoutable and :omniauthable
  belongs_to :apartamento
  belongs_to :imovel
  devise :database_authenticatable, :lockable,
  :recoverable, :rememberable, :trackable, :validatable


  include RoleModel
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

   roles_attribute :roles_mask

  #Não mudar a ordem
  roles :admin, :sindico, :usuario

  def roles_mask_enum
    [[:admin, 1], [:sindico, 2], [:usuario, 4]]
  end

end
