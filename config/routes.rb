Rails.application.routes.draw do
  get 'logins/login'
  post 'logins/val'
  get 'logins/logout'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'logins#login'
end
