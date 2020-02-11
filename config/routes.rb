Rails.application.routes.draw do
  # static pages
  get 'static/index'
  root "static#index" 
  get 'team', to: 'static#team'
  get 'contact', to: 'static#contact'
  get 'authors', to: 'user#authors_list'

  # dynamic pages
  get 'welcome/:first_name', to: 'user#welcome'
  post '/', to: 'user#welcome_post'
  post 'welcome/:first_name', to: 'user#welcome_post'
  get 'gossip/listing'
  get 'gossip/:id', to: 'gossip#show_gossip', as: 'gossip/'
  get 'user/:id', to: 'user#show_user', as: 'user/'
  # get 'user/welcome' # redirect to welcome/user


end
