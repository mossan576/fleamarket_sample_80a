Rails.application.routes.draw do
  get 'card/new'
  devise_for :users
  # before
  get 'items/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # after
  root 'items#index'
  resources:users, only: [:show, :edit]
  resources:card, only: :new
end
