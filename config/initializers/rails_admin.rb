# RailsAdmin config file. Generated on July 22, 2013 23:30
# See github.com/sferik/rails_admin for more informations

RailsAdmin.config do |config|
  config.actions do
       dashboard # mandatory
              # collection actions
    index # mandatory
    new
    bulk_delete
              # member actions
              show
              edit
              delete
              member :calcular_valores do
                visible do
                  bindings[:abstract_model].model.to_s == 'Leitura'
                end
                register_instance_option :controller do
                  Proc.new do
                    redirect_to main_app.calcular_valores_path(@object)
                  end
                end

                register_instance_option :link_icon do
                  'icon-eye-open'
                end

                register_instance_option :pjax? do
                  false
                end
              end

            end


  ################  Global configuration  ################

  # Set the admin name here (optional second array element will appear in red). For example:
  config.main_app_name = ['Sindico Online', 'Admin']
  # or for a more dynamic name:
  # config.main_app_name = Proc.new { |controller| [Rails.application.engine_name.titleize, controller.params['action'].titleize] }

  # RailsAdmin may need a way to know who the current user is]
  config.current_user_method { current_usuario } # auto-generated
  config.authenticate_with do
    authenticate_usuario!
  end
  config.authorize_with :cancan

  # If you want to track changes on your models:
  # config.audit_with :history, 'Usuario'

  # Or with a PaperTrail: (you need to install it first)
  # config.audit_with :paper_trail, 'Usuario'

  # Display empty fields in show views:
  # config.compact_show_view = false

  # Number of default rows per-page:
  # config.default_items_per_page = 20

  # Exclude specific models (keep the others):
  # config.excluded_models = ['Apartamento', 'ApartamentoLeitura', 'Cidade', 'Estado', 'Imovel', 'Leitura', 'Usuario']

  # Include specific models (exclude the others):
  # config.included_models = ['Apartamento', 'ApartamentoLeitura', 'Cidade', 'Estado', 'Imovel', 'Leitura', 'Usuario']

  # Label methods for model instances:
  # config.label_methods << :description # Default is [:name, :title]


  ################  Model configuration  ################

  # Each model configuration can alternatively:
  #   - stay here in a `config.model 'ModelName' do ... end` block
  #   - go in the model definition file in a `rails_admin do ... end` block

  # This is your choice to make:
  #   - This initializer is loaded once at startup (modifications will show up when restarting the application) but all RailsAdmin configuration would stay in one place.
  #   - Models are reloaded at each request in development mode (when modified), which may smooth your RailsAdmin development workflow.


  # Now you probably need to tour the wiki a bit: https://github.com/sferik/rails_admin/wiki
  # Anyway, here is how RailsAdmin saw your application's models when you ran the initializer:



  ###  Apartamento  ###

  # config.model 'Apartamento' do

  #   # You can copy this to a 'rails_admin do ... end' block inside your apartamento.rb model definition

  #   # Found associations:

  #     configure :imovel, :belongs_to_association 
  #     configure :apartamentos_leituras, :has_many_association 

  #   # Found columns:

  #     configure :id, :integer 
  #     configure :numero, :integer 
  #     configure :bloco, :integer 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 
  #     configure :imovel_id, :integer         # Hidden 

  #   # Cross-section configuration:

  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:

  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end


  ###  ApartamentoLeitura  ###

  # config.model 'ApartamentoLeitura' do

  #   label "Leituras dos apartamentos"

  #   edit do
  #     field :apartamento
  #     field :leitura
  #     field :data
  #     field :leitura_apartamento
  #     field :paga
  #   end

  #   list do
  #     field :apartamento
  #     field :data
  #     field :leitura
  #     field :consumo
  #     field :leitura_apartamento
  #     field :paga
  #   end

  # end

  #   # You can copy this to a 'rails_admin do ... end' block inside your apartamento_leitura.rb model definition

  #   # Found associations:

  #     configure :apartamento, :belongs_to_association 
  #     configure :leitura, :belongs_to_association 

  #   # Found columns:

  #     configure :id, :integer 
  #     configure :apartamento_id, :integer         # Hidden 
  #     configure :leitura_id, :integer         # Hidden 
  #     configure :leitura_apartamento, :float 
  #     configure :consumo, :float 
  #     configure :valor, :float 
  #     configure :data, :date 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 
  #     configure :diferenca_ajustada, :float 
  #     configure :porcentagem, :float 
  #     configure :paga, :boolean 

  #   # Cross-section configuration:

  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:

  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end


  ###  Cidade  ###

  # config.model 'Cidade' do

  #   # You can copy this to a 'rails_admin do ... end' block inside your cidade.rb model definition

  #   # Found associations:

  #     configure :estado, :belongs_to_association 

  #   # Found columns:

  #     configure :id, :integer 
  #     configure :nome, :string 
  #     configure :estado_id, :integer         # Hidden 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 

  #   # Cross-section configuration:

  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:

  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end


  ###  Estado  ###

  # config.model 'Estado' do

  #   # You can copy this to a 'rails_admin do ... end' block inside your estado.rb model definition

  #   # Found associations:

  #     configure :cidades, :has_many_association 

  #   # Found columns:

  #     configure :id, :integer 
  #     configure :nome, :string 
  #     configure :sigla, :string 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 

  #   # Cross-section configuration:

  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:

  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end


  ###  Imovel  ###

  # config.model 'Imovel' do

  #   # You can copy this to a 'rails_admin do ... end' block inside your imovel.rb model definition

  #   # Found associations:

  #     configure :cidade, :belongs_to_association 
  #     configure :apartamentos, :has_many_association 

  #   # Found columns:

  #     configure :id, :integer 
  #     configure :nome, :string 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 
  #     configure :rua, :string 
  #     configure :bairro, :string 
  #     configure :cidade_id, :integer         # Hidden 
  #     configure :cep, :string 
  #     configure :responsavel, :string 
  #     configure :telefone_responsavel, :string 
  #     configure :numero, :string 

  #   # Cross-section configuration:

  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:

  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end


  ###  Leitura  ###

  # config.model 'Leitura' do

  #   # You can copy this to a 'rails_admin do ... end' block inside your leitura.rb model definition

  #   # Found associations:

  #     configure :apartamentos_leituras, :has_many_association 

  #   # Found columns:

  #     configure :id, :integer 
  #     configure :data_leitura, :date 
  #     configure :data_vencimento, :date 
  #     configure :leitura_anterior, :float 
  #     configure :leitura_atual, :float 
  #     configure :consumo, :float 
  #     configure :valor, :float 
  #     configure :matricula, :integer 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 
  #     configure :paga, :boolean 

  #   # Cross-section configuration:

  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:

  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end


  ###  Usuario  ###

  # config.model 'Usuario' do

  #   # You can copy this to a 'rails_admin do ... end' block inside your usuario.rb model definition

  #   # Found associations:

  #     configure :imovel, :belongs_to_association 
  #     configure :apartamento, :belongs_to_association 

  #   # Found columns:

  #     configure :id, :integer 
  #     configure :email, :string 
  #     configure :password, :password         # Hidden 
  #     configure :password_confirmation, :password         # Hidden 
  #     configure :reset_password_token, :string         # Hidden 
  #     configure :reset_password_sent_at, :datetime 
  #     configure :remember_created_at, :datetime 
  #     configure :sign_in_count, :integer 
  #     configure :current_sign_in_at, :datetime 
  #     configure :last_sign_in_at, :datetime 
  #     configure :current_sign_in_ip, :string 
  #     configure :last_sign_in_ip, :string 
  #     configure :failed_attempts, :integer 
  #     configure :unlock_token, :string 
  #     configure :locked_at, :datetime 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 
  #     configure :imovel_id, :integer         # Hidden 
  #     configure :apartamento_id, :integer         # Hidden 
  #     configure :roles_mask, :enum 

  #   # Cross-section configuration:

  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:

  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end

end
