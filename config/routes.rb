Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/dashboard', to: 'pages#dashboard'

  # Bars
  resources :bars, only: [:show] do
    resources :votes, only: [:index, :new, :create]
    resources :bar_characteristics, only: [:index]
  end

  # Characteristics
  resources :characteristics, only: [:index]

  # Groups
  resources :groups do
    member do
      get 'confirm'
      get 'verdict'
      delete 'destroy_member'
      post 'add_member'
    end
    resources :members, only: [:index, :show]
    resources :votes, only: [:index, :new, :create]
    resources :preselected_bars, only: [:index,:new, :create]
  end

  # Users
  resources :users

  # Votes
  resources :votes, only: [:index, :show]
end
