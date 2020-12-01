Rails.application.routes.draw do
  get 'credit_cards/new'
  devise_for :users
  get 'items/index'
  root 'items#index'
  get 'items/new'
  resources:users, only: [:show, :edit, :update] do
    get :favorites, on: :collection
  end

  resources:credit_cards, only: [:new, :show] do
    collection do
      post 'show', to: 'credit_cards#show'
      post 'pay', to: 'credit_cards#pay'
      post 'delete', to: 'credit_cards#delete'
    end
  end 

  resources:items, only: [:new, :create, :index, :show, :destroy] do
    resource :favorites, only: [:create, :destroy]
  end

  get 'transactions/buy'
  get 'transactions/done'
end