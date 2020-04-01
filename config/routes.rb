Rails.application.routes.draw do
  resources :voters
  resources :candidates
  resources :votes, only: [:new, :create, :index]
  root to: 'votes#index'
end
