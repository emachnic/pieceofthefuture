Pieceofthefuture::Application.routes.draw do      
  devise_for :users
  get '/institutions/search' => 'institutions#search'
  resources :institutions
  resources :classrooms
  
  match '/donations/receipt/:id' => 'donations#receipt', :as => :receipt
  match '/donations/send_information/:id' => 'donations#send_information', :as => :send_information
  match '/donations/payment', :to => 'donations#payment', :as => :donation_payment
  post 'donations/credit'
  resources :donations    
  post '/donate/send_email'
  match 'faq' => 'high_voltage/pages#show', :id => 'faq'
  match 'about_tff' => 'high_voltage/pages#show', :id => 'about_tff'
  match 'terms_and_conditions' => 'high_voltage/pages#show', :id => 'terms'
  match 'prizes' => 'high_voltage/pages#show', :id => 'prizes'
  match 'contributors' => 'contributors#index'
  match 'contact' => 'contact_mailer#index'
  post 'contact_mailer/send_email'

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
  root :to => 'home#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
