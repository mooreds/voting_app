Rails.application.routes.draw do
  resources :voters
  resources :candidates
  resources :votes
  root to: 'votes#index'
end
