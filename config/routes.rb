Rails.application.routes.draw do
  resources :profiles
  resources :products
  resources :checkout, only: [:create]
  resources :contact, only: [:new, :create] 
  devise_for :users
  # Defines the root path route ("/")
  root 'pages#home'

  #Navbar and footer menu
  get "about", to:'pages#about'
  get "faq", to:'pages#faq'
  get "shop", to: 'products#index'
  get "privacy", to:'pages#privacypolicy'

  #Devise 
  get '/signedinuserprofile' => 'profiles#signedinuserprofile'

  #Cart routes
  get "cart", to: 'cart#show'
  post 'cart/add'
  post 'cart/remove'

  #Checkout routes
  post "checkout/create", to: "checkout#create"
  get "success", to:'checkout#success'
  get "error", to:'checkout#error'

  #Contact routes
  get "contact", to:'contacts#new'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html


end
