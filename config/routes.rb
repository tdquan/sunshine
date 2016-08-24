Rails.application.routes.draw do

  get 'errors/not_found'

  get 'errors/internal_server_error'

  require "sidekiq/web"
  authenticate :user, lambda { |u| u.status == "admin" } do
    mount Sidekiq::Web => '/sidekiq'
  end

  scope '(:locale)', locale: /en|pt/ do
    resources :contracts, :solar_panels
  end

  devise_for :users, :controllers => {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: "users/registrations"
  }

  get "contracts/terminated" => 'contracts#index_terminated'
  resources :contracts, only: [:show, :create, :index, :update]


  get "dashboard/show" => "dashboard#show", as: "dashboard"
  get "dashboard/show_neighbour" => "dashboard#show_neighbour", as: "dashboard_neighbour"

  resources :solar_panels, only: [:show, :new, :create]
  get "located_solar_panels" => 'solar_panels#index'
  get "my_panel" => "solar_panels#show_my"

  patch "solar_panels/addUserAddress" => "solar_panels#addUserAddress"

  root to: 'pages#home'
  get "welcome" => 'pages#welcome_step0'

  post "welcome_step0" => 'pages#create_step0'

  get "welcome_step1" => 'pages#welcome_step1'
  post "welcome_step1" => 'pages#create_step1'

  get "welcome_step2" => 'pages#welcome_step2'

  get "welcome_step3_rent" => 'pages#welcome_step3_rent'
  patch "welcome_step3" => 'pages#create_step3'

  get "welcome_step3_own" => 'pages#welcome_step3_own'

  get "welcome_step4_rent" => 'pages#welcome_step4_rent'


  # ---------------   errors  ----------------------------
  
  match "/404", :to => "errors#not_found", :via => :all
  match "/500", :to => "errors#internal_server_error", :via => :all

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
