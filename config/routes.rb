Rails.application.routes.draw do
  get 'access/new'
  post 'access/new'

  get 'access/create'

  get 'access/destroy'

  get 'admin/index'

  get 'shopper/index'

  resources :users
  resources :orders
  resources :lineitems
  resources :carts
  #get 'user/index'

  resources :phones
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root "shopper#index", as: 'shopper'
  get '/shopper', to: "shopper#index"
  post '/login', to: "access#create"
  get '/login', to: "access#new"
  get '/admin', to: "admin#index"
  get '/signup', to: "user#new"
  post '/signup', to: "user#create"
  delete '/logout', to: "access#destroy"
end
