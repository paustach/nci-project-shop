Rails.application.routes.draw do
  resources :profiles
  resources :products
  devise_for :users
  # Defines the root path route ("/")
  root 'pages#home'


  get "about", to:'pages#about'
  get "contact", to:'pages#contact'
  get "faq", to:'pages#faq'
  get "shop", to: 'products#index'
  get "cart", to: 'cart#show'
  post 'cart/add'
  post 'cart/remove'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html


end
