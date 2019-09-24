Rails.application.routes.draw do
  mount Commontator::Engine => '/commontator'

  devise_for :users

  resources :subreddits do
    resources :posts
  end

  root 'users#dashboard'

  get '/dashboard', to: 'users#dashboard', as: :dashboard

  get '/r/:subreddit', to: 'subreddits#show_by_name', as: :subreddit_name
  get '/r/:subreddit/join', to: 'subreddits#add_member', as: :join_subreddit
  get '/r/:subreddit/leave', to: 'subreddits#remove_member', as: :leave_subreddit
end
