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
    resources :members
    member do
      get :member
    end
    # resources :members, only: [:index, :show]
    # resources :votes, only: [:index, :new, :create]
    # resources :preselected_bars, only: [:index]
  end

  # Users
  resources :users

  # Votes
  resources :votes, only: [:index, :show]
end
