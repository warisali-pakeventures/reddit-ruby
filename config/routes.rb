Rails.application.routes.draw do
  resources :comments

  resources :subreddits do
    resources :posts
  end

  root 'users#dashboard'


  resources :users
  get '/login', to: 'users#login', as: :login
  post '/login', to: 'users#login_user'
  get '/logout', to: 'users#logout', as: :logout

  get '/register', to: 'users#new', as: :register
  get '/dashboard', to: 'users#dashboard', as: :dashboard

  get '/r/:subreddit', to: 'subreddits#show_by_name', as: :subreddit_name
  get '/r/:subreddit/join', to: 'subreddits#add_member', as: :join_subreddit
  get '/r/:subreddit/leave', to: 'subreddits#remove_member', as: :leave_subreddit
end
