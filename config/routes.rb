Rails.application.routes.draw do
  # static pages
  get 'static/index'
  root "static#index" 
  get 'team', to: 'static#team'
  get 'contact', to: 'static#contact'

  # dynamic pages
  get 'welcome/:first_name', to: 'user#welcome'
  post '/', to: 'user#welcome_post'
  post 'welcome/:first_name', to: 'user#welcome_post'
  # get 'user/welcome' # redirect to welcome/user


end
