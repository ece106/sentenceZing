Teamawesome::Application.routes.draw do
  
  resources :likes

  # This is for users having additional profile pages
  resources :users do
    member do
      get :following, :followers
    end
  end
 # or this get "users/:id/anotherpage" => "users#anotherpage", as: 'anotherpage'
 
  resources :sessions, only: [:new, :create, :destroy]
 
  root to:  'static_pages#home'
  match '/signup',  to: 'users#new',            via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy'  ,     via: 'delete'
  match '/usersearch', to: 'users#usersearch', via: 'get'
  
  resources :stories #do
#    resources :microposts  #, only: [:create, :destroy]
#  end
  resources :microposts 
  resources :relationships, only: [:create, :destroy]
  resources :likes
  resources :subscriptions
  resources :activities

  match '/about', to: 'static_pages#about', via: 'get'
  match '/contactus', to: 'static_pages#contactus', via: 'get'
  match '/survey', to: 'static_pages#survey', via: 'get'
  match '/donations', to: 'static_pages#donations', via: 'get'
  match '/howtoplay', to: 'static_pages#howtoplay', via: 'get'
  match '/voting', to: 'stories#voting', via: 'get'

  match '/stories/:id/fake', to: 'stories#fake', via: 'get'
  match '/stories/:id/postbox', to: 'stories#postbox', via: 'get'

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
