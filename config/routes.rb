Ie::Application.routes.draw do
  devise_for :users

  # namespace :admin do
  #   resources :users do
  #     member do
  #       get 'edit_role'
  #       put 'update_role'
  #     end
  #   end
  #   
  #   resources :session
  #   resources :categories
  #   resources :articles
  #   resources :panel_categories
  #   
  # end
  
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  
  match ":path" => "pages#show"
  root :to => "home#index"
  
  # map.logout    '/logout', :controller => 'sessions', :action => 'destroy'
  # map.login     '/login', :controller => 'sessions', :action => 'new'
  # map.register  '/register', :controller => 'users', :action => 'create'
  # map.signup    '/signup', :controller => 'users', :action => 'new'
  # map.check_un  '/users/check_un', :controller => "users", :action => "check_un"
  # map.check_email '/users/check_email', :controller => "users", :action => "check_email"
  # map.subscription  '/subscription', :controller => "products", :action => "index"
  # map.teaser    '/home/teaser/:id.:format', :controller => "home", :action => "teaser"
  # map.forgot_password'/forgot_password', :controller => 'users', :action => 'forgot_password'
  # map.forgot '/forgot', :controller => 'users', :action => 'forgot'
  # map.reset_password  '/reset_password/:password_reset_code', :controller => 'users', :action => 'reset_password'
  # map.reset  '/reset', :controller => 'users', :action => 'reset', :method => :put
  # map.search  '/search', :controller => 'search', :action => 'index'
  # 
  # map.resources :users,:member => {:edit_role => :get,:update_role => :put}
  # 
  # map.resource :session
  # 
  # map.resources :categories
  # 
  # map.resources :articles
  # 
  # map.resources :panel_categories
  # 
  # map.resources :panel_contents,:member => {:croper => :get,:crop => :put}
  # 
  # map.resources :albums,:member => {:assets_new => :get,:assets_create => :put,:assets_batch=>:put}
  # 
  # map.resources :assets,:member => {:to_primary => :put}
  # 
  # map.resources :my, :collection => {:orders => :get},
  #                    :member => {:order_show => :get}
  # 
  # map.resources :search
  # 
  # map.ws_teaser '/webservice/teaser_album/:id.:format', :controller => "webservice", :action => "teaser_album"
  # 
  # map.root :controller => 'home', :action => 'index'
  
  
  
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
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
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
