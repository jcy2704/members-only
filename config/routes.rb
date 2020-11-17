Rails.application.routes.draw do
  root to: 'user#index'
  devise_for :users
  resources :posts, only: %i[new create index]
  resources :users
end
