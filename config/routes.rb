Rails.application.routes.draw do
  get 'card/new'
  devise_for :users
  get 'items/index'
  root 'items#index'
  get 'items/new'
  resources:users, only: [:show, :edit]
  resources:card, only: :new
  resources:items, only: [:new, :create, :show, :destroy]
  get 'transactions/buy'
  get 'transactions/done'
end