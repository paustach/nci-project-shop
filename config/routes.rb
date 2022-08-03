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
  get "privacy", to:'pages#privacypolicy'
  get '/signedinuserprofile' => 'profiles#signedinuserprofile'
  get "cart", to: 'cart#show'
  post 'cart/add'
  post 'cart/remove'
  post "checkout/create", to: "checkout#create"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html


end
