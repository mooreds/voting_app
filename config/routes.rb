Rails.application.routes.draw do
  resources :voters
  resources :candidates
  resources :votes
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
