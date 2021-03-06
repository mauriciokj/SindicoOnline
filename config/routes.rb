SindicoOnline::Application.routes.draw do

  match 'calcular_valores' => 'leituras#calcular_valores', :as => :calcular_valores
  match 'calcular_valores_da_conta' => 'contas#calcular_valores', :as => :calcular_valores_da_conta
  match 'principal' => 'principal#index', :as => :principal
  match 'totais_apartamento' => 'principal#totais_apartamento', :as => :totais_apartamento
  match 'pagar/:apartamento_id' => 'principal#pagar', :as => :pagar
  match 'enviar_mensagem' => 'mensagens#enviar_mensagem', :as => :enviar_mensagem
  match 'marcar_como_lida' => 'mensagens#marcar_como_lida', :as => :marcar_como_lida
  match 'marcar_como_nao_lida' => 'mensagens#marcar_como_nao_lida', :as => :marcar_como_nao_lida
  match 'deletar_mensagens' => 'mensagens#deletar_mensagens', :as => :deletar_mensagens
  match 'leituras' => 'leituras#leituras', :as => :leituras
  match 'lancar_condominios' => 'condominios#lancar_condominios', :as => :lancar_condominios
  match 'gerar_apartamentos_leituras' => 'leituras#gerar_apartamentos_leituras', :as => :gerar_apartamentos_leituras
  match 'gerar_condominios' => 'condominios#gerar_condominios', :as => :gerar_condominios

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  devise_for :usuarios






  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'principal#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
