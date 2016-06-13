Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
    # root 'home#index'
    #root 'home#calculate_result'
    #root 'home#form'
    resources :users do
      resources :orders
    end
    root 'users#home'
    #match '/login', :to => 'users#login', :via => :get
    match '/home', :to => 'users#home', :via => :get
    match '/new', :to => 'users#new', :via => :get
    match '/create', to: 'users#create', :via => :post
    match '/listing', to: 'home#listing', :via => :get

    match '/show', to: 'orders#show', :via => :get


    match '/edit/:id', :to => 'users#edit', :via => :get
    match '/delete/:id', :to => 'users#destroy', :via => :post
    match '/update/:id', :to => 'users#update', :via => :patch


    
   #match '/home', :to => 'home#index', :via => :get
   match '/login', :to => 'home#login', :via => :get
   post '/check_user', to: 'home#check_user', as: :check
   match '/dashboard', :to => 'home#dashboard', :via => :get
   match '/logout', :to => 'home#logout', :via => :get
   match '/write_mail/:id', :to => 'home#write_mail', :via => :get
   match '/send_mail/:id', :to => 'home#send_mail', :via => :post
   

   #post '/check_user',:to => 'home#check_user'
   
   match '/calculation', :to => 'home#calculate_result', :via => :get
   match '/test_sanitize', :to => 'home#test_sanitize', :via => :get
   match '/sanitise', :to => 'home#sanitise', :via => :post
   match '/script_inject', :to => 'home#script_inject', :via => :get


   match '/blog_list', :to => 'home#blog_list', :via => :get
   match '/display/:id', :to => 'home#display', :via => :get
   match '/delete_blog/:id', :to => 'home#delete_blog', :via => :delete
   
   match '/blogs/home', :to => 'blogs#home', :via => :get
   match '/blogs/login', :to => 'blogs#login', :via => :get
   post '/blogs/check_user', to: 'blogs#check_user', as: :check_user
   match '/blogs/dashboard', :to => 'blogs#dashboard', :via => :get
   match '/logout', :to => 'blogs#logout', :via => :get
   

   

   match '/blogs/edit/:id', :to => 'users#edit', :via => :get
   match '/blogs/delete/:id', :to => 'users#destroy', :via => :post
   match '/blogs/update/:id', :to => 'users#update', :via => :patch

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'
  get 'show' => 'show#show'

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
