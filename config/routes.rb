Rails.application.routes.draw do

  root to: 'pages#home'

  # User
  resources :current_user, only: [] do
    collection do
      resources :solar_panels, only: [:new, :create] do
        resources :contracts
      end
    end
  end

  get "/current_user/dashboard" => "users#dashboard", as: "user_dashboard"
  get "/current_user/my_panels" => "solar_panels#show_my", as: "user_my_panels"
  get "/current_user/my_panels/:id" => "solar_panels#show", as: "my_solar_panel"

  get "/current_user/solar_panels" => "solar_panels#index", as: "user_solar_panels"
  get "/current_user/solar_panels/:id" => "solar_panels#show", as: "show_solar_panel"

  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }




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
