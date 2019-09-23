Rails.application.routes.draw do
  resources :comments
  resources :posts
  resources :subreddits

  root 'users#dashboard'

  get '/login', to: 'users#login'
  post '/login', to: 'users#login_user'
  get '/logout', to: 'users#logout'

  get '/register', to: 'users#new'
  get '/dashboard', to: 'users#dashboard'
end
