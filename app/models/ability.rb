class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
      user ||= usuario.new # guest user (not logged in)
      can :access, :rails_admin # only allow admin users to access Rails Admin
      can :dashboard
      if user.admin?
        can :manage, :all
      elsif user.sindico?
        can :read, Apartamento, :imovel_id => user.imovel_id, :id => user.apartamento_id
        can :manage, Leitura#, :imovel_id => user.imovel_id
        can :manage, ApartamentoLeitura#, :imovel_id => user.imovel_id
        can :manage, Usuario, :imovel_id => user.imovel_id
      elsif user.usuario?
        can :read, Apartamento, :id => user.apartamento_id  
        can :manage, Usuario,:id => user.id, :imovel_id => user.imovel_id
      end
    #
    # The first argument to `can` is the action you are giving the user 
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. 
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
