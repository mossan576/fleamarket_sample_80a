Rails.application.routes.draw do
  get 'credit_cards/new'
  devise_for :users
  get 'items/index'
  root 'items#index'
  get 'items/new'
  resources:users, only: [:show, :edit]
  resources:credit_cards, only: [:new, :create]
  resources:items, only: [:new, :create]
  get 'transactions/buy'
  get 'transactions/done'
end
