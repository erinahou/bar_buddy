Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/dashboard', to: 'pages#dashboard'

  # Bars
  resources :bars, only: [:show]

  # removed votes
  # remove bar_characteristics
  # removed characteristics

  # Groups
  resources :groups, only: [:new, :create, :edit] do # Specified only necessary actions
    member do
      get 'verdict'
      get 'confirmation'
    end
    resources :members, only: [:new, :create]
    resources :preselected_bars, only: [:index, :new, :create] do
      resources :votes, only: [:create] # Nesting votes under preselected bars to get this path /groups/:group_id/preselected_bars/:preselected_bar_id/votes
    end
  end

  # removed resources :users because this is already done through devise.
end
