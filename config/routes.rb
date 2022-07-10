Rails.application.routes.draw do
  # Defines the root path route ("/")
  root 'pages#home'

  get 'pages/home'
  get 'pages/about'
  get 'pages/contact'
  get 'pages/faq'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html


end
