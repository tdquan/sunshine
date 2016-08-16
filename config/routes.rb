Rails.application.routes.draw do

  root to: 'pages#home'

  get "contracts/terminated" => 'contracts#index_terminated'

  # User
  resources :current_user, only: [] do
    collection do
      resources :solar_panels, only: [:new, :create] do
        resources :contracts, only: [:new, :create]
      end
      resources :contracts, only: [:index, :show]
      patch "contracts/:id" => 'contracts#terminate', as: "contract_terminate"
    end
  end

  get "dashboard/show" => "dashboard#show", as: "dashboard"

  get "located_solar_panels" => 'solar_panels#index'
  get "my_panel" => "solar_panels#show_my"
  resources :solar_panels, only: [:show]

  devise_for :users, :controllers => {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: "users/registrations"
  }


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
