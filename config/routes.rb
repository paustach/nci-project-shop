Rails.application.routes.draw do
  # Defines the root path route ("/")
  root 'pages#home'


  get "about", to:'pages#about'
  get "contact", to:'pages#contact'
  get "faq", to:'pages#faq'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html


end
