Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'user#login'
  match '/login', :to => 'user#login', :via => :get
  match '/new', :to => 'user#new', :via => :get
  match '/validate_user', :to => 'user#validate_user', :via => :post
  match '/create', :to => 'user#create', :via => :post
  match '/dashboard', :to => 'user#dashboard', :via => :get
  match '/logout', :to => 'user#logout', :via => :get

  match '/add_student', :to => 'user#add_student', :via => :get
  match '/add_teacher', :to => 'user#add_teacher', :via => :get
  match '/add_class', :to => 'user#add_class', :via => :get
  match '/add_subject', :to => 'user#add_subject', :via => :get
  match '/assign_subject', :to => 'user#assign_subject', :via => :get
  match '/save_assign_subject', :to => 'user#save_assign_subject', :via => :post

  
  match '/student_details', :to => 'user#student_details', :via => :get
  match '/show_student_details/:id', :to => 'user#show_student_details', :via => :get

  match '/create_student', :to => 'user#create_student', :via => :post
  match '/delete_student/:id', :to => 'user#delete_student', :via => :delete
  match '/edit_student/:id', :to => 'user#edit_student', :via => :get


  match '/standard_details', :to => 'user#standard_details', :via => :get
  match '/create_standard', :to => 'user#create_standard', :via => :post
  match '/edit_standard/:id', :to => 'user#edit_standard', :via => :get
  match '/delete_standard/:id', :to => 'user#delete_standard', :via => :delete
  match '/update_standard/:id', :to => 'user#update_standard', :via => :patch


  match '/subject_details', :to => 'user#subject_details', :via => :get
  match '/create_subject', :to => 'user#create_subject', :via => :post
  match '/delete_subject/:id', :to => 'user#delete_subject', :via => :delete
  match '/edit_subject/:id', :to => 'user#edit_subject', :via => :get
  match '/update_subject/:id', :to => 'user#update_subject', :via => :patch

  





  match '/list_student', :to => 'user#list_student', :via => :get
  match '/list_teacher', :to => 'user#list_teacher', :via => :get
  match '/list_class', :to => 'user#list_class', :via => :get
  match '/list_subjects/:id', :to => 'user#list_subjects', :via => :get
  





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
