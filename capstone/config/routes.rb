Rails.application.routes.draw do
  get 'vendor/index'

  resources :tables

  get 'seating/index'

  resources :guest_lists

  resources :users

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  get '/' => 'landing#index'
  get '/yo' => 'landing#test'

  get '/login' => 'users#log'
  post '/login' => 'users#login'
  get '/signUp' => 'users#new'

  get '/home' => 'home#home'

  get '/editCountdown' => 'home#edit'
  post '/editCountdown' => 'home#updateDate'

  get '/invite' => 'guest_lists#index'

  get '/createInvites' => 'guest_lists#make_invites'

  get '/invitation/:guest_id' => 'guest_lists#rsvp'
  post '/invitation/:guest_id' => 'guest_lists#update_guest_status'

  get '/send_mail' => 'guest_lists#send_mail'

  get '/seating' => 'seating#index'

  get '/newTable' => 'tables#new'
  get '/success' => 'tables#success'

  get '/vendors' => 'vendor#index'
  get '/cater' => 'vendor#cater'
  get '/dj' => 'vendor#dj'
  get '/decoration' => 'vendor#decor'
  get '/flowers' => 'vendor#flower'
  get '/officiant' => 'vendor#officiant'
  get '/photographer' => 'vendor#photo'
  get '/transportation' => 'vendor#transport'
  get '/venue' => 'vendor#venue'

  post '/tables/:id' => 'tables#update'

  post '/isValid' => 'seating#seatAssignValid'

  # post '/validateSeating/:tableId/:id' => 'seating#numOfSeats'
  #
  # post '/getTableId/:tableId' => 'seating#getTableId'


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
