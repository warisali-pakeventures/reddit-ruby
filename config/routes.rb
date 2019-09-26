Rails.application.routes.draw do
  mount Commontator::Engine => '/commontator'

  devise_for :users

  resources :subreddits do
    get :join, on: :member
    get :leave, on: :member
  end

  resources :posts

  root 'users#show'
end
