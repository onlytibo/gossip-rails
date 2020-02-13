Rails.application.routes.draw do
  # Root
  get 'static/index'
  root 'gossips#index'

  # Static pages
  get 'team', to: 'static#team'
  get 'contact', to: 'static#contact'
  get 'welcome/:first_name', to: 'static#welcome'
  post 'welcome/:first_name', to: 'static#welcome_post'
  post '/', to: 'static#welcome_post'

  # Dynamic pages
  resources :gossips do
    resources :comments
    resources :tags
    resources :likes
  end
  resources :users, except: [:edit, :destroy]
  resources :cities, except: [:edit, :destroy]
  resources :sessions, only: [:new, :create, :destroy]
  resources :profiles
end
