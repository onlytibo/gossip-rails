Rails.application.routes.draw do
  # index page
  get 'static/index'

  root "static#index"
  post '/', to: 'user#welcome_post' 

  get 'team', to: 'static#team'
  # user page

  get 'contact', to: 'static#contact'

  get 'welcome/:first_name', to: 'user#welcome'
  # get 'user/welcome' # redirect to welcome/user


end
