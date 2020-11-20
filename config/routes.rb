Rails.application.routes.draw do
  # before
  get 'items/show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # after
  root 'items#show'
  resources :items, only: [:show]
end
