Rails.application.routes.draw do
  devise_for :users
  get 'prototypes/index'
  # post 'prototypes/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "prototypes#index"
  resources :users, only: [:show]
  resources :prototypes, only: [:new, :create, :show, :edit, :update, :destroy] do
    resources :comments, only: [:index, :create, :destroy]
  end
end
