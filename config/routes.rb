Rails.application.routes.draw do
  resources :users, :projects, :tasks
  
  #get 'errors/file_not_found'

  #get 'errors/unprocessable'

  #get 'errors/internal_server_error'

  #get 'users/index'
  
  # If a user is logged in, the root is set to the users overview page
  constraints lambda { |req| !req.session[:user_id].blank? } do
    root :to => "projects#overview", :as => "landing"   
  end
  
  # Otherwise, root is set to index
  root :to => "users#index"
  
  # Other routes
  get "/register" => "users#new"
  get "/about" => "users#about"
  get  "/login"   => "sessions#new"
  post "/login"   => "sessions#create"
  get "/logout" => "sessions#destroy"
  get "/landing" => "projects#overview"
  get "/newproject" => "projects#new"
  post "/newproject" => "projects#create"
  get "/projects/:id", to: "projects#show"
  post "/tasks/new" => "tasks#create"
  
  # Custom error routes
  #match '/404', to: 'errors#file_not_found', via: :all
  #match '/422', to: 'errors#unprocessable', via: :all
  #match '/500', to: 'errors#internal_server_error', via: :all
  
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
